@implementation CRFileSystemController

- (CRFileSystemController)init
{
  void *v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  const char *v10;

  v4 = (void *)MEMORY[0x24BDBCE88];
  v5 = *MEMORY[0x24BDBCAB0];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_sharedSingleton);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_raise_format_(v4, v10, v5, (uint64_t)CFSTR("Use +[%@ %@] instead of -%@."), v7, v8, v9);

  return 0;
}

- (id)_init
{
  CRFileSystemController *v2;
  CRFileSystemController *v3;
  NSString *tmpFDRDataPathStr;
  NSString *activeFDRDataPathStr;
  NSString *defaultFDRPathStr;
  NSString *alternativeFDRPathStr;
  NSString *alternativeFDRRealPathStr;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CRFileSystemController;
  v2 = -[CRFileSystemController init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    tmpFDRDataPathStr = v2->tmpFDRDataPathStr;
    v2->tmpFDRDataPathStr = 0;

    activeFDRDataPathStr = v3->activeFDRDataPathStr;
    v3->activeFDRDataPathStr = 0;

    defaultFDRPathStr = v3->defaultFDRPathStr;
    v3->defaultFDRPathStr = 0;

    alternativeFDRPathStr = v3->alternativeFDRPathStr;
    v3->alternativeFDRPathStr = (NSString *)CFSTR("/private/var/hardware/FactoryData/System/Library/Caches/Repair");

    alternativeFDRRealPathStr = v3->alternativeFDRRealPathStr;
    v3->alternativeFDRRealPathStr = (NSString *)CFSTR("/private/var/tmp/com.apple.corerepaird/FactoryData");

  }
  return v3;
}

+ (id)sharedSingleton
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_21452EA00;
  block[3] = &unk_24D1AA2E8;
  block[4] = a1;
  if (qword_253E797F8 != -1)
    dispatch_once(&qword_253E797F8, block);
  return (id)qword_253E79848;
}

- (BOOL)syncAlternativeFDRPath
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  NSString **p_alternativeFDRRealPathStr;
  const char *v7;
  uint64_t v8;
  int v9;
  NSObject *v10;
  NSString *alternativeFDRRealPathStr;
  NSString *defaultFDRPathStr;
  const char *v13;
  char v14;
  NSObject *v15;
  NSObject *v16;
  NSString *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  const char *v23;
  char v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  NSString *alternativeFDRPathStr;
  const char *v30;
  NSObject *v31;
  NSObject *v32;
  NSString *v33;
  BOOL v34;
  NSObject *v36;
  NSObject *v37;
  id v38;
  uint8_t buf[4];
  NSString *v40;
  __int16 v41;
  NSObject *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_defaultManager(MEMORY[0x24BDD1580], a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  p_alternativeFDRRealPathStr = &self->alternativeFDRRealPathStr;
  v9 = objc_msgSend_fileExistsAtPath_(v5, v7, (uint64_t)self->alternativeFDRRealPathStr, v8);

  if (!v9)
    return 1;
  handleForCategory(0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    alternativeFDRRealPathStr = self->alternativeFDRRealPathStr;
    defaultFDRPathStr = self->defaultFDRPathStr;
    *(_DWORD *)buf = 138412546;
    v40 = alternativeFDRRealPathStr;
    v41 = 2112;
    v42 = defaultFDRPathStr;
    _os_log_impl(&dword_214503000, v10, OS_LOG_TYPE_DEFAULT, "Syncing %@ to %@ ...", buf, 0x16u);
  }

  v14 = objc_msgSend_syncFDRDataAtPath_toPath_(self, v13, (uint64_t)self->alternativeFDRRealPathStr, (uint64_t)self->defaultFDRPathStr);
  handleForCategory(0);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if ((v14 & 1) != 0)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v17 = *p_alternativeFDRRealPathStr;
      *(_DWORD *)buf = 138412290;
      v40 = v17;
      _os_log_impl(&dword_214503000, v16, OS_LOG_TYPE_DEFAULT, "%@ exists, deleting...", buf, 0xCu);
    }

    objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (uint64_t)*p_alternativeFDRRealPathStr;
    v38 = 0;
    v24 = objc_msgSend_removeItemAtPath_error_(v21, v23, v22, (uint64_t)&v38);
    v16 = v38;

    if ((v24 & 1) != 0)
    {
      objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v25, v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      alternativeFDRPathStr = self->alternativeFDRPathStr;
      v37 = v16;
      objc_msgSend_removeItemAtPath_error_(v28, v30, (uint64_t)alternativeFDRPathStr, (uint64_t)&v37);
      v31 = v37;

      handleForCategory(0);
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v33 = self->alternativeFDRPathStr;
        *(_DWORD *)buf = 138412546;
        v40 = v33;
        v41 = 2112;
        v42 = v31;
        _os_log_impl(&dword_214503000, v32, OS_LOG_TYPE_DEFAULT, "Delete %@, error: %@", buf, 0x16u);
      }

      v34 = 1;
      v16 = v31;
      goto LABEL_11;
    }
    handleForCategory(0);
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      sub_21456BBD0();

  }
  else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    sub_21456BC30();
  }
  v34 = 0;
