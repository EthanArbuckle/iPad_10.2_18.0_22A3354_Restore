@implementation CRFDRSeal

- (int64_t)performRealToStagedRepair:(id *)a3 fdrLocal:(__AMFDR *)a4 fdrRemote:(__AMFDR *)a5
{
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  id v39;
  BOOL v40;
  NSObject *v41;
  _BOOL4 v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  NSObject *v56;
  id v57;
  int64_t Instances_patchClasses_patchInstances;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  const char *v84;
  NSObject *v85;
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
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  int PatchExpectedDataWithPartSPC_amfdr_expectedClasses_expectedInstances_expectedValues_expectedDatas_validClasses_validInstances_error;
  const char *v104;
  id v105;
  const char *v106;
  id v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  const char *v116;
  uint64_t v117;
  id v119;
  const char *v120;
  id v121;
  int v122;
  id v123;
  id v124;
  id v125;
  id v126;
  id v127;
  id v128;
  id v129;
  uint8_t buf[16];
  id v131;
  id v132;
  id v133;
  id v134;

  v133 = 0;
  v134 = 0;
  v132 = 0;
  handleForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    sub_21456E1A8(v9, v10, v11, v12, v13, v14, v15, v16);

  objc_msgSend_makeProperties(self, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend_makeProperties(self, v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    AMFDRSetOption();
    AMFDRSetOption();

  }
  objc_msgSend_mergedDataClasses(self, v21, v22, v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_mergedDataInstances(self, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_currentProperties(self, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v131 = 0;
  BYTE2(v122) = 0;
  LOWORD(v122) = objc_msgSend_skipStageEAN(self, v34, v35, v36) ^ 1;
  v38 = objc_msgSend_CRFDRVerifyLocal_fdrRemote_sealedData_mergedDataClasses_mergedDataInstances_currentManifestProperties_fdrError_syncEAN_postSeal_ignoreBenignError_(self, v37, (uint64_t)a4, (uint64_t)a5, 0, v25, v29, v33, &v131, v122);
  v39 = v131;

  v40 = (v38 | (unint64_t)v39) == 0;
  handleForCategory(0);
  v41 = objc_claimAutoreleasedReturnValue();
  v42 = os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT);
  if (v38 | (unint64_t)v39)
  {
    if (v42)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_214503000, v41, OS_LOG_TYPE_DEFAULT, "Local FDR data not verified, continue to recover", buf, 2u);
    }

    v41 = v39;
  }
  else if (v42)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_214503000, v41, OS_LOG_TYPE_DEFAULT, "Local FDR data found and verified", buf, 2u);
  }

  objc_msgSend_patchDataClasses(self, v43, v44, v45);
  v46 = objc_claimAutoreleasedReturnValue();
  if (v46)
  {
    v50 = (void *)v46;
    objc_msgSend_patchDataClasses(self, v47, v48, v49);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend_count(v51, v52, v53, v54);

    if (v55)
    {
      handleForCategory(0);
      v56 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        sub_21456E17C();
      v57 = 0;
LABEL_16:
      Instances_patchClasses_patchInstances = -66;
      goto LABEL_43;
    }
  }
  objc_msgSend_updateProperties(self, v47, v48, v49);
  v59 = objc_claimAutoreleasedReturnValue();
  if (v59)
  {
    v63 = (void *)v59;
    objc_msgSend_updateProperties(self, v60, v61, v62);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = objc_msgSend_count(v64, v65, v66, v67);

    if (v68)
    {
      handleForCategory(0);
      v56 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        sub_21456E150();
      v57 = 0;
      Instances_patchClasses_patchInstances = -89;
      goto LABEL_43;
    }
  }
  v129 = 0;
  objc_msgSend_claimDict(self, v60, v61, v62);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_makeClasses(self, v70, v71, v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_makeInstances(self, v74, v75, v76);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  Instances_patchClasses_patchInstances = objc_msgSend_prefetchPermissionsForStagedSealing_fdrRemote_fdrLocal_claimClassDict_makeClasses_makeInstances_patchClasses_patchInstances_(self, v78, (uint64_t)&v129, (uint64_t)a5, a4, v69, v73, v77, 0, 0);
  v57 = v129;

  if (Instances_patchClasses_patchInstances || v57)
  {
    handleForCategory(0);
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      sub_21456DE84();
  }
  else
  {
    v128 = 0;
    objc_msgSend_claimDict(self, v79, v80, v81);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    Instances_patchClasses_patchInstances = objc_msgSend_performStagedChallengeClaim_fdrLocal_fdrError_claimClassDict_(self, v83, (uint64_t)a5, (uint64_t)a4, &v128, v82);
    v57 = v128;

    if (Instances_patchClasses_patchInstances || v57)
    {
      handleForCategory(0);
      v56 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        sub_21456DEE4();
    }
    else
    {
      if (!v40)
      {
        v127 = 0;
        Instances_patchClasses_patchInstances = objc_msgSend_CRFDRRecoverMissingData_fdrLocal_fdrRemote_(self, v84, (uint64_t)&v127, (uint64_t)a4, a5);
        v119 = v127;
        v57 = v119;
        if (Instances_patchClasses_patchInstances || v119)
        {
          handleForCategory(0);
          v56 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
            sub_21456E090();
          goto LABEL_43;
        }
        v126 = 0;
        Instances_patchClasses_patchInstances = objc_msgSend_performStagedMake_fdrLocal_fdrError_(self, v120, (uint64_t)a5, (uint64_t)a4, &v126);
        v121 = v126;
        v57 = v121;
        if (Instances_patchClasses_patchInstances || v121)
        {
          handleForCategory(0);
          v56 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
            sub_21456E0F0();
          goto LABEL_43;
        }
      }
      handleForCategory(0);
      v85 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_214503000, v85, OS_LOG_TYPE_DEFAULT, "Get all local patch data", buf, 2u);
      }

      objc_msgSend_handler(self, v86, v87, v88);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_partSPC(self, v90, v91, v92);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_mergedDataClasses(self, v94, v95, v96);
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_mergedDataInstances(self, v98, v99, v100);
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      v125 = 0;
      PatchExpectedDataWithPartSPC_amfdr_expectedClasses_expectedInstances_expectedValues_expectedDatas_validClasses_validInstances_error = objc_msgSend_getPatchExpectedDataWithPartSPC_amfdr_expectedClasses_expectedInstances_expectedValues_expectedDatas_validClasses_validInstances_error_(v89, v102, (uint64_t)v93, (uint64_t)a4, &v134, &v133, &v132, 0, v97, v101, &v125);
      v57 = v125;

      if (!PatchExpectedDataWithPartSPC_amfdr_expectedClasses_expectedInstances_expectedValues_expectedDatas_validClasses_validInstances_error
        || v57)
      {
        handleForCategory(0);
        v56 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
          sub_21456E030();
        goto LABEL_16;
      }
      v124 = 0;
      Instances_patchClasses_patchInstances = objc_msgSend_localPatch_dataClasses_dataInstances_values_error_(self, v104, (uint64_t)a4, (uint64_t)v134, v133, v132, &v124);
      v105 = v124;
      v57 = v105;
      if (Instances_patchClasses_patchInstances || v105)
      {
        handleForCategory(0);
        v56 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
          sub_21456DF44();
      }
      else
      {
        v123 = 0;
        Instances_patchClasses_patchInstances = objc_msgSend_performStagedSealing_fdrLocal_fdrError_(self, v106, (uint64_t)a5, (uint64_t)a4, &v123);
        v107 = v123;
        v57 = v107;
        if (Instances_patchClasses_patchInstances || v107)
        {
          handleForCategory(0);
          v56 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
            sub_21456DFA4();
        }
        else
        {
          objc_msgSend_handler(self, v108, v109, v110);
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_partSPC(self, v112, v113, v114);
          v115 = (void *)objc_claimAutoreleasedReturnValue();
          Instances_patchClasses_patchInstances = objc_msgSend_performPostSealingStage_(v111, v116, (uint64_t)v115, v117);

          if (!Instances_patchClasses_patchInstances)
          {
            v57 = 0;
            if (!a3)
              goto LABEL_45;
            goto LABEL_44;
          }
          handleForCategory(0);
          v56 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
            sub_21456E004();
          v57 = 0;
        }
      }
    }
  }
LABEL_43:

  if (a3)
LABEL_44:
    *a3 = objc_retainAutorelease(v57);
LABEL_45:

  return Instances_patchClasses_patchInstances;
}

- (int64_t)performStagedToStagedRepair:(id *)a3 fdrLocal:(__AMFDR *)a4 fdrRemote:(__AMFDR *)a5
{
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
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
  const char *v36;
  uint64_t v37;
  id v38;
  NSObject *v39;
  NSObject *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  const char *v55;
  void *v56;
  int64_t Instances_patchClasses_patchInstances;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  const char *v103;
  uint64_t v104;
  NSObject *v105;
  id v106;
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
  int v118;
  id v119;
  id v120;
  id v121;
  id v122;
  uint8_t buf[4];
  void *v124;
  uint64_t v125;

  v125 = *MEMORY[0x24BDAC8D0];
  handleForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    sub_21456E244(v9, v10, v11, v12, v13, v14, v15, v16);

  objc_msgSend_localManifestProperties(CRFDRUtils, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend_mutableCopy(v20, v21, v22, v23);

  if (v24)
  {
    AMFDRSetOption();
    AMFDRSetOption();
  }
  objc_msgSend_mergedDataClasses(self, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_mergedDataInstances(self, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v122 = 0;
  BYTE2(v118) = 0;
  LOWORD(v118) = objc_msgSend_skipStageEAN(self, v33, v34, v35) ^ 1;
  v37 = objc_msgSend_CRFDRVerifyLocal_fdrRemote_sealedData_mergedDataClasses_mergedDataInstances_currentManifestProperties_fdrError_syncEAN_postSeal_ignoreBenignError_(self, v36, (uint64_t)a4, (uint64_t)a5, 0, v28, v32, v24, &v122, v118);
  v38 = v122;

  handleForCategory(0);
  v39 = objc_claimAutoreleasedReturnValue();
  v40 = v39;
  if (v37 || v38)
  {
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      sub_21456E218();
    v56 = 0;
    Instances_patchClasses_patchInstances = -40;
    goto LABEL_43;
  }
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_214503000, v40, OS_LOG_TYPE_DEFAULT, "Local FDR data found and verified", buf, 2u);
  }

  objc_msgSend_patchDataClasses(self, v41, v42, v43);
  v44 = objc_claimAutoreleasedReturnValue();
  if (v44
    && (v48 = (void *)v44,
        objc_msgSend_patchDataClasses(self, v45, v46, v47),
        v49 = (void *)objc_claimAutoreleasedReturnValue(),
        v53 = objc_msgSend_count(v49, v50, v51, v52),
        v49,
        v48,
        v53))
  {
    handleForCategory(0);
    v54 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v55 = "Patch needed, continue";
LABEL_20:
      _os_log_impl(&dword_214503000, v54, OS_LOG_TYPE_DEFAULT, v55, buf, 2u);
    }
  }
  else
  {
    objc_msgSend_updateProperties(self, v45, v46, v47);
    v58 = objc_claimAutoreleasedReturnValue();
    if (!v58
      || (v62 = (void *)v58,
          objc_msgSend_updateProperties(self, v59, v60, v61),
          v63 = (void *)objc_claimAutoreleasedReturnValue(),
          v67 = objc_msgSend_count(v63, v64, v65, v66),
          v63,
          v62,
          !v67))
    {
      handleForCategory(0);
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_214503000, v40, OS_LOG_TYPE_DEFAULT, "Skip recovery and seal", buf, 2u);
      }
      v56 = 0;
      v38 = 0;
      Instances_patchClasses_patchInstances = 0;
      goto LABEL_43;
    }
    handleForCategory(0);
    v54 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v55 = "Update properties needed, continue";
      goto LABEL_20;
    }
  }

  v121 = 0;
  objc_msgSend_patchDataClasses(self, v68, v69, v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_patchDataInstances(self, v72, v73, v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  Instances_patchClasses_patchInstances = objc_msgSend_prefetchPermissionsForStagedSealing_fdrRemote_fdrLocal_claimClassDict_makeClasses_makeInstances_patchClasses_patchInstances_(self, v76, (uint64_t)&v121, (uint64_t)a5, a4, 0, 0, 0, v71, v75);
  v38 = v121;

  if (Instances_patchClasses_patchInstances || v38)
  {
    handleForCategory(0);
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      sub_21456DE84();
    goto LABEL_42;
  }
  objc_msgSend_patchDataClasses(self, v77, v78, v79);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_patchDataInstances(self, v81, v82, v83);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_patchValues(self, v85, v86, v87);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v120 = 0;
  Instances_patchClasses_patchInstances = objc_msgSend_localPatch_dataClasses_dataInstances_values_error_(self, v89, (uint64_t)a4, (uint64_t)v80, v84, v88, &v120);
  v38 = v120;

  if (Instances_patchClasses_patchInstances || v38)
  {
    handleForCategory(0);
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      sub_21456DF44();
LABEL_42:
    v56 = 0;
    goto LABEL_43;
  }
  objc_msgSend_handler(self, v90, v91, v92);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_partSPC(self, v94, v95, v96);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_updateProperties(self, v98, v99, v100);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_getUpdatePropertyWithPartSPC_propertiesFromParam_(v93, v102, (uint64_t)v97, (uint64_t)v101);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  if (v56)
  {
    objc_msgSend_addEntriesFromDictionary_(v24, v103, (uint64_t)v56, v104);
    handleForCategory(0);
    v105 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v124 = v24;
      _os_log_impl(&dword_214503000, v105, OS_LOG_TYPE_DEFAULT, "Updated properties: %@", buf, 0xCu);
    }

    AMFDRSetOption();
    AMFDRSetOption();
  }
  v119 = 0;
  Instances_patchClasses_patchInstances = objc_msgSend_performStagedSealing_fdrLocal_fdrError_(self, v103, (uint64_t)a5, (uint64_t)a4, &v119);
  v106 = v119;
  v38 = v106;
  if (Instances_patchClasses_patchInstances || v106)
  {
    handleForCategory(0);
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      sub_21456DFA4();
  }
  else
  {
    objc_msgSend_handler(self, v107, v108, v109);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_partSPC(self, v111, v112, v113);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    Instances_patchClasses_patchInstances = objc_msgSend_performPostSealingStage_(v110, v115, (uint64_t)v114, v116);

    if (!Instances_patchClasses_patchInstances)
    {
      v38 = 0;
      if (!a3)
        goto LABEL_45;
      goto LABEL_44;
    }
    handleForCategory(0);
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      sub_21456E004();
    v38 = 0;
  }
LABEL_43:

  if (a3)
LABEL_44:
    *a3 = objc_retainAutorelease(v38);
LABEL_45:

  return Instances_patchClasses_patchInstances;
}

- (BOOL)stageDataClasses:(id)a3 dataInstances:(id)a4 fdrRemote:(__AMFDR *)a5 fdrLocal:(__AMFDR *)a6 fdrError:(id *)a7
{
  id v11;
  id v12;
  const __CFDictionary *v13;
  void *v14;
  id v15;
  NSObject *v16;
  int v17;
  NSObject *v19;
  const __CFDictionary *v20;
  const char *v21;
  NSObject *v22;
  id v23;
  uint8_t buf[8];
  void *v25;

  v11 = a3;
  v12 = a4;
  v25 = 0;
  v13 = (const __CFDictionary *)AMFDRGetOptions();
  if (!v13)
  {
    handleForCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_21456E2B4();
    v14 = 0;
    goto LABEL_8;
  }
  CFDictionaryGetValue(v13, CFSTR("UseSikDataInstance"));
  AMFDRSetOption();
  v14 = (void *)AMFDRDataMultiCopy();
  AMFDRSetOption();
  v15 = v25;
  if (!v14)
  {
    handleForCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_21456E2E0();
    goto LABEL_9;
  }
  handleForCategory(0);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_214503000, v19, OS_LOG_TYPE_DEFAULT, "Get 1.0 data successful", buf, 2u);
  }

  v20 = (const __CFDictionary *)AMFDRGetOptions();
  if (!v20)
  {
    handleForCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_21456E2B4();
LABEL_8:
    v15 = 0;
LABEL_9:
    LOBYTE(v17) = 0;
    goto LABEL_10;
  }
  CFDictionaryGetValue(v20, CFSTR("SignData"));
  AMFDRSetOption();
  v23 = 0;
  v17 = objc_msgSend__commitData_fdrlocal_fdrError_(self, v21, (uint64_t)v14, (uint64_t)a6, &v23);
  v15 = v23;
  AMFDRSetOption();
  handleForCategory(0);
  v22 = objc_claimAutoreleasedReturnValue();
  v16 = v22;
  if (!v17 || v15)
  {
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_21456E340();
  }
  else
  {
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_214503000, v16, OS_LOG_TYPE_DEFAULT, "Staged data successful", buf, 2u);
    }
    v15 = 0;
    LOBYTE(v17) = 1;
  }
LABEL_10:

  if (a7)
    *a7 = objc_retainAutorelease(v15);

  return v17;
}

- (int64_t)prefetchPermissionsForStagedSealing:(id *)a3 fdrRemote:(__AMFDR *)a4 fdrLocal:(__AMFDR *)a5 claimClassDict:(id)a6 makeClasses:(id)a7 makeInstances:(id)a8 patchClasses:(id)a9 patchInstances:(id)a10
{
  id v15;
  void *v16;
  __AMFDR *v17;
  void *v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  const __CFDictionary *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  char appended;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  void *v81;
  char v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  NSObject *v86;
  const char *v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  id *v91;
  void *v92;
  int64_t v93;
  NSObject *v94;
  void *v95;
  const char *v96;
  NSObject *v97;
  const char *v98;
  NSObject *v99;
  void *v100;
  const char *v101;
  const char *v102;
  NSObject *v103;
  void *v104;
  const char *v105;
  const char *v106;
  void *v108;
  id v109;
  id v111;
  id v112;
  id v113;
  id v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  void *v119;
  uint8_t buf[4];
  uint64_t v121;
  uint64_t v122;
  const __CFString *v123;
  uint64_t v124;
  const __CFString *v125;
  _BYTE v126[128];
  uint64_t v127;
  _QWORD v128[3];

  v128[1] = *MEMORY[0x24BDAC8D0];
  v15 = a6;
  v111 = a7;
  v113 = a8;
  v112 = a9;
  v114 = a10;
  v119 = 0;
  v16 = (void *)objc_opt_new();
  v17 = a5;
  v18 = (void *)objc_opt_new();
  objc_msgSend_setLocalAndRemotePermission_fdrRemote_(self, v19, (uint64_t)v17, (uint64_t)a4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend_mutableCopy(v20, v21, v22, v23);
  if (!v24)
  {
    handleForCategory(0);
    v94 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
      sub_21456E3A0();

    v95 = (void *)MEMORY[0x24BDD1540];
    v127 = *MEMORY[0x24BDD0FC8];
    v128[0] = CFSTR("Unable to create LocalAndRemotePermission for Sealing");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v96, (uint64_t)v128, (uint64_t)&v127, 1);
    v97 = objc_claimAutoreleasedReturnValue();
    v93 = -3;
    objc_msgSend_errorWithDomain_code_userInfo_(v95, v98, (uint64_t)CFSTR("com.apple.corerepair"), -3, v97);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = a3;
    v42 = v111;
    goto LABEL_58;
  }
  v108 = v20;
  v117 = 0u;
  v118 = 0u;
  v115 = 0u;
  v116 = 0u;
  v109 = v15;
  v25 = v15;
  v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v26, (uint64_t)&v115, (uint64_t)v126, 16);
  if (v27)
  {
    v30 = v27;
    v31 = *(_QWORD *)v116;
    do
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v116 != v31)
          objc_enumerationMutation(v25);
        v33 = *(_QWORD *)(*((_QWORD *)&v115 + 1) + 8 * i);
        objc_msgSend_objectForKeyedSubscript_(v25, v28, v33, v29);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v16, v35, v33, v36);
        objc_msgSend_addObject_(v18, v37, (uint64_t)v34, v38);

      }
      v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v28, (uint64_t)&v115, (uint64_t)v126, 16);
    }
    while (v30);
  }

  v42 = v111;
  if (v111)
  {
    if (v113)
    {
      v43 = objc_msgSend_count(v111, v39, v40, v41);
      if (v43 == objc_msgSend_count(v113, v44, v45, v46))
      {
        objc_msgSend_addObjectsFromArray_(v16, v39, (uint64_t)v111, v41);
        objc_msgSend_addObjectsFromArray_(v18, v47, (uint64_t)v113, v48);
      }
    }
  }
  if (v16)
  {
    if (v18)
    {
      v49 = objc_msgSend_count(v16, v39, v40, v41);
      if (v49 == objc_msgSend_count(v18, v50, v51, v52))
      {
        v53 = (const __CFDictionary *)AMFDRGetOptions();
        if (!v53)
        {
          handleForCategory(0);
          v97 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
            sub_21456E2B4();
          v92 = 0;
          v93 = -26;
LABEL_54:
          v15 = v109;
          v91 = a3;
          v20 = v108;
          goto LABEL_58;
        }
        CFDictionaryGetValue(v53, CFSTR("UseSikDataInstance"));
        AMFDRSetOption();
        if (objc_msgSend_count(v16, v54, v55, v56))
        {
          v59 = 0;
          while (1)
          {
            objc_msgSend_objectAtIndexedSubscript_(v16, v57, v59, v58);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectAtIndexedSubscript_(v18, v61, v59, v62);
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            appended = AMFDRDataAppendPermissionsString();

            if ((appended & 1) == 0)
              break;
            if (objc_msgSend_count(v16, v65, v66, v67) <= (unint64_t)++v59)
              goto LABEL_21;
          }
          handleForCategory(0);
          v103 = objc_claimAutoreleasedReturnValue();
          v20 = v108;
          v15 = v109;
          if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
            sub_21456E4B8();

          v104 = (void *)MEMORY[0x24BDD1540];
          v124 = *MEMORY[0x24BDD0FC8];
          v125 = CFSTR("AMFDRDataAppendPermissionsString GET 1.0 failed");
          objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v105, (uint64_t)&v125, (uint64_t)&v124, 1);
          v97 = objc_claimAutoreleasedReturnValue();
          v93 = -26;
          objc_msgSend_errorWithDomain_code_userInfo_(v104, v106, (uint64_t)CFSTR("com.apple.corerepair"), -26, v97);
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          v91 = a3;
          goto LABEL_58;
        }
LABEL_21:
        AMFDRSetOption();
      }
    }
  }
  if (v112)
  {
    if (v114)
    {
      v68 = objc_msgSend_count(v112, v39, v40, v41);
      if (v68 == objc_msgSend_count(v114, v69, v70, v71))
      {
        if (objc_msgSend_count(v112, v72, v73, v74))
        {
          v77 = 0;
          while (1)
          {
            objc_msgSend_objectAtIndexedSubscript_(v112, v75, v77, v76);
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectAtIndexedSubscript_(v114, v79, v77, v80);
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            v82 = AMFDRDataAppendPermissionsString();

            if ((v82 & 1) == 0)
              break;
            if (objc_msgSend_count(v112, v83, v84, v85) <= (unint64_t)++v77)
              goto LABEL_29;
          }
          handleForCategory(0);
          v99 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
            sub_21456E48C();

          v100 = (void *)MEMORY[0x24BDD1540];
          v122 = *MEMORY[0x24BDD0FC8];
          v123 = CFSTR("AMFDRDataAppendPermissionsString Patch failed");
          objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v101, (uint64_t)&v123, (uint64_t)&v122, 1);
          v97 = objc_claimAutoreleasedReturnValue();
          v93 = -66;
          objc_msgSend_errorWithDomain_code_userInfo_(v100, v102, (uint64_t)CFSTR("com.apple.corerepair"), -66, v97);
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_54;
        }
      }
    }
  }
LABEL_29:
  handleForCategory(0);
  v86 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v121 = v24;
    _os_log_impl(&dword_214503000, v86, OS_LOG_TYPE_DEFAULT, "Pre loaded PermissionStr For Sealing :%@", buf, 0xCu);
  }

  AMFDRSetOption();
  AMFDRSetOption();
  v20 = v108;
  v15 = v109;
  if ((AMFDRPermissionsRequest() & 1) != 0)
  {
    v91 = a3;
    if ((AMFDRMigrateCredentials() & 1) != 0)
    {
      v92 = 0;
      v93 = 0;
      if (!a3)
        goto LABEL_60;
      goto LABEL_59;
    }
    v92 = v119;
    if (objc_msgSend_getInnermostNSErrorCode_(CRUtils, v89, (uint64_t)v119, v90) == 11)
      v93 = -13;
    else
      v93 = -3;
    handleForCategory(0);
    v97 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
      sub_21456E3CC();
  }
  else
  {
    v92 = v119;
    if (objc_msgSend_getInnermostNSErrorCode_(CRUtils, v87, (uint64_t)v119, v88) == 11)
      v93 = -13;
    else
      v93 = -3;
    handleForCategory(0);
    v97 = objc_claimAutoreleasedReturnValue();
    v91 = a3;
    if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
      sub_21456E42C();
  }
LABEL_58:

  if (v91)
  {
LABEL_59:
    objc_msgSend_getInnermostNSError_(CRUtils, v89, (uint64_t)v92, v90);
    *v91 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_60:
  AMSupportSafeRelease();

  return v93;
}

- (int64_t)performStagedChallengeClaim:(__AMFDR *)a3 fdrLocal:(__AMFDR *)a4 fdrError:(id *)a5 claimClassDict:(id)a6
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  BOOL v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  const char *v33;
  int v34;
  id v35;
  void *v36;
  NSObject *v37;
  const char *v38;
  uint64_t v39;
  int64_t v40;
  NSObject *v41;
  NSObject *v42;
  id v46;
  uint8_t buf[16];
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v8 = a6;
  v9 = (void *)objc_opt_new();
  v10 = (void *)objc_opt_new();
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v11 = v8;
  v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v48, (uint64_t)v52, 16);
  if (v13)
  {
    v16 = v13;
    v17 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v49 != v17)
          objc_enumerationMutation(v11);
        v19 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i);
        objc_msgSend_objectForKeyedSubscript_(v11, v14, v19, v15);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v9, v21, v19, v22);
        objc_msgSend_addObject_(v10, v23, (uint64_t)v20, v24);

      }
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v48, (uint64_t)v52, 16);
    }
    while (v16);
  }

  if (v9)
    v28 = v10 == 0;
  else
    v28 = 1;
  if (!v28 && objc_msgSend_count(v9, v25, v26, v27) && objc_msgSend_count(v10, v29, v30, v31))
  {
    handleForCategory(0);
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_214503000, v32, OS_LOG_TYPE_DEFAULT, "Perform staged CLAIM", buf, 2u);
    }

    v46 = 0;
    v34 = objc_msgSend_stageDataClasses_dataInstances_fdrRemote_fdrLocal_fdrError_(self, v33, (uint64_t)v9, (uint64_t)v10, a3, a4, &v46);
    v35 = v46;
    v36 = v35;
    if (!v34 || v35)
    {
      handleForCategory(0);
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        sub_21456E4E4();

      if (objc_msgSend_getInnermostNSErrorCode_(CRUtils, v38, (uint64_t)v36, v39) == 11)
        v40 = -13;
      else
        v40 = -11;
      if (!a5)
        goto LABEL_32;
LABEL_31:
      *a5 = objc_retainAutorelease(v36);
      goto LABEL_32;
    }
  }
  else
  {
    handleForCategory(0);
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_214503000, v41, OS_LOG_TYPE_DEFAULT, "No claim data, skipping.", buf, 2u);
    }

  }
  handleForCategory(0);
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_214503000, v42, OS_LOG_TYPE_DEFAULT, "Claim and commit local successful", buf, 2u);
  }

  v36 = 0;
  v40 = 0;
  if (a5)
    goto LABEL_31;
LABEL_32:

  return v40;
}

