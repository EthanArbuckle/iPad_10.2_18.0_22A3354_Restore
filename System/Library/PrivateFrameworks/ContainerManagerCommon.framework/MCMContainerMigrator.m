@implementation MCMContainerMigrator

- (MCMContainerMigrator)initWithUserIdentityCache:(id)a3
{
  id v5;
  MCMContainerMigrator *v6;
  MCMContainerMigrator *v7;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MCMContainerMigrator;
  v6 = -[MCMContainerMigrator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_userIdentityCache, a3);

  return v7;
}

- (BOOL)_performEntitlementBypassListMigrationWithError:(id *)a3
{
  void *v4;
  void *v5;
  id v6;
  int v7;
  __int128 v8;
  char *v9;
  uint64_t v10;
  uint64_t *v11;
  unint64_t v12;
  __objc2_class_ro **p_info;
  char v14;
  char v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  char *v25;
  void *v26;
  int v27;
  void *v28;
  char *v29;
  char *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  char v40;
  void *v41;
  int v42;
  NSObject *v43;
  char v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  char v50;
  uint64_t v51;
  void *v52;
  NSObject *v53;
  NSObject *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  char *v58;
  void *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  char *v67;
  char v68;
  NSObject *v69;
  char v70;
  id *v71;
  NSObject *v73;
  __int128 v74;
  id v75;
  void *v76;
  id *v77;
  char v78;
  void *v79;
  NSObject *v80;
  char v81;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  char *v86;
  id obj;
  void *v88;
  void *v89;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  _QWORD v93[4];
  char *v94;
  id v95;
  id v96;
  id v97;
  char *v98;
  char *v99;
  uint8_t buf[4];
  const char *v101;
  __int16 v102;
  char *v103;
  __int16 v104;
  id v105;
  __int16 v106;
  void *v107;
  __int16 v108;
  void *v109;
  __int16 v110;
  uint64_t v111;
  _BYTE v112[128];
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  uint64_t v117;

  v117 = *MEMORY[0x1E0C80C00];
  -[MCMContainerMigrator userIdentityCache](self, "userIdentityCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultUserIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = containermanager_copy_global_configuration();
  v7 = objc_msgSend(v6, "systemContainerMode");

  if (!v7)
  {
    v66 = 0;
    v67 = 0;
    v68 = 1;
    goto LABEL_61;
  }
  v77 = a3;
  v9 = 0;
  v10 = 0;
  v81 = 1;
  v11 = &gCodeSigningMapping;
  v12 = 0x1E0C99000uLL;
  p_info = MCMCommandDeleteContainerContent.info;
  *(_QWORD *)&v8 = 136315394;
  v74 = v8;
  v14 = 1;
  do
  {
    v15 = v14;
    v16 = _performEntitlementBypassListMigrationWithError__possibleContainerClasses[v10];
    v17 = (void *)v11[75];
    objc_msgSend(*(id *)(v12 + 3680), "setWithObject:", v5, v74);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = v9;
    v92 = v16;
    objc_msgSend(v17, "entriesForUserIdentities:contentClass:transient:error:", v18, v16, 0, &v99);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v99;

    if (v20)
    {
      container_log_handle_for_category();
      v73 = objc_claimAutoreleasedReturnValue();
      v71 = v77;
      if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v101 = v20;
        _os_log_error_impl(&dword_1CF807000, v73, OS_LOG_TYPE_ERROR, "Failed to get list of system containers for migration: %@", buf, 0xCu);
      }

      v68 = 0;
LABEL_56:
      v93[0] = MEMORY[0x1E0C809B0];
      v93[1] = 3221225472;
      v93[2] = __72__MCMContainerMigrator__performEntitlementBypassListMigrationWithError___block_invoke;
      v93[3] = &unk_1E8CB67B8;
      v67 = v20;
      v94 = v67;
      __72__MCMContainerMigrator__performEntitlementBypassListMigrationWithError___block_invoke((uint64_t)v93);
      v66 = (id)objc_claimAutoreleasedReturnValue();

      if (v71)
        goto LABEL_59;
      goto LABEL_61;
    }
    v78 = v15;
    v115 = 0u;
    v116 = 0u;
    v113 = 0u;
    v114 = 0u;
    obj = v19;
    v91 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v113, v112, 16);
    v9 = 0;
    if (!v91)
      goto LABEL_46;
    v21 = *(_QWORD *)v114;
    v83 = *(_QWORD *)v114;
    v85 = v5;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v114 != v21)
          objc_enumerationMutation(obj);
        v23 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * v22);
        objc_msgSend(v23, "metadataMinimal");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "identifier");
        v25 = (char *)objc_claimAutoreleasedReturnValue();
        if (v25)
        {
          objc_msgSend(p_info + 281, "sharedBypassList");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "containerIdIsWellknown:class:", v25, v92);

          if (v27)
          {
            v98 = v9;
            objc_msgSend(v23, "metadataWithError:", &v98);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = v98;

            if (!v28)
            {
              container_log_handle_for_category();
              v69 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v101 = (const char *)v23;
                v102 = 2112;
                v103 = v29;
                _os_log_error_impl(&dword_1CF807000, v69, OS_LOG_TYPE_ERROR, "Couldn't load metadata; container = %@, error = %@",
                  buf,
                  0x16u);
              }
              v9 = v29;

              v70 = 0;
              goto LABEL_53;
            }
            v88 = v24;
            v30 = v29;
            objc_msgSend(p_info + 281, "sharedBypassList");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "wellknownContainerForId:class:", v25, v92);
            v32 = objc_claimAutoreleasedReturnValue();

            v89 = (void *)v32;
            +[MCMContainerPath containerPathForUserIdentity:containerClass:containerPathIdentifier:](MCMContainerPath, "containerPathForUserIdentity:containerClass:containerPathIdentifier:", v5, v92, v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "containerRootURL");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "containerPath");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "containerRootURL");
            v36 = objc_claimAutoreleasedReturnValue();
            v90 = v34;
            if (v36)
            {
              v37 = (void *)v36;
              v84 = v33;
              v86 = v29;
              objc_msgSend(v28, "containerPath");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "containerRootURL");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = objc_msgSend(v39, "isEqual:", v34);

              if ((v40 & 1) != 0)
              {
                v41 = 0;
                p_info = (__objc2_class_ro **)(MCMCommandDeleteContainerContent + 32);
                v29 = v30;
                v33 = v84;
                goto LABEL_16;
              }
              container_log_handle_for_category();
              v43 = objc_claimAutoreleasedReturnValue();
              v29 = v30;
              v24 = v88;
              if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v28, "containerPath");
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v56, "containerRootURL");
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v57, "path");
                v58 = (char *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "path");
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412802;
                v101 = v25;
                v102 = 2112;
                v103 = v58;
                v104 = 2112;
                v105 = v59;
                _os_log_error_impl(&dword_1CF807000, v43, OS_LOG_TYPE_ERROR, "Migrating well-known container %@ from %@ to %@", buf, 0x20u);

                v29 = v86;
              }

              v97 = 0;
              v44 = objc_msgSend((id)gContainerCache, "removeContainerForUserIdentity:contentClass:identifier:transient:error:", v85, v92, v25, 0, &v97);
              v45 = v97;
              v46 = v45;
              if ((v44 & 1) != 0)
              {
                v79 = v45;
                +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "containerPath");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v48, "containerRootURL");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                v96 = 0;
                v50 = objc_msgSend(v47, "moveItemAtURL:toURL:error:", v49, v34, &v96);
                v80 = v96;

                p_info = (__objc2_class_ro **)(MCMCommandDeleteContainerContent + 32);
                if ((v50 & 1) != 0)
                {
                  v33 = v84;
                  objc_msgSend(v28, "metadataByChangingContainerPath:", v84);
                  v51 = objc_claimAutoreleasedReturnValue();
                  v29 = v86;
                  if (v51)
                  {
                    v41 = (void *)v51;
                    v95 = 0;
                    objc_msgSend((id)gContainerCache, "addContainerMetadata:error:", v51, &v95);
                    v52 = (void *)objc_claimAutoreleasedReturnValue();
                    v75 = v95;
                    if (v52)
                    {
                      v42 = 0;
                    }
                    else
                    {
                      container_log_handle_for_category();
                      v60 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 136315650;
                        v101 = "-[MCMContainerMigrator _performEntitlementBypassListMigrationWithError:]";
                        v102 = 2112;
                        v103 = v25;
                        v104 = 2112;
                        v105 = v75;
                        _os_log_error_impl(&dword_1CF807000, v60, OS_LOG_TYPE_ERROR, "%s: Failed to update cache for listed container %@: %@", buf, 0x20u);
                      }

                      v81 = 0;
                      v42 = 2;
                    }

                    if (!v52)
                    {
LABEL_36:

                      v9 = v29;
                      if (!v42)
                      {
                        v21 = v83;
                        v5 = v85;
                        goto LABEL_38;
                      }
                      v70 = v81;
                      v5 = v85;
LABEL_53:

                      v81 = v70;
                      goto LABEL_54;
                    }
LABEL_17:
                    v42 = 0;
                    goto LABEL_36;
                  }
                  container_log_handle_for_category();
                  v55 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = v74;
                    v101 = "-[MCMContainerMigrator _performEntitlementBypassListMigrationWithError:]";
                    v102 = 2112;
                    v103 = v25;
                    _os_log_error_impl(&dword_1CF807000, v55, OS_LOG_TYPE_ERROR, "%s: Failed to generate new metadata for listed container %@", buf, 0x16u);
                  }

                }
                else
                {
                  container_log_handle_for_category();
                  v54 = objc_claimAutoreleasedReturnValue();
                  v29 = v86;
                  v33 = v84;
                  if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
                  {
                    objc_msgSend(v28, "containerPath");
                    v82 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v82, "containerRootURL");
                    v76 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v76, "path");
                    v61 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v34, "path");
                    v62 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSObject domain](v80, "domain");
                    v63 = (void *)objc_claimAutoreleasedReturnValue();
                    v64 = -[NSObject code](v80, "code");
                    *(_DWORD *)buf = 136316418;
                    v101 = "-[MCMContainerMigrator _performEntitlementBypassListMigrationWithError:]";
                    v102 = 2112;
                    v103 = v25;
                    v104 = 2112;
                    v105 = v61;
                    v106 = 2112;
                    v107 = v62;
                    v108 = 2112;
                    v109 = v63;
                    v110 = 2048;
                    v111 = v64;
                    _os_log_error_impl(&dword_1CF807000, v54, OS_LOG_TYPE_ERROR, "%s: Failed to move system container %@ from %@ to listed location %@: (error= %@: %lld)", buf, 0x3Eu);

                    v29 = v86;
                    v33 = v84;

                  }
                }
                v46 = v79;
                v53 = v80;
              }
              else
              {
                container_log_handle_for_category();
                v53 = objc_claimAutoreleasedReturnValue();
                p_info = (__objc2_class_ro **)(MCMCommandDeleteContainerContent + 32);
                if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315650;
                  v101 = "-[MCMContainerMigrator _performEntitlementBypassListMigrationWithError:]";
                  v102 = 2112;
                  v103 = v25;
                  v104 = 2112;
                  v105 = v46;
                  _os_log_error_impl(&dword_1CF807000, v53, OS_LOG_TYPE_ERROR, "%s: Failed to remove cache for listed container %@: %@", buf, 0x20u);
                }
                v33 = v84;
              }

              v41 = 0;
              v81 = 0;
              v42 = 2;
              goto LABEL_36;
            }

            v41 = 0;
