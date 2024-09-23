@implementation NSFileManager(BRAdditions)

- (uint64_t)br_movePromisedItemAtURL:()BRAdditions toURL:error:
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  char v21;
  NSObject *v22;
  __int16 v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  const char *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  const char *v40;
  void *v41;
  void *v42;
  int v43;
  const std::__fs::filesystem::path *v44;
  id v45;
  const std::__fs::filesystem::path *v46;
  std::error_code *v47;
  int v48;
  void *v49;
  NSObject *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  NSObject *v61;
  void *v62;
  NSObject *v63;
  void *v64;
  NSObject *v65;
  id v66;
  int v67;
  const char *v68;
  id v69;
  void *v70;
  NSObject *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  NSObject *v95;
  void *v96;
  id v97;
  void *v98;
  NSObject *v99;
  void *v100;
  id v101;
  id v102;
  id v103;
  NSObject *v104;
  id v105;
  id v106;
  _QWORD v107[4];
  id v108;
  id v109;
  id v110;
  id v111;
  _QWORD v112[4];
  id v113;
  id v114;
  _QWORD v115[3];
  uint64_t v116;
  NSObject *v117;
  uint64_t v118;
  NSObject *v119;
  uint8_t buf[4];
  const char *v121;
  __int16 v122;
  uint64_t v123;
  __int16 v124;
  id v125;
  __int16 v126;
  id v127;
  uint64_t v128;

  v128 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!BRIsFPFSEnabled(v9, v10))
  {
    memset(v115, 0, sizeof(v115));
    __brc_create_section(0, (uint64_t)"-[NSFileManager(BRAdditions) br_movePromisedItemAtURL:toURL:error:]", 103, v115);
    brc_bread_crumbs((uint64_t)"-[NSFileManager(BRAdditions) br_movePromisedItemAtURL:toURL:error:]", 103);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v32 = (const char *)v115[0];
      objc_msgSend(v8, "path");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "path");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v121 = v32;
      v122 = 2112;
      v123 = (uint64_t)v33;
      v124 = 2112;
      v125 = v34;
      v126 = 2112;
      v127 = v15;
      _os_log_debug_impl(&dword_19CBF0000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx moving from: %@\n       to:   %@\n%@", buf, 0x2Au);

    }
    objc_msgSend(v9, "lastPathComponent");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URLByDeletingLastPathComponent");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "br_sideFaultName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "URLByAppendingPathComponent:isDirectory:", v18, 0);
    v106 = (id)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v9, "checkResourceIsReachableAndReturnError:", 0) & 1) != 0
      || objc_msgSend(v106, "checkResourceIsReachableAndReturnError:", 0))
    {
      if (a5)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", *MEMORY[0x1E0CB28A8], 516, CFSTR("%@ is reachable."), v9);
        *a5 = (const char *)(id)objc_claimAutoreleasedReturnValue();
      }
      brc_bread_crumbs((uint64_t)"-[NSFileManager(BRAdditions) br_movePromisedItemAtURL:toURL:error:]", 114);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
        -[NSFileManager(BRAdditions) br_movePromisedItemAtURL:toURL:error:].cold.1();
      v14 = 0;
      goto LABEL_35;
    }
    v114 = 0;
    v21 = objc_msgSend(v8, "checkPromisedItemIsReachableAndReturnError:", &v114);
    v22 = v114;
    v20 = v22;
    if ((v21 & 1) == 0)
    {
      if (a5)
      {
        v28 = (void *)MEMORY[0x1E0CB35C8];
        v118 = *MEMORY[0x1E0CB3388];
        v119 = v22;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v119, &v118, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4, v29);
        *a5 = (const char *)(id)objc_claimAutoreleasedReturnValue();

      }
      brc_bread_crumbs((uint64_t)"-[NSFileManager(BRAdditions) br_movePromisedItemAtURL:toURL:error:]", 121);
      v30 = objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v26 = objc_claimAutoreleasedReturnValue();
      v104 = v30;
      if (os_log_type_enabled(v26, (os_log_type_t)0x90u))
        -[NSFileManager(BRAdditions) br_movePromisedItemAtURL:toURL:error:].cold.7();
      v19 = 0;
      goto LABEL_33;
    }
    if (objc_msgSend(v9, "br_isInTrash"))
      objc_msgSend(a1, "br_setPutBackInfoOnItemAtURL:", v8);
    if (_CFURLIsItemPromiseAtURL())
    {
      v19 = v8;
    }
    else
    {
      v35 = _CFURLPromiseCopyPhysicalURL();
      v19 = (id)v35;
      if (!v35 || (id)v35 == v8 || objc_msgSend(v8, "checkResourceIsReachableAndReturnError:", 0))
      {
        if (objc_msgSend(v8, "br_isExternalDocumentReference"))
        {
          objc_msgSend(v8, "br_cloudDocsContainer");
          v104 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "br_cloudDocsContainer");
          v26 = objc_claimAutoreleasedReturnValue();
          if (v26 != v104)
          {
            +[BRDaemonConnection defaultConnection](BRDaemonConnection, "defaultConnection");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = (void *)objc_msgSend(v36, "newLegacySyncProxy");

            v112[0] = MEMORY[0x1E0C809B0];
            v112[1] = 3221225472;
            v112[2] = __67__NSFileManager_BRAdditions__br_movePromisedItemAtURL_toURL_error___block_invoke;
            v112[3] = &unk_1E3DA47F0;
            v38 = v37;
            v113 = v38;
            objc_msgSend(v38, "moveBRSecurityBookmarkAtURL:toURL:reply:", v8, v9, v112);
            if (a5)
            {
              objc_msgSend(v38, "error");
              *a5 = (const char *)(id)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v38, "error");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = v39 == 0;

            goto LABEL_34;
          }

        }
        v14 = objc_msgSend(a1, "moveItemAtURL:toURL:error:", v8, v9, a5);
        goto LABEL_35;
      }
    }
    v23 = objc_msgSend(v8, "br_capabilityToMoveToURL:error:", v9, 0);
    if ((v23 & 0x204) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithPOSIXCode:description:", 13, CFSTR("The move between those locations is invalid"));
      v104 = objc_claimAutoreleasedReturnValue();
      if (a5)
      {
        v24 = (void *)MEMORY[0x1E0CB35C8];
        v116 = *MEMORY[0x1E0CB3388];
        v117 = v104;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v117, &v116, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 512, v25);
        *a5 = (const char *)(id)objc_claimAutoreleasedReturnValue();

      }
      brc_bread_crumbs((uint64_t)"-[NSFileManager(BRAdditions) br_movePromisedItemAtURL:toURL:error:]", 167);
      v26 = objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, (os_log_type_t)0x90u))
        -[NSFileManager(BRAdditions) br_movePromisedItemAtURL:toURL:error:].cold.7();