- (int64_t)performStagedMake:(__AMFDR *)a3 fdrLocal:(__AMFDR *)a4 fdrError:(id *)a5
{
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  NSObject *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  int v58;
  id v59;
  NSObject *v60;
  const char *v61;
  uint64_t v62;
  int64_t v63;
  NSObject *v64;
  NSObject *v65;
  void *v67;
  const char *v68;
  void *v69;
  const char *v70;
  id v71;
  uint8_t buf[8];
  uint64_t v73;
  _QWORD v74[2];

  v74[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend_makeClasses(self, a2, (uint64_t)a3, (uint64_t)a4);
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
    goto LABEL_19;
  v13 = (void *)v9;
  objc_msgSend_makeInstances(self, v10, v11, v12);
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v14)
    goto LABEL_18;
  v18 = (void *)v14;
  objc_msgSend_makeClasses(self, v15, v16, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_count(v19, v20, v21, v22))
  {

LABEL_18:
    goto LABEL_19;
  }
  objc_msgSend_makeInstances(self, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend_count(v26, v27, v28, v29);

  if (!v30)
  {
LABEL_19:
    handleForCategory(0);
    v64 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_214503000, v64, OS_LOG_TYPE_DEFAULT, "No make data, skipping.", buf, 2u);
    }

    goto LABEL_22;
  }
  objc_msgSend_makeClasses(self, v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend_count(v34, v35, v36, v37);
  objc_msgSend_makeInstances(self, v39, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend_count(v42, v43, v44, v45);

  handleForCategory(0);
  v47 = objc_claimAutoreleasedReturnValue();
  v48 = v47;
  if (v38 != v46)
  {
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      sub_21456E53C();

    v67 = (void *)MEMORY[0x24BDD1540];
    v73 = *MEMORY[0x24BDD0FC8];
    v74[0] = CFSTR("make classes and instances count mismatched");
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v68, (uint64_t)v74, (uint64_t)&v73, 1);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = -26;
    objc_msgSend_errorWithDomain_code_userInfo_(v67, v70, (uint64_t)CFSTR("com.apple.corerepair"), -26, v69);
    v59 = (id)objc_claimAutoreleasedReturnValue();

    if (a5)
      goto LABEL_25;
    goto LABEL_26;
  }
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_214503000, v48, OS_LOG_TYPE_DEFAULT, "Perform staged MAKE", buf, 2u);
  }

  objc_msgSend_makeClasses(self, v49, v50, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_makeInstances(self, v53, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = 0;
  v58 = objc_msgSend_stageDataClasses_dataInstances_fdrRemote_fdrLocal_fdrError_(self, v57, (uint64_t)v52, (uint64_t)v56, a3, a4, &v71);
  v59 = v71;

  if (!v58 || v59)
  {
    handleForCategory(0);
    v60 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      sub_21456E510();

    if (objc_msgSend_getInnermostNSErrorCode_(CRUtils, v61, (uint64_t)v59, v62) == 11)
      v63 = -13;
    else
      v63 = -26;
    if (!a5)
      goto LABEL_26;
LABEL_25:
    *a5 = objc_retainAutorelease(v59);
    goto LABEL_26;
  }
LABEL_22:
  handleForCategory(0);
  v65 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_214503000, v65, OS_LOG_TYPE_DEFAULT, "Make and commit local successful", buf, 2u);
  }

  v59 = 0;
  v63 = 0;
  if (a5)
    goto LABEL_25;
LABEL_26:

  return v63;
}

- (int64_t)performStagedSealing:(__AMFDR *)a3 fdrLocal:(__AMFDR *)a4 fdrError:(id *)a5
{
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  const char *v14;
  uint64_t v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  int v21;
  const char *v22;
  int64_t v23;
  id v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  const char *v29;
  int DeviceStagedSealedFromEAN_error;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  const char *v34;
  uint64_t v35;
  id v37;
  id v38;
  id v39;
  uint8_t buf[16];

  handleForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_214503000, v9, OS_LOG_TYPE_DEFAULT, "Enable staged seal", buf, 2u);
  }

  AMFDRSetOption();
  AMFDRSetOption();
  v13 = objc_msgSend_skipStageEAN(self, v10, v11, v12);
  v39 = 0;
  v15 = objc_msgSend_CRFDRDataRepairRecover_fdrRemote_syncEAN_fdrError_(self, v14, (uint64_t)a4, (uint64_t)a3, v13 ^ 1u, &v39);
  v16 = v39;
  v20 = v16;
  if (v15 || v16)
  {
    handleForCategory(0);
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      sub_21456E568();

    if (objc_msgSend_getInnermostNSErrorCode_(CRUtils, v34, (uint64_t)v20, v35) == 11)
      v23 = -13;
    else
      v23 = v15;
LABEL_18:
    if (!a5)
      goto LABEL_20;
    goto LABEL_19;
  }
  v21 = objc_msgSend_skipStageEAN(self, v17, v18, v19);
  v38 = 0;
  v23 = objc_msgSend_CRFDRPostRecoverVerify_fdrRemote_syncEAN_fdrError_(self, v22, (uint64_t)a4, (uint64_t)a3, v21 ^ 1u, &v38);
  v24 = v38;
  v20 = v24;
  if (v23 || v24)
    goto LABEL_18;
  v28 = objc_msgSend_skipStageEAN(self, v25, v26, v27);
  v37 = 0;
  DeviceStagedSealedFromEAN_error = objc_msgSend_queryDeviceStagedSealedFromEAN_error_(CRFDRUtils, v29, v28 ^ 1u, (uint64_t)&v37);
  v20 = v37;
  handleForCategory(0);
  v31 = objc_claimAutoreleasedReturnValue();
  v32 = v31;
  if (DeviceStagedSealedFromEAN_error && !v20)
  {
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_214503000, v32, OS_LOG_TYPE_DEFAULT, "Partial Seal Successful", buf, 2u);
    }

    v20 = 0;
    v23 = 0;
    if (!a5)
      goto LABEL_20;
LABEL_19:
    *a5 = objc_retainAutorelease(v20);
    goto LABEL_20;
  }
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    sub_21456E5C8();

  v23 = -40;
  if (a5)
    goto LABEL_19;
LABEL_20:

  return v23;
}

- (CRFDRSeal)init
{
  objc_msgSend_raise_format_(MEMORY[0x24BDBCE88], a2, *MEMORY[0x24BDBCAB0], (uint64_t)CFSTR("Please use initWithParameters"));

  return 0;
}

- (BOOL)_urlsOverrideIsAllowed
{
  void *v3;
  const char *v4;
  char hasEntitlementBoolForTag_inAPTicket;

  if ((MGGetBoolAnswer() & 1) != 0 || !MGGetBoolAnswer())
    return 1;
  v3 = (void *)objc_opt_new();
  hasEntitlementBoolForTag_inAPTicket = objc_msgSend_hasEntitlementBoolForTag_inAPTicket_(v3, v4, 1633776739, (uint64_t)self->apTicketData);

  return hasEntitlementBoolForTag_inAPTicket;
}

- (CRFDRSeal)initWithParameters:(id)a3
{
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  CRFDRSeal *v7;
  NSString *FDRPersistentDataPath;
  NSObject *v9;
  const char *v10;
  NSData *v11;
  NSData *keyBlob;
  const char *v13;
  NSObject *v14;
  const char *v15;
  CRFDRSeal *v16;
  NSString *v18;
  NSString *SOCKSHost;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  NSNumber *v24;
  NSNumber *SOCKSPort;
  const char *v26;
  NSString *v27;
  NSString *v28;
  const char *v29;
  uint64_t v30;
  NSString *v31;
  NSURL *v32;
  NSURL *dataDirectoryURL;
  NSString *v34;
  NSString *KBBSerialNumber;
  const char *v36;
  NSString *v37;
  NSString *KGBSerialNumber;
  const char *v39;
  NSNumber *v40;
  NSNumber *displayMaxDuration;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  CRFDRBaseDeviceHandler *v49;
  CRFDRBaseDeviceHandler *handler;
  const char *v51;
  uint64_t v52;
  uint64_t HasEntitlement;
  const char *v54;
  uint64_t v55;
  const char *v56;
  const char *v57;
  NSObject *v58;
  const char *v59;
  const char *v60;
  const char *v61;
  void *v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  NSArray *v68;
  NSArray *patchDataClasses;
  void *v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  NSArray *v76;
  NSArray *patchDataInstances;
  void *v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  NSArray *v84;
  NSArray *patchValues;
  void *v86;
  const char *v87;
  NSDictionary *v88;
  NSDictionary *updateProperties;
  const char *v90;
  NSSet *v91;
  NSSet *partSPC;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  NSDictionary *v96;
  NSDictionary *metadataDict;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  id v103;
  NSObject *v104;
  NSObject *v105;
  const char *v106;
  NSData *v107;
  id v108;
  NSData *apTicketData;
  void *v110;
  const char *v111;
  uint64_t v112;
  int isHorizonRamdiskBootInApticket;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  NSObject *v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  NSObject *v121;
  id v122;
  NSObject *v123;
  NSObject *v124;
  const char *v125;
  NSData *v126;
  id v127;
  NSData *v128;
  const char *v129;
  NSString *v130;
  NSString *FDRCAURL;
  const char *v132;
  NSString *v133;
  NSString *FDRDSURL;
  const char *v135;
  NSString *v136;
  NSString *FDRSealingURL;
  const char *v138;
  NSString *v139;
  NSObject *trustObjectURL;
  NSObject *v141;
  NSMutableDictionary *v142;
  NSMutableDictionary *postSealingManifest;
  NSMutableDictionary *v144;
  NSMutableDictionary *preSealingManifest;
  NSMutableDictionary *v146;
  NSMutableDictionary *repairStats;
  NSObject *v148;
  id v149;
  id v150;
  id v151;
  id v152;
  objc_super v153;
  char v154;
  uint8_t buf[4];
  NSObject *v156;
  uint64_t v157;

  v157 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v154 = 0;
  if (!objc_msgSend_currentProcessHasEntitlement_(CRFDRSeal, v5, (uint64_t)CFSTR("com.apple.private.corerepair.fdr"), v6))goto LABEL_13;
  v153.receiver = self;
  v153.super_class = (Class)CRFDRSeal;
  v7 = -[CRFDRSeal init](&v153, sel_init);
  self = v7;
  if (!v7)
    goto LABEL_12;
  FDRPersistentDataPath = v7->FDRPersistentDataPath;
  v7->FDRPersistentDataPath = 0;

  handleForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v156 = v4;
    _os_log_impl(&dword_214503000, v9, OS_LOG_TYPE_DEFAULT, "initWithParameters: %@", buf, 0xCu);
  }

  self->doSeal = 1;
  objc_msgSend_NSDataFromKey_defaultValue_failed_(v4, v10, (uint64_t)CFSTR("keyBlob"), 0, &v154);
  v11 = (NSData *)objc_claimAutoreleasedReturnValue();
  keyBlob = self->keyBlob;
  self->keyBlob = v11;

  if (v154)
  {
    handleForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_21456FB08();
LABEL_11:

    goto LABEL_12;
  }
  self->enableProxy = objc_msgSend_BOOLFromKey_defaultValue_failed_(v4, v13, (uint64_t)CFSTR("enableProxy"), 0, &v154);
  if (v154)
  {
    handleForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_21456FADC();
    goto LABEL_11;
  }
  objc_msgSend_NSStringFromKey_defaultValue_failed_(v4, v15, (uint64_t)CFSTR("UseSOCKSHost"), 0, 0);
  v18 = (NSString *)objc_claimAutoreleasedReturnValue();
  SOCKSHost = self->SOCKSHost;
  self->SOCKSHost = v18;

  objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v20, 0x10000, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_NSNumberFromKey_lowerBound_upperBound_defaultValue_failed_(v4, v23, (uint64_t)CFSTR("UseSOCKSPort"), (uint64_t)&unk_24D1B7D10, v22, 0, 0);
  v24 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  SOCKSPort = self->SOCKSPort;
  self->SOCKSPort = v24;

  objc_msgSend_NSStringFromKey_defaultValue_failed_(v4, v26, (uint64_t)CFSTR("datapath"), 0, 0);
  v27 = (NSString *)objc_claimAutoreleasedReturnValue();
  v28 = self->FDRPersistentDataPath;
  self->FDRPersistentDataPath = v27;

  v31 = self->FDRPersistentDataPath;
  if (v31)
  {
    objc_msgSend_URLWithString_(MEMORY[0x24BDBCF48], v29, (uint64_t)v31, v30);
    v32 = (NSURL *)objc_claimAutoreleasedReturnValue();
    dataDirectoryURL = self->dataDirectoryURL;
    self->dataDirectoryURL = v32;

  }
  if (!self->dataDirectoryURL)
  {
    handleForCategory(0);
    v58 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      sub_21456F838();
    goto LABEL_27;
  }
  objc_msgSend_NSStringFromKey_defaultValue_failed_(v4, v29, (uint64_t)CFSTR("KBBSerialNumber"), 0, 0);
  v34 = (NSString *)objc_claimAutoreleasedReturnValue();
  KBBSerialNumber = self->KBBSerialNumber;
  self->KBBSerialNumber = v34;

  objc_msgSend_NSStringFromKey_defaultValue_failed_(v4, v36, (uint64_t)CFSTR("KGBSerialNumber"), 0, 0);
  v37 = (NSString *)objc_claimAutoreleasedReturnValue();
  KGBSerialNumber = self->KGBSerialNumber;
  self->KGBSerialNumber = v37;

  objc_msgSend_NSNumberFromKey_lowerBound_upperBound_defaultValue_failed_(v4, v39, (uint64_t)CFSTR("DisplayMaxDuration"), (uint64_t)&unk_24D1B7D10, &unk_24D1B7D28, &unk_24D1B7D40, 0);
  v40 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  displayMaxDuration = self->displayMaxDuration;
  self->displayMaxDuration = v40;

  objc_msgSend_sharedSingleton(CRFDRDeviceController, v42, v43, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_getHandlerForDevice(v45, v46, v47, v48);
  v49 = (CRFDRBaseDeviceHandler *)objc_claimAutoreleasedReturnValue();
  handler = self->handler;
  self->handler = v49;

  if (!self->handler)
  {
    handleForCategory(0);
    v58 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      sub_21456F864();
LABEL_27:

    v154 = 1;
    goto LABEL_12;
  }
  HasEntitlement = objc_msgSend_currentProcessHasEntitlement_(CRFDRSeal, v51, (uint64_t)CFSTR("com.apple.private.corerepair.factoryservice"), v52);
  objc_msgSend_setAllowFactoryReset_(self->handler, v54, HasEntitlement, v55);
  self->enableStagedSeal = objc_msgSend_BOOLFromKey_defaultValue_failed_(v4, v56, (uint64_t)CFSTR("enableStagedSeal"), 0, &v154);
  if (v154)
  {
    handleForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_21456FAB0();
    goto LABEL_11;
  }
  self->ignoreStagedData = objc_msgSend_BOOLFromKey_defaultValue_failed_(v4, v57, (uint64_t)CFSTR("ignoreStagedData"), 0, &v154);
  if (v154)
  {
    handleForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_21456FA84();
    goto LABEL_11;
  }
  self->_skipStageEAN = objc_msgSend_BOOLFromKey_defaultValue_failed_(v4, v59, (uint64_t)CFSTR("skipStageEAN"), 0, &v154);
  if (v154)
  {
    handleForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_21456FA58();
    goto LABEL_11;
  }
  self->_allowUsedPart = objc_msgSend_BOOLFromKey_defaultValue_failed_(v4, v60, (uint64_t)CFSTR("allowUsedPart"), 0, &v154);
  if (v154)
  {
    handleForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_21456FA2C();
    goto LABEL_11;
  }
  self->_allowSelfService = objc_msgSend_BOOLFromKey_defaultValue_failed_(v4, v61, (uint64_t)CFSTR("allowSelfService"), 0, &v154);
  if (v154)
  {
    handleForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_21456FA00();
    goto LABEL_11;
  }
  v62 = (void *)MEMORY[0x24BDBCF20];
  v63 = objc_opt_class();
  objc_msgSend_setWithObject_(v62, v64, v63, v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_NSArrayFromKey_types_maxLength_defaultValue_failed_(v4, v67, (uint64_t)CFSTR("patchDataClasses"), (uint64_t)v66, 32, 0, &v154);
  v68 = (NSArray *)objc_claimAutoreleasedReturnValue();
  patchDataClasses = self->_patchDataClasses;
  self->_patchDataClasses = v68;

  if (v154)
  {
    handleForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_21456F9D4();
    goto LABEL_11;
  }
  v70 = (void *)MEMORY[0x24BDBCF20];
  v71 = objc_opt_class();
  objc_msgSend_setWithObject_(v70, v72, v71, v73);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_NSArrayFromKey_types_maxLength_defaultValue_failed_(v4, v75, (uint64_t)CFSTR("patchDataInstances"), (uint64_t)v74, 32, 0, &v154);
  v76 = (NSArray *)objc_claimAutoreleasedReturnValue();
  patchDataInstances = self->_patchDataInstances;
  self->_patchDataInstances = v76;

  if (v154)
  {
    handleForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_21456F9A8();
    goto LABEL_11;
  }
  v78 = (void *)MEMORY[0x24BDBCF20];
  v79 = objc_opt_class();
  objc_msgSend_setWithObject_(v78, v80, v79, v81);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_NSArrayFromKey_types_maxLength_defaultValue_failed_(v4, v83, (uint64_t)CFSTR("patchValues"), (uint64_t)v82, 32, 0, &v154);
  v84 = (NSArray *)objc_claimAutoreleasedReturnValue();
  patchValues = self->_patchValues;
  self->_patchValues = v84;

  if (v154)
  {
    handleForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_21456F97C();
    goto LABEL_11;
  }
  v86 = (void *)objc_opt_new();
  objc_msgSend_NSDictionaryFromKey_defaultValue_failed_(v4, v87, (uint64_t)CFSTR("updateProperties"), (uint64_t)v86, &v154);
  v88 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  updateProperties = self->_updateProperties;
  self->_updateProperties = v88;

  if (v154)
  {
    handleForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_21456F950();
    goto LABEL_11;
  }
  objc_msgSend_NSSetFromKey_defaultValue_failed_(v4, v90, (uint64_t)CFSTR("partSPC"), 0, 0);
  v91 = (NSSet *)objc_claimAutoreleasedReturnValue();
  partSPC = self->_partSPC;
  self->_partSPC = v91;

  objc_msgSend__getCRFDRMetaDataDictionary(self, v93, v94, v95);
  v96 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  metadataDict = self->metadataDict;
  self->metadataDict = v96;

  objc_msgSend_sharedDataAccessor(MEMORY[0x24BE63540], v98, v99, v100);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v152 = 0;
  v14 = objc_msgSend_copyPathForPersonalizedData_error_(v101, v102, 2, (uint64_t)&v152);
  v103 = v152;

  handleForCategory(0);
  v104 = objc_claimAutoreleasedReturnValue();
  v105 = v104;
  if (!v14 || v103)
  {
    if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
      sub_21456F890();

    v154 = 1;
    goto LABEL_11;
  }
  if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v156 = v14;
    _os_log_impl(&dword_214503000, v105, OS_LOG_TYPE_DEFAULT, "APTicket path: %@", buf, 0xCu);
  }

  v151 = 0;
  objc_msgSend_dataWithContentsOfFile_options_error_(MEMORY[0x24BDBCE50], v106, (uint64_t)v14, 2, &v151);
  v107 = (NSData *)objc_claimAutoreleasedReturnValue();
  v108 = v151;
  apTicketData = self->apTicketData;
  self->apTicketData = v107;

  if (!self->apTicketData || v108)
  {
    handleForCategory(0);
    v141 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v141, OS_LOG_TYPE_ERROR))
      sub_21456F8F0();

    v154 = 1;
    goto LABEL_11;
  }
  v110 = (void *)objc_opt_new();
  isHorizonRamdiskBootInApticket = objc_msgSend_isHorizonRamdiskBootInApticket_(v110, v111, (uint64_t)self->apTicketData, v112);

  if (!isHorizonRamdiskBootInApticket)
  {
LABEL_68:
    if (objc_msgSend__urlsOverrideIsAllowed(self, v114, v115, v116))
    {
      objc_msgSend_NSStringFromKey_defaultValue_failed_(v4, v129, (uint64_t)CFSTR("CAURL"), 0, 0);
      v130 = (NSString *)objc_claimAutoreleasedReturnValue();
      FDRCAURL = self->FDRCAURL;
      self->FDRCAURL = v130;

      objc_msgSend_NSStringFromKey_defaultValue_failed_(v4, v132, (uint64_t)CFSTR("DSURL"), 0, 0);
      v133 = (NSString *)objc_claimAutoreleasedReturnValue();
      FDRDSURL = self->FDRDSURL;
      self->FDRDSURL = v133;

      objc_msgSend_NSStringFromKey_defaultValue_failed_(v4, v135, (uint64_t)CFSTR("SealingURL"), 0, 0);
      v136 = (NSString *)objc_claimAutoreleasedReturnValue();
      FDRSealingURL = self->FDRSealingURL;
      self->FDRSealingURL = v136;

      objc_msgSend_NSStringFromKey_defaultValue_failed_(v4, v138, (uint64_t)CFSTR("TrustObjectURL"), 0, 0);
      v139 = (NSString *)objc_claimAutoreleasedReturnValue();
      trustObjectURL = self->trustObjectURL;
      self->trustObjectURL = v139;
    }
    else
    {
      handleForCategory(0);
      trustObjectURL = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(trustObjectURL, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_214503000, trustObjectURL, OS_LOG_TYPE_DEFAULT, "No permission for URLs override, default URLs are used", buf, 2u);
      }
    }

    AMSupportLogSetHandler();
    AMSupportLogSetHandler();
    v142 = (NSMutableDictionary *)objc_opt_new();
    postSealingManifest = self->postSealingManifest;
    self->postSealingManifest = v142;

    v144 = (NSMutableDictionary *)objc_opt_new();
    preSealingManifest = self->preSealingManifest;
    self->preSealingManifest = v144;

    v146 = (NSMutableDictionary *)objc_opt_new();
    repairStats = self->repairStats;
    self->repairStats = v146;

    self->sealCount = 0;
    goto LABEL_11;
  }
  handleForCategory(0);
  v117 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v117, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_214503000, v117, OS_LOG_TYPE_DEFAULT, "Ramdisk booting... Fetch local apticket", buf, 2u);
  }

  v118 = (void *)objc_opt_new();
  v150 = 0;
  objc_msgSend_getPathForApTicketWithError_(v118, v119, (uint64_t)&v150, v120);
  v121 = objc_claimAutoreleasedReturnValue();
  v122 = v150;

  handleForCategory(0);
  v123 = objc_claimAutoreleasedReturnValue();
  v124 = v123;
  if (!v121 || v122)
  {
    if (os_log_type_enabled(v123, OS_LOG_TYPE_ERROR))
      sub_21456F890();

    v154 = 1;
  }
  else
  {
    if (os_log_type_enabled(v123, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v156 = v121;
      _os_log_impl(&dword_214503000, v124, OS_LOG_TYPE_DEFAULT, "APTicket path: %@", buf, 0xCu);
    }

    v149 = 0;
    objc_msgSend_dataWithContentsOfFile_options_error_(MEMORY[0x24BDBCE50], v125, (uint64_t)v121, 2, &v149);
    v126 = (NSData *)objc_claimAutoreleasedReturnValue();
    v127 = v149;
    v128 = self->apTicketData;
    self->apTicketData = v126;

    if (self->apTicketData && !v127)
    {
      v14 = v121;
      goto LABEL_68;
    }
    handleForCategory(0);
    v148 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v148, OS_LOG_TYPE_ERROR))
      sub_21456F8F0();

    v154 = 1;
  }

LABEL_12:
  if (!v154)
  {
    self = self;
    v16 = self;
    goto LABEL_14;
  }
LABEL_13:
  v16 = 0;
LABEL_14:

  return v16;
}

- (id)initForRegisterChangeWithParameters:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  CRFDRSeal *v7;
  NSString *FDRPersistentDataPath;
  NSObject *v9;
  const char *v10;
  const char *v11;
  NSString *v12;
  NSString *v13;
  const char *v14;
  uint64_t v15;
  NSString *v16;
  NSURL *v17;
  NSURL *dataDirectoryURL;
  NSDictionary *v19;
  NSDictionary *metadataDict;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  void *v26;
  id v27;
  NSObject *v28;
  NSObject *v29;
  const char *v30;
  NSData *v31;
  id v32;
  NSData *apTicketData;
  void *v34;
  const char *v35;
  uint64_t v36;
  int isHorizonRamdiskBootInApticket;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  id v46;
  NSObject *v47;
  NSObject *v48;
  const char *v49;
  NSData *v50;
  id v51;
  NSData *v52;
  const char *v53;
  NSString *v54;
  NSString *FDRCAURL;
  const char *v56;
  NSString *v57;
  NSString *FDRDSURL;
  const char *v59;
  NSString *v60;
  NSString *FDRSealingURL;
  const char *v62;
  NSString *v63;
  NSObject *trustObjectURL;
  NSObject *v65;
  NSObject *v66;
  CRFDRSeal *v67;
  NSObject *v69;
  id v70;
  id v71;
  id v72;
  id v73;
  objc_super v74;
  char v75;
  uint8_t buf[4];
  id v77;
  uint64_t v78;

  v78 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v75 = 0;
  if (!objc_msgSend_currentProcessHasEntitlement_(CRFDRSeal, v5, (uint64_t)CFSTR("com.apple.private.corerepair.fdr"), v6))goto LABEL_40;
  v74.receiver = self;
  v74.super_class = (Class)CRFDRSeal;
  v7 = -[CRFDRSeal init](&v74, sel_init);
  self = v7;
  if (v7)
  {
    FDRPersistentDataPath = v7->FDRPersistentDataPath;
    v7->FDRPersistentDataPath = 0;

    handleForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v77 = v4;
      _os_log_impl(&dword_214503000, v9, OS_LOG_TYPE_DEFAULT, "initWithParameters: %@", buf, 0xCu);
    }

    self->enableProxy = objc_msgSend_BOOLFromKey_defaultValue_failed_(v4, v10, (uint64_t)CFSTR("enableProxy"), 0, &v75);
    objc_msgSend_NSStringFromKey_defaultValue_failed_(v4, v11, (uint64_t)CFSTR("datapath"), 0, 0);
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    v13 = self->FDRPersistentDataPath;
    self->FDRPersistentDataPath = v12;

    v16 = self->FDRPersistentDataPath;
    if (v16)
    {
      objc_msgSend_URLWithString_(MEMORY[0x24BDBCF48], v14, (uint64_t)v16, v15);
      v17 = (NSURL *)objc_claimAutoreleasedReturnValue();
      dataDirectoryURL = self->dataDirectoryURL;
      self->dataDirectoryURL = v17;

    }
    if (self->dataDirectoryURL)
    {
      objc_msgSend__getCRFDRMetaDataDictionary(self, v14, (uint64_t)v16, v15);
      v19 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      metadataDict = self->metadataDict;
      self->metadataDict = v19;

      objc_msgSend_sharedDataAccessor(MEMORY[0x24BE63540], v21, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = 0;
      v26 = (void *)objc_msgSend_copyPathForPersonalizedData_error_(v24, v25, 2, (uint64_t)&v73);
      v27 = v73;

      handleForCategory(0);
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = v28;
      if (!v26 || v27)
      {
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          sub_21456F890();

        v75 = 1;
        goto LABEL_38;
      }
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v77 = v26;
        _os_log_impl(&dword_214503000, v29, OS_LOG_TYPE_DEFAULT, "APTicket path: %@", buf, 0xCu);
      }

      v72 = 0;
      objc_msgSend_dataWithContentsOfFile_options_error_(MEMORY[0x24BDBCE50], v30, (uint64_t)v26, 2, &v72);
      v31 = (NSData *)objc_claimAutoreleasedReturnValue();
      v32 = v72;
      apTicketData = self->apTicketData;
      self->apTicketData = v31;

      if (!self->apTicketData || v32)
      {
        handleForCategory(0);
        v66 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
          sub_21456F8F0();

        v75 = 1;
        goto LABEL_38;
      }
      v34 = (void *)objc_opt_new();
      isHorizonRamdiskBootInApticket = objc_msgSend_isHorizonRamdiskBootInApticket_(v34, v35, (uint64_t)self->apTicketData, v36);

      if (!isHorizonRamdiskBootInApticket)
      {
LABEL_24:
        if (objc_msgSend__urlsOverrideIsAllowed(self, v38, v39, v40))
        {
          objc_msgSend_NSStringFromKey_defaultValue_failed_(v4, v53, (uint64_t)CFSTR("CAURL"), 0, 0);
          v54 = (NSString *)objc_claimAutoreleasedReturnValue();
          FDRCAURL = self->FDRCAURL;
          self->FDRCAURL = v54;

          objc_msgSend_NSStringFromKey_defaultValue_failed_(v4, v56, (uint64_t)CFSTR("DSURL"), 0, 0);
          v57 = (NSString *)objc_claimAutoreleasedReturnValue();
          FDRDSURL = self->FDRDSURL;
          self->FDRDSURL = v57;

          objc_msgSend_NSStringFromKey_defaultValue_failed_(v4, v59, (uint64_t)CFSTR("SealingURL"), 0, 0);
          v60 = (NSString *)objc_claimAutoreleasedReturnValue();
          FDRSealingURL = self->FDRSealingURL;
          self->FDRSealingURL = v60;

          objc_msgSend_NSStringFromKey_defaultValue_failed_(v4, v62, (uint64_t)CFSTR("TrustObjectURL"), 0, 0);
          v63 = (NSString *)objc_claimAutoreleasedReturnValue();
          trustObjectURL = self->trustObjectURL;
          self->trustObjectURL = v63;
        }
        else
        {
          handleForCategory(0);
          trustObjectURL = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(trustObjectURL, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_214503000, trustObjectURL, OS_LOG_TYPE_DEFAULT, "No permission for URLs override, default URLs are used", buf, 2u);
          }
        }

        AMSupportLogSetHandler();
        AMSupportLogSetHandler();
LABEL_38:

        goto LABEL_39;
      }
      handleForCategory(0);
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_214503000, v41, OS_LOG_TYPE_DEFAULT, "Ramdisk booting... Fetch local apticket", buf, 2u);
      }

      v42 = (void *)objc_opt_new();
      v71 = 0;
      objc_msgSend_getPathForApTicketWithError_(v42, v43, (uint64_t)&v71, v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v71;

      handleForCategory(0);
      v47 = objc_claimAutoreleasedReturnValue();
      v48 = v47;
      if (!v45 || v46)
      {
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
          sub_21456F890();

        v75 = 1;
      }
      else
      {
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v77 = v45;
          _os_log_impl(&dword_214503000, v48, OS_LOG_TYPE_DEFAULT, "APTicket path: %@", buf, 0xCu);
        }

        v70 = 0;
        objc_msgSend_dataWithContentsOfFile_options_error_(MEMORY[0x24BDBCE50], v49, (uint64_t)v45, 2, &v70);
        v50 = (NSData *)objc_claimAutoreleasedReturnValue();
        v51 = v70;
        v52 = self->apTicketData;
        self->apTicketData = v50;

        if (self->apTicketData && !v51)
        {
          v26 = v45;
          goto LABEL_24;
        }
        handleForCategory(0);
        v69 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
          sub_21456F8F0();

        v75 = 1;
      }

    }
    else
    {
      handleForCategory(0);
      v65 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
        sub_21456F838();

      v75 = 1;
    }
  }
