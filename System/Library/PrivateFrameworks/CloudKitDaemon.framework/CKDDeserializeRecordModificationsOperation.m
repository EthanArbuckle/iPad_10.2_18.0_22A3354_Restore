@implementation CKDDeserializeRecordModificationsOperation

- (CKDDeserializeRecordModificationsOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  CKDDeserializeRecordModificationsOperation *v9;
  uint64_t v10;
  NSData *serializedModifications;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CKDDeserializeRecordModificationsOperation;
  v9 = -[CKDDatabaseOperation initWithOperationInfo:container:](&v13, sel_initWithOperationInfo_container_, v6, a4);
  if (v9)
  {
    objc_msgSend_serializedModifications(v6, v7, v8);
    v10 = objc_claimAutoreleasedReturnValue();
    serializedModifications = v9->_serializedModifications;
    v9->_serializedModifications = (NSData *)v10;

  }
  return v9;
}

- (id)activityCreate
{
  return _os_activity_create(&dword_1BE990000, "daemon/deserialize-record-modifications", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (BOOL)makeStateTransition
{
  uint64_t v2;
  const char *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;

  switch(objc_msgSend_state(self, a2, v2))
  {
    case 1:
      objc_msgSend_setState_(self, v4, 2);
      objc_msgSend__setupTranslator(self, v5, v6);
      break;
    case 2:
      objc_msgSend_setState_(self, v4, 3);
      objc_msgSend__deserialize(self, v7, v8);
      break;
    case 3:
      objc_msgSend_setState_(self, v4, 4);
      objc_msgSend__postflightRecords(self, v9, v10);
      break;
    case 4:
      objc_msgSend_setState_(self, v4, 0xFFFFFFFFLL);
      objc_msgSend_error(self, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_finishWithError_(self, v14, (uint64_t)v13);

      break;
    default:
      return 1;
  }
  return 1;
}

+ (id)nameForState:(unint64_t)a3
{
  objc_super v4;

  if (a3 - 2 < 3)
    return off_1E7830290[a3 - 2];
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___CKDDeserializeRecordModificationsOperation;
  objc_msgSendSuper2(&v4, sel_nameForState_);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)main
{
  objc_msgSend_makeStateTransition_(self, a2, 0);
}

- (BOOL)validateAgainstLiveContainer:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  char hasAllowRealTimeOperationsEntitlement;
  void *v13;
  void *v14;
  uint64_t v15;
  objc_class *v16;
  void *v17;
  const char *v18;
  NSObject *v20;
  objc_class *v21;
  void *v22;
  objc_super v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CKDDeserializeRecordModificationsOperation;
  if (!-[CKDOperation validateAgainstLiveContainer:error:](&v23, sel_validateAgainstLiveContainer_error_, v6, a4))
    goto LABEL_9;
  objc_msgSend_entitlements(v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  hasAllowRealTimeOperationsEntitlement = objc_msgSend_hasAllowRealTimeOperationsEntitlement(v9, v10, v11);

  if ((hasAllowRealTimeOperationsEntitlement & 1) == 0)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v13 = (void *)*MEMORY[0x1E0C952B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
    {
      v20 = v13;
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v22;
      _os_log_error_impl(&dword_1BE990000, v20, OS_LOG_TYPE_ERROR, "Operation %{public}@ is not allowed to run without an entitlement", buf, 0xCu);

      if (!a4)
        goto LABEL_10;
    }
    else if (!a4)
    {
      goto LABEL_10;
    }
    v14 = (void *)MEMORY[0x1E0C94FF8];
    v15 = *MEMORY[0x1E0C947D8];
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_errorWithDomain_code_format_(v14, v18, v15, 8, CFSTR("Operation %@ is not allowed to run without an entitlement"), v17);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_9:
    LOBYTE(a4) = 0;
    goto LABEL_10;
  }
  LOBYTE(a4) = 1;
LABEL_10:

  return (char)a4;
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void (**v13)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  objc_super v19;

  v4 = a3;
  objc_msgSend_deserializeCompletionBlock(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend_deserializeCompletionBlock(self, v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v13 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v10;
    if (v4)
    {
      (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v10 + 16))(v10, 0, 0, v4);
    }
    else
    {
      objc_msgSend_recordsToSave(self, v11, v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordIDsToDelete(self, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, void *, _QWORD))v13)[2](v13, v14, v17, 0);

    }
    objc_msgSend_setDeserializeCompletionBlock_(self, v18, 0);
  }
  v19.receiver = self;
  v19.super_class = (Class)CKDDeserializeRecordModificationsOperation;
  -[CKDOperation _finishOnCallbackQueueWithError:](&v19, sel__finishOnCallbackQueueWithError_, v4);

}

- (void)_setupTranslator
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  const char *v12;
  _QWORD v13[5];
  id v14;
  uint64_t v15;

  objc_msgSend_container(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_databaseScope(self, v5, v6);
  objc_msgSend_stateTransitionGroup(self, v8, v9);
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v10);

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1BEA3839C;
  v13[3] = &unk_1E7830248;
  v13[4] = self;
  v14 = v4;
  v15 = v7;
  v11 = v4;
  objc_msgSend_fetchImportantUserIDsForOperation_withCompletionHandler_(v11, v12, (uint64_t)self, v13);

}

- (void)_deserialize
{
  CKDPRealTimeMessage *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  void *v9;
  NSObject **v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  void *v32;
  id v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  dispatch_once_t *v39;
  os_log_t *v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  __int128 v47;
  uint64_t v48;
  void *v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  void *v55;
  id v56;
  const char *v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  int hasData;
  const char *v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  NSObject *v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  int hasEncryptedData;
  const char *v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  void *v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  uint64_t isEncrypted;
  const char *v106;
  void *v107;
  id v108;
  const char *v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t j;
  uint64_t v119;
  void *v120;
  const char *v121;
  void *v122;
  id v123;
  const char *v124;
  const char *v125;
  NSObject *v126;
  const char *v127;
  os_log_t v128;
  const char *v129;
  uint64_t v130;
  void *v131;
  const char *v132;
  uint64_t v133;
  void *v134;
  const char *v135;
  uint64_t v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t k;
  void *v142;
  void *v143;
  const char *v144;
  uint64_t v145;
  void *v146;
  const char *v147;
  void *v148;
  id v149;
  const char *v150;
  const char *v151;
  NSObject *v152;
  const char *v153;
  NSObject *v154;
  const char *v155;
  const char *v156;
  NSObject *v157;
  const char *v158;
  NSObject *v159;
  const char *v160;
  NSObject *v161;
  const char *v162;
  uint64_t v163;
  void *v164;
  const char *v165;
  uint64_t v166;
  NSObject *v167;
  const char *v168;
  NSObject *v169;
  const char *v170;
  uint64_t v171;
  void *v172;
  const char *v173;
  uint64_t v174;
  uint64_t v175;
  NSObject *v176;
  const char *v177;
  NSObject *v178;
  const char *v179;
  uint64_t v180;
  void *v181;
  const char *v182;
  uint64_t v183;
  uint64_t v184;
  __int128 v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  uint64_t v190;
  uint64_t v191;
  void *v192;
  uint64_t v193;
  void *v194;
  id obj;
  void *v196;
  id v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  id v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  id v207;
  id v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  id v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  _BYTE v218[128];
  uint8_t v219[128];
  uint8_t buf[4];
  uint64_t v221;
  __int16 v222;
  void *v223;
  _BYTE v224[128];
  _BYTE v225[128];
  uint64_t v226;

  v226 = *MEMORY[0x1E0C80C00];
  v3 = [CKDPRealTimeMessage alloc];
  objc_msgSend_serializedModifications(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend_initWithData_(v3, v7, (uint64_t)v6);

  v9 = (void *)*MEMORY[0x1E0C952F8];
  v10 = (NSObject **)MEMORY[0x1E0C952B0];
  if (!v8)
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], v9);
    v154 = *v10;
    if (os_log_type_enabled(v154, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1BE990000, v154, OS_LOG_TYPE_ERROR, "CKDDeserializeRecordModificationsOperation is unable to deserialize its messages", buf, 2u);
    }
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v155, *MEMORY[0x1E0C947D8], 1000, CFSTR("CKDDeserializeRecordModificationsOperation is unable to deserialize its messages"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setError_(self, v156, (uint64_t)v14);
    goto LABEL_96;
  }
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], v9);
  v11 = *v10;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v161 = v11;
    objc_msgSend_saveRecords(v8, v162, v163);
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134217984;
    v221 = objc_msgSend_count(v164, v165, v166);
    _os_log_debug_impl(&dword_1BE990000, v161, OS_LOG_TYPE_DEBUG, "Unpackaging SaveRecords of %lu records", buf, 0xCu);

  }
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v15, v16);
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  v214 = 0u;
  v215 = 0u;
  v216 = 0u;
  v217 = 0u;
  objc_msgSend_saveRecords(v8, v17, v18);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v19, (uint64_t)&v214, v225, 16);
  if (v20)
  {
    v23 = v20;
    v24 = *(_QWORD *)v215;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v215 != v24)
          objc_enumerationMutation(obj);
        v26 = *(void **)(*((_QWORD *)&v214 + 1) + 8 * i);
        objc_msgSend_translator(self, v21, v22);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_record(v26, v28, v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v213 = 0;
        objc_msgSend_recordFromPRecord_error_(v27, v31, (uint64_t)v30, &v213);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v213;

        if (v33)
        {
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v152 = *MEMORY[0x1E0C952B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v221 = (uint64_t)v33;
            _os_log_error_impl(&dword_1BE990000, v152, OS_LOG_TYPE_ERROR, "Error transforming record: %@", buf, 0xCu);
          }
          objc_msgSend_setError_(self, v153, (uint64_t)v33);

          goto LABEL_95;
        }
        objc_msgSend_addObject_(v14, v34, (uint64_t)v32);
        objc_msgSend_recordID(v32, v35, v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v196, v38, (uint64_t)v32, v37);

      }
      v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v21, (uint64_t)&v214, v225, 16);
    }
    while (v23);
  }

  v39 = (dispatch_once_t *)MEMORY[0x1E0C95300];
  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v40 = (os_log_t *)MEMORY[0x1E0C952B0];
  v41 = (void *)*MEMORY[0x1E0C952B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_DEBUG))
  {
    v169 = v41;
    objc_msgSend_associatedMergeableDeltas(v8, v170, v171);
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    v175 = objc_msgSend_count(v172, v173, v174);
    *(_DWORD *)buf = 134217984;
    v221 = v175;
    _os_log_debug_impl(&dword_1BE990000, v169, OS_LOG_TYPE_DEBUG, "Unpackaging AssociatedMergeableDeltas with %lu deltas", buf, 0xCu);

    v39 = (dispatch_once_t *)MEMORY[0x1E0C95300];
  }
  v211 = 0u;
  v212 = 0u;
  v209 = 0u;
  v210 = 0u;
  objc_msgSend_associatedMergeableDeltas(v8, v42, v43);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v189 = v14;
  v190 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v44, (uint64_t)&v209, v224, 16);
  if (!v190)
    goto LABEL_51;
  v191 = *(_QWORD *)v210;
  *(_QWORD *)&v47 = 138412546;
  v185 = v47;
  v186 = v8;
  while (2)
  {
    v48 = 0;
    do
    {
      if (*(_QWORD *)v210 != v191)
        objc_enumerationMutation(obj);
      v193 = v48;
      v49 = *(void **)(*((_QWORD *)&v209 + 1) + 8 * v48);
      objc_msgSend_translator(self, v45, v46, v185);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordIdentifier(v49, v51, v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v208 = 0;
      objc_msgSend_recordIDFromPRecordIdentifier_error_(v50, v54, (uint64_t)v53, &v208);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = v208;

      if (v56)
      {
        if (*v39 != -1)
          dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v167 = *v40;
        if (os_log_type_enabled(*v40, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v221 = (uint64_t)v56;
          _os_log_error_impl(&dword_1BE990000, v167, OS_LOG_TYPE_ERROR, "Error transforming CKRecordID, %@", buf, 0xCu);
        }
        objc_msgSend_setError_(self, v168, (uint64_t)v56);
        goto LABEL_94;
      }
      objc_msgSend_fieldIdentifier(v49, v57, v58);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_name(v59, v60, v61);
      v62 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_objectForKeyedSubscript_(v196, v63, (uint64_t)v55);
      v194 = (void *)objc_claimAutoreleasedReturnValue();
      if (v194)
      {
        v192 = v62;
        objc_msgSend_mergeableDeltas(v49, v64, v65);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_firstObject(v66, v67, v68);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        hasData = objc_msgSend_hasData(v69, v70, v71);

        if (hasData)
        {
          v62 = v192;
          objc_msgSend_objectForKeyedSubscript_(v194, v73, (uint64_t)v192);
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v77)
            goto LABEL_44;
        }
        else
        {
          objc_msgSend_mergeableDeltas(v49, v73, v74);
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_firstObject(v80, v81, v82);
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          hasEncryptedData = objc_msgSend_hasEncryptedData(v83, v84, v85);

          v62 = v192;
          if (!hasEncryptedData
            || (objc_msgSend_encryptedValues(v194, v87, v88),
                v89 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend_objectForKeyedSubscript_(v89, v90, (uint64_t)v192),
                v91 = objc_claimAutoreleasedReturnValue(),
                v89,
                (v77 = (void *)v91) == 0))
          {
LABEL_44:
            if (*v39 != -1)
              dispatch_once(v39, (dispatch_block_t)*MEMORY[0x1E0C952F8]);
            v78 = v193;
            v126 = *v40;
            if (os_log_type_enabled(*v40, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v185;
              v221 = (uint64_t)v62;
              v222 = 2112;
              v223 = v55;
              _os_log_error_impl(&dword_1BE990000, v126, OS_LOG_TYPE_ERROR, "AssociatedMergeableDelta present for missing field '%@' in record %@", buf, 0x16u);
            }

            goto LABEL_49;
          }
        }
        objc_msgSend_translator(self, v75, v76);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_identifier(v49, v93, v94);
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        v188 = v55;
        objc_msgSend_recordName(v55, v96, v97);
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        v187 = v77;
        objc_msgSend_valueID(v77, v99, v100);
        v101 = v62;
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        isEncrypted = objc_msgSend_isEncrypted(v102, v103, v104);
        v207 = 0;
        objc_msgSend_mergeableValueIDFromPMergeableValueIdentifier_recordName_fieldName_encrypted_error_(v92, v106, (uint64_t)v95, v98, v101, isEncrypted, &v207);
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = v207;

        if (v56)
        {
          if (*v39 != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v8 = v186;
          v176 = *MEMORY[0x1E0C952B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v221 = (uint64_t)v56;
            _os_log_error_impl(&dword_1BE990000, v176, OS_LOG_TYPE_ERROR, "Error transforming CKMergeableValueID, %@", buf, 0xCu);
          }
          objc_msgSend_setError_(self, v177, (uint64_t)v56);

          v55 = v188;
LABEL_94:

          goto LABEL_95;
        }
        v108 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v203 = 0u;
        v204 = 0u;
        v205 = 0u;
        v206 = 0u;
        objc_msgSend_mergeableDeltas(v49, v109, v110);
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        v113 = objc_msgSend_countByEnumeratingWithState_objects_count_(v111, v112, (uint64_t)&v203, v219, 16);
        if (v113)
        {
          v116 = v113;
          v117 = *(_QWORD *)v204;
          while (2)
          {
            for (j = 0; j != v116; ++j)
            {
              if (*(_QWORD *)v204 != v117)
                objc_enumerationMutation(v111);
              v119 = *(_QWORD *)(*((_QWORD *)&v203 + 1) + 8 * j);
              objc_msgSend_translator(self, v114, v115);
              v120 = (void *)objc_claimAutoreleasedReturnValue();
              v202 = 0;
              objc_msgSend_mergeableDeltaFromPDelta_valueID_error_(v120, v121, v119, v107, &v202);
              v122 = (void *)objc_claimAutoreleasedReturnValue();
              v123 = v202;

              if (v123)
              {
                if (*MEMORY[0x1E0C95300] != -1)
                  dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
                v14 = v189;
                v157 = *MEMORY[0x1E0C952B0];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v221 = (uint64_t)v107;
                  _os_log_error_impl(&dword_1BE990000, v157, OS_LOG_TYPE_ERROR, "Error transforming CKMergeableDelta with ID %@", buf, 0xCu);
                }
                objc_msgSend_setError_(self, v158, (uint64_t)v123);

                v8 = v186;
                goto LABEL_95;
              }
              objc_msgSend_addObject_(v108, v124, (uint64_t)v122);

            }
            v116 = objc_msgSend_countByEnumeratingWithState_objects_count_(v111, v114, (uint64_t)&v203, v219, 16);
            if (v116)
              continue;
            break;
          }
        }

        objc_msgSend_addUnmergedDeltas_(v187, v125, (uint64_t)v108);
        v8 = v186;
        v55 = v188;
        v14 = v189;
        v40 = (os_log_t *)MEMORY[0x1E0C952B0];
        v39 = (dispatch_once_t *)MEMORY[0x1E0C95300];
        v62 = v192;
        v78 = v193;
      }
      else
      {
        if (*v39 != -1)
          dispatch_once(v39, (dispatch_block_t)*MEMORY[0x1E0C952F8]);
        v78 = v193;
        v79 = *v40;
        if (os_log_type_enabled(*v40, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v221 = (uint64_t)v55;
          _os_log_error_impl(&dword_1BE990000, v79, OS_LOG_TYPE_ERROR, "AssociatedMergeableDelta present for missing record %@", buf, 0xCu);
        }
      }
LABEL_49:

      v48 = v78 + 1;
    }
    while (v48 != v190);
    v190 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v45, (uint64_t)&v209, v224, 16);
    if (v190)
      continue;
    break;
  }
LABEL_51:

  objc_msgSend_setRecordsToSave_(self, v127, (uint64_t)v14);
  if (*v39 != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v128 = *v40;
  if (os_log_type_enabled(*v40, OS_LOG_TYPE_DEBUG))
  {
    v178 = v128;
    objc_msgSend_deleteRecordids(v8, v179, v180);
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    v184 = objc_msgSend_count(v181, v182, v183);
    *(_DWORD *)buf = 134217984;
    v221 = v184;
    _os_log_debug_impl(&dword_1BE990000, v178, OS_LOG_TYPE_DEBUG, "Unpackaging DeleteRecordIDs of %lu recordIDs", buf, 0xCu);

  }
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v129, v130);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v198 = 0u;
  v199 = 0u;
  v200 = 0u;
  v201 = 0u;
  v131 = v8;
  objc_msgSend_deleteRecordids(v8, v132, v133);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  v136 = objc_msgSend_countByEnumeratingWithState_objects_count_(v134, v135, (uint64_t)&v198, v218, 16);
  if (v136)
  {
    v139 = v136;
    v140 = *(_QWORD *)v199;
    while (2)
    {
      for (k = 0; k != v139; ++k)
      {
        if (*(_QWORD *)v199 != v140)
          objc_enumerationMutation(v134);
        v142 = *(void **)(*((_QWORD *)&v198 + 1) + 8 * k);
        objc_msgSend_translator(self, v137, v138);
        v143 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_recordIdentifier(v142, v144, v145);
        v146 = (void *)objc_claimAutoreleasedReturnValue();
        v197 = 0;
        objc_msgSend_recordIDFromPRecordIdentifier_error_(v143, v147, (uint64_t)v146, &v197);
        v148 = (void *)objc_claimAutoreleasedReturnValue();
        v149 = v197;

        if (v149)
        {
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v8 = v131;
          v159 = *MEMORY[0x1E0C952B0];
          v14 = v189;
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B0], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v221 = (uint64_t)v149;
            _os_log_error_impl(&dword_1BE990000, v159, OS_LOG_TYPE_ERROR, "Error transforming recordID: %@", buf, 0xCu);
          }
          objc_msgSend_setError_(self, v160, (uint64_t)v149);

          goto LABEL_95;
        }
        objc_msgSend_addObject_(obj, v150, (uint64_t)v148);

      }
      v139 = objc_msgSend_countByEnumeratingWithState_objects_count_(v134, v137, (uint64_t)&v198, v218, 16);
      if (v139)
        continue;
      break;
    }
  }

  objc_msgSend_setRecordIDsToDelete_(self, v151, (uint64_t)obj);
  v8 = v131;
  v14 = v189;
