@implementation CKPublishAssetsOperation

- (CKPublishAssetsOperation)initWithRecordIDs:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  CKPublishAssetsOperation *v8;
  uint64_t v9;
  NSArray *recordIDs;
  uint64_t v11;
  NSMutableDictionary *perItemErrorsByRecordID;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CKPublishAssetsOperation;
  v8 = -[CKOperation init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend_copy(v4, v5, v6, v7);
    recordIDs = v8->_recordIDs;
    v8->_recordIDs = (NSArray *)v9;

    v11 = objc_opt_new();
    perItemErrorsByRecordID = v8->_perItemErrorsByRecordID;
    v8->_perItemErrorsByRecordID = (NSMutableDictionary *)v11;

  }
  return v8;
}

- (void)setAssetPublishedBlock:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id assetPublishedBlock;
  NSObject *v13;
  id v14;
  _QWORD block[5];
  id v16;

  v14 = a3;
  if (__sTestOverridesAvailable
    && objc_msgSend__ckRaiseInGeneratedCallbackImplementation(self, v4, v5, v6))
  {
    objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], v4, *MEMORY[0x1E0C99750], (uint64_t)CFSTR("Callback check triggered"));
  }
  if (objc_msgSend_queueHasStarted(self, v4, v5, v6)
    && !dispatch_get_specific(kCKOperationCallbackQueueName))
  {
    objc_msgSend_callbackQueue(self, v7, v8, v9);
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_18A71E358;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    assetPublishedBlock = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_assetPublishedBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    assetPublishedBlock = self->_assetPublishedBlock;
    self->_assetPublishedBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (id)assetPublishedBlock
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v10;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void *(*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  if (__sTestOverridesAvailable
    && objc_msgSend__ckRaiseInGeneratedCallbackImplementation(self, a2, v2, v3))
  {
    objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], a2, *MEMORY[0x1E0C99750], (uint64_t)CFSTR("Callback check triggered"));
  }
  if (objc_msgSend_queueHasStarted(self, a2, v2, v3)
    && !dispatch_get_specific(kCKOperationCallbackQueueName))
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = sub_18A71E500;
    v16 = sub_18A71E528;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A71E530;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_assetPublishedBlock);
  }
  return v8;
}

- (void)setPublishAssetCompletionBlock:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id publishAssetCompletionBlock;
  NSObject *v13;
  id v14;
  _QWORD block[5];
  id v16;

  v14 = a3;
  if (__sTestOverridesAvailable
    && objc_msgSend__ckRaiseInGeneratedCallbackImplementation(self, v4, v5, v6))
  {
    objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], v4, *MEMORY[0x1E0C99750], (uint64_t)CFSTR("Callback check triggered"));
  }
  if (objc_msgSend_queueHasStarted(self, v4, v5, v6)
    && !dispatch_get_specific(kCKOperationCallbackQueueName))
  {
    objc_msgSend_callbackQueue(self, v7, v8, v9);
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_18A71E68C;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    publishAssetCompletionBlock = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_publishAssetCompletionBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    publishAssetCompletionBlock = self->_publishAssetCompletionBlock;
    self->_publishAssetCompletionBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (id)publishAssetCompletionBlock
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v10;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void *(*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  if (__sTestOverridesAvailable
    && objc_msgSend__ckRaiseInGeneratedCallbackImplementation(self, a2, v2, v3))
  {
    objc_msgSend_raise_format_(MEMORY[0x1E0C99DA0], a2, *MEMORY[0x1E0C99750], (uint64_t)CFSTR("Callback check triggered"));
  }
  if (objc_msgSend_queueHasStarted(self, a2, v2, v3)
    && !dispatch_get_specific(kCKOperationCallbackQueueName))
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = sub_18A71E500;
    v16 = sub_18A71E528;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A71E834;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_publishAssetCompletionBlock);
  }
  return v8;
}