LABEL_16:
            v24 = v88;
            goto LABEL_17;
          }
        }
LABEL_38:

        ++v22;
      }
      while (v91 != v22);
      v65 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v113, v112, 16);
      v91 = v65;
    }
    while (v65);
LABEL_46:

    v14 = 0;
    v10 = 1;
    v11 = &gCodeSigningMapping;
    v12 = 0x1E0C99000;
  }
  while ((v78 & 1) != 0);
LABEL_54:
  if (v9)
  {
    v20 = v9;
    v71 = v77;
    v68 = v81;
    goto LABEL_56;
  }
  v67 = 0;
  v66 = 0;
  v71 = v77;
  v68 = v81;
  if (v77)
  {
LABEL_59:
    if ((v68 & 1) == 0)
    {
      v66 = objc_retainAutorelease(v66);
      v68 = 0;
      *v71 = v66;
    }
  }
LABEL_61:

  return v68 & 1;
}

- (void)_checkIfDeviceMayNeedSystemContainerACLMigration:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  NSObject *v23;
  uint8_t v24[8];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = containermanager_copy_global_configuration();
  objc_msgSend(v4, "staticConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configForContainerClass:", 12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = containermanager_copy_global_configuration();
  objc_msgSend(v7, "staticConfig");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "configForContainerClass:", 13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = containermanager_copy_global_configuration();
  LODWORD(v8) = objc_msgSend(v10, "systemContainerMode");

  if ((_DWORD)v8 == 1 && (objc_msgSend(v3, "hasMigrationOccurredForType:", CFSTR("ACLMigration")) & 1) == 0)
  {
    +[MCMUserIdentityCache defaultUserIdentity](MCMUserIdentitySharedCache, "defaultUserIdentity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = containermanager_copy_global_configuration();
    objc_msgSend(v12, "classPathCache");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "containerClassPathForUserIdentity:containerConfig:typeClass:", v11, v6, objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "classURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = containermanager_copy_global_configuration();
    objc_msgSend(v16, "classPathCache");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "containerClassPathForUserIdentity:containerConfig:typeClass:", v11, v9, objc_opt_class());
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "classURL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v20, "itemDoesNotExistAtURL:", v15) & 1) != 0)
    {
      +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "itemDoesNotExistAtURL:", v19);

      if (v22)
      {
        container_log_handle_for_category();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v24 = 0;
          _os_log_impl(&dword_1CF807000, v23, OS_LOG_TYPE_DEFAULT, "No system containers requiring ACL migration", v24, 2u);
        }

        objc_msgSend(v3, "setMigrationCompleteForType:", CFSTR("ACLMigration"));
      }
    }
    else
    {

    }
  }

}