LABEL_39:
  if (!v75)
  {
    self = self;
    v67 = self;
    goto LABEL_41;
  }
LABEL_40:
  v67 = 0;
LABEL_41:

  return v67;
}

- (BOOL)generateFinalData
{
  void *v3;
  uint64_t v4;
  BOOL v5;
  BOOL v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  void **p_makeClasses;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  void *v38;
  unint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  char isEqual;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  NSObject *v73;
  const char *v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t v88;
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
  NSObject *v99;
  const char *v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  unint64_t v109;
  void *v110;
  const char *v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  void *v116;
  const char *v117;
  uint64_t v118;
  void *v119;
  NSObject *v120;
  const char *v121;
  uint64_t v122;
  const char *v123;
  uint64_t v124;
  const char *v125;
  uint64_t v126;
  const char *v127;
  uint64_t v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  NSDictionary *v132;
  const char *v133;
  uint64_t v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t i;
  uint64_t v140;
  void *v141;
  const char *v142;
  uint64_t v143;
  void *v144;
  NSObject *v145;
  const char *v146;
  uint64_t v147;
  const char *v148;
  uint64_t v149;
  const char *v150;
  uint64_t v151;
  const char *v152;
  uint64_t v153;
  NSDictionary *v154;
  const char *v155;
  uint64_t v156;
  const char *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t j;
  uint64_t v162;
  void *v163;
  NSObject *v164;
  const char *v165;
  uint64_t v166;
  const char *v167;
  uint64_t v168;
  NSMutableArray *v169;
  NSObject *p_super;
  BOOL v172;
  NSObject *obj;
  id v174;
  id v175;
  NSObject *v176;
  void **location;
  void *v178;
  id v179;
  void *v180;
  NSObject *v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  _BYTE v190[128];
  uint8_t v191[128];
  uint8_t buf[4];
  uint64_t v193;
  __int16 v194;
  void *v195;
  uint64_t v196;

  v196 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v4 = objc_opt_new();
  v179 = (id)v4;
  if (v3)
    v5 = v4 == 0;
  else
    v5 = 1;
  if (v5)
  {
    handleForCategory(0);
    v181 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v181, OS_LOG_TYPE_ERROR))
      sub_21456F6D0();
    v6 = 0;
  }
  else
  {
    v7 = objc_opt_new();
    v8 = objc_opt_new();
    v180 = (void *)v8;
    v181 = v7;
    if (v7)
      v9 = v8 == 0;
    else
      v9 = 1;
    if (v9)
    {
      handleForCategory(0);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_21456F6D0();
      v6 = 0;
    }
    else
    {
      v10 = objc_opt_new();
      v11 = objc_opt_new();
      v12 = (void *)v11;
      if (v10 && v11)
      {
        v13 = objc_opt_new();
        v14 = objc_opt_new();
        v176 = v13;
        v178 = (void *)v14;
        if (v13)
          v18 = v14 == 0;
        else
          v18 = 1;
        v6 = !v18;
        if (v18)
        {
          handleForCategory(0);
          p_super = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
            sub_21456F6D0();
        }
        else
        {
          v172 = v6;
          p_makeClasses = (void **)&self->_makeClasses;
          v175 = v12;
          location = (void **)&self->_makeClasses;
          if (objc_msgSend_count(self->_makeClasses, v15, v16, v17))
          {
            v23 = 0;
            do
            {
              objc_msgSend_objectAtIndexedSubscript_(self->_makeClasses, v20, v23, v22);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectAtIndexedSubscript_(self->_makeInstances, v25, v23, v26);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectForKey_(self->_claimDict, v28, (uint64_t)v24, v29);
              v30 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v30)
              {
                v36 = objc_msgSend_count(self->_currentClasses, v31, v32, v33);
                v37 = v10;
                v38 = v12;
                if (v36)
                {
                  v39 = 0;
                  do
                  {
                    objc_msgSend_objectAtIndexedSubscript_(self->_currentClasses, v34, v39, v35);
                    v40 = (void *)objc_claimAutoreleasedReturnValue();
                    if ((objc_msgSend_isEqual_(v24, v41, (uint64_t)v40, v42) & 1) != 0)
                    {
                      objc_msgSend_objectAtIndexedSubscript_(self->_currentInstances, v43, v39, v44);
                      v45 = (void *)objc_claimAutoreleasedReturnValue();
                      isEqual = objc_msgSend_isEqual_(v27, v46, (uint64_t)v45, v47);

                      if ((isEqual & 1) != 0)
                      {
                        v12 = v175;
                        v37 = v176;
                        v38 = v178;
                        goto LABEL_37;
                      }
                    }
                    else
                    {

                    }
                    ++v39;
                  }
                  while (objc_msgSend_count(self->_currentClasses, v34, v49, v35) > v39);
                  v37 = v10;
                  v12 = v175;
                  v38 = v175;
LABEL_37:
                  p_makeClasses = (void **)&self->_makeClasses;
                }
                objc_msgSend_addObject_(v37, v34, (uint64_t)v24, v35);
                objc_msgSend_addObject_(v38, v50, (uint64_t)v27, v51);
              }

              ++v23;
            }
            while (objc_msgSend_count(*p_makeClasses, v52, v53, v54) > v23);
          }
          if (objc_msgSend_count(self->_currentClasses, v20, v21, v22))
          {
            v58 = 0;
            do
            {
              objc_msgSend_objectAtIndexedSubscript_(self->_currentClasses, v55, v58, v57);
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectAtIndexedSubscript_(self->_currentInstances, v60, v58, v61);
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend_isEqualToString_(v59, v63, (uint64_t)CFSTR("seal"), v64))
              {
                objc_storeStrong((id *)&self->_sealedDataInstance, v62);
              }
              else if ((objc_msgSend_containsObject_(*location, v65, (uint64_t)v59, v66) & 1) == 0)
              {
                objc_msgSend_objectForKey_(self->_updateClassDict, v67, (uint64_t)v59, v68);
                v69 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v69)
                {
                  objc_msgSend_objectForKey_(self->_claimDict, v70, (uint64_t)v59, v71);
                  v72 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v72)
                  {
                    handleForCategory(0);
                    v73 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412546;
                      v193 = (uint64_t)v59;
                      v194 = 2112;
                      v195 = v62;
                      _os_log_impl(&dword_214503000, v73, OS_LOG_TYPE_DEFAULT, "Added current data to merged data: %@-%@", buf, 0x16u);
                    }

                    objc_msgSend_addObject_(v3, v74, (uint64_t)v59, v75);
                    objc_msgSend_addObject_(v179, v76, (uint64_t)v62, v77);
                    objc_msgSend_addObject_(v181, v78, (uint64_t)v59, v79);
                    objc_msgSend_addObject_(v180, v80, (uint64_t)v62, v81);
                  }
                }
              }

              ++v58;
            }
            while (objc_msgSend_count(self->_currentClasses, v82, v83, v84) > v58);
          }
          if (objc_msgSend_count(v10, v55, v56, v57))
          {
            v88 = 0;
            do
            {
              objc_msgSend_objectAtIndexedSubscript_(v10, v85, v88, v87);
              v89 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectAtIndexedSubscript_(v12, v90, v88, v91);
              v92 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectForKey_(self->_updateClassDict, v93, (uint64_t)v89, v94);
              v95 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v95)
              {
                objc_msgSend_objectForKey_(self->_claimDict, v96, (uint64_t)v89, v97);
                v98 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v98)
                {
                  handleForCategory(0);
                  v99 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    v193 = (uint64_t)v89;
                    v194 = 2112;
                    v195 = v92;
                    _os_log_impl(&dword_214503000, v99, OS_LOG_TYPE_DEFAULT, "Added make data to merged data: %@-%@", buf, 0x16u);
                  }

                  objc_msgSend_addObject_(v181, v100, (uint64_t)v89, v101);
                  objc_msgSend_addObject_(v180, v102, (uint64_t)v92, v103);
                }
              }

              ++v88;
            }
            while (objc_msgSend_count(v10, v104, v105, v106) > v88);
          }
          if (objc_msgSend_count(v176, v85, v86, v87))
          {
            v109 = 0;
            do
            {
              objc_msgSend_objectAtIndexedSubscript_(v176, v107, v109, v108);
              v110 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectAtIndexedSubscript_(v178, v111, v109, v112);
              v113 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectForKey_(self->_updateClassDict, v114, (uint64_t)v110, v115);
              v116 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v116)
              {
                objc_msgSend_objectForKey_(self->_claimDict, v117, (uint64_t)v110, v118);
                v119 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v119)
                {
                  handleForCategory(0);
                  v120 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    v193 = (uint64_t)v110;
                    v194 = 2112;
                    v195 = v113;
                    _os_log_impl(&dword_214503000, v120, OS_LOG_TYPE_DEFAULT, "Added non-make data to merged data: %@-%@", buf, 0x16u);
                  }

                  objc_msgSend_addObject_(v3, v121, (uint64_t)v110, v122);
                  objc_msgSend_addObject_(v179, v123, (uint64_t)v113, v124);
                  objc_msgSend_addObject_(v181, v125, (uint64_t)v110, v126);
                  objc_msgSend_addObject_(v180, v127, (uint64_t)v113, v128);
                }
              }

              ++v109;
            }
            while (objc_msgSend_count(v176, v129, v130, v131) > v109);
          }
          obj = v10;
          v188 = 0u;
          v189 = 0u;
          v186 = 0u;
          v187 = 0u;
          v132 = self->_updateClassDict;
          v134 = objc_msgSend_countByEnumeratingWithState_objects_count_(v132, v133, (uint64_t)&v186, (uint64_t)v191, 16);
          if (v134)
          {
            v137 = v134;
            v138 = *(_QWORD *)v187;
            do
            {
              for (i = 0; i != v137; ++i)
              {
                if (*(_QWORD *)v187 != v138)
                  objc_enumerationMutation(v132);
                v140 = *(_QWORD *)(*((_QWORD *)&v186 + 1) + 8 * i);
                objc_msgSend_objectForKeyedSubscript_(self->_updateClassDict, v135, v140, v136);
                v141 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_objectForKey_(self->_claimDict, v142, v140, v143);
                v144 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v144)
                {
                  handleForCategory(0);
                  v145 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v145, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    v193 = v140;
                    v194 = 2112;
                    v195 = v141;
                    _os_log_impl(&dword_214503000, v145, OS_LOG_TYPE_DEFAULT, "Added update data to merged data: %@-%@", buf, 0x16u);
                  }

                  objc_msgSend_addObject_(v3, v146, v140, v147);
                  objc_msgSend_addObject_(v179, v148, (uint64_t)v141, v149);
                  objc_msgSend_addObject_(v181, v150, v140, v151);
                  objc_msgSend_addObject_(v180, v152, (uint64_t)v141, v153);
                }

              }
              v137 = objc_msgSend_countByEnumeratingWithState_objects_count_(v132, v135, (uint64_t)&v186, (uint64_t)v191, 16);
            }
            while (v137);
          }
          v174 = v3;

          v184 = 0u;
          v185 = 0u;
          v182 = 0u;
          v183 = 0u;
          v154 = self->_claimDict;
          v156 = objc_msgSend_countByEnumeratingWithState_objects_count_(v154, v155, (uint64_t)&v182, (uint64_t)v190, 16);
          if (v156)
          {
            v159 = v156;
            v160 = *(_QWORD *)v183;
            do
            {
              for (j = 0; j != v159; ++j)
              {
                if (*(_QWORD *)v183 != v160)
                  objc_enumerationMutation(v154);
                v162 = *(_QWORD *)(*((_QWORD *)&v182 + 1) + 8 * j);
                objc_msgSend_objectForKeyedSubscript_(self->_claimDict, v157, v162, v158);
                v163 = (void *)objc_claimAutoreleasedReturnValue();
                handleForCategory(0);
                v164 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v164, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  v193 = v162;
                  v194 = 2112;
                  v195 = v163;
                  _os_log_impl(&dword_214503000, v164, OS_LOG_TYPE_DEFAULT, "Added claim data to merged data: %@-%@", buf, 0x16u);
                }

                objc_msgSend_addObject_(v181, v165, v162, v166);
                objc_msgSend_addObject_(v180, v167, (uint64_t)v163, v168);

              }
              v159 = objc_msgSend_countByEnumeratingWithState_objects_count_(v154, v157, (uint64_t)&v182, (uint64_t)v190, 16);
            }
            while (v159);
          }

          v10 = obj;
          objc_storeStrong(location, obj);
          v12 = v175;
          objc_storeStrong((id *)&self->_makeInstances, v175);
          v3 = v174;
          objc_storeStrong((id *)&self->_recoverDataClasses, v174);
          objc_storeStrong((id *)&self->_recoverDataInstances, v179);
          objc_storeStrong((id *)&self->_mergedDataClasses, v181);
          v169 = v180;
          p_super = &self->_mergedDataInstances->super.super;
          self->_mergedDataInstances = v169;
          v6 = v172;
        }

      }
      else
      {
        handleForCategory(0);
        v176 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v176, OS_LOG_TYPE_ERROR))
          sub_21456F6D0();
        v6 = 0;
      }

    }
  }

  return v6;
}

- (int64_t)registerChangeForComponent:(id)a3 fdrError:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  int64_t v15;
  NSObject *v16;

  v6 = a3;
  objc_msgSend_getRegisterChangeDictUsingComponentAuthName_(CRFDRBaseDeviceHandler, v7, (uint64_t)v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v9;
  if (v9 && objc_msgSend_count(v9, v10, v11, v12))
  {
    v15 = objc_msgSend_sealWithDataClass_fdrError_registerOnly_(self, v14, (uint64_t)v13, (uint64_t)a4, 1);
  }
  else
  {
    handleForCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_21456FB34();

    v15 = -12;
  }

  return v15;
}

- (int64_t)seal:(id *)a3 oldSealingManifest:(id *)a4 newSealingManifest:(id *)a5 stats:(id *)a6
{
  CRFDRBaseDeviceHandler *handler;
  NSSet *partSPC;
  NSDictionary *v13;
  id v14;
  NSDictionary *claimDict;
  NSObject *v16;
  NSDictionary *v17;
  const char *v18;
  int64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  NSMutableDictionary *postSealingManifest;
  NSMutableDictionary **p_postSealingManifest;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void **p_repairStats;
  NSObject *v30;
  void *v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  const char *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  const char *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  NSSet *v55;
  const char *v56;
  NSString *failedSPC;
  id v59;
  uint8_t buf[4];
  NSDictionary *v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  handler = self->handler;
  partSPC = self->_partSPC;
  v59 = 0;
  objc_msgSend_getClaimDataClassesAndInstancesWithPartSPC_withError_(handler, a2, (uint64_t)partSPC, (uint64_t)&v59);
  v13 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  v14 = v59;
  claimDict = self->_claimDict;
  self->_claimDict = v13;

  handleForCategory(0);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = self->_claimDict;
    *(_DWORD *)buf = 138412290;
    v61 = v17;
    _os_log_impl(&dword_214503000, v16, OS_LOG_TYPE_DEFAULT, "Claim classes: %@", buf, 0xCu);
  }

  if (!self->handler || v14)
  {
    handleForCategory(0);
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      sub_21456FB94();

    if (a3)
      *a3 = objc_retainAutorelease(v14);
    v19 = -11;
  }
  else
  {
    v19 = objc_msgSend_sealWithDataClass_fdrError_registerOnly_(self, v18, (uint64_t)self->_claimDict, (uint64_t)a3, 0);
    if (MGGetBoolAnswer())
    {
      if (a4)
        objc_storeStrong(a4, self->preSealingManifest);
      if (a5)
      {
        p_postSealingManifest = &self->postSealingManifest;
        postSealingManifest = self->postSealingManifest;
        if (!postSealingManifest || !objc_msgSend_count(postSealingManifest, v20, v21, v22))
          p_postSealingManifest = &self->preSealingManifest;
        objc_storeStrong(a5, *p_postSealingManifest);
      }
    }
    objc_msgSend_allObjects(self->_partSPC, v20, v21, v22);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      p_repairStats = (void **)&self->repairStats;
      objc_msgSend_setObject_forKeyedSubscript_(self->repairStats, v25, (uint64_t)v28, (uint64_t)CFSTR("partSPC"));
    }
    else
    {
      objc_msgSend_null(MEMORY[0x24BDBCEF8], v25, v26, v27);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      p_repairStats = (void **)&self->repairStats;
      objc_msgSend_setObject_forKeyedSubscript_(self->repairStats, v32, (uint64_t)v31, (uint64_t)CFSTR("partSPC"));

    }
    objc_msgSend_numberWithInt_(MEMORY[0x24BDD16E0], v33, self->sealCount, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(self->repairStats, v36, (uint64_t)v35, (uint64_t)CFSTR("SealCount"));

    v40 = (void *)MGGetStringAnswer();
    if (v40)
    {
      objc_msgSend_setObject_forKeyedSubscript_(*p_repairStats, v37, (uint64_t)v40, (uint64_t)CFSTR("ProductType"));
    }
    else
    {
      objc_msgSend_null(MEMORY[0x24BDBCEF8], v37, v38, v39);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(*p_repairStats, v42, (uint64_t)v41, (uint64_t)CFSTR("ProductType"));

    }
    objc_msgSend_summarizePatchInputs(self, v43, v44, v45);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (v49)
    {
      objc_msgSend_setObject_forKeyedSubscript_(*p_repairStats, v46, (uint64_t)v49, (uint64_t)CFSTR("patchInputs"));
    }
    else
    {
      objc_msgSend_null(MEMORY[0x24BDBCEF8], v46, v47, v48);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(*p_repairStats, v51, (uint64_t)v50, (uint64_t)CFSTR("patchInputs"));

    }
    v55 = self->_partSPC;
    if (v55)
    {
      if ((unint64_t)objc_msgSend_count(v55, v52, v53, v54) >= 2)
      {
        failedSPC = self->_failedSPC;
        if (failedSPC)
          objc_msgSend_setObject_forKeyedSubscript_(*p_repairStats, v56, (uint64_t)failedSPC, (uint64_t)CFSTR("failedSPC"));
      }
    }
    if (a6)
      objc_storeStrong(a6, *p_repairStats);
  }

  return v19;
}

- (int64_t)prefetchPermissionsWith:(__AMFDR *)a3 returnError:(id *)a4
{
  CFMutableStringRef Mutable;
  NSString *v7;
  NSString *sealedDataInstance;
  __CFString *v9;
  uint64_t v10;
  void *v11;
  char appended;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  int64_t v17;
  uint8_t buf[4];
  CFMutableStringRef v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  Mutable = CFStringCreateMutable(0, 0);
  v7 = (NSString *)AMFDRSealingMapCopyInstanceForClass();
  sealedDataInstance = self->_sealedDataInstance;
  self->_sealedDataInstance = v7;

  if (!self->_sealedDataInstance)
  {
    v9 = CFSTR("Could not get Sealed Data Instance");
    v10 = -42;
LABEL_3:
    sub_214512470((void *)v10, v9, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_11;
  }
  appended = AMFDRDataAppendPermissionsString();
  if (Mutable && (appended & 1) != 0)
  {
    handleForCategory(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = Mutable;
      _os_log_impl(&dword_214503000, v13, OS_LOG_TYPE_DEFAULT, "Pre loaded PermissionStr:%@", buf, 0xCu);
    }

    AMFDRSetOption();
    if ((AMFDRPermissionsRequest() & 1) == 0)
    {
      v9 = CFSTR("Failed to request FDR permissions");
      v10 = -83;
      goto LABEL_3;
    }
    v11 = 0;
  }
  else
  {
    sub_214512470((void *)0xFFFFFFFFFFFFFFACLL, CFSTR("AMFDRCreatePermissionsString GET Seal failed"), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_11:
  if (a4)
    *a4 = objc_retainAutorelease(v11);
  AMSupportSafeRelease();
  if (v11)
    v17 = objc_msgSend_code(v11, v14, v15, v16);
  else
    v17 = 0;

  return v17;
}

- (int64_t)prefetchPermissionsForSealing:(id *)a3 fdrRemote:(__AMFDR *)a4 fdrLocal:(__AMFDR *)a5 claimClassDict:(id)a6 makeClasses:(id)a7 makeInstances:(id)a8 patchClasses:(id)a9 patchInstances:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  const char *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  char v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  unint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  char appended;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  NSObject *v68;
  void *v69;
  id *v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  int64_t v75;
  __AMFDR *v77;
  void *v78;
  id v79;
  void *v80;
  id v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  void *v87;
  uint8_t buf[4];
  uint64_t v89;
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x24BDAC8D0];
  v15 = a6;
  v16 = a7;
  v82 = a8;
  v17 = a9;
  v18 = a10;
  v87 = 0;
  objc_msgSend_setLocalAndRemotePermission_fdrRemote_(self, v19, (uint64_t)a5, (uint64_t)a4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend_mutableCopy(v20, v21, v22, v23);
  if (!v24)
  {
    sub_214512470((void *)0xFFFFFFFFFFFFFFACLL, CFSTR("Unable to create LocalAndRemotePermission for Sealing"), 0);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_35;
  }
  v77 = a5;
  v78 = v20;
  v79 = v15;
  v80 = v18;
  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  v25 = v15;
  v27 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v26, (uint64_t)&v83, (uint64_t)v90, 16);
  if (v27)
  {
    v30 = v27;
    v31 = *(_QWORD *)v84;
    while (2)
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v84 != v31)
          objc_enumerationMutation(v25);
        objc_msgSend_objectForKeyedSubscript_(v25, v28, *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * i), v29, v77);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (!AMFDRAppendPermissionsString())
        {
          sub_214512470((void *)0xFFFFFFFFFFFFFFACLL, CFSTR("AMFDRDataAppendPermissionsString Claim failed"), 0);
          v69 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_30;
        }

      }
      v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v28, (uint64_t)&v83, (uint64_t)v90, 16);
      if (v30)
        continue;
      break;
    }
  }

  if (!v16
    || !v82
    || (v37 = objc_msgSend_count(v16, v34, v35, v36), v37 != objc_msgSend_count(v82, v38, v39, v40))
    || !objc_msgSend_count(v16, v34, v35, v36))
  {
LABEL_17:
    v15 = v79;
    v18 = v80;
    if (v17)
    {
      if (v80)
      {
        v50 = objc_msgSend_count(v17, v34, v35, v36);
        if (v50 == objc_msgSend_count(v80, v51, v52, v53))
        {
          if (objc_msgSend_count(v17, v54, v55, v56))
          {
            v59 = 0;
            while (1)
            {
              objc_msgSend_objectAtIndexedSubscript_(v17, v57, v59, v58, v77);
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectAtIndexedSubscript_(v18, v61, v59, v62);
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              appended = AMFDRDataAppendPermissionsString();

              if ((appended & 1) == 0)
                break;
              ++v59;
              v18 = v80;
              if (objc_msgSend_count(v17, v65, v66, v67) <= v59)
                goto LABEL_24;
            }
            sub_214512470((void *)0xFFFFFFFFFFFFFFACLL, CFSTR("AMFDRDataAppendPermissionsString Patch failed"), 0);
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_31;
          }
        }
      }
    }
LABEL_24:
    handleForCategory(0);
    v68 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v89 = v24;
      _os_log_impl(&dword_214503000, v68, OS_LOG_TYPE_DEFAULT, "Pre loaded PermissionStr For Sealing :%@", buf, 0xCu);
    }

    AMFDRSetOption();
    AMFDRSetOption();
    v20 = v78;
    if ((AMFDRPermissionsRequest() & 1) != 0 && (AMFDRMigrateCredentials() & 1) != 0)
    {
      v69 = 0;
    }
    else
    {
      v71 = v87;
      sub_214512470((void *)0xFFFFFFFFFFFFFFADLL, CFSTR("Failed to request FDR permissions"), v87);
      v69 = (void *)objc_claimAutoreleasedReturnValue();

    }
LABEL_35:
    v70 = a3;
    if (!a3)
      goto LABEL_37;
    goto LABEL_36;
  }
  v41 = 0;
  while (1)
  {
    objc_msgSend_objectAtIndexedSubscript_(v16, v34, v41, v36, v77);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v82, v43, v41, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = AMFDRDataAppendPermissionsString();

    if ((v46 & 1) == 0)
      break;
    if (objc_msgSend_count(v16, v47, v48, v49) <= (unint64_t)++v41)
      goto LABEL_17;
  }
  sub_214512470((void *)0xFFFFFFFFFFFFFFACLL, CFSTR("AMFDRDataAppendPermissionsString Make failed"), 0);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_30:
  v15 = v79;
LABEL_31:
  v18 = v80;
  v70 = a3;
  v20 = v78;
  if (a3)
LABEL_36:
    *v70 = objc_retainAutorelease(v69);
LABEL_37:
  AMSupportSafeRelease();
  if (v69)
    v75 = objc_msgSend_code(v69, v72, v73, v74);
  else
    v75 = 0;

  return v75;
}

- (CRFDRSeal)sealWithDataClass:(id)a3 fdrError:(id *)a4 registerOnly:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  const char *v22;
  BOOL v23;
  id v24;
  NSObject *v25;
  id v26;
  const char *v27;
  CRFDRBaseDeviceHandler *handler;
  NSSet *partSPC;
  void **p_currentClasses;
  void **p_currentProperties;
  NSDictionary *v32;
  NSDictionary *manifestDataClassesAndInstances;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  NSDictionary *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  CRFDRBaseDeviceHandler *v51;
  NSSet *v52;
  NSString *KGBSerialNumber;
  NSString *KBBSerialNumber;
  int v55;
  id v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  unint64_t v66;
  void *v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  void *v71;
  void **v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  const char *v89;
  const char *v90;
  CRFDRBaseDeviceHandler *v91;
  NSSet *v92;
  const char *v93;
  NSDictionary *v94;
  NSDictionary *updateClassDict;
  const char *v96;
  NSObject *v97;
  const char *v98;
  uint64_t v99;
  id *v100;
  uint64_t v101;
  NSObject *v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  int isEqualToString;
  uint64_t v111;
  NSObject *v112;
  CRFDRBaseDeviceHandler *v113;
  NSSet *v114;
  int PropertiesDict_fdrError;
  NSObject *v116;
  NSObject *v117;
  NSMutableArray *v118;
  NSObject *v119;
  NSMutableArray *v120;
  NSObject *v121;
  NSDictionary *makeProperties;
  CRFDRBaseDeviceHandler *v123;
  NSSet *v124;
  const char *v125;
  int MinimalManifestsClassesAndInstancesWithPartSPC_fdrLocal_fdrRemote_minimalSealingDataInstances_minimalSealedDataClasses_minimalSealedDataInstances_error;
  id v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  void *v134;
  const char *v135;
  uint64_t v136;
  int v137;
  uint64_t v138;
  NSObject *v139;
  NSObject *v140;
  NSObject *v141;
  char FinalData;
  NSObject *v143;
  NSObject *v144;
  NSMutableArray *v145;
  NSObject *v146;
  NSMutableArray *v147;
  NSObject *v148;
  NSMutableArray *mergedDataClasses;
  NSObject *v150;
  NSMutableArray *mergedDataInstances;
  NSObject *v152;
  NSString *sealedDataInstance;
  const char *v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  NSArray *v161;
  NSArray *removedProperties;
  const char *v163;
  NSObject *v164;
  NSArray *v165;
  int DeviceStagedSealedFromEAN_error;
  id v167;
  int v168;
  NSObject *v169;
  const char *v170;
  NSObject *v171;
  NSObject *v172;
  NSObject *v173;
  const __CFString *v174;
  const char *v175;
  id *v176;
  uint64_t v177;
  id v178;
  NSObject *v179;
  NSObject *v180;
  NSMutableArray **p_makeClasses;
  void *v182;
  id v183;
  void **p_currentInstances;
  NSMutableArray **p_makeInstances;
  id v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  id v192;
  id v193[2];
  id v194;
  id v195[2];
  id v196;
  id v197;
  id v198;
  uint8_t buf[4];
  uint64_t v200;
  __int16 v201;
  id v202;
  uint64_t v203;

  v5 = a5;
  v203 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  objc_msgSend__baseFDROptionsWithDataStore_(self, v8, (uint64_t)CFSTR("Local"), v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    handleForCategory(0);
    v139 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v139, OS_LOG_TYPE_ERROR))
      sub_21456FBF4();
    goto LABEL_82;
  }
  objc_msgSend__baseFDROptionsWithDataStore_(self, v10, (uint64_t)CFSTR("Remote"), v11);
  v13 = objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    handleForCategory(0);
    v139 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v139, OS_LOG_TYPE_ERROR))
      sub_21456FC20();
