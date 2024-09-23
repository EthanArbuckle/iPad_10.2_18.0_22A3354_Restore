@implementation CKRepairAssetsOperation

- (CKRepairAssetsOperation)initWithAssets:(id)a3 packages:(id)a4 assetMetadata:(id)a5 packageMetadata:(id)a6 unavailableAssets:(id)a7 unavailablePackages:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  CKRepairAssetsOperation *v41;
  uint64_t v42;
  NSArray *assets;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSArray *packages;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  NSArray *assetMetadata;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  NSArray *packageMetadata;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  NSArray *unavailableAssets;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  NSArray *unavailablePackages;
  uint64_t v69;
  NSMutableDictionary *perItemErrorsByRecordID;
  void *v72;
  const char *v73;
  void *v74;
  const char *v75;
  objc_super v76;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v24 = objc_msgSend_count(v15, v21, v22, v23);
  if (v24 != objc_msgSend_count(v17, v25, v26, v27))
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v28, v29, v30);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v72, v73, (uint64_t)a2, (uint64_t)self, CFSTR("CKRepairAssetsOperation.m"), 44, CFSTR("Asset and asset metadata counts need to match"));

  }
  v31 = objc_msgSend_count(v16, v28, v29, v30);
  if (v31 != objc_msgSend_count(v18, v32, v33, v34))
  {
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v35, v36, v37);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v74, v75, (uint64_t)a2, (uint64_t)self, CFSTR("CKRepairAssetsOperation.m"), 45, CFSTR("Package and package metadata counts need to match"));

  }
  v76.receiver = self;
  v76.super_class = (Class)CKRepairAssetsOperation;
  v41 = -[CKOperation init](&v76, sel_init);
  if (v41)
  {
    v42 = objc_msgSend_copy(v15, v38, v39, v40);
    assets = v41->_assets;
    v41->_assets = (NSArray *)v42;

    v47 = objc_msgSend_copy(v16, v44, v45, v46);
    packages = v41->_packages;
    v41->_packages = (NSArray *)v47;

    v52 = objc_msgSend_copy(v17, v49, v50, v51);
    assetMetadata = v41->_assetMetadata;
    v41->_assetMetadata = (NSArray *)v52;

    v57 = objc_msgSend_copy(v18, v54, v55, v56);
    packageMetadata = v41->_packageMetadata;
    v41->_packageMetadata = (NSArray *)v57;

    v62 = objc_msgSend_copy(v19, v59, v60, v61);
    unavailableAssets = v41->_unavailableAssets;
    v41->_unavailableAssets = (NSArray *)v62;

    v67 = objc_msgSend_copy(v20, v64, v65, v66);
    unavailablePackages = v41->_unavailablePackages;
    v41->_unavailablePackages = (NSArray *)v67;

    v69 = objc_opt_new();
    perItemErrorsByRecordID = v41->_perItemErrorsByRecordID;
    v41->_perItemErrorsByRecordID = (NSMutableDictionary *)v69;

  }
  return v41;
}