- (BOOL)_migrateBundleContainersWithError:(id *)a3
{
  BOOL v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  NSObject *v20;
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = 1;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", CFSTR("/private/var/mobile/Containers/Bundle"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCMUserIdentityCache defaultUserIdentity](MCMUserIdentitySharedCache, "defaultUserIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = containermanager_copy_global_configuration();
  objc_msgSend(v7, "staticConfig");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "configForContainerClass:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = containermanager_copy_global_configuration();
  objc_msgSend(v10, "classPathCache");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "containerClassPathForUserIdentity:containerConfig:typeClass:", v6, v9, objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v19 = 0;
    goto LABEL_13;
  }
  +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "itemExistsAtURL:", v5);

  if (!v14)
  {
    v19 = 0;
LABEL_12:
    v4 = 1;
    goto LABEL_13;
  }
  container_log_handle_for_category();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CF807000, v15, OS_LOG_TYPE_DEFAULT, "Moving bundle containers from user to system location", buf, 2u);
  }

  +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "classURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v18 = objc_msgSend(v16, "moveItemAtURL:toURL:error:", v5, v17, &v22);
  v19 = v22;

  if ((v18 & 1) != 0)
    goto LABEL_12;
  container_log_handle_for_category();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v19;
    _os_log_error_impl(&dword_1CF807000, v20, OS_LOG_TYPE_ERROR, "Failed to migrate to new bundle containers location : %@.  This is terrible.", buf, 0xCu);
  }

  if (a3)
  {
    v19 = objc_retainAutorelease(v19);
    v4 = 0;
    *a3 = v19;
  }
  else
  {
    v4 = 0;
  }