LABEL_82:

    v60 = 0;
    v24 = 0;
    v14 = 0;
LABEL_89:
    v20 = -3;
    goto LABEL_42;
  }
  v14 = (void *)v13;
  v15 = AMFDRCreateWithOptions();
  if (!v15)
  {
    handleForCategory(0);
    v140 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v140, OS_LOG_TYPE_ERROR))
      sub_21456FC4C();
    goto LABEL_88;
  }
  v16 = v15;
  v17 = AMFDRCreateWithOptions();
  if (!v17)
  {
    handleForCategory(0);
    v140 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v140, OS_LOG_TYPE_ERROR))
      sub_21456FC78();
LABEL_88:

    v60 = 0;
    v24 = 0;
    goto LABEL_89;
  }
  v19 = v17;
  v198 = 0;
  v20 = objc_msgSend_setLocalAndRemoteTrustObject_fdrLocal_remoteTrustObjectDigest_fdrError_(self, v18, v17, v16, 0, &v198);
  v21 = v198;
  if (v20)
    v23 = 0;
  else
    v23 = v21 == 0;
  if (!v23)
  {
    v24 = v21;
    handleForCategory(0);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      sub_21456FCA4();
LABEL_40:

LABEL_41:
    v60 = 0;
    goto LABEL_42;
  }
  if (v5)
  {
    v197 = 0;
    v20 = objc_msgSend_performHTTPChallengeClaim_fdrLocal_fdrError_claimClassDict_registerOnly_(self, v22, v19, v16, &v197, v7, 1);
    v24 = v197;
    handleForCategory(0);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v200 = v20;
      v201 = 2112;
      v202 = v24;
      _os_log_impl(&dword_214503000, v25, OS_LOG_TYPE_DEFAULT, "RegisterChange status: %ld error: %@", buf, 0x16u);
    }
    goto LABEL_40;
  }
  v196 = 0;
  v20 = objc_msgSend_prefetchPermissionsWith_returnError_(self, v22, v19, (uint64_t)&v196);
  v26 = v196;
  v24 = v26;
  if (v20 || v26)
  {
    handleForCategory(0);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      sub_21456DE84();
    goto LABEL_40;
  }
  handler = self->handler;
  partSPC = self->_partSPC;
  p_currentClasses = (void **)&self->_currentClasses;
  p_currentProperties = (void **)&self->_currentProperties;
  v195[1] = 0;
  p_currentInstances = (void **)&self->_currentInstances;
  objc_msgSend_getCurrentManifestDataClassesAndInstancesWithPartSPC_fdr_currentClasses_currentInstances_currentProperties_fdrError_(handler, v27, (uint64_t)partSPC, v19, &self->_currentClasses);
  v32 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  manifestDataClassesAndInstances = self->manifestDataClassesAndInstances;
  self->manifestDataClassesAndInstances = v32;

  v37 = self->manifestDataClassesAndInstances;
  if (!v37
    || !objc_msgSend_count(v37, v34, v35, v36)
    || v24
    || !*p_currentProperties
    || !objc_msgSend_count(*p_currentProperties, v38, v39, v40))
  {
    handleForCategory(0);
    v103 = objc_claimAutoreleasedReturnValue();
    v100 = a4;
    if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
      sub_21456FD04();

    objc_msgSend_domain(v24, v104, v105, v106);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v107, v108, (uint64_t)CFSTR("com.apple.corerepair"), v109);

    if (!isEqualToString)
    {
      v60 = 0;
      goto LABEL_55;
    }
    v20 = objc_msgSend_code(v24, v98, v111, v99);
LABEL_53:
    v60 = 0;
    goto LABEL_43;
  }
  handleForCategory(0);
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    v42 = *p_currentClasses;
    *(_DWORD *)buf = 138412290;
    v200 = (uint64_t)v42;
    _os_log_impl(&dword_214503000, v41, OS_LOG_TYPE_DEFAULT, "Current data classes: %@", buf, 0xCu);
  }

  handleForCategory(0);
  v43 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    v44 = *p_currentInstances;
    *(_DWORD *)buf = 138412290;
    v200 = (uint64_t)v44;
    _os_log_impl(&dword_214503000, v43, OS_LOG_TYPE_DEFAULT, "Current data instances: %@", buf, 0xCu);
  }

  handleForCategory(0);
  v45 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    v46 = *p_currentProperties;
    *(_DWORD *)buf = 138412290;
    v200 = (uint64_t)v46;
    _os_log_impl(&dword_214503000, v45, OS_LOG_TYPE_DEFAULT, "Current properties: %@", buf, 0xCu);
  }

  objc_msgSend_objectForKeyedSubscript_(self->manifestDataClassesAndInstances, v47, (uint64_t)CFSTR("seal"), v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v49)
  {
    v20 = -3;
    sub_214512470((void *)0xFFFFFFFFFFFFFFFDLL, CFSTR("manifestDataClassesAndInstances missing seal"), 0);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_41;
  }
  v51 = self->handler;
  v52 = self->_partSPC;
  KBBSerialNumber = self->KBBSerialNumber;
  KGBSerialNumber = self->KGBSerialNumber;
  v195[0] = 0;
  v55 = objc_msgSend_validateAndSetSerialNumbersUsingPartSPC_KGBSerialNumber_KBBSerialNumber_withError_(v51, v50, (uint64_t)v52, (uint64_t)KGBSerialNumber, KBBSerialNumber, v195);
  v56 = v195[0];
  v24 = v56;
  if (!v55 || v56)
  {
    v100 = a4;
    if (a4)
      *a4 = objc_retainAutorelease(v56);
    v20 = objc_msgSend_code(v24, v57, v58, v59);
    handleForCategory(0);
    v112 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR))
      sub_21456FF9C();

    goto LABEL_53;
  }
  v182 = v12;
  v183 = v7;
  v60 = (void *)objc_opt_new();
  if (objc_msgSend_count(*p_currentClasses, v61, v62, v63))
  {
    v66 = 0;
    do
    {
      v67 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend_objectAtIndexedSubscript_(*p_currentClasses, v64, v66, v65);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(*p_currentInstances, v69, v66, v70);
      v71 = v60;
      v72 = p_currentClasses;
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithFormat_(v67, v74, (uint64_t)CFSTR("%@-%@"), v75, v68, v73);
      v76 = (void *)objc_claimAutoreleasedReturnValue();

      p_currentClasses = v72;
      v60 = v71;

      objc_msgSend_addObject_(v71, v77, (uint64_t)v76, v78);
      ++v66;
    }
    while (objc_msgSend_count(*p_currentClasses, v79, v80, v81) > v66);
  }
  v82 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_objectForKeyedSubscript_(self->manifestDataClassesAndInstances, v64, (uint64_t)CFSTR("seal"), v65);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v82, v84, (uint64_t)CFSTR("%@-%@"), v85, CFSTR("seal"), v83);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v60, v87, (uint64_t)v86, v88);

  objc_msgSend_setObject_forKeyedSubscript_(self->preSealingManifest, v89, (uint64_t)v60, (uint64_t)CFSTR("dataClasses"));
  objc_msgSend_setObject_forKeyedSubscript_(self->preSealingManifest, v90, (uint64_t)self->_currentProperties, (uint64_t)CFSTR("properties"));
  v91 = self->handler;
  v92 = self->_partSPC;
  v194 = 0;
  objc_msgSend_getUpdateDataClassesAndInstancesWithPartSPC_withError_(v91, v93, (uint64_t)v92, (uint64_t)&v194);
  v94 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  v24 = v194;
  updateClassDict = self->_updateClassDict;
  self->_updateClassDict = v94;

  if (v24)
  {
    handleForCategory(0);
    v97 = objc_claimAutoreleasedReturnValue();
    v12 = v182;
    if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
      sub_21456FF3C();

    v20 = -45;
LABEL_37:
    v7 = v183;
LABEL_42:
    v100 = a4;
    goto LABEL_43;
  }
  v113 = self->handler;
  v114 = self->_partSPC;
  v193[1] = 0;
  p_makeClasses = &self->_makeClasses;
  p_makeInstances = &self->_makeInstances;
  PropertiesDict_fdrError = objc_msgSend_getMakeDataClassesAndInstancesWithPartSPC_fdrRemote_makeClasses_makeInstances_makePropertiesDict_fdrError_(v113, v96, (uint64_t)v114, v19);
  v24 = 0;
  handleForCategory(0);
  v116 = objc_claimAutoreleasedReturnValue();
  v117 = v116;
  v12 = v182;
  if (PropertiesDict_fdrError && !v24)
  {
    if (os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT))
    {
      v118 = *p_makeClasses;
      *(_DWORD *)buf = 138412290;
      v200 = (uint64_t)v118;
      _os_log_impl(&dword_214503000, v117, OS_LOG_TYPE_DEFAULT, "Make data classes: %@", buf, 0xCu);
    }

    handleForCategory(0);
    v119 = objc_claimAutoreleasedReturnValue();
    v7 = v183;
    if (os_log_type_enabled(v119, OS_LOG_TYPE_DEFAULT))
    {
      v120 = *p_makeInstances;
      *(_DWORD *)buf = 138412290;
      v200 = (uint64_t)v120;
      _os_log_impl(&dword_214503000, v119, OS_LOG_TYPE_DEFAULT, "Make data instances: %@", buf, 0xCu);
    }

    handleForCategory(0);
    v121 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v121, OS_LOG_TYPE_DEFAULT))
    {
      makeProperties = self->_makeProperties;
      *(_DWORD *)buf = 138412290;
      v200 = (uint64_t)makeProperties;
      _os_log_impl(&dword_214503000, v121, OS_LOG_TYPE_DEFAULT, "Make properties: %@", buf, 0xCu);
    }

    v123 = self->handler;
    v124 = self->_partSPC;
    v193[0] = 0;
    MinimalManifestsClassesAndInstancesWithPartSPC_fdrLocal_fdrRemote_minimalSealingDataInstances_minimalSealedDataClasses_minimalSealedDataInstances_error = objc_msgSend_getMinimalManifestsClassesAndInstancesWithPartSPC_fdrLocal_fdrRemote_minimalSealingDataInstances_minimalSealedDataClasses_minimalSealedDataInstances_error_(v123, v125, (uint64_t)v124, v16, v19, &self->_minimalSealingInstances, &self->_minimalSealedClasses, &self->_minimalSealedInstances, v193);
    v127 = v193[0];
    v24 = v127;
    if (MinimalManifestsClassesAndInstancesWithPartSPC_fdrLocal_fdrRemote_minimalSealingDataInstances_minimalSealedDataClasses_minimalSealedDataInstances_error
      && !v127)
    {
      v129 = objc_msgSend_validateDisplaySwapped_lessThan_(self->handler, v128, (uint64_t)self->_partSPC, (uint64_t)self->displayMaxDuration);
      if (v129)
      {
        v20 = v129;
        v24 = 0;
        goto LABEL_42;
      }
      FinalData = objc_msgSend_generateFinalData(self, v98, v130, v99);
      handleForCategory(0);
      v143 = objc_claimAutoreleasedReturnValue();
      v144 = v143;
      if ((FinalData & 1) == 0)
      {
        if (os_log_type_enabled(v143, OS_LOG_TYPE_ERROR))
          sub_21456FE50();

        v24 = 0;
        v20 = -67;
        goto LABEL_37;
      }
      if (os_log_type_enabled(v143, OS_LOG_TYPE_DEFAULT))
      {
        v145 = *p_makeClasses;
        *(_DWORD *)buf = 138412290;
        v200 = (uint64_t)v145;
        _os_log_impl(&dword_214503000, v144, OS_LOG_TYPE_DEFAULT, "Final Make data classes: %@", buf, 0xCu);
      }

      handleForCategory(0);
      v146 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v146, OS_LOG_TYPE_DEFAULT))
      {
        v147 = *p_makeInstances;
        *(_DWORD *)buf = 138412290;
        v200 = (uint64_t)v147;
        _os_log_impl(&dword_214503000, v146, OS_LOG_TYPE_DEFAULT, "Final Make data instances: %@", buf, 0xCu);
      }

      handleForCategory(0);
      v148 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v148, OS_LOG_TYPE_DEFAULT))
      {
        mergedDataClasses = self->_mergedDataClasses;
        *(_DWORD *)buf = 138412290;
        v200 = (uint64_t)mergedDataClasses;
        _os_log_impl(&dword_214503000, v148, OS_LOG_TYPE_DEFAULT, "Final Merged data classes: %@", buf, 0xCu);
      }

      handleForCategory(0);
      v150 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v150, OS_LOG_TYPE_DEFAULT))
      {
        mergedDataInstances = self->_mergedDataInstances;
        *(_DWORD *)buf = 138412290;
        v200 = (uint64_t)mergedDataInstances;
        _os_log_impl(&dword_214503000, v150, OS_LOG_TYPE_DEFAULT, "Final Merged data instances: %@", buf, 0xCu);
      }

      handleForCategory(0);
      v152 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v152, OS_LOG_TYPE_DEFAULT))
      {
        sealedDataInstance = self->_sealedDataInstance;
        *(_DWORD *)buf = 138412290;
        v200 = (uint64_t)sealedDataInstance;
        _os_log_impl(&dword_214503000, v152, OS_LOG_TYPE_DEFAULT, "Sealed data instance: %@", buf, 0xCu);
      }

      if ((objc_msgSend_validatePatchWithPartSPC_originalClasses_originalInstances_originalValues_validClasses_validInstances_(self->handler, v154, (uint64_t)self->_partSPC, (uint64_t)self->_patchDataClasses, self->_patchDataInstances, self->_patchValues, self->_mergedDataClasses, self->_mergedDataInstances) & 1) == 0)
      {
        handleForCategory(0);
        v171 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v171, OS_LOG_TYPE_ERROR))
          sub_21456FE24();

        v24 = 0;
        v20 = -66;
        goto LABEL_127;
      }
      if (objc_msgSend_allowFactoryReset(self->handler, v155, v156, v157))
      {
        objc_msgSend_getExcludedPropertiesForFactoryReset(self->handler, v158, v159, v160);
        v161 = (NSArray *)objc_claimAutoreleasedReturnValue();
        removedProperties = self->removedProperties;
        self->removedProperties = v161;

        if (self->removedProperties)
        {
          handleForCategory(0);
          v164 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v164, OS_LOG_TYPE_DEFAULT))
          {
            v165 = self->removedProperties;
            *(_DWORD *)buf = 138412290;
            v200 = (uint64_t)v165;
            _os_log_impl(&dword_214503000, v164, OS_LOG_TYPE_DEFAULT, "FactoryReset: removedProperties:%@", buf, 0xCu);
          }

          AMFDRSetOption();
          AMFDRSetOption();
        }
        objc_msgSend_deleteLocalData_dataClass_(self, v163, (uint64_t)self->FDRPersistentDataPath, (uint64_t)CFSTR("seal"));
      }
      v192 = 0;
      DeviceStagedSealedFromEAN_error = objc_msgSend_queryDeviceStagedSealedFromEAN_error_(CRFDRUtils, v158, 0, (uint64_t)&v192);
      v167 = v192;
      v24 = v167;
      self->isStagedSealed = DeviceStagedSealedFromEAN_error;
      if (self->ignoreStagedData)
      {
        if (v167)
          v168 = 1;
        else
          v168 = DeviceStagedSealedFromEAN_error;
        if (v168 == 1)
        {
          handleForCategory(0);
          v169 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v169, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_214503000, v169, OS_LOG_TYPE_DEFAULT, "Ignore staged data", buf, 2u);
          }

          objc_msgSend_deleteLocalData_dataClass_(self, v170, (uint64_t)self->FDRPersistentDataPath, (uint64_t)CFSTR("seal"));
          self->isStagedSealed = 0;

        }
      }
      else if (v167)
      {
        handleForCategory(0);
        v172 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v172, OS_LOG_TYPE_ERROR))
          sub_21456FDC4();

        v20 = -3;
        goto LABEL_127;
      }
      handleForCategory(0);
      v173 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v173, OS_LOG_TYPE_DEFAULT))
      {
        if (self->isStagedSealed)
          v174 = CFSTR("YES");
        else
          v174 = CFSTR("NO");
        *(_DWORD *)buf = 138412290;
        v200 = (uint64_t)v174;
        _os_log_impl(&dword_214503000, v173, OS_LOG_TYPE_DEFAULT, "Device is staged sealed: %@", buf, 0xCu);
      }

      if (self->enableStagedSeal)
      {
        if (self->isStagedSealed)
        {
          v191 = 0;
          v176 = (id *)&v191;
          v177 = objc_msgSend_performStagedToStagedRepair_fdrLocal_fdrRemote_(self, v175, (uint64_t)&v191, v16, v19);
        }
        else
        {
          v190 = 0;
          v176 = (id *)&v190;
          v177 = objc_msgSend_performRealToStagedRepair_fdrLocal_fdrRemote_(self, v175, (uint64_t)&v190, v16, v19);
        }
      }
      else if (self->isStagedSealed)
      {
        v189 = 0;
        v176 = (id *)&v189;
        v177 = objc_msgSend_performStagedToRealRepair_fdrLocal_fdrRemote_(self, v175, (uint64_t)&v189, v16, v19);
      }
      else
      {
        v188 = 0;
        v176 = (id *)&v188;
        v177 = objc_msgSend_performRealToRealRepair_fdrLocal_fdrRemote_(self, v175, (uint64_t)&v188, v16, v19);
      }
      v20 = v177;
      v178 = *v176;
      v24 = v178;
      if (!v20 && !v178)
      {
        v187 = 0;
        v20 = objc_msgSend_verifyClaimCountAndSalesDistrictWithError_(self, v98, (uint64_t)&v187, v99);
        v24 = v187;
        handleForCategory(0);
        v179 = objc_claimAutoreleasedReturnValue();
        v180 = v179;
        if (v20 || v24)
        {
          if (os_log_type_enabled(v179, OS_LOG_TYPE_ERROR))
            sub_21456FD64();

        }
        else
        {
          if (os_log_type_enabled(v179, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_214503000, v180, OS_LOG_TYPE_DEFAULT, "AMFDRSeal SUCCESS", buf, 2u);
          }

          v24 = 0;
          v20 = 0;
        }
      }
LABEL_127:
      v7 = v183;
      v100 = a4;
      v12 = v182;
      goto LABEL_43;
    }
    handleForCategory(0);
    v141 = objc_claimAutoreleasedReturnValue();
    v100 = a4;
    if (os_log_type_enabled(v141, OS_LOG_TYPE_ERROR))
      sub_21456FE7C();

LABEL_55:
    v20 = -3;
    goto LABEL_43;
  }
  v100 = a4;
  if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
    sub_21456FEDC();

  objc_msgSend_domain(v24, v131, v132, v133);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  v137 = objc_msgSend_isEqualToString_(v134, v135, (uint64_t)CFSTR("com.apple.corerepair"), v136);

  if (v137)
    v20 = objc_msgSend_code(v24, v98, v138, v99);
  else
    v20 = -26;
  v7 = v183;
LABEL_43:
  if (v100)
    *v100 = objc_retainAutorelease(v24);
  if (objc_msgSend_getInnermostNSErrorCode_(CRUtils, v98, (uint64_t)v24, v99) == 11)
    v101 = -13;
  else
    v101 = v20;
  AMSupportSafeRelease();
  AMSupportSafeRelease();

  return (CRFDRSeal *)v101;
}

- (id)_copyFDROptionsForPatch:(__AMFDR *)a3
{
  id v3;
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  NSObject *v87;
  id v88;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  uint8_t buf[4];
  void *v114;
  _QWORD v115[15];
  _QWORD v116[17];

  v116[15] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (!v3)
  {
    handleForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      goto LABEL_70;
    goto LABEL_71;
  }
  AMFDRGetOptions();
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    handleForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
LABEL_70:
      sub_21456FFC8();
LABEL_71:
    v88 = 0;
    goto LABEL_66;
  }
  v7 = v4;
  v115[0] = CFSTR("DataVersion");
  objc_msgSend_objectForKeyedSubscript_(v4, v5, (uint64_t)CFSTR("DataVersion"), v6);
  v8 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v8;
  if (!v8)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v9, v10, v11);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v102 = (void *)v8;
  v116[0] = v8;
  v115[1] = CFSTR("APTicket");
  objc_msgSend_objectForKeyedSubscript_(v7, v9, (uint64_t)CFSTR("APTicket"), v11);
  v13 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v13;
  if (!v13)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v14, v15, v16);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v101 = (void *)v13;
  v116[1] = v13;
  v115[2] = CFSTR("DataDirectory");
  objc_msgSend_objectForKeyedSubscript_(v7, v14, (uint64_t)CFSTR("DataDirectory"), v16);
  v18 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v18;
  if (!v18)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v19, v20, v21);
    v18 = objc_claimAutoreleasedReturnValue();
  }
  v100 = (void *)v18;
  v116[2] = v18;
  v115[3] = CFSTR("UseSOCKSHost");
  objc_msgSend_objectForKeyedSubscript_(v7, v19, (uint64_t)CFSTR("UseSOCKSHost"), v21);
  v23 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)v23;
  if (!v23)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v24, v25, v26);
    v23 = objc_claimAutoreleasedReturnValue();
  }
  v99 = (void *)v23;
  v116[3] = v23;
  v115[4] = CFSTR("UseSOCKSPort");
  objc_msgSend_objectForKeyedSubscript_(v7, v24, (uint64_t)CFSTR("UseSOCKSPort"), v26);
  v28 = objc_claimAutoreleasedReturnValue();
  v32 = (void *)v28;
  if (!v28)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v29, v30, v31);
    v28 = objc_claimAutoreleasedReturnValue();
  }
  v98 = (void *)v28;
  v116[4] = v28;
  v115[5] = CFSTR("EnableProxy");
  objc_msgSend_objectForKeyedSubscript_(v7, v29, (uint64_t)CFSTR("EnableProxy"), v31);
  v33 = objc_claimAutoreleasedReturnValue();
  v37 = (void *)v33;
  if (!v33)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v34, v35, v36);
    v33 = objc_claimAutoreleasedReturnValue();
  }
  v97 = (void *)v33;
  v116[5] = v33;
  v115[6] = CFSTR("EnableProxySsl");
  objc_msgSend_objectForKeyedSubscript_(v7, v34, (uint64_t)CFSTR("EnableProxySsl"), v36);
  v38 = objc_claimAutoreleasedReturnValue();
  v42 = (void *)v38;
  if (!v38)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v39, v40, v41);
    v38 = objc_claimAutoreleasedReturnValue();
  }
  v96 = (void *)v38;
  v116[6] = v38;
  v115[7] = CFSTR("CAURL");
  objc_msgSend_objectForKeyedSubscript_(v7, v39, (uint64_t)CFSTR("CAURL"), v41);
  v43 = objc_claimAutoreleasedReturnValue();
  v47 = (void *)v43;
  if (!v43)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v44, v45, v46);
    v43 = objc_claimAutoreleasedReturnValue();
  }
  v95 = (void *)v43;
  v116[7] = v43;
  v115[8] = CFSTR("DSURL");
  objc_msgSend_objectForKeyedSubscript_(v7, v44, (uint64_t)CFSTR("DSURL"), v46);
  v51 = objc_claimAutoreleasedReturnValue();
  v112 = (void *)v51;
  if (!v51)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v48, v49, v50);
    v51 = objc_claimAutoreleasedReturnValue();
  }
  v94 = (void *)v51;
  v116[8] = v51;
  v115[9] = CFSTR("SealingURL");
  objc_msgSend_objectForKeyedSubscript_(v7, v48, (uint64_t)CFSTR("SealingURL"), v50);
  v55 = objc_claimAutoreleasedReturnValue();
  v111 = (void *)v55;
  if (!v55)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v52, v53, v54);
    v55 = objc_claimAutoreleasedReturnValue();
  }
  v107 = v32;
  v93 = (void *)v55;
  v116[9] = v55;
  v115[10] = CFSTR("TrustObjectURL");
  objc_msgSend_objectForKeyedSubscript_(v7, v52, (uint64_t)CFSTR("TrustObjectURL"), v54);
  v59 = objc_claimAutoreleasedReturnValue();
  v103 = (void *)v59;
  if (!v59)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v56, v57, v58);
    v59 = objc_claimAutoreleasedReturnValue();
  }
  v106 = v37;
  v92 = (void *)v59;
  v116[10] = v59;
  v115[11] = CFSTR("ExtraSslRoots");
  objc_msgSend_objectForKeyedSubscript_(v7, v56, (uint64_t)CFSTR("ExtraSslRoots"), v58);
  v60 = objc_claimAutoreleasedReturnValue();
  v64 = (void *)v60;
  if (!v60)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v61, v62, v63);
    v60 = objc_claimAutoreleasedReturnValue();
  }
  v105 = v42;
  v108 = v27;
  v110 = v12;
  v91 = (void *)v60;
  v116[11] = v60;
  v115[12] = CFSTR("TrustObjectDigest");
  objc_msgSend_objectForKeyedSubscript_(v7, v61, (uint64_t)CFSTR("TrustObjectDigest"), v63);
  v65 = objc_claimAutoreleasedReturnValue();
  v69 = (void *)v65;
  if (!v65)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v66, v67, v68);
    v65 = objc_claimAutoreleasedReturnValue();
  }
  v104 = v47;
  v109 = v17;
  v70 = v3;
  v90 = (void *)v65;
  v116[12] = v65;
  v115[13] = CFSTR("TrustObject");
  objc_msgSend_objectForKeyedSubscript_(v7, v66, (uint64_t)CFSTR("TrustObject"), v68);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = v74;
  if (!v74)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v71, v72, v73);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v76 = v22;
  v116[13] = v75;
  v115[14] = CFSTR("Permissions");
  objc_msgSend_objectForKeyedSubscript_(v7, v71, (uint64_t)CFSTR("Permissions"), v73);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = v80;
  if (!v80)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v77, v78, v79);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v116[14] = v81;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v77, (uint64_t)v116, (uint64_t)v115, 15);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addEntriesFromDictionary_(v70, v83, (uint64_t)v82, v84);

  if (!v80)
  if (!v74)

  v3 = v70;
  if (!v69)

  if (!v64)
  if (!v103)

  v85 = v111;
  if (!v111)
  {

    v85 = 0;
  }

  v86 = v112;
  if (!v112)
  {

    v86 = 0;
  }

  if (!v104)
  if (!v105)

  if (!v106)
  if (!v107)

  if (!v108)
  if (!v76)

  if (!v109)
  if (!v110)

  handleForCategory(0);
  v87 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v114 = v70;
    _os_log_impl(&dword_214503000, v87, OS_LOG_TYPE_DEFAULT, "fdr options are :%@", buf, 0xCu);
  }

  v88 = v70;
LABEL_66:

  return v88;
}

