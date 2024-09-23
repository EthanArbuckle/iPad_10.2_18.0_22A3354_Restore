@implementation CKDRepairAssetsOperation

- (CKDRepairAssetsOperation)initWithOperationInfo:(id)a3 container:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  CKDRepairAssetsOperation *v9;
  NSDictionary *v10;
  const char *v11;
  uint64_t v12;
  NSDictionary *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  unint64_t v22;
  void *v23;
  const char *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
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
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  unint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  unint64_t v61;
  void *v62;
  const char *v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  const char *v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  unint64_t v93;
  NSDictionary *assetOrPackageUUIDToMetadata;
  NSDictionary *v95;
  NSDictionary *UUIDToAssetOrPackage;
  NSDictionary *v97;
  const char *v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  void *v103;
  const char *v104;
  NSArray *v105;
  NSArray *unavailableAssetsAndPackages;
  NSArray *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  CKUploadRequestConfiguration *uploadRequestConfiguration;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  NSMutableDictionary *assetOrPackageUUIDToOriginalRecord;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  NSSet *uploadedAssetOrPackageUUIDs;
  objc_super v121;

  v6 = a3;
  v121.receiver = self;
  v121.super_class = (Class)CKDRepairAssetsOperation;
  v9 = -[CKDDatabaseOperation initWithOperationInfo:container:](&v121, sel_initWithOperationInfo_container_, v6, a4);
  if (v9)
  {
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v7, v8);
    v10 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v11, v12);
    v13 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_assets(v6, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend_count(v16, v17, v18);

    if (v19)
    {
      v22 = 0;
      do
      {
        objc_msgSend_assetMetadata(v6, v20, v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v23, v24, v22);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_assets(v6, v26, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v28, v29, v22);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_UUID(v30, v31, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v13, v34, (uint64_t)v25, v33);

        objc_msgSend_assets(v6, v35, v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v37, v38, v22);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_assets(v6, v40, v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v42, v43, v22);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_UUID(v44, v45, v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v10, v48, (uint64_t)v39, v47);

        ++v22;
        objc_msgSend_assets(v6, v49, v50);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = objc_msgSend_count(v51, v52, v53);

      }
      while (v22 < v54);
    }
    objc_msgSend_packages(v6, v20, v21);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend_count(v55, v56, v57);

    if (v58)
    {
      v61 = 0;
      do
      {
        objc_msgSend_packageMetadata(v6, v59, v60);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v62, v63, v61);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_packages(v6, v65, v66);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v67, v68, v61);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_UUID(v69, v70, v71);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v13, v73, (uint64_t)v64, v72);

        objc_msgSend_packages(v6, v74, v75);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v76, v77, v61);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_packages(v6, v79, v80);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v81, v82, v61);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_UUID(v83, v84, v85);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v10, v87, (uint64_t)v78, v86);

        ++v61;
        objc_msgSend_packages(v6, v88, v89);
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        v93 = objc_msgSend_count(v90, v91, v92);

      }
      while (v61 < v93);
    }
    assetOrPackageUUIDToMetadata = v9->_assetOrPackageUUIDToMetadata;
    v9->_assetOrPackageUUIDToMetadata = v13;
    v95 = v13;

    UUIDToAssetOrPackage = v9->_UUIDToAssetOrPackage;
    v9->_UUIDToAssetOrPackage = v10;
    v97 = v10;

    objc_msgSend_unavailableAssets(v6, v98, v99);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_unavailablePackages(v6, v101, v102);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_arrayByAddingObjectsFromArray_(v100, v104, (uint64_t)v103);
    v105 = (NSArray *)objc_claimAutoreleasedReturnValue();

    unavailableAssetsAndPackages = v9->_unavailableAssetsAndPackages;
    v9->_unavailableAssetsAndPackages = v105;
    v107 = v105;

    objc_msgSend_uploadRequestConfiguration(v6, v108, v109);
    v110 = objc_claimAutoreleasedReturnValue();
    uploadRequestConfiguration = v9->_uploadRequestConfiguration;
    v9->_uploadRequestConfiguration = (CKUploadRequestConfiguration *)v110;

    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v112, v113);
    v114 = objc_claimAutoreleasedReturnValue();
    assetOrPackageUUIDToOriginalRecord = v9->_assetOrPackageUUIDToOriginalRecord;
    v9->_assetOrPackageUUIDToOriginalRecord = (NSMutableDictionary *)v114;

    objc_msgSend_set(MEMORY[0x1E0C99E20], v116, v117);
    v118 = objc_claimAutoreleasedReturnValue();
    uploadedAssetOrPackageUUIDs = v9->_uploadedAssetOrPackageUUIDs;
    v9->_uploadedAssetOrPackageUUIDs = (NSSet *)v118;

  }
  return v9;
}