LABEL_13:

  return v4;
}

- (BOOL)performSynchronousBuildUpgradeMigration:(id)a3 context:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  int v11;
  _BOOL4 v12;
  id v13;
  NSObject *v14;
  host_t v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  id v32;
  BOOL v33;
  int v34;
  BOOL v35;
  id v36;
  NSObject *v37;
  id v38;
  int v39;
  BOOL v40;
  id v41;
  NSObject *v42;
  id v43;
  int v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t i;
  void *v54;
  void *v55;
  char v56;
  void *v57;
  MCMResultPromise *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  NSObject *v63;
  char v64;
  void *v66;
  id v67;
  void *v68;
  id v69;
  id v70;
  id *v71;
  void *v72;
  void *v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  uint32_t multiuser_flags;
  id v81;
  __int16 v82;
  void *v83;
  _BYTE v84[128];
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = containermanager_copy_global_configuration();
  v11 = objc_msgSend(v10, "runmode");

  if (v11 && (objc_msgSend(v8, "hasMigrationOccurredForType:", CFSTR("DeleteManifestLocationChange")) & 1) == 0)
  {
    v79 = 0;
    v12 = -[MCMContainerMigrator _migrateDeleteOperationManifestsWithError:](self, "_migrateDeleteOperationManifestsWithError:", &v79);
    v13 = v79;
    if (v12)
    {
      objc_msgSend(v8, "setMigrationCompleteForType:", CFSTR("DeleteManifestLocationChange"));
    }
    else
    {
      container_log_handle_for_category();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        multiuser_flags = 138412290;
        v81 = v13;
        _os_log_error_impl(&dword_1CF807000, v14, OS_LOG_TYPE_ERROR, "Failed to migrate delete manifest files; error = %@",
          (uint8_t *)&multiuser_flags,
          0xCu);
      }

    }
  }
  multiuser_flags = 0;
  v15 = MEMORY[0x1D17D6F20]();
  if (host_get_multiuser_config_flags(v15, &multiuser_flags) || (multiuser_flags & 0x80000000) == 0)
  {
    v17 = v9;
    -[MCMContainerMigrator userIdentityCache](self, "userIdentityCache");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "defaultUserIdentity");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "homeDirectoryURL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "URLByAppendingPathComponent:isDirectory:", CFSTR("Library/Logs/MobileContainerManager"), 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = 0;
    v23 = objc_msgSend(v22, "removeItemAtURL:error:", v21, &v78);
    v16 = v78;

    if ((v23 & 1) == 0)
    {
      container_log_handle_for_category();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        multiuser_flags = 138412290;
        v81 = v16;
        _os_log_error_impl(&dword_1CF807000, v24, OS_LOG_TYPE_ERROR, "Failed to remove really old log directory: %@", (uint8_t *)&multiuser_flags, 0xCu);
      }

    }
    v9 = v17;
  }
  else
  {
    v16 = 0;
  }
  +[MCMPOSIXUser currentPOSIXUser](MCMPOSIXUser, "currentPOSIXUser");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "homeDirectoryURL");
  v26 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v26, "URLByAppendingPathComponent:isDirectory:", CFSTR("Library/Logs/MobileContainerManager"), 1);
  v27 = objc_claimAutoreleasedReturnValue();

  v28 = (void *)v27;
  +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = v16;
  LOBYTE(v26) = objc_msgSend(v29, "removeItemAtURL:error:", v27, &v77);
  v30 = v77;

  if ((v26 & 1) == 0)
  {
    container_log_handle_for_category();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      multiuser_flags = 138412290;
      v81 = v30;
      _os_log_error_impl(&dword_1CF807000, v31, OS_LOG_TYPE_ERROR, "Failed to remove old log directory: %@", (uint8_t *)&multiuser_flags, 0xCu);
    }

  }
  v32 = containermanager_copy_global_configuration();
  v33 = 1;
  v34 = objc_msgSend(v32, "dispositionForContainerClass:", 1);

  if (v34 == 1)
  {
    v76 = v30;
    v35 = -[MCMContainerMigrator _migrateBundleContainersWithError:](self, "_migrateBundleContainersWithError:", &v76);
    v36 = v76;

    if (v35)
    {
      v33 = 1;
    }
    else
    {
      container_log_handle_for_category();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        multiuser_flags = 138412290;
        v81 = v36;
        _os_log_error_impl(&dword_1CF807000, v37, OS_LOG_TYPE_ERROR, "Failed to migrate bundle containers : %@", (uint8_t *)&multiuser_flags, 0xCu);
      }

      v33 = 0;
    }
  }
  else
  {
    v36 = v30;
  }
  v38 = containermanager_copy_global_configuration();
  v39 = objc_msgSend(v38, "dispositionForContainerClass:", 12);

  if (v39 == 1)
  {
    -[MCMContainerMigrator _checkIfDeviceMayNeedSystemContainerACLMigration:](self, "_checkIfDeviceMayNeedSystemContainerACLMigration:", v8);
    v75 = v36;
    v40 = -[MCMContainerMigrator _performEntitlementBypassListMigrationWithError:](self, "_performEntitlementBypassListMigrationWithError:", &v75);
    v41 = v75;

    if (!v40)
    {
      container_log_handle_for_category();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        multiuser_flags = 138412290;
        v81 = v41;
        _os_log_error_impl(&dword_1CF807000, v42, OS_LOG_TYPE_ERROR, "Failed to migrate listed bundle containers : %@", (uint8_t *)&multiuser_flags, 0xCu);
      }

      v33 = 0;
    }
  }
  else
  {
    v41 = v36;
  }
  v43 = containermanager_copy_global_configuration();
  v44 = objc_msgSend(v43, "dispositionForContainerClass:", 10);

  if (v44 == 1 && (objc_msgSend(v8, "hasMigrationOccurredForType:", CFSTR("DaemonContainerCleaning")) & 1) == 0)
  {
    v69 = v41;
    v70 = v9;
    v72 = v8;
    v73 = v28;
    v71 = a5;
    +[MCMUserIdentitySharedCache sharedInstance](MCMUserIdentitySharedCache, "sharedInstance");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "allAccessibleUserIdentities");
    v46 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = 0;
    v68 = (void *)v46;
    objc_msgSend((id)gContainerCache, "entriesForUserIdentities:contentClass:transient:error:", v46, 10, 0, &v74);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = v74;
    v85 = 0u;
    v86 = 0u;
    v87 = 0u;
    v88 = 0u;
    v49 = v48;
    v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v85, v84, 16);
    if (v50)
    {
      v51 = v50;
      v52 = *(_QWORD *)v86;
      do
      {
        for (i = 0; i != v51; ++i)
        {
          if (*(_QWORD *)v86 != v52)
            objc_enumerationMutation(v49);
          v54 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * i);
          objc_msgSend(v54, "identifier");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = objc_msgSend(v55, "hasPrefix:", CFSTR("com.apple."));

          if ((v56 & 1) == 0)
          {
            objc_msgSend(v54, "containerIdentity");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "addObject:", v57);

          }
        }
        v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v85, v84, 16);
      }
      while (v51);
    }

    v9 = v70;
    if (objc_msgSend(v47, "count"))
    {
      v58 = objc_alloc_init(MCMResultPromise);
      objc_msgSend(v47, "allObjects");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      +[MCMCommandOperationDelete commandForOperationDeleteWithContainerIdentities:removeAllCodeSignInfo:context:resultPromise:](MCMCommandOperationDelete, "commandForOperationDeleteWithContainerIdentities:removeAllCodeSignInfo:context:resultPromise:", v59, 0, v70, v58);
      v60 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v60, "execute");
      -[MCMResultPromise result](v58, "result");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "error");
      v62 = (void *)objc_claimAutoreleasedReturnValue();

      if (v62)
      {
        container_log_handle_for_category();
        v63 = objc_claimAutoreleasedReturnValue();
        v28 = v73;
        v41 = v69;
        if (os_log_type_enabled(v63, OS_LOG_TYPE_FAULT))
        {
          objc_msgSend(v61, "error");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          multiuser_flags = 138412546;
          v81 = v66;
          v82 = 2112;
          v83 = v47;
          _os_log_fault_impl(&dword_1CF807000, v63, OS_LOG_TYPE_FAULT, "Failed to clear daemon containers; error = %@, containers = %@",
            (uint8_t *)&multiuser_flags,
            0x16u);

          v28 = v73;
        }

        v8 = v72;
        goto LABEL_52;
      }

    }
    v8 = v72;
    objc_msgSend(v72, "setMigrationCompleteForType:", CFSTR("DaemonContainerCleaning"));
    v28 = v73;
    v41 = v69;