- (void)fillOutOperationInfo:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  objc_super v29;

  v4 = a3;
  objc_msgSend_recordIDs(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRecordIDs_(v4, v9, (uint64_t)v8, v10);

  objc_msgSend_fileNamesByAssetFieldNames(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFileNamesByAssetFieldNames_(v4, v15, (uint64_t)v14, v16);

  v20 = objc_msgSend_requestedTTL(self, v17, v18, v19);
  objc_msgSend_setRequestedTTL_(v4, v21, v20, v22);
  v26 = objc_msgSend_URLOptions(self, v23, v24, v25);
  objc_msgSend_setURLOptions_(v4, v27, v26, v28);
  v29.receiver = self;
  v29.super_class = (Class)CKPublishAssetsOperation;
  -[CKDatabaseOperation fillOutOperationInfo:](&v29, sel_fillOutOperationInfo_, v4);

}

- (void)fillFromOperationInfo:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)CKPublishAssetsOperation;
  v4 = a3;
  -[CKDatabaseOperation fillFromOperationInfo:](&v29, sel_fillFromOperationInfo_, v4);
  objc_msgSend_recordIDs(v4, v5, v6, v7, v29.receiver, v29.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRecordIDs_(self, v9, (uint64_t)v8, v10);

  objc_msgSend_fileNamesByAssetFieldNames(v4, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFileNamesByAssetFieldNames_(self, v15, (uint64_t)v14, v16);

  v20 = objc_msgSend_requestedTTL(v4, v17, v18, v19);
  objc_msgSend_setRequestedTTL_(self, v21, v20, v22);
  v26 = objc_msgSend_URLOptions(v4, v23, v24, v25);

  objc_msgSend_setURLOptions_(self, v27, v26, v28);
}

- (BOOL)hasCKOperationCallbacksSet
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CKPublishAssetsOperation;
  if (-[CKOperation hasCKOperationCallbacksSet](&v13, sel_hasCKOperationCallbacksSet))
    return 1;
  objc_msgSend_assetPublishedBlock(self, v3, v4, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend_publishAssetCompletionBlock(self, v7, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v11 != 0;

  }
  return v6;
}

- (BOOL)CKOperationShouldRun:(id *)a3
{
  uint64_t v3;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  int v31;
  objc_super v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  objc_msgSend_recordIDs(self, a2, (uint64_t)a3, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_count(v6, v7, v8, v9))
  {
LABEL_12:

    return 0;
  }
  objc_msgSend_fileNamesByAssetFieldNames(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend_count(v13, v14, v15, v16);

  if (v17)
  {
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    objc_msgSend_recordIDs(self, v18, v19, v20);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v21, (uint64_t)&v34, (uint64_t)v38, 16);
    if (!v22)
    {
LABEL_11:

      v33.receiver = self;
      v33.super_class = (Class)CKPublishAssetsOperation;
      return -[CKDatabaseOperation CKOperationShouldRun:](&v33, sel_CKOperationShouldRun_, a3);
    }
    v26 = v22;
    v27 = *(_QWORD *)v35;
LABEL_5:
    v28 = 0;
    while (1)
    {
      if (*(_QWORD *)v35 != v27)
        objc_enumerationMutation(v6);
      objc_msgSend_zoneID(*(void **)(*((_QWORD *)&v34 + 1) + 8 * v28), v23, v24, v25);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend_zoneIDHasCorrectDatabaseScope_error_(self, v30, (uint64_t)v29, (uint64_t)a3);

      if (!v31)
        goto LABEL_12;
      if (v26 == ++v28)
      {
        v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v23, (uint64_t)&v34, (uint64_t)v38, 16);
        if (v26)
          goto LABEL_5;
        goto LABEL_11;
      }
    }
  }
  return 0;
}

+ (SEL)daemonInvocationSelector
{
  return sel_performPublishAssetsOperation_withBlock_;
}

