@implementation CKDApplyZoneAttributeChangesOperation

- (CKDApplyZoneAttributeChangesOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  CKDApplyZoneAttributeChangesOperation *v9;
  uint64_t v10;
  CKRecordZone *zone;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CKDApplyZoneAttributeChangesOperation;
  v9 = -[CKDDatabaseOperation initWithOperationInfo:container:](&v13, sel_initWithOperationInfo_container_, v6, a4);
  if (v9)
  {
    objc_msgSend_zone(v6, v7, v8);
    v10 = objc_claimAutoreleasedReturnValue();
    zone = v9->_zone;
    v9->_zone = (CKRecordZone *)v10;

    v9->_pcsKeysRemoved = 0;
  }

  return v9;
}

- (BOOL)makeStateTransition
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;

  switch(objc_msgSend_state(self, a2, v2))
  {
    case 1:
      objc_msgSend_zone(self, v4, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_protectionData(v6, v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend_length(v9, v10, v11);

      if (!v12)
        goto LABEL_7;
      objc_msgSend_setState_(self, v4, 2);
      objc_msgSend_decryptPCSs(self, v13, v14);
      break;
    case 2:
      objc_msgSend_setState_(self, v4, 3);
      objc_msgSend_removePCSKeys(self, v15, v16);
      break;
    case 3:
      if (!objc_msgSend_pcsKeysRemoved(self, v4, v5))
        goto LABEL_7;
      objc_msgSend_setState_(self, v4, 4);
      objc_msgSend_savePCSChanges(self, v17, v18);
      break;
    case 4:
      objc_msgSend_setState_(self, v4, 5);
      objc_msgSend_updatePCSCache(self, v23, v24);
      break;
    case 5:
LABEL_7:
      objc_msgSend_setState_(self, v4, 0xFFFFFFFFLL);
      objc_msgSend_error(self, v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_finishWithError_(self, v22, (uint64_t)v21);

      break;
    default:
      return 1;
  }
  return 1;
}

- (void)decryptPCSs
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  int v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t hasZoneProtectionDataEntitlement;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  NSObject *v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  _QWORD v77[5];
  id v78;
  _BYTE location[12];
  __int16 v80;
  void *v81;
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  objc_msgSend_container(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_options(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_bypassPCSEncryption(v7, v8, v9);

  if (v10)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v13 = (void *)*MEMORY[0x1E0C952D8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952D8], OS_LOG_TYPE_ERROR))
    {
      v67 = v13;
      objc_msgSend_container(self, v68, v69);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_containerID(v70, v71, v72);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_zone(self, v74, v75);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138412546;
      *(_QWORD *)&location[4] = v73;
      v80 = 2112;
      v81 = v76;
      _os_log_error_impl(&dword_1BE990000, v67, OS_LOG_TYPE_ERROR, "Unexpected zone PCS data! Encryption should not be used in container %@. zone: %@", location, 0x16u);

    }
    objc_msgSend_errorWithDomain_code_error_format_(MEMORY[0x1E0C94FF8], v14, *MEMORY[0x1E0C94B20], 5004, 0, CFSTR("Encryption should not be used in this container."));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setError_(self, v16, (uint64_t)v15);
  }
  else
  {
    objc_msgSend_stateTransitionGroup(self, v11, v12);
    v17 = objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v17);

    objc_msgSend_container(self, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_entitlements(v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    hasZoneProtectionDataEntitlement = objc_msgSend_hasZoneProtectionDataEntitlement(v23, v24, v25);
    objc_msgSend_zone(self, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setSerializeProtectionData_(v29, v30, hasZoneProtectionDataEntitlement);

    objc_msgSend_noteOperationWillWaitOnPCS(self, v31, v32);
    objc_msgSend_zone(self, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zonePCSModificationDate(v35, v36, v37);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (*MEMORY[0x1E0C95280])
    {
      objc_msgSend_unitTestOverrides(self, v38, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v40, v41, (uint64_t)CFSTR("OverrideZonePCSModificationDate"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      if (v42)
      {
        objc_msgSend_unitTestOverrides(self, v43, v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v45, v46, (uint64_t)CFSTR("OverrideZonePCSModificationDate"));
        v47 = objc_claimAutoreleasedReturnValue();

        v15 = (void *)v47;
      }
    }
    objc_initWeak((id *)location, self);
    objc_msgSend_container(self, v48, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pcsManager(v50, v51, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zone(self, v54, v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_protectionData(v56, v57, v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_topmostParentOperation(self, v60, v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_operationID(v62, v63, v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v77[0] = MEMORY[0x1E0C809B0];
    v77[1] = 3221225472;
    v77[2] = sub_1BEC1A294;
    v77[3] = &unk_1E7834850;
    objc_copyWeak(&v78, (id *)location);
    v77[4] = self;
    objc_msgSend_createZonePCSFromData_usingServiceIdentityWithType_zonePCSModificationDate_requestorOperationID_completionHandler_(v53, v66, (uint64_t)v59, 0, v15, v65, v77);

    objc_destroyWeak(&v78);
    objc_destroyWeak((id *)location);
  }

}

- (void)removePCSKeys
{
  uint64_t v2;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  char isEmpty;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  char v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  void *v81;
  const char *v82;
  const char *v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  NSObject *v89;
  _QWORD v90[6];

  objc_msgSend_stateTransitionGroup(self, a2, v2);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v4);

  objc_msgSend_zone(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zonePCSKeysToRemove(v7, v8, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend_zone(self, v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zonePCSKeysToRemove(v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    isEmpty = objc_msgSend_isEmpty(v16, v17, v18);

    if ((isEmpty & 1) != 0)
    {
      v12 = 0;
      goto LABEL_6;
    }
    objc_msgSend_zone(self, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend_zonePCS(v22, v23, v24);

    objc_msgSend_container(self, v26, v27);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pcsManager(v7, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zone(self, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zonePCSKeysToRemove(v33, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zone(self, v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_protectionEtag(v39, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend_removePCSKeys_fromPCS_withProtectionEtag_forOperation_(v30, v43, (uint64_t)v36, v25, v42, self);

  }
LABEL_6:
  objc_msgSend_zone(self, v20, v21);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zoneishPCSKeysToRemove(v44, v45, v46);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (v49)
  {
    objc_msgSend_zone(self, v47, v48);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zoneishPCSKeysToRemove(v50, v51, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend_isEmpty(v53, v54, v55);

    if ((v56 & 1) != 0)
    {
      v49 = 0;
      goto LABEL_11;
    }
    objc_msgSend_zone(self, v57, v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend_zoneishPCS(v59, v60, v61);

    objc_msgSend_container(self, v63, v64);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pcsManager(v44, v65, v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zone(self, v68, v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zoneishPCSKeysToRemove(v70, v71, v72);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zone(self, v74, v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zoneishProtectionData(v76, v77, v78);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_etagFromPCSData_(CKDPCSManager, v80, (uint64_t)v79);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = (void *)objc_msgSend_removePCSKeys_fromPCS_withProtectionEtag_forOperation_(v67, v82, (uint64_t)v73, v62, v81, self);

  }
LABEL_11:
  objc_msgSend_setPcsKeysRemoved_(self, v57, (uint64_t)v12 + (_QWORD)v49);
  if (objc_msgSend_pcsKeysRemoved(self, v83, v84))
  {
    v90[0] = MEMORY[0x1E0C809B0];
    v90[1] = 3221225472;
    v90[2] = sub_1BEC1A8E8;
    v90[3] = &unk_1E7837D08;
    v90[4] = v12;
    v90[5] = v49;
    objc_msgSend_updateCloudKitMetrics_(self, v85, (uint64_t)v90);
    objc_msgSend_updatePCSCache(self, v87, v88);
  }
  objc_msgSend_stateTransitionGroup(self, v85, v86);
  v89 = objc_claimAutoreleasedReturnValue();
  dispatch_group_leave(v89);

}

- (void)savePCSChanges
{
  void *v3;
  const char *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  _QWORD v25[5];
  void *v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v3 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v18 = v3;
    objc_msgSend_zone(self, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zoneID(v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v28 = v24;
    _os_log_debug_impl(&dword_1BE990000, v18, OS_LOG_TYPE_DEBUG, "Saving PCS changes to the server for zone %@", buf, 0xCu);

  }
  objc_msgSend_stateTransitionGroup(self, v4, v5);
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v6);

  v7 = (void *)objc_opt_new();
  objc_msgSend_zone(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v10;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v11, (uint64_t)&v26, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRecordZonesToSave_(v7, v13, (uint64_t)v12);

  objc_msgSend_setAllowDefaultZoneSave_(v7, v14, 1);
  objc_msgSend_setMaxZoneSaveAttempts_(v7, v15, 1);
  v16 = objc_opt_class();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = sub_1BEC1AB28;
  v25[3] = &unk_1E782E508;
  v25[4] = self;
  objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(self, v17, v16, v7, v25);

}

- (void)updatePCSCache
{
  void *v3;
  const char *v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  NSObject *v35;
  NSObject *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  int v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v3 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v36 = v3;
    objc_msgSend_zone(self, v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_zoneID(v39, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = 138412290;
    v44 = v42;
    _os_log_debug_impl(&dword_1BE990000, v36, OS_LOG_TYPE_DEBUG, "Updating PCS cache for zone %@", (uint8_t *)&v43, 0xCu);

  }
  objc_msgSend_stateTransitionGroup(self, v4, v5);
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v6);

  objc_msgSend_zone(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dataWithZone_(CKDZonePCSData, v10, (uint64_t)v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_zone(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_zonePCS(v14, v15, v16);
  objc_msgSend_setPcs_(v11, v18, v17);

  objc_msgSend_zone(self, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend_zoneishPCS(v21, v22, v23);
  objc_msgSend_setZoneishPCS_(v11, v25, v24);

  objc_msgSend_zone(self, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_zoneID(v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPCSData_forFetchedZoneID_(self, v32, (uint64_t)v11, v31);

  objc_msgSend_stateTransitionGroup(self, v33, v34);
  v35 = objc_claimAutoreleasedReturnValue();
  dispatch_group_leave(v35);

}

- (void)main
{
  objc_msgSend_makeStateTransition_(self, a2, 0);
}

- (unint64_t)pcsKeysRemoved
{
  return self->_pcsKeysRemoved;
}

- (void)setPcsKeysRemoved:(unint64_t)a3
{
  self->_pcsKeysRemoved = a3;
}

- (CKRecordZone)zone
{
  return self->_zone;
}

- (void)setZone:(id)a3
{
  objc_storeStrong((id *)&self->_zone, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zone, 0);
}

@end