- (id)activityCreate
{
  return _os_activity_create(&dword_1BE990000, "daemon/repair-assets", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
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
      objc_msgSend__fetchAssetMetadata(self, v5, v6);
      break;
    case 2:
      objc_msgSend_setState_(self, v4, 3);
      objc_msgSend__uploadAssetsModify(self, v7, v8);
      break;
    case 3:
      objc_msgSend_setState_(self, v4, 4);
      objc_msgSend__updateMissingAssetServerStatus(self, v9, v10);
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
    return off_1E7838848[a3 - 2];
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___CKDRepairAssetsOperation;
  objc_msgSendSuper2(&v4, sel_nameForState_);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_fetchAssetMetadata
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  const char *v32;
  _QWORD v34[7];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = sub_1BE9BB220;
  v43 = sub_1BE9BAEB8;
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2);
  v44 = (id)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  objc_msgSend_assetOrPackageUUIDToMetadata(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v35, v45, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v36;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v36 != v11)
          objc_enumerationMutation(v6);
        v13 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v12);
        v14 = (void *)v40[5];
        objc_msgSend_assetOrPackageUUIDToMetadata(self, v8, v9);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v15, v16, v13);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_recordID(v17, v18, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKeyedSubscript_(v14, v21, v13, v20);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v8, (uint64_t)&v35, v45, 16);
    }
    while (v10);
  }

  v22 = (void *)objc_opt_new();
  objc_msgSend_allKeys((void *)v40[5], v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRecordIDs_(v22, v26, (uint64_t)v25);

  objc_msgSend_setShouldFetchAssetContent_(v22, v27, 0);
  objc_msgSend_stateTransitionGroup(self, v28, v29);
  v30 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v30);

  v31 = objc_opt_class();
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = sub_1BEC6BFC4;
  v34[3] = &unk_1E78387D8;
  v34[4] = self;
  v34[5] = &v39;
  v34[6] = a2;
  objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(self, v32, v31, v22, v34);

  _Block_object_dispose(&v39, 8);
}