- (void)handleAssetPublishCompletionForRecordID:(id)a3 publishedAsset:(id)a4 recordKey:(id)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  CKSignpost *signpost;
  CKSignpost *v18;
  CKSignpost *v19;
  CKSignpost *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  CKSignpost *v25;
  CKSignpost *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  NSObject *v32;
  os_signpost_id_t v33;
  uint32_t v34;
  CKSignpost *v35;
  CKSignpost *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  CKSignpost *v40;
  CKSignpost *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void (**v59)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v60;
  const char *v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  void (**v77)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  const char *v119;
  void *v120;
  NSObject *v121;
  CKMediaItemMaker *v122;
  const char *v123;
  uint64_t v124;
  void *v125;
  const char *v126;
  uint64_t v127;
  NSObject *v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  dispatch_semaphore_t v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  void *v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  void *v140;
  const char *v141;
  NSObject *v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  void *v146;
  void *v147;
  id v148;
  id v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void (**v157)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v158;
  void *v159;
  id v160;
  _QWORD v161[4];
  id v162;
  id v163;
  id v164;
  dispatch_semaphore_t v165;
  void (**v166)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  uint8_t buf[4];
  id v168;
  __int16 v169;
  id v170;
  __int16 v171;
  id v172;
  __int16 v173;
  id v174;
  __int16 v175;
  void *v176;
  uint64_t v177;

  v177 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend_CKClientSuitableError(a6, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    signpost = self->super.super._signpost;
  else
    signpost = 0;
  v18 = signpost;

  if (v16)
  {
    if (!v18)
      goto LABEL_22;
    if (self)
      v19 = self->super.super._signpost;
    else
      v19 = 0;
    v20 = v19;
    objc_msgSend_log(v20, v21, v22, v23);
    v24 = objc_claimAutoreleasedReturnValue();

    if (self)
      v25 = self->super.super._signpost;
    else
      v25 = 0;
    v26 = v25;
    v30 = objc_msgSend_identifier(v26, v27, v28, v29);

    if ((unint64_t)(v30 - 1) > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v24))
      goto LABEL_21;
    *(_DWORD *)buf = 138412802;
    v168 = v10;
    v169 = 2112;
    v170 = v12;
    v171 = 2112;
    v172 = v16;
    v31 = "Record %@ published asset for %@ with error: %@";
    v32 = v24;
    v33 = v30;
    v34 = 32;
    goto LABEL_20;
  }
  if (!v18)
    goto LABEL_22;
  if (self)
    v35 = self->super.super._signpost;
  else
    v35 = 0;
  v36 = v35;
  objc_msgSend_log(v36, v37, v38, v39);
  v24 = objc_claimAutoreleasedReturnValue();

  if (self)
    v40 = self->super.super._signpost;
  else
    v40 = 0;
  v41 = v40;
  v45 = objc_msgSend_identifier(v41, v42, v43, v44);

  if ((unint64_t)(v45 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    *(_DWORD *)buf = 138412546;
    v168 = v10;
    v169 = 2112;
    v170 = v12;
    v31 = "Record %@ published asset for %@";
    v32 = v24;
    v33 = v45;
    v34 = 22;
LABEL_20:
    _os_signpost_emit_with_name_impl(&dword_18A5C5000, v32, OS_SIGNPOST_EVENT, v33, "CKPublishAssetsOperation", v31, buf, v34);
  }
LABEL_21:

LABEL_22:
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v46 = (void *)ck_log_facility_ck;
  if (!os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
  {
    if (!v16)
      goto LABEL_27;
    goto LABEL_26;
  }
  v142 = v46;
  objc_msgSend_operationID(self, v143, v144, v145);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138544386;
  v168 = v146;
  v169 = 2112;
  v170 = v10;
  v171 = 2112;
  v172 = v11;
  v173 = 2114;
  v174 = v12;
  v175 = 2112;
  v176 = v16;
  _os_log_debug_impl(&dword_18A5C5000, v142, OS_LOG_TYPE_DEBUG, "Operation %{public}@ received callback: %@ %@ %{public}@ %@", buf, 0x34u);

  if (v16)
  {
LABEL_26:
    objc_msgSend_perItemErrorsByRecordID(self, v47, v48, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v50, v51, (uint64_t)v16, (uint64_t)v10);

  }
LABEL_27:
  if ((objc_msgSend_URLOptions(self, v47, v48, v49) & 2) != 0)
  {
    objc_msgSend_fileNamesByAssetFieldNames(self, v52, v53, v54);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v60, v61, (uint64_t)v12, v62);
    v59 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

    objc_msgSend_downloadBaseURL(v11, v63, v64, v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v66, v67, (uint64_t)CFSTR("${f}"), (uint64_t)v59);
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_URLWithString_(MEMORY[0x1E0C99E98], v69, (uint64_t)v68, v70);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_assetPublishedBlock(self, v72, v73, v74);
    v75 = objc_claimAutoreleasedReturnValue();
    v77 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v75;
    if (v71)
    {
      v157 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v75;
      v158 = (uint64_t)v71;
      v159 = v68;
      if ((_os_feature_enabled_impl() & 1) != 0)
      {
        v147 = v16;
        v148 = v12;
        v149 = v10;
        objc_msgSend_contentBaseURL(v11, v78, v79, v80);
        v156 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_owner(v11, v81, v82, v83);
        v155 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_authToken(v11, v84, v85, v86);
        v154 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_requestor(v11, v87, v88, v89);
        v153 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_signature(v11, v90, v91, v92);
        v152 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_referenceSignature(v11, v93, v94, v95);
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        v100 = objc_msgSend_size(v11, v97, v98, v99);
        objc_msgSend_assetKey(v11, v101, v102, v103);
        v151 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_pathExtension(v59, v104, v105, v106);
        v150 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_configuration(self, v107, v108, v109);
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_container(v110, v111, v112, v113);
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_containerIdentifier(v114, v115, v116, v117);
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        v160 = 0;
        objc_msgSend_makeAssetStreamHandleWithPartition_owner_accessToken_requestorID_signature_referenceSignature_size_assetKey_filenameExtension_applicationID_error_(_TtC8CloudKit28CloudAssetsAssetStreamHandle, v119, (uint64_t)v156, (uint64_t)v155, v154, v153, v152, v96, v100, v151, v150, v118, &v160);
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        v121 = v160;

        v122 = [CKMediaItemMaker alloc];
        v125 = (void *)objc_msgSend_initWithCloudAssetsAssetStreamHandle_(v122, v123, (uint64_t)v120, v124);
        objc_msgSend_setMediaItemMaker_(v11, v126, (uint64_t)v125, v127);

        v77 = v157;
        v12 = v148;
        v10 = v149;
        if (v157)
          ((void (**)(_QWORD, id, id, id, NSObject *))v157)[2](v157, v149, v148, v11, v121);
        v71 = (void *)v158;
        v68 = v159;
        v16 = v147;
      }
      else
      {
        v132 = dispatch_semaphore_create(0);
        objc_msgSend_assetKey(v11, v133, v134, v135);
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_pathExtension(v59, v137, v138, v139);
        v140 = (void *)objc_claimAutoreleasedReturnValue();
        v161[0] = MEMORY[0x1E0C809B0];
        v161[1] = 3221225472;
        v161[2] = sub_18A71F390;
        v161[3] = &unk_1E1F62DB8;
        v162 = v11;
        v77 = v157;
        v166 = v157;
        v163 = v10;
        v164 = v12;
        v165 = v132;
        v121 = v132;
        objc_msgSend_makeAssetStreamHandleFrom_with_for_completionHandler_(_TtC8CloudKit17AssetStreamHandle, v141, v158, (uint64_t)v136, v140, v161);

        v71 = (void *)v158;
        dispatch_semaphore_wait(v121, 0xFFFFFFFFFFFFFFFFLL);

        v120 = v162;
        v68 = v159;
      }
    }
    else
    {
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v76, (uint64_t)CFSTR("CKInternalErrorDomain"), 2000, CFSTR("server returned an invalid nil url for metadata of the asset"));
      v128 = objc_claimAutoreleasedReturnValue();
      v121 = v128;
      if (!self->_assetPublishedBlock)
      {
LABEL_41:

        goto LABEL_42;
      }
      objc_msgSend_CKClientSuitableError(v128, v129, v130, v131);
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, _QWORD, _QWORD, void *))v77)[2](v77, 0, 0, 0, v120);
    }

    goto LABEL_41;
  }
  objc_msgSend_assetPublishedBlock(self, v52, v53, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  if (v55)
  {
    objc_msgSend_assetPublishedBlock(self, v56, v57, v58);
    v59 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id, id, void *))v59)[2](v59, v10, v12, v11, v16);