- (id)_baseFDROptionsWithDataStore:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t FDRDataVersionForDevice;
  uint64_t v10;
  uint64_t v11;
  NSDictionary *metadataDict;
  uint64_t v13;
  NSURL *dataDirectoryURL;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSData *apTicketData;
  void *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  NSObject *v26;
  NSString *SOCKSHost;
  NSNumber *SOCKSPort;
  const char *v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  const char *v35;
  NSString *FDRCAURL;
  NSString *FDRDSURL;
  NSString *FDRSealingURL;
  NSString *trustObjectURL;
  NSData *keyBlob;
  NSObject *v41;
  id v42;
  void *v44;
  id v45;
  NSObject *v46;
  uint8_t buf[4];
  NSString *v48;
  __int16 v49;
  NSNumber *v50;
  _QWORD v51[15];
  _QWORD v52[17];

  v52[15] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (!v5)
  {
    handleForCategory(0);
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      sub_21456FFC8();
    goto LABEL_45;
  }
  v46 = MGCopyAnswer();
  if (!v46)
  {
    handleForCategory(0);
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      sub_21456FFF4();
LABEL_45:
    v42 = 0;
    goto LABEL_38;
  }
  FDRDataVersionForDevice = AMFDRSealingMapGetFDRDataVersionForDevice();
  v10 = MEMORY[0x24BDBD1C8];
  v11 = MEMORY[0x24BDBD1C0];
  v51[0] = CFSTR("CSRRefKeyCountersign");
  v51[1] = CFSTR("SignData");
  v52[0] = MEMORY[0x24BDBD1C8];
  v52[1] = MEMORY[0x24BDBD1C0];
  v52[2] = MEMORY[0x24BDBD1C0];
  v51[2] = CFSTR("VerifyData");
  v51[3] = CFSTR("Metadata");
  metadataDict = self->metadataDict;
  v13 = (uint64_t)metadataDict;
  if (!metadataDict)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v6, v7, v8);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v44 = (void *)v13;
  v52[3] = v13;
  v51[4] = CFSTR("DataDirectory");
  dataDirectoryURL = self->dataDirectoryURL;
  v15 = dataDirectoryURL;
  if (!dataDirectoryURL)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v6, v7, v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v52[4] = v15;
  v51[5] = CFSTR("DataVersion");
  objc_msgSend_numberWithUnsignedInt_(MEMORY[0x24BDD16E0], v6, FDRDataVersionForDevice, v8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v52[5] = v19;
  v51[6] = CFSTR("DataStore");
  v20 = v4;
  v45 = v4;
  if (!v4)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v16, v17, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v52[6] = v20;
  v52[7] = v11;
  v51[7] = CFSTR("GetCombined");
  v51[8] = CFSTR("INST");
  v51[9] = CFSTR("EnableMultiRequest");
  v51[10] = CFSTR("SealIdentifiers");
  v52[10] = v10;
  v52[11] = v11;
  v51[11] = CFSTR("ForceSealing");
  v51[12] = CFSTR("APTicket");
  apTicketData = self->apTicketData;
  v22 = apTicketData;
  v52[8] = v46;
  v52[9] = v10;
  if (!apTicketData)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v16, v17, v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v52[12] = v22;
  v52[13] = v10;
  v51[13] = CFSTR("EnableGetManifest");
  v51[14] = CFSTR("EnableDigest");
  v52[14] = v10;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v16, (uint64_t)v52, (uint64_t)v51, 15);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addEntriesFromDictionary_(v5, v24, (uint64_t)v23, v25);

  if (!apTicketData)
  v4 = v45;
  if (!v45)

  if (dataDirectoryURL)
  {
    if (metadataDict)
      goto LABEL_17;
  }
  else
  {

    if (metadataDict)
      goto LABEL_17;
  }

LABEL_17:
  if (self->SOCKSHost && self->SOCKSPort)
  {
    handleForCategory(0);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      SOCKSHost = self->SOCKSHost;
      SOCKSPort = self->SOCKSPort;
      *(_DWORD *)buf = 138412546;
      v48 = SOCKSHost;
      v49 = 2112;
      v50 = SOCKSPort;
      _os_log_impl(&dword_214503000, v26, OS_LOG_TYPE_DEFAULT, "Sockhost and SockPort found:%@:%@", buf, 0x16u);
    }

    objc_msgSend_setObject_forKeyedSubscript_(v5, v29, (uint64_t)self->SOCKSHost, (uint64_t)CFSTR("UseSOCKSHost"));
    objc_msgSend_setObject_forKeyedSubscript_(v5, v30, (uint64_t)self->SOCKSPort, (uint64_t)CFSTR("UseSOCKSPort"));
  }
  if (MGGetBoolAnswer() && self->enableProxy)
  {
    objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v31, 1, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v5, v34, (uint64_t)v33, (uint64_t)CFSTR("EnableProxy"));

    objc_msgSend_setObject_forKeyedSubscript_(v5, v35, (uint64_t)CFSTR("ForHttps"), (uint64_t)CFSTR("EnableProxySsl"));
  }
  FDRCAURL = self->FDRCAURL;
  if (FDRCAURL)
    objc_msgSend_setObject_forKeyedSubscript_(v5, v31, (uint64_t)FDRCAURL, (uint64_t)CFSTR("CAURL"));
  FDRDSURL = self->FDRDSURL;
  if (FDRDSURL)
    objc_msgSend_setObject_forKeyedSubscript_(v5, v31, (uint64_t)FDRDSURL, (uint64_t)CFSTR("DSURL"));
  FDRSealingURL = self->FDRSealingURL;
  if (FDRSealingURL)
    objc_msgSend_setObject_forKeyedSubscript_(v5, v31, (uint64_t)FDRSealingURL, (uint64_t)CFSTR("SealingURL"));
  trustObjectURL = self->trustObjectURL;
  if (trustObjectURL)
    objc_msgSend_setObject_forKeyedSubscript_(v5, v31, (uint64_t)trustObjectURL, (uint64_t)CFSTR("TrustObjectURL"));
  keyBlob = self->keyBlob;
  if (keyBlob)
    objc_msgSend_setObject_forKeyedSubscript_(v5, v31, (uint64_t)keyBlob, (uint64_t)CFSTR("RefKeyBlob"));
  handleForCategory(0);
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v48 = (NSString *)v5;
    _os_log_impl(&dword_214503000, v41, OS_LOG_TYPE_DEFAULT, "fdr options are :%@", buf, 0xCu);
  }

  v42 = v5;
LABEL_38:

  return v42;
}

+ (BOOL)currentProcessHasEntitlement:(id)a3
{
  __CFString *v3;
  __SecTask *v4;
  __SecTask *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  char v10;
  NSObject *v11;
  NSObject *v12;
  CFErrorRef error;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  __CFString *v18;
  __int16 v19;
  CFErrorRef v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = (__CFString *)a3;
  v4 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x24BDBD240]);
  if (v4)
  {
    v5 = v4;
    error = 0;
    v9 = (void *)SecTaskCopyValueForEntitlement(v4, v3, &error);
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      handleForCategory(0);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v16 = v9;
        v17 = 2112;
        v18 = v3;
        v19 = 2112;
        v20 = error;
        _os_log_error_impl(&dword_214503000, v12, OS_LOG_TYPE_ERROR, "Unexpected value %@ for %@ entitlement: %@", buf, 0x20u);
      }

      v10 = 0;
    }
    else
    {
      v10 = objc_msgSend_BOOLValue(v9, v6, v7, v8);
    }
    CFRelease(v5);

  }
  else
  {
    handleForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_214570020();

    v10 = 0;
  }

  return v10;
}

- (int64_t)performHTTPChallengeClaim:(__AMFDR *)a3 fdrLocal:(__AMFDR *)a4 fdrError:(id *)a5 claimClassDict:(id)a6 registerOnly:(BOOL)a7
{
  const char *v10;
  uint64_t v11;
  void **p_vtable;
  uint64_t v13;
  void *v14;
  void *v15;
  __CFString *v16;
  setupModuleChallengeCallBack **p_delegate;
  uint64_t i;
  void *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  id WeakRetained;
  id v27;
  const char *v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  NSObject *v34;
  const char *v35;
  uint64_t v36;
  const __CFBoolean *v37;
  int Value;
  NSObject *v39;
  const char *v40;
  char v41;
  id v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  const char *v47;
  void *v48;
  uint64_t v49;
  NSObject *v50;
  const char *v51;
  uint64_t v52;
  NSObject *v53;
  NSObject *v54;
  NSObject *v55;
  const char *v56;
  uint64_t v57;
  NSString *failedSPC;
  NSObject *v59;
  const char *v60;
  uint64_t v61;
  int64_t v62;
  void *v64;
  NSObject *v65;
  const char *v66;
  uint64_t v67;
  NSObject *v68;
  id *v69;
  CRFDRSeal *v70;
  uint64_t v71;
  _BOOL4 v72;
  id obj;
  id v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  void *v79;
  uint8_t buf[4];
  void *v81;
  __int16 v82;
  __CFString *v83;
  _BYTE v84[128];
  uint64_t v85;

  v72 = a7;
  v85 = *MEMORY[0x24BDAC8D0];
  v79 = 0;
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  obj = a6;
  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v75, (uint64_t)v84, 16);
  p_vtable = (void **)(CRFDRDisplay1DeviceHandler + 24);
  if (!v11)
  {
    v16 = 0;
    v48 = 0;
    v15 = 0;
    v14 = 0;
    v49 = 0;
    goto LABEL_56;
  }
  v13 = v11;
  v14 = 0;
  v15 = 0;
  v16 = 0;
  v70 = self;
  p_delegate = &self->delegate;
  v71 = *(_QWORD *)v76;
  v69 = a5;
  while (2)
  {
    for (i = 0; i != v13; ++i)
    {
      if (*(_QWORD *)v76 != v71)
        objc_enumerationMutation(obj);
      v19 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * i);
      v20 = (void *)MEMORY[0x2199D19CC]();
      objc_msgSend_objectForKeyedSubscript_(obj, v21, (uint64_t)v19, v22);
      v23 = objc_claimAutoreleasedReturnValue();

      if (!v23)
      {
        handleForCategory(0);
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          sub_2145700D8();

        if (!v72)
        {
          v48 = 0;
          v16 = 0;
          goto LABEL_54;
        }
        v16 = CFSTR("0");
        objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v51, (uint64_t)CFSTR("CLAIM/%@:%@"), v52, v19, CFSTR("0"));
        goto LABEL_39;
      }
      v16 = (__CFString *)v23;
      if (v72)
      {
        v14 = 0;
        v15 = 0;
        objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v24, (uint64_t)CFSTR("CLAIM/%@:%@"), v25, v19, v23);
LABEL_39:
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        handleForCategory(0);
        v53 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v81 = v48;
          _os_log_impl(&dword_214503000, v53, OS_LOG_TYPE_DEFAULT, "registering FDR permission: %@", buf, 0xCu);
        }

        if (v48)
        {
          AMFDRSetOption();
          if ((AMFDRPermissionsRequest() & 1) != 0)
          {
            handleForCategory(0);
            v54 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_214503000, v54, OS_LOG_TYPE_DEFAULT, "AMFDRPermisisonRequest successful", buf, 2u);
            }

            v49 = 0;
          }
          else
          {
            v64 = v79;
            if (v79)
            {

              v14 = v64;
            }
            handleForCategory(0);
            v65 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
              sub_214570078();

            if (objc_msgSend_getInnermostNSErrorCode_(CRUtils, v66, (uint64_t)v14, v67) == 11)
              v49 = -83;
            else
              v49 = 0;
          }
        }
        else
        {
          handleForCategory(0);
          v68 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
            sub_21457004C();

          v48 = 0;
          v49 = -84;
        }
        goto LABEL_55;
      }
      WeakRetained = objc_loadWeakRetained((id *)p_delegate);

      if (WeakRetained)
      {
        v27 = objc_loadWeakRetained((id *)p_delegate);
        objc_msgSend_setupModuleChallengeCallBack_(v27, v28, (uint64_t)a3, v29);

      }
      handleForCategory(0);
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v81 = v19;
        v82 = 2112;
        v83 = v16;
        _os_log_impl(&dword_214503000, v30, OS_LOG_TYPE_DEFAULT, "Challenge Claim by Server, dataClass:%@, dataInstance: %@", buf, 0x16u);
      }

      v31 = AMFDRDataHTTPChallengeClaim();
      if (v31)
      {
        v32 = (void *)v31;

        v15 = v32;
      }
      v33 = v79;
      if (v79)
      {

        v14 = v33;
LABEL_47:
        handleForCategory(0);
        v55 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
          sub_214570198();

        objc_msgSend_spcInPartSPC_withDataClass_(v70->handler, v56, (uint64_t)v70->_partSPC, (uint64_t)v19);
        v57 = objc_claimAutoreleasedReturnValue();
        failedSPC = v70->_failedSPC;
        v70->_failedSPC = (NSString *)v57;

LABEL_53:
        v48 = 0;
LABEL_54:
        v49 = -11;
LABEL_55:
        objc_autoreleasePoolPop(v20);
        a5 = v69;
        p_vtable = CRFDRDisplay1DeviceHandler.vtable;
        goto LABEL_56;
      }
      if (v14 || !v15)
        goto LABEL_47;
      if ((AMFDRDataPut() & 1) == 0)
      {
        v14 = v79;
        handleForCategory(0);
        v59 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
          sub_214570138();

        goto LABEL_53;
      }
      handleForCategory(0);
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_214503000, v34, OS_LOG_TYPE_DEFAULT, "HTTP Challenge Claim Successful", buf, 2u);
      }

      if (_os_feature_enabled_impl()
        && objc_msgSend_isEqual_(v19, v35, (uint64_t)CFSTR("vcrt"), v36)
        && (v37 = (const __CFBoolean *)MGCopyAnswer(), Value = CFBooleanGetValue(v37), CFRelease(v37), Value))
      {
        handleForCategory(0);
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_214503000, v39, OS_LOG_TYPE_DEFAULT, "Write date of first use to battery", buf, 2u);
        }

        v74 = 0;
        v41 = objc_msgSend__writeBatteryDateOfFirstUse_error_(v70, v40, (uint64_t)a3, (uint64_t)&v74);
        v42 = v74;
        v14 = v42;
        if ((v41 & 1) == 0)
        {
          if (v42)
          {
            v49 = objc_msgSend_code(v42, v43, v44, v45);
            v48 = 0;
          }
          else
          {
            v48 = 0;
            v49 = -999;
          }
          goto LABEL_55;
        }
        handleForCategory(0);
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_214503000, v46, OS_LOG_TYPE_DEFAULT, "Battery date of first use was written successfully", buf, 2u);
        }

      }
      else
      {
        v14 = 0;
      }
      objc_autoreleasePoolPop(v20);
    }
    v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v47, (uint64_t)&v75, (uint64_t)v84, 16);
    v48 = 0;
    v49 = 0;
    a5 = v69;
    p_vtable = (void **)(CRFDRDisplay1DeviceHandler + 24);
    if (v13)
      continue;
    break;
  }
LABEL_56:

  if (a5)
    *a5 = objc_retainAutorelease(v14);
  if (objc_msgSend_getInnermostNSErrorCode_(p_vtable + 32, v60, (uint64_t)v14, v61) == 11)
    v62 = -13;
  else
    v62 = v49;

  return v62;
}

- (BOOL)_writeBatteryDateOfFirstUse:(__AMFDR *)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  id v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  BOOL v29;
  id v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  AMFDRGetCert();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  sub_21452878C(v5, 0, &v32);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v32;
  handleForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_2145701F8();
    v18 = 0;
    v13 = 0;
LABEL_12:

    v29 = 0;
    v19 = v7;
    if (!a4)
      goto LABEL_19;
    goto LABEL_17;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v34 = v6;
    _os_log_impl(&dword_214503000, v9, OS_LOG_TYPE_DEFAULT, "the date retrieved from cert is: %@", buf, 0xCu);
  }

  objc_msgSend_dateByAddingTimeInterval_(v6, v10, v11, v12, 86400.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  handleForCategory(0);
  v14 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEBUG))
    sub_214570258(v13, v14, v15, v16);

  v31 = v7;
  objc_msgSend_setBatteryDateOfFirstUse_error_(CRBatteryController, v17, (uint64_t)v13, (uint64_t)&v31);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v31;

  if (v18)
  {
    objc_msgSend_dateByAddingTimeInterval_(v13, v20, v21, v22, 86400.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend_compare_(v18, v24, (uint64_t)v23, v25);

    if (v26 == -1)
    {
      v29 = 1;
      if (!a4)
        goto LABEL_19;
      goto LABEL_17;
    }
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v27, (uint64_t)CFSTR("DOFU of battery (%@) is in future"), v28, v18);
    v9 = objc_claimAutoreleasedReturnValue();
    sub_214512470((void *)0x46, v9, 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_12;
  }
  v29 = 0;
  if (!a4)
    goto LABEL_19;
LABEL_17:
  if (v19)
    *a4 = objc_retainAutorelease(v19);
LABEL_19:

  return v29;
}

- (id)_personalizeTrustObjectWithDigest:(id)a3 withError:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t DefaultAMAuthInstallRef;
  NSString *SOCKSHost;
  void *v13;
  const char *v14;
  char RemoteTrustObjectDigestWithExistedDigest_digestData_error;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  id v23;
  id v24;
  id v26;
  id v27;

  v27 = 0;
  v6 = a3;
  DefaultAMAuthInstallRef = objc_msgSend_getDefaultAMAuthInstallRef(CRPersonalizationManager, v7, v8, v9);
  SOCKSHost = self->SOCKSHost;
  if (SOCKSHost && self->SOCKSPort)
    AMAuthInstallSetSOCKSProxyInformation();
  objc_msgSend_initWithAuthInstallObj_(CRPersonalizationManager, (const char *)SOCKSHost, DefaultAMAuthInstallRef, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  RemoteTrustObjectDigestWithExistedDigest_digestData_error = objc_msgSend_getRemoteTrustObjectDigestWithExistedDigest_digestData_error_(v13, v14, (uint64_t)v6, (uint64_t)&v27, &v26);

  v16 = v26;
  if (a4 && (RemoteTrustObjectDigestWithExistedDigest_digestData_error & 1) == 0)
  {
    v20 = objc_msgSend_code(v16, v17, v18, v19);
    if (objc_msgSend_IsTatsuErrorNetworkingRelated_(CRPersonalizationManager, v21, v20, v22))
    {
      sub_214512470((void *)0xFFFFFFFFFFFFFFF3, CFSTR("Fail to personalize object"), 0);
      v23 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = objc_retainAutorelease(v16);
    }
    *a4 = v23;
  }
  AMSupportSafeRelease();
  v24 = v27;

  return v24;
}

- (int64_t)_fetchRemoteTrustObject:(__AMFDR *)a3 apTrustObjectDigest:(id)a4 remoteTrustObject:(id *)a5 fdrError:(id *)a6
{
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  __CFString *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  NSString *trustObjectURL;
  const char *v33;
  uint64_t v34;
  int64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v40;
  NSObject *v41;
  id v42;
  id v43;
  uint64_t v44;
  uint8_t buf[4];
  NSString *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v43 = 0;
  v44 = 0;
  if (objc_msgSend__urlsOverrideIsAllowed(self, v10, v11, v12)
    && !objc_msgSend_isEqual_(self->trustObjectURL, v13, (uint64_t)CFSTR("http://gg.apple.com/fdrtrustobject"), v14))
  {
    handleForCategory(0);
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      trustObjectURL = self->trustObjectURL;
      *(_DWORD *)buf = 138412290;
      v46 = trustObjectURL;
      _os_log_impl(&dword_214503000, v31, OS_LOG_TYPE_DEFAULT, "Override trust object URL is %@", buf, 0xCu);
    }

    if ((AMFDRDataCopyTrustObject() & 1) == 0)
    {
      v17 = 0;
      v22 = 0;
      if (objc_msgSend_getInnermostNSErrorCode_(CRUtils, v33, v44, v34) == 11)
        v35 = -13;
      else
        v35 = -35;
      v20 = 0;
      goto LABEL_32;
    }
    handleForCategory(0);
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      sub_21457031C();

    v20 = 0;
    v17 = 0;
LABEL_41:
    v22 = 0;
    v35 = -35;
    goto LABEL_32;
  }
  handleForCategory(0);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_214503000, v15, OS_LOG_TYPE_DEFAULT, "No trust object URL is override", buf, 2u);
  }

  v42 = 0;
  objc_msgSend__personalizeTrustObjectWithDigest_withError_(self, v16, 0, (uint64_t)&v42);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v42;
  if (!v17)
  {
    handleForCategory(0);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      sub_2145702F0();

    objc_msgSend_domain(v20, v24, v25, v26);
    v27 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v27 != CFSTR("com.apple.corerepair"))
    {
      v17 = 0;
      v22 = 0;
      v35 = -15;
      goto LABEL_32;
    }
    v35 = objc_msgSend_code(v20, v28, v29, v30);
    v17 = 0;
    goto LABEL_31;
  }
  if (!objc_msgSend_isEqual_(v9, v18, (uint64_t)v17, v19))
  {
    AMFDRSetOption();
    if ((AMFDRDataCopyTrustObject() & 1) != 0)
    {
      if (v43)
      {
        v22 = objc_retainAutorelease(v43);
        v35 = 0;
        *a5 = v22;
        goto LABEL_32;
      }
      handleForCategory(0);
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        sub_21457031C();

      goto LABEL_41;
    }
    if (objc_msgSend_getInnermostNSErrorCode_(CRUtils, v36, v44, v37) == 11)
      v35 = -13;
    else
      v35 = -35;
    v38 = v44;
    if (v44)
    {

      v22 = 0;
      v20 = (id)v38;
      goto LABEL_32;
    }
LABEL_31:
    v22 = 0;
    goto LABEL_32;
  }
  handleForCategory(0);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_214503000, v21, OS_LOG_TYPE_DEFAULT, "Local trust object is good to use", buf, 2u);
  }

  v22 = 0;
  v35 = 0;
  *a5 = 0;
LABEL_32:
  if (a6)
    *a6 = objc_retainAutorelease(v20);

  return v35;
}

- (int64_t)setLocalAndRemoteTrustObject:(__AMFDR *)a3 fdrLocal:(__AMFDR *)a4 remoteTrustObjectDigest:(id)a5 fdrError:(id *)a6
{
  const char *v10;
  uint64_t v11;
  int64_t RemoteTrustObject_apTrustObjectDigest_remoteTrustObject_fdrError;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  _BOOL4 v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v21;
  NSObject *v22;
  uint8_t v23[16];
  id v24;
  id v25[2];
  void *v26;

  v25[1] = 0;
  v26 = 0;
  v11 = AMFDRDataApTicketCopyObjectProperty();
  if (v11)
  {
    v24 = 0;
    v25[0] = 0;
    RemoteTrustObject_apTrustObjectDigest_remoteTrustObject_fdrError = objc_msgSend__fetchRemoteTrustObject_apTrustObjectDigest_remoteTrustObject_fdrError_(self, v10, (uint64_t)a3, v11, v25, &v24);
    v13 = v25[0];
    v14 = v24;
    v15 = v14;
    if (RemoteTrustObject_apTrustObjectDigest_remoteTrustObject_fdrError || v14)
    {
      handleForCategory(0);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        sub_2145703A0();

      if (a6)
        goto LABEL_19;
      goto LABEL_20;
    }
    handleForCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if (!v13)
    {
      if (v17)
      {
        *(_WORD *)v23 = 0;
        _os_log_impl(&dword_214503000, v16, OS_LOG_TYPE_DEFAULT, "Using local trust object", v23, 2u);
      }

LABEL_13:
      AMFDRSetOption();
      AMFDRDataCopyTrustObject();
      AMFDRSetOption();
      AMFDRSetOption();
      v15 = 0;
      RemoteTrustObject_apTrustObjectDigest_remoteTrustObject_fdrError = 0;
      if (!a6)
        goto LABEL_20;
      goto LABEL_19;
    }
    if (v17)
    {
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_214503000, v16, OS_LOG_TYPE_DEFAULT, "Using remote trust object For SSL Roots", v23, 2u);
    }

    CFGetAllocator(a4);
    v18 = AMFDRDataCopySslRoots();
    v15 = v26;
    if (!v26 && v18)
    {
      AMFDRSetOption();
      AMFDRSetOption();
      goto LABEL_13;
    }
    handleForCategory(0);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_2145703CC();

  }
  else
  {
    handleForCategory(0);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_214570374();

    v15 = 0;
    v13 = 0;
  }
  RemoteTrustObject_apTrustObjectDigest_remoteTrustObject_fdrError = -35;
  if (a6)
LABEL_19:
    *a6 = objc_retainAutorelease(v15);
LABEL_20:
  AMSupportSafeRelease();
  AMSupportSafeRelease();
  AMSupportSafeRelease();

  return RemoteTrustObject_apTrustObjectDigest_remoteTrustObject_fdrError;
}

- (id)setLocalAndRemotePermission:(__AMFDR *)a3 fdrRemote:(__AMFDR *)a4
{
  NSObject *v5;
  NSString *sealedDataInstance;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  __CFString *PermissionsString;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  char appended;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  NSObject *v23;
  NSMutableArray *mergedDataClasses;
  NSMutableArray *mergedDataInstances;
  NSObject *v26;
  NSObject *v28;
  const char *v30;
  uint64_t v31;
  __CFString *v32;
  const char *v33;
  uint64_t v34;
  NSMutableArray *v35;
  const char *v36;
  uint64_t v37;
  __CFString *v38;
  const char *v39;
  uint64_t v40;
  NSMutableArray *v41;
  int v42;
  const __CFString *v43;
  __int16 v44;
  NSMutableArray *v45;
  __int16 v46;
  int v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  handleForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    sealedDataInstance = self->_sealedDataInstance;
    v42 = 138412546;
    v43 = CFSTR("seal");
    v44 = 2112;
    v45 = (NSMutableArray *)sealedDataInstance;
    _os_log_impl(&dword_214503000, v5, OS_LOG_TYPE_DEFAULT, "Sealed data class:%@::Seal instances:%@", (uint8_t *)&v42, 0x16u);
  }

  if (objc_msgSend_count(self->_mergedDataClasses, v7, v8, v9))
  {
    v12 = 0;
    PermissionsString = 0;
    while (1)
    {
      objc_msgSend_objectAtIndexedSubscript_(self->_mergedDataClasses, v10, v12, v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(self->_mergedDataInstances, v15, v12, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (PermissionsString)
      {
        appended = AMFDRDataAppendPermissionsString();

        if ((appended & 1) == 0)
        {
          handleForCategory(0);
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend_objectAtIndexedSubscript_(self->_mergedDataClasses, v30, v12, v31);
            v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectAtIndexedSubscript_(self->_mergedDataInstances, v33, v12, v34);
            v35 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
            v42 = 138412802;
            v43 = v32;
            v44 = 2112;
            v45 = v35;
            v46 = 1024;
            v47 = 0;
            _os_log_error_impl(&dword_214503000, v28, OS_LOG_TYPE_ERROR, "Failed to append permissions string with data class '%@', data instance '%@', action '%d'", (uint8_t *)&v42, 0x1Cu);

          }
          goto LABEL_19;
        }
      }
      else
      {
        PermissionsString = (__CFString *)AMFDRDataCreatePermissionsString();

        if (!PermissionsString)
        {
          handleForCategory(0);
          v28 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            goto LABEL_19;
          objc_msgSend_objectAtIndexedSubscript_(self->_mergedDataClasses, v36, v12, v37);
          v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectAtIndexedSubscript_(self->_mergedDataInstances, v39, v12, v40);
          v41 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
          v42 = 138412802;
          v43 = v38;
          v44 = 2112;
          v45 = v41;
          v46 = 1024;
          v47 = 0;
          _os_log_error_impl(&dword_214503000, v28, OS_LOG_TYPE_ERROR, "Failed to create permissions string for data class '%@', data instance '%@', action '%d'", (uint8_t *)&v42, 0x1Cu);

LABEL_30:
          PermissionsString = 0;
          goto LABEL_19;
        }
      }
      if (objc_msgSend_count(self->_mergedDataClasses, v19, v20, v21) <= (unint64_t)++v12)
        goto LABEL_12;
    }
  }
  PermissionsString = 0;
LABEL_12:
  if ((AMFDRDataAppendPermissionsString() & 1) != 0)
  {
    v22 = AMFDRDataAppendPermissionsString();
    handleForCategory(0);
    v23 = objc_claimAutoreleasedReturnValue();
    v28 = v23;
    if ((v22 & 1) != 0)
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        mergedDataClasses = self->_mergedDataClasses;
        mergedDataInstances = self->_mergedDataInstances;
        v42 = 138412546;
        v43 = (const __CFString *)mergedDataClasses;
        v44 = 2112;
        v45 = mergedDataInstances;
        _os_log_impl(&dword_214503000, v28, OS_LOG_TYPE_DEFAULT, "Merged Data classes:%@::instances:%@", (uint8_t *)&v42, 0x16u);
      }

      handleForCategory(0);
      v26 = objc_claimAutoreleasedReturnValue();
      v28 = v26;
      if (!PermissionsString)
      {
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          sub_21457042C();
        goto LABEL_30;
      }
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v42 = 138412290;
        v43 = PermissionsString;
        _os_log_impl(&dword_214503000, v28, OS_LOG_TYPE_DEFAULT, "New Permisisons:%@", (uint8_t *)&v42, 0xCu);
      }
    }
    else if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      sub_214570458();
    }
  }
  else
  {
    handleForCategory(0);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      sub_2145704CC();
  }
LABEL_19:

  return PermissionsString;
}

- (int64_t)localPatch:(__AMFDR *)a3 dataClasses:(id)a4 dataInstances:(id)a5 values:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  int64_t v19;
  char v21;

  v12 = a6;
  v13 = a5;
  v14 = a4;
  v17 = (void *)objc_msgSend__copyFDROptionsForPatch_(self, v15, (uint64_t)a3, v16);
  v21 = 1;
  v19 = objc_msgSend_patchWithOptions_amfdr_dataClasses_dataInstances_values_datas_error_local_(self, v18, (uint64_t)v17, (uint64_t)a3, v14, v13, v12, 0, a7, v21);

  return v19;
}