LABEL_11:

  return v34;
}

- (BOOL)setupAlternativeFDRPath:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  void *v30;
  NSString *alternativeFDRPathStr;
  const char *v32;
  NSString *v33;
  NSObject *v34;
  NSString *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  NSString *v41;
  NSString *v42;
  NSString *defaultFDRPathStr;
  NSObject *v44;
  NSString *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  NSString **p_alternativeFDRRealPathStr;
  const char *v55;
  uint64_t v56;
  int v57;
  NSObject *v58;
  NSString *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  const char *v65;
  char v66;
  NSString *v67;
  NSObject *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  char v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  NSObject *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  char v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  char v89;
  NSObject *v90;
  NSString *v91;
  NSString *alternativeFDRRealPathStr;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  NSString *v97;
  NSString *v98;
  const char *v99;
  char v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  int v104;
  NSObject *v105;
  NSString *v106;
  NSString *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  NSString *v112;
  NSString *v113;
  const char *v114;
  char v115;
  BOOL v116;
  NSString *v118;
  NSString *v119;
  NSObject *v120;
  NSString *v121;
  NSString *v122;
  NSString *v123;
  NSString *v124;
  NSString *v125;
  NSString *v126;
  NSString *v127;
  id v128;
  uint8_t buf[4];
  NSObject *v130;
  __int16 v131;
  NSString *v132;
  __int16 v133;
  NSString *v134;
  uint64_t v135;

  v135 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend_objectForKeyedSubscript_(v4, v5, (uint64_t)CFSTR("enableStagedSeal"), v6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7
    && (v10 = (void *)v7,
        objc_msgSend_objectForKeyedSubscript_(v4, v8, (uint64_t)CFSTR("enableStagedSeal"), v9),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v11,
        v10,
        (isKindOfClass & 1) != 0))
  {
    objc_msgSend_objectForKeyedSubscript_(v4, v8, (uint64_t)CFSTR("enableStagedSeal"), v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend_BOOLValue(v13, v14, v15, v16);

  }
  else
  {
    v17 = 0;
  }
  objc_msgSend_objectForKeyedSubscript_(v4, v8, (uint64_t)CFSTR("ignoreStagedData"), v9);
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18
    && (v22 = (void *)v18,
        objc_msgSend_objectForKeyedSubscript_(v4, v19, (uint64_t)CFSTR("ignoreStagedData"), v21),
        v23 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        v24 = objc_opt_isKindOfClass(),
        v23,
        v22,
        (v24 & 1) != 0))
  {
    objc_msgSend_objectForKeyedSubscript_(v4, v19, (uint64_t)CFSTR("ignoreStagedData"), v21);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend_BOOLValue(v25, v26, v27, v28);

  }
  else
  {
    v29 = 0;
  }
  objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v19, v20, v21);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  alternativeFDRPathStr = self->alternativeFDRPathStr;
  v128 = 0;
  objc_msgSend_removeItemAtPath_error_(v30, v32, (uint64_t)alternativeFDRPathStr, (uint64_t)&v128);
  v33 = (NSString *)v128;

  handleForCategory(0);
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    v35 = self->alternativeFDRPathStr;
    *(_DWORD *)buf = 138412546;
    v130 = v35;
    v131 = 2112;
    v132 = v33;
    _os_log_impl(&dword_214503000, v34, OS_LOG_TYPE_DEFAULT, "Delete %@, error: %@", buf, 0x16u);
  }

  objc_msgSend_sharedDataAccessor(MEMORY[0x24BE63540], v36, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v127 = v33;
  v41 = (NSString *)objc_msgSend_copyPathForPersistentData_error_(v39, v40, 100, (uint64_t)&v127);
  v42 = v127;

  defaultFDRPathStr = self->defaultFDRPathStr;
  self->defaultFDRPathStr = v41;

  handleForCategory(0);
  v44 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    v45 = self->defaultFDRPathStr;
    *(_DWORD *)buf = 138412290;
    v130 = v45;
    _os_log_impl(&dword_214503000, v44, OS_LOG_TYPE_DEFAULT, "defaultFDRPathStr is %@", buf, 0xCu);
  }

  if (v29)
  {
    handleForCategory(0);
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_214503000, v49, OS_LOG_TYPE_DEFAULT, "Deleting staged FDR data ...", buf, 2u);
    }

    objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v50, v51, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    p_alternativeFDRRealPathStr = &self->alternativeFDRRealPathStr;
    v57 = objc_msgSend_fileExistsAtPath_(v53, v55, (uint64_t)self->alternativeFDRRealPathStr, v56);

    if (v57)
    {
      handleForCategory(0);
      v58 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
      {
        v59 = *p_alternativeFDRRealPathStr;
        *(_DWORD *)buf = 138412290;
        v130 = v59;
        _os_log_impl(&dword_214503000, v58, OS_LOG_TYPE_DEFAULT, "%@ exists, deleting...", buf, 0xCu);
      }

      objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v60, v61, v62);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = (uint64_t)*p_alternativeFDRRealPathStr;
      v126 = v42;
      v66 = objc_msgSend_removeItemAtPath_error_(v63, v65, v64, (uint64_t)&v126);
      v67 = v126;

      if ((v66 & 1) == 0)
      {
        handleForCategory(0);
        v68 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
          sub_21456BBD0();
        goto LABEL_50;
      }
      v42 = v67;
    }
  }
  if (v17)
  {
    objc_msgSend_stringByDeletingLastPathComponent(self->alternativeFDRRealPathStr, v46, v47, v48);
    v68 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v69, v70, v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = objc_msgSend_fileExistsAtPath_(v72, v73, (uint64_t)v68, v74);

    if ((v75 & 1) == 0)
    {
      handleForCategory(0);
      v79 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v130 = v68;
        _os_log_impl(&dword_214503000, v79, OS_LOG_TYPE_DEFAULT, "Create directory at %@", buf, 0xCu);
      }

      objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v80, v81, v82);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v125 = v42;
      v85 = objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(v83, v84, (uint64_t)v68, 1, 0, &v125);
      v67 = v125;

      if ((v85 & 1) == 0)
      {
        handleForCategory(0);
        v120 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
          sub_21456BC98();
        goto LABEL_49;
      }
      v42 = v67;
    }
    objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v76, v77, v78);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = objc_msgSend_fileExistsAtPath_(v86, v87, (uint64_t)self->alternativeFDRRealPathStr, v88);

    if ((v89 & 1) != 0)
    {
LABEL_32:

      goto LABEL_33;
    }
    handleForCategory(0);
    v90 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
    {
      v91 = self->defaultFDRPathStr;
      alternativeFDRRealPathStr = self->alternativeFDRRealPathStr;
      *(_DWORD *)buf = 138412546;
      v130 = v91;
      v131 = 2112;
      v132 = alternativeFDRRealPathStr;
      _os_log_impl(&dword_214503000, v90, OS_LOG_TYPE_DEFAULT, "Copy %@ to %@", buf, 0x16u);
    }

    objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v93, v94, v95);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = self->defaultFDRPathStr;
    v98 = self->alternativeFDRRealPathStr;
    v124 = v42;
    v100 = objc_msgSend_copyItemAtPath_toPath_error_(v96, v99, (uint64_t)v97, (uint64_t)v98, &v124);
    v67 = v124;

    if ((v100 & 1) != 0)
    {
      v42 = v67;
      goto LABEL_32;
    }
    handleForCategory(0);
    v120 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
    {
      v121 = self->defaultFDRPathStr;
      v122 = self->alternativeFDRRealPathStr;
      *(_DWORD *)buf = 138412802;
      v130 = v121;
      v131 = 2112;
      v132 = v122;
      v133 = 2112;
      v134 = v67;
      _os_log_error_impl(&dword_214503000, v120, OS_LOG_TYPE_ERROR, "Failed to copy %@ to %@, error: %@", buf, 0x20u);
    }