LABEL_33:
      v14 = 0;
LABEL_34:

LABEL_35:
      __brc_leave_section((uint64_t)v115);

      goto LABEL_36;
    }
    if ((v23 & 0x35FB) == 0)
    {
      brc_bread_crumbs((uint64_t)"-[NSFileManager(BRAdditions) br_movePromisedItemAtURL:toURL:error:]", 170);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v95 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v95, OS_LOG_TYPE_FAULT))
        -[NSFileManager(BRAdditions) br_movePromisedItemAtURL:toURL:error:].cold.6((uint64_t)v94, v95);

    }
    objc_msgSend(v19, "lastPathComponent");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "lastPathComponent");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v41, "isEqualToString:", v42);

    if (v43)
    {
      v105 = objc_retainAutorelease(v19);
      v44 = (const std::__fs::filesystem::path *)objc_msgSend(v105, "fileSystemRepresentation");
      v45 = objc_retainAutorelease(v106);
      v46 = (const std::__fs::filesystem::path *)objc_msgSend(v45, "fileSystemRepresentation");
      rename(v44, v46, v47);
      if (!v48)
      {
        _CFURLPromiseSetPhysicalURL();
        v14 = 1;
        v19 = v105;
        goto LABEL_35;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorFromErrno");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      brc_bread_crumbs((uint64_t)"-[NSFileManager(BRAdditions) br_movePromisedItemAtURL:toURL:error:]", 181);
      v102 = (id)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        v99 = v50;
        v51 = objc_msgSend(objc_retainAutorelease(v105), "fileSystemRepresentation");
        v52 = objc_msgSend(objc_retainAutorelease(v45), "fileSystemRepresentation");
        *(_DWORD *)buf = 136315906;
        v121 = (const char *)v51;
        v122 = 2080;
        v123 = v52;
        v124 = 2112;
        v125 = v49;
        v126 = 2112;
        v50 = v99;
        v127 = v102;
        _os_log_impl(&dword_19CBF0000, v99, OS_LOG_TYPE_DEFAULT, "[WARNING] Attempting rename by copy, since rename(%s, %s) failed with %@.%@", buf, 0x2Au);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "URLForDirectory:inDomain:appropriateForURL:create:error:", 99, 1, v106, 1, a5);
    v104 = objc_claimAutoreleasedReturnValue();

    if (!v104)
    {
      brc_bread_crumbs((uint64_t)"-[NSFileManager(BRAdditions) br_movePromisedItemAtURL:toURL:error:]", 187);
      v26 = objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v61 = objc_claimAutoreleasedReturnValue();
      v103 = v61;
      if (os_log_type_enabled(v61, (os_log_type_t)0x90u))
        -[NSFileManager(BRAdditions) br_movePromisedItemAtURL:toURL:error:].cold.2((uint64_t)v26, v61);
      goto LABEL_74;
    }
    objc_msgSend(v9, "lastPathComponent");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject URLByAppendingPathComponent:](v104, "URLByAppendingPathComponent:", v54);
    v103 = (id)objc_claimAutoreleasedReturnValue();

    v111 = 0;
    v55 = (void *)_CFURLCopyPropertiesOfPromiseAtURL();
    v100 = (void *)objc_msgSend(v55, "mutableCopy");

    if (v100)
    {
      v56 = *MEMORY[0x1E0C99A90];
      objc_msgSend(v100, "objectForKeyedSubscript:", *MEMORY[0x1E0C99A90]);
      v26 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "setObject:forKeyedSubscript:", v11, v56);
      if ((objc_msgSend(a1, "copyItemAtURL:toURL:error:", v19, v103, a5) & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v100, 200, 0, a5);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v107[0] = MEMORY[0x1E0C809B0];
        v107[1] = 3221225472;
        v107[2] = __67__NSFileManager_BRAdditions__br_movePromisedItemAtURL_toURL_error___block_invoke_12;
        v107[3] = &unk_1E3DA4AC0;
        v97 = v57;
        v108 = v97;
        v109 = v103;
        v110 = v11;
        v103 = v109;
        objc_msgSend(v109, "fp_withReadWriteAccess:", v107);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        if (v58)
        {
          brc_bread_crumbs((uint64_t)"-[NSFileManager(BRAdditions) br_movePromisedItemAtURL:toURL:error:]", 243);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log(0);
          v60 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v60, (os_log_type_t)0x90u))
            -[NSFileManager(BRAdditions) br_movePromisedItemAtURL:toURL:error:].cold.4();

          objc_msgSend(a1, "removeItemAtURL:error:", v104, 0);
          goto LABEL_74;
        }

        v103 = objc_retainAutorelease(v103);
        LODWORD(v111) = open((const char *)objc_msgSend(v103, "fileSystemRepresentation"), 260);
        if ((v111 & 0x80000000) == 0)
        {
          objc_msgSend(v106, "URLByDeletingLastPathComponent");
          v66 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v67 = open((const char *)objc_msgSend(v66, "fileSystemRepresentation"), 16);

          v68 = (const char *)objc_msgSend(objc_retainAutorelease(v103), "fileSystemRepresentation");
          v101 = objc_retainAutorelease(v106);
          if (renamex_np(v68, (const char *)objc_msgSend(v101, "fileSystemRepresentation"), 4u) < 0)
          {
            objc_msgSend(v101, "path");
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            _reportPosixWriteError(a5, CFSTR("Unable to make write promise at '%@'"), v81, v82, v83, v84, v85, v86, (uint64_t)v80);

          }
          else
          {
            v69 = objc_retainAutorelease(v19);
            if ((fsctl((const char *)objc_msgSend(v69, "fileSystemRepresentation"), 0x80046820uLL, &v111, 0) & 0x80000000) == 0)
            {
              objc_msgSend(a1, "removeItemAtURL:error:", v69, 0);
              if (!v26)
              {
                brc_bread_crumbs((uint64_t)"-[NSFileManager(BRAdditions) br_movePromisedItemAtURL:toURL:error:]", 275);
                v70 = (void *)objc_claimAutoreleasedReturnValue();
                brc_default_log(0);
                v71 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v71, (os_log_type_t)0x90u))
                {
                  objc_msgSend(v8, "path");
                  v72 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSFileManager(BRAdditions) br_movePromisedItemAtURL:toURL:error:].cold.3(v72, (uint64_t)v70, buf, v71);
                }

              }
              _CFURLPromiseSetPhysicalURL();
              v14 = 1;
              goto LABEL_90;
            }
            objc_msgSend(v69, "path");
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v101, "path");
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            _reportPosixWriteError(a5, CFSTR("Unable to transfer doc-id from '%@' to '%@'"), v88, v89, v90, v91, v92, v93, (uint64_t)v98);

            objc_msgSend(a1, "removeItemAtURL:error:", v101, 0);
          }
          v14 = 0;