LABEL_52:

    a5 = v71;
  }
  if (a5)
    v64 = v33;
  else
    v64 = 1;
  if ((v64 & 1) == 0)
    *a5 = objc_retainAutorelease(v41);

  return v33;
}

- (BOOL)_migrateDeleteOperationManifestsWithError:(id *)a3
{
  id v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  MCMError *v21;
  uint64_t v22;
  uint64_t v23;
  MCMError *v24;
  uint64_t v25;
  _BOOL4 v26;
  void *v27;
  uint64_t v28;
  BOOL v29;
  NSObject *v30;
  void *v32;
  id *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  MCMError *v37;
  id v38;
  _BYTE v39[128];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  NSObject *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v5 = containermanager_copy_global_configuration();
  v6 = objc_msgSend(v5, "runmode");

  if (!v6)
  {
    v21 = 0;
LABEL_23:
    v29 = 1;
    goto LABEL_31;
  }
  v7 = containermanager_copy_global_configuration();
  objc_msgSend(v7, "managedPathRegistry");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "containermanagerDeleteOperations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "url");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    +[MCMFileManager defaultManager](MCMFileManager, "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0;
    objc_msgSend(v11, "urlsForItemsInDirectoryAtURL:error:", v10, &v38);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v38;

    if (v12)
    {
      v35 = v13;
      v36 = v9;
      -[MCMContainerMigrator userIdentityCache](self, "userIdentityCache");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCMContainerMigrator userIdentityCache](self, "userIdentityCache");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "defaultUserIdentity");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "libraryRepairForUserIdentity:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v34 = v12;
      v18 = v12;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v40, v39, 16);
      if (v19)
      {
        v20 = v19;
        v33 = a3;
        v21 = 0;
        v22 = *(_QWORD *)v41;
        while (2)
        {
          v23 = 0;
          v24 = v21;
          do
          {
            if (*(_QWORD *)v41 != v22)
              objc_enumerationMutation(v18);
            v25 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v23);
            v37 = v24;
            v26 = -[MCMContainerMigrator _migrateManifestIfNecessaryAtURL:withLibraryRepairForUser:error:](self, "_migrateManifestIfNecessaryAtURL:withLibraryRepairForUser:error:", v25, v17, &v37, v33);
            v21 = v37;

            if (!v26)
            {

              a3 = v33;
              v13 = v35;
              v9 = v36;
              goto LABEL_28;
            }
            ++v23;
            v24 = v21;
          }
          while (v20 != v23);
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v40, v39, 16);
          if (v20)
            continue;
          break;
        }
      }
      else
      {
        v21 = 0;
      }

      v13 = v35;
      v9 = v36;
      v12 = v34;
      goto LABEL_22;
    }
    -[NSObject domain](v13, "domain");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v27, "isEqualToString:", *MEMORY[0x1E0CB2FE0]))
    {
      v28 = -[NSObject code](v13, "code");

      if (v28 == 2)
      {
        v21 = 0;
LABEL_22:

        goto LABEL_23;
      }
    }
    else
    {

    }
    container_log_handle_for_category();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v10, "path");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v45 = v13;
      v46 = 2112;
      v47 = v32;
      _os_log_error_impl(&dword_1CF807000, v30, OS_LOG_TYPE_ERROR, "Failed to get items at delete operations URL; error = %@, path = [%@]",
        buf,
        0x16u);

    }
    v21 = -[MCMError initWithNSError:url:defaultErrorType:]([MCMError alloc], "initWithNSError:url:defaultErrorType:", v13, v10, 146);
  }
  else
  {
    v21 = -[MCMError initWithErrorType:category:]([MCMError alloc], "initWithErrorType:category:", 84, 1);
    container_log_handle_for_category();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CF807000, v13, OS_LOG_TYPE_ERROR, "Failed to get url for storing pending delete operations.", buf, 2u);
    }
  }
