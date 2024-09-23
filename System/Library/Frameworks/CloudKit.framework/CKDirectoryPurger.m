@implementation CKDirectoryPurger

+ (void)purgeDirectoryAtURL:(id)a3
{
  id v3;
  CKDirectoryPurger *v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v3 = a3;
    v4 = [CKDirectoryPurger alloc];
    v15[0] = v3;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v5, (uint64_t)v15, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)objc_msgSend_initWithDirectoryURLs_(v4, v7, (uint64_t)v6, v8);
    objc_msgSend_setShouldRemoveFileBlock_(v9, v10, (uint64_t)&unk_1E1F58778, v11);
    objc_msgSend_purge(v9, v12, v13, v14);

  }
}

- (CKDirectoryPurger)initWithDirectoryURLs:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  CKDirectoryPurger *v8;
  uint64_t v9;
  NSArray *urls;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CKDirectoryPurger;
  v8 = -[CKDirectoryPurger init](&v12, sel_init);
  if (v8)
  {
    objc_msgSend_CKDeepCopy(v4, v5, v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();
    urls = v8->_urls;
    v8->_urls = (NSArray *)v9;

  }
  return v8;
}

- (void)purge
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  int ResourceValue_forKey_error;
  id v30;
  const char *v31;
  os_log_t v32;
  int v33;
  id v34;
  NSObject *v35;
  const char *v36;
  char v37;
  id v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  double v49;
  double v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  int v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  void *v64;
  const __CFString *v65;
  void *v66;
  NSObject *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  NSObject *v72;
  const char *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  char v77;
  void *v78;
  NSObject *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  void *v85;
  const __CFString *v86;
  void *v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  id obj;
  uint64_t v99;
  void *v100;
  uint64_t v101;
  uint64_t v102;
  id v103;
  void *v104;
  NSObject *log;
  os_log_t loga;
  uint64_t (**v107)(void);
  unsigned int (**v108)(void);
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  id v112;
  uint64_t v113;
  os_log_t v114;
  id v115;
  id v116;
  id v117;
  id v118;
  id v119;
  id v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  uint8_t buf[4];
  void *v130;
  __int16 v131;
  os_log_t v132;
  __int16 v133;
  uint64_t v134;
  __int16 v135;
  void *v136;
  __int16 v137;
  uint64_t v138;
  _BYTE v139[128];
  _BYTE v140[128];
  _QWORD v141[6];

  v141[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend_shouldSkipFileBlock(self, a2, v2, v3);
  v108 = (unsigned int (**)(void))objc_claimAutoreleasedReturnValue();
  objc_msgSend_shouldRemoveFileBlock(self, v5, v6, v7);
  v107 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
  objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v8, v9, v10);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0C999D0];
  v113 = *MEMORY[0x1E0C99A90];
  v141[0] = *MEMORY[0x1E0C99A90];
  v141[1] = v11;
  v111 = v11;
  v110 = *MEMORY[0x1E0C998E8];
  v141[2] = *MEMORY[0x1E0C998E8];
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v12, (uint64_t)v141, 3);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend_setDateFormat_(v103, v13, (uint64_t)CFSTR("yyyy-MM-dd HH:mm:ss"), v14);
  v127 = 0u;
  v128 = 0u;
  v126 = 0u;
  v125 = 0u;
  objc_msgSend_urls(self, v15, v16, v17);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v101 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v18, (uint64_t)&v125, (uint64_t)v140, 16);
  if (v101)
  {
    v99 = *(_QWORD *)v126;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v126 != v99)
          objc_enumerationMutation(obj);
        v102 = v20;
        objc_msgSend_enumeratorAtURL_includingPropertiesForKeys_options_errorHandler_(v104, v19, *(_QWORD *)(*((_QWORD *)&v125 + 1) + 8 * v20), (uint64_t)v100, 0, &unk_1E1F64BE0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v121 = 0u;
        v122 = 0u;
        v123 = 0u;
        v124 = 0u;
        v112 = v21;
        v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v121, (uint64_t)v139, 16);
        if (v23)
        {
          v25 = v23;
          v26 = *(_QWORD *)v122;
          do
          {
            v27 = 0;
            do
            {
              if (*(_QWORD *)v122 != v26)
                objc_enumerationMutation(v112);
              v28 = *(void **)(*((_QWORD *)&v121 + 1) + 8 * v27);
              v119 = 0;
              v120 = 0;
              ResourceValue_forKey_error = objc_msgSend_getResourceValue_forKey_error_(v28, v24, (uint64_t)&v120, v113, &v119);
              v30 = v120;
              v32 = (os_log_t)v119;
              if (!ResourceValue_forKey_error)
              {
                v38 = 0;
                v34 = 0;
                goto LABEL_29;
              }
              v117 = 0;
              v118 = 0;
              v33 = objc_msgSend_getResourceValue_forKey_error_(v28, v31, (uint64_t)&v118, v111, &v117);
              v34 = v118;
              v35 = v117;

              if (!v33)
              {
                v38 = 0;
                v32 = v35;
LABEL_29:
                if (ck_log_initialization_predicate != -1)
                  dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
                v66 = (void *)ck_log_facility_ck;
                if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
                {
                  v67 = v66;
                  objc_msgSend_CKSanitizedPath(v28, v68, v69, v70);
                  v71 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v130 = v71;
                  v131 = 2112;
                  v132 = v32;
                  v72 = v67;
                  v73 = "Warn: Failed to get the resource value at %{public}@: %@";
LABEL_33:
                  _os_log_impl(&dword_18A5C5000, v72, OS_LOG_TYPE_INFO, v73, buf, 0x16u);

                  goto LABEL_34;
                }
                goto LABEL_34;
              }
              v115 = 0;
              v116 = 0;
              v37 = objc_msgSend_getResourceValue_forKey_error_(v28, v36, (uint64_t)&v116, v110, &v115);
              v38 = v116;
              v32 = (os_log_t)v115;

              if ((v37 & 1) == 0)
                goto LABEL_29;
              if (v30 && v34 && v38)
              {
                v42 = objc_msgSend_level(v112, v39, v40, v41);
                objc_msgSend_date(MEMORY[0x1E0C99D68], v43, v44, v45);
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_timeIntervalSinceDate_(v46, v47, (uint64_t)v38, v48);
                v50 = v49;

                v54 = objc_msgSend_BOOLValue(v34, v51, v52, v53);
                v109 = v42;
                if (v108 && v108[2]())
                {
                  if (v54)
                    objc_msgSend_skipDescendants(v112, v55, v56, v57);
                  if (ck_log_initialization_predicate != -1)
                    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
                  v58 = (void *)ck_log_facility_ck;
                  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
                  {
                    log = v58;
                    objc_msgSend_path(v28, v59, v60, v61);
                    v64 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v54)
                      v65 = CFSTR("d");
                    else
                      v65 = CFSTR("f");
LABEL_55:
                    objc_msgSend_stringFromDate_(v103, v62, (uint64_t)v38, v63);
                    v92 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138544386;
                    v130 = v64;
                    v131 = 2114;
                    v132 = (os_log_t)v65;
                    v133 = 2048;
                    v134 = v109;
                    v135 = 2114;
                    v136 = v92;
                    v137 = 2048;
                    v138 = (uint64_t)v50;
                    _os_log_debug_impl(&dword_18A5C5000, log, OS_LOG_TYPE_DEBUG, "Skipped %{public}@, %{public}@/%lu, creationDate:\"%{public}@\" (%llds)", buf, 0x34u);

                  }
                }
                else if (v107 && (v107[2]() & 1) != 0)
                {
                  if (v54)
                    objc_msgSend_skipDescendants(v112, v74, v75, v76);
                  v114 = v32;
                  v77 = objc_msgSend_removeItemAtURL_error_(v104, v74, (uint64_t)v28, (uint64_t)&v114);
                  loga = v114;

                  if ((v77 & 1) != 0)
                  {
                    if (ck_log_initialization_predicate != -1)
                      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
                    v78 = (void *)ck_log_facility_ck;
                    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
                    {
                      v79 = v78;
                      objc_msgSend_path(v28, v80, v81, v82);
                      v85 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v54)
                        v86 = CFSTR("d");
                      else
                        v86 = CFSTR("f");
                      objc_msgSend_stringFromDate_(v103, v83, (uint64_t)v38, v84);
                      v87 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138544386;
                      v130 = v85;
                      v131 = 2114;
                      v132 = (os_log_t)v86;
                      v133 = 2048;
                      v134 = v109;
                      v135 = 2114;
                      v136 = v87;
                      v137 = 2048;
                      v138 = (uint64_t)v50;
                      _os_log_impl(&dword_18A5C5000, v79, OS_LOG_TYPE_INFO, "Removed %{public}@, %{public}@/%lu, creationDate:\"%{public}@\" (%llds)", buf, 0x34u);

                    }
                    v32 = loga;
                  }
                  else
                  {
                    if (ck_log_initialization_predicate != -1)
                      dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
                    v32 = loga;
                    v93 = (void *)ck_log_facility_ck;
                    if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_INFO))
                    {
                      v67 = v93;
                      objc_msgSend_CKSanitizedPath(v28, v94, v95, v96);
                      v71 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138543618;
                      v130 = v71;
                      v131 = 2112;
                      v132 = loga;
                      v72 = v67;
                      v73 = "Warn: Failed to remove %{public}@: %@";
                      goto LABEL_33;
                    }
                  }
                }
                else
                {
                  if (ck_log_initialization_predicate != -1)
                    dispatch_once(&ck_log_initialization_predicate, ck_log_initialization_block);
                  v88 = (void *)ck_log_facility_ck;
                  if (os_log_type_enabled((os_log_t)ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
                  {
                    log = v88;
                    objc_msgSend_path(v28, v89, v90, v91);
                    v64 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v54)
                      v65 = CFSTR("d");
                    else
                      v65 = CFSTR("f");
                    goto LABEL_55;
                  }
                }
              }
LABEL_34:

              ++v27;
            }
            while (v25 != v27);
            v97 = objc_msgSend_countByEnumeratingWithState_objects_count_(v112, v24, (uint64_t)&v121, (uint64_t)v139, 16);
            v25 = v97;
          }
          while (v97);
        }

        v20 = v102 + 1;
      }
      while (v102 + 1 != v101);
      v101 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v19, (uint64_t)&v125, (uint64_t)v140, 16);
    }
    while (v101);
  }

}

- (id)shouldSkipFileBlock
{
  return self->_shouldSkipFileBlock;
}

- (void)setShouldSkipFileBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)shouldRemoveFileBlock
{
  return self->_shouldRemoveFileBlock;
}

- (void)setShouldRemoveFileBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)urls
{
  return self->_urls;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urls, 0);
  objc_storeStrong(&self->_shouldRemoveFileBlock, 0);
  objc_storeStrong(&self->_shouldSkipFileBlock, 0);
}

@end