LABEL_90:
          objc_msgSend(a1, "removeItemAtURL:error:", v104, 0);
          close(v67);
          close((int)v111);
          goto LABEL_75;
        }
        objc_msgSend(v106, "path");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        _reportPosixWriteError(a5, CFSTR("Unable to open fault at '%@'"), v74, v75, v76, v77, v78, v79, (uint64_t)v73);

        objc_msgSend(a1, "removeItemAtURL:error:", v104, 0);
LABEL_74:
        v14 = 0;
LABEL_75:

        goto LABEL_34;
      }
      brc_bread_crumbs((uint64_t)"-[NSFileManager(BRAdditions) br_movePromisedItemAtURL:toURL:error:]", 216);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v63 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v63, (os_log_type_t)0x90u))
        -[NSFileManager(BRAdditions) br_movePromisedItemAtURL:toURL:error:].cold.5();

      objc_msgSend(a1, "removeItemAtURL:error:", v104, 0);
    }
    else
    {
      if (a5)
        *a5 = (const char *)v111;
      brc_bread_crumbs((uint64_t)"-[NSFileManager(BRAdditions) br_movePromisedItemAtURL:toURL:error:]", 206);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v65 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v65, (os_log_type_t)0x90u))
      {
        if (a5)
          v87 = *a5;
        else
          v87 = 0;
        *(_DWORD *)buf = 138412546;
        v121 = v87;
        v122 = 2112;
        v123 = (uint64_t)v64;
        _os_log_error_impl(&dword_19CBF0000, v65, (os_log_type_t)0x90u, "[ERROR] Failed to copy properties of URL: %@%@", buf, 0x16u);
      }

      v26 = 0;
    }

    goto LABEL_74;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3328, 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    brc_bread_crumbs((uint64_t)"-[NSFileManager(BRAdditions) br_movePromisedItemAtURL:toURL:error:]", 91);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, (os_log_type_t)0x90u))
    {
      v40 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v121 = "-[NSFileManager(BRAdditions) br_movePromisedItemAtURL:toURL:error:]";
      v122 = 2080;
      if (!a5)
        v40 = "(ignored by caller)";
      v123 = (uint64_t)v40;
      v124 = 2112;
      v125 = v11;
      v126 = 2112;
      v127 = v12;
      _os_log_error_impl(&dword_19CBF0000, v13, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }

  }
  if (a5)
  {
    v11 = objc_retainAutorelease(v11);
    v14 = 0;
    *a5 = (const char *)v11;
  }
  else
  {
    v14 = 0;
  }