LABEL_49:

LABEL_50:
    v116 = 0;
    goto LABEL_38;
  }
LABEL_33:
  objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v46, v47, v48);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = objc_msgSend_fileExistsAtPath_(v101, v102, (uint64_t)self->alternativeFDRRealPathStr, v103);

  if (!v104)
  {
    v116 = 1;
    goto LABEL_40;
  }
  handleForCategory(0);
  v105 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
  {
    v106 = self->alternativeFDRPathStr;
    v107 = self->alternativeFDRRealPathStr;
    *(_DWORD *)buf = 138412546;
    v130 = v106;
    v131 = 2112;
    v132 = v107;
    _os_log_impl(&dword_214503000, v105, OS_LOG_TYPE_DEFAULT, "Symlink %@ to %@", buf, 0x16u);
  }

  objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v108, v109, v110);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = self->alternativeFDRPathStr;
  v113 = self->alternativeFDRRealPathStr;
  v123 = v42;
  v115 = objc_msgSend_createSymbolicLinkAtPath_withDestinationPath_error_(v111, v114, (uint64_t)v112, (uint64_t)v113, &v123);
  v67 = v123;

  if ((v115 & 1) == 0)
  {
    handleForCategory(0);
    v68 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
    {
      v118 = self->alternativeFDRPathStr;
      v119 = self->alternativeFDRRealPathStr;
      *(_DWORD *)buf = 138412802;
      v130 = v118;
      v131 = 2112;
      v132 = v119;
      v133 = 2112;
      v134 = v67;
      _os_log_error_impl(&dword_214503000, v68, OS_LOG_TYPE_ERROR, "Failed to create symlink %@ to %@, error: %@", buf, 0x20u);
    }
    goto LABEL_50;
  }
  v116 = 1;