LABEL_95:

LABEL_96:
}

- (void)_postflightRecords
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  _QWORD v16[5];

  objc_msgSend_recordsToSave(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_count(v4, v5, v6);

  if (v7)
  {
    objc_msgSend_stateTransitionGroup(self, v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v10);

    v11 = (void *)objc_opt_new();
    objc_msgSend_setShouldFetchAssetContent_(v11, v12, 0);
    objc_msgSend_setShouldFetchMergeableValues_(v11, v13, 0);
    v14 = objc_opt_class();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = sub_1BEA394C8;
    v16[3] = &unk_1E782E508;
    v16[4] = self;
    objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(self, v15, v14, v11, v16);

  }
}

- (id)deserializeCompletionBlock
{
  return self->_deserializeCompletionBlock;
}

- (void)setDeserializeCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 456);
}

- (NSData)serializedModifications
{
  return self->_serializedModifications;
}

- (void)setSerializedModifications:(id)a3
{
  objc_storeStrong((id *)&self->_serializedModifications, a3);
}

- (CKDProtocolTranslator)translator
{
  return (CKDProtocolTranslator *)objc_getProperty(self, a2, 472, 1);
}

- (void)setTranslator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 472);
}

- (NSArray)recordsToSave
{
  return (NSArray *)objc_getProperty(self, a2, 480, 1);
}

- (void)setRecordsToSave:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 480);
}

- (NSArray)recordIDsToDelete
{
  return (NSArray *)objc_getProperty(self, a2, 488, 1);
}

- (void)setRecordIDsToDelete:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 488);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordIDsToDelete, 0);
  objc_storeStrong((id *)&self->_recordsToSave, 0);
  objc_storeStrong((id *)&self->_translator, 0);
  objc_storeStrong((id *)&self->_serializedModifications, 0);
  objc_storeStrong(&self->_deserializeCompletionBlock, 0);
}

@end