LABEL_36:

  return v14;
}

- (void)br_setPutBackInfoOnItemAtURL:()BRAdditions
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  NSObject *v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((objc_msgSend(v3, "br_isInSyncedLocation") & 1) != 0)
  {
    objc_msgSend(v3, "br_logicalURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "br_cloudDocsContainer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "trashRestoreStringForURL:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLByDeletingLastPathComponent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "br_itemID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSObject pathComponents](v6, "pathComponents");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "containsObject:", CFSTR(".Trash"));

    if (v10)
    {
      brc_bread_crumbs((uint64_t)"-[NSFileManager(BRAdditions) br_setPutBackInfoOnItemAtURL:]", 308);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[NSFileManager(BRAdditions) br_setPutBackInfoOnItemAtURL:].cold.1();

    }
    else
    {
      objc_msgSend(v4, "br_physicalURL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __59__NSFileManager_BRAdditions__br_setPutBackInfoOnItemAtURL___block_invoke;
      v16[3] = &unk_1E3DA4AE8;
      v17 = v6;
      v18 = v8;
      v15 = (id)objc_msgSend(v14, "fp_withReadWriteAccess:", v16);

      v11 = v17;
    }

  }
  else
  {
    brc_bread_crumbs((uint64_t)"-[NSFileManager(BRAdditions) br_setPutBackInfoOnItemAtURL:]", 294);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "path");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v20 = v13;
      v21 = 2112;
      v22 = v5;
      _os_log_impl(&dword_19CBF0000, v6, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't set the put back URL of something outside Mobile Docs: %@%@", buf, 0x16u);

    }
    v4 = v3;
  }

}