LABEL_38:
  v42 = v67;
LABEL_40:

  return v116;
}

- (id)setupFileSystemForRepair
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  NSString *v8;
  id v9;
  NSString *activeFDRDataPathStr;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  NSString *v14;
  const char *v15;
  ssize_t v16;
  const char *v17;
  uint64_t v18;
  ssize_t v19;
  void *v20;
  NSObject *v21;
  NSString *v22;
  NSObject *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  NSString *v29;
  void *v30;
  void *v31;
  void *v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  NSString *v37;
  NSString *v38;
  void *v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  NSString *v43;
  NSString *tmpFDRDataPathStr;
  uint64_t *p_tmpFDRDataPathStr;
  NSObject *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  int v54;
  NSObject *v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  const char *v62;
  char v63;
  id v64;
  NSObject *v65;
  NSObject *v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  NSString *v72;
  NSString *v73;
  const char *v74;
  char v75;
  NSObject *v76;
  id v77;
  NSObject *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  NSString *v87;
  NSString *v88;
  id v89;
  id v90;
  id v91;
  uint8_t buf[4];
  uint64_t v93;
  __int16 v94;
  NSString *v95;
  __int16 v96;
  id v97;
  char v98[1024];
  uint64_t v99;

  v99 = *MEMORY[0x24BDAC8D0];
  bzero(v98, 0x400uLL);
  objc_msgSend_sharedDataAccessor(MEMORY[0x24BE63540], v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = 0;
  v8 = (NSString *)objc_msgSend_copyPathForPersistentData_error_(v6, v7, 100, (uint64_t)&v91);
  v9 = v91;
  activeFDRDataPathStr = self->activeFDRDataPathStr;
  self->activeFDRDataPathStr = v8;

  v14 = self->activeFDRDataPathStr;
  if (!v14)
  {
    handleForCategory(0);
    v65 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      sub_21456BD2C((uint64_t)v9, v65);
    v20 = 0;
    goto LABEL_37;
  }
  v15 = (const char *)objc_msgSend_UTF8String(v14, v11, v12, v13);
  v16 = readlink(v15, v98, 0x3FFuLL);
  v19 = v16;
  if (v16)
  {
    v98[v16] = 0;
    objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v17, (uint64_t)v98, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }
  handleForCategory(0);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = self->activeFDRDataPathStr;
    *(_DWORD *)buf = 138412290;
    v93 = (uint64_t)v22;
    _os_log_impl(&dword_214503000, v21, OS_LOG_TYPE_DEFAULT, "FDR data path is %@", buf, 0xCu);
  }

  handleForCategory(0);
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v93 = (uint64_t)v20;
    v94 = 2048;
    v95 = (NSString *)v19;
    _os_log_impl(&dword_214503000, v23, OS_LOG_TYPE_DEFAULT, "FDR data Real path is %@ (%ld)", buf, 0x16u);
  }

  if (v20 && objc_msgSend_length(v20, v24, v25, v26))
  {
    if (objc_msgSend_isAbsolutePath(v20, v24, v25, v26))
    {
      v29 = v20;
      v30 = self->activeFDRDataPathStr;
      self->activeFDRDataPathStr = v29;
    }
    else
    {
      v31 = (void *)MEMORY[0x24BDBCF48];
      objc_msgSend_URLWithString_(MEMORY[0x24BDBCF48], v27, (uint64_t)self->activeFDRDataPathStr, v28);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_URLWithString_relativeToURL_(v31, v33, (uint64_t)v20, (uint64_t)v32);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_absoluteString(v30, v34, v35, v36);
      v37 = (NSString *)objc_claimAutoreleasedReturnValue();
      v38 = self->activeFDRDataPathStr;
      self->activeFDRDataPathStr = v37;

    }
  }
  v39 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_stringByDeletingLastPathComponent(self->activeFDRDataPathStr, v24, v25, v26);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v39, v41, (uint64_t)CFSTR("%@/%s"), v42, v40, "Backup");
  v43 = (NSString *)objc_claimAutoreleasedReturnValue();
  p_tmpFDRDataPathStr = (uint64_t *)&self->tmpFDRDataPathStr;
  tmpFDRDataPathStr = self->tmpFDRDataPathStr;
  self->tmpFDRDataPathStr = v43;

  handleForCategory(0);
  v46 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
  {
    v47 = *p_tmpFDRDataPathStr;
    *(_DWORD *)buf = 138412290;
    v93 = v47;
    _os_log_impl(&dword_214503000, v46, OS_LOG_TYPE_DEFAULT, "Temporary FDR Directory is %@", buf, 0xCu);
  }

  objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v48, v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend_fileExistsAtPath_(v51, v52, *p_tmpFDRDataPathStr, v53);

  if (v54)
  {
    handleForCategory(0);
    v55 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      v56 = *p_tmpFDRDataPathStr;
      *(_DWORD *)buf = 138412290;
      v93 = v56;
      _os_log_impl(&dword_214503000, v55, OS_LOG_TYPE_DEFAULT, "%@ directory exists, deleting...", buf, 0xCu);
    }

    objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v57, v58, v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = *p_tmpFDRDataPathStr;
    v90 = v9;
    v63 = objc_msgSend_removeItemAtPath_error_(v60, v62, v61, (uint64_t)&v90);
    v64 = v90;

    if ((v63 & 1) == 0)
    {
      handleForCategory(0);
      v65 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
        sub_21456BBD0();
      v9 = v64;
LABEL_37:

      handleForCategory(0);
      v79 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
        sub_21456BCF8(v79, v80, v81, v82, v83, v84, v85, v86);

      v77 = 0;
      goto LABEL_31;
    }
  }
  else
  {
    v64 = v9;
  }
  handleForCategory(0);
  v66 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
  {
    v67 = *p_tmpFDRDataPathStr;
    *(_DWORD *)buf = 138412290;
    v93 = v67;
    _os_log_impl(&dword_214503000, v66, OS_LOG_TYPE_DEFAULT, "Copying persistent FDR data to temporary directory: %@", buf, 0xCu);
  }

  objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v68, v69, v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = self->activeFDRDataPathStr;
  v73 = self->tmpFDRDataPathStr;
  v89 = v64;
  v75 = objc_msgSend_copyItemAtPath_toPath_error_(v71, v74, (uint64_t)v72, (uint64_t)v73, &v89);
  v9 = v89;

  handleForCategory(0);
  v76 = objc_claimAutoreleasedReturnValue();
  v65 = v76;
  if ((v75 & 1) == 0)
  {
    if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
    {
      v87 = self->activeFDRDataPathStr;
      v88 = self->tmpFDRDataPathStr;
      *(_DWORD *)buf = 138412802;
      v93 = (uint64_t)v87;
      v94 = 2112;
      v95 = v88;
      v96 = 2112;
      v97 = v9;
      _os_log_error_impl(&dword_214503000, v65, OS_LOG_TYPE_ERROR, "Failed to copy %@ to %@, error: %@", buf, 0x20u);
    }
    goto LABEL_37;
  }
  if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_214503000, v65, OS_LOG_TYPE_DEFAULT, "FileSystem setup for repair successfully", buf, 2u);
  }

  v77 = (id)*p_tmpFDRDataPathStr;