LABEL_28:

  if (a3)
  {
    v21 = objc_retainAutorelease(v21);
    v29 = 0;
    *a3 = v21;
  }
  else
  {
    v29 = 0;
  }
LABEL_31:

  return v29;
}

- (BOOL)_migrateManifestIfNecessaryAtURL:(id)a3 withLibraryRepairForUser:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  MCMDeleteManifest *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  char v22;
  BOOL v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v31;
  id v32;
  id *v33;
  id v34;
  id v35;
  id v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = [MCMDeleteManifest alloc];
  -[MCMContainerMigrator userIdentityCache](self, "userIdentityCache");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  v12 = -[MCMDeleteManifest initFromURL:userIdentityCache:error:](v10, "initFromURL:userIdentityCache:error:", v8, v11, &v36);
  v13 = v36;

  if (!v12)
  {
    if (objc_msgSend(v13, "category") == 1 && objc_msgSend(v13, "POSIXerrno") == 2)
    {
      v14 = 0;
      if (a5)
      {
LABEL_26:
        v13 = objc_retainAutorelease(v13);
        v23 = 0;
        *a5 = v13;
        goto LABEL_27;
      }
LABEL_8:
      v23 = 0;
      goto LABEL_27;
    }
    container_log_handle_for_category();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v38 = v13;
      v39 = 2112;
      v40 = v8;
      _os_log_error_impl(&dword_1CF807000, v24, OS_LOG_TYPE_ERROR, "Failed to materialize identity from manifest; error = %@, url = [%@]",
        buf,
        0x16u);
    }
    v14 = 0;