- (id)br_putBackURLForTrashedItemAtURL:()BRAdditions error:
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  id v12;
  const char *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  const char *v25;
  int v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (BRIsFPFSEnabled(v5, v6))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "brc_errorMethodNotImplemented:", sel_br_putBackURLForTrashedItemAtURL_error_);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      brc_bread_crumbs((uint64_t)"-[NSFileManager(BRAdditions) br_putBackURLForTrashedItemAtURL:error:]", 334);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, (os_log_type_t)0x90u))
      {
        v25 = "(passed to caller)";
        v26 = 136315906;
        v27 = "-[NSFileManager(BRAdditions) br_putBackURLForTrashedItemAtURL:error:]";
        v28 = 2080;
        if (!a4)
          v25 = "(ignored by caller)";
        v29 = v25;
        v30 = 2112;
        v31 = v7;
        v32 = 2112;
        v33 = v8;
        _os_log_error_impl(&dword_19CBF0000, v9, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", (uint8_t *)&v26, 0x2Au);
      }

    }
    if (a4)
    {
      v7 = objc_retainAutorelease(v7);
      v10 = 0;
      *a4 = v7;
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    objc_msgSend(v5, "br_physicalURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "path");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = (const char *)objc_msgSend(v12, "fileSystemRepresentation");

    brc_xattr_get_fs_string(v13, "com.apple.trash.put-back.path#PS");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v5, "br_cloudDocsContainer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "documentsURL");
      v15 = (id)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v7, "length"))
      {
        objc_msgSend(v15, "URLByAppendingPathComponent:", v7);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "path");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "pathComponents");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "containsObject:", CFSTR(".Trash"));

        if (v19)
        {
          brc_bread_crumbs((uint64_t)"-[NSFileManager(BRAdditions) br_putBackURLForTrashedItemAtURL:error:]", 348);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log(1);
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            -[NSFileManager(BRAdditions) br_putBackURLForTrashedItemAtURL:error:].cold.2(v16, (uint64_t)v20, v21);

          v10 = 0;
        }
        else
        {
          v10 = v16;
        }

      }
      else
      {
        v15 = v15;
        v10 = v15;
      }
    }
    else
    {
      brc_xattr_get_fs_string(v13, "com.apple.trash.put-back.icloud-parent-id#PS");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        brc_bread_crumbs((uint64_t)"-[NSFileManager(BRAdditions) br_putBackURLForTrashedItemAtURL:error:]", 356);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log(1);
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          -[NSFileManager(BRAdditions) br_putBackURLForTrashedItemAtURL:error:].cold.1();

      }
      if (a4)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 0x7FFFFFFFFFFFFFFFLL, 0);
        v10 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = 0;
      }
    }

  }
  return v10;
}

