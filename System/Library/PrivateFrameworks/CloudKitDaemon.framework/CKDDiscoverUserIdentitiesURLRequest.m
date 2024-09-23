@implementation CKDDiscoverUserIdentitiesURLRequest

- (CKDDiscoverUserIdentitiesURLRequest)initWithOperation:(id)a3 lookupInfos:(id)a4 adopterProvidedLookupInfos:(BOOL)a5
{
  id v9;
  CKDDiscoverUserIdentitiesURLRequest *v10;
  CKDDiscoverUserIdentitiesURLRequest *v11;
  uint64_t v12;
  NSMutableDictionary *submittedInfos;
  objc_super v15;

  v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CKDDiscoverUserIdentitiesURLRequest;
  v10 = -[CKDURLRequest initWithOperation:](&v15, sel_initWithOperation_, a3);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_infosToDiscover, a4);
    v12 = objc_opt_new();
    submittedInfos = v11->_submittedInfos;
    v11->_submittedInfos = (NSMutableDictionary *)v12;

    v11->_adopterProvidedLookupInfos = a5;
  }

  return v11;
}

- (void)fillOutEquivalencyPropertiesBuilder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CKDDiscoverUserIdentitiesURLRequest;
  -[CKDURLRequest fillOutEquivalencyPropertiesBuilder:](&v17, sel_fillOutEquivalencyPropertiesBuilder_, v4);
  if (objc_msgSend_adopterProvidedLookupInfos(self, v5, v6))
  {
    v9 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend_infosToDiscover(self, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_ckEquivalencyProperties(v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v9, v14, (uint64_t)v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_setObject_forKeyedSubscript_(v4, v16, (uint64_t)v15, CFSTR("lookupInfos"));
  }

}

- (int64_t)databaseScope
{
  return 1;
}

- (id)requestOperationClasses
{
  const char *v2;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v4[0] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v2, (uint64_t)v4, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)generateRequestOperations
{
  uint64_t v2;
  void *v4;
  const char *v5;
  void *v6;
  _QWORD v8[5];

  objc_msgSend_infosToDiscover(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1BEBB37D0;
  v8[3] = &unk_1E7836380;
  v8[4] = self;
  objc_msgSend_CKMap_(v4, v5, (uint64_t)v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)requestDidParseProtobufObject:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  BOOL *p_wantsProtectionInfo;
  const char *v27;
  uint64_t v28;
  NSMutableDictionary *submittedInfos;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  void *inited;
  void *v44;
  void *v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  void (**v52)(_QWORD, _QWORD, _QWORD, _QWORD);
  const char *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  int v59;
  const char *v60;
  uint64_t v61;
  _BOOL4 v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  int v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  int v71;
  id v72;
  const char *v73;
  void *v74;
  id v75;
  const char *v76;
  const char *v77;
  _QWORD *v78;
  void *v79;
  id v80;
  const char *v81;
  uint64_t v82;
  const char *v83;
  const char *v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  const char *v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  const char *v96;
  const char *v97;
  uint64_t v98;
  id v99;
  const char *v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  const char *v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  const char *v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  void *v114;
  const char *v115;
  uint64_t v116;
  const char *v117;
  uint64_t v118;
  id v120;
  const char *v121;
  uint64_t v122;
  id v123;
  const char *v124;
  void *v125;
  const char *v126;
  const char *v127;
  uint64_t v128;
  void *v129;
  const char *v130;
  const char *v131;
  uint64_t v132;
  void *v133;
  const char *v134;
  const char *v135;
  uint64_t v136;
  void *v137;
  const char *v138;
  uint64_t v139;
  void (**v140)(_QWORD, _QWORD, _QWORD, _QWORD);
  const char *v141;
  uint64_t v142;
  void *v143;
  const char *v144;
  uint64_t v145;
  void *v146;
  const char *v147;
  uint64_t v148;
  void (**v149)(_QWORD, _QWORD, _QWORD, _QWORD);
  const char *v150;
  uint64_t v151;
  void *v152;
  NSObject *v153;
  const char *v154;
  uint64_t v155;
  void *v156;
  NSObject *v157;
  const char *v158;
  uint64_t v159;
  void *v160;
  NSObject *v161;
  const char *v162;
  uint64_t v163;
  void *v164;
  void *v165;
  void *v166;
  uint8_t buf[4];
  void *v168;
  __int16 v169;
  void *v170;
  uint64_t v171;

  v171 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend_hasUserQueryResponse(v4, v5, v6)
    && (objc_msgSend_userQueryResponse(v4, v7, v8),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend_user(v9, v10, v11),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v12))
  {
    if (objc_msgSend_hasIdentifier(v12, v7, v8))
    {
      objc_msgSend_identifier(v12, v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_hasName(v15, v16, v17))
      {
        objc_msgSend_identifier(v12, v18, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_name(v20, v21, v22);
        v166 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v166 = 0;
      }

    }
    else
    {
      v166 = 0;
    }
    if (objc_msgSend_hasFirstName(v12, v13, v14))
    {
      objc_msgSend_firstName(v12, v27, v28);
      v23 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = 0;
    }
    if (objc_msgSend_hasLastName(v12, v27, v28))
    {
      objc_msgSend_lastName(v12, v7, v8);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = 0;
    }
    p_wantsProtectionInfo = &self->_wantsProtectionInfo;
    if (self->_wantsProtectionInfo && objc_msgSend_hasProtectionInfo(v12, v7, v8))
    {
      objc_msgSend_protectionInfo(v12, v7, v8);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v25 = 0;
    }
  }
  else
  {
    v166 = 0;
    v12 = 0;
    v23 = 0;
    v24 = 0;
    v25 = 0;
    p_wantsProtectionInfo = &self->_wantsProtectionInfo;
  }
  submittedInfos = self->_submittedInfos;
  objc_msgSend_response(v4, v7, v8);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationUUID(v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(submittedInfos, v34, (uint64_t)v33);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_fakeResponseOperationResultByItemID(self, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    objc_msgSend_fakeResponseOperationResultByItemID(self, v39, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v41, v42, (uint64_t)v35);
    inited = (void *)objc_claimAutoreleasedReturnValue();

    if (inited)
    {
      if (*MEMORY[0x1E0C95300] != -1)
        dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
      v44 = (void *)v23;
      v45 = (void *)*MEMORY[0x1E0C952E0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952E0], OS_LOG_TYPE_ERROR))
      {
        v153 = v45;
        objc_msgSend_requestUUID(self, v154, v155);
        v156 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v168 = v156;
        v169 = 2112;
        v170 = v35;
        _os_log_error_impl(&dword_1BE990000, v153, OS_LOG_TYPE_ERROR, "req: %{public}@, \"Inlining fake response operation result for item id %@\", buf, 0x16u);

      }
      objc_msgSend_setResult_(v4, v46, (uint64_t)inited);
      objc_msgSend_progressBlock(self, v47, v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v49)
        goto LABEL_56;
      objc_msgSend_progressBlock(self, v50, v51);
      v52 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend_result(v4, v53, v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, _QWORD, void *))v52)[2](v52, v35, 0, v55);
      goto LABEL_55;
    }
  }
  objc_msgSend_alias(v12, v39, v40);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend_type(v56, v57, v58);

  if (v59 == 1)
  {
    v62 = (int)v166;
    if (!v166)
      goto LABEL_38;
    v63 = 1;
    goto LABEL_37;
  }
  objc_msgSend_alias(v12, v60, v61);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = objc_msgSend_type(v64, v65, v66);

  if (v67 == 2)
  {
    v62 = (int)v166;
    if (!v166)
      goto LABEL_38;
    v63 = 2;
    goto LABEL_37;
  }
  objc_msgSend_alias(v12, v60, v61);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = objc_msgSend_type(v68, v69, v70);

  v62 = 0;
  if (v71 == 3 && v166)
  {
    v63 = 3;
LABEL_37:
    v62 = objc_msgSend_lookupField(v35, v60, v61) == v63;
  }
LABEL_38:
  if (v25)
  {
    v44 = (void *)v23;
    if (v62)
    {
      v72 = objc_alloc(MEMORY[0x1E0C95070]);
      v74 = (void *)objc_msgSend_initWithRecordName_(v72, v73, (uint64_t)v166);
      v75 = objc_alloc(MEMORY[0x1E0C95210]);
      inited = (void *)objc_msgSend_initWithUserRecordID_(v75, v76, (uint64_t)v74);

    }
    else
    {
      v99 = objc_alloc(MEMORY[0x1E0C95210]);
      inited = (void *)objc_msgSend_initInternal(v99, v100, v101);
    }
    objc_msgSend_setLookupInfo_(inited, v77, (uint64_t)v35);
    objc_msgSend_nameComponents(inited, v102, v103);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setGivenName_(v104, v105, v23);

    objc_msgSend_nameComponents(inited, v106, v107);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setFamilyName_(v108, v109, (uint64_t)v24);

    objc_msgSend_protectionInfo(v25, v110, v111);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setPublicSharingKey_(inited, v113, (uint64_t)v112);

LABEL_53:
    objc_msgSend_progressBlock(self, v97, v98);
    v114 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v114)
    {
LABEL_56:

      goto LABEL_57;
    }
    objc_msgSend_progressBlock(self, v115, v116);
    v52 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v4, v117, v118);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *, void *))v52)[2](v52, v35, inited, v55);