- (void)_uploadAssetsModify
{
  const char *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  dispatch_once_t *v16;
  uint64_t v17;
  os_log_t *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  void *v35;
  objc_class *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  const char *v57;
  id v58;
  id v59;
  const char *v60;
  void *v61;
  const char *v62;
  void *v63;
  const char *v64;
  const char *v65;
  NSObject *v66;
  NSObject *v67;
  id v68;
  id v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  unint64_t v79;
  unint64_t v80;
  id v81;
  const char *v82;
  uint64_t v83;
  const char *v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  void *v93;
  void *v94;
  const char *v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  void *v101;
  const char *v102;
  const char *v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  unint64_t v108;
  void *v109;
  const char *v110;
  id v111;
  id v112;
  const char *v113;
  void *v114;
  const char *v115;
  void *v116;
  const char *v117;
  const char *v118;
  const char *v119;
  const char *v120;
  const char *v121;
  const char *v122;
  const char *v123;
  uint64_t v124;
  NSObject *v125;
  uint64_t v126;
  const char *v127;
  SEL v128;
  void *v129;
  void *v130;
  id v131;
  void *v132;
  void *v133;
  uint64_t v134;
  void *v135;
  uint64_t v136;
  CKDRepairAssetsOperation *v137;
  void *v138;
  uint64_t v139;
  id obj;
  void *v141;
  uint64_t v142;
  void *v143;
  id v144;
  void *v145;
  _QWORD v146[6];
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  uint8_t buf[4];
  void *v152;
  _BYTE v153[128];
  uint64_t v154;

  v128 = a2;
  v154 = *MEMORY[0x1E0C80C00];
  v129 = (void *)objc_opt_new();
  v135 = (void *)objc_opt_new();
  v130 = (void *)objc_opt_new();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v3, v4);
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  v147 = 0u;
  v148 = 0u;
  v149 = 0u;
  v150 = 0u;
  objc_msgSend_assetOrPackageUUIDToMetadata(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_keyEnumerator(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v10;
  v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v147, v153, 16);
  if (v12)
  {
    v15 = v12;
    v16 = (dispatch_once_t *)MEMORY[0x1E0C95300];
    v17 = *(_QWORD *)v148;
    v18 = (os_log_t *)MEMORY[0x1E0C952B8];
    v136 = *(_QWORD *)v148;
    v137 = self;
    do
    {
      v19 = 0;
      v139 = v15;
      do
      {
        if (*(_QWORD *)v148 != v17)
          objc_enumerationMutation(obj);
        v20 = *(_QWORD *)(*((_QWORD *)&v147 + 1) + 8 * v19);
        objc_msgSend_UUIDToAssetOrPackage(self, v13, v14, v128);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v21, v22, v20);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_assetOrPackageUUIDToMetadata(self, v24, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v26, v27, v20);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_assetOrPackageUUIDToOriginalRecord(self, v29, v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v142 = v20;
        objc_msgSend_objectForKeyedSubscript_(v31, v32, v20);
        v33 = objc_claimAutoreleasedReturnValue();

        v143 = (void *)v33;
        if (v33)
        {
          objc_msgSend_assetOrPackageForMetadata_inRecord_(self, v34, (uint64_t)v28, v33);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          if (v35)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v36 = (objc_class *)MEMORY[0x1E0C94BE8];
              v37 = v28;
              v38 = v35;
              v39 = v23;
              v40 = [v36 alloc];
              objc_msgSend_fileSignature(v37, v41, v42);
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_referenceSignature(v37, v44, v45);
              v46 = v35;
              v47 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend_assetKey(v38, v48, v49);
              v50 = (void *)objc_claimAutoreleasedReturnValue();

              v52 = (void *)objc_msgSend_initWithFileSignature_referenceSignature_assetKey_(v40, v51, (uint64_t)v43, v47, v50);
              v35 = v46;
              self = v137;

              v15 = v139;
              objc_msgSend_UUID(v39, v53, v54);
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKeyedSubscript_(v135, v56, (uint64_t)v52, v55);

              objc_msgSend_setRecordID_(v39, v57, 0);
              v58 = objc_alloc(MEMORY[0x1E0C95048]);
              v59 = objc_alloc(MEMORY[0x1E0C95070]);
              v61 = (void *)objc_msgSend_initWithRecordName_(v59, v60, v142);
              v63 = (void *)objc_msgSend_initWithRecordType_recordID_(v58, v62, (uint64_t)CFSTR("asset"), v61);

              v16 = (dispatch_once_t *)MEMORY[0x1E0C95300];
              objc_msgSend_setObject_forKeyedSubscript_(v63, v64, (uint64_t)v39, CFSTR("payload"));

              v17 = v136;
              objc_msgSend_addObject_(v138, v65, (uint64_t)v63);

              v18 = (os_log_t *)MEMORY[0x1E0C952B8];
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v133 = v23;
                v134 = v19;
                v131 = v23;
                v132 = v35;
                v68 = v35;
                v141 = v28;
                v69 = v28;
                v70 = (void *)objc_opt_new();
                objc_msgSend_assets(v68, v71, v72);
                v73 = (void *)objc_claimAutoreleasedReturnValue();
                v76 = objc_msgSend_count(v73, v74, v75);

                v79 = 0x1E0C94000uLL;
                if (v76)
                {
                  v80 = 0;
                  v144 = v69;
                  do
                  {
                    v81 = objc_alloc(*(Class *)(v79 + 3048));
                    objc_msgSend_fileSignatures(v69, v82, v83);
                    v145 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_objectAtIndexedSubscript_(v145, v84, v80);
                    v85 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_referenceSignatures(v69, v86, v87);
                    v88 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_objectAtIndexedSubscript_(v88, v89, v80);
                    v90 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_assets(v68, v91, v92);
                    v93 = v70;
                    v94 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_objectAtIndexedSubscript_(v94, v95, v80);
                    v96 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_assetKey(v96, v97, v98);
                    v99 = (void *)objc_claimAutoreleasedReturnValue();
                    v101 = (void *)objc_msgSend_initWithFileSignature_referenceSignature_assetKey_(v81, v100, (uint64_t)v85, v90, v99);

                    v70 = v93;
                    v69 = v144;

                    objc_msgSend_addObject_(v93, v102, (uint64_t)v101);
                    ++v80;
                    objc_msgSend_assets(v68, v103, v104);
                    v105 = (void *)objc_claimAutoreleasedReturnValue();
                    v108 = objc_msgSend_count(v105, v106, v107);

                    v79 = 0x1E0C94000;
                  }
                  while (v80 < v108);
                }
                objc_msgSend_UUID(v131, v77, v78);
                v109 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_setObject_forKey_(v130, v110, (uint64_t)v70, v109);

                v111 = objc_alloc(MEMORY[0x1E0C95048]);
                v112 = objc_alloc(MEMORY[0x1E0C95070]);
                v114 = (void *)objc_msgSend_initWithRecordName_(v112, v113, v142);
                v116 = (void *)objc_msgSend_initWithRecordType_recordID_(v111, v115, (uint64_t)CFSTR("package"), v114);

                objc_msgSend_setObject_forKeyedSubscript_(v116, v117, (uint64_t)v131, CFSTR("payload"));
                objc_msgSend_addObject_(v138, v118, (uint64_t)v116);

                v17 = v136;
                self = v137;
                v16 = (dispatch_once_t *)MEMORY[0x1E0C95300];
                v18 = (os_log_t *)MEMORY[0x1E0C952B8];
                v15 = v139;
                v23 = v133;
                v19 = v134;
                v28 = v141;
                v35 = v132;
              }
            }
          }
          else
          {
            if (*v16 != -1)
              dispatch_once(v16, (dispatch_block_t)*MEMORY[0x1E0C952F8]);
            v67 = *v18;
            if (os_log_type_enabled(*v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v152 = v23;
              _os_log_error_impl(&dword_1BE990000, v67, OS_LOG_TYPE_ERROR, "Could not find original asset or package for asset or package %@", buf, 0xCu);
            }
          }

        }
        else
        {
          if (*v16 != -1)
            dispatch_once(v16, (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v66 = *v18;
          if (os_log_type_enabled(*v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v152 = v23;
            _os_log_error_impl(&dword_1BE990000, v66, OS_LOG_TYPE_ERROR, "Could not find original record for asset or package %@", buf, 0xCu);
          }
        }

        ++v19;
      }
      while (v19 != v15);
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v147, v153, 16);
    }
    while (v15);
  }

  objc_msgSend_setAssetUUIDToExpectedProperties_(v129, v119, (uint64_t)v135);
  objc_msgSend_setPackageUUIDToExpectedProperties_(v129, v120, (uint64_t)v130);
  objc_msgSend_setShouldOnlySaveAssetContent_(v129, v121, 1);
  objc_msgSend_setRecordsToSave_(v129, v122, (uint64_t)v138);

  objc_msgSend_stateTransitionGroup(self, v123, v124);
  v125 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v125);

  v126 = objc_opt_class();
  v146[0] = MEMORY[0x1E0C809B0];
  v146[1] = 3221225472;
  v146[2] = sub_1BEC6CE80;
  v146[3] = &unk_1E7836FF0;
  v146[4] = self;
  v146[5] = v128;
  objc_msgSend_spawnAndRunOperationOfClass_operationInfo_operationConfigurationBlock_(self, v127, v126, v129, v146);

}

