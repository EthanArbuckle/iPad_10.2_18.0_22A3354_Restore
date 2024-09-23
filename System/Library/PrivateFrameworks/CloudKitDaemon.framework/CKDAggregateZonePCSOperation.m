@implementation CKDAggregateZonePCSOperation

- (CKDAggregateZonePCSOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  CKDAggregateZonePCSOperation *v9;
  uint64_t v10;
  NSArray *sourceZoneIDs;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  CKRecordZone *targetZone;
  uint64_t v16;
  NSMutableDictionary *zonePCSDataByZoneID;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  objc_super v24;

  v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CKDAggregateZonePCSOperation;
  v9 = -[CKDDatabaseOperation initWithOperationInfo:container:](&v24, sel_initWithOperationInfo_container_, v6, a4);
  if (v9)
  {
    objc_msgSend_sourceZoneIDs(v6, v7, v8);
    v10 = objc_claimAutoreleasedReturnValue();
    sourceZoneIDs = v9->_sourceZoneIDs;
    v9->_sourceZoneIDs = (NSArray *)v10;

    objc_msgSend_targetZone(v6, v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    targetZone = v9->_targetZone;
    v9->_targetZone = (CKRecordZone *)v14;

    v16 = objc_opt_new();
    zonePCSDataByZoneID = v9->_zonePCSDataByZoneID;
    v9->_zonePCSDataByZoneID = (NSMutableDictionary *)v16;

    objc_msgSend_sharedOptions(MEMORY[0x1E0C94C00], v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_maxZoneSaveAttempts = (int)objc_msgSend_PCSRetryCount(v20, v21, v22);

  }
  return v9;
}

- (id)activityCreate
{
  return _os_activity_create(&dword_1BE990000, "daemon/aggregate-zone-pcs", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (id)relevantZoneIDs
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  id v7;
  const char *v8;
  void *v9;
  const char *v10;
  const char *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend_count(self->_sourceZoneIDs, a2, v2);
  if (v4)
  {
    v6 = v4;
    v7 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v9 = (void *)objc_msgSend_initWithCapacity_(v7, v8, v6 + 1);
    objc_msgSend_addObject_(v9, v10, (uint64_t)self->_targetZone);
    objc_msgSend_addObjectsFromArray_(v9, v11, (uint64_t)self->_sourceZoneIDs);
    return v9;
  }
  else
  {
    v13[0] = self->_targetZone;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v5, (uint64_t)v13, 1);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (BOOL)makeStateTransition
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;

  switch(objc_msgSend_state(self, a2, v2))
  {
    case 1:
      goto LABEL_2;
    case 2:
      objc_msgSend_setState_(self, v4, 3);
      objc_msgSend__prepareTargetZonePCS(self, v8, v9);
      return 1;
    case 3:
      objc_msgSend_setState_(self, v4, 4);
      v12 = objc_msgSend_numZoneSaveAttempts(self, v10, v11);
      objc_msgSend_setNumZoneSaveAttempts_(self, v13, v12 + 1);
      return MEMORY[0x1E0DE7D20](self, sel__saveTargetZone, v30);
    case 4:
      objc_msgSend_setState_(self, v4, 5);
      objc_msgSend__synchronizeSigningIdentitiesIfNeeded(self, v14, v15);
      return 1;
    case 5:
      objc_msgSend_setState_(self, v4, 6);
      objc_msgSend__sychronizeUserKeyRegistryIfNeeded(self, v16, v17);
      return 1;
    case 6:
      v18 = objc_msgSend_numZoneSaveAttempts(self, v4, v5);
      if (v18 < objc_msgSend_maxZoneSaveAttempts(self, v19, v20)
        && objc_msgSend_isHandlingRetryableError(self, v4, v21)
        && (objc_msgSend_zoneWaitingOnKeyRegistrySync(self, v4, v21),
            v22 = (void *)objc_claimAutoreleasedReturnValue(),
            v22,
            !v22))
      {
LABEL_2:
        objc_msgSend_setState_(self, v4, 2);
        objc_msgSend__fetchZonePCS(self, v6, v7);
      }
      else
      {
        if (objc_msgSend_isHandlingRetryableError(self, v4, v21))
          objc_msgSend__setPermanentFailure(self, v23, v24);
        objc_msgSend__sendCoreAnalyticsEventForKeySync(self, v23, v24);
        objc_msgSend_setState_(self, v25, 0xFFFFFFFFLL);
        objc_msgSend_error(self, v26, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_finishWithError_(self, v29, (uint64_t)v28);

      }
      return 1;
    default:
      return 1;
  }
}

+ (id)nameForState:(unint64_t)a3
{
  objc_super v4;

  if (a3 - 2 < 5)
    return off_1E7836350[a3 - 2];
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___CKDAggregateZonePCSOperation;
  objc_msgSendSuper2(&v4, sel_nameForState_);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)main
{
  objc_msgSend_makeStateTransition_(self, a2, 0);
}

- (void)_fetchZonePCS
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  id v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  objc_msgSend_sourceZoneIDs(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_count(v4, v5, v6);

  if (v7)
  {
    objc_msgSend_sourceZoneIDs(self, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_targetZone(self, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zoneID(v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_arrayByAddingObject_(v10, v17, (uint64_t)v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v19 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      v20 = v19;
      *(_DWORD *)buf = 134217984;
      v36 = objc_msgSend_count(v18, v21, v22);
      _os_log_impl(&dword_1BE990000, v20, OS_LOG_TYPE_INFO, "Fetching PCS data for %ld zones", buf, 0xCu);

    }
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v23 = v18;
    v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v30, v34, 16);
    if (v25)
    {
      v27 = v25;
      v28 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v31 != v28)
            objc_enumerationMutation(v23);
          objc_msgSend__fetchPCSDataForZoneID_(self, v26, *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i), (_QWORD)v30);
        }
        v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v26, (uint64_t)&v30, v34, 16);
      }
      while (v27);
    }

  }
}

- (void)_fetchPCSDataForZoneID:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  id v14;
  const char *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id location;

  v4 = a3;
  objc_msgSend_stateTransitionGroup(self, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v7);

  objc_initWeak(&location, self);
  objc_msgSend_container(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pcsCache(v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1BEBB0D54;
  v16[3] = &unk_1E7836308;
  objc_copyWeak(&v18, &location);
  v16[4] = self;
  v14 = v4;
  v17 = v14;
  objc_msgSend_fetchPCSForZoneWithID_forOperation_options_withCompletionHandler_(v13, v15, (uint64_t)v14, self, 0, v16);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

- (void)_prepareTargetZonePCS
{
  uint64_t v2;
  CKDAggregateZonePCSOperation *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  const void *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  int isEqualToString;
  const char *v62;
  const char *v63;
  void *v64;
  NSObject *v65;
  const char *v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  id obj;
  CKDAggregateZonePCSOperation *v80;
  uint64_t v81;
  uint64_t v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  CFTypeRef cf;
  uint8_t buf[4];
  void *v93;
  _BYTE v94[128];
  _BYTE v95[128];
  uint64_t v96;

  v3 = self;
  v96 = *MEMORY[0x1E0C80C00];
  cf = 0;
  objc_msgSend_zonePCSDataByZoneID(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_targetZone(v3, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zoneID(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v4, v11, (uint64_t)v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v78 = v12;
  objc_msgSend_pcs(v12, v13, v14);
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  objc_msgSend_sourceZoneIDs(v3, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v87, v95, 16);
  if (!v19)
  {
LABEL_24:

    v64 = 0;
    goto LABEL_31;
  }
  v22 = *(_QWORD *)v88;
  v72 = *MEMORY[0x1E0C94B20];
  v80 = v3;
  v74 = v17;
  v70 = *(_QWORD *)v88;
LABEL_3:
  v23 = 0;
  v71 = v19;
LABEL_4:
  if (*(_QWORD *)v88 != v22)
    objc_enumerationMutation(v17);
  v73 = v23;
  v24 = *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * v23);
  objc_msgSend_zonePCSDataByZoneID(v3, v20, v21);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = v24;
  objc_msgSend_objectForKeyedSubscript_(v25, v26, v24);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v82 = objc_msgSend_pcs(v27, v28, v29);
  v30 = (void *)PCSFPCopyKeyIDs();
  v76 = v30;
  if (objc_msgSend_count(v30, v31, v32))
  {
    v77 = v27;
    v85 = 0u;
    v86 = 0u;
    v83 = 0u;
    v84 = 0u;
    obj = v30;
    v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v34, (uint64_t)&v83, v94, 16);
    if (!v35)
      goto LABEL_22;
    v36 = v35;
    v81 = *(_QWORD *)v84;
LABEL_9:
    v37 = 0;
    while (1)
    {
      if (*(_QWORD *)v84 != v81)
        objc_enumerationMutation(obj);
      v38 = *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * v37);
      v40 = (const void *)PCSFPCopyPrivateKey();
      if (!v40)
        break;
      if ((PCSFPAddPrivateKey() & 1) == 0)
      {
        objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v41, v72, 5005, CFSTR("Failed to add identity to the target zone PCS from zone %@"), v75);
        goto LABEL_27;
      }
      objc_msgSend_container(v3, v41, v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_deviceContext(v43, v44, v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_testDeviceReference(v46, v47, v48);
      v49 = objc_claimAutoreleasedReturnValue();
      if (v49)
      {
        v52 = (void *)v49;
        objc_msgSend_targetZone(v3, v50, v51);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_zoneID(v53, v54, v55);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_zoneName(v56, v57, v58);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToString = objc_msgSend_isEqualToString_(v59, v60, (uint64_t)CFSTR("PCS_PREPARE_FAILURE"));

        if (isEqualToString)
        {
          objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v62, v72, 5005, CFSTR("Failed to add identity to the target zone PCS from zone %@"), v75);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v3 = v80;
LABEL_28:

          v17 = v74;
          v27 = v77;
          goto LABEL_29;
        }
      }
      else
      {

      }
      CFRelease(v40);
      if (cf)
      {
        CFRelease(cf);
        cf = 0;
      }
      ++v37;
      v3 = v80;
      if (v36 == v37)
      {
        v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v63, (uint64_t)&v83, v94, 16);
        if (v36)
          goto LABEL_9;
LABEL_22:

        v17 = v74;
        v23 = v73 + 1;
        v22 = v70;
        if (v73 + 1 == v71)
        {
          v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v74, v20, (uint64_t)&v87, v95, 16);
          if (!v19)
            goto LABEL_24;
          goto LABEL_3;
        }
        goto LABEL_4;
      }
    }
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v39, v72, 5005, CFSTR("Couldn't get PCS identity with key ID %@ from zone %@"), v38, v75);
LABEL_27:
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_28;
  }
  objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v33, v72, 5005, CFSTR("Couldn't get key IDs from zone PCS %@ for zone %@"), v82, v75);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0;