- (int64_t)remotePatch:(__AMFDR *)a3 dataClasses:(id)a4 dataInstances:(id)a5 values:(id)a6 datas:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  int64_t v22;
  char v24;

  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v20 = (void *)objc_msgSend__copyFDROptionsForPatch_(self, v18, (uint64_t)a3, v19);
  v24 = 0;
  v22 = objc_msgSend_patchWithOptions_amfdr_dataClasses_dataInstances_values_datas_error_local_(self, v21, (uint64_t)v20, (uint64_t)a3, v17, v16, v15, v14, a8, v24);

  return v22;
}

- (int64_t)patchWithOptions:(id)a3 amfdr:(__AMFDR *)a4 dataClasses:(id)a5 dataInstances:(id)a6 values:(id)a7 datas:(id)a8 error:(id *)a9 local:(BOOL)a10
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  const char *v44;
  const char *v45;
  NSObject *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  NSObject *v59;
  void *v60;
  void *v61;
  NSObject *v62;
  NSObject *v64;
  NSObject *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  NSObject *v85;
  _BOOL4 v86;
  NSObject *v87;
  NSObject *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  const char *v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  NSObject *v96;
  const char *v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  void *v115;
  NSObject *v116;
  NSObject *v117;
  const char *v118;
  uint64_t v119;
  void *v120;
  const char *v121;
  uint64_t v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  NSObject *v127;
  NSObject *v128;
  void *v129;
  NSObject *v130;
  NSObject *v131;
  NSObject *v132;
  const char *v133;
  uint64_t v134;
  NSObject *v135;
  NSObject *v136;
  NSObject *v137;
  const char *v138;
  uint64_t v139;
  void *v140;
  const char *v141;
  uint64_t v142;
  void *v143;
  const char *v144;
  uint64_t v145;
  void *v146;
  int v147;
  int v148;
  void *v149;
  void *FullKey;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  int64_t context;
  void *contexta;
  char *contextb;
  void *v159;
  void *v160;
  uint8_t buf[4];
  id v162;
  __int16 v163;
  id v164;
  __int16 v165;
  id v166;
  uint64_t v167;

  v167 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  handleForCategory(0);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_214503000, v19, OS_LOG_TYPE_DEFAULT, "Start patching ...", buf, 2u);
  }

  v159 = v18;
  v160 = v14;
  if (!v15 || !v16 || !v17)
  {
    handleForCategory(0);
    v59 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
      goto LABEL_20;
    goto LABEL_21;
  }
  if (!objc_msgSend_count(v15, v20, v21, v22))
  {
    handleForCategory(0);
    v59 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
LABEL_20:
      sub_21457053C();
LABEL_21:

    v57 = 0;
    v60 = 0;
    v58 = 0;
    v61 = 0;
    v40 = 0;
    context = 0;
    goto LABEL_30;
  }
  v26 = objc_msgSend_count(v15, v23, v24, v25);
  if (v26 != objc_msgSend_count(v16, v27, v28, v29))
  {
    handleForCategory(0);
    v62 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      sub_21456F5E4();
    goto LABEL_28;
  }
  v33 = objc_msgSend_count(v15, v30, v31, v32);
  if (v33 != objc_msgSend_count(v17, v34, v35, v36))
  {
    handleForCategory(0);
    v62 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      sub_21456F5B8();
    goto LABEL_28;
  }
  if (!v14)
  {
    handleForCategory(0);
    v62 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      sub_214570568();
LABEL_28:

    v57 = 0;
    v60 = 0;
    v58 = 0;
    v61 = 0;
    v40 = 0;
LABEL_29:
    context = -66;
    goto LABEL_30;
  }
  v40 = (void *)objc_msgSend_mutableCopy(v14, v37, v38, v39);
  objc_msgSend_setObject_forKeyedSubscript_(v40, v41, (uint64_t)CFSTR("Local"), (uint64_t)CFSTR("DataStore"));
  v42 = MEMORY[0x24BDBD1C0];
  objc_msgSend_setObject_forKeyedSubscript_(v40, v43, MEMORY[0x24BDBD1C0], (uint64_t)CFSTR("VerifyData"));
  objc_msgSend_setObject_forKeyedSubscript_(v40, v44, v42, (uint64_t)CFSTR("SignData"));
  objc_msgSend_setObject_forKeyedSubscript_(v40, v45, v42, (uint64_t)CFSTR("PutCombined"));
  if (!AMFDRCreateWithOptions())
  {
    handleForCategory(0);
    v64 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
      sub_21456FC4C();

    v57 = 0;
    v60 = 0;
    v58 = 0;
    v61 = 0;
    goto LABEL_29;
  }
  if (!AMFDRMigrateCredentials())
  {
    handleForCategory(0);
    v65 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      sub_2145707F0();
    goto LABEL_56;
  }
  if (v18)
  {
    handleForCategory(0);
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_214503000, v46, OS_LOG_TYPE_DEFAULT, "Use pass in data array", buf, 2u);
    }

    v50 = objc_msgSend_count(v18, v47, v48, v49);
    if (v50 == objc_msgSend_count(v15, v51, v52, v53))
    {
      v57 = (void *)objc_msgSend_mutableCopy(v18, v54, v55, v56);
      v58 = 0;
      goto LABEL_47;
    }
    handleForCategory(0);
    v65 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      sub_2145707C4();
LABEL_56:

    v57 = 0;
    v60 = 0;
    v58 = 0;
    goto LABEL_57;
  }
  v151 = (void *)AMFDRDataMultiCopy();
  if (!v151)
  {
    handleForCategory(0);
    v128 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR))
      sub_214570594();

    v57 = 0;
    v60 = 0;
    v61 = 0;
    context = -66;
    v58 = 0;
    goto LABEL_30;
  }
  v154 = (void *)objc_opt_new();
  v58 = v151;
  if (!objc_msgSend_count(v151, v66, v67, v68))
  {
LABEL_46:
    v57 = v154;
LABEL_47:
    handleForCategory(0);
    v85 = objc_claimAutoreleasedReturnValue();
    v86 = os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT);
    if (a10)
    {
      if (v86)
      {
        *(_DWORD *)buf = 138412802;
        v162 = v15;
        v163 = 2112;
        v164 = v16;
        v165 = 2112;
        v166 = v17;
        _os_log_impl(&dword_214503000, v85, OS_LOG_TYPE_DEFAULT, "Local patch for classes: %@ instances: %@ values: %@", buf, 0x20u);
      }

      v60 = (void *)AMFDRDataMultiPatch();
      handleForCategory(0);
      v87 = objc_claimAutoreleasedReturnValue();
      v88 = v87;
      if (v60)
      {
        if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_214503000, v88, OS_LOG_TYPE_DEFAULT, "Local patch SUCCESS", buf, 2u);
        }

        v61 = 0;
        context = 0;
        goto LABEL_30;
      }
      if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
        sub_2145705F4();

LABEL_57:
      v61 = 0;
      context = -66;
      goto LABEL_30;
    }
    if (v86)
    {
      *(_DWORD *)buf = 138412802;
      v162 = v15;
      v163 = 2112;
      v164 = v16;
      v165 = 2112;
      v166 = v17;
      _os_log_impl(&dword_214503000, v85, OS_LOG_TYPE_DEFAULT, "Remote commit patch for classes: %@ instances: %@ values: %@", buf, 0x20u);
    }

    v61 = (void *)objc_msgSend_mutableCopy(v14, v89, v90, v91);
    objc_msgSend_setObject_forKeyedSubscript_(v61, v92, (uint64_t)CFSTR("Remote"), (uint64_t)CFSTR("DataStore"));
    if (!AMFDRCreateWithOptions())
    {
      v129 = v61;
      handleForCategory(0);
      v130 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v130, OS_LOG_TYPE_ERROR))
        sub_21456FC78();

      context = -66;
      v61 = v129;
      v60 = 0;
      goto LABEL_30;
    }
    if (AMFDRMigrateCredentials())
    {
      v60 = (void *)AMFDRDataMultiCommitPatch();
      if (v60)
      {
        if (objc_msgSend_count(v15, v93, v94, v95))
        {
          contextb = 0;
          while (1)
          {
            v149 = (void *)MEMORY[0x2199D19CC]();
            handleForCategory(0);
            v96 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend_objectAtIndexedSubscript_(v15, v97, (uint64_t)contextb, v98);
              v152 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectAtIndexedSubscript_(v16, v99, (uint64_t)contextb, v100);
              v101 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v162 = v152;
              v163 = 2112;
              v164 = v101;
              _os_log_impl(&dword_214503000, v96, OS_LOG_TYPE_DEFAULT, "Sync class: %@ instance: %@", buf, 0x16u);

            }
            objc_msgSend_objectAtIndexedSubscript_(v15, v102, (uint64_t)contextb, v103);
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectAtIndexedSubscript_(v16, v105, (uint64_t)contextb, v106);
            v107 = (void *)objc_claimAutoreleasedReturnValue();
            FullKey = (void *)AMFDRDataLocalCreateFullKey();

            if (!FullKey)
              break;
            objc_msgSend_objectForKeyedSubscript_(v60, v108, (uint64_t)FullKey, v109);
            v153 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v153)
            {
              handleForCategory(0);
              v117 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v117, OS_LOG_TYPE_ERROR))
                sub_2145706B4(buf, &buf[1]);
              goto LABEL_108;
            }
            objc_msgSend_objectAtIndexedSubscript_(v15, v110, (uint64_t)contextb, v111);
            v112 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectAtIndexedSubscript_(v16, v113, (uint64_t)contextb, v114);
            v115 = (void *)objc_claimAutoreleasedReturnValue();
            v147 = AMFDRDataDelete();

            handleForCategory(0);
            v116 = objc_claimAutoreleasedReturnValue();
            v117 = v116;
            if (!v147)
            {
              if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
                sub_21457070C(buf, &buf[1]);
              goto LABEL_108;
            }
            if (os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v162 = v153;
              _os_log_impl(&dword_214503000, v117, OS_LOG_TYPE_DEFAULT, "Put local data: %@", buf, 0xCu);
            }

            objc_msgSend_objectAtIndexedSubscript_(v15, v118, (uint64_t)contextb, v119);
            v120 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectAtIndexedSubscript_(v16, v121, (uint64_t)contextb, v122);
            v123 = (void *)objc_claimAutoreleasedReturnValue();
            v148 = AMFDRDataPutWithOptions();

            if (!v148)
            {
              handleForCategory(0);
              v117 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v117, OS_LOG_TYPE_ERROR))
                sub_2145706E0(buf, &buf[1]);
LABEL_108:

              objc_autoreleasePoolPop(v149);
              goto LABEL_109;
            }

            objc_autoreleasePoolPop(v149);
            if ((unint64_t)++contextb >= objc_msgSend_count(v15, v124, v125, v126))
              goto LABEL_74;
          }
          handleForCategory(0);
          v137 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v137, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend_objectAtIndexedSubscript_(v15, v138, (uint64_t)contextb, v139);
            v155 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectAtIndexedSubscript_(v16, v144, (uint64_t)contextb, v145);
            v146 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v162 = v155;
            v163 = 2112;
            v164 = v146;
            _os_log_error_impl(&dword_214503000, v137, OS_LOG_TYPE_ERROR, "Failed to create full key for data class: %@ instance: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v149);
          context = -66;
        }
        else
        {
LABEL_74:
          handleForCategory(0);
          v127 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_214503000, v127, OS_LOG_TYPE_DEFAULT, "Remote commit patch SUCCESS", buf, 2u);
          }

          context = 0;
        }
        goto LABEL_30;
      }
      handleForCategory(0);
      v136 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v136, OS_LOG_TYPE_ERROR))
        sub_214570654();

    }
    else
    {
      handleForCategory(0);
      v131 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v131, OS_LOG_TYPE_ERROR))
        sub_214570738();

      v60 = 0;
    }
LABEL_109:
    context = -66;
    goto LABEL_30;
  }
  v69 = 0;
  while (1)
  {
    contexta = (void *)MEMORY[0x2199D19CC]();
    objc_msgSend_objectAtIndexedSubscript_(v15, v70, v69, v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v16, v73, v69, v74);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = (void *)AMFDRDataLocalCreateFullKey();

    if (!v76)
      break;
    objc_msgSend_objectForKeyedSubscript_(v151, v77, (uint64_t)v76, v78);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v81)
    {
      handleForCategory(0);
      v135 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v135, OS_LOG_TYPE_ERROR))
        sub_214570798(buf, &buf[1]);

      goto LABEL_95;
    }
    objc_msgSend_addObject_(v154, v79, (uint64_t)v81, v80);

    objc_autoreleasePoolPop(contexta);
    if (++v69 >= (unint64_t)objc_msgSend_count(v151, v82, v83, v84))
    {
      v14 = v160;
      goto LABEL_46;
    }
  }
  handleForCategory(0);
  v132 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v132, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend_objectAtIndexedSubscript_(v15, v133, v69, v134);
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v16, v141, v69, v142);
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v162 = v140;
    v163 = 2112;
    v164 = v143;
    _os_log_error_impl(&dword_214503000, v132, OS_LOG_TYPE_ERROR, "Failed to create full key for data class: %@ instance: %@", buf, 0x16u);

  }
LABEL_95:
  objc_autoreleasePoolPop(contexta);
  v60 = 0;
  v61 = 0;
  context = -66;
  v57 = v154;
LABEL_30:
  if (a9)
    *a9 = objc_retainAutorelease(0);
  AMSupportSafeRelease();
  AMSupportSafeRelease();

  return context;
}

- (BOOL)deleteLocalData:(id)a3 dataClass:(id)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  NSObject *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  int v35;
  NSObject *v36;
  const char *v37;
  BOOL v38;
  id v40;
  void *v41;
  id obj;
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[4];
  id v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  id v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v43 = a3;
  v5 = a4;
  v52 = 0;
  v53 = &v52;
  v54 = 0x3032000000;
  v55 = sub_2145554AC;
  v56 = sub_2145554BC;
  v57 = (id)objc_opt_new();
  objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_contentsOfDirectoryAtPath_error_(v9, v10, (uint64_t)v43, 0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  v49[0] = MEMORY[0x24BDAC760];
  v49[1] = 3221225472;
  v49[2] = sub_2145554C4;
  v49[3] = &unk_24D1AA880;
  v40 = v5;
  v50 = v40;
  v51 = &v52;
  objc_msgSend_enumerateObjectsUsingBlock_(v41, v11, (uint64_t)v49, v12);
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  obj = (id)v53[5];
  v14 = 0;
  v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v45, (uint64_t)v62, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v46;
    while (2)
    {
      v17 = 0;
      v18 = v14;
      do
      {
        if (*(_QWORD *)v46 != v16)
          objc_enumerationMutation(obj);
        v19 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v17);
        v20 = (void *)MEMORY[0x2199D19CC]();
        v24 = (void *)objc_msgSend_mutableCopy(v43, v21, v22, v23);
        objc_msgSend_appendString_(v24, v25, (uint64_t)CFSTR("/"), v26);
        objc_msgSend_appendString_(v24, v27, v19, v28);
        handleForCategory(0);
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v59 = v24;
          _os_log_impl(&dword_214503000, v29, OS_LOG_TYPE_DEFAULT, "Deleting path:%@", buf, 0xCu);
        }

        objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v30, v31, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = v18;
        v35 = objc_msgSend_removeItemAtPath_error_(v33, v34, (uint64_t)v24, (uint64_t)&v44);
        v14 = v44;

        if ((v35 & 1) != 0)
        {
          handleForCategory(0);
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v59 = v24;
            _os_log_impl(&dword_214503000, v36, OS_LOG_TYPE_DEFAULT, "Successfully deleted:%@", buf, 0xCu);
          }
        }
        else
        {
          handleForCategory(0);
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v59 = v24;
            v60 = 2112;
            v61 = v14;
            _os_log_error_impl(&dword_214503000, v36, OS_LOG_TYPE_ERROR, "Failed to delete file:%@:%@", buf, 0x16u);
          }
        }

        objc_autoreleasePoolPop(v20);
        if (!v35)
        {
          v38 = 0;
          goto LABEL_18;
        }
        ++v17;
        v18 = v14;
      }
      while (v15 != v17);
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v37, (uint64_t)&v45, (uint64_t)v62, 16);
      if (v15)
        continue;
      break;
    }
  }
  v38 = 1;
LABEL_18:

  _Block_object_dispose(&v52, 8);
  return v38;
}

- (BOOL)deleteLocalData:(id)a3
{
  return objc_msgSend_deleteLocalData_dataClass_(self, a2, (uint64_t)a3, 0);
}

- (int64_t)_commitSealedData:(__AMFDR *)a3 fdrRemote:(__AMFDR *)a4 sealedData:(__AMFDRSealedData *)a5 syncEAN:(BOOL)a6 returnError:(id *)a7
{
  _BOOL4 v8;
  void *v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  char v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  id v45;
  void *v46;
  void *v47;
  const char *v48;
  void *v49;
  NSObject *v50;
  NSObject *v51;
  const char *v52;
  uint64_t v53;
  int64_t v54;
  NSObject *v55;
  void *v56;
  NSObject *v58;
  NSObject *v59;
  NSObject *v60;
  NSObject *v61;
  id v62;
  id v63;
  id v64;
  void *v65;
  uint8_t buf[4];
  void *v67;
  uint64_t v68;

  v8 = a6;
  v68 = *MEMORY[0x24BDAC8D0];
  v65 = 0;
  v10 = (void *)objc_opt_new();
  if (!AMFDRSealedDataGetSealingManifest())
  {
    handleForCategory(0);
    v55 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      sub_214570850();
    goto LABEL_25;
  }
  AMFDRSetOption();
  if (!objc_msgSend_deleteLocalData_(self, v11, (uint64_t)self->FDRPersistentDataPath, v12))
  {
LABEL_26:
    v19 = 0;
LABEL_27:
    v49 = 0;
    goto LABEL_28;
  }
  if (!AMFDRSealedDataCommit())
  {
    handleForCategory(0);
    v55 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      sub_214570AA4();
    goto LABEL_25;
  }
  if ((AMFDRSealedDataRestoreOptions() & 1) == 0)
  {
    handleForCategory(0);
    v55 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      sub_214570A78();
LABEL_25:

    goto LABEL_26;
  }
  v19 = 0;
  if (objc_msgSend_isEANSupported(v10, v13, v14, v15) && v8)
  {
    if ((objc_msgSend_setupVersionedFDRWithApTicket_(v10, v16, (uint64_t)self->apTicketData, v18) & 1) == 0)
    {
      handleForCategory(0);
      v58 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        sub_214570A4C();

      v19 = 0;
      goto LABEL_40;
    }
    objc_msgSend_absoluteString(self->dataDirectoryURL, v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = 0;
    v25 = objc_msgSend_stageVersionedFDREANWithdataDir_error_(v10, v24, (uint64_t)v23, (uint64_t)&v64);
    v19 = v64;

    handleForCategory(0);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if ((v25 & 1) == 0)
    {
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        sub_2145709EC();

      goto LABEL_40;
    }
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_214503000, v27, OS_LOG_TYPE_DEFAULT, "stageFDREANWithApTicket passed", buf, 2u);
    }

  }
  objc_msgSend_sharedSingleton(CRFileSystemController, v16, v17, v18);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend_commitToFileSystem(v28, v29, v30, v31);

  if (v32)
  {
    handleForCategory(0);
    v59 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
      sub_2145709C0();

    goto LABEL_27;
  }
  if (v8)
  {
    objc_msgSend_sharedSingleton(CRFileSystemController, v33, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend_syncAlternativeFDRPath(v36, v37, v38, v39);

    if ((v40 & 1) == 0)
    {
      handleForCategory(0);
      v60 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
        sub_214570994();

LABEL_40:
      v49 = 0;
      v54 = -999;
      goto LABEL_29;
    }
  }
  if ((objc_msgSend_allowFactoryReset(self->handler, v33, v34, v35) & 1) != 0)
    goto LABEL_18;
  v63 = v19;
  v44 = objc_msgSend_deleteNVRAMValueForKey_error_(CRNVRAMController, v41, (uint64_t)CFSTR("40A0DDD2-77F8-4392-B4A3-1E7304206516:IsServicePart"), (uint64_t)&v63);
  v45 = v63;

  if ((v44 & 1) != 0)
  {
    v19 = v45;
LABEL_18:
    v46 = v19;
    objc_msgSend_sharedDataAccessor(MEMORY[0x24BE63540], v41, v42, v43);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = v19;
    v49 = (void *)objc_msgSend_copyPathForPersistentData_error_(v47, v48, 100, (uint64_t)&v62);
    v19 = v62;

    handleForCategory(0);
    v50 = objc_claimAutoreleasedReturnValue();
    v51 = v50;
    if (v49 && !v19)
    {
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v67 = v49;
        _os_log_impl(&dword_214503000, v51, OS_LOG_TYPE_DEFAULT, "new FDR data path is %@", buf, 0xCu);
      }

      objc_msgSend_URLWithString_(MEMORY[0x24BDBCF48], v52, (uint64_t)v49, v53);
      AMFDRSetOption();
      v19 = 0;
      v54 = 0;
      goto LABEL_29;
    }
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      sub_2145708B0();

LABEL_28:
    v54 = -17;
    goto LABEL_29;
  }
  handleForCategory(0);
  v61 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
    sub_214570910((uint64_t)v45, v61);

  v49 = 0;
  v54 = -999;
  v19 = v45;
LABEL_29:
  v56 = v65;
  if (v65)
  {

    v19 = v56;
  }
  if (a7)
    *a7 = objc_retainAutorelease(v19);

  return v54;
}

- (int64_t)CRFDRPostRecoverVerify:(__AMFDR *)a3 fdrRemote:(__AMFDR *)a4 syncEAN:(BOOL)a5 fdrError:(id *)a6
{
  NSObject *v7;
  NSObject *v8;

  AMFDRSetOption();
  AMFDRSetOption();
  if ((AMFDRSealingMapPopulateSealingManifest() & 1) != 0)
  {
    handleForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_214570B04();
  }
  else
  {
    handleForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_214570C24();
  }

  if (a6)
    *a6 = objc_retainAutorelease(0);
  AMSupportSafeRelease();

  return -3;
}

- (int64_t)CRFDRDataRepairRecover:(__AMFDR *)a3 fdrRemote:(__AMFDR *)a4 syncEAN:(BOOL)a5 fdrError:(id *)a6
{
  _BOOL8 v7;
  uint64_t v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  NSObject *v17;
  const char *v18;
  int64_t v19;
  id v20;
  void *v21;
  id v23;
  uint8_t buf[8];
  id v25;
  uint64_t v26;
  void *v27;

  v7 = a5;
  v26 = 0;
  v27 = 0;
  v25 = 0;
  v11 = objc_msgSend_CRFDRLocalPopulate_fdrRemote_sealedData_fdrError_(self, a2, (uint64_t)a3, (uint64_t)a4, &v26, &v25);
  v12 = v25;
  handleForCategory(0);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v11 || v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_214570C84();
    goto LABEL_23;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_214503000, v14, OS_LOG_TYPE_DEFAULT, "FDR Data Populated", buf, 2u);
  }

  if (!AMFDRSealedDataCreateSealingRequest() || v27)
  {
    handleForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_214570DF4();
    goto LABEL_22;
  }
  if (!AMFDRSealedDataGetSealingRequest())
  {
    handleForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_214570CE4();
    goto LABEL_22;
  }
  if ((AMFDRSealedDataClearSealingManifest() & 1) == 0)
  {
    handleForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_214570DC8();
    goto LABEL_22;
  }
  objc_msgSend__logSealingRequest_(self, v15, v26, v16);
  ++self->sealCount;
  if (!AMFDRSealedDataHTTPSign() || !AMFDRSealedDataGetSealingManifest() || v27)
  {
    handleForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_214570D10();
    goto LABEL_22;
  }
  handleForCategory(0);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_214503000, v17, OS_LOG_TYPE_DEFAULT, "Remote FDR Data Sealing successful", buf, 2u);
  }

  if (!AMFDRSealedDataGetSealingManifest())
  {
    handleForCategory(0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_214570D70();
LABEL_22:
    v12 = 0;
LABEL_23:
    v19 = -3;
    goto LABEL_24;
  }
  v23 = 0;
  v19 = objc_msgSend__commitSealedData_fdrRemote_sealedData_syncEAN_returnError_(self, v18, (uint64_t)a3, (uint64_t)a4, v26, v7, &v23);
  v20 = v23;
  v12 = v20;
  if (!v19 && !v20)
  {
    v19 = 0;
    goto LABEL_25;
  }
  handleForCategory(0);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    sub_214570D9C();
LABEL_24:

LABEL_25:
  v21 = v27;
  if (v27)
  {

    v12 = v21;
  }
  if (a6)
    *a6 = objc_retainAutorelease(v12);
  AMSupportSafeRelease();

  return v19;
}

- (void)_logSealingRequest:(__AMFDRSealedData *)a3
{
  void *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  AMFDRSealedDataGetSealingRequest();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  AMSupportBase64Encode();

}

- (BOOL)_commitData:(id)a3 fdrlocal:(__AMFDR *)a4 fdrError:(id *)a5
{
  id v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  id v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  void *v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  const char *v47;
  NSObject *v48;
  NSObject *v49;
  NSObject *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  BOOL v69;
  NSObject *v70;
  NSObject *v72;
  void *v75;
  void *v76;
  void *v77;
  id obj;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  void *v83;
  uint8_t v84[4];
  uint64_t v85;
  uint8_t buf[4];
  void *v87;
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v83 = 0;
  v77 = (void *)objc_opt_new();
  v75 = (void *)objc_opt_new();
  v76 = (void *)objc_opt_new();
  handleForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    sub_214570F48();

  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  obj = v5;
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v79, (uint64_t)v88, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v80;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v80 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * i);
        handleForCategory(0);
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v87 = v12;
          _os_log_debug_impl(&dword_214503000, v13, OS_LOG_TYPE_DEBUG, "key:%@", buf, 0xCu);
        }

        v14 = objc_alloc(MEMORY[0x24BDD1798]);
        v16 = (void *)objc_msgSend_initWithPattern_options_error_(v14, v15, (uint64_t)CFSTR("([a-zA-Z0-9]{4})-(.*$)"), 0, 0);
        v20 = objc_msgSend_length(v12, v17, v18, v19);
        objc_msgSend_firstMatchInString_options_range_(v16, v21, (uint64_t)v12, 0, 0, v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        handleForCategory(0);
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          sub_214570EE0(v84, v22, &v85, v23);

        if (v22 && (unint64_t)objc_msgSend_numberOfRanges(v22, v24, v25, v26) >= 2)
        {
          v29 = objc_msgSend_rangeAtIndex_(v22, v27, 1, v28);
          objc_msgSend_substringWithRange_(v12, v30, v29, (uint64_t)v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend_rangeAtIndex_(v22, v32, 2, v33);
          objc_msgSend_substringWithRange_(v12, v35, v34, (uint64_t)v35);
          v36 = objc_claimAutoreleasedReturnValue();
          v39 = (void *)v36;
          if (v31 && v36)
          {
            objc_msgSend_addObject_(v77, v37, (uint64_t)v31, v38);
            objc_msgSend_addObject_(v75, v40, (uint64_t)v39, v41);
            objc_msgSend_objectForKeyedSubscript_(obj, v42, (uint64_t)v12, v43);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObject_(v76, v45, (uint64_t)v44, v46);

          }
        }

      }
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v47, (uint64_t)&v79, (uint64_t)v88, 16);
    }
    while (v9);
  }

  handleForCategory(0);
  v48 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v87 = v77;
    _os_log_impl(&dword_214503000, v48, OS_LOG_TYPE_DEFAULT, "Commit dataClasses:%@", buf, 0xCu);
  }

  handleForCategory(0);
  v49 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v87 = v75;
    _os_log_impl(&dword_214503000, v49, OS_LOG_TYPE_DEFAULT, "Commit dataInstances:%@", buf, 0xCu);
  }

  handleForCategory(0);
  v50 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v87 = v76;
    _os_log_impl(&dword_214503000, v50, OS_LOG_TYPE_DEFAULT, "Commit dataForPut:%@", buf, 0xCu);
  }

  if (!objc_msgSend_count(v77, v51, v52, v53)
    && !objc_msgSend_count(v75, v54, v55, v56)
    && !objc_msgSend_count(v76, v54, v55, v56))
  {
    handleForCategory(0);
    v70 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_214503000, v70, OS_LOG_TYPE_DEFAULT, "No data to recover, skipping ...", buf, 2u);
    }
    v69 = 1;
LABEL_38:

    v68 = 0;
    if (!a5)
      goto LABEL_40;
