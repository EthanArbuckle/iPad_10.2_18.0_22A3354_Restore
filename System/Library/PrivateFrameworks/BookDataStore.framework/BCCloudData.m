@implementation BCCloudData

- (id)mutableCopy
{
  BCMutableCloudData *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = [BCMutableCloudData alloc];
  return (id)MEMORY[0x24BEDD108](v3, sel_initWithCloudData_, self, v4, v5);
}

- (void)configureFromCloudData:(id)a3 withMergers:(id)a4
{
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
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
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  int v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  const char *v133;
  uint64_t v134;
  void *v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  char isEqualToString;
  void *v145;
  id v146;

  v146 = a3;
  v5 = (void *)MEMORY[0x24BDD16E0];
  v10 = objc_msgSend_deletedFlag(v146, v6, v7, v8, v9);
  objc_msgSend_numberWithBool_(v5, v11, v10, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDifferentNumber_forKey_(self, v15, (uint64_t)v14, (uint64_t)CFSTR("deletedFlag"), v16);

  objc_msgSend_modificationDate(v146, v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDifferentDate_forKey_(self, v22, (uint64_t)v21, (uint64_t)CFSTR("modificationDate"), v23);

  objc_msgSend_systemFields(self, v24, v25, v26, v27);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v32)
    goto LABEL_12;
  objc_msgSend_systemFields(v146, v28, v29, v30, v31);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordChangeTag(v33, v34, v35, v36, v37);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    objc_msgSend_systemFields(self, v38, v39, v40, v41);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordChangeTag(v43, v44, v45, v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_systemFields(v146, v49, v50, v51, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordChangeTag(v53, v54, v55, v56, v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqualToString_(v48, v59, (uint64_t)v58, v60, v61))
    {

      goto LABEL_12;
    }
    v140 = v53;
    v141 = v48;
    v142 = v43;
    v145 = v33;
    objc_msgSend_systemFields(v146, v62, v63, v64, v65, v58);
  }
  else
  {
    v145 = v33;
    objc_msgSend_systemFields(v146, v38, v39, v40, v41);
  }
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordID(v66, v67, v68, v69, v70);
  v71 = objc_claimAutoreleasedReturnValue();
  if (!v71)
  {

    if (!v42)
    {
      v128 = v145;
      goto LABEL_17;
    }

    v128 = v145;
    v135 = v142;
LABEL_16:

LABEL_17:
    v105 = v146;
    goto LABEL_18;
  }
  v76 = (void *)v71;
  objc_msgSend_systemFields(v146, v72, v73, v74, v75);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordID(v143, v77, v78, v79, v80);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordName(v81, v82, v83, v84, v85);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_systemFields(self, v87, v88, v89, v90);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordID(v91, v92, v93, v94, v95);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordName(v96, v97, v98, v99, v100);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v86, v102, (uint64_t)v101, v103, v104);

  if (v42)
  {

  }
  v105 = v146;
  if ((isEqualToString & 1) == 0)
  {
LABEL_12:
    objc_msgSend_systemFields(v146, v28, v29, v30, v31);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setSystemFields_(self, v107, (uint64_t)v106, v108, v109);

    objc_msgSend_privacyDelegate(self, v110, v111, v112, v113);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    v119 = objc_msgSend_establishedSalt(v114, v115, v116, v117, v118);

    v105 = v146;
    if (!v119)
      goto LABEL_18;
    objc_msgSend_privacyDelegate(self, v120, v121, v122, v123);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordType(v146, v124, v125, v126, v127);
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_identifier(v146, v129, v130, v131, v132);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordNameFromRecordType_identifier_(v32, v133, (uint64_t)v128, (uint64_t)v42, v134);
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setSaltedHashedID_(self, v136, (uint64_t)v135, v137, v138);
    goto LABEL_16;
  }
LABEL_18:

}

- (BOOL)isEqualExceptForDate:(id)a3 ignoringEmptySalt:(BOOL)a4
{
  void *v4;
  _BOOL4 v5;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  BOOL v76;
  int v77;
  int v78;
  int v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  int v84;
  BOOL v85;
  int isEqualToString;
  void *v88;
  _BOOL4 v89;

  v5 = a4;
  v7 = a3;
  objc_msgSend_systemFields(self, v8, v9, v10, v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    objc_msgSend_systemFields(v7, v12, v13, v14, v15);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      LODWORD(v21) = 1;
LABEL_11:

      goto LABEL_12;
    }
  }
  objc_msgSend_systemFields(self, v12, v13, v14, v15);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    objc_msgSend_systemFields(v7, v17, v18, v19, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordChangeTag(v22, v23, v24, v25, v26);
    v27 = objc_claimAutoreleasedReturnValue();
    if (!v27)
    {

      LODWORD(v21) = 1;
      if (!v16)
        goto LABEL_11;
      goto LABEL_12;
    }
    v32 = (void *)v27;
    objc_msgSend_systemFields(self, v28, v29, v30, v31);
    v89 = v5;
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordChangeTag(v33, v34, v35, v36, v37);
    v88 = v4;
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_systemFields(v7, v39, v40, v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordChangeTag(v43, v44, v45, v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v38, v49, (uint64_t)v48, v50, v51);

    v4 = v88;
    v5 = v89;

    LODWORD(v21) = isEqualToString;
  }
  if (!v16)
    goto LABEL_11;
LABEL_12:

  objc_msgSend_saltedHashedID(self, v52, v53, v54, v55);
  v56 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_systemFields(v7, v57, v58, v59, v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordID(v61, v62, v63, v64, v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordName(v66, v67, v68, v69, v70);
  v71 = objc_claimAutoreleasedReturnValue();

  if (v56 | v71 && (v56 ? (v76 = v71 == 0) : (v76 = 1), v76 ? (v77 = 0) : (v77 = 1), !v5 || v77))
    v78 = objc_msgSend_isEqualToString_((void *)v56, v72, v71, v74, v75);
  else
    v78 = 1;
  v79 = objc_msgSend_deletedFlag(self, v72, v73, v74, v75);
  v84 = v78 & (v79 ^ objc_msgSend_deletedFlag(v7, v80, v81, v82, v83) ^ 1);
  if ((_DWORD)v21)
    v85 = v84;
  else
    v85 = 0;

  return v85;
}

- (void)resolveConflictsFromRecord:(id)a3 withResolvers:(id)a4
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  char isEqualToString;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  id v43;

  v43 = a3;
  objc_msgSend_systemFields(self, v5, v6, v7, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
    goto LABEL_3;
  v14 = (void *)v9;
  objc_msgSend_systemFields(self, v10, v11, v12, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordChangeTag(v15, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordChangeTag(v43, v21, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v20, v26, (uint64_t)v25, v27, v28);

  if ((isEqualToString & 1) == 0)
  {
LABEL_3:
    objc_msgSend_setSystemFields_(self, v10, (uint64_t)v43, v12, v13);
    objc_msgSend_recordID(v43, v30, v31, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordName(v34, v35, v36, v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setSaltedHashedID_(self, v40, (uint64_t)v39, v41, v42);

  }
}

- (BOOL)hasValidSalt
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  int isEqualToString;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  NSObject *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  int v77;
  void *v78;
  __int16 v79;
  void *v80;
  __int16 v81;
  int v82;
  uint64_t v83;

  v83 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_privacyDelegate(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ckSystemFields(self, v7, v8, v9, v10);
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11 && (v16 = (void *)v11, v17 = objc_msgSend_establishedSalt(v6, v12, v13, v14, v15), v16, v17))
  {
    objc_msgSend_ckSystemFields(self, v18, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeRecordFromSystemFields_(BCCloudKitDatabaseController, v23, (uint64_t)v22, v24, v25);
    v26 = objc_claimAutoreleasedReturnValue();

    objc_msgSend_recordType(self, v27, v28, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_identifier(self, v32, v33, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordNameFromRecordType_identifier_(v6, v37, (uint64_t)v31, (uint64_t)v36, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_recordID(v26, v40, v41, v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordName(v44, v45, v46, v47, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToString = objc_msgSend_isEqualToString_(v49, v50, (uint64_t)v39, v51, v52);

    objc_msgSend_shared(MEMORY[0x24BE0FC08], v54, v55, v56, v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v49) = objc_msgSend_verboseLoggingEnabled(v58, v59, v60, v61, v62);

    if ((_DWORD)v49)
    {
      BDSCloudKitDevelopmentLog();
      v63 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend_recordID(v26, v64, v65, v66, v67);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_recordName(v68, v69, v70, v71, v72);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = 138543874;
        v78 = v73;
        v79 = 2114;
        v80 = v39;
        v81 = 1024;
        v82 = isEqualToString;
        _os_log_impl(&dword_227D4F000, v63, OS_LOG_TYPE_DEFAULT, "\"\\\"Comparing %{public}@ record name %{public}@  hasValidSalt:%{BOOL}d\\\"\", (uint8_t *)&v77, 0x1Cu);

      }
    }

  }
  else
  {
    BDSCloudKitLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      sub_227E5B3B8(v6, (char *)self, (uint64_t)v26, v74, v75);
    LOBYTE(isEqualToString) = 1;
  }

  return isEqualToString;
}

- (CKRecord)systemFields
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  char isEqualToString;
  NSObject *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  id v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  char *v90;
  id v91;
  const char *v92;
  uint64_t v93;
  void *v94;
  id v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;

  objc_msgSend_privacyDelegate(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ckSystemFields(self, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend_ckSystemFields(self, v12, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeRecordFromSystemFields_(BCCloudKitDatabaseController, v17, (uint64_t)v16, v18, v19);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend_establishedSalt(v6, v20, v21, v22, v23))
    {
      objc_msgSend_recordType(self, v12, v13, v14, v15);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_identifier(self, v25, v26, v27, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordNameFromRecordType_identifier_(v6, v30, (uint64_t)v24, (uint64_t)v29, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_recordID(v11, v33, v34, v35, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordName(v37, v38, v39, v40, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToString = objc_msgSend_isEqualToString_(v42, v43, (uint64_t)v32, v44, v45);

      if ((isEqualToString & 1) == 0)
      {
        BDSCloudKitLog();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
          sub_227E5B508(self);

        objc_msgSend_setSystemFields_(self, v48, 0, v49, v50);
        v11 = 0;
      }

    }
  }
  objc_msgSend_ckSystemFields(self, v12, v13, v14, v15);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v51)
  {
    if (objc_msgSend_establishedSalt(v6, v52, v53, v54, v55))
    {
      objc_msgSend_identifier(self, v56, v57, v58, v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();

      if (v60)
      {
        objc_msgSend_recordType(self, v61, v62, v63, v64);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_identifier(self, v66, v67, v68, v69);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_recordNameFromRecordType_identifier_(v6, v71, (uint64_t)v65, (uint64_t)v70, v72);
        v73 = (void *)objc_claimAutoreleasedReturnValue();

        if (v73)
        {
          objc_msgSend_saltedHashedID(self, v74, v75, v76, v77);
          v78 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v78)
            objc_msgSend_setSaltedHashedID_(self, v79, (uint64_t)v73, v80, v81);
          v82 = objc_alloc(MEMORY[0x24BDB91F8]);
          objc_msgSend_zoneName(self, v83, v84, v85, v86);
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          v90 = (char *)objc_msgSend_initWithZoneName_ownerName_(v82, v88, (uint64_t)v87, *MEMORY[0x24BDB8E88], v89);

          v91 = objc_alloc(MEMORY[0x24BDB91E8]);
          v94 = (void *)objc_msgSend_initWithRecordName_zoneID_(v91, v92, (uint64_t)v73, (uint64_t)v90, v93);
          v95 = objc_alloc(MEMORY[0x24BDB91D8]);
          objc_msgSend_recordType(self, v96, v97, v98, v99);
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          v103 = objc_msgSend_initWithRecordType_recordID_(v95, v101, (uint64_t)v100, (uint64_t)v94, v102);

          objc_msgSend_setSystemFields_(self, v104, v103, v105, v106);
          objc_msgSend_incrementEditGeneration(self, v107, v108, v109, v110);

          v11 = (void *)v103;
        }
        else
        {
          BDSCloudKitLog();
          v90 = (char *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled((os_log_t)v90, OS_LOG_TYPE_ERROR))
            sub_227E5B47C(self, v90, v111, v112, v113);
        }

      }
    }
  }

  return (CKRecord *)v11;
}

- (void)setPrivacyDelegate:(id)a3
{
  id WeakRetained;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
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
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_privacyDelegate);

  if (WeakRetained != obj)
    objc_storeWeak((id *)&self->_privacyDelegate, obj);
  objc_msgSend_saltedHashedID(self, v5, v6, v7, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    goto LABEL_7;
  objc_msgSend_privacyDelegate(self, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_establishedSalt(v13, v14, v15, v16, v17))
    goto LABEL_7;
  objc_msgSend_identifier(self, v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend_privacyDelegate(self, v23, v24, v25, v26);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordType(self, v27, v28, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_identifier(self, v32, v33, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordNameFromRecordType_identifier_(v13, v37, (uint64_t)v31, (uint64_t)v36, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setSaltedHashedID_(self, v40, (uint64_t)v39, v41, v42);

LABEL_7:
  }

}

- (void)setSystemFields:(id)a3
{
  const char *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;

  v4 = (const char *)a3;
  v28 = (char *)v4;
  if (v4)
  {
    objc_msgSend_encodeRecordSystemFields_(BCCloudKitDatabaseController, v4, (uint64_t)v4, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setCkSystemFields_(self, v9, (uint64_t)v8, v10, v11);

    objc_msgSend_recordID(v28, v12, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recordName(v16, v17, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setSaltedHashedID_(self, v22, (uint64_t)v21, v23, v24);

  }
  else
  {
    objc_msgSend_setCkSystemFields_(self, v5, 0, v6, v7);
    objc_msgSend_setSaltedHashedID_(self, v25, 0, v26, v27);
  }

}

- (void)incrementEditGeneration
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  NSObject *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  __int16 v27;
  BCCloudData *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = objc_msgSend_editGeneration(self, a2, v2, v3, v4);
  objc_msgSend_setEditGeneration_(self, v7, v6 + 1, v8, v9);
  objc_msgSend_shared(MEMORY[0x24BE0FC08], v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend_verboseLoggingEnabled(v14, v15, v16, v17, v18);

  if (v19)
  {
    BDSCloudKitDevelopmentLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v25 = 134218242;
      v26 = objc_msgSend_editGeneration(self, v21, v22, v23, v24);
      v27 = 2112;
      v28 = self;
      _os_log_impl(&dword_227D4F000, v20, OS_LOG_TYPE_DEFAULT, "\"\\\"Incrementing edit generation to: %lld for %@\\\"\", (uint8_t *)&v25, 0x16u);
    }

  }
}

- (id)configuredRecordFromAttributes
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;

  objc_msgSend_systemFields(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identifier(self, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encryptedValuesByKey(v6, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v16, v17, (uint64_t)v11, (uint64_t)CFSTR("localRecordIDEncrypted"), v18);

  return v6;
}

- (id)recordType
{
  NSObject *v2;

  BDSCloudKitLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    sub_227E5B5D0();

  return &stru_24F091B90;
}

- (id)identifier
{
  NSObject *v2;

  BDSCloudKitLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    sub_227E5B5FC();

  return 0;
}

- (id)zoneName
{
  NSObject *v2;

  BDSCloudKitLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    sub_227E5B628();

  return &stru_24F091B90;
}

+ (id)propertyIDKey
{
  NSObject *v2;

  BDSCloudKitLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    sub_227E5B654();

  return &stru_24F091B90;
}

+ (id)localIdentifierFromRecord:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  v3 = a3;
  objc_msgSend_encryptedValuesByKey(v3, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v8, v9, (uint64_t)CFSTR("localRecordIDEncrypted"), v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_opt_class();
    objc_msgSend_objectForKey_(v3, v13, (uint64_t)CFSTR("localRecordID"), v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    BUDynamicCast();
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

- (BCCloudDataPrivacyDelegate)privacyDelegate
{
  return (BCCloudDataPrivacyDelegate *)objc_loadWeakRetained((id *)&self->_privacyDelegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_privacyDelegate);
}

@end