- (CKUploadRequestConfiguration)resolvedUploadRequestConfiguration
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;

  objc_msgSend_database(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_container(v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_uploadRequestConfiguration(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_resolvedConfigurationWithBaseContainer_overrides_(CKUploadRequestConfiguration, v14, (uint64_t)v9, (uint64_t)v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (CKUploadRequestConfiguration *)v15;
}

- (void)setRepairAssetsCompletionBlock:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id repairAssetsCompletionBlock;
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
    block[2] = sub_18A6AE8F4;
    block[3] = &unk_1E1F5F730;
    block[4] = self;
    v16 = v14;
    dispatch_sync(v13, block);

    repairAssetsCompletionBlock = v16;
    goto LABEL_9;
  }
  v10 = v14;
  if (self->_repairAssetsCompletionBlock != v14)
  {
    v11 = (void *)objc_msgSend_copy(v14, v7, v8, v9);
    repairAssetsCompletionBlock = self->_repairAssetsCompletionBlock;
    self->_repairAssetsCompletionBlock = v11;
LABEL_9:

    v10 = v14;
  }

}

- (id)repairAssetsCompletionBlock
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
    v15 = sub_18A6AEA9C;
    v16 = sub_18A6AEAC4;
    v17 = 0;
    objc_msgSend_callbackQueue(self, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_18A6AEACC;
    v11[3] = &unk_1E1F5F758;
    v11[4] = self;
    v11[5] = &v12;
    dispatch_sync(v10, v11);

    v8 = _Block_copy((const void *)v13[5]);
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v8 = _Block_copy(self->_repairAssetsCompletionBlock);
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
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  objc_super v47;

  v4 = a3;
  objc_msgSend_assets(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAssets_(v4, v9, (uint64_t)v8, v10);

  objc_msgSend_packages(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPackages_(v4, v15, (uint64_t)v14, v16);

  objc_msgSend_assetMetadata(self, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAssetMetadata_(v4, v21, (uint64_t)v20, v22);

  objc_msgSend_packageMetadata(self, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPackageMetadata_(v4, v27, (uint64_t)v26, v28);

  objc_msgSend_unavailableAssets(self, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setUnavailableAssets_(v4, v33, (uint64_t)v32, v34);

  objc_msgSend_unavailablePackages(self, v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setUnavailablePackages_(v4, v39, (uint64_t)v38, v40);

  objc_msgSend_resolvedUploadRequestConfiguration(self, v41, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setUploadRequestConfiguration_(v4, v45, (uint64_t)v44, v46);

  v47.receiver = self;
  v47.super_class = (Class)CKRepairAssetsOperation;
  -[CKDatabaseOperation fillOutOperationInfo:](&v47, sel_fillOutOperationInfo_, v4);

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
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  objc_super v47;

  v47.receiver = self;
  v47.super_class = (Class)CKRepairAssetsOperation;
  v4 = a3;
  -[CKDatabaseOperation fillFromOperationInfo:](&v47, sel_fillFromOperationInfo_, v4);
  objc_msgSend_assets(v4, v5, v6, v7, v47.receiver, v47.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAssets_(self, v9, (uint64_t)v8, v10);

  objc_msgSend_packages(v4, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPackages_(self, v15, (uint64_t)v14, v16);

  objc_msgSend_assetMetadata(v4, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAssetMetadata_(self, v21, (uint64_t)v20, v22);

  objc_msgSend_packageMetadata(v4, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPackageMetadata_(self, v27, (uint64_t)v26, v28);

  objc_msgSend_unavailableAssets(v4, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setUnavailableAssets_(self, v33, (uint64_t)v32, v34);

  objc_msgSend_unavailablePackages(v4, v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setUnavailablePackages_(self, v39, (uint64_t)v38, v40);

  objc_msgSend_uploadRequestConfiguration(v4, v41, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setUploadRequestConfiguration_(self, v45, (uint64_t)v44, v46);
}

- (BOOL)hasCKOperationCallbacksSet
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CKRepairAssetsOperation;
  if (-[CKOperation hasCKOperationCallbacksSet](&v9, sel_hasCKOperationCallbacksSet))
    return 1;
  objc_msgSend_repairAssetsCompletionBlock(self, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v7 != 0;

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
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  objc_class *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  objc_class *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  objc_class *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  objc_class *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  objc_class *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  objc_class *v65;
  id v66;
  id v67;
  BOOL result;
  void *v69;
  uint64_t v70;
  id v71;
  void (**v72)(void *, void *);
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  const char *v96;
  int v97;
  BOOL v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  const char *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t i;
  uint64_t v116;
  void *v117;
  id v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  const char *v122;
  uint64_t v123;
  const char *v124;
  uint64_t v125;
  void *v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  objc_super v132;
  id v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  _QWORD v138[4];
  id v139;
  uint64_t *v140;
  uint64_t v141;
  uint64_t *v142;
  uint64_t v143;
  char v144;
  _QWORD aBlock[4];
  id v146;
  _BYTE v147[128];
  uint64_t v148;

  v148 = *MEMORY[0x1E0C80C00];
  objc_msgSend_assets(self, a2, (uint64_t)a3, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v6, v7, v8, v9))
    goto LABEL_6;
  objc_msgSend_packages(self, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v13, v14, v15, v16))
  {
LABEL_5:

LABEL_6:
    goto LABEL_7;
  }
  objc_msgSend_unavailableAssets(self, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v20, v21, v22, v23))
  {

    goto LABEL_5;
  }
  objc_msgSend_unavailablePackages(self, v24, v25, v26);
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  v130 = objc_msgSend_count(v126, v127, v128, v129);

  if (!v130)
    return 0;
LABEL_7:
  objc_msgSend_database(self, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend_scope(v30, v31, v32, v33);

  if (v34 != 2)
  {
    if (a3)
    {
      objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v35, (uint64_t)CFSTR("CKInternalErrorDomain"), 1019, CFSTR("This operation should only be called on the private database"));
      v67 = (id)objc_claimAutoreleasedReturnValue();
      result = 0;
      *a3 = v67;
      return result;
    }
    return 0;
  }
  objc_msgSend_assets(self, v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (objc_class *)objc_opt_class();
  sub_18A6AF440(v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v40)
  {
    objc_msgSend_packages(self, v41, v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = (objc_class *)objc_opt_class();
    sub_18A6AF440(v44, v45);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v40)
    {
      objc_msgSend_assetMetadata(self, v46, v47, v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = (objc_class *)objc_opt_class();
      sub_18A6AF440(v49, v50);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v40)
      {
        objc_msgSend_packageMetadata(self, v51, v52, v53);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = (objc_class *)objc_opt_class();
        sub_18A6AF440(v54, v55);
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v40)
        {
          objc_msgSend_unavailableAssets(self, v56, v57, v58);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = (objc_class *)objc_opt_class();
          sub_18A6AF440(v59, v60);
          v40 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v40)
          {
            objc_msgSend_unavailablePackages(self, v61, v62, v63);
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            v65 = (objc_class *)objc_opt_class();
            sub_18A6AF440(v64, v65);
            v40 = (void *)objc_claimAutoreleasedReturnValue();

          }
        }
      }
    }
  }
  if (a3 && v40)
  {
    v66 = objc_retainAutorelease(v40);
    *a3 = v66;

    return 0;
  }

  if (v40)
    return 0;
  v69 = (void *)objc_opt_new();
  v70 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_18A6AF5B4;
  aBlock[3] = &unk_1E1F5F6C0;
  v146 = v69;
  v71 = v69;
  v72 = (void (**)(void *, void *))_Block_copy(aBlock);
  objc_msgSend_assetMetadata(self, v73, v74, v75);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v72[2](v72, v76);
  v77 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v77)
  {
    objc_msgSend_packageMetadata(self, v78, v79, v80);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v72[2](v72, v81);
    v77 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v77)
    {
      objc_msgSend_unavailableAssets(self, v82, v83, v84);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v72[2](v72, v85);
      v77 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v77)
      {
        objc_msgSend_unavailablePackages(self, v86, v87, v88);
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        v72[2](v72, v89);
        v77 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
  }
  if (a3 && v77)
    *a3 = objc_retainAutorelease(v77);

  if (v77)
    return 0;
  v141 = 0;
  v142 = &v141;
  v143 = 0x2020000000;
  v144 = 0;
  objc_msgSend_assets(self, v90, v91, v92);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v138[0] = v70;
  v138[1] = 3221225472;
  v138[2] = sub_18A6AFA9C;
  v138[3] = &unk_1E1F5F708;
  v139 = &unk_1E1F590B8;
  v140 = &v141;
  objc_msgSend_enumerateObjectsUsingBlock_(v93, v94, (uint64_t)v138, v95);

  v97 = *((unsigned __int8 *)v142 + 24);
  if (*((_BYTE *)v142 + 24))
    v98 = a3 == 0;
  else
    v98 = 1;
  if (!v98)
  {
    objc_msgSend_errorWithDomain_code_format_(CKPrettyError, v96, (uint64_t)CFSTR("CKInternalErrorDomain"), 10005, CFSTR("Cannot repair asset with zero-length replacement"));
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  _Block_object_dispose(&v141, 8);
  if (v97)
    return 0;
  objc_msgSend_packages(self, v99, v100, v101);
  v102 = (void *)objc_claimAutoreleasedReturnValue();

  if (v102)
  {
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v103, v104, v105);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v136 = 0u;
    v137 = 0u;
    v134 = 0u;
    v135 = 0u;
    objc_msgSend_packages(self, v107, v108, v109);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    v113 = objc_msgSend_countByEnumeratingWithState_objects_count_(v110, v111, (uint64_t)&v134, (uint64_t)v147, 16);
    if (v113)
    {
      v114 = *(_QWORD *)v135;
      while (2)
      {
        for (i = 0; i != v113; ++i)
        {
          if (*(_QWORD *)v135 != v114)
            objc_enumerationMutation(v110);
          v116 = *(_QWORD *)(*((_QWORD *)&v134 + 1) + 8 * i);
          v133 = 0;
          objc_msgSend_packageWithPackage_error_(CKPackage, v112, v116, (uint64_t)&v133);
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          v118 = v133;
          if (v118)
          {
            v131 = v118;
            objc_msgSend_removeDB(v117, v119, v120, v121);
            if (a3)
              *a3 = objc_retainAutorelease(v131);

            return 0;
          }
          objc_msgSend_close(v117, v119, v120, v121);
          objc_msgSend_addObject_(v106, v122, (uint64_t)v117, v123);

        }
        v113 = objc_msgSend_countByEnumeratingWithState_objects_count_(v110, v112, (uint64_t)&v134, (uint64_t)v147, 16);
        if (v113)
          continue;
        break;
      }
    }

    objc_msgSend_setPackages_(self, v124, (uint64_t)v106, v125);
  }
  v132.receiver = self;
  v132.super_class = (Class)CKRepairAssetsOperation;
  return -[CKDatabaseOperation CKOperationShouldRun:](&v132, sel_CKOperationShouldRun_, a3);
}

+ (SEL)daemonInvocationSelector
{
  return sel_performRepairAssetsOperation_withBlock_;
}

- (void)performCKOperation
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  objc_super v23;

  objc_msgSend_assets(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_packages(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_arrayByAddingObjectsFromArray_(v5, v10, (uint64_t)v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_deviceContext(self, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deviceScopedStateManager(v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_trackAssets_(v20, v21, (uint64_t)v12, v22);

  v23.receiver = self;
  v23.super_class = (Class)CKRepairAssetsOperation;
  -[CKOperation performCKOperation](&v23, sel_performCKOperation);

}

- (void)handleAssetRepairCompletionForRecordID:(id)a3 error:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend_CKClientSuitableError(a4, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v11 = (void *)ck_log_facility_data_repair;
  if (os_log_type_enabled((os_log_t)ck_log_facility_data_repair, OS_LOG_TYPE_DEBUG))
  {
    v17 = v11;
    objc_msgSend_operationID(self, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138543874;
    v23 = v21;
    v24 = 2112;
    v25 = v6;
    v26 = 2112;
    v27 = v10;
    _os_log_debug_impl(&dword_18A5C5000, v17, OS_LOG_TYPE_DEBUG, "Operation %{public}@ received progress callback for recordID %@ error %@", (uint8_t *)&v22, 0x20u);

    if (!v10)
      goto LABEL_6;
    goto LABEL_5;
  }
  if (v10)
  {
LABEL_5:
    objc_msgSend_perItemErrorsByRecordID(self, v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v15, v16, (uint64_t)v10, (uint64_t)v6);

  }
LABEL_6:

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
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void (**v39)(_QWORD, _QWORD);
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  NSObject *v46;
  objc_class *v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  objc_super v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  CKRepairAssetsOperation *v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  id v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
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
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v15, OS_SIGNPOST_EVENT, v21, "CKRepairAssetsOperation", "Finishing", buf, 2u);
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

      objc_msgSend_errorWithDomain_code_userInfo_format_(CKPrettyError, v33, (uint64_t)CFSTR("CKInternalErrorDomain"), 1011, v27, CFSTR("Failed to repair some assets"));
      v4 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }
  }
  objc_msgSend_repairAssetsCompletionBlock(self, v7, v8, v9);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v35 = (void *)ck_log_facility_ck;
    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      v46 = v35;
      v47 = (objc_class *)objc_opt_class();
      NSStringFromClass(v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_ckShortDescription(self, v49, v50, v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v55 = v48;
      v56 = 2048;
      v57 = self;
      v58 = 2114;
      v59 = v52;
      v60 = 2112;
      v61 = v4;
      _os_log_debug_impl(&dword_18A5C5000, v46, OS_LOG_TYPE_DEBUG, "Calling repairAssetsCompletionBlock for operation <%{public}@: %p; %{public}@> with error %@",
        buf,
        0x2Au);

    }
    objc_msgSend_repairAssetsCompletionBlock(self, v36, v37, v38);
    v39 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend_CKClientSuitableError(v4, v40, v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v39)[2](v39, v43);

    objc_msgSend_setRepairAssetsCompletionBlock_(self, v44, 0, v45);
  }
  v53.receiver = self;
  v53.super_class = (Class)CKRepairAssetsOperation;
  -[CKOperation _finishOnCallbackQueueWithError:](&v53, sel__finishOnCallbackQueueWithError_, v4);

}

- (id)includedMetadata
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;

  objc_msgSend_assetMetadata(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_packageMetadata(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_arrayByAddingObjectsFromArray_(v5, v10, (uint64_t)v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unavailableAssets(self, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_arrayByAddingObjectsFromArray_(v12, v17, (uint64_t)v16, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unavailablePackages(self, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_arrayByAddingObjectsFromArray_(v19, v24, (uint64_t)v23, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setWithArray_(MEMORY[0x1E0C99E60], v27, (uint64_t)v26, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
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
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v16, "CKRepairAssetsOperation", "ID=%{signpost.description:attribute}@ Container=%{signpost.description:attribute}@ GroupID=%{signpost.description:attribute}@ GroupName=%{signpost.description:attribute,public}@ Behavior=%{signpost.description:attribute,public}@ QoS=%{signpost.description:attribute,public}@ ", (uint8_t *)&v54, 0x3Eu);

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
      _os_signpost_emit_with_name_impl(&dword_18A5C5000, v12, OS_SIGNPOST_INTERVAL_END, v18, "CKRepairAssetsOperation", "Error=%{signpost.description:attribute}@ ", (uint8_t *)&v19, 0xCu);
    }

  }
}

- (id)activityCreate
{
  return _os_activity_create(&dword_18A5C5000, "client/repair-assets", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
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
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v4, v6, (uint64_t)v5, (uint64_t)sel_handleAssetRepairCompletionForRecordID_error_, 1, 0);

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___CKRepairAssetsOperation;
  objc_msgSendSuper2(&v7, sel_applyDaemonCallbackInterfaceTweaks_, v4);

}

- (NSArray)assets
{
  return self->_assets;
}

- (void)setAssets:(id)a3
{
  objc_storeStrong((id *)&self->_assets, a3);
}

- (NSArray)packages
{
  return self->_packages;
}

- (void)setPackages:(id)a3
{
  objc_storeStrong((id *)&self->_packages, a3);
}

- (NSArray)assetMetadata
{
  return self->_assetMetadata;
}

- (void)setAssetMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_assetMetadata, a3);
}

- (NSArray)packageMetadata
{
  return self->_packageMetadata;
}

- (void)setPackageMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_packageMetadata, a3);
}

- (NSArray)unavailableAssets
{
  return self->_unavailableAssets;
}

- (void)setUnavailableAssets:(id)a3
{
  objc_storeStrong((id *)&self->_unavailableAssets, a3);
}

- (NSArray)unavailablePackages
{
  return self->_unavailablePackages;
}

- (void)setUnavailablePackages:(id)a3
{
  objc_storeStrong((id *)&self->_unavailablePackages, a3);
}

- (NSMutableDictionary)perItemErrorsByRecordID
{
  return self->_perItemErrorsByRecordID;
}

- (void)setPerItemErrorsByRecordID:(id)a3
{
  objc_storeStrong((id *)&self->_perItemErrorsByRecordID, a3);
}

- (CKUploadRequestConfiguration)uploadRequestConfiguration
{
  return self->_uploadRequestConfiguration;
}

- (void)setUploadRequestConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 576);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uploadRequestConfiguration, 0);
  objc_storeStrong((id *)&self->_perItemErrorsByRecordID, 0);
  objc_storeStrong((id *)&self->_unavailablePackages, 0);
  objc_storeStrong((id *)&self->_unavailableAssets, 0);
  objc_storeStrong((id *)&self->_packageMetadata, 0);
  objc_storeStrong((id *)&self->_assetMetadata, 0);
  objc_storeStrong((id *)&self->_packages, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong(&self->_repairAssetsCompletionBlock, 0);
}

@end