LABEL_31:

  return v77;
}

- (int64_t)commitToFileSystem
{
  NSObject *v3;
  NSString *tmpFDRDataPathStr;
  NSString *activeFDRDataPathStr;
  const char *v6;
  NSObject *v8;
  int v9;
  NSString *v10;
  __int16 v11;
  NSString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  handleForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    tmpFDRDataPathStr = self->tmpFDRDataPathStr;
    activeFDRDataPathStr = self->activeFDRDataPathStr;
    v9 = 138412546;
    v10 = tmpFDRDataPathStr;
    v11 = 2112;
    v12 = activeFDRDataPathStr;
    _os_log_impl(&dword_214503000, v3, OS_LOG_TYPE_DEFAULT, "Syncing %@ to %@ ...", (uint8_t *)&v9, 0x16u);
  }

  if ((objc_msgSend_syncFDRDataAtPath_toPath_(self, v6, (uint64_t)self->tmpFDRDataPathStr, (uint64_t)self->activeFDRDataPathStr) & 1) != 0)return 0;
  handleForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    sub_21456BC30();

  return -17;
}

- (BOOL)cleanupFileSystemForRepair
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  NSString **p_tmpFDRDataPathStr;
  NSString *tmpFDRDataPathStr;
  const char *v8;
  uint64_t v9;
  int v10;
  NSObject *v11;
  NSString *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  const char *v18;
  char v19;
  id v20;
  NSObject *v21;
  BOOL v22;
  id v24;
  uint8_t buf[4];
  NSString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_defaultManager(MEMORY[0x24BDD1580], a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  tmpFDRDataPathStr = self->tmpFDRDataPathStr;
  p_tmpFDRDataPathStr = &self->tmpFDRDataPathStr;
  v10 = objc_msgSend_fileExistsAtPath_(v5, v8, (uint64_t)tmpFDRDataPathStr, v9);

  if (!v10)
  {
    v20 = 0;
LABEL_9:
    v22 = 1;
    goto LABEL_10;
  }
  handleForCategory(0);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = *p_tmpFDRDataPathStr;
    *(_DWORD *)buf = 138412290;
    v26 = v12;
    _os_log_impl(&dword_214503000, v11, OS_LOG_TYPE_DEFAULT, "%@ directory exists, deleting...", buf, 0xCu);
  }

  objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (uint64_t)*p_tmpFDRDataPathStr;
  v24 = 0;
  v19 = objc_msgSend_removeItemAtPath_error_(v16, v18, v17, (uint64_t)&v24);
  v20 = v24;

  if ((v19 & 1) != 0)
    goto LABEL_9;
  handleForCategory(0);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    sub_21456BBD0();

  v22 = 0;