LABEL_29:

  if (v40)
    CFRelease(v40);
LABEL_31:
  if (cf)
  {
    CFRelease(cf);
    cf = 0;
  }
  if (v64)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v65 = *MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v93 = v64;
      _os_log_impl(&dword_1BE990000, v65, OS_LOG_TYPE_INFO, "Warn: Error preparing target zone PCS: %@", buf, 0xCu);
    }
    objc_msgSend_error(v3, v66, v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v68)
      objc_msgSend_setError_(v3, v69, (uint64_t)v64);
  }

}

- (BOOL)_saveTargetZone
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  void *v23;
  id v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  _BOOL4 v28;
  const char *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  const char *v46;
  uint64_t v47;
  NSObject *v48;
  CKDModifyRecordZonesURLRequest *v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  void *v54;
  const char *v55;
  void *v56;
  uint64_t v57;
  const char *v58;
  const char *v59;
  const char *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v66;
  uint64_t v67;
  void (*v68)(uint64_t);
  void *v69;
  id v70;
  id v71;
  _QWORD v72[4];
  id v73;
  id from;
  id location;
  id v76;
  _QWORD v77[2];

  v77[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend_zonePCSDataByZoneID(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_targetZone(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zoneID(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v4, v11, (uint64_t)v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_container(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_pcsManager(v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend_pcs(v12, v19, v20);
  v76 = 0;
  objc_msgSend_dataFromZonePCS_error_(v18, v22, v21, &v76);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v76;

  if (v24)
  {
    objc_msgSend_error(self, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27 == 0;

    if (v28)
      objc_msgSend_setError_(self, v29, (uint64_t)v24);
  }
  else
  {
    objc_msgSend_etagFromPCSData_(CKDPCSManager, v25, (uint64_t)v23);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_targetZone(self, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setProtectionData_(v33, v34, (uint64_t)v23);

    objc_msgSend_targetZone(self, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setProtectionEtag_(v37, v38, (uint64_t)v30);

    objc_msgSend_etag(v12, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_targetZone(self, v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPreviousProtectionEtag_(v44, v45, (uint64_t)v41);

    objc_msgSend_stateTransitionGroup(self, v46, v47);
    v48 = objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v48);

    v49 = [CKDModifyRecordZonesURLRequest alloc];
    objc_msgSend_targetZone(self, v50, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v77[0] = v52;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v53, (uint64_t)v77, 1);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = (void *)objc_msgSend_initWithOperation_recordZonesToSave_recordZoneIDsToDelete_(v49, v55, (uint64_t)self, v54, 0);

    objc_initWeak(&location, self);
    objc_initWeak(&from, v56);
    v57 = MEMORY[0x1E0C809B0];
    v72[0] = MEMORY[0x1E0C809B0];
    v72[1] = 3221225472;
    v72[2] = sub_1BEBB198C;
    v72[3] = &unk_1E7832998;
    objc_copyWeak(&v73, &location);
    objc_msgSend_setRecordZoneModifiedBlock_(v56, v58, (uint64_t)v72);
    v66 = v57;
    v67 = 3221225472;
    v68 = sub_1BEBB19F0;
    v69 = &unk_1E782E468;
    objc_copyWeak(&v70, &location);
    objc_copyWeak(&v71, &from);
    objc_msgSend_setCompletionBlock_(v56, v59, (uint64_t)&v66);
    objc_msgSend_setRequest_(self, v60, (uint64_t)v56, v66, v67, v68, v69);
    objc_msgSend_container(self, v61, v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_performRequest_(v63, v64, (uint64_t)v56);

    objc_destroyWeak(&v71);
    objc_destroyWeak(&v70);
    objc_destroyWeak(&v73);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);

  }
  return v24 == 0;
}

- (int)operationType
{
  return 200;
}

- (void)_synchronizeSigningIdentitiesIfNeeded
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  id v22;
  const char *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_needsSynchronizeSigningIdentities(self, a2, v2)
    && (objc_msgSend_didSynchronizeSigningIdentities(self, v4, v5) & 1) == 0)
  {
    objc_msgSend_topmostParentOperation(self, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_operationID(v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v12 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v28 = v11;
      _os_log_impl(&dword_1BE990000, v12, OS_LOG_TYPE_INFO, "Will attempt user key sync to update signing identities for operation %{public}@.", buf, 0xCu);
    }
    objc_msgSend_stateTransitionGroup(self, v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v15);

    objc_initWeak((id *)buf, self);
    objc_msgSend_container(self, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pcsManager(v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = sub_1BEBB1E5C;
    v24[3] = &unk_1E7832920;
    objc_copyWeak(&v26, (id *)buf);
    v22 = v11;
    v25 = v22;
    objc_msgSend_synchronizeUserKeyRegistryForSigningIdentitiesForRequestorOperationID_completionHandler_(v21, v23, (uint64_t)v22, v24);

    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)buf);

  }
}

- (void)_sychronizeUserKeyRegistryIfNeeded
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  id v21;
  const char *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend_zoneWaitingOnKeyRegistrySync(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend_topmostParentOperation(self, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_operationID(v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v11 = *MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v27 = v10;
      _os_log_impl(&dword_1BE990000, v11, OS_LOG_TYPE_INFO, "Will attempt user key sync for operation %{public}@.", buf, 0xCu);
    }
    objc_msgSend_stateTransitionGroup(self, v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v14);

    objc_initWeak((id *)buf, self);
    objc_msgSend_container(self, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pcsManager(v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = sub_1BEBB2228;
    v23[3] = &unk_1E7832948;
    objc_copyWeak(&v25, (id *)buf);
    v21 = v10;
    v24 = v21;
    objc_msgSend_synchronizeUserKeyRegistryForServiceType_shouldThrottle_context_requestorOperationID_completionHandler_(v20, v22, 0, 1, 0x1E784B808, v21, v23);

    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)buf);

  }
}

- (void)_sendCoreAnalyticsEventForKeySync
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  id v33;

  objc_msgSend_keySyncAnalytics(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend_error(self, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend_keySyncAnalytics(self, v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setOverallResult_(v10, v11, (uint64_t)CFSTR("failure"));

      objc_msgSend_keySyncAnalytics(self, v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_error(v14, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
LABEL_8:
        objc_msgSend_container(self, v18, v19);
        v33 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend_pcsManager(v33, v26, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_keySyncAnalytics(self, v29, v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_sendCoreAnalyticsEventForKeySync_(v28, v32, (uint64_t)v31);

        return;
      }
      objc_msgSend_error(self, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_keySyncAnalytics(self, v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setError_(v23, v24, (uint64_t)v20);

    }
    else
    {
      objc_msgSend_keySyncAnalytics(self, v8, v9);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setOverallResult_(v20, v25, (uint64_t)CFSTR("success"));
    }

    goto LABEL_8;
  }
}

- (void)_handleZoneSavedWithID:(id)a3 responseCode:(id)a4
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  char isEqual;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  int v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  NSObject *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  NSObject *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  NSObject *v53;
  const char *v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  const char *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  NSObject *v71;
  const char *v72;
  uint64_t v73;
  int v74;
  const char *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  void *v94;
  _BOOL4 v95;
  const char *v96;
  void *v97;
  const char *v98;
  NSObject *v99;
  const char *v100;
  uint64_t v101;
  void *v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  void *v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  void *v110;
  const char *v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  void *v116;
  const char *v117;
  void *v118;
  const char *v119;
  const char *v120;
  uint64_t v121;
  void *v122;
  const char *v123;
  const char *v124;
  uint64_t v125;
  void *v126;
  const char *v127;
  const char *v128;
  uint64_t v129;
  void *v130;
  const char *v131;
  const char *v132;
  void *v133;
  const char *v134;
  _QWORD v135[4];
  id v136;
  id v137;
  uint8_t buf[4];
  _BYTE v139[18];
  uint64_t v140;

  v140 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend_targetZone(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zoneID(v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  isEqual = objc_msgSend_isEqual_(v7, v15, (uint64_t)v14);

  if ((isEqual & 1) == 0)
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v17, v18);
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v133, v134, (uint64_t)a2, self, CFSTR("CKDAggregateZonePCSOperation.m"), 398, CFSTR("Only the target zone must be saved"));

  }
  objc_msgSend_setIsHandlingRetryableError_(self, v17, 0);
  v21 = sub_1BEB10D5C(v8);
  if (*MEMORY[0x1E0C95280])
  {
    if (objc_msgSend_checkAndClearUnitTestOverrides_(self, v19, (uint64_t)CFSTR("SwizzleZoneSaveResponseToErrorZonePCSIdentityUnknown")))
    {
      objc_msgSend_setCode_(v8, v22, 3);
      v21 = 2053;
    }
    if (objc_msgSend_checkAndClearUnitTestOverrides_(self, v22, (uint64_t)CFSTR("CKUnderlyingErrorPCSOplockFailed")))
    {
      objc_msgSend_setCode_(v8, v19, 3);
      v21 = 2037;
    }
  }
  v23 = objc_msgSend_code(v8, v19, v20);
  if (v7 && v23 == 1)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v26 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
    {
      v29 = v26;
      objc_msgSend_targetZone(self, v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v139 = v32;
      _os_log_impl(&dword_1BE990000, v29, OS_LOG_TYPE_INFO, "Target zone %@ was successfully saved to the server", buf, 0xCu);

    }
    objc_msgSend_targetZone(self, v27, v28);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_protectionData(v33, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      objc_msgSend_stateTransitionGroup(self, v37, v38);
      v39 = objc_claimAutoreleasedReturnValue();
      dispatch_group_enter(v39);

      objc_initWeak((id *)buf, self);
      objc_msgSend_container(self, v40, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_pcsManager(v42, v43, v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_targetZone(self, v46, v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_protectionData(v48, v49, v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v135[0] = MEMORY[0x1E0C809B0];
      v135[1] = 3221225472;
      v135[2] = sub_1BEBB2D2C;
      v135[3] = &unk_1E7836330;
      objc_copyWeak(&v137, (id *)buf);
      v136 = v7;
      objc_msgSend_createSharePCSFromData_ofType_withService_completionHandler_(v45, v52, (uint64_t)v51, 3, 0, v135);

      objc_destroyWeak(&v137);
      objc_destroyWeak((id *)buf);
    }
    goto LABEL_37;
  }
  switch(v21)
  {
    case 2036:
      objc_msgSend_container(self, v24, v25);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordCache(v55, v56, v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_clearAllRecordsForZoneWithID_(v58, v59, (uint64_t)v7);

      objc_msgSend_setPCSData_forFetchedZoneID_(self, v60, 0, v7);
      objc_msgSend_container(self, v61, v62);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_pcsCache(v63, v64, v65);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_removePCSDataForItemsInZoneWithID_(v66, v67, (uint64_t)v7);

      break;
    case 2053:
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v97 = (void *)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
      {
        v99 = v97;
        objc_msgSend_operationID(self, v100, v101);
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)v139 = v7;
        *(_WORD *)&v139[8] = 2114;
        *(_QWORD *)&v139[10] = v102;
        _os_log_impl(&dword_1BE990000, v99, OS_LOG_TYPE_INFO, "Zone PCS for %@ failed server validation. Will attempt user key sync for operation %{public}@ before trying again.", buf, 0x16u);

      }
      objc_msgSend_setZoneWaitingOnKeyRegistrySync_(self, v98, (uint64_t)v7);
      goto LABEL_36;
    case 2037:
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v53 = *MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v139 = v7;
        _os_log_impl(&dword_1BE990000, v53, OS_LOG_TYPE_INFO, "Received a PCS oplock failure for save of zone %@. Re-fetching the zone PCS and trying again", buf, 0xCu);
      }
LABEL_36:
      objc_msgSend_setIsHandlingRetryableError_(self, v54, 1);
      v103 = (void *)MEMORY[0x1E0C94FF8];
      objc_msgSend_request(self, v104, v105);
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1BEB10290(v106, v8);
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_targetZone(self, v108, v109);
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_error(v8, v111, v112);
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorDescription(v113, v114, v115);
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorWithDomain_code_userInfo_format_(v103, v117, *MEMORY[0x1E0C94B20], v21, v107, CFSTR("Error saving record zone %@ to server: %@"), v110, v116);
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setCurrentError_(self, v119, (uint64_t)v118);

      objc_msgSend_targetZone(self, v120, v121);
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setProtectionData_(v122, v123, 0);

      objc_msgSend_targetZone(self, v124, v125);
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setProtectionEtag_(v126, v127, 0);

      objc_msgSend_targetZone(self, v128, v129);
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setPreviousProtectionEtag_(v130, v131, 0);

      objc_msgSend_setPCSData_forFetchedZoneID_(self, v132, 0, v7);
LABEL_37:
      v91 = 0;
      goto LABEL_38;
  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v68 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_INFO))
  {
    v71 = v68;
    v74 = objc_msgSend_code(v8, v72, v73);
    objc_msgSend_targetZone(self, v75, v76);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v139 = v74;
    *(_WORD *)&v139[4] = 2112;
    *(_QWORD *)&v139[6] = v77;
    _os_log_impl(&dword_1BE990000, v71, OS_LOG_TYPE_INFO, "Error %d when saving record zone %@ to the server", buf, 0x12u);

  }
  v78 = (void *)MEMORY[0x1E0C94FF8];
  objc_msgSend_request(self, v69, v70);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1BEB10290(v79, v8);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_targetZone(self, v81, v82);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_error(v8, v84, v85);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorDescription(v86, v87, v88);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorWithDomain_code_userInfo_format_(v78, v90, *MEMORY[0x1E0C94B20], v21, v80, CFSTR("Error saving record zone %@ to server: %@"), v83, v89);
  v91 = (void *)objc_claimAutoreleasedReturnValue();

  if (v91)
  {
    objc_msgSend_error(self, v92, v93);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = v94 == 0;

    if (v95)
      objc_msgSend_setError_(self, v96, (uint64_t)v91);
  }
LABEL_38:

}

- (void)_setPermanentFailure
{
  uint64_t v2;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  const char *v25;
  NSObject *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  int v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend_keySyncAnalytics(self, a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v7 = (void *)v4;
    objc_msgSend_keySyncAnalytics(self, v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_error(v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {

LABEL_10:
      goto LABEL_11;
    }
    v14 = objc_msgSend_numZoneSaveAttempts(self, v12, v13);

    if (v14 >= 2)
    {
      objc_msgSend_container(self, v5, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_processName(v7, v15, v16);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_containerID(v7, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_containerIdentifier(v19, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v23 = (void *)*MEMORY[0x1E0C952B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_FAULT))
      {
        v26 = v23;
        objc_msgSend_operationID(self, v27, v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 138543874;
        v31 = v29;
        v32 = 2114;
        v33 = v8;
        v34 = 2114;
        v35 = v22;
        _os_log_fault_impl(&dword_1BE990000, v26, OS_LOG_TYPE_FAULT, "Failed to save target zone for operation %{public}@ despite user key sync. procName=%{public}@, containerID=%{public}@", (uint8_t *)&v30, 0x20u);

      }
      goto LABEL_10;
    }
  }
LABEL_11:
  objc_msgSend_currentError(self, v5, v6);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setError_(self, v25, (uint64_t)v24);

}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  objc_super v14;
  _QWORD v15[4];
  id v16;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend_sourceZoneIDs(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v5, v9, (uint64_t)v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend_count(v10, v11, v12))
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = sub_1BEBB31B8;
    v15[3] = &unk_1E78305B0;
    v16 = v10;
    objc_msgSend_updateCloudKitMetrics_(self, v13, (uint64_t)v15);

  }
  v14.receiver = self;
  v14.super_class = (Class)CKDAggregateZonePCSOperation;
  -[CKDOperation _finishOnCallbackQueueWithError:](&v14, sel__finishOnCallbackQueueWithError_, v4);

}

- (NSArray)sourceZoneIDs
{
  return self->_sourceZoneIDs;
}

- (void)setSourceZoneIDs:(id)a3
{
  objc_storeStrong((id *)&self->_sourceZoneIDs, a3);
}

- (CKRecordZone)targetZone
{
  return self->_targetZone;
}

- (void)setTargetZone:(id)a3
{
  objc_storeStrong((id *)&self->_targetZone, a3);
}

- (NSMutableDictionary)zonePCSDataByZoneID
{
  return self->_zonePCSDataByZoneID;
}

- (void)setZonePCSDataByZoneID:(id)a3
{
  objc_storeStrong((id *)&self->_zonePCSDataByZoneID, a3);
}

- (BOOL)isHandlingRetryableError
{
  return self->_isHandlingRetryableError;
}

- (void)setIsHandlingRetryableError:(BOOL)a3
{
  self->_isHandlingRetryableError = a3;
}

- (NSError)currentError
{
  return (NSError *)objc_getProperty(self, a2, 488, 1);
}

- (void)setCurrentError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 488);
}

- (int64_t)numZoneSaveAttempts
{
  return self->_numZoneSaveAttempts;
}

- (void)setNumZoneSaveAttempts:(int64_t)a3
{
  self->_numZoneSaveAttempts = a3;
}

- (int64_t)maxZoneSaveAttempts
{
  return self->_maxZoneSaveAttempts;
}

- (void)setMaxZoneSaveAttempts:(int64_t)a3
{
  self->_maxZoneSaveAttempts = a3;
}

- (CKRecordZoneID)zoneWaitingOnKeyRegistrySync
{
  return self->_zoneWaitingOnKeyRegistrySync;
}

- (void)setZoneWaitingOnKeyRegistrySync:(id)a3
{
  objc_storeStrong((id *)&self->_zoneWaitingOnKeyRegistrySync, a3);
}

- (CKDPCSKeySyncCoreAnalytics)keySyncAnalytics
{
  return self->_keySyncAnalytics;
}

- (void)setKeySyncAnalytics:(id)a3
{
  objc_storeStrong((id *)&self->_keySyncAnalytics, a3);
}

- (BOOL)needsSynchronizeSigningIdentities
{
  return self->_needsSynchronizeSigningIdentities;
}

- (void)setNeedsSynchronizeSigningIdentities:(BOOL)a3
{
  self->_needsSynchronizeSigningIdentities = a3;
}

- (BOOL)didSynchronizeSigningIdentities
{
  return self->_didSynchronizeSigningIdentities;
}

- (void)setDidSynchronizeSigningIdentities:(BOOL)a3
{
  self->_didSynchronizeSigningIdentities = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keySyncAnalytics, 0);
  objc_storeStrong((id *)&self->_zoneWaitingOnKeyRegistrySync, 0);
  objc_storeStrong((id *)&self->_currentError, 0);
  objc_storeStrong((id *)&self->_zonePCSDataByZoneID, 0);
  objc_storeStrong((id *)&self->_targetZone, 0);
  objc_storeStrong((id *)&self->_sourceZoneIDs, 0);
}

@end
