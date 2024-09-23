@implementation CKAssetRepairOperationUtilities

+ (id)createRepairOperationGroupWithName:(id)a3
{
  id v3;
  CKOperationConfiguration *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  CKOperationGroup *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;

  v3 = a3;
  v4 = objc_alloc_init(CKOperationConfiguration);
  objc_msgSend_setDiscretionaryNetworkBehavior_(v4, v5, 0, v6);
  objc_msgSend_setAutomaticallyRetryNetworkFailures_(v4, v7, 0, v8);
  objc_msgSend_setQualityOfService_(v4, v9, 17, v10);
  objc_msgSend_setAllowsCellularAccess_(v4, v11, 0, v12);
  objc_msgSend_setRequestOriginator_(v4, v13, 1, v14);
  v15 = objc_alloc_init(CKOperationGroup);
  objc_msgSend_setDefaultConfiguration_(v15, v16, (uint64_t)v4, v17);
  objc_msgSend_setName_(v15, v18, (uint64_t)v3, v19);

  return v15;
}

+ (id)createRepairContainerFromContainer:(id)a3
{
  return (id)objc_msgSend_createRepairContainerFromContainer_withOverrides_(a1, a2, (uint64_t)a3, 0);
}

+ (id)createRepairContainerFromContainer:(id)a3 withOverrides:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  CKContainerID *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  void *v64;
  id v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  void *v71;
  NSObject *v72;
  CKContainer *v73;
  const char *v74;
  int v76;
  id v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend_primaryIdentifier(v5, v7, v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend_resolvedConfigurationWithBaseContainer_overrides_(CKUploadRequestConfiguration, v10, (uint64_t)v5, (uint64_t)v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_opt_new();
    objc_msgSend_options(v5, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_accountOverrideInfo(v17, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setAccountOverrideInfo_(v13, v22, (uint64_t)v21, v23);

    if (__sTestOverridesAvailable)
    {
      objc_msgSend_options(v5, v24, v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_testDeviceReferenceProtocol(v27, v28, v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setTestDeviceReferenceProtocol_(v13, v32, (uint64_t)v31, v33);

      objc_msgSend_options(v5, v34, v35, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_fakeEntitlements(v37, v38, v39, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setFakeEntitlements_(v13, v42, (uint64_t)v41, v43);

    }
    objc_msgSend_setBypassPCSEncryption_(v13, v24, 1, v26);
    objc_msgSend_applicationBundleIdentifierOverride(v12, v44, v45, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setApplicationBundleIdentifierOverride_(v13, v48, (uint64_t)v47, v49);

    v50 = [CKContainerID alloc];
    objc_msgSend_containerIdentifier(v12, v51, v52, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_containerID(v5, v55, v56, v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend_environment(v58, v59, v60, v61);
    v64 = (void *)objc_msgSend_initWithContainerIdentifier_environment_(v50, v63, (uint64_t)v54, v62);

    if (__sTestOverridesAvailable)
    {
      v65 = objc_alloc((Class)sub_18A70E144());
      objc_msgSend_testDeviceReferenceProtocol(v13, v66, v67, v68);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = (void *)objc_msgSend_initWithContainerID_options_testDeviceReferenceProtocol_(v65, v70, (uint64_t)v64, (uint64_t)v13, v69);

    }
    else
    {
      v73 = [CKContainer alloc];
      v71 = (void *)objc_msgSend_initWithContainerID_options_(v73, v74, (uint64_t)v64, (uint64_t)v13);
    }

  }
  else
  {
    if (ck_log_initialization_predicate != -1)
      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
    v72 = ck_log_facility_data_repair;
    if (os_log_type_enabled((os_log_t)ck_log_facility_data_repair, OS_LOG_TYPE_ERROR))
    {
      v76 = 138412290;
      v77 = v5;
      _os_log_error_impl(&dword_18A5C5000, v72, OS_LOG_TYPE_ERROR, "Couldn't get repair container application identifier for container %@", (uint8_t *)&v76, 0xCu);
    }
    v71 = 0;
  }

  return v71;
}

+ (void)clearRepairZoneForDatabase:(id)a3 withRepairContainerOverrides:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_get_global_queue(0, 0);
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_18A7BB2B0;
  v15[3] = &unk_1E1F65578;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v19 = a1;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async(v11, v15);

}

+ (id)repairRecordFromRecord:(id)a3 field:(id)a4 listIndex:(int64_t)a5 repairZoneID:(id)a6
{
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  id v13;
  CKRecordZoneID *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  id v23;
  char isKindOfClass;
  id v25;
  CKRecord *v26;
  const char *v27;
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
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  const char *v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  NSObject *v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  const char *v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  unint64_t v115;
  CKRecord *v116;
  const char *v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  const char *v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  void *v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  const char *v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  void *v143;
  const char *v144;
  const char *v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  const char *v149;
  const char *v150;
  int v152;
  id v153;
  __int16 v154;
  int64_t v155;
  __int16 v156;
  id v157;
  uint64_t v158;

  v158 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v13 = a6;
  if (!v13)
  {
    v14 = [CKRecordZoneID alloc];
    v13 = (id)objc_msgSend_initWithZoneName_ownerName_(v14, v15, (uint64_t)CFSTR("RepairZone"), (uint64_t)CFSTR("__defaultOwner__"));
  }
  objc_msgSend_objectForKeyedSubscript_(v9, v11, (uint64_t)v10, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5 < 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v23 = v16;
      goto LABEL_14;
    }
LABEL_11:

    goto LABEL_18;
  }
  if (objc_msgSend_count(v16, v17, v18, v19) <= a5)
    goto LABEL_11;
  objc_msgSend_objectAtIndex_(v16, v20, a5, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v23 = v22;
  else
    v23 = 0;

LABEL_14:
  if (v23)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v25 = v23;
    if ((isKindOfClass & 1) != 0)
    {
      v26 = [CKRecord alloc];
      v28 = (void *)objc_msgSend_initWithRecordType_zoneID_(v26, v27, (uint64_t)CFSTR("MissingAsset"), (uint64_t)v13);
      objc_msgSend_recordID(v9, v29, v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_zoneID(v32, v33, v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_zoneName(v36, v37, v38, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v28, v41, (uint64_t)v40, (uint64_t)CFSTR("zone"));

      objc_msgSend_recordID(v9, v42, v43, v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordName(v45, v46, v47, v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v28, v50, (uint64_t)v49, (uint64_t)CFSTR("affectedRecordID"));

      objc_msgSend_recordType(v9, v51, v52, v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v28, v55, (uint64_t)v54, (uint64_t)CFSTR("affectedRecordType"));

      objc_msgSend_signature(v25, v56, v57, v58);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v28, v60, (uint64_t)v59, (uint64_t)CFSTR("fileSignature"));

      objc_msgSend_referenceSignature(v25, v61, v62, v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v28, v65, (uint64_t)v64, (uint64_t)CFSTR("referenceSignature"));

      objc_msgSend_setObject_forKeyedSubscript_(v28, v66, (uint64_t)v10, (uint64_t)CFSTR("fieldName"));
      if (a5 < 0)
      {
LABEL_30:

        goto LABEL_31;
      }
      objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v67, a5, v68);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v28, v70, (uint64_t)v69, (uint64_t)CFSTR("listIndex"));
    }
    else
    {
      v69 = (void *)objc_opt_new();
      v72 = (void *)objc_opt_new();
      objc_msgSend_assets(v25, v73, v74, v75);
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = objc_msgSend_count(v76, v77, v78, v79);

      if (v80)
      {
        v84 = 0;
        do
        {
          objc_msgSend_assets(v25, v81, v82, v83);
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectAtIndexedSubscript_(v85, v86, v84, v87);
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_signature(v88, v89, v90, v91);
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v69, v93, (uint64_t)v92, v94);

          objc_msgSend_assets(v25, v95, v96, v97);
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectAtIndexedSubscript_(v98, v99, v84, v100);
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_referenceSignature(v101, v102, v103, v104);
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v72, v106, (uint64_t)v105, v107);

          ++v84;
          objc_msgSend_assets(v25, v108, v109, v110);
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          v115 = objc_msgSend_count(v111, v112, v113, v114);

        }
        while (v84 < v115);
      }
      v116 = [CKRecord alloc];
      v28 = (void *)objc_msgSend_initWithRecordType_zoneID_(v116, v117, (uint64_t)CFSTR("MissingPackage"), (uint64_t)v13);
      objc_msgSend_recordID(v9, v118, v119, v120);
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_zoneID(v121, v122, v123, v124);
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_zoneName(v125, v126, v127, v128);
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v28, v130, (uint64_t)v129, (uint64_t)CFSTR("zone"));

      objc_msgSend_recordID(v9, v131, v132, v133);
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordName(v134, v135, v136, v137);
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v28, v139, (uint64_t)v138, (uint64_t)CFSTR("affectedRecordID"));

      objc_msgSend_recordType(v9, v140, v141, v142);
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v28, v144, (uint64_t)v143, (uint64_t)CFSTR("affectedRecordType"));

      objc_msgSend_setObject_forKeyedSubscript_(v28, v145, (uint64_t)v10, (uint64_t)CFSTR("fieldName"));
      if (objc_msgSend_count(v69, v146, v147, v148))
      {
        objc_msgSend_setObject_forKeyedSubscript_(v28, v149, (uint64_t)v69, (uint64_t)CFSTR("fileSignature"));
        objc_msgSend_setObject_forKeyedSubscript_(v28, v150, (uint64_t)v72, (uint64_t)CFSTR("referenceSignature"));
      }

    }
    goto LABEL_30;
  }
LABEL_18:
  if (ck_log_initialization_predicate != -1)
    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
  v71 = ck_log_facility_data_repair;
  if (os_log_type_enabled((os_log_t)ck_log_facility_data_repair, OS_LOG_TYPE_ERROR))
  {
    v152 = 138412802;
    v153 = v10;
    v154 = 2048;
    v155 = a5;
    v156 = 2112;
    v157 = v9;
    _os_log_error_impl(&dword_18A5C5000, v71, OS_LOG_TYPE_ERROR, "Could not find asset or package in field %@ and index %ld of record %@", (uint8_t *)&v152, 0x20u);
  }
  v28 = 0;
LABEL_31:

  return v28;
}

+ (id)uploadRequestMetadataFromRepairRecord:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  int isEqualToString;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  CKRecordZoneID *v33;
  const char *v34;
  void *v35;
  CKRecordID *v36;
  const char *v37;
  void *v38;
  CKAssetUploadRequestMetadata *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  int v53;
  const char *v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  void *v70;
  CKRecordZoneID *v71;
  const char *v72;
  void *v73;
  CKRecordID *v74;
  const char *v75;
  void *v76;
  CKPackageUploadRequestMetadata *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  void *v83;
  NSObject *v84;
  void *v86;
  void *v87;
  void *v88;
  uint8_t buf[4];
  id v90;
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend_recordType(v3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v7, v8, (uint64_t)CFSTR("MissingAsset"), v9);

  if (isEqualToString)
  {
    objc_msgSend_objectForKeyedSubscript_(v3, v11, (uint64_t)CFSTR("zone"), v13);
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v3, v15, (uint64_t)CFSTR("affectedRecordID"), v16);
    v17 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v3, v18, (uint64_t)CFSTR("affectedRecordType"), v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v3, v21, (uint64_t)CFSTR("fieldName"), v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v3, v24, (uint64_t)CFSTR("fileSignature"), v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v3, v27, (uint64_t)CFSTR("referenceSignature"), v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v3, v30, (uint64_t)CFSTR("listIndex"), v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = [CKRecordZoneID alloc];
    v87 = (void *)v14;
    v35 = (void *)objc_msgSend_initWithZoneName_ownerName_(v33, v34, v14, (uint64_t)CFSTR("__defaultOwner__"));
    v36 = [CKRecordID alloc];
    v86 = (void *)v17;
    v38 = (void *)objc_msgSend_initWithRecordName_zoneID_(v36, v37, v17, (uint64_t)v35);
    v39 = [CKAssetUploadRequestMetadata alloc];
    objc_msgSend_recordID(v3, v40, v41, v42);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      v47 = objc_msgSend_integerValue(v32, v43, v44, v45);
      v49 = objc_msgSend_initWithRepairZoneRecordID_databaseScope_recordID_recordType_fieldName_fileSignature_referenceSignature_listIndex_(v39, v48, (uint64_t)v46, 2, v38, v20, v23, v26, v29, v47);
    }
    else
    {
      v49 = objc_msgSend_initWithRepairZoneRecordID_databaseScope_recordID_recordType_fieldName_fileSignature_referenceSignature_(v39, v43, (uint64_t)v46, 2, v38, v20, v23, v26, v29);
    }
    v83 = (void *)v49;

  }
  else
  {
    objc_msgSend_recordType(v3, v11, v12, v13);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend_isEqualToString_(v50, v51, (uint64_t)CFSTR("MissingPackage"), v52);

    if (v53)
    {
      objc_msgSend_objectForKeyedSubscript_(v3, v54, (uint64_t)CFSTR("zone"), v55);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v3, v56, (uint64_t)CFSTR("affectedRecordID"), v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v3, v59, (uint64_t)CFSTR("affectedRecordType"), v60);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v3, v62, (uint64_t)CFSTR("fieldName"), v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v3, v65, (uint64_t)CFSTR("fileSignature"), v66);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v3, v68, (uint64_t)CFSTR("referenceSignature"), v69);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = [CKRecordZoneID alloc];
      v73 = (void *)objc_msgSend_initWithZoneName_ownerName_(v71, v72, (uint64_t)v88, (uint64_t)CFSTR("__defaultOwner__"));
      v74 = [CKRecordID alloc];
      v76 = (void *)objc_msgSend_initWithRecordName_zoneID_(v74, v75, (uint64_t)v58, (uint64_t)v73);
      v77 = [CKPackageUploadRequestMetadata alloc];
      objc_msgSend_recordID(v3, v78, v79, v80);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = (void *)objc_msgSend_initWithRepairZoneRecordID_databaseScope_recordID_recordType_fieldName_fileSignatures_referenceSignatures_(v77, v82, (uint64_t)v81, 2, v76, v61, v64, v67, v70);

    }
    else
    {
      if (ck_log_initialization_predicate != -1)
        dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
      v84 = ck_log_facility_data_repair;
      if (os_log_type_enabled((os_log_t)ck_log_facility_data_repair, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v90 = v3;
        _os_log_error_impl(&dword_18A5C5000, v84, OS_LOG_TYPE_ERROR, "Invalid record type for repair record %@", buf, 0xCu);
      }
      v83 = 0;
    }
  }

  return v83;
}