LABEL_39:
    *a5 = objc_retainAutorelease(v68);
    goto LABEL_40;
  }
  v57 = objc_msgSend_count(v77, v54, v55, v56, a4);
  if (v57 != objc_msgSend_count(v75, v58, v59, v60)
    || (v64 = objc_msgSend_count(v76, v61, v62, v63), v64 != objc_msgSend_count(v75, v65, v66, v67)))
  {
    handleForCategory(0);
    v70 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
      sub_214570EB4();
    v69 = 0;
    goto LABEL_38;
  }
  if (AMFDRDataMultiPut() && !v83)
  {
    v68 = 0;
    v69 = 1;
    if (!a5)
      goto LABEL_40;
    goto LABEL_39;
  }
  handleForCategory(0);
  v72 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
    sub_214570E54();

  v69 = 0;
  if (v83)
    v68 = v83;
  else
    v68 = 0;
  if (a5)
    goto LABEL_39;
LABEL_40:

  return v69;
}

- (id)_getCRFDRMetaDataDictionary
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  const char *v6;
  void *v7;

  v2 = (void *)objc_opt_new();
  v3 = (void *)MGCopyAnswer();
  v4 = (void *)MGCopyAnswer();
  v5 = (void *)MGCopyAnswer();
  v7 = (void *)MGCopyAnswer();
  if (v3)
    objc_msgSend_setObject_forKeyedSubscript_(v2, v6, (uint64_t)v3, (uint64_t)CFSTR("ECID"));
  if (v4)
    objc_msgSend_setObject_forKeyedSubscript_(v2, v6, (uint64_t)v4, (uint64_t)CFSTR("ChipID"));
  if (v5)
    objc_msgSend_setObject_forKeyedSubscript_(v2, v6, (uint64_t)v5, (uint64_t)CFSTR("BoardID"));
  if (v7)
    objc_msgSend_setObject_forKeyedSubscript_(v2, v6, (uint64_t)v7, (uint64_t)CFSTR("UDID"));

  return v2;
}

- (int64_t)CRFDRVerifyLocal:(__AMFDR *)a3 fdrRemote:(__AMFDR *)a4 sealedData:(__AMFDRSealedData *)a5 mergedDataClasses:(id)a6 mergedDataInstances:(id)a7 currentManifestProperties:(id)a8 fdrError:(id *)a9 syncEAN:(BOOL)a10 postSeal:(BOOL)a11 ignoreBenignError:(BOOL)a12
{
  id v17;
  id v18;
  id v19;
  void *v20;
  __AMFDRSealedData *SealedData;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  NSArray *minimalSealingInstances;
  const char *v26;
  NSObject *v27;
  NSObject *v28;
  int64_t v29;
  id v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  void *v47;
  NSObject *v49;
  int v50;
  id v51;
  id v52;
  void *v53;
  uint8_t buf[4];
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v53 = 0;
  v20 = (void *)objc_opt_new();
  SealedData = (__AMFDRSealedData *)AMFDRSealingManifestCreateSealedData();
  if (!SealedData)
  {
    handleForCategory(0);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      sub_214570FB4();
    goto LABEL_43;
  }
  if ((AMFDRSealingMapConfigSealedData() & 1) == 0)
  {
    handleForCategory(0);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      sub_214571278();
    v34 = 0;
    v29 = -999;
    goto LABEL_44;
  }
  if (!AMFDRSealedDataConfigureOptionsForRecover())
  {
    handleForCategory(0);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      sub_214571218();
    goto LABEL_43;
  }
  if (!AMFDRSealedDataSetDataClassInstance())
  {
    handleForCategory(0);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      sub_2145711B8();
    goto LABEL_43;
  }
  minimalSealingInstances = self->_minimalSealingInstances;
  if (minimalSealingInstances
    && objc_msgSend_count(minimalSealingInstances, v22, v23, v24)
    && !AMFDRSealedDataSetMinimalManifestClassInstance())
  {
    handleForCategory(0);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      sub_214571158();
    goto LABEL_43;
  }
  if (!AMFDRSealedDataPopulate())
  {
    handleForCategory(0);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      sub_2145710F8();
    goto LABEL_43;
  }
  if (AMFDRSealedDataVerify())
    goto LABEL_15;
  if (!a12)
  {
    handleForCategory(0);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v55 = v53;
      _os_log_impl(&dword_214503000, v28, OS_LOG_TYPE_DEFAULT, "Local FDR Data verification failure:%@", buf, 0xCu);
    }
    goto LABEL_43;
  }
  v50 = objc_msgSend_CRFDRCheckVerificationFatalErrors_fdrLocal_sealedData_strict_(self, v26, 0, (uint64_t)a3, SealedData, 1);
  handleForCategory(0);
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (!v50)
  {
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      sub_214571098();
LABEL_43:
    v34 = 0;
    v29 = -40;
    goto LABEL_44;
  }
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v55 = v53;
    _os_log_impl(&dword_214503000, v28, OS_LOG_TYPE_DEFAULT, "AMFDRSealedDataPopulate failed with benign error, conitnue: %@", buf, 0xCu);
  }

  AMSupportSafeRelease();
  v53 = 0;
LABEL_15:
  v52 = 0;
  v29 = objc_msgSend_CRFDRVerifyProperties_currentManifestProperties_fdrError_(self, v26, (uint64_t)a3, (uint64_t)v19, &v52);
  v30 = v52;
  v34 = v30;
  if (v29 || v30)
  {
    handleForCategory(0);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      sub_214570FE0();
  }
  else
  {
    if (!a10 || !objc_msgSend_isEANSupported(v20, v31, v32, v33))
    {
      v29 = 0;
      v34 = 0;
      goto LABEL_45;
    }
    v34 = 0;
    if ((objc_msgSend_verifyFDRDataFromEANUsingCache_cachedData_(v20, v35, 0, 0) & 1) != 0)
      goto LABEL_25;
    handleForCategory(0);
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_214503000, v39, OS_LOG_TYPE_DEFAULT, "Verify FDR Data from EAN failed, sync EAN...", buf, 2u);
    }

    objc_msgSend_sharedDataAccessor(MEMORY[0x24BE63540], v40, v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = 0;
    v28 = objc_msgSend_copyPathForPersistentData_error_(v43, v44, 100, (uint64_t)&v51);
    v34 = v51;

    if (v28)
    {
      if ((objc_msgSend_writeFDRDataToEANWithdataDir_(v20, v45, (uint64_t)v28, v46) & 1) != 0)
      {

LABEL_25:
        if (!a11 || (objc_msgSend_swapVersionedFDR(v20, v36, v37, v38) & 1) != 0)
        {
          v29 = 0;
          goto LABEL_45;
        }
        handleForCategory(0);
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          sub_214571040();
        v29 = -68;
        goto LABEL_44;
      }
      handleForCategory(0);
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        sub_21457106C();
    }
    else
    {
      handleForCategory(0);
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        sub_2145708B0();
    }

    v29 = -19;
  }
LABEL_44:

LABEL_45:
  v47 = v53;
  if (v53)
  {

    v34 = v47;
  }
  if (a9)
    *a9 = objc_retainAutorelease(v34);
  if (a5)
    *a5 = SealedData;
  else
    AMSupportSafeRelease();

  return v29;
}

- (int64_t)CRFDRLocalPopulate:(__AMFDR *)a3 fdrRemote:(__AMFDR *)a4 sealedData:(__AMFDRSealedData *)a5 fdrError:(id *)a6
{
  __AMFDRSealedData *SealedData;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  NSArray *minimalSealingInstances;
  int64_t v15;
  NSObject *v16;
  const char *v18;
  int v19;
  NSObject *v20;
  uint8_t buf[4];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  SealedData = (__AMFDRSealedData *)AMFDRSealingManifestCreateSealedData();
  if (!SealedData)
  {
    handleForCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_214570FB4();
LABEL_13:

    v15 = -3;
    if (!a6)
      goto LABEL_15;
    goto LABEL_14;
  }
  if ((AMFDRSealingMapConfigSealedData() & 1) == 0)
  {
    handleForCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_214571278();
    goto LABEL_13;
  }
  if ((AMFDRSealedDataConfigureOptionsForRecover() & 1) == 0)
  {
    handleForCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_2145712D8();
    goto LABEL_13;
  }
  if (!AMFDRSealedDataSetDataClassInstance())
  {
    handleForCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_2145711B8();
    goto LABEL_13;
  }
  minimalSealingInstances = self->_minimalSealingInstances;
  if (minimalSealingInstances
    && objc_msgSend_count(minimalSealingInstances, v11, v12, v13)
    && !AMFDRSealedDataSetMinimalManifestClassInstance())
  {
    handleForCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_214571158();
    goto LABEL_13;
  }
  if (AMFDRSealedDataPopulate())
  {
    v15 = 0;
    if (!a6)
      goto LABEL_15;
LABEL_14:
    *a6 = objc_retainAutorelease(0);
    goto LABEL_15;
  }
  AMSupportSafeRelease();
  AMFDRSealedDataVerify();
  v19 = objc_msgSend_CRFDRCheckVerificationFatalErrors_fdrLocal_sealedData_strict_(self, v18, 0, (uint64_t)a3, SealedData, 0);
  handleForCategory(0);
  v20 = objc_claimAutoreleasedReturnValue();
  v16 = v20;
  if (!v19)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_214571098();
    goto LABEL_13;
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v22 = 0;
    _os_log_impl(&dword_214503000, v16, OS_LOG_TYPE_DEFAULT, "AMFDRSealedDataPopulate failed with benign error, conitnue: %@", buf, 0xCu);
  }

  AMSupportSafeRelease();
  v15 = 0;
  if (a6)
    goto LABEL_14;
LABEL_15:
  if (a5)
    *a5 = SealedData;
  else
    AMSupportSafeRelease();

  return v15;
}

- (int64_t)verifyClaimCountAndSalesDistrictWithError:(id *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  int64_t v11;
  void *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t j;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  NSObject *v62;
  const char *v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  id v72;
  id *v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  id v88;
  uint8_t v89[128];
  uint8_t buf[4];
  uint64_t v91;
  __int16 v92;
  void *v93;
  __int16 v94;
  void *v95;
  _BYTE v96[128];
  uint64_t v97;

  v97 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_opt_new();
  v8 = v5;
  if (self->keyBlob)
  {
    handleForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_214503000, v9, OS_LOG_TYPE_DEFAULT, "Skip checking for SSR", buf, 2u);
    }

    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
  }
  else
  {
    v88 = 0;
    objc_msgSend_extractRCHLRepairHistoryAndClaimCount_(v5, v6, (uint64_t)&v88, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v88;
    v11 = 0;
    v77 = v8;
    v73 = a3;
    v74 = v12;
    v72 = v13;
    v10 = 0;
    if ((objc_msgSend_allowUsedPart(self, v14, v15, v16) & 1) == 0 && v13)
    {
      v86 = 0u;
      v87 = 0u;
      v84 = 0u;
      v85 = 0u;
      v20 = v13;
      v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v84, (uint64_t)v96, 16);
      if (v22)
      {
        v25 = v22;
        v75 = 0;
        v10 = 0;
        v26 = *(_QWORD *)v85;
        do
        {
          for (i = 0; i != v25; ++i)
          {
            if (*(_QWORD *)v85 != v26)
              objc_enumerationMutation(v20);
            v28 = *(_QWORD *)(*((_QWORD *)&v84 + 1) + 8 * i);
            objc_msgSend_spcWithComponent_(self->handler, v23, v28, v24);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v20, v30, v28, v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            handleForCategory(0);
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412802;
              v91 = v28;
              v92 = 2112;
              v93 = v29;
              v94 = 2112;
              v95 = v32;
              _os_log_impl(&dword_214503000, v33, OS_LOG_TYPE_DEFAULT, "key: %@, spc: %@, cc: %@", buf, 0x20u);
            }

            if (v29)
            {
              if (objc_msgSend_containsObject_(self->_partSPC, v34, (uint64_t)v29, v35))
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0 && (int)objc_msgSend_intValue(v32, v36, v37, v38) >= 2)
                {
                  v41 = (void *)MEMORY[0x24BDD17C8];
                  objc_msgSend_objectForKeyedSubscript_(v20, v39, (uint64_t)v29, v40);
                  v78 = v10;
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_stringWithFormat_(v41, v43, (uint64_t)CFSTR("Not allow used part %@ (%@): %@"), v44, v29, v28, v42);
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  v75 = -90;
                  sub_214512470((void *)0xFFFFFFFFFFFFFFA6, v45, 0);
                  v46 = objc_claimAutoreleasedReturnValue();

                  v10 = (id)v46;
                }
              }
            }

          }
          v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v23, (uint64_t)&v84, (uint64_t)v96, 16);
        }
        while (v25);
      }
      else
      {
        v75 = 0;
        v10 = 0;
      }

      v11 = v75;
      v8 = v77;
      a3 = v73;
      v12 = v74;
      v13 = v72;
    }
    if ((objc_msgSend_allowSelfService(self, v17, v18, v19) & 1) == 0 && v12)
    {
      v79 = v10;
      v76 = v11;
      objc_msgSend_extractRepairCentersWithRCHLHistory_(v8, v47, (uint64_t)v12, v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = 0u;
      v81 = 0u;
      v82 = 0u;
      v83 = 0u;
      v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(v49, v50, (uint64_t)&v80, (uint64_t)v89, 16);
      if (v51)
      {
        v54 = v51;
        v55 = *(_QWORD *)v81;
        do
        {
          for (j = 0; j != v54; ++j)
          {
            if (*(_QWORD *)v81 != v55)
              objc_enumerationMutation(v49);
            v57 = *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * j);
            objc_msgSend_spcWithComponent_(self->handler, v52, v57, v53);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v49, v59, v57, v60);
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            handleForCategory(0);
            v62 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412802;
              v91 = v57;
              v92 = 2112;
              v93 = v58;
              v94 = 2112;
              v95 = v61;
              _os_log_impl(&dword_214503000, v62, OS_LOG_TYPE_DEFAULT, "key: %@, spc: %@, sd: %@", buf, 0x20u);
            }

            if (v58
              && objc_msgSend_containsObject_(self->_partSPC, v63, (uint64_t)v58, v64)
              && objc_msgSend_isSelfServiceSalesDistrict_(v77, v65, (uint64_t)v61, v66))
            {
              objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v67, (uint64_t)CFSTR("Not allow self repaired %@ (%@): %@"), v68, v58, v57, v61);
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              v76 = -91;
              sub_214512470((void *)0xFFFFFFFFFFFFFFA5, v69, 0);
              v70 = objc_claimAutoreleasedReturnValue();

              v79 = (void *)v70;
            }

          }
          v54 = objc_msgSend_countByEnumeratingWithState_objects_count_(v49, v52, (uint64_t)&v80, (uint64_t)v89, 16);
        }
        while (v54);
      }

      v11 = v76;
      v8 = v77;
      a3 = v73;
      v12 = v74;
      v13 = v72;
      v10 = v79;
    }
    if (a3 && v10)
    {
      v10 = objc_retainAutorelease(v10);
      *a3 = v10;
    }
  }

  return v11;
}

- (int64_t)CRFDRVerifyProperties:(__AMFDR *)a3 currentManifestProperties:(id)a4 fdrError:(id *)a5
{
  id v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  id v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  int isEqual;
  NSObject *v44;
  int64_t v45;
  void *v46;
  __CFString *v47;
  void *v49;
  id *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t v55[128];
  uint8_t buf[4];
  id v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  AMFDRGetOptions();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v7;
  if (v7 && objc_msgSend_count(v7, v8, v9, v10))
  {
    objc_msgSend_objectForKeyedSubscript_(v11, v8, (uint64_t)CFSTR("SealingPropertiesOverride"), v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend_count(v12, v13, v14, v15);
  }
  else
  {
    v12 = 0;
    v16 = objc_msgSend_count(0, v8, v9, v10);
  }
  v20 = v16;
  v21 = objc_msgSend_count(v6, v17, v18, v19);
  if (!v12 || !v20)
  {
    v47 = CFSTR("sealingProperties empty");
    goto LABEL_28;
  }
  if (!v6 || !v21)
  {
    v47 = CFSTR("currentManifestProperties empty");
LABEL_28:
    v45 = -40;
    sub_214512470((void *)0xFFFFFFFFFFFFFFD8, v47, 0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a5)
      goto LABEL_30;
    goto LABEL_29;
  }
  v50 = a5;
  handleForCategory(0);
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v57 = v12;
    _os_log_impl(&dword_214503000, v22, OS_LOG_TYPE_DEFAULT, "sealingProperties: %@", buf, 0xCu);
  }

  handleForCategory(0);
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v57 = v6;
    _os_log_impl(&dword_214503000, v23, OS_LOG_TYPE_DEFAULT, "currentManifestProperties: %@", buf, 0xCu);
  }

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v24 = v12;
  v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v51, (uint64_t)v55, 16);
  if (!v26)
  {
LABEL_22:

    handleForCategory(0);
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_214503000, v44, OS_LOG_TYPE_DEFAULT, "Properties verify successful", buf, 2u);
    }

    v45 = 0;
    v46 = 0;
    a5 = v50;
    if (!v50)
      goto LABEL_30;
LABEL_29:
    *a5 = objc_retainAutorelease(v46);
    goto LABEL_30;
  }
  v29 = v26;
  v30 = *(_QWORD *)v52;
  v49 = v11;
LABEL_15:
  v31 = 0;
  while (1)
  {
    if (*(_QWORD *)v52 != v30)
      objc_enumerationMutation(v24);
    v32 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * v31);
    objc_msgSend_objectForKeyedSubscript_(v6, v27, v32, v28, v49);
    v33 = objc_claimAutoreleasedReturnValue();
    if (!v33)
      break;
    v36 = (void *)v33;
    objc_msgSend_objectForKeyedSubscript_(v6, v34, v32, v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v24, v38, v32, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    isEqual = objc_msgSend_isEqual_(v37, v41, (uint64_t)v40, v42);

    if (!isEqual)
      break;
    if (v29 == ++v31)
    {
      v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v27, (uint64_t)&v51, (uint64_t)v55, 16);
      v11 = v49;
      if (v29)
        goto LABEL_15;
      goto LABEL_22;
    }
  }
  v45 = -40;
  sub_214512470((void *)0xFFFFFFFFFFFFFFD8, CFSTR("sealingProperties and currentManifestProperties mismatched"), 0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v49;
  a5 = v50;
  if (v50)
    goto LABEL_29;
LABEL_30:

  return v45;
}

- (BOOL)CRFDRCheckVerificationFatalErrors:(__CFError *)a3 fdrLocal:(__AMFDR *)a4 sealedData:(__AMFDRSealedData *)a5 strict:(BOOL)a6
{
  char v7;
  CFDictionaryRef v8;
  const char *v9;
  uint64_t v10;
  CFDictionaryRef v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  v7 = 0;
  if (AMFDRSealedDataVerificationErrorIsBenign())
  {
    v8 = CFErrorCopyUserInfo(a3);
    v11 = v8;
    if (v8)
    {
      objc_msgSend_objectForKeyedSubscript_(v8, v9, (uint64_t)CFSTR("MissingDataInstances"), v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v12;
      if (v12)
      {
        if (objc_msgSend_count(v12, v13, v14, v15))
          v7 = 0;
        else
          v7 = -1;
      }
      else
      {
        v7 = 1;
      }

    }
    else
    {
      v7 = 1;
    }

  }
  return v7 & 1;
}

- (int64_t)CRFDRRecoverMissingData:(id *)a3 fdrLocal:(__AMFDR *)a4 fdrRemote:(__AMFDR *)a5
{
  NSObject *v6;
  int v7;
  NSObject *v8;
  int64_t v9;
  NSObject *v10;
  uint8_t buf[4];
  _DWORD v13[7];

  *(_QWORD *)&v13[5] = *MEMORY[0x24BDAC8D0];
  handleForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)v13 = "-[CRFDRSeal CRFDRRecoverMissingData:fdrLocal:fdrRemote:]";
    _os_log_impl(&dword_214503000, v6, OS_LOG_TYPE_DEFAULT, "entering %s ...", buf, 0xCu);
  }

  if (!AMFDRSealingManifestCreateSealedData())
  {
    handleForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_214570FB4();
    goto LABEL_17;
  }
  if ((AMFDRSealingMapConfigSealedData() & 1) == 0)
  {
    handleForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_214571278();
    goto LABEL_17;
  }
  if ((AMFDRSealedDataConfigureOptionsForRecover() & 1) == 0)
  {
    handleForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_2145712D8();
    goto LABEL_17;
  }
  if (!AMFDRSealedDataSetDataClassInstance())
  {
    handleForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_2145711B8();
    goto LABEL_17;
  }
  v7 = AMFDRSealedDataPopulate();
  handleForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    v13[0] = v7;
    LOWORD(v13[1]) = 2112;
    *(_QWORD *)((char *)&v13[1] + 2) = 0;
    _os_log_impl(&dword_214503000, v8, OS_LOG_TYPE_DEFAULT, "AMFDRSealedDataPopulate status: %d error: %@", buf, 0x12u);
  }

  AMSupportSafeRelease();
  if (!AMFDRSealedDataPopulateWithExistingData())
  {
    handleForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_214571364();
LABEL_17:
    v9 = -3;
    goto LABEL_18;
  }
  if (AMFDRSealedDataCommit())
  {
    v9 = 0;
    if (!a3)
      goto LABEL_20;
    goto LABEL_19;
  }
  handleForCategory(0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    sub_214571304();
  v9 = -17;
LABEL_18:

  if (a3)
LABEL_19:
    *a3 = objc_retainAutorelease(0);
LABEL_20:
  AMSupportSafeRelease();

  return v9;
}

- (id)summarizePatchInputs
{
  const char *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  NSArray *patchDataClasses;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  NSArray *patchDataInstances;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  void *v33;
  const char *v34;
  _QWORD v36[4];
  id v37;

  v5 = (void *)objc_opt_new();
  if (self->_patchValues)
  {
    v6 = (void *)objc_opt_new();
    if (objc_msgSend_count(self->_patchValues, v7, v8, v9))
    {
      v10 = 0;
      v11 = MEMORY[0x24BDAC760];
      do
      {
        objc_msgSend_objectAtIndexedSubscript_(self->_patchValues, v3, v10, v4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_opt_new();
        v36[0] = v11;
        v36[1] = 3221225472;
        v36[2] = sub_21455826C;
        v36[3] = &unk_24D1AA838;
        v37 = v13;
        v14 = v13;
        objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v12, v15, (uint64_t)v36, v16);
        objc_msgSend_addObject_(v6, v17, (uint64_t)v14, v18);

        ++v10;
      }
      while (objc_msgSend_count(self->_patchValues, v19, v20, v21) > v10);
    }
  }
  else
  {
    v6 = 0;
  }
  patchDataClasses = self->_patchDataClasses;
  if (patchDataClasses)
  {
    objc_msgSend_setObject_forKeyedSubscript_(v5, v3, (uint64_t)patchDataClasses, (uint64_t)CFSTR("patchDataClasses"));
  }
  else
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v3, 0, v4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v5, v26, (uint64_t)v25, (uint64_t)CFSTR("patchDataClasses"));

  }
  patchDataInstances = self->_patchDataInstances;
  if (!patchDataInstances)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v23, 0, v24);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v5, v32, (uint64_t)v31, (uint64_t)CFSTR("patchDataInstances"));

    if (v6)
      goto LABEL_12;
LABEL_14:
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v28, v29, v30);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v5, v34, (uint64_t)v33, (uint64_t)CFSTR("patchValues"));

    goto LABEL_15;
  }
  objc_msgSend_setObject_forKeyedSubscript_(v5, v23, (uint64_t)patchDataInstances, (uint64_t)CFSTR("patchDataInstances"));
  if (!v6)
    goto LABEL_14;
LABEL_12:
  objc_msgSend_setObject_forKeyedSubscript_(v5, v28, (uint64_t)v6, (uint64_t)CFSTR("patchValues"));
LABEL_15:

  return v5;
}

- (NSData)apTicketData
{
  return self->apTicketData;
}

- (void)setApTicketData:(id)a3
{
  objc_storeStrong((id *)&self->apTicketData, a3);
}

- (CRFDRBaseDeviceHandler)handler
{
  return self->handler;
}

- (void)setHandler:(id)a3
{
  objc_storeStrong((id *)&self->handler, a3);
}

- (setupModuleChallengeCallBack)delegate
{
  return (setupModuleChallengeCallBack *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (NSString)sealedDataInstance
{
  return self->_sealedDataInstance;
}

- (void)setSealedDataInstance:(id)a3
{
  objc_storeStrong((id *)&self->_sealedDataInstance, a3);
}

- (NSDictionary)claimDict
{
  return self->_claimDict;
}

- (void)setClaimDict:(id)a3
{
  objc_storeStrong((id *)&self->_claimDict, a3);
}

- (NSDictionary)updateClassDict
{
  return self->_updateClassDict;
}

- (void)setUpdateClassDict:(id)a3
{
  objc_storeStrong((id *)&self->_updateClassDict, a3);
}

- (NSMutableArray)currentClasses
{
  return self->_currentClasses;
}

- (void)setCurrentClasses:(id)a3
{
  objc_storeStrong((id *)&self->_currentClasses, a3);
}

- (NSMutableArray)currentInstances
{
  return self->_currentInstances;
}

- (void)setCurrentInstances:(id)a3
{
  objc_storeStrong((id *)&self->_currentInstances, a3);
}

- (NSDictionary)currentProperties
{
  return self->_currentProperties;
}

- (void)setCurrentProperties:(id)a3
{
  objc_storeStrong((id *)&self->_currentProperties, a3);
}

- (NSMutableArray)makeClasses
{
  return self->_makeClasses;
}

- (void)setMakeClasses:(id)a3
{
  objc_storeStrong((id *)&self->_makeClasses, a3);
}

- (NSMutableArray)makeInstances
{
  return self->_makeInstances;
}

- (void)setMakeInstances:(id)a3
{
  objc_storeStrong((id *)&self->_makeInstances, a3);
}

- (NSDictionary)makeProperties
{
  return self->_makeProperties;
}

- (void)setMakeProperties:(id)a3
{
  objc_storeStrong((id *)&self->_makeProperties, a3);
}

- (NSDictionary)updateProperties
{
  return self->_updateProperties;
}

- (void)setUpdateProperties:(id)a3
{
  objc_storeStrong((id *)&self->_updateProperties, a3);
}

- (NSArray)minimalSealingInstances
{
  return self->_minimalSealingInstances;
}

- (void)setMinimalSealingInstances:(id)a3
{
  objc_storeStrong((id *)&self->_minimalSealingInstances, a3);
}

- (NSArray)minimalSealedClasses
{
  return self->_minimalSealedClasses;
}

- (void)setMinimalSealedClasses:(id)a3
{
  objc_storeStrong((id *)&self->_minimalSealedClasses, a3);
}

- (NSArray)minimalSealedInstances
{
  return self->_minimalSealedInstances;
}

- (void)setMinimalSealedInstances:(id)a3
{
  objc_storeStrong((id *)&self->_minimalSealedInstances, a3);
}

- (NSMutableArray)recoverDataClasses
{
  return self->_recoverDataClasses;
}

- (void)setRecoverDataClasses:(id)a3
{
  objc_storeStrong((id *)&self->_recoverDataClasses, a3);
}

- (NSMutableArray)recoverDataInstances
{
  return self->_recoverDataInstances;
}

- (void)setRecoverDataInstances:(id)a3
{
  objc_storeStrong((id *)&self->_recoverDataInstances, a3);
}

- (NSMutableArray)mergedDataClasses
{
  return self->_mergedDataClasses;
}

- (void)setMergedDataClasses:(id)a3
{
  objc_storeStrong((id *)&self->_mergedDataClasses, a3);
}

- (NSMutableArray)mergedDataInstances
{
  return self->_mergedDataInstances;
}

- (void)setMergedDataInstances:(id)a3
{
  objc_storeStrong((id *)&self->_mergedDataInstances, a3);
}

- (NSArray)patchDataClasses
{
  return self->_patchDataClasses;
}

- (void)setPatchDataClasses:(id)a3
{
  objc_storeStrong((id *)&self->_patchDataClasses, a3);
}

- (NSArray)patchDataInstances
{
  return self->_patchDataInstances;
}

- (void)setPatchDataInstances:(id)a3
{
  objc_storeStrong((id *)&self->_patchDataInstances, a3);
}

- (NSArray)patchValues
{
  return self->_patchValues;
}

- (void)setPatchValues:(id)a3
{
  objc_storeStrong((id *)&self->_patchValues, a3);
}

- (NSSet)partSPC
{
  return self->_partSPC;
}

- (void)setPartSPC:(id)a3
{
  objc_storeStrong((id *)&self->_partSPC, a3);
}

- (NSString)failedSPC
{
  return self->_failedSPC;
}

- (void)setFailedSPC:(id)a3
{
  objc_storeStrong((id *)&self->_failedSPC, a3);
}

- (BOOL)skipStageEAN
{
  return self->_skipStageEAN;
}

- (void)setSkipStageEAN:(BOOL)a3
{
  self->_skipStageEAN = a3;
}

- (BOOL)allowUsedPart
{
  return self->_allowUsedPart;
}

- (void)setAllowUsedPart:(BOOL)a3
{
  self->_allowUsedPart = a3;
}

- (BOOL)allowSelfService
{
  return self->_allowSelfService;
}

- (void)setAllowSelfService:(BOOL)a3
{
  self->_allowSelfService = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failedSPC, 0);
  objc_storeStrong((id *)&self->_partSPC, 0);
  objc_storeStrong((id *)&self->_patchValues, 0);
  objc_storeStrong((id *)&self->_patchDataInstances, 0);
  objc_storeStrong((id *)&self->_patchDataClasses, 0);
  objc_storeStrong((id *)&self->_mergedDataInstances, 0);
  objc_storeStrong((id *)&self->_mergedDataClasses, 0);
  objc_storeStrong((id *)&self->_recoverDataInstances, 0);
  objc_storeStrong((id *)&self->_recoverDataClasses, 0);
  objc_storeStrong((id *)&self->_minimalSealedInstances, 0);
  objc_storeStrong((id *)&self->_minimalSealedClasses, 0);
  objc_storeStrong((id *)&self->_minimalSealingInstances, 0);
  objc_storeStrong((id *)&self->_updateProperties, 0);
  objc_storeStrong((id *)&self->_makeProperties, 0);
  objc_storeStrong((id *)&self->_makeInstances, 0);
  objc_storeStrong((id *)&self->_makeClasses, 0);
  objc_storeStrong((id *)&self->_currentProperties, 0);
  objc_storeStrong((id *)&self->_currentInstances, 0);
  objc_storeStrong((id *)&self->_currentClasses, 0);
  objc_storeStrong((id *)&self->_updateClassDict, 0);
  objc_storeStrong((id *)&self->_claimDict, 0);
  objc_storeStrong((id *)&self->_sealedDataInstance, 0);
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->handler, 0);
  objc_storeStrong((id *)&self->apTicketData, 0);
  objc_storeStrong((id *)&self->keyBlob, 0);
  objc_storeStrong((id *)&self->displayMaxDuration, 0);
  objc_storeStrong((id *)&self->SOCKSPort, 0);
  objc_storeStrong((id *)&self->SOCKSHost, 0);
  objc_storeStrong((id *)&self->repairStats, 0);
  objc_storeStrong((id *)&self->FDRPersistentDataPath, 0);
  objc_storeStrong((id *)&self->preSealingManifest, 0);
  objc_storeStrong((id *)&self->postSealingManifest, 0);
  objc_storeStrong((id *)&self->overridePropertySet, 0);
  objc_storeStrong((id *)&self->manifestDataClassesAndInstances, 0);
  objc_storeStrong((id *)&self->removedProperties, 0);
  objc_storeStrong((id *)&self->metadataDict, 0);
  objc_storeStrong((id *)&self->dataDirectoryURL, 0);
  objc_storeStrong((id *)&self->FDRSealingURL, 0);
  objc_storeStrong((id *)&self->FDRDSURL, 0);
  objc_storeStrong((id *)&self->trustObjectURL, 0);
  objc_storeStrong((id *)&self->FDRCAURL, 0);
  objc_storeStrong((id *)&self->KGBSerialNumber, 0);
  objc_storeStrong((id *)&self->KBBSerialNumber, 0);
  objc_storeStrong((id *)&self->currentMLBSerialNumber, 0);
  objc_storeStrong((id *)&self->currentSerialNumber, 0);
}