LABEL_25:

    if (a5)
      goto LABEL_26;
    goto LABEL_8;
  }
  v33 = a5;
  objc_msgSend(v12, "concreteContainerIdentity");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = containermanager_copy_global_configuration();
  v16 = objc_msgSend(v14, "containerClass");
  objc_msgSend(v14, "userIdentity");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "posixUser");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "dispositionForContainerClass:forUser:", v16, v18) != 1)
  {

LABEL_10:
    v23 = 1;
    goto LABEL_27;
  }
  v32 = v8;
  v19 = v9;
  objc_msgSend(v12, "readURL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "writeURL");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v20, "isEqual:", v21);

  if ((v22 & 1) == 0)
  {
    container_log_handle_for_category();
    v25 = objc_claimAutoreleasedReturnValue();
    v9 = v19;
    v8 = v32;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v12, "writeURL");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v38 = v32;
      v39 = 2112;
      v40 = v26;
      _os_log_impl(&dword_1CF807000, v25, OS_LOG_TYPE_DEFAULT, "Migrating delete manifest [%@] --> [%@]", buf, 0x16u);

    }
    v35 = v13;
    objc_msgSend(v12, "deleteManifestAfterWritingUsingLibraryRepairForUser:error:", v9, &v35);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v35;

    if (v27)
    {
      v34 = v28;
      objc_msgSend(v12, "deleteManifestAfterRemovingUsingLibraryRepairForUser:error:", v9, &v34);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v34;

      if (v29)
      {

        goto LABEL_10;
      }
      container_log_handle_for_category();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v38 = v32;
        v39 = 2112;
        v40 = v13;
        _os_log_error_impl(&dword_1CF807000, v24, OS_LOG_TYPE_ERROR, "Failed to remove delete manifest at old location [%@], error = %@", buf, 0x16u);
      }
    }
    else
    {
      container_log_handle_for_category();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v12, "writeURL");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v38 = v31;
        v39 = 2112;
        v40 = v28;
        _os_log_error_impl(&dword_1CF807000, v24, OS_LOG_TYPE_ERROR, "Failed to write delete manifest at new location [%@], error = %@", buf, 0x16u);

      }
      v13 = v28;
    }
    a5 = v33;
    goto LABEL_25;
  }
  v23 = 1;
  v9 = v19;
  v8 = v32;