- (BOOL)br_trashItemAtURL:()BRAdditions resultingURL:error:
{
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void *v13;
  NSObject *v14;
  _BOOL8 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  int v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  NSObject *v31;
  const char *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t, uint64_t);
  void *v38;
  id v39;
  _QWORD v40[6];
  id obj;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint8_t v48[4];
  const char *v49;
  __int16 v50;
  const char *v51;
  __int16 v52;
  id v53;
  __int16 v54;
  void *v55;
  void *v56;
  _BYTE buf[24];
  uint64_t (*v58)(uint64_t, uint64_t);
  __int128 v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (BRIsFPFSEnabled(v7, v8))
  {
    objc_msgSend(MEMORY[0x1E0CAAC78], "defaultManager");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v42 = 0;
    v43 = &v42;
    v44 = 0x3032000000;
    v45 = __Block_byref_object_copy__0;
    v46 = __Block_byref_object_dispose__0;
    v47 = 0;
    obj = 0;
    objc_msgSend(v9, "itemForURL:error:", v7, &obj);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(&v47, obj);
    v11 = (void *)v43[5];
    if (v11)
    {
      v12 = v11;
      brc_bread_crumbs((uint64_t)"-[NSFileManager(BRAdditions) br_trashItemAtURL:resultingURL:error:]", 371);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, (os_log_type_t)0x90u))
      {
        v33 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = "-[NSFileManager(BRAdditions) br_trashItemAtURL:resultingURL:error:]";
        *(_WORD *)&buf[12] = 2080;
        if (!a5)
          v33 = "(ignored by caller)";
        *(_QWORD *)&buf[14] = v33;
        *(_WORD *)&buf[22] = 2112;
        v58 = v12;
        LOWORD(v59) = 2112;
        *(_QWORD *)((char *)&v59 + 2) = v13;
        _os_log_error_impl(&dword_19CBF0000, v14, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

      if (a5)
        *a5 = objc_retainAutorelease(v12);

      v15 = 0;
    }
    else
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v58 = __Block_byref_object_copy__0;
      *(_QWORD *)&v59 = __Block_byref_object_dispose__0;
      *((_QWORD *)&v59 + 1) = 0;
      v24 = objc_alloc(MEMORY[0x1E0CAACD8]);
      v56 = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v56, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)objc_msgSend(v24, "initWithItems:", v25);

      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __67__NSFileManager_BRAdditions__br_trashItemAtURL_resultingURL_error___block_invoke;
      v40[3] = &unk_1E3DA4B10;
      v40[4] = buf;
      v40[5] = &v42;
      objc_msgSend(v26, "setTransformCompletionBlock:", v40);
      v27 = objc_alloc_init(MEMORY[0x1E0CB3828]);
      objc_msgSend(v27, "addOperation:", v26);
      objc_msgSend(v26, "waitUntilFinished");
      v28 = (void *)v43[5];
      v15 = v28 == 0;
      if (v28)
      {
        v29 = v28;
        brc_bread_crumbs((uint64_t)"-[NSFileManager(BRAdditions) br_trashItemAtURL:resultingURL:error:]", 389);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log(0);
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, (os_log_type_t)0x90u))
        {
          v34 = "(passed to caller)";
          *(_DWORD *)v48 = 136315906;
          v49 = "-[NSFileManager(BRAdditions) br_trashItemAtURL:resultingURL:error:]";
          v50 = 2080;
          if (!a5)
            v34 = "(ignored by caller)";
          v51 = v34;
          v52 = 2112;
          v53 = v29;
          v54 = 2112;
          v55 = v30;
          _os_log_error_impl(&dword_19CBF0000, v31, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", v48, 0x2Au);
        }

        if (a5)
          *a5 = objc_retainAutorelease(v29);

      }
      else if (a4)
      {
        *a4 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
      }

      _Block_object_dispose(buf, 8);
    }

    _Block_object_dispose(&v42, 8);
  }
  else
  {
    +[BRDaemonConnection defaultConnection](BRDaemonConnection, "defaultConnection");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "newLegacySyncProxy");

    v35 = MEMORY[0x1E0C809B0];
    v36 = 3221225472;
    v37 = __67__NSFileManager_BRAdditions__br_trashItemAtURL_resultingURL_error___block_invoke_30;
    v38 = &unk_1E3DA4B38;
    v9 = v17;
    v39 = v9;
    objc_msgSend(v9, "trashItemAtURL:reply:", v7, &v35);
    objc_msgSend(v9, "result", v35, v36, v37, v38);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "result");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4)
      v20 = v19 == 0;
    else
      v20 = 1;
    v21 = !v20;

    if (v21)
    {
      objc_msgSend(v18, "br_addPhysicalProperty");
      *a4 = objc_retainAutorelease(v18);
    }
    objc_msgSend(v9, "error");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (a5 && v22)
    {
      objc_msgSend(v9, "error");
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "error");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v23 == 0;

  }
  return v15;
}