LABEL_42:

  }
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  id v4;
  CKSignpost *signpost;
  CKSignpost *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  CKSignpost *v10;
  CKSignpost *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  CKSignpost *v16;
  CKSignpost *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  os_signpost_id_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  const char *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void (**v41)(_QWORD, _QWORD);
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  NSObject *v48;
  objc_class *v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  objc_super v55;
  uint8_t buf[4];
  void *v57;
  __int16 v58;
  CKPublishAssetsOperation *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  id v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self)
    signpost = self->super.super._signpost;
  else
    signpost = 0;
  v6 = signpost;

  if (v6)
  {
    if (self)
      v10 = self->super.super._signpost;
    else
      v10 = 0;
    v11 = v10;
    objc_msgSend_log(v11, v12, v13, v14);
    v15 = objc_claimAutoreleasedReturnValue();

    if (self)
      v16 = self->super.super._signpost;
    else
      v16 = 0;
    v17 = v16;
    v21 = objc_msgSend_identifier(v17, v18, v19, v20);

    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v15, OS_SIGNPOST_EVENT, v21, "CKPublishAssetsOperation", "Finishing", buf, 2u);
    }

  }
  if (!v4)
  {
    objc_msgSend_perItemErrorsByRecordID(self, v7, v8, v9);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend_count(v22, v23, v24, v25);

    if (v26)
    {
      objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v7, v8, v9);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_perItemErrorsByRecordID(self, v28, v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v27, v32, (uint64_t)v31, (uint64_t)CFSTR("CKPartialErrors"));

      objc_msgSend_errorWithDomain_code_userInfo_format_(CKPrettyError, v33, (uint64_t)CFSTR("CKInternalErrorDomain"), 1011, v27, CFSTR("Failed to publish assets for some records"));
      v4 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }
  }
  objc_msgSend_publishAssetCompletionBlock(self, v7, v8, v9);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v37 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v48 = v37;
      v49 = (objc_class *)objc_opt_class();
      NSStringFromClass(v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_ckShortDescription(self, v51, v52, v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v57 = v50;
      v58 = 2048;
      v59 = self;
      v60 = 2114;
      v61 = v54;
      v62 = 2112;
      v63 = v4;
      _os_log_debug_impl(&dword_18A5C5000, v48, OS_LOG_TYPE_DEBUG, "Calling publishAssetCompletionBlock for operation <%{public}@: %p; %{public}@> with error %@",
        buf,
        0x2Au);

    }
    objc_msgSend_publishAssetCompletionBlock(self, v38, v39, v40);
    v41 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKClientSuitableError(v4, v42, v43, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v41)[2](v41, v45);

    objc_msgSend_setPublishAssetCompletionBlock_(self, v46, 0, v47);
  }
  objc_msgSend_setAssetPublishedBlock_(self, v35, 0, v36);
  v55.receiver = self;
  v55.super_class = (Class)CKPublishAssetsOperation;
  -[CKOperation _finishOnCallbackQueueWithError:](&v55, sel__finishOnCallbackQueueWithError_, v4);

}