+ (BOOL)repairErrorShouldBeMarkedAsBroken:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  int isEqualToString;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  int v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;

  v3 = a3;
  objc_msgSend_domain(v3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v7, v8, (uint64_t)CFSTR("CKErrorDomain"), v9);

  v14 = v3;
  if (isEqualToString)
  {
    objc_msgSend_userInfo(v3, v11, v12, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v15, v16, *MEMORY[0x1E0CB3388], v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend_domain(v14, v11, v12, v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend_isEqualToString_(v18, v19, (uint64_t)CFSTR("CKInternalErrorDomain"), v20);

  if (v21)
    v25 = objc_msgSend_code(v14, v22, v23, v24) == 3012;
  else
    v25 = 0;

  return v25;
}

+ (BOOL)errorIsRetriableInNearFuture:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  int isEqualToString;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  double v34;

  v3 = a3;
  objc_msgSend_domain(v3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v7, v8, (uint64_t)CFSTR("CKErrorDomain"), v9);

  if (isEqualToString)
  {
    v14 = objc_msgSend_code(v3, v11, v12, v13);
    v18 = 0;
    if (v14 <= 0x17 && ((1 << v14) & 0x8000D0) != 0)
    {
      objc_msgSend_userInfo(v3, v15, v16, v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v19, v20, (uint64_t)CFSTR("CKRetryAfter"), v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        objc_msgSend_userInfo(v3, v23, v24, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v26, v27, (uint64_t)CFSTR("CKRetryAfter"), v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_doubleValue(v29, v30, v31, v32);
        v34 = v33;

        v18 = v34 <= 300.0;
      }
      else
      {
        v18 = 1;
      }
    }
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (BOOL)errorShouldTriggerNetworkReachabilityEvent:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  int isEqualToString;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;

  v3 = a3;
  objc_msgSend_domain(v3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v7, v8, (uint64_t)CFSTR("CKErrorDomain"), v9);

  if (isEqualToString)
    v14 = objc_msgSend_code(v3, v11, v12, v13) == 3;
  else
    v14 = 0;

  return v14;
}

@end