LABEL_27:

  return v23;
}

- (MCMUserIdentityCache)userIdentityCache
{
  return self->_userIdentityCache;
}

- (void)setUserIdentityCache:(id)a3
{
  objc_storeStrong((id *)&self->_userIdentityCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdentityCache, 0);
}

id __72__MCMContainerMigrator__performEntitlementBypassListMigrationWithError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Error during entitlement bypass list migration: %@"), *(_QWORD *)(a1 + 32));
  v8[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMContainerMigrator _performEntitlementBypassListMigrationWithError:]_block_invoke");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v9[1] = &unk_1E8CD6270;
  v4 = *MEMORY[0x1E0CB2D50];
  v8[1] = CFSTR("SourceFileLine");
  v8[2] = v4;
  v9[2] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), objc_msgSend(*(id *)(a1 + 32), "type"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)sharedInstance
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __38__MCMContainerMigrator_sharedInstance__block_invoke;
  v3[3] = &__block_descriptor_40_e5_v8__0l;
  v3[4] = a1;
  if (sharedInstance_onceToken_10797 != -1)
    dispatch_once(&sharedInstance_onceToken_10797, v3);
  return (id)sharedInstance_instance_10798;
}

void __38__MCMContainerMigrator_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = objc_alloc(*(Class *)(a1 + 32));
  +[MCMUserIdentitySharedCache sharedInstance](MCMUserIdentitySharedCache, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "initWithUserIdentityCache:");
  v3 = (void *)sharedInstance_instance_10798;
  sharedInstance_instance_10798 = v2;

}

@end