- (void)ckSignpostBegin
{
  CKSignpost *signpost;
  CKSignpost *v4;
  CKSignpost *v5;
  CKSignpost *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  CKSignpost *v11;
  CKSignpost *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  os_signpost_id_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  int v54;
  void *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  void *v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  if (self)
    signpost = self->super.super._signpost;
  else
    signpost = 0;
  v4 = signpost;

  if (v4)
  {
    if (self)
      v5 = self->super.super._signpost;
    else
      v5 = 0;
    v6 = v5;
    objc_msgSend_log(v6, v7, v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();

    if (self)
      v11 = self->super.super._signpost;
    else
      v11 = 0;
    v12 = v11;
    v16 = objc_msgSend_identifier(v12, v13, v14, v15);

    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      objc_msgSend_operationID(self, v17, v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_containerID(self, v21, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_group(self, v25, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_operationGroupID(v28, v29, v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_operationGroupName(self, v33, v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_operationInfo(self, v37, v38, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend_discretionaryNetworkBehavior(v40, v41, v42, v43);
      CKStringForDiscretionaryNetworkBehavior(v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend_qualityOfService(self, v46, v47, v48);
      CKStringForQOS(v49, v50, v51, v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = 138413570;
      v55 = v20;
      v56 = 2112;
      v57 = v24;
      v58 = 2112;
      v59 = v32;
      v60 = 2114;
      v61 = v36;
      v62 = 2114;
      v63 = v45;
      v64 = 2114;
      v65 = v53;
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v16, "CKPublishAssetsOperation", "ID=%{signpost.description:attribute}@ Container=%{signpost.description:attribute}@ GroupID=%{signpost.description:attribute}@ GroupName=%{signpost.description:attribute,public}@ Behavior=%{signpost.description:attribute,public}@ QoS=%{signpost.description:attribute,public}@ ", (uint8_t *)&v54, 0x3Eu);

    }
  }
}

- (void)ckSignpostEndWithError:(id)a3
{
  id v4;
  CKSignpost *signpost;
  CKSignpost *v6;
  CKSignpost *v7;
  CKSignpost *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  CKSignpost *v13;
  CKSignpost *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  os_signpost_id_t v18;
  int v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self)
    signpost = self->super.super._signpost;
  else
    signpost = 0;
  v6 = signpost;

  if (v6)
  {
    if (self)
      v7 = self->super.super._signpost;
    else
      v7 = 0;
    v8 = v7;
    objc_msgSend_log(v8, v9, v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();

    if (self)
      v13 = self->super.super._signpost;
    else
      v13 = 0;
    v14 = v13;
    v18 = objc_msgSend_identifier(v14, v15, v16, v17);

    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      v19 = 138412290;
      v20 = v4;
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v12, OS_SIGNPOST_INTERVAL_END, v18, "CKPublishAssetsOperation", "Error=%{signpost.description:attribute}@ ", (uint8_t *)&v19, 0xCu);
    }

  }
}

- (id)activityCreate
{
  return _os_activity_create(&dword_18A5C5000, "client/publish-assets", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

+ (void)applyDaemonCallbackInterfaceTweaks:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  objc_super v7;

  v4 = a3;
  CKErrorUserInfoClasses();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v6, (uint64_t)v5, (uint64_t)sel_handleAssetPublishCompletionForRecordID_publishedAsset_recordKey_error_, 3, 0);

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___CKPublishAssetsOperation;
  objc_msgSendSuper2(&v7, sel_applyDaemonCallbackInterfaceTweaks_, v4);

}

- (NSDictionary)fileNamesByAssetFieldNames
{
  return self->_fileNamesByAssetFieldNames;
}

- (void)setFileNamesByAssetFieldNames:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 528);
}

- (unint64_t)requestedTTL
{
  return self->_requestedTTL;
}

- (void)setRequestedTTL:(unint64_t)a3
{
  self->_requestedTTL = a3;
}

- (unint64_t)URLOptions
{
  return self->_URLOptions;
}

- (void)setURLOptions:(unint64_t)a3
{
  self->_URLOptions = a3;
}

- (NSArray)recordIDs
{
  return self->_recordIDs;
}

- (void)setRecordIDs:(id)a3
{
  objc_storeStrong((id *)&self->_recordIDs, a3);
}

- (NSMutableDictionary)perItemErrorsByRecordID
{
  return self->_perItemErrorsByRecordID;
}

- (void)setPerItemErrorsByRecordID:(id)a3
{
  objc_storeStrong((id *)&self->_perItemErrorsByRecordID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_perItemErrorsByRecordID, 0);
  objc_storeStrong((id *)&self->_recordIDs, 0);
  objc_storeStrong((id *)&self->_fileNamesByAssetFieldNames, 0);
  objc_storeStrong(&self->_publishAssetCompletionBlock, 0);
  objc_storeStrong(&self->_assetPublishedBlock, 0);
}

@end