LABEL_55:

    goto LABEL_56;
  }
  if (*p_wantsProtectionInfo)
  {
    v78 = (_QWORD *)MEMORY[0x1E0C95300];
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v79 = (void *)*MEMORY[0x1E0C952E0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952E0], OS_LOG_TYPE_DEBUG))
    {
      v157 = v79;
      objc_msgSend_requestUUID(self, v158, v159);
      v160 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v168 = v160;
      _os_log_debug_impl(&dword_1BE990000, v157, OS_LOG_TYPE_DEBUG, "req: %{public}@, \"Received no public key when discovering user identity, though it was requested, this is an OON case\", buf, 0xCu);

    }
    v80 = objc_alloc(MEMORY[0x1E0C95210]);
    inited = (void *)objc_msgSend_initInternal(v80, v81, v82);
    objc_msgSend_setLookupInfo_(inited, v83, (uint64_t)v35);
    objc_msgSend_nameComponents(inited, v84, v85);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setGivenName_(v86, v87, v23);

    objc_msgSend_nameComponents(inited, v88, v89);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setFamilyName_(v90, v91, (uint64_t)v24);

    if (*v78 != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v92 = (void *)*MEMORY[0x1E0C952E0];
    v44 = (void *)v23;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952E0], OS_LOG_TYPE_DEBUG))
    {
      v161 = v92;
      objc_msgSend_requestUUID(self, v162, v163);
      v164 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v168 = v164;
      v169 = 2112;
      v170 = inited;
      _os_log_debug_impl(&dword_1BE990000, v161, OS_LOG_TYPE_DEBUG, "req: %{public}@, \"OON user identity detected: %@\", buf, 0x16u);

    }
    v95 = objc_msgSend_isInNetwork(v12, v93, v94);
    objc_msgSend_setHasiCloudAccount_(inited, v96, v95);
    goto LABEL_53;
  }
  if (v62)
  {
    v120 = objc_alloc(MEMORY[0x1E0C95070]);
    v122 = objc_msgSend_initWithRecordName_(v120, v121, (uint64_t)v166);
    v123 = objc_alloc(MEMORY[0x1E0C95210]);
    v165 = (void *)v122;
    v125 = (void *)objc_msgSend_initWithUserRecordID_(v123, v124, v122);
    objc_msgSend_setLookupInfo_(v125, v126, (uint64_t)v35);
    objc_msgSend_nameComponents(v125, v127, v128);
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = (void *)v23;
    objc_msgSend_setGivenName_(v129, v130, v23);

    objc_msgSend_nameComponents(v125, v131, v132);
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setFamilyName_(v133, v134, (uint64_t)v24);

    objc_msgSend_progressBlock(self, v135, v136);
    v137 = (void *)objc_claimAutoreleasedReturnValue();

    if (v137)
    {
      objc_msgSend_progressBlock(self, v138, v139);
      v140 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      objc_msgSend_result(v4, v141, v142);
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, void *, void *))v140)[2](v140, v35, v125, v143);

    }
  }
  else
  {
    v44 = (void *)v23;
    if (objc_msgSend_shouldReportMissingIdentity(v35, v60, v61))
    {
      objc_msgSend_progressBlock(self, v144, v145);
      v146 = (void *)objc_claimAutoreleasedReturnValue();

      if (v146)
      {
        objc_msgSend_progressBlock(self, v147, v148);
        v149 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        objc_msgSend_result(v4, v150, v151);
        v152 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *, _QWORD, void *))v149)[2](v149, v35, 0, v152);

      }
    }
  }