- (int64_t)performRealToRealRepair:(id *)a3 fdrLocal:(__AMFDR *)a4 fdrRemote:(__AMFDR *)a5
{
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
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
  uint64_t v34;
  void *v35;
  __AMFDR *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  BOOL v40;
  NSObject *v41;
  _BOOL4 v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  NSObject *v68;
  void *v69;
  id v70;
  int64_t Instances_patchClasses_patchInstances;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  const char *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  const char *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  void *v135;
  const char *v136;
  const char *v137;
  uint64_t v138;
  NSObject *v139;
  id v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  void *v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  void *v148;
  const char *v149;
  uint64_t v150;
  id *v151;
  id v152;
  const char *v153;
  id v154;
  int v156;
  BOOL v157;
  __AMFDR *v159;
  id v160;
  id v161;
  id v162;
  id v163;
  id v164;
  id v165;
  id v166;
  id v167;
  uint8_t buf[4];
  void *v169;
  uint64_t v170;

  v170 = *MEMORY[0x24BDAC8D0];
  handleForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    sub_214571850(v8, v9, v10, v11, v12, v13, v14, v15);

  objc_msgSend_makeProperties(self, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend_makeProperties(self, v20, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend_mutableCopy(v23, v24, v25, v26);

    AMFDRSetOption();
    AMFDRSetOption();
  }
  objc_msgSend_mergedDataClasses(self, v20, v21, v22);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_mergedDataInstances(self, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_currentProperties(self, v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v167 = 0;
  BYTE2(v156) = 0;
  LOWORD(v156) = 1;
  v159 = a4;
  v36 = a5;
  v38 = objc_msgSend_CRFDRVerifyLocal_fdrRemote_sealedData_mergedDataClasses_mergedDataInstances_currentManifestProperties_fdrError_syncEAN_postSeal_ignoreBenignError_(self, v37, (uint64_t)a4, (uint64_t)a5, 0, v27, v31, v35, &v167, v156);
  v39 = (uint64_t)v167;

  v40 = (v38 | v39) == 0;
  handleForCategory(0);
  v41 = objc_claimAutoreleasedReturnValue();
  v42 = os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT);
  if (!(v38 | v39))
  {
    if (v42)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_214503000, v41, OS_LOG_TYPE_DEFAULT, "Local FDR data found and verified", buf, 2u);
    }

    objc_msgSend_patchDataClasses(self, v43, v44, v45);
    v46 = objc_claimAutoreleasedReturnValue();
    if (v46
      && (v50 = (void *)v46,
          objc_msgSend_patchDataClasses(self, v47, v48, v49),
          v51 = (void *)objc_claimAutoreleasedReturnValue(),
          v55 = objc_msgSend_count(v51, v52, v53, v54),
          v51,
          v50,
          v55))
    {
      v157 = v40;
      handleForCategory(0);
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v39, OS_LOG_TYPE_DEFAULT))
      {
        v56 = v19;
        *(_WORD *)buf = 0;
        v57 = "Patch needed, continue";
LABEL_19:
        _os_log_impl(&dword_214503000, (os_log_t)v39, OS_LOG_TYPE_DEFAULT, v57, buf, 2u);
        goto LABEL_24;
      }
    }
    else
    {
      objc_msgSend_updateProperties(self, v47, v48, v49);
      v58 = objc_claimAutoreleasedReturnValue();
      if (!v58
        || (v62 = (void *)v58,
            objc_msgSend_updateProperties(self, v59, v60, v61),
            v63 = (void *)objc_claimAutoreleasedReturnValue(),
            v67 = objc_msgSend_count(v63, v64, v65, v66),
            v63,
            v62,
            !v67))
      {
        handleForCategory(0);
        v68 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_214503000, v68, OS_LOG_TYPE_DEFAULT, "Skip recovery and seal", buf, 2u);
        }
        v69 = 0;
        v70 = 0;
        Instances_patchClasses_patchInstances = 0;
        goto LABEL_58;
      }
      v157 = v40;
      handleForCategory(0);
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v39, OS_LOG_TYPE_DEFAULT))
      {
        v56 = v19;
        *(_WORD *)buf = 0;
        v57 = "Update properties needed, continue";
        goto LABEL_19;
      }
    }
    v56 = v19;
    goto LABEL_24;
  }
  v157 = 0;
  if (v42)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_214503000, v41, OS_LOG_TYPE_DEFAULT, "Local FDR data not verified, continue to recover", buf, 2u);
  }
  v56 = v19;

LABEL_24:
  v166 = 0;
  objc_msgSend_claimDict(self, v72, v73, v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_makeClasses(self, v76, v77, v78);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_makeInstances(self, v80, v81, v82);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_patchDataClasses(self, v84, v85, v86);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_patchDataInstances(self, v88, v89, v90);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  Instances_patchClasses_patchInstances = objc_msgSend_prefetchPermissionsForSealing_fdrRemote_fdrLocal_claimClassDict_makeClasses_makeInstances_patchClasses_patchInstances_(self, v92, (uint64_t)&v166, (uint64_t)v36, v159, v75, v79, v83, v87, v91);
  v70 = v166;

  if (Instances_patchClasses_patchInstances || v70)
  {
    handleForCategory(0);
    v68 = objc_claimAutoreleasedReturnValue();
    v19 = v56;
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
      sub_21456DE84();
    goto LABEL_57;
  }
  v165 = 0;
  objc_msgSend_claimDict(self, v93, v94, v95);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  Instances_patchClasses_patchInstances = objc_msgSend_performHTTPChallengeClaim_fdrLocal_fdrError_claimClassDict_registerOnly_(self, v97, (uint64_t)v36, (uint64_t)v159, &v165, v96, 0);
  v70 = v165;

  if (Instances_patchClasses_patchInstances || v70)
  {
    handleForCategory(0);
    v68 = objc_claimAutoreleasedReturnValue();
    v19 = v56;
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
      sub_2145716D0();
    goto LABEL_57;
  }
  v19 = v56;
  if (v157)
    goto LABEL_29;
  v164 = 0;
  Instances_patchClasses_patchInstances = objc_msgSend_CRFDRRecoverMissingData_fdrLocal_fdrRemote_(self, v98, (uint64_t)&v164, (uint64_t)v159, v36);
  v152 = v164;
  v70 = v152;
  if (Instances_patchClasses_patchInstances || v152)
  {
    handleForCategory(0);
    v68 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
      sub_214571790();
    goto LABEL_57;
  }
  v163 = 0;
  Instances_patchClasses_patchInstances = objc_msgSend_performMake_fdrLocal_fdrError_(self, v153, (uint64_t)v36, (uint64_t)v159, &v163);
  v154 = v163;
  v70 = v154;
  if (Instances_patchClasses_patchInstances || v154)
  {
    handleForCategory(0);
    v68 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
      sub_2145717F0();
LABEL_57:
    v69 = 0;
LABEL_58:
    v151 = a3;
    goto LABEL_59;
  }
LABEL_29:
  objc_msgSend_patchDataClasses(self, v98, v99, v100);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_patchDataInstances(self, v102, v103, v104);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_patchValues(self, v106, v107, v108);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v162 = 0;
  Instances_patchClasses_patchInstances = objc_msgSend_localPatch_dataClasses_dataInstances_values_error_(self, v110, (uint64_t)v159, (uint64_t)v101, v105, v109, &v162);
  v70 = v162;

  if (Instances_patchClasses_patchInstances || v70)
  {
    handleForCategory(0);
    v68 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
      sub_21456DF44();
    goto LABEL_64;
  }
  objc_msgSend_patchDataClasses(self, v111, v112, v113);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_patchDataInstances(self, v115, v116, v117);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_patchValues(self, v119, v120, v121);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v161 = 0;
  Instances_patchClasses_patchInstances = objc_msgSend_remotePatch_dataClasses_dataInstances_values_datas_error_(self, v123, (uint64_t)v36, (uint64_t)v114, v118, v122, 0, &v161);
  v70 = v161;

  if (Instances_patchClasses_patchInstances || v70)
  {
    handleForCategory(0);
    v68 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
      sub_214571730();
LABEL_64:
    v69 = 0;
    v151 = a3;
LABEL_65:
    v19 = v56;
    goto LABEL_59;
  }
  objc_msgSend_handler(self, v124, v125, v126);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_partSPC(self, v128, v129, v130);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_updateProperties(self, v132, v133, v134);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_getUpdatePropertyWithPartSPC_propertiesFromParam_(v127, v136, (uint64_t)v131, (uint64_t)v135);
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = v56;
  if (v69)
  {
    objc_msgSend_addEntriesFromDictionary_(v56, v137, (uint64_t)v69, v138);
    handleForCategory(0);
    v139 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v139, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v169 = v56;
      _os_log_impl(&dword_214503000, v139, OS_LOG_TYPE_DEFAULT, "Updated properties: %@", buf, 0xCu);
    }

    AMFDRSetOption();
    AMFDRSetOption();
  }
  v160 = 0;
  Instances_patchClasses_patchInstances = objc_msgSend_performSealing_fdrLocal_fdrError_(self, v137, (uint64_t)v36, (uint64_t)v159, &v160);
  v140 = v160;
  v70 = v140;
  if (!Instances_patchClasses_patchInstances && !v140)
  {
    objc_msgSend_handler(self, v141, v142, v143);
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_partSPC(self, v145, v146, v147);
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    Instances_patchClasses_patchInstances = objc_msgSend_performPostSealingStage_(v144, v149, (uint64_t)v148, v150);

    v151 = a3;
    if (!Instances_patchClasses_patchInstances)
    {
      v70 = 0;
      v19 = v56;
      if (!a3)
        goto LABEL_61;
      goto LABEL_60;
    }
    handleForCategory(0);
    v68 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
      sub_21456E004();
    v70 = 0;
    goto LABEL_65;
  }
  handleForCategory(0);
  v68 = objc_claimAutoreleasedReturnValue();
  v151 = a3;
  if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
    sub_21456DFA4();
LABEL_59:

  if (v151)
LABEL_60:
    *v151 = objc_retainAutorelease(v70);
LABEL_61:

  return Instances_patchClasses_patchInstances;
}

- (int64_t)performStagedToRealRepair:(id *)a3 fdrLocal:(__AMFDR *)a4 fdrRemote:(__AMFDR *)a5
{
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  id v31;
  NSObject *v32;
  NSObject *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  int64_t Instances_patchClasses_patchInstances;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  NSObject *v59;
  NSObject *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  int PatchExpectedDataWithPartSPC_amfdr_expectedClasses_expectedInstances_expectedValues_expectedDatas_validClasses_validInstances_error;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  const char *v97;
  id v98;
  void *v99;
  const char *v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  const char *v115;
  id v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  void *v124;
  const char *v125;
  uint64_t v126;
  NSObject *v127;
  NSObject *v128;
  NSObject *v129;
  NSObject *v130;
  int v132;
  uint64_t v133;
  id *v134;
  id v135;
  id v136;
  id v137;
  id v138;
  id v139;
  id v140;
  id v141;
  uint8_t buf[8];
  id v143;
  id v144;
  id v145;
  id v146;
  id v147;

  v146 = 0;
  v147 = 0;
  v145 = 0;
  v144 = 0;
  handleForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    sub_2145719D0(v9, v10, v11, v12, v13, v14, v15, v16);

  objc_msgSend_localManifestProperties(CRFDRUtils, v17, v18, v19);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    AMFDRSetOption();
    AMFDRSetOption();
  }
  objc_msgSend_mergedDataClasses(self, v20, v21, v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_mergedDataInstances(self, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v143 = 0;
  BYTE2(v132) = 0;
  LOWORD(v132) = 1;
  v30 = objc_msgSend_CRFDRVerifyLocal_fdrRemote_sealedData_mergedDataClasses_mergedDataInstances_currentManifestProperties_fdrError_syncEAN_postSeal_ignoreBenignError_(self, v29, (uint64_t)a4, (uint64_t)a5, 0, v24, v28, v23, &v143, v132);
  v31 = v143;

  handleForCategory(0);
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = v32;
  if (v30 || v31)
  {
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      sub_2145718C0();

    Instances_patchClasses_patchInstances = -40;
  }
  else
  {
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_214503000, v33, OS_LOG_TYPE_DEFAULT, "Local FDR data found and verified", buf, 2u);
    }

    objc_msgSend_patchDataClasses(self, v34, v35, v36);
    v37 = objc_claimAutoreleasedReturnValue();
    if (v37)
    {
      v41 = (void *)v37;
      objc_msgSend_patchDataClasses(self, v38, v39, v40);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend_count(v42, v43, v44, v45);

      if (v46)
      {
        handleForCategory(0);
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
          sub_2145719A4();

        v31 = 0;
LABEL_46:
        Instances_patchClasses_patchInstances = -66;
        goto LABEL_61;
      }
    }
    objc_msgSend_updateProperties(self, v38, v39, v40);
    v49 = objc_claimAutoreleasedReturnValue();
    if (v49)
    {
      v53 = (void *)v49;
      objc_msgSend_updateProperties(self, v50, v51, v52);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = objc_msgSend_count(v54, v55, v56, v57);

      if (v58)
      {
        handleForCategory(0);
        v59 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
          sub_214571978();

        v31 = 0;
        Instances_patchClasses_patchInstances = -89;
        goto LABEL_61;
      }
    }
    v134 = a3;
    handleForCategory(0);
    v60 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_214503000, v60, OS_LOG_TYPE_DEFAULT, "Get all local patch data", buf, 2u);
    }

    objc_msgSend_handler(self, v61, v62, v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_partSPC(self, v65, v66, v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_mergedDataClasses(self, v69, v70, v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_mergedDataInstances(self, v73, v74, v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v141 = 0;
    PatchExpectedDataWithPartSPC_amfdr_expectedClasses_expectedInstances_expectedValues_expectedDatas_validClasses_validInstances_error = objc_msgSend_getPatchExpectedDataWithPartSPC_amfdr_expectedClasses_expectedInstances_expectedValues_expectedDatas_validClasses_validInstances_error_(v64, v77, (uint64_t)v68, (uint64_t)a4, &v147, &v146, &v145, &v144, v72, v76, &v141);
    v31 = v141;

    if (!PatchExpectedDataWithPartSPC_amfdr_expectedClasses_expectedInstances_expectedValues_expectedDatas_validClasses_validInstances_error
      || v31)
    {
      handleForCategory(0);
      v128 = objc_claimAutoreleasedReturnValue();
      a3 = v134;
      if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR))
        sub_214571918();

      goto LABEL_46;
    }
    v140 = 0;
    objc_msgSend_claimDict(self, v79, v80, v81);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_makeClasses(self, v83, v84, v85);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_makeInstances(self, v87, v88, v89);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    Instances_patchClasses_patchInstances = objc_msgSend_prefetchPermissionsForSealing_fdrRemote_fdrLocal_claimClassDict_makeClasses_makeInstances_patchClasses_patchInstances_(self, v91, (uint64_t)&v140, (uint64_t)a5, a4, v82, v86, v90, v147, v146);
    v31 = v140;

    a3 = v134;
    if (Instances_patchClasses_patchInstances || v31)
    {
      handleForCategory(0);
      v129 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v129, OS_LOG_TYPE_ERROR))
        sub_21456DE84();
      goto LABEL_60;
    }
    v139 = 0;
    objc_msgSend_claimDict(self, v92, v93, v94);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    Instances_patchClasses_patchInstances = objc_msgSend_performHTTPChallengeClaim_fdrLocal_fdrError_claimClassDict_registerOnly_(self, v96, (uint64_t)a5, (uint64_t)a4, &v139, v95, 0);
    v31 = v139;

    if (Instances_patchClasses_patchInstances || v31)
    {
      handleForCategory(0);
      v129 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v129, OS_LOG_TYPE_ERROR))
        sub_2145716D0();
      goto LABEL_60;
    }
    v138 = 0;
    Instances_patchClasses_patchInstances = objc_msgSend_performMake_fdrLocal_fdrError_(self, v97, (uint64_t)a5, (uint64_t)a4, &v138);
    v98 = v138;
    v31 = v98;
    if (Instances_patchClasses_patchInstances || v98)
    {
      handleForCategory(0);
      v129 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v129, OS_LOG_TYPE_ERROR))
        sub_2145717F0();
      goto LABEL_60;
    }
    v99 = (void *)MEMORY[0x2199D19CC]();
    v137 = 0;
    Instances_patchClasses_patchInstances = objc_msgSend_remotePatch_dataClasses_dataInstances_values_datas_error_(self, v100, (uint64_t)a5, (uint64_t)v147, v146, v145, v144, &v137);
    v101 = v137;
    v31 = v101;
    if (!Instances_patchClasses_patchInstances && !v101)
    {
      v102 = v147;
      v147 = 0;

      v103 = v146;
      v146 = 0;

      v104 = v145;
      v145 = 0;

      v105 = v144;
      v144 = 0;

      objc_autoreleasePoolPop(v99);
      objc_msgSend_mergedDataClasses(self, v106, v107, v108);
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_mergedDataInstances(self, v110, v111, v112);
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      v136 = 0;
      BYTE2(v133) = 1;
      LOWORD(v133) = 1;
      Instances_patchClasses_patchInstances = objc_msgSend_CRFDRVerifyLocal_fdrRemote_sealedData_mergedDataClasses_mergedDataInstances_currentManifestProperties_fdrError_syncEAN_postSeal_ignoreBenignError_(self, v114, (uint64_t)a4, (uint64_t)a5, 0, v109, v113, v23, &v136, v133);
      v31 = v136;

      if (Instances_patchClasses_patchInstances || v31)
      {
        handleForCategory(0);
        v129 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v129, OS_LOG_TYPE_ERROR))
          sub_2145718EC();
      }
      else
      {
        v135 = 0;
        Instances_patchClasses_patchInstances = objc_msgSend_performSealing_fdrLocal_fdrError_(self, v115, (uint64_t)a5, (uint64_t)a4, &v135);
        v116 = v135;
        v31 = v116;
        if (!Instances_patchClasses_patchInstances && !v116)
        {
          objc_msgSend_handler(self, v117, v118, v119);
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_partSPC(self, v121, v122, v123);
          v124 = (void *)objc_claimAutoreleasedReturnValue();
          Instances_patchClasses_patchInstances = objc_msgSend_performPostSealingStage_(v120, v125, (uint64_t)v124, v126);

          if (Instances_patchClasses_patchInstances)
          {
            handleForCategory(0);
            v127 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v127, OS_LOG_TYPE_ERROR))
              sub_21456E004();

          }
          v31 = 0;
          goto LABEL_61;
        }
        handleForCategory(0);
        v129 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v129, OS_LOG_TYPE_ERROR))
          sub_21456DFA4();
      }
LABEL_60:

      goto LABEL_61;
    }
    handleForCategory(0);
    v130 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v130, OS_LOG_TYPE_ERROR))
      sub_214571730();

    objc_autoreleasePoolPop(v99);
  }
LABEL_61:
  if (a3)
    *a3 = objc_retainAutorelease(v31);

  return Instances_patchClasses_patchInstances;
}

- (int64_t)performMake:(__AMFDR *)a3 fdrLocal:(__AMFDR *)a4 fdrError:(id *)a5
{
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  const char *v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  int64_t v61;
  NSObject *v62;
  NSObject *v63;
  NSObject *v65;
  void *v66;
  const char *v67;
  const char *v68;
  const char *v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  unint64_t v105;
  NSObject *v106;
  const char *v107;
  int v108;
  id v109;
  void *v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  const char *v115;
  void *v116;
  const char *v117;
  uint64_t v118;
  id v119;
  uint8_t buf[16];
  void *v121;
  uint64_t v122;
  _QWORD v123[2];

  v123[1] = *MEMORY[0x24BDAC8D0];
  v121 = 0;
  objc_msgSend_makeClasses(self, a2, (uint64_t)a3, (uint64_t)a4);
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_14;
  v12 = (void *)v8;
  objc_msgSend_makeInstances(self, v9, v10, v11);
  v13 = objc_claimAutoreleasedReturnValue();
  if (!v13)
    goto LABEL_13;
  v17 = (void *)v13;
  objc_msgSend_makeClasses(self, v14, v15, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_count(v18, v19, v20, v21))
  {

LABEL_13:
    goto LABEL_14;
  }
  objc_msgSend_makeInstances(self, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend_count(v25, v26, v27, v28);

  if (!v29)
  {
LABEL_14:
    handleForCategory(0);
    v62 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_214503000, v62, OS_LOG_TYPE_DEFAULT, "No make data, skipping.", buf, 2u);
    }

    v54 = 0;
LABEL_17:
    handleForCategory(0);
    v63 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_214503000, v63, OS_LOG_TYPE_DEFAULT, "Make and commit local successful", buf, 2u);
    }
    v55 = 0;
    v61 = 0;
    goto LABEL_20;
  }
  objc_msgSend_makeClasses(self, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend_count(v33, v34, v35, v36);
  objc_msgSend_makeInstances(self, v38, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend_count(v41, v42, v43, v44);

  if (v37 == v45)
  {
    objc_msgSend_makeClasses(self, v46, v47, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_makeInstances(self, v50, v51, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = (void *)AMFDRDataMultiMake();

    v55 = v121;
    if (!v54)
    {
      handleForCategory(0);
      v56 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        sub_214571A40();

      if (objc_msgSend_getInnermostNSErrorCode_(CRUtils, v57, (uint64_t)v121, v58) == 11)
      {
        v61 = -13;
        if (!a5)
          goto LABEL_22;
        goto LABEL_21;
      }
      if (objc_msgSend_getInnermostNSErrorCode_(CRUtils, v59, (uint64_t)v121, v60) != 21)
      {
        v61 = -26;
        if (!a5)
          goto LABEL_22;
        goto LABEL_21;
      }
      objc_msgSend_getInnermostNSError_(CRUtils, v69, (uint64_t)v121, v70);
      v63 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_makeClasses(self, v71, v72, v73);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = objc_msgSend_count(v74, v75, v76, v77);

      if (v78)
      {
        v82 = 0;
        while (1)
        {
          objc_msgSend_makeClasses(self, v79, v80, v81);
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectAtIndexedSubscript_(v83, v84, v82, v85);
          v86 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_makeInstances(self, v87, v88, v89);
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectAtIndexedSubscript_(v90, v91, v82, v92);
          v93 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend_foundInMultiRequestError_dataClass_dataInstance_(CRUtils, v94, (uint64_t)v63, (uint64_t)v86, v93))break;
          ++v82;
          objc_msgSend_makeClasses(self, v98, v99, v100);
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          v105 = objc_msgSend_count(v101, v102, v103, v104);

          v61 = -26;
          if (v105 <= v82)
            goto LABEL_20;
        }
        objc_msgSend_handler(self, v95, v96, v97);
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_partSPC(self, v111, v112, v113);
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_spcInPartSPC_withDataClass_(v110, v115, (uint64_t)v114, (uint64_t)v86);
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setFailedSPC_(self, v117, (uint64_t)v116, v118);

      }
      goto LABEL_41;
    }
    handleForCategory(0);
    v106 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_214503000, v106, OS_LOG_TYPE_DEFAULT, "MAKE Successful", buf, 2u);
    }

    v119 = 0;
    v108 = objc_msgSend__commitData_fdrlocal_fdrError_(self, v107, (uint64_t)v54, (uint64_t)a4, &v119);
    v109 = v119;
    v55 = v109;
    if (!v108 || v109)
    {
      handleForCategory(0);
      v63 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
        sub_214571AA0();
LABEL_41:
      v61 = -26;
      goto LABEL_20;
    }
    goto LABEL_17;
  }
  handleForCategory(0);
  v65 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
    sub_214571B00();

  v66 = (void *)MEMORY[0x24BDD1540];
  v122 = *MEMORY[0x24BDD0FC8];
  v123[0] = CFSTR("make classes and instances count mismatched");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v67, (uint64_t)v123, (uint64_t)&v122, 1);
  v63 = objc_claimAutoreleasedReturnValue();
  v61 = -26;
  objc_msgSend_errorWithDomain_code_userInfo_(v66, v68, (uint64_t)CFSTR("com.apple.corerepair"), -26, v63);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = 0;
LABEL_20:

  if (a5)
LABEL_21:
    *a5 = objc_retainAutorelease(v55);
LABEL_22:

  return v61;
}

- (int64_t)performSealing:(__AMFDR *)a3 fdrLocal:(__AMFDR *)a4 fdrError:(id *)a5
{
  int64_t v9;
  id v10;
  const char *v11;
  void *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  uint8_t v19[16];
  id v20;
  id v21;

  v21 = 0;
  v9 = objc_msgSend_CRFDRDataRepairRecover_fdrRemote_syncEAN_fdrError_(self, a2, (uint64_t)a4, (uint64_t)a3, 1, &v21);
  v10 = v21;
  v12 = v10;
  if (v9 || v10)
  {
    handleForCategory(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_214571B2C();

    if (objc_msgSend_getInnermostNSErrorCode_(CRUtils, v16, (uint64_t)v12, v17) == 11)
      v9 = -13;
  }
  else
  {
    v20 = 0;
    v9 = objc_msgSend_CRFDRPostRecoverVerify_fdrRemote_syncEAN_fdrError_(self, v11, (uint64_t)a4, (uint64_t)a3, 1, &v20);
    v13 = v20;
    v12 = v13;
    if (!v9 && !v13)
    {
      handleForCategory(0);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v19 = 0;
        _os_log_impl(&dword_214503000, v14, OS_LOG_TYPE_DEFAULT, "Partial Seal Successful", v19, 2u);
      }

      v12 = 0;
      v9 = 0;
    }
  }
  if (a5)
    *a5 = objc_retainAutorelease(v12);

  return v9;
}

@end