- (void)_updateMissingAssetServerStatus
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  void *v36;
  const char *v37;
  const char *v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  NSObject *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  const char *v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t j;
  void *v64;
  const char *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  const char *v81;
  const char *v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  const char *v94;
  void *v95;
  const char *v96;
  const char *v97;
  id v98;
  void *v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  const char *v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t k;
  void *v110;
  void *v111;
  uint64_t v112;
  const char *v113;
  void *v114;
  const char *v115;
  const char *v116;
  uint64_t v117;
  void *v118;
  const char *v119;
  const char *v120;
  const char *v121;
  const char *v122;
  uint64_t v123;
  const char *v124;
  uint64_t v125;
  const char *v126;
  uint64_t v127;
  const char *v128;
  uint64_t v129;
  void *v130;
  const char *v131;
  uint64_t v132;
  void *v133;
  const char *v134;
  void *v135;
  const char *v136;
  uint64_t v137;
  void *v138;
  uint64_t v139;
  uint64_t v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  const char *v144;
  const char *v145;
  void *v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  const char *v150;
  void *v151;
  const char *v152;
  void *v153;
  const char *v154;
  const char *v155;
  uint64_t v156;
  void *v157;
  const char *v158;
  uint64_t v159;
  const char *v160;
  NSObject *v161;
  uint64_t v162;
  const char *v163;
  uint64_t v164;
  void *v165;
  const char *v166;
  NSObject *v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  NSObject *v174;
  objc_class *v175;
  void *v176;
  const char *v177;
  uint64_t v178;
  void *v179;
  id v180;
  void *v181;
  void *v182;
  void *obj;
  void *v184;
  _QWORD v185[5];
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  _BYTE v202[128];
  void *v203;
  void *v204;
  uint8_t buf[4];
  uint64_t v206;
  __int16 v207;
  CKDRepairAssetsOperation *v208;
  __int16 v209;
  void *v210;
  __int16 v211;
  void *v212;
  _BYTE v213[128];
  _BYTE v214[128];
  _BYTE v215[128];
  uint64_t v216;

  v216 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v184 = (void *)objc_opt_new();
  v198 = 0u;
  v199 = 0u;
  v200 = 0u;
  v201 = 0u;
  objc_msgSend_uploadedAssetOrPackageUUIDs(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v198, v215, 16);
  if (v9)
  {
    v12 = v9;
    v13 = *(_QWORD *)v199;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v199 != v13)
          objc_enumerationMutation(v7);
        v15 = *(_QWORD *)(*((_QWORD *)&v198 + 1) + 8 * i);
        objc_msgSend_assetOrPackageUUIDToMetadata(self, v10, v11);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v16, v17, v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_repairZoneRecordID(v18, v19, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v3, v22, (uint64_t)v21);

      }
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v198, v215, 16);
    }
    while (v12);
  }
  v182 = v3;

  v196 = 0u;
  v197 = 0u;
  v194 = 0u;
  v195 = 0u;
  objc_msgSend_assetOrPackageUUIDToUploadError(self, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v26, (uint64_t)&v194, v214, 16);
  if (v27)
  {
    v30 = v27;
    v31 = *(_QWORD *)v195;
    do
    {
      v32 = 0;
      do
      {
        if (*(_QWORD *)v195 != v31)
          objc_enumerationMutation(v25);
        v33 = *(_QWORD *)(*((_QWORD *)&v194 + 1) + 8 * v32);
        objc_msgSend_assetOrPackageUUIDToUploadError(self, v28, v29);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v34, v35, v33);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend_repairErrorShouldBeMarkedAsBroken_(MEMORY[0x1E0C94BE0], v37, (uint64_t)v36))
        {
          if (*MEMORY[0x1E0C95300] != -1)
            dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
          v39 = (void *)*MEMORY[0x1E0C952B8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B8], OS_LOG_TYPE_INFO))
          {
            v42 = v39;
            v45 = objc_msgSend_code(v36, v43, v44);
            *(_DWORD *)buf = 134217984;
            v206 = v45;
            _os_log_impl(&dword_1BE990000, v42, OS_LOG_TYPE_INFO, "Received error code %ld for repair, so treating as not available", buf, 0xCu);

          }
          objc_msgSend_assetOrPackageUUIDToMetadata(self, v40, v41);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v46, v47, v33);
          v48 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_repairZoneRecordID(v48, v49, v50);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v4, v52, (uint64_t)v51);

        }
        else
        {
          objc_msgSend_addObject_(v184, v38, (uint64_t)v36);
        }

        ++v32;
      }
      while (v30 != v32);
      v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v28, (uint64_t)&v194, v214, 16);
    }
    while (v30);
  }

  v192 = 0u;
  v193 = 0u;
  v190 = 0u;
  v191 = 0u;
  objc_msgSend_unavailableAssetsAndPackages(self, v53, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend_countByEnumeratingWithState_objects_count_(v55, v56, (uint64_t)&v190, v213, 16);
  v60 = v182;
  if (v57)
  {
    v61 = v57;
    v62 = *(_QWORD *)v191;
    do
    {
      for (j = 0; j != v61; ++j)
      {
        if (*(_QWORD *)v191 != v62)
          objc_enumerationMutation(v55);
        objc_msgSend_repairZoneRecordID(*(void **)(*((_QWORD *)&v190 + 1) + 8 * j), v58, v59);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v4, v65, (uint64_t)v64);

      }
      v61 = objc_msgSend_countByEnumeratingWithState_objects_count_(v55, v58, (uint64_t)&v190, v213, 16);
    }
    while (v61);
  }

  v68 = objc_msgSend_count(v182, v66, v67);
  if (objc_msgSend_count(v4, v69, v70) + v68 == 1)
  {
    v73 = objc_msgSend_count(v4, v71, v72);
    v74 = (void *)objc_opt_new();
    if (objc_msgSend_count(v4, v75, v76))
      objc_msgSend_anyObject(v4, v77, v78);
    else
      objc_msgSend_anyObject(v182, v77, v78);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setRepairRecordID_(v74, v80, (uint64_t)v79);

    objc_msgSend_setRecovered_(v74, v81, v73 == 0);
    if (v73)
      goto LABEL_59;
    objc_msgSend_assetOrPackageUUIDToMetadata(self, v82, v83);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_allKeys(v84, v85, v86);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_firstObject(v87, v88, v89);
    v90 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_UUIDToAssetOrPackage(self, v91, v92);
    v93 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_((void *)v93, v94, (uint64_t)v90);
    v95 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    LOBYTE(v93) = objc_opt_isKindOfClass();
    objc_msgSend_setRecovered_(v74, v96, 1);
    v98 = v95;
    if ((v93 & 1) != 0)
    {
      v181 = v90;
      v99 = (void *)objc_opt_new();
      v100 = (void *)objc_opt_new();
      v186 = 0u;
      v187 = 0u;
      v188 = 0u;
      v189 = 0u;
      v180 = v98;
      objc_msgSend_assets(v98, v101, v102);
      obj = (void *)objc_claimAutoreleasedReturnValue();
      v104 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v103, (uint64_t)&v186, v202, 16);
      if (v104)
      {
        v107 = v104;
        v108 = *(_QWORD *)v187;
        do
        {
          for (k = 0; k != v107; ++k)
          {
            if (*(_QWORD *)v187 != v108)
              objc_enumerationMutation(obj);
            v110 = *(void **)(*((_QWORD *)&v186 + 1) + 8 * k);
            v111 = (void *)MEMORY[0x1E0CB37E8];
            v112 = objc_msgSend_size(v110, v105, v106);
            objc_msgSend_numberWithUnsignedLongLong_(v111, v113, v112);
            v114 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObject_(v99, v115, (uint64_t)v114);

            objc_msgSend_uploadReceipt(v110, v116, v117);
            v118 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObject_(v100, v119, (uint64_t)v118);

          }
          v107 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v105, (uint64_t)&v186, v202, 16);
        }
        while (v107);
      }

      objc_msgSend_setIsPackage_(v74, v120, 1);
      objc_msgSend_setAssetSizes_(v74, v121, (uint64_t)v99);
      v60 = v182;
      v98 = v180;
      v90 = v181;
    }
    else
    {
      objc_msgSend_setIsPackage_(v74, v97, 0);
      v146 = (void *)MEMORY[0x1E0CB37E8];
      v149 = objc_msgSend_size(v98, v147, v148);
      objc_msgSend_numberWithUnsignedLongLong_(v146, v150, v149);
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      v204 = v151;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v152, (uint64_t)&v204, 1);
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setAssetSizes_(v74, v154, (uint64_t)v153);

      objc_msgSend_uploadReceipt(v98, v155, v156);
      v157 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v157)
      {
LABEL_58:

LABEL_59:
        objc_msgSend_stateTransitionGroup(self, v82, v83);
        v161 = objc_claimAutoreleasedReturnValue();
        dispatch_group_enter(v161);

        v162 = objc_opt_class();
        objc_msgSend_repairContainer(self, v163, v164);
        v165 = (void *)objc_claimAutoreleasedReturnValue();
        v185[0] = MEMORY[0x1E0C809B0];
        v185[1] = 3221225472;
        v185[2] = sub_1BEC6E3F0;
        v185[3] = &unk_1E782E508;
        v185[4] = self;
        objc_msgSend_spawnAndRunOperationOfClass_operationInfo_spawnQueue_container_operationConfigurationBlock_(self, v166, v162, v74, 0, v165, v185);

        goto LABEL_60;
      }
      objc_msgSend_uploadReceipt(v98, v158, v159);
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      v203 = v99;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v160, (uint64_t)&v203, 1);
      v100 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend_setAssetPutReceipts_(v74, v122, (uint64_t)v100);

    goto LABEL_58;
  }
  v123 = objc_msgSend_count(v182, v71, v72);
  if (v123 + objc_msgSend_count(v4, v124, v125) || !objc_msgSend_count(v184, v126, v127))
  {
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v135 = (void *)*MEMORY[0x1E0C952B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B8], OS_LOG_TYPE_ERROR))
    {
      v167 = v135;
      v170 = objc_msgSend_count(v182, v168, v169);
      v173 = objc_msgSend_count(v4, v171, v172);
      *(_DWORD *)buf = 134217984;
      v206 = v173 + v170;
      _os_log_error_impl(&dword_1BE990000, v167, OS_LOG_TYPE_ERROR, "Wrong amount of repair records to update: %ld", buf, 0xCu);

    }
    v138 = (void *)MEMORY[0x1E0C94FF8];
    v139 = *MEMORY[0x1E0C947D8];
    v140 = objc_msgSend_count(v182, v136, v137);
    v143 = objc_msgSend_count(v4, v141, v142);
    objc_msgSend_errorWithDomain_code_format_(v138, v144, v139, 1001, CFSTR("Wrong amount of repair records to update: %ld"), v143 + v140);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setError_(self, v145, (uint64_t)v74);
  }
  else
  {
    objc_msgSend_anyObject(v184, v128, v129);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    if (*MEMORY[0x1E0C95300] != -1)
      dispatch_once(MEMORY[0x1E0C95300], (dispatch_block_t)*MEMORY[0x1E0C952F8]);
    v130 = (void *)*MEMORY[0x1E0C952B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0C952B8], OS_LOG_TYPE_ERROR))
    {
      v174 = v130;
      v175 = (objc_class *)objc_opt_class();
      NSStringFromClass(v175);
      v176 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_ckShortDescription(self, v177, v178);
      v179 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v206 = (uint64_t)v176;
      v207 = 2048;
      v208 = self;
      v209 = 2114;
      v210 = v179;
      v211 = 2112;
      v212 = v74;
      _os_log_error_impl(&dword_1BE990000, v174, OS_LOG_TYPE_ERROR, "Repair records operation <%{public}@: %p; %{public}@> finished with error %@",
        buf,
        0x2Au);

    }
    objc_msgSend_anyObject(v184, v131, v132);
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setError_(self, v134, (uint64_t)v133);

  }