LABEL_57:

  return 0;
}

- (void)requestDidParseNodeFailure:(id)a3
{
  id v4;
  NSMutableDictionary *submittedInfos;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void (**v27)(_QWORD, _QWORD, _QWORD, _QWORD);
  const char *v28;
  uint64_t v29;
  void *v30;
  int v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  submittedInfos = self->_submittedInfos;
  objc_msgSend_response(v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_operationUUID(v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(submittedInfos, v12, (uint64_t)v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (*MEMORY[0x1E0C95300] != -1)
    dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
  v14 = (void *)*MEMORY[0x1E0C952E0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952E0], OS_LOG_TYPE_INFO))
  {
    v17 = v14;
    objc_msgSend_requestUUID(self, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v4, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 138543874;
    v32 = v20;
    v33 = 2112;
    v34 = v13;
    v35 = 2112;
    v36 = v23;
    _os_log_impl(&dword_1BE990000, v17, OS_LOG_TYPE_INFO, "req: %{public}@, \"Node level failure for info %@: %@\", (uint8_t *)&v31, 0x20u);

  }
  objc_msgSend_progressBlock(self, v15, v16);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend_progressBlock(self, v25, v26);
    v27 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v4, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD, void *))v27)[2](v27, v13, 0, v30);

  }
}

- (BOOL)wantsProtectionInfo
{
  return self->_wantsProtectionInfo;
}

- (void)setWantsProtectionInfo:(BOOL)a3
{
  self->_wantsProtectionInfo = a3;
}

- (id)progressBlock
{
  return self->_progressBlock;
}

- (void)setProgressBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (NSArray)infosToDiscover
{
  return self->_infosToDiscover;
}

- (NSMutableDictionary)submittedInfos
{
  return self->_submittedInfos;
}

- (BOOL)adopterProvidedLookupInfos
{
  return self->_adopterProvidedLookupInfos;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_submittedInfos, 0);
  objc_storeStrong((id *)&self->_infosToDiscover, 0);
  objc_storeStrong(&self->_progressBlock, 0);
}

@end