- (BOOL)br_putBackTrashedItemAtURL:()BRAdditions resultingURL:error:
{
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL8 v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  NSObject *v18;
  void *v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  NSObject *v21;
  void *v22;
  NSObject *v23;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[3];
  _QWORD v30[4];
  id v31;
  _BYTE *v32;
  _BYTE buf[24];
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (!BRIsFPFSEnabled(v8, v9))
  {
    memset(v29, 0, sizeof(v29));
    __brc_create_section(0, (uint64_t)"-[NSFileManager(BRAdditions) br_putBackTrashedItemAtURL:resultingURL:error:]", 436, v29);
    brc_bread_crumbs((uint64_t)"-[NSFileManager(BRAdditions) br_putBackTrashedItemAtURL:resultingURL:error:]", 436);
    v17 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v25 = v29[0];
      objc_msgSend(v8, "path");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      *(_QWORD *)&buf[4] = v25;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v26;
      *(_WORD *)&buf[22] = 2112;
      v34 = v17;
      _os_log_debug_impl(&dword_19CBF0000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx restoring trashed item %@%@", buf, 0x20u);

    }
    objc_msgSend(a1, "br_putBackURLForTrashedItemAtURL:error:", v8, a5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      brc_bread_crumbs((uint64_t)"-[NSFileManager(BRAdditions) br_putBackTrashedItemAtURL:resultingURL:error:]", 444);
      v20 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v8, "path");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "path");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v27;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v28;
        *(_WORD *)&buf[22] = 2112;
        v34 = v20;
        _os_log_debug_impl(&dword_19CBF0000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] moving %@ to %@%@", buf, 0x20u);

      }
      if (objc_msgSend(a1, "br_movePromisedItemAtURL:toURL:error:", v8, v19, a5))
      {
        if (a4)
          *a4 = objc_retainAutorelease(v19);
        v16 = 1;
        goto LABEL_19;
      }
    }
    else
    {
      brc_bread_crumbs((uint64_t)"-[NSFileManager(BRAdditions) br_putBackTrashedItemAtURL:resultingURL:error:]", 440);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, (os_log_type_t)0x90u))
        -[NSFileManager(BRAdditions) br_putBackTrashedItemAtURL:resultingURL:error:].cold.1();

    }
    v16 = 0;
LABEL_19:

    __brc_leave_section((uint64_t)v29);
    goto LABEL_20;
  }
  objc_msgSend(MEMORY[0x1E0CAAC78], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "itemForURL:error:", v8, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = objc_alloc(MEMORY[0x1E0CAACE0]);
    v37[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithItems:restoreDirectory:", v13, 0);

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v34 = __Block_byref_object_copy__0;
    v35 = __Block_byref_object_dispose__0;
    v36 = 0;
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __76__NSFileManager_BRAdditions__br_putBackTrashedItemAtURL_resultingURL_error___block_invoke;
    v30[3] = &unk_1E3DA4B60;
    v31 = v8;
    v32 = buf;
    objc_msgSend(v14, "setUntrashCompletionBlock:", v30);
    v15 = (void *)objc_opt_new();
    objc_msgSend(v15, "addOperation:", v14);

    objc_msgSend(v14, "waitUntilFinished");
    v16 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40) == 0;

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v16 = 0;
  }

LABEL_20:
  return v16;
}