LABEL_60:

}

- (id)repairContainer
{
  uint64_t v2;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  id v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  CKDApplicationID *v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  void *v45;
  CKDAppContainerTuple *v46;
  const char *v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  void *v65;
  void *v67;
  void *v68;

  objc_msgSend_uploadRequestConfiguration(self, a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerIdentifier(v5, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
  {

    goto LABEL_3;
  }
  v11 = (void *)v8;
  objc_msgSend_uploadRequestConfiguration(self, v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_applicationBundleIdentifierOverride(v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
LABEL_3:
    objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v18, v19, (uint64_t)a2, self, CFSTR("CKDRepairAssetsOperation.m"), 443, CFSTR("Upload request configuration passed to cloudd should have resolved fields"));

  }
  objc_msgSend_uploadRequestConfiguration(self, v16, v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerIdentifier(v20, v21, v22);
  v68 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_container(self, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_alloc(MEMORY[0x1E0C94C40]);
  objc_msgSend_containerID(v25, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend_environment(v29, v30, v31);
  v67 = (void *)objc_msgSend_initWithContainerIdentifier_environment_(v26, v33, (uint64_t)v68, v32);

  objc_msgSend_uploadRequestConfiguration(self, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_applicationBundleIdentifierOverride(v36, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = [CKDApplicationID alloc];
  objc_msgSend_applicationBundleID(v25, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (void *)objc_msgSend_initWithApplicationBundleIdentifier_applicationBundleIdentifierOverrideForContainerAccess_applicationBundleIdentifierOverrideForNetworkAttribution_applicationBundleIdentifierOverrideForPushTopicGeneration_applicationBundleIdentifierOverrideForTCC_(v40, v44, (uint64_t)v43, v39, v39, v39, v39);

  v46 = [CKDAppContainerTuple alloc];
  v48 = (void *)objc_msgSend_initWithApplicationID_containerID_personaID_(v46, v47, (uint64_t)v45, v67, 0);
  objc_msgSend_processScopedClientProxy(v25, v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_logicalDeviceScopedClientProxy(v25, v52, v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_entitlements(v25, v55, v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_options(v25, v58, v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sharedInternalUseContainers(CKDContainer, v61, v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_containerWithAppContainerTuple_processScopedClientProxy_logicalDeviceScopedClientProxy_containerEntitlements_containerOptions_sharedContainerTable_(CKDContainer, v64, (uint64_t)v48, v51, v54, v57, v60, v63);
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  return v65;
}

- (id)assetOrPackageForMetadata:(id)a3 inRecord:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  void *v19;
  id v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  id v24;

  v5 = a3;
  v6 = a4;
  objc_msgSend_fieldName(v5, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v6, v10, (uint64_t)v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend_fieldName(v5, v21, v22);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v6, v23, (uint64_t)v19);
        v20 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      }
    }
    goto LABEL_13;
  }
  v14 = objc_msgSend_listIndex(v5, v12, v13);
  if ((v14 & 0x8000000000000000) == 0)
  {
    v15 = v14;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && v15 < objc_msgSend_count(v11, v16, v17))
    {
      objc_msgSend_objectAtIndex_(v11, v18, v15);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v24 = 0;
        goto LABEL_15;
      }
      v20 = v19;
LABEL_10:
      v24 = v20;
LABEL_15:

      goto LABEL_16;
    }
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_13:
    v24 = 0;
    goto LABEL_16;
  }
  v24 = v11;
LABEL_16:

  return v24;
}

- (void)main
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
  unint64_t v13;
  const char *v14;
  void *v15;
  const char *v16;

  objc_msgSend_UUIDToAssetOrPackage(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_count(v4, v5, v6);
  objc_msgSend_unavailableAssetsAndPackages(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_count(v10, v11, v12) + v7;

  if (v13 >= 2)
  {
    objc_msgSend_errorWithDomain_code_format_(MEMORY[0x1E0C94FF8], v14, *MEMORY[0x1E0C94B20], 1001, CFSTR("Updating multiple records currently not supported"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setError_(self, v16, (uint64_t)v15);

  }
  objc_msgSend_makeStateTransition_(self, v14, v13 != 1);
}

- (void)_finishOnCallbackQueueWithError:(id)a3
{
  id v4;
  const char *v5;
  objc_super v6;

  v4 = a3;
  objc_msgSend_setAssetOrPackageRepairedBlock_(self, v5, 0);
  v6.receiver = self;
  v6.super_class = (Class)CKDRepairAssetsOperation;
  -[CKDOperation _finishOnCallbackQueueWithError:](&v6, sel__finishOnCallbackQueueWithError_, v4);

}

- (id)assetOrPackageRepairedBlock
{
  return self->_assetOrPackageRepairedBlock;
}

- (void)setAssetOrPackageRepairedBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 456);
}

- (CKUploadRequestConfiguration)uploadRequestConfiguration
{
  return self->_uploadRequestConfiguration;
}

- (void)setUploadRequestConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_uploadRequestConfiguration, a3);
}

- (NSDictionary)UUIDToAssetOrPackage
{
  return self->_UUIDToAssetOrPackage;
}

- (void)setUUIDToAssetOrPackage:(id)a3
{
  objc_storeStrong((id *)&self->_UUIDToAssetOrPackage, a3);
}

- (NSDictionary)assetOrPackageUUIDToMetadata
{
  return self->_assetOrPackageUUIDToMetadata;
}

- (void)setAssetOrPackageUUIDToMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_assetOrPackageUUIDToMetadata, a3);
}

- (NSArray)unavailableAssetsAndPackages
{
  return self->_unavailableAssetsAndPackages;
}

- (void)setUnavailableAssetsAndPackages:(id)a3
{
  objc_storeStrong((id *)&self->_unavailableAssetsAndPackages, a3);
}

- (CKDOperation)fetchOperation
{
  return self->_fetchOperation;
}

- (void)setFetchOperation:(id)a3
{
  objc_storeStrong((id *)&self->_fetchOperation, a3);
}

- (CKDOperation)uploadOperation
{
  return self->_uploadOperation;
}

- (void)setUploadOperation:(id)a3
{
  objc_storeStrong((id *)&self->_uploadOperation, a3);
}

- (CKDOperation)updateOperation
{
  return self->_updateOperation;
}

- (void)setUpdateOperation:(id)a3
{
  objc_storeStrong((id *)&self->_updateOperation, a3);
}

- (NSMutableDictionary)assetOrPackageUUIDToOriginalRecord
{
  return self->_assetOrPackageUUIDToOriginalRecord;
}

- (void)setAssetOrPackageUUIDToOriginalRecord:(id)a3
{
  objc_storeStrong((id *)&self->_assetOrPackageUUIDToOriginalRecord, a3);
}

- (NSDictionary)assetOrPackageUUIDToUploadError
{
  return self->_assetOrPackageUUIDToUploadError;
}

- (void)setAssetOrPackageUUIDToUploadError:(id)a3
{
  objc_storeStrong((id *)&self->_assetOrPackageUUIDToUploadError, a3);
}

- (NSSet)uploadedAssetOrPackageUUIDs
{
  return self->_uploadedAssetOrPackageUUIDs;
}

- (void)setUploadedAssetOrPackageUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_uploadedAssetOrPackageUUIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uploadedAssetOrPackageUUIDs, 0);
  objc_storeStrong((id *)&self->_assetOrPackageUUIDToUploadError, 0);
  objc_storeStrong((id *)&self->_assetOrPackageUUIDToOriginalRecord, 0);
  objc_storeStrong((id *)&self->_updateOperation, 0);
  objc_storeStrong((id *)&self->_uploadOperation, 0);
  objc_storeStrong((id *)&self->_fetchOperation, 0);
  objc_storeStrong((id *)&self->_unavailableAssetsAndPackages, 0);
  objc_storeStrong((id *)&self->_assetOrPackageUUIDToMetadata, 0);
  objc_storeStrong((id *)&self->_UUIDToAssetOrPackage, 0);
  objc_storeStrong((id *)&self->_uploadRequestConfiguration, 0);
  objc_storeStrong(&self->_assetOrPackageRepairedBlock, 0);
}

@end