LABEL_10:

  return v22;
}

- (BOOL)clearRepairBackup:(id *)a3
{
  uint64_t v3;
  void *v6;
  NSString *alternativeFDRPathStr;
  const char *v8;
  id v9;
  NSObject *v10;
  NSString *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  NSString *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  int v33;
  NSObject *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  char v40;
  id v41;
  BOOL v42;
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  id v53;
  id v54;
  uint8_t buf[4];
  NSString *v56;
  __int16 v57;
  id v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_defaultManager(MEMORY[0x24BDD1580], a2, (uint64_t)a3, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  alternativeFDRPathStr = self->alternativeFDRPathStr;
  v54 = 0;
  objc_msgSend_removeItemAtPath_error_(v6, v8, (uint64_t)alternativeFDRPathStr, (uint64_t)&v54);
  v9 = v54;

  handleForCategory(0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = self->alternativeFDRPathStr;
    *(_DWORD *)buf = 138412546;
    v56 = v11;
    v57 = 2112;
    v58 = v9;
    _os_log_impl(&dword_214503000, v10, OS_LOG_TYPE_DEFAULT, "Delete %@, error: %@", buf, 0x16u);
  }

  objc_msgSend_sharedDataAccessor(MEMORY[0x24BE63540], v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v9;
  v17 = (void *)objc_msgSend_copyPathForPersistentData_error_(v15, v16, 100, (uint64_t)&v53);
  v18 = v53;

  if (!v17)
  {
    handleForCategory(0);
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      sub_21456BD9C(v44, v45, v46, v47, v48, v49, v50, v51);
    v26 = 0;
LABEL_19:

    v42 = 0;
    if (!a3)
      goto LABEL_12;
    goto LABEL_11;
  }
  v22 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_stringByDeletingLastPathComponent(v17, v19, v20, v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v22, v24, (uint64_t)CFSTR("%@/%s"), v25, v23, "Backup");
  v26 = (NSString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend_fileExistsAtPath_(v30, v31, (uint64_t)v26, v32);

  if (v33)
  {
    handleForCategory(0);
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v56 = v26;
      _os_log_impl(&dword_214503000, v34, OS_LOG_TYPE_DEFAULT, "%@ directory exists, deleting...", buf, 0xCu);
    }

    objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v35, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v18;
    v40 = objc_msgSend_removeItemAtPath_error_(v38, v39, (uint64_t)v26, (uint64_t)&v52);
    v41 = v52;

    if ((v40 & 1) != 0)
    {
      v42 = 1;
      v18 = v41;
      if (!a3)
        goto LABEL_12;
      goto LABEL_11;
    }
    handleForCategory(0);
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      sub_21456BDD0();
    v18 = v41;
    goto LABEL_19;
  }
  v42 = 1;
  if (a3)
LABEL_11:
    *a3 = objc_retainAutorelease(v18);
LABEL_12:

  return v42;
}

- (BOOL)syncFDRDataAtPath:(id)a3 toPath:(id)a4
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  int v33;
  NSObject *v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  int v71;
  NSObject *v72;
  const char *v73;
  void *v75;
  void *v76;
  id v77;
  id obj;
  id v79;
  id v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _QWORD v85[5];
  id v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _QWORD v91[5];
  uint64_t v92;
  uint64_t *v93;
  uint64_t v94;
  uint64_t (*v95)(uint64_t, uint64_t);
  void (*v96)(uint64_t);
  id v97;
  uint64_t v98;
  uint64_t *v99;
  uint64_t v100;
  uint64_t (*v101)(uint64_t, uint64_t);
  void (*v102)(uint64_t);
  id v103;
  uint8_t v104[128];
  uint8_t buf[4];
  void *v106;
  __int16 v107;
  id v108;
  _BYTE v109[128];
  uint64_t v110;

  v110 = *MEMORY[0x24BDAC8D0];
  v77 = a3;
  v79 = a4;
  v98 = 0;
  v99 = &v98;
  v100 = 0x3032000000;
  v101 = sub_2145305EC;
  v102 = sub_2145305FC;
  v103 = (id)objc_opt_new();
  v92 = 0;
  v93 = &v92;
  v94 = 0x3032000000;
  v95 = sub_2145305EC;
  v96 = sub_2145305FC;
  v97 = (id)objc_opt_new();
  objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_contentsOfDirectoryAtPath_error_(v8, v9, (uint64_t)v79, 0);
  v76 = (void *)objc_claimAutoreleasedReturnValue();

  v91[0] = MEMORY[0x24BDAC760];
  v91[1] = 3221225472;
  v91[2] = sub_214530604;
  v91[3] = &unk_24D1AA400;
  v91[4] = &v98;
  objc_msgSend_enumerateObjectsUsingBlock_(v76, v10, (uint64_t)v91, v11);
  v89 = 0u;
  v90 = 0u;
  v88 = 0u;
  v87 = 0u;
  obj = (id)v99[5];
  v13 = 0;
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v12, (uint64_t)&v87, (uint64_t)v109, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v88;
    while (2)
    {
      v16 = 0;
      v17 = v13;
      do
      {
        if (*(_QWORD *)v88 != v15)
          objc_enumerationMutation(obj);
        v18 = *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * v16);
        v19 = (void *)MEMORY[0x2199D19CC]();
        v23 = (void *)objc_msgSend_mutableCopy(v79, v20, v21, v22);
        objc_msgSend_appendString_(v23, v24, (uint64_t)CFSTR("/"), v25);
        objc_msgSend_appendString_(v23, v26, v18, v27);
        objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v28, v29, v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v86 = v17;
        v33 = objc_msgSend_removeItemAtPath_error_(v31, v32, (uint64_t)v23, (uint64_t)&v86);
        v13 = v86;

        if ((v33 & 1) != 0)
        {
          handleForCategory(0);
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v106 = v23;
            _os_log_debug_impl(&dword_214503000, v34, OS_LOG_TYPE_DEBUG, "Successfully deleted: %@", buf, 0xCu);
          }
        }
        else
        {
          handleForCategory(0);
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v106 = v23;
            v107 = 2112;
            v108 = v13;
            _os_log_error_impl(&dword_214503000, v34, OS_LOG_TYPE_ERROR, "Failed to delete file: %@ error: %@", buf, 0x16u);
          }
        }

        objc_autoreleasePoolPop(v19);
        if (!v33)
        {
          LOBYTE(v71) = 0;
          goto LABEL_31;
        }
        ++v16;
        v17 = v13;
      }
      while (v14 != v16);
      v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v35, (uint64_t)&v87, (uint64_t)v109, 16);
      if (v14)
        continue;
      break;
    }
  }

  objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v36, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_contentsOfDirectoryAtPath_error_(v39, v40, (uint64_t)v77, 0);
  v75 = (void *)objc_claimAutoreleasedReturnValue();

  v85[0] = MEMORY[0x24BDAC760];
  v85[1] = 3221225472;
  v85[2] = sub_214530658;
  v85[3] = &unk_24D1AA400;
  v85[4] = &v92;
  objc_msgSend_enumerateObjectsUsingBlock_(v75, v41, (uint64_t)v85, v42);
  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  obj = (id)v93[5];
  v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v43, (uint64_t)&v81, (uint64_t)v104, 16);
  if (v44)
  {
    v45 = *(_QWORD *)v82;
LABEL_16:
    v46 = 0;
    v47 = v13;
    while (1)
    {
      if (*(_QWORD *)v82 != v45)
        objc_enumerationMutation(obj);
      v48 = *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * v46);
      v49 = (void *)MEMORY[0x2199D19CC]();
      v53 = (void *)objc_msgSend_mutableCopy(v77, v50, v51, v52);
      objc_msgSend_appendString_(v53, v54, (uint64_t)CFSTR("/"), v55);
      objc_msgSend_appendString_(v53, v56, v48, v57);
      v61 = (void *)objc_msgSend_mutableCopy(v79, v58, v59, v60);
      objc_msgSend_appendString_(v61, v62, (uint64_t)CFSTR("/"), v63);
      objc_msgSend_appendString_(v61, v64, v48, v65);
      objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v66, v67, v68);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = v47;
      v71 = objc_msgSend_copyItemAtPath_toPath_error_(v69, v70, (uint64_t)v53, (uint64_t)v61, &v80);
      v13 = v80;

      if ((v71 & 1) != 0)
      {
        handleForCategory(0);
        v72 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v106 = v61;
          _os_log_debug_impl(&dword_214503000, v72, OS_LOG_TYPE_DEBUG, "Successfully added: %@", buf, 0xCu);
        }
      }
      else
      {
        handleForCategory(0);
        v72 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v106 = v53;
          v107 = 2112;
          v108 = v13;
          _os_log_error_impl(&dword_214503000, v72, OS_LOG_TYPE_ERROR, "Failed to add file: %@ error: %@", buf, 0x16u);
        }
      }

      objc_autoreleasePoolPop(v49);
      if (!v71)
        break;
      ++v46;
      v47 = v13;
      if (v44 == v46)
      {
        v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v73, (uint64_t)&v81, (uint64_t)v104, 16);
        LOBYTE(v71) = 1;
        if (v44)
          goto LABEL_16;
        break;
      }
    }
  }
  else
  {
    LOBYTE(v71) = 1;
  }
  v76 = v75;
LABEL_31:

  _Block_object_dispose(&v92, 8);
  _Block_object_dispose(&v98, 8);

  return v71;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->tmpFDRDataPathStr, 0);
  objc_storeStrong((id *)&self->alternativeFDRRealPathStr, 0);
  objc_storeStrong((id *)&self->alternativeFDRPathStr, 0);
  objc_storeStrong((id *)&self->defaultFDRPathStr, 0);
  objc_storeStrong((id *)&self->activeFDRDataPathStr, 0);
}

@end