- (void)br_setLastOpenDate:()BRAdditions onItemAtURL:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    objc_msgSend(v6, "br_physicalURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __61__NSFileManager_BRAdditions__br_setLastOpenDate_onItemAtURL___block_invoke;
    v10[3] = &unk_1E3DA4AE8;
    v11 = v5;
    v12 = v7;
    v9 = (id)objc_msgSend(v8, "fp_withReadWriteAccess:", v10);

  }
}

- (void)br_setFavoriteRank:()BRAdditions onItemAtURL:
{
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  objc_msgSend(a4, "br_physicalURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__NSFileManager_BRAdditions__br_setFavoriteRank_onItemAtURL___block_invoke;
  v9[3] = &unk_1E3DA4B88;
  v10 = v5;
  v7 = v5;
  v8 = (id)objc_msgSend(v6, "fp_withReadWriteAccess:", v9);

}

- (uint64_t)br_topLevelSharedFolderForURL:()BRAdditions error:
{
  return 0;
}

- (uint64_t)br_forceMoveItemAtURL:()BRAdditions toURL:error:
{
  id v8;
  id v9;
  char v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v15;

  v8 = a3;
  v9 = a4;
  if (v9)
  {
    v15 = 0;
    v10 = objc_msgSend(a1, "removeItemAtURL:error:", v9, &v15);
    v11 = v15;
    v12 = v11;
    if ((v10 & 1) != 0 || (objc_msgSend(v11, "br_isCocoaErrorCode:", 4) & 1) != 0)
    {
      v13 = objc_msgSend(a1, "moveItemAtURL:toURL:error:", v8, v9, a5);
    }
    else
    {
      v13 = 0;
      if (a5)
        *a5 = objc_retainAutorelease(v12);
    }

  }
  else
  {
    v13 = 1;
  }

  return v13;
}

- (void)br_movePromisedItemAtURL:()BRAdditions toURL:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_19CBF0000, v0, v1, "[ERROR] %@ does not seem to be reachable%@");
  OUTLINED_FUNCTION_1();
}

- (void)br_movePromisedItemAtURL:()BRAdditions toURL:error:.cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_19CBF0000, a2, (os_log_type_t)0x90u, "[ERROR] Can't create temporary directory%@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)br_movePromisedItemAtURL:()BRAdditions toURL:error:.cold.3(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_19CBF0000, log, (os_log_type_t)0x90u, "[ERROR] no file name in fault at %@%@", buf, 0x16u);

}

- (void)br_movePromisedItemAtURL:()BRAdditions toURL:error:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_19CBF0000, v0, v1, "[ERROR] writeToURL failed: %@%@");
  OUTLINED_FUNCTION_1();
}

- (void)br_movePromisedItemAtURL:()BRAdditions toURL:error:.cold.5()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2(&dword_19CBF0000, v0, v1, "[ERROR] copyItem failed: %@%@");
  OUTLINED_FUNCTION_1();
}

- (void)br_movePromisedItemAtURL:()BRAdditions toURL:error:.cold.6(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_19CBF0000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: capability & BRMoveCapabilityMaskAllow%@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)br_movePromisedItemAtURL:()BRAdditions toURL:error:.cold.7()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_19CBF0000, v0, v1, "[ERROR] %@%@");
  OUTLINED_FUNCTION_1();
}

- (void)br_setPutBackInfoOnItemAtURL:()BRAdditions .cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v0, v1, "[DEBUG] Preventing setting the put back info path when parented by .Trash: %@%@");
  OUTLINED_FUNCTION_1();
}

- (void)br_putBackURLForTrashedItemAtURL:()BRAdditions error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v0, v1, "[DEBUG] not implemented: fallback to itemID %@%@");
  OUTLINED_FUNCTION_1();
}

- (void)br_putBackURLForTrashedItemAtURL:()BRAdditions error:.cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_debug_impl(&dword_19CBF0000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] Preventing returning the put back info path when parented by .Trash: %@%@", (uint8_t *)&v6, 0x16u);

}

- (void)br_putBackTrashedItemAtURL:()BRAdditions resultingURL:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2(&dword_19CBF0000, v0, v1, "[ERROR] couldn't find putback url: %@%@");
  OUTLINED_FUNCTION_1();
}

@end
