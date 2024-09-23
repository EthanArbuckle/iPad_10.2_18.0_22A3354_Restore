@implementation BRCStageRegistry

- (BRCStageRegistry)initWithAccountSession:(id)a3
{
  id v5;
  BRCStageRegistry *v6;
  BRCStageRegistry *v7;
  NSMutableSet *v8;
  NSMutableSet *unflushedStagedFileIDs;
  NSMutableDictionary *v10;
  NSMutableDictionary *watchedLockedFileIDs;
  NSMutableSet *v12;
  NSMutableSet *activeUploadStageIDs;
  NSMutableSet *v14;
  NSMutableSet *activeDownloadStageIDs;
  uint64_t v16;
  brc_task_tracker *tracker;
  NSObject *v18;
  NSObject *v19;
  dispatch_queue_t v20;
  OS_dispatch_queue *queue;
  objc_super v23;

  v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)BRCStageRegistry;
  v6 = -[BRCStageRegistry init](&v23, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_session, a3);
    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    unflushedStagedFileIDs = v7->_unflushedStagedFileIDs;
    v7->_unflushedStagedFileIDs = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    watchedLockedFileIDs = v7->_watchedLockedFileIDs;
    v7->_watchedLockedFileIDs = v10;

    v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    activeUploadStageIDs = v7->_activeUploadStageIDs;
    v7->_activeUploadStageIDs = v12;

    v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    activeDownloadStageIDs = v7->_activeDownloadStageIDs;
    v7->_activeDownloadStageIDs = v14;

    brc_task_tracker_create("com.apple.brc.stage");
    v16 = objc_claimAutoreleasedReturnValue();
    tracker = v7->_tracker;
    v7->_tracker = (brc_task_tracker *)v16;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v18 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v18, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = dispatch_queue_create("com.apple.brc.stage", v19);

    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v20;

  }
  return v7;
}

- (id)_pathForDirIndex:(unsigned __int8)a3
{
  uint64_t v3;
  BRCAccountSession *session;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  if (_pathForDirIndex__once != -1)
    dispatch_once(&_pathForDirIndex__once, &__block_literal_global_34);
  session = self->_session;
  if ((_DWORD)v3 == 3)
    -[BRCAccountSession cacheDirPath](session, "cacheDirPath");
  else
    -[BRCAccountSession sessionDirPath](session, "sessionDirPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)_pathForDirIndex__dirsMapping;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathComponent:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __37__BRCStageRegistry__pathForDirIndex___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[10];
  _QWORD v3[11];

  v3[10] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E87D7310;
  v2[1] = &unk_1E87D7328;
  v3[0] = CFSTR("v");
  v3[1] = CFSTR("g");
  v2[2] = &unk_1E87D7340;
  v2[3] = &unk_1E87D7358;
  v3[2] = CFSTR("d");
  v3[3] = CFSTR("u");
  v2[4] = &unk_1E87D7370;
  v2[5] = &unk_1E87D7388;
  v3[4] = CFSTR("s");
  v3[5] = CFSTR("l");
  v2[6] = &unk_1E87D73A0;
  v2[7] = &unk_1E87D73B8;
  v3[6] = CFSTR("t");
  v3[7] = CFSTR("x");
  v2[8] = &unk_1E87D73D0;
  v2[9] = &unk_1E87D73E8;
  v3[8] = CFSTR("f");
  v3[9] = CFSTR("r");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 10);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_pathForDirIndex__dirsMapping;
  _pathForDirIndex__dirsMapping = v0;

}

- (void)open
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _deviceID != 0%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __24__BRCStageRegistry_open__block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *v3;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_autorelease_frequency(v3, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("com.apple.brc.stage.backup-exclusion-queue", v0);

  v2 = (void *)open_backupExclusionQueue;
  open_backupExclusionQueue = (uint64_t)v1;

}

uint64_t __24__BRCStageRegistry_open__block_invoke_2(uint64_t a1)
{
  NSObject *v1;
  _QWORD block[4];
  id v4;

  v1 = open_backupExclusionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __24__BRCStageRegistry_open__block_invoke_3;
  block[3] = &unk_1E875D500;
  v4 = *(id *)(a1 + 32);
  dispatch_async(v1, block);

  return 0;
}

void __24__BRCStageRegistry_open__block_invoke_3(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  char v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  const char *v12;
  int v13;
  uint64_t v14;
  id v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "lastPathComponent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("x"));

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *MEMORY[0x1E0C999D8];
  if (v3)
  {
    v16 = 0;
    v7 = objc_msgSend(v4, "setResourceValue:forKey:error:", MEMORY[0x1E0C9AAA0], v6, &v16);
    v8 = v16;

    if ((v7 & 1) == 0)
    {
      brc_bread_crumbs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, (os_log_type_t)0x90u))
      {
        v11 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412802;
        v18 = v11;
        v19 = 2112;
        v20 = v8;
        v21 = 2112;
        v22 = v9;
        v12 = "[ERROR] Unable to include '%@' in backups: %@%@";
LABEL_10:
        _os_log_error_impl(&dword_1CBD43000, v10, (os_log_type_t)0x90u, v12, buf, 0x20u);
        goto LABEL_7;
      }
      goto LABEL_7;
    }
  }
  else
  {
    v15 = 0;
    v13 = objc_msgSend(v4, "setResourceValue:forKey:error:", MEMORY[0x1E0C9AAB0], v6, &v15);
    v8 = v15;

    if ((v13 & 1) == 0)
    {
      brc_bread_crumbs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, (os_log_type_t)0x90u))
      {
        v14 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412802;
        v18 = v14;
        v19 = 2112;
        v20 = v8;
        v21 = 2112;
        v22 = v9;
        v12 = "[ERROR] Unable to exclude '%@' from backups: %@%@";
        goto LABEL_10;
      }
LABEL_7:

    }
  }

}

- (int)_openStageDirectory:(unsigned __int8)a3
{
  uint64_t v3;
  Class *v5;
  id *v6;
  Class v7;
  objc_class *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v16;
  void *v17;
  NSObject *v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  objc_class *v29;
  int v30;
  void *v31;
  NSObject *v32;
  dev_t st_dev;
  int v34;
  int v35;
  int v36;
  int v37;
  uid_t v38;
  gid_t v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  int v45;
  __uint32_t v46;
  int v47;
  int v48;
  void *v49;
  NSObject *v50;
  int v51;
  void *v52;
  NSObject *v53;
  void *v54;
  NSObject *v55;
  int v56;
  int v57;
  int v58;
  int v59;
  int v60;
  int v61;
  int v62;
  int v63;
  int v64;
  int v65;
  void *v66;
  char v67;
  id v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  int v75;
  int v76;
  void *v77;
  NSObject *v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  int v82;
  void *v83;
  NSObject *v84;
  NSObject *v85;
  uint32_t v86;
  void *v88;
  NSObject *v89;
  unsigned __int16 v90;
  unsigned __int16 v91;
  id v92;
  stat v93;
  uint8_t buf[4];
  _BYTE v95[30];
  __int16 v96;
  int v97;
  __int16 v98;
  int v99;
  __int16 v100;
  int v101;
  __int16 v102;
  int v103;
  __int16 v104;
  int v105;
  __int16 v106;
  int v107;
  __int16 v108;
  int v109;
  __int16 v110;
  int v111;
  __int16 v112;
  int v113;
  __int16 v114;
  int st_nlink;
  __int16 v116;
  uid_t st_uid;
  __int16 v118;
  gid_t st_gid;
  __int16 v120;
  __darwin_time_t tv_sec;
  __int16 v122;
  __darwin_time_t v123;
  __int16 v124;
  __darwin_time_t v125;
  __int16 v126;
  off_t st_size;
  __int16 v128;
  __uint32_t st_flags;
  __int16 v130;
  _BYTE v131[14];
  uint64_t v132;

  v3 = a3;
  v132 = *MEMORY[0x1E0C80C00];
  memset(&v93, 0, sizeof(v93));
  v5 = &self->super.isa + a3;
  v7 = v5[2];
  v6 = (id *)(v5 + 2);
  v8 = objc_retainAutorelease(v7);
  v9 = (const char *)-[objc_class fileSystemRepresentation](v8, "fileSystemRepresentation");
  v15 = BRCOpenAt(0xFFFFFFFFLL, v9, 33028, v10, v11, v12, v13, v14, v90);
  if (v15 < 0)
  {
    if (*__error() == 2)
      goto LABEL_103;
    v48 = *__error();
    brc_bread_crumbs();
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)v95 = v8;
      *(_WORD *)&v95[8] = 1024;
      *(_DWORD *)&v95[10] = v48;
      *(_WORD *)&v95[14] = 2112;
      *(_QWORD *)&v95[16] = v49;
      _os_log_error_impl(&dword_1CBD43000, v50, (os_log_type_t)0x90u, "[ERROR] open('%@') failed %{errno}d%@", buf, 0x1Cu);
    }

    *__error() = v48;
  }
  else
  {
    v16 = v15;
    if ((fstat(v15, &v93) & 0x80000000) == 0)
    {
      if ((v93.st_mode & 0xF000) == 0x4000)
      {
        if (v93.st_dev == self->_deviceID)
        {
LABEL_114:
          v79 = v3;
          -[BRCStageRegistry _pathForDirIndex:](self, "_pathForDirIndex:", v3);
          v80 = (void *)objc_claimAutoreleasedReturnValue();

          objc_storeStrong(v6, v80);
          self->_stageDirectoryFileID[v79] = v93.st_ino;
          v8 = (objc_class *)v80;
          goto LABEL_155;
        }
        brc_bread_crumbs();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v19 = aPcDBLSW[(unint64_t)v93.st_mode >> 12];
          if ((v93.st_mode & 0x100) != 0)
            v20 = 114;
          else
            v20 = 45;
          if ((v93.st_mode & 0x80) != 0)
            v21 = 119;
          else
            v21 = 45;
          if ((v93.st_mode & 0x40) != 0)
            v22 = 120;
          else
            v22 = 45;
          if ((v93.st_mode & 0x20) != 0)
            v23 = 114;
          else
            v23 = 45;
          if ((v93.st_mode & 0x10) != 0)
            v24 = 119;
          else
            v24 = 45;
          if ((v93.st_mode & 8) != 0)
            v25 = 120;
          else
            v25 = 45;
          if ((v93.st_mode & 4) != 0)
            v26 = 114;
          else
            v26 = 45;
          if ((v93.st_mode & 2) != 0)
            v27 = 119;
          else
            v27 = 45;
          if ((v93.st_mode & 1) != 0)
            v28 = 120;
          else
            v28 = 45;
          *(_DWORD *)buf = 138417666;
          *(_QWORD *)v95 = v8;
          *(_WORD *)&v95[8] = 1024;
          *(_DWORD *)&v95[10] = v93.st_dev;
          *(_WORD *)&v95[14] = 2048;
          *(_QWORD *)&v95[16] = v93.st_ino;
          *(_WORD *)&v95[24] = 1024;
          *(_DWORD *)&v95[26] = v19;
          v96 = 1024;
          v97 = v20;
          v98 = 1024;
          v99 = v21;
          v100 = 1024;
          v101 = v22;
          v102 = 1024;
          v103 = v23;
          v104 = 1024;
          v105 = v24;
          v106 = 1024;
          v107 = v25;
          v108 = 1024;
          v109 = v26;
          v110 = 1024;
          v111 = v27;
          v112 = 1024;
          v113 = v28;
          v114 = 1024;
          st_nlink = v93.st_nlink;
          v116 = 1024;
          st_uid = v93.st_uid;
          v118 = 1024;
          st_gid = v93.st_gid;
          v120 = 2048;
          tv_sec = v93.st_atimespec.tv_sec;
          v122 = 2048;
          v123 = v93.st_mtimespec.tv_sec;
          v124 = 2048;
          v125 = v93.st_ctimespec.tv_sec;
          v126 = 2048;
          st_size = v93.st_size;
          v128 = 1024;
          st_flags = v93.st_flags;
          v130 = 2112;
          *(_QWORD *)v131 = v17;
          _os_log_impl(&dword_1CBD43000, v18, OS_LOG_TYPE_DEFAULT, "[WARNING] '%@' is not on the same volume as the root deviceID:%u fileID:%llu mode:%c%c%c%c%c%c%c%c%c%c nlink:%u uid:%u gid:%u atime:%lu mtime:%lu ctime:%lu size:%llu flags:0x%x%@", buf, 0xA2u);
        }

        close(v16);
        v29 = objc_retainAutorelease(v8);
        if (unlink((const char *)-[objc_class fileSystemRepresentation](v29, "fileSystemRepresentation")) < 0
          && *__error() != 2)
        {
          v30 = *__error();
          brc_bread_crumbs();
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, (os_log_type_t)0x90u))
          {
            st_dev = v93.st_dev;
            v34 = aPcDBLSW[(unint64_t)v93.st_mode >> 12];
            if ((v93.st_mode & 0x100) != 0)
              v35 = 114;
            else
              v35 = 45;
            v36 = v93.st_nlink;
            if ((v93.st_mode & 0x80) != 0)
              v37 = 119;
            else
              v37 = 45;
            v38 = v93.st_uid;
            v39 = v93.st_gid;
            if ((v93.st_mode & 0x40) != 0)
              v40 = 120;
            else
              v40 = 45;
            if ((v93.st_mode & 0x20) != 0)
              v41 = 114;
            else
              v41 = 45;
            if ((v93.st_mode & 0x10) != 0)
              v42 = 119;
            else
              v42 = 45;
            if ((v93.st_mode & 8) != 0)
              v43 = 120;
            else
              v43 = 45;
            if ((v93.st_mode & 4) != 0)
              v44 = 114;
            else
              v44 = 45;
            if ((v93.st_mode & 2) != 0)
              v45 = 119;
            else
              v45 = 45;
            v46 = v93.st_flags;
            if ((v93.st_mode & 1) != 0)
              v47 = 120;
            else
              v47 = 45;
LABEL_151:
            *(_DWORD *)buf = 138417922;
            *(_QWORD *)v95 = v29;
            *(_WORD *)&v95[8] = 1024;
            *(_DWORD *)&v95[10] = st_dev;
            *(_WORD *)&v95[14] = 2048;
            *(_QWORD *)&v95[16] = v93.st_ino;
            *(_WORD *)&v95[24] = 1024;
            *(_DWORD *)&v95[26] = v34;
            v96 = 1024;
            v97 = v35;
            v98 = 1024;
            v99 = v37;
            v100 = 1024;
            v101 = v40;
            v102 = 1024;
            v103 = v41;
            v104 = 1024;
            v105 = v42;
            v106 = 1024;
            v107 = v43;
            v108 = 1024;
            v109 = v44;
            v110 = 1024;
            v111 = v45;
            v112 = 1024;
            v113 = v47;
            v114 = 1024;
            st_nlink = v36;
            v116 = 1024;
            st_uid = v38;
            v118 = 1024;
            st_gid = v39;
            v120 = 2048;
            tv_sec = v93.st_atimespec.tv_sec;
            v122 = 2048;
            v123 = v93.st_mtimespec.tv_sec;
            v124 = 2048;
            v125 = v93.st_ctimespec.tv_sec;
            v126 = 2048;
            st_size = v93.st_size;
            v128 = 1024;
            st_flags = v46;
            v130 = 1024;
            *(_DWORD *)v131 = v30;
            *(_WORD *)&v131[4] = 2112;
            *(_QWORD *)&v131[6] = v31;
            v81 = "[ERROR] unlink('%@') failed deviceID:%u fileID:%llu mode:%c%c%c%c%c%c%c%c%c%c nlink:%u uid:%u gid:%u a"
                  "time:%lu mtime:%lu ctime:%lu size:%llu flags:0x%x %{errno}d%@";
            v85 = v32;
            v86 = 168;
            goto LABEL_152;
          }
          goto LABEL_153;
        }
      }
      else
      {
        brc_bread_crumbs();
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v55 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          v56 = aPcDBLSW[(unint64_t)v93.st_mode >> 12];
          if ((v93.st_mode & 0x100) != 0)
            v57 = 114;
          else
            v57 = 45;
          if ((v93.st_mode & 0x80) != 0)
            v58 = 119;
          else
            v58 = 45;
          if ((v93.st_mode & 0x40) != 0)
            v59 = 120;
          else
            v59 = 45;
          if ((v93.st_mode & 0x20) != 0)
            v60 = 114;
          else
            v60 = 45;
          if ((v93.st_mode & 0x10) != 0)
            v61 = 119;
          else
            v61 = 45;
          if ((v93.st_mode & 8) != 0)
            v62 = 120;
          else
            v62 = 45;
          if ((v93.st_mode & 4) != 0)
            v63 = 114;
          else
            v63 = 45;
          if ((v93.st_mode & 2) != 0)
            v64 = 119;
          else
            v64 = 45;
          if ((v93.st_mode & 1) != 0)
            v65 = 120;
          else
            v65 = 45;
          *(_DWORD *)buf = 138417666;
          *(_QWORD *)v95 = v8;
          *(_WORD *)&v95[8] = 1024;
          *(_DWORD *)&v95[10] = v93.st_dev;
          *(_WORD *)&v95[14] = 2048;
          *(_QWORD *)&v95[16] = v93.st_ino;
          *(_WORD *)&v95[24] = 1024;
          *(_DWORD *)&v95[26] = v56;
          v96 = 1024;
          v97 = v57;
          v98 = 1024;
          v99 = v58;
          v100 = 1024;
          v101 = v59;
          v102 = 1024;
          v103 = v60;
          v104 = 1024;
          v105 = v61;
          v106 = 1024;
          v107 = v62;
          v108 = 1024;
          v109 = v63;
          v110 = 1024;
          v111 = v64;
          v112 = 1024;
          v113 = v65;
          v114 = 1024;
          st_nlink = v93.st_nlink;
          v116 = 1024;
          st_uid = v93.st_uid;
          v118 = 1024;
          st_gid = v93.st_gid;
          v120 = 2048;
          tv_sec = v93.st_atimespec.tv_sec;
          v122 = 2048;
          v123 = v93.st_mtimespec.tv_sec;
          v124 = 2048;
          v125 = v93.st_ctimespec.tv_sec;
          v126 = 2048;
          st_size = v93.st_size;
          v128 = 1024;
          st_flags = v93.st_flags;
          v130 = 2112;
          *(_QWORD *)v131 = v54;
          _os_log_impl(&dword_1CBD43000, v55, OS_LOG_TYPE_DEFAULT, "[WARNING] '%@' is not a directory deviceID:%u fileID:%llu mode:%c%c%c%c%c%c%c%c%c%c nlink:%u uid:%u gid:%u atime:%lu mtime:%lu ctime:%lu size:%llu flags:0x%x%@", buf, 0xA2u);
        }

        close(v16);
        v29 = objc_retainAutorelease(v8);
        if (unlink((const char *)-[objc_class fileSystemRepresentation](v29, "fileSystemRepresentation")) < 0
          && *__error() != 2)
        {
          v30 = *__error();
          brc_bread_crumbs();
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, (os_log_type_t)0x90u))
          {
            st_dev = v93.st_dev;
            v34 = aPcDBLSW[(unint64_t)v93.st_mode >> 12];
            if ((v93.st_mode & 0x100) != 0)
              v35 = 114;
            else
              v35 = 45;
            v36 = v93.st_nlink;
            if ((v93.st_mode & 0x80) != 0)
              v37 = 119;
            else
              v37 = 45;
            v38 = v93.st_uid;
            v39 = v93.st_gid;
            if ((v93.st_mode & 0x40) != 0)
              v40 = 120;
            else
              v40 = 45;
            if ((v93.st_mode & 0x20) != 0)
              v41 = 114;
            else
              v41 = 45;
            if ((v93.st_mode & 0x10) != 0)
              v42 = 119;
            else
              v42 = 45;
            if ((v93.st_mode & 8) != 0)
              v43 = 120;
            else
              v43 = 45;
            if ((v93.st_mode & 4) != 0)
              v44 = 114;
            else
              v44 = 45;
            if ((v93.st_mode & 2) != 0)
              v45 = 119;
            else
              v45 = 45;
            v46 = v93.st_flags;
            if ((v93.st_mode & 1) != 0)
              v47 = 120;
            else
              v47 = 45;
            goto LABEL_151;
          }
LABEL_153:

          *__error() = v30;
LABEL_154:
          v16 = -1;
          v8 = v29;
          goto LABEL_155;
        }
      }
LABEL_103:
      v29 = objc_retainAutorelease(v8);
      if (mkdir((const char *)-[objc_class fileSystemRepresentation](v29, "fileSystemRepresentation"), 0x1EDu) < 0
        && *__error() != 17)
      {
        if (*__error() != 2)
        {
          v30 = *__error();
          brc_bread_crumbs();
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v32 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v32, (os_log_type_t)0x90u))
            goto LABEL_153;
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)v95 = v29;
          *(_WORD *)&v95[8] = 1024;
          *(_DWORD *)&v95[10] = v30;
          *(_WORD *)&v95[14] = 2112;
          *(_QWORD *)&v95[16] = v31;
          v81 = "[ERROR] mkdir('%@') failed %{errno}d%@";
          goto LABEL_122;
        }
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        v92 = 0;
        v67 = objc_msgSend(v66, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v29, 1, 0, &v92);
        v68 = v92;

        if ((v67 & 1) == 0)
        {
          brc_bread_crumbs();
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v89 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v89, (os_log_type_t)0x90u))
          {
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)v95 = v29;
            *(_WORD *)&v95[8] = 2112;
            *(_QWORD *)&v95[10] = v68;
            *(_WORD *)&v95[18] = 2112;
            *(_QWORD *)&v95[20] = v88;
            _os_log_error_impl(&dword_1CBD43000, v89, (os_log_type_t)0x90u, "[ERROR] mkdir('%@') withIntermediateDirectories failed: %@%@", buf, 0x20u);
          }

          goto LABEL_154;
        }

      }
      v29 = objc_retainAutorelease(v29);
      v69 = (const char *)-[objc_class fileSystemRepresentation](v29, "fileSystemRepresentation");
      v75 = BRCOpenAt(0xFFFFFFFFLL, v69, 33028, v70, v71, v72, v73, v74, v91);
      if ((v75 & 0x80000000) == 0)
      {
        v16 = v75;
        if (fstat(v75, &v93) < 0)
        {
          v82 = *__error();
          brc_bread_crumbs();
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v84 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v84, (os_log_type_t)0x90u))
          {
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)v95 = v29;
            *(_WORD *)&v95[8] = 1024;
            *(_DWORD *)&v95[10] = v82;
            *(_WORD *)&v95[14] = 2112;
            *(_QWORD *)&v95[16] = v83;
            _os_log_error_impl(&dword_1CBD43000, v84, (os_log_type_t)0x90u, "[ERROR] fstat('%@') failed %{errno}d%@", buf, 0x1Cu);
          }

          *__error() = v82;
          close(v16);
          goto LABEL_154;
        }
        if (fcntl(v16, 64, 3))
        {
          v76 = *__error();
          brc_bread_crumbs();
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v78 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v78, (os_log_type_t)0x90u))
            -[BRCStageRegistry _openStageDirectory:].cold.1((uint64_t)v77, v76, v78);

          *__error() = v76;
        }
        goto LABEL_114;
      }
      v30 = *__error();
      brc_bread_crumbs();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v32 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v32, (os_log_type_t)0x90u))
        goto LABEL_153;
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)v95 = v29;
      *(_WORD *)&v95[8] = 1024;
      *(_DWORD *)&v95[10] = v30;
      *(_WORD *)&v95[14] = 2112;
      *(_QWORD *)&v95[16] = v31;
      v81 = "[ERROR] open('%@') failed %{errno}d%@";
LABEL_122:
      v85 = v32;
      v86 = 28;
LABEL_152:
      _os_log_error_impl(&dword_1CBD43000, v85, (os_log_type_t)0x90u, v81, buf, v86);
      goto LABEL_153;
    }
    v51 = *__error();
    brc_bread_crumbs();
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)v95 = v16;
      *(_WORD *)&v95[4] = 2112;
      *(_QWORD *)&v95[6] = v8;
      *(_WORD *)&v95[14] = 1024;
      *(_DWORD *)&v95[16] = v51;
      *(_WORD *)&v95[20] = 2112;
      *(_QWORD *)&v95[22] = v52;
      _os_log_error_impl(&dword_1CBD43000, v53, (os_log_type_t)0x90u, "[ERROR] fstat(%d) '%@' failed %{errno}d%@", buf, 0x22u);
    }

    *__error() = v51;
    close(v16);
  }
  v16 = -1;
LABEL_155:

  return v16;
}

- (int)_performInStageDirectory:(unsigned __int8)a3 block:(id)a4
{
  uint64_t v4;
  uint64_t (**v6)(id, _QWORD);
  uint64_t v7;
  int v8;
  int v9;
  int v10;

  v4 = a3;
  v6 = (uint64_t (**)(id, _QWORD))a4;
  v7 = -[BRCStageRegistry _openStageDirectory:](self, "_openStageDirectory:", v4);
  if ((v7 & 0x80000000) != 0)
  {
    v9 = -1;
  }
  else
  {
    v8 = v7;
    v9 = v6[2](v6, v7);
    v10 = *__error();
    close(v8);
    *__error() = v10;
  }

  return v9;
}

- (BOOL)copyPackageFileWithPackageFd:(int)a3 toStageFd:(int)a4 relpath:(id)a5
{
  id v8;
  id v9;
  int v10;
  _QWORD v12[4];
  id v13;
  int v14;
  int v15;

  v8 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __67__BRCStageRegistry_copyPackageFileWithPackageFd_toStageFd_relpath___block_invoke;
  v12[3] = &unk_1E8763940;
  v13 = v8;
  v14 = a3;
  v15 = a4;
  v9 = v8;
  v10 = -[BRCStageRegistry _performInStageDirectory:block:](self, "_performInStageDirectory:block:", 3, v12);

  return v10 >= 0;
}

uint64_t __67__BRCStageRegistry_copyPackageFileWithPackageFd_toStageFd_relpath___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  uint64_t v27;
  int v28;
  void *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  int v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  int v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  unsigned __int16 v42;
  uint8_t buf[4];
  int v44;
  __int16 v45;
  _BYTE v46[10];
  _BYTE v47[14];
  __int16 v48;
  int v49;
  __int16 v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *(unsigned int *)(a1 + 40);
  v7 = (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "fileSystemRepresentation");
  v13 = BRCOpenAt(v6, v7, 33028, v8, v9, v10, v11, v12, v42);
  if (v13 < 0)
  {
    v28 = *__error();
    brc_bread_crumbs();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, (os_log_type_t)0x90u))
    {
      v38 = *(_DWORD *)(a1 + 40);
      v39 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 67109890;
      v44 = v38;
      v45 = 2112;
      *(_QWORD *)v46 = v39;
      *(_WORD *)&v46[8] = 1024;
      *(_DWORD *)v47 = v28;
      *(_WORD *)&v47[4] = 2112;
      *(_QWORD *)&v47[6] = v31;
      _os_log_error_impl(&dword_1CBD43000, v32, (os_log_type_t)0x90u, "[ERROR] BRCOpenAt(%d, %@, O_RDONLY) failed %{errno}d%@", buf, 0x22u);
    }

    goto LABEL_17;
  }
  v14 = v13;
  v15 = objc_retainAutorelease(v5);
  v16 = (const char *)objc_msgSend(v15, "fileSystemRepresentation");
  v22 = BRCOpenAt(a2, v16, 2822, v17, v18, v19, v20, v21, 0x1B0u);
  if (v22 < 0)
  {
    v33 = *__error();
    brc_bread_crumbs();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 67109890;
      v44 = a2;
      v45 = 2112;
      *(_QWORD *)v46 = v15;
      *(_WORD *)&v46[8] = 1024;
      *(_DWORD *)v47 = v33;
      *(_WORD *)&v47[4] = 2112;
      *(_QWORD *)&v47[6] = v34;
      _os_log_error_impl(&dword_1CBD43000, v35, (os_log_type_t)0x90u, "[ERROR] BRCOpenAt(%d, %@, O_CREAT|O_RDWR|O_EXCL) %{errno}d%@", buf, 0x22u);
    }

    *__error() = v33;
    v28 = *__error();
    close(v14);
    goto LABEL_18;
  }
  v23 = v22;
  v24 = fcopyfile(v14, v22, 0, 8u);
  v25 = *__error();
  close(v14);
  *__error() = v25;
  v26 = *__error();
  close(v23);
  *__error() = v26;
  if (v24 < 0)
  {
    v28 = *__error();
    brc_bread_crumbs();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 67109890;
      v44 = v14;
      v45 = 1024;
      *(_DWORD *)v46 = v23;
      *(_WORD *)&v46[4] = 1024;
      *(_DWORD *)&v46[6] = v28;
      *(_WORD *)v47 = 2112;
      *(_QWORD *)&v47[2] = v31;
      _os_log_error_impl(&dword_1CBD43000, v36, (os_log_type_t)0x90u, "[ERROR] fcopyfile(%d, %d, NULL, COPYFILE_DATA) %{errno}d%@", buf, 0x1Eu);
    }

LABEL_17:
LABEL_18:
    *__error() = v28;
    v27 = 0xFFFFFFFFLL;
    goto LABEL_19;
  }
  v27 = 0;
  if ((BRCRenameAt(a2, v15, *(_DWORD *)(a1 + 44), *(void **)(a1 + 32), 0) & 0x80000000) != 0)
  {
    v28 = *__error();
    brc_bread_crumbs();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, (os_log_type_t)0x90u))
    {
      v40 = *(_DWORD *)(a1 + 44);
      v41 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 67110402;
      v44 = a2;
      v45 = 2112;
      *(_QWORD *)v46 = v15;
      *(_WORD *)&v46[8] = 1024;
      *(_DWORD *)v47 = v40;
      *(_WORD *)&v47[4] = 2112;
      *(_QWORD *)&v47[6] = v41;
      v48 = 1024;
      v49 = v28;
      v50 = 2112;
      v51 = v29;
      _os_log_error_impl(&dword_1CBD43000, v30, (os_log_type_t)0x90u, "[ERROR] BRCRenameAt(%d, %@, %d, %@, 0) %{errno}d%@", buf, 0x32u);
    }

    goto LABEL_18;
  }
LABEL_19:

  return v27;
}

- (id)_pathInStage:(unint64_t)a3 index:(unsigned __int8 *)a4 generationID:(unsigned int *)a5
{
  uint64_t v9;
  int v10;
  int v11;
  id v12;
  uint64_t v13;
  NSString **stageDirectoryPath;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v21;
  uint64_t v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  unint64_t v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v22 = 0;
  v9 = BRCOpenByID(self->_deviceID, a3, 2129924);
  if ((v9 & 0x80000000) != 0)
  {
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[BRCStageRegistry _pathInStage:index:generationID:].cold.1((uint64_t)v15, a3, v16);

    v12 = 0;
    goto LABEL_14;
  }
  v10 = v9;
  v21 = 0;
  v11 = _fstatItem(v9, &v22, a5, 0, 0, &v21);
  v12 = v21;
  close(v10);
  if (v11 < 0)
  {
LABEL_14:
    v19 = 0;
    goto LABEL_15;
  }
  if (v22 != a3)
  {
    brc_bread_crumbs();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134218498;
      v24 = v22;
      v25 = 2048;
      v26 = a3;
      v27 = 2112;
      v28 = v17;
      _os_log_fault_impl(&dword_1CBD43000, v18, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: returnedFileID(%llu) != fileID(%llu)%@", buf, 0x20u);
    }

    goto LABEL_14;
  }
  v13 = 0;
  stageDirectoryPath = self->_stageDirectoryPath;
  while (!objc_msgSend(v12, "hasPrefix:", stageDirectoryPath[v13]))
  {
    if (++v13 == 10)
      goto LABEL_14;
  }
  *a4 = v13;
  v12 = v12;
  v19 = v12;
LABEL_15:

  return v19;
}

- (void)associateSyncUpStageID:(id)a3 withOperation:(id)a4
{
  id v6;
  id v7;
  NSMutableSet *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  NSMutableSet *v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = self->_activeUploadStageIDs;
  objc_sync_enter(v8);
  if ((-[NSMutableSet containsObject:](self->_activeUploadStageIDs, "containsObject:", v6) & 1) != 0)
  {
    objc_sync_exit(v8);
  }
  else
  {
    -[NSMutableSet addObject:](self->_activeUploadStageIDs, "addObject:", v6);
    objc_sync_exit(v8);

    objc_msgSend(v7, "completionBlock");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __57__BRCStageRegistry_associateSyncUpStageID_withOperation___block_invoke;
    v10[3] = &unk_1E8763968;
    objc_copyWeak(&v13, &location);
    v8 = v9;
    v12 = v8;
    v11 = v6;
    objc_msgSend(v7, "setCompletionBlock:", v10);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

}

void __57__BRCStageRegistry_associateSyncUpStageID_withOperation___block_invoke(uint64_t a1)
{
  void *v2;
  id *WeakRetained;
  id *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;

  v2 = (void *)MEMORY[0x1D17A6BE8]();
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained[22];
    objc_sync_enter(v5);
    objc_msgSend(v4[22], "removeObject:", *(_QWORD *)(a1 + 32));
    objc_sync_exit(v5);

    v6 = *(_QWORD *)(a1 + 40);
    if (v6)
      (*(void (**)(void))(v6 + 16))();
    objc_msgSend(v4, "cleanupStagedSyncUpWithID:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
      (*(void (**)(void))(v7 + 16))();
  }

  objc_autoreleasePoolPop(v2);
}

- (id)_anchorNamePrefixForRecordZoneID:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x1E0D10E88];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithRecordZoneID:", v4);

  objc_msgSend(v5, "mangledIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingString:", CFSTR(":"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_anchorNameForChangeToken:(id)a3 recordZoneID:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v6 = a3;
  -[BRCStageRegistry _anchorNamePrefixForRecordZoneID:](self, "_anchorNamePrefixForRecordZoneID:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "hash");

  objc_msgSend(v7, "stringByAppendingFormat:", CFSTR("%llx"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_anchorNameForRecordID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v3 = a3;
  objc_msgSend(v3, "recordName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "zoneID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "zoneName");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "zoneID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ownerName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0C94730]);

  if ((v6 & 1) == 0)
  {
    objc_msgSend(v3, "zoneID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "ownerName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingFormat:", CFSTR(":%@"), v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v12;
  }
  objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR(":"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)pendingListRecordDirWithStartingChangeToken:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[BRCStageRegistry _anchorNameForRecordID:](self, "_anchorNameForRecordID:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString stringByAppendingPathComponent:](self->_stageDirectoryPath[7], "stringByAppendingPathComponent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)pendingDeltaFetchRecordDirWithStartingChangeToken:(id)a3 recordZoneID:(id)a4
{
  void *v5;
  void *v6;
  void *v7;

  -[BRCStageRegistry _anchorNameForChangeToken:recordZoneID:](self, "_anchorNameForChangeToken:recordZoneID:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NSString stringByAppendingPathComponent:](self->_stageDirectoryPath[6], "stringByAppendingPathComponent:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v6, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)createURLForUploadWithStageID:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __55__BRCStageRegistry_createURLForUploadWithStageID_name___block_invoke;
  v12[3] = &unk_1E875EF40;
  v13 = v6;
  v7 = v6;
  v8 = a4;
  -[BRCStageRegistry _performInStageDirectory:block:](self, "_performInStageDirectory:block:", 5, v12);
  -[NSString stringByAppendingFormat:](self->_stageDirectoryPath[5], "stringByAppendingFormat:", CFSTR("/%@/%@"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __55__BRCStageRegistry_createURLForUploadWithStageID_name___block_invoke(uint64_t a1, int a2)
{
  BRCMkdirAt(a2, *(void **)(a1 + 32), 448);
  return 0;
}

- (id)createURLForThumbnailUploadWithStageID:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), self->_stageDirectoryPath[8], a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)pendingFetchRecordDirExistsInStageWithStartingChangeToken:(id)a3 recordZoneID:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v10;
  NSObject *v11;

  -[BRCStageRegistry _anchorNameForChangeToken:recordZoneID:](self, "_anchorNameForChangeToken:recordZoneID:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString stringByAppendingPathComponent:](self->_stageDirectoryPath[6], "stringByAppendingPathComponent:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_stageDirectoryPath[6])
  {
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[BRCStageRegistry pendingFetchRecordDirExistsInStageWithStartingChangeToken:recordZoneID:].cold.1();

  }
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "checkResourceIsReachableAndReturnError:", 0);

  return v8;
}

- (void)cleanupStagedSyncUpWithID:(id)a3
{
  void *v4;
  id v5;

  -[NSString stringByAppendingPathComponent:](self->_stageDirectoryPath[5], "stringByAppendingPathComponent:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[BRCAccountSession diskReclaimer](self->_session, "diskReclaimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "renameAndUnlinkInBackgroundItemAt:path:", 0xFFFFFFFFLL, v5);

}

- (void)cleanupStagedUploadWithID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  -[NSString stringByAppendingPathComponent:](self->_stageDirectoryPath[5], "stringByAppendingPathComponent:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C99E98];
  v9[0] = v4;
  v9[1] = CFSTR("ckpackage");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fileURLWithPathComponents:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C94FC8], "destroyAnchorAndPackageAnchoredAtURL:", v7);
  -[BRCAccountSession diskReclaimer](self->_session, "diskReclaimer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "renameAndUnlinkInBackgroundItemAt:path:", 0xFFFFFFFFLL, v4);

}

- (id)createURLForDownloadWithStageID:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __57__BRCStageRegistry_createURLForDownloadWithStageID_name___block_invoke;
  v12[3] = &unk_1E875EF40;
  v13 = v6;
  v7 = v6;
  v8 = a4;
  -[BRCStageRegistry _performInStageDirectory:block:](self, "_performInStageDirectory:block:", 4, v12);
  -[NSString stringByAppendingFormat:](self->_stageDirectoryPath[4], "stringByAppendingFormat:", CFSTR("/%@/%@"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __57__BRCStageRegistry_createURLForDownloadWithStageID_name___block_invoke(uint64_t a1, int a2)
{
  BRCMkdirAt(a2, *(void **)(a1 + 32), 448);
  return 0;
}

- (BOOL)rememberStagedDownloadWithID:(id)a3 gatherFileID:(unint64_t *)a4 generationID:(unsigned int *)a5 documentID:(unsigned int *)a6 appLibrary:(id)a7 error:(id *)a8
{
  id v13;
  id v14;
  int v15;
  NSMutableSet *unflushedStagedFileIDs;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void *v26;
  id v27;
  unint64_t *v28;
  unsigned int *v29;
  unsigned int *v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v23 = MEMORY[0x1E0C809B0];
  v24 = 3221225472;
  v25 = __103__BRCStageRegistry_rememberStagedDownloadWithID_gatherFileID_generationID_documentID_appLibrary_error___block_invoke;
  v26 = &unk_1E8763990;
  v14 = v13;
  v27 = v14;
  v28 = a4;
  v29 = a5;
  v30 = a6;
  v15 = -[BRCStageRegistry _performInStageDirectory:block:](self, "_performInStageDirectory:block:", 4, &v23);
  if (v15 < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorFromErrno", v23, v24, v25, v26);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      brc_bread_crumbs();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
      {
        v22 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v32 = "-[BRCStageRegistry rememberStagedDownloadWithID:gatherFileID:generationID:documentID:appLibrary:error:]";
        v33 = 2080;
        if (!a8)
          v22 = "(ignored by caller)";
        v34 = v22;
        v35 = 2112;
        v36 = v18;
        v37 = 2112;
        v38 = v19;
        _os_log_error_impl(&dword_1CBD43000, v20, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a8)
      *a8 = objc_retainAutorelease(v18);

    v17 = v27;
  }
  else
  {

    unflushedStagedFileIDs = self->_unflushedStagedFileIDs;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *a4, v23, v24, v25, v26);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet addObject:](unflushedStagedFileIDs, "addObject:", v17);
  }

  return v15 >= 0;
}

uint64_t __103__BRCStageRegistry_rememberStagedDownloadWithID_gatherFileID_generationID_documentID_appLibrary_error___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  int v14;
  int v15;
  void *v16;
  NSObject *v17;
  _DWORD v19[2];
  __int16 v20;
  id v21;
  __int16 v22;
  int v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "stringByAppendingPathComponent:", CFSTR("item"));
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (const char *)objc_msgSend(v4, "fileSystemRepresentation");
  v11 = BRCOpenAt(a2, v5, 33028, v6, v7, v8, v9, v10, v19[0]);
  if ((v11 & 0x80000000) != 0)
  {
    v15 = *__error();
    brc_bread_crumbs();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, (os_log_type_t)0x90u))
    {
      v19[0] = 67109890;
      v19[1] = a2;
      v20 = 2112;
      v21 = v4;
      v22 = 1024;
      v23 = v15;
      v24 = 2112;
      v25 = v16;
      _os_log_error_impl(&dword_1CBD43000, v17, (os_log_type_t)0x90u, "[ERROR] openat(%d, '%@') failed %{errno}d%@", (uint8_t *)v19, 0x22u);
    }

    *__error() = v15;
    v13 = 0xFFFFFFFFLL;
  }
  else
  {
    v12 = v11;
    v13 = _fstatItem(v11, *(_QWORD **)(a1 + 40), *(_DWORD **)(a1 + 48), *(_DWORD **)(a1 + 56), 0, 0);
    v14 = *__error();
    close(v12);
    *__error() = v14;
  }

  return v13;
}

- (void)cleanupStagedDownloadWithID:(id)a3 forItemID:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  -[NSString stringByAppendingPathComponent:](self->_stageDirectoryPath[4], "stringByAppendingPathComponent:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8
    || !-[BRCStageRegistry _graveyardAt:path:forItemID:](self, "_graveyardAt:path:forItemID:", 0xFFFFFFFFLL, v6, v8))
  {
    -[BRCAccountSession diskReclaimer](self->_session, "diskReclaimer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "renameAndUnlinkInBackgroundItemAt:path:", 0xFFFFFFFFLL, v6);

  }
}

- (BOOL)_graveyardAt:(int)a3 path:(id)a4 forItemID:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  _BOOL4 lowDiskSpace;
  id v11;
  off_t st_size;
  void *v13;
  uint64_t v14;
  char v15;
  void *v16;
  void *v17;
  NSObject *v18;
  _QWORD v20[4];
  id v21;
  BRCStageRegistry *v22;
  id v23;
  int v24;
  stat v25;
  uint8_t buf[4];
  int v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v6 = *(_QWORD *)&a3;
  v32 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  lowDiskSpace = self->_lowDiskSpace;
  memset(&v25, 0, sizeof(v25));
  if (!v9
    || lowDiskSpace
    || (v11 = objc_retainAutorelease(v8),
        !fstatat(v6, (const char *)objc_msgSend(v11, "fileSystemRepresentation"), &v25, 32))
    && (st_size = v25.st_size, (v25.st_size & 0xF000) == 0x8000)
    && (+[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v13, "minFileSizeForGraveyard"),
        v13,
        st_size <= v14))
  {
    brc_bread_crumbs();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109634;
      v27 = v6;
      v28 = 2112;
      v29 = v8;
      v30 = 2112;
      v31 = v17;
      _os_log_debug_impl(&dword_1CBD43000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] deleting (%d, '%@') asynchronously%@", buf, 0x1Cu);
    }

    -[BRCAccountSession diskReclaimer](self->_session, "diskReclaimer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v16, "renameAndUnlinkInBackgroundItemAt:path:", v6, v8);
  }
  else
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __48__BRCStageRegistry__graveyardAt_path_forItemID___block_invoke;
    v20[3] = &unk_1E87639B8;
    v21 = v9;
    v22 = self;
    v24 = v6;
    v23 = v11;
    v15 = -[BRCStageRegistry _performInStageDirectory:block:](self, "_performInStageDirectory:block:", 3, v20) == 0;

    v16 = v21;
  }

  return v15;
}

uint64_t __48__BRCStageRegistry__graveyardAt_path_forItemID___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  int v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  int v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  int v19;
  int v20;
  _BYTE v21[14];
  __int16 v22;
  _BYTE v23[20];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "itemIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "diskReclaimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "renameAndUnlinkInBackgroundItemAt:path:", a2, v4);

  if ((BRCRenameAt(*(_DWORD *)(a1 + 56), *(void **)(a1 + 48), a2, v4, 0) & 0x80000000) != 0)
  {
    brc_bread_crumbs();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v17 = *(_DWORD *)(a1 + 56);
      v18 = *(_QWORD *)(a1 + 48);
      v19 = *__error();
      v20 = 67110402;
      *(_DWORD *)v21 = v17;
      *(_WORD *)&v21[4] = 2112;
      *(_QWORD *)&v21[6] = v18;
      v22 = 1024;
      *(_DWORD *)v23 = a2;
      *(_WORD *)&v23[4] = 2112;
      *(_QWORD *)&v23[6] = v4;
      *(_WORD *)&v23[14] = 1024;
      *(_DWORD *)&v23[16] = v19;
      LOWORD(v24[0]) = 2112;
      *(_QWORD *)((char *)v24 + 2) = v6;
      _os_log_debug_impl(&dword_1CBD43000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] renameat(%d, '%@', %d, '%@') failed %{errno}d%@", (uint8_t *)&v20, 0x32u);
    }
    v12 = 0xFFFFFFFFLL;
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "stringByAppendingPathComponent:", v4);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    if (chflags((const char *)objc_msgSend(v6, "fileSystemRepresentation"), 0) < 0)
    {
      v7 = *__error();
      brc_bread_crumbs();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, (os_log_type_t)0x90u))
      {
        v20 = 138412802;
        *(_QWORD *)v21 = v6;
        *(_WORD *)&v21[8] = 1024;
        *(_DWORD *)&v21[10] = v7;
        v22 = 2112;
        *(_QWORD *)v23 = v8;
        _os_log_error_impl(&dword_1CBD43000, v9, (os_log_type_t)0x90u, "[ERROR] failed removing documentID for %@ %{errno}d%@", (uint8_t *)&v20, 0x1Cu);
      }

      *__error() = v7;
    }
    brc_bread_crumbs();
    v10 = objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v14 = *(_DWORD *)(a1 + 56);
      v15 = *(_QWORD *)(a1 + 48);
      v16 = *(_QWORD *)(a1 + 32);
      v20 = 67110146;
      *(_DWORD *)v21 = v14;
      *(_WORD *)&v21[4] = 2112;
      *(_QWORD *)&v21[6] = v15;
      v22 = 2112;
      *(_QWORD *)v23 = v6;
      *(_WORD *)&v23[8] = 2112;
      *(_QWORD *)&v23[10] = v16;
      *(_WORD *)&v23[18] = 2112;
      v24[0] = v10;
      _os_log_debug_impl(&dword_1CBD43000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] moved (%d, '%@') to the graveyard at '%@' for %@%@", (uint8_t *)&v20, 0x30u);
    }

    v12 = 0;
  }

  return v12;
}

- (BOOL)moveFromStageToGraveyard:(unint64_t)a3 forItemID:(id)a4
{
  id v6;
  void *v7;
  BOOL v8;
  BOOL v9;
  unsigned __int8 v11;

  v6 = a4;
  v11 = 0;
  -[BRCStageRegistry _pathInStage:index:generationID:](self, "_pathInStage:index:generationID:", a3, &v11, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7
    && (v11 <= 4u ? (v8 = ((1 << v11) & 0x15) == 0) : (v8 = 1), !v8)
    && -[BRCStageRegistry _graveyardAt:path:forItemID:](self, "_graveyardAt:path:forItemID:", 0xFFFFFFFFLL, v7, v6);

  return v9;
}

- (BOOL)existsInStage:(unint64_t)a3 generationID:(unsigned int *)a4
{
  void *v5;
  BOOL v6;
  void *v7;
  NSObject *v8;
  char v10;

  v10 = 0;
  if (!a3)
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[BRCStageRegistry existsInStage:generationID:].cold.1();

    if (a4)
    {
      v6 = 0;
      *a4 = 0;
      return v6;
    }
    return 0;
  }
  -[BRCStageRegistry _pathInStage:index:generationID:](self, "_pathInStage:index:generationID:", a3, &v10, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    return 0;
  v6 = (v10 & 0xFB) == 0;

  return v6;
}

- (int64_t)_purgeSpaceUnderQueue:(int64_t)a3 withUrgency:(int)a4
{
  uint64_t v4;
  int64_t v7;
  void *v8;
  BOOL v9;

  v4 = *(_QWORD *)&a4;
  v7 = -[BRCStageRegistry garbageCollectSpace:](self, "garbageCollectSpace:");
  if (v7 < a3 && (int)v4 <= 4)
  {
    do
    {
      v8 = (void *)MEMORY[0x1D17A6BE8]();
      v7 += -[BRCStageRegistry purgeGraveyardSpace:withUrgency:](self, "purgeGraveyardSpace:withUrgency:", a3 - v7, v4);
      objc_autoreleasePoolPop(v8);
      if ((_DWORD)v4 == -2)
        break;
      if (v7 >= a3)
        break;
      v9 = (int)v4 <= 3;
      v4 = (v4 + 1);
    }
    while (v9);
  }
  return v7;
}

- (int64_t)purgeSpace:(int64_t)a3 withUrgency:(int)a4
{
  NSObject *queue;
  int64_t v5;
  _QWORD v7[7];
  int v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__BRCStageRegistry_purgeSpace_withUrgency___block_invoke;
  v7[3] = &unk_1E87639E0;
  v7[4] = self;
  v7[5] = &v9;
  v7[6] = a3;
  v8 = a4;
  dispatch_sync(queue, v7);
  v5 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v5;
}

uint64_t __43__BRCStageRegistry_purgeSpace_withUrgency___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_purgeSpaceUnderQueue:withUrgency:", *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 56));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)lowDiskStatusChangedForDevice:(int)a3 hasEnoughSpace:(BOOL)a4
{
  OS_dispatch_queue *queue;
  brc_task_tracker *tracker;
  _QWORD v6[5];

  if (a4)
  {
    self->_lowDiskSpace = 0;
  }
  else if (!self->_lowDiskSpace)
  {
    self->_lowDiskSpace = 1;
    queue = self->_queue;
    tracker = self->_tracker;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __65__BRCStageRegistry_lowDiskStatusChangedForDevice_hasEnoughSpace___block_invoke;
    v6[3] = &unk_1E875D500;
    v6[4] = self;
    brc_task_tracker_async_with_logs(tracker, queue, v6, 0);
  }
}

uint64_t __65__BRCStageRegistry_lowDiskStatusChangedForDevice_hasEnoughSpace___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;

  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __65__BRCStageRegistry_lowDiskStatusChangedForDevice_hasEnoughSpace___block_invoke_cold_1();

  return objc_msgSend(*(id *)(a1 + 32), "_purgeSpaceUnderQueue:withUrgency:", 0x7FFFFFFFFFFFFFFFLL, 3);
}

- (int64_t)purgableSpace
{
  NSString *v2;
  FTS *v3;
  FTS *v4;
  FTSENT *v5;
  FTSENT *v6;
  int64_t v7;
  off_t st_size;
  void *v9;
  NSObject *v10;
  int v11;
  void *v12;
  NSObject *v13;
  char *fts_path;
  off_t value;
  uint8_t buf[4];
  char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  char *v23[3];

  v23[2] = *(char **)MEMORY[0x1E0C80C00];
  v2 = objc_retainAutorelease(self->_stageDirectoryPath[3]);
  v23[0] = (char *)-[NSString fileSystemRepresentation](v2, "fileSystemRepresentation");
  v23[1] = 0;
  v3 = fts_open(v23, 16, 0);
  value = 0;
  if (v3)
  {
    v4 = v3;
    v5 = fts_read(v3);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      do
      {
        switch(v6->fts_info)
        {
          case 1u:
            if (v6->fts_level == 1)
            {
              if (getxattr(v6->fts_path, "com.apple.bird.graveyard.size#N", &value, 8uLL, 0, 0) == 8)
              {
                v7 += value;
                fts_set(v4, v6, 4);
              }
              else
              {
                value = 0;
              }
            }
            break;
          case 6u:
            if (v6->fts_level != 1)
              break;
            setxattr(v6->fts_path, "com.apple.bird.graveyard.size#N", &value, 8uLL, 0, 0);
            st_size = value;
LABEL_11:
            v7 += st_size;
            break;
          case 7u:
          case 0xAu:
            v11 = *__error();
            brc_bread_crumbs();
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, (os_log_type_t)0x90u))
            {
              fts_path = v6->fts_path;
              *(_DWORD *)buf = 136315650;
              v18 = fts_path;
              v19 = 1024;
              v20 = v11;
              v21 = 2112;
              v22 = v12;
              _os_log_error_impl(&dword_1CBD43000, v13, (os_log_type_t)0x90u, "[ERROR] fts_read() failed for path %s %{errno}d%@", buf, 0x1Cu);
            }

            *__error() = v11;
            goto LABEL_23;
          case 8u:
            st_size = v6->fts_statp->st_size;
            if (v6->fts_level == 1)
              goto LABEL_11;
            value += st_size;
            break;
          default:
            break;
        }
        v6 = fts_read(v4);
      }
      while (v6);
    }
    else
    {
      v7 = 0;
    }
LABEL_23:
    fts_close(v4);
  }
  else
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, (os_log_type_t)0x90u))
      -[BRCStageRegistry purgableSpace].cold.1((uint64_t)v2, (uint64_t)v9, v10);

    v7 = 0;
  }

  return v7;
}

- (int64_t)purgeGraveyardSpace:(int64_t)a3 withUrgency:(int)a4
{
  NSString *v6;
  time_t v7;
  uint64_t v8;
  void *v9;
  double v10;
  NSString *v11;
  void *v12;
  NSObject *v13;
  int64_t v14;
  _QWORD v16[4];
  NSString *v17;
  uint64_t *v18;
  int64_t v19;
  time_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[3];

  v6 = self->_stageDirectoryPath[3];
  v22 = 0;
  v23[0] = &v22;
  v23[1] = 0x2020000000;
  v23[2] = 0;
  v7 = time(0);
  v8 = 0;
  switch(a4)
  {
    case -2:
    case 1:
      +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "graveyardAgeDeltaInLowUrgency");
      goto LABEL_5;
    case 2:
      +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "graveyardAgeDeltaInMedUrgency");
LABEL_5:
      v8 = (uint64_t)v10;

      break;
    case 3:
    case 4:
      v8 = 0x8000000000000000;
      break;
    default:
      break;
  }
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __52__BRCStageRegistry_purgeGraveyardSpace_withUrgency___block_invoke;
  v16[3] = &unk_1E8763A08;
  v11 = v6;
  v17 = v11;
  v18 = &v22;
  v19 = a3;
  v20 = v7;
  v21 = v8;
  BRCRemoveFolderInAutoreleasepool(v11, v16, 1, 0);
  brc_bread_crumbs();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[BRCStageRegistry purgeGraveyardSpace:withUrgency:].cold.1((uint64_t)v23);

  v14 = *(_QWORD *)(v23[0] + 24);
  _Block_object_dispose(&v22, 8);

  return v14;
}

uint64_t __52__BRCStageRegistry_purgeGraveyardSpace_withUrgency___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  objc_msgSend(MEMORY[0x1E0CB3940], "br_pathWithFileSystemRepresentation:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "br_pathRelativeToPath:", a1[4]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pathComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", a1[4]) & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    v9 = objc_msgSend(v7, "count");
    v10 = *(_QWORD *)(a1[5] + 8);
    v11 = *(_QWORD *)(v10 + 24);
    if (v9 != 1)
      goto LABEL_7;
    if (v11 >= a1[6])
    {
      v8 = 2;
      goto LABEL_9;
    }
    if (a1[7] - *(_QWORD *)(a3 + 48) < a1[8])
    {
      v8 = 1;
    }
    else
    {
LABEL_7:
      v8 = 0;
      *(_QWORD *)(v10 + 24) = v11 + *(_QWORD *)(a3 + 96);
    }
  }
LABEL_9:

  return v8;
}

- (int64_t)_garbageCollectPackages
{
  void *v2;
  _QWORD v4[5];
  _QWORD v5[3];
  char v6;

  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x2020000000;
  v6 = 0;
  objc_msgSend(MEMORY[0x1E0C94FC8], "clientPackageDatabaseDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43__BRCStageRegistry__garbageCollectPackages__block_invoke;
  v4[3] = &unk_1E8763A30;
  v4[4] = v5;
  objc_msgSend(MEMORY[0x1E0C94FC8], "gcPackagesInDirectory:dbInUseBlock:", v2, v4);

  _Block_object_dispose(v5, 8);
  return 0;
}

uint64_t __43__BRCStageRegistry__garbageCollectPackages__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (!v5)
    goto LABEL_12;
  v6 = v5;
  v7 = 0;
  v8 = *(_QWORD *)v15;
  v9 = *MEMORY[0x1E0C95400];
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v15 != v8)
        objc_enumerationMutation(v4);
      objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "objectForKeyedSubscript:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        v7 |= objc_msgSend(MEMORY[0x1E0C94FC8], "anchorExistsForArchiverInfo:", v11);

    }
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  }
  while (v6);
  if ((v7 & 1) != 0)
  {
    v12 = 1;
  }
  else
  {
LABEL_12:
    v12 = 0;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }

  return v12;
}

- (int64_t)_garbageCollectUploads
{
  return -[BRCStageRegistry _garbageCollectUploadsIncludingActiveUploads:](self, "_garbageCollectUploadsIncludingActiveUploads:", 0);
}

- (void)purgeAllUploads
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Purging all uploads and live items%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (BOOL)_hasActiveUploadWithStageID:(id)a3
{
  id v4;
  NSMutableSet *v5;
  char v6;
  BOOL v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v4 = a3;
  v5 = self->_activeUploadStageIDs;
  objc_sync_enter(v5);
  v6 = -[NSMutableSet containsObject:](self->_activeUploadStageIDs, "containsObject:", v4);
  objc_sync_exit(v5);

  if ((v6 & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = 0;
    -[BRCAccountSession clientDB](self->_session, "clientDB");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __48__BRCStageRegistry__hasActiveUploadWithStageID___block_invoke;
    v10[3] = &unk_1E87616B0;
    v11 = v4;
    v12 = &v13;
    objc_msgSend(v8, "performWithFlags:action:", 1, v10);

    v7 = *((_BYTE *)v14 + 24) != 0;
    _Block_object_dispose(&v13, 8);
  }

  return v7;
}

uint64_t __48__BRCStageRegistry__hasActiveUploadWithStageID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;

  v3 = (void *)objc_msgSend(a2, "numberWithSQL:", CFSTR("SELECT 1 FROM client_uploads WHERE transfer_stage = %@"), *(_QWORD *)(a1 + 32));
  if (objc_msgSend(v3, "BOOLValue"))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;

  return 1;
}

- (int64_t)_garbageCollectUploadsIncludingActiveUploads:(BOOL)a3
{
  NSString *v5;
  NSString *v6;
  int64_t v7;
  _QWORD v9[4];
  NSString *v10;
  BRCStageRegistry *v11;
  uint64_t *v12;
  BOOL v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v5 = self->_stageDirectoryPath[5];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__BRCStageRegistry__garbageCollectUploadsIncludingActiveUploads___block_invoke;
  v9[3] = &unk_1E8763A58;
  v6 = v5;
  v13 = a3;
  v10 = v6;
  v11 = self;
  v12 = &v14;
  BRCRemoveFolderInAutoreleasepool(v6, v9, 1, 0);
  v7 = v15[3];

  _Block_object_dispose(&v14, 8);
  return v7;
}

uint64_t __65__BRCStageRegistry__garbageCollectUploadsIncludingActiveUploads___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;

  objc_msgSend(MEMORY[0x1E0CB3940], "br_pathWithFileSystemRepresentation:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "br_pathRelativeToPath:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pathComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 == 1)
  {
    objc_msgSend(v6, "lastPathComponent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!*(_BYTE *)(a1 + 56) && (objc_msgSend(*(id *)(a1 + 40), "_hasActiveUploadWithStageID:", v9) & 1) != 0)
    {

LABEL_8:
      v14 = 1;
      goto LABEL_12;
    }

  }
  objc_msgSend(v6, "lastPathComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("ckpackage"));

  if (v11)
  {
    v12 = (void *)MEMORY[0x1E0C94FC8];
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v5, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "destroyAnchorAndPackageAnchoredAtURL:", v13);

    goto LABEL_8;
  }
  brc_bread_crumbs();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    __65__BRCStageRegistry__garbageCollectUploadsIncludingActiveUploads___block_invoke_cold_1((uint64_t)v5);

  v14 = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += *(_QWORD *)(a3 + 96);
LABEL_12:

  return v14;
}

- (int64_t)_garbageCollectFaults
{
  NSString *v3;
  NSString *v4;
  int64_t v5;
  _QWORD v7[4];
  NSString *v8;
  BRCStageRegistry *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v3 = self->_stageDirectoryPath[0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__BRCStageRegistry__garbageCollectFaults__block_invoke;
  v7[3] = &unk_1E8763AA8;
  v4 = v3;
  v8 = v4;
  v9 = self;
  v10 = &v11;
  BRCRemoveFolderInAutoreleasepool(v4, v7, 1, 0);
  v5 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v5;
}

uint64_t __41__BRCStageRegistry__garbageCollectFaults__block_invoke(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;

  if (!strcmp((const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "fileSystemRepresentation"), a2))
    return 0;
  if (!a3)
    return 1;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "clientDB");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __41__BRCStageRegistry__garbageCollectFaults__block_invoke_2;
  v10[3] = &unk_1E8763A80;
  v10[4] = &v11;
  v10[5] = a3;
  objc_msgSend(v5, "performWithFlags:action:", 1, v10);

  v6 = *((unsigned int *)v12 + 6);
  if (!(_DWORD)v6)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += *(_QWORD *)(a3 + 96);
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __41__BRCStageRegistry__garbageCollectFaults__block_invoke_cold_1(a3);

    v6 = *((unsigned int *)v12 + 6);
  }
  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __41__BRCStageRegistry__garbageCollectFaults__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;

  v3 = (void *)objc_msgSend(a2, "numberWithSQL:", CFSTR("SELECT 1 FROM client_items WHERE item_staged_file_id = %lld"), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8));

  if (v3)
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return 0;
}

- (int64_t)_garbageCollectDownloads
{
  NSString *v3;
  NSString *v4;
  int64_t v5;
  _QWORD v7[4];
  NSString *v8;
  BRCStageRegistry *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v3 = self->_stageDirectoryPath[4];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__BRCStageRegistry__garbageCollectDownloads__block_invoke;
  v7[3] = &unk_1E8763AA8;
  v4 = v3;
  v8 = v4;
  v9 = self;
  v10 = &v11;
  BRCRemoveFolderInAutoreleasepool(v4, v7, 1, 0);
  v5 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v5;
}

uint64_t __44__BRCStageRegistry__garbageCollectDownloads__block_invoke(_QWORD *a1, uint64_t a2, int *a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  char v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  int v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  int v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  int v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "br_pathWithFileSystemRepresentation:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "br_pathRelativeToPath:", a1[4]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pathComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 == 1)
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x2020000000;
    v26 = 0;
    v9 = v6;
    v10 = *(id *)(a1[5] + 184);
    objc_sync_enter(v10);
    v11 = objc_msgSend(*(id *)(a1[5] + 184), "containsObject:", v9);
    objc_sync_exit(v10);

    if ((v11 & 1) != 0)
    {
      v12 = 1;
    }
    else
    {
      objc_msgSend(*(id *)(a1[5] + 8), "clientDB");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __44__BRCStageRegistry__garbageCollectDownloads__block_invoke_2;
      v20[3] = &unk_1E87616B0;
      v14 = v9;
      v21 = v14;
      v22 = &v23;
      objc_msgSend(v13, "performWithFlags:action:", 1, v20);

      v12 = *((unsigned int *)v24 + 6);
      if (!(_DWORD)v12)
      {
        brc_bread_crumbs();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          v18 = *a3;
          v19 = *((_QWORD *)a3 + 1);
          *(_DWORD *)buf = 138413058;
          v28 = v14;
          v29 = 1024;
          v30 = v18;
          v31 = 2048;
          v32 = v19;
          v33 = 2112;
          v34 = v15;
          _os_log_debug_impl(&dword_1CBD43000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] removing staged file for download: %@ device:%d ino:%lld%@", buf, 0x26u);
        }

        v12 = *((unsigned int *)v24 + 6);
      }

    }
    _Block_object_dispose(&v23, 8);
  }
  else
  {
    v12 = 0;
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) += *((_QWORD *)a3 + 12);
  }

  return v12;
}

uint64_t __44__BRCStageRegistry__garbageCollectDownloads__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;

  v3 = (void *)objc_msgSend(a2, "numberWithSQL:", CFSTR("SELECT 1 FROM client_downloads WHERE transfer_stage = %@"), *(_QWORD *)(a1 + 32));
  if (objc_msgSend(v3, "BOOLValue"))
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;

  return 1;
}

- (int64_t)_garbageCollectDeltaSyncDatabases
{
  void *v3;
  void *v4;
  id v5;
  int64_t v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v3 = (void *)objc_opt_new();
  -[BRCAccountSession serverDB](self->_session, "serverDB");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__BRCStageRegistry__garbageCollectDeltaSyncDatabases__block_invoke;
  v8[3] = &unk_1E87635A0;
  v8[4] = self;
  v5 = v3;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(v4, "performWithFlags:action:", 1, v8);

  v6 = v12[3];
  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __53__BRCStageRegistry__garbageCollectDeltaSyncDatabases__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;
  _QWORD v15[5];
  id v16;

  v2 = MEMORY[0x1E0C809B0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = *(void **)(v3 + 8);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __53__BRCStageRegistry__garbageCollectDeltaSyncDatabases__block_invoke_2;
  v15[3] = &unk_1E87638B0;
  v15[4] = v3;
  v16 = v4;
  objc_msgSend(v5, "enumerateServerZones:", v15);
  v6 = *(id *)(*(_QWORD *)(a1 + 32) + 64);
  v11[0] = v2;
  v11[1] = 3221225472;
  v11[2] = __53__BRCStageRegistry__garbageCollectDeltaSyncDatabases__block_invoke_3;
  v11[3] = &unk_1E8763AA8;
  v12 = v6;
  v7 = *(id *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v13 = v7;
  v14 = v8;
  v9 = v6;
  BRCRemoveFolderInAutoreleasepool(v9, v11, 1, 0);

  return 1;
}

uint64_t __53__BRCStageRegistry__garbageCollectDeltaSyncDatabases__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "changeState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "changeToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "zoneID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "_anchorNameForChangeToken:recordZoneID:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);
  return 1;
}

uint64_t __53__BRCStageRegistry__garbageCollectDeltaSyncDatabases__block_invoke_3(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  if (!a3)
    return 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "br_pathWithFileSystemRepresentation:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "br_pathRelativeToPath:", a1[4]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pathComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count") == 1
    && (v8 = (void *)a1[5],
        objc_msgSend(v7, "objectAtIndexedSubscript:", 0),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        LOBYTE(v8) = objc_msgSend(v8, "containsObject:", v9),
        v9,
        (v8 & 1) != 0))
  {
    v10 = 1;
  }
  else
  {
    v10 = 0;
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) += *(_QWORD *)(a3 + 96);
  }

  return v10;
}

- (int64_t)_garbageCollectQBSDatabases
{
  BRCAccountSession *v3;
  void *v4;
  BRCAccountSession *v5;
  int64_t v6;
  _QWORD v8[5];
  BRCAccountSession *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v3 = self->_session;
  -[BRCAccountSession serverDB](v3, "serverDB");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__BRCStageRegistry__garbageCollectQBSDatabases__block_invoke;
  v8[3] = &unk_1E8763AF8;
  v10 = &v11;
  v8[4] = self;
  v5 = v3;
  v9 = v5;
  objc_msgSend(v4, "performWithFlags:action:", 1, v8);

  v6 = v12[3];
  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __47__BRCStageRegistry__garbageCollectQBSDatabases__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__BRCStageRegistry__garbageCollectQBSDatabases__block_invoke_2;
  v4[3] = &unk_1E8763AD0;
  v2 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += objc_msgSend(v2, "_processPendingListDatabaseObjects:", v4);

  return 1;
}

BOOL __47__BRCStageRegistry__garbageCollectQBSDatabases__block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  _BOOL8 v18;
  void *v19;
  NSObject *v20;
  int v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  objc_msgSend(*(id *)(a1 + 32), "serverZoneByName:ownerName:", v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "zoneID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = objc_alloc(MEMORY[0x1E0C95070]);
    objc_msgSend(v9, "zoneID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v11, "initWithRecordName:zoneID:", v7, v12);

    objc_msgSend(v10, "brc_itemIDWithSession:", *(_QWORD *)(a1 + 32));
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v9 && v10 && v13)
    {
      objc_msgSend(v9, "clientZone");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "serverDB");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "serverItemTypeByItemID:db:", v14, v16);

      v18 = (v17 - 9) < 2;
      goto LABEL_10;
    }
  }
  else
  {
    v14 = 0;
  }
  brc_bread_crumbs();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
  {
    v22 = 138412802;
    v23 = v7;
    v24 = 2112;
    v25 = v8;
    v26 = 2112;
    v27 = v19;
    _os_log_fault_impl(&dword_1CBD43000, v20, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Failed to parse record name %@ or zone %@%@", (uint8_t *)&v22, 0x20u);
  }

  v18 = 0;
LABEL_10:

  return v18;
}

- (int64_t)_garbageCollectOldVersions
{
  BRCAccountSession *v3;
  NSString *v4;
  NSString *v5;
  BRCAccountSession *v6;
  int64_t v7;
  _QWORD v9[4];
  NSString *v10;
  BRCAccountSession *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v3 = self->_session;
  v4 = self->_stageDirectoryPath[2];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46__BRCStageRegistry__garbageCollectOldVersions__block_invoke;
  v9[3] = &unk_1E8763AA8;
  v5 = v4;
  v10 = v5;
  v6 = v3;
  v11 = v6;
  v12 = &v13;
  BRCRemoveFolderInAutoreleasepool(v5, v9, 1, 0);
  v7 = v14[3];

  _Block_object_dispose(&v13, 8);
  return v7;
}

uint64_t __46__BRCStageRegistry__garbageCollectOldVersions__block_invoke(uint64_t a1, uint64_t a2, int *a3)
{
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  int v14;
  uint64_t v15;
  unint64_t v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  int v29;
  int v30;
  uint64_t v31;
  int v32;
  int v33;
  int v34;
  _QWORD block[4];
  id v36;
  uint64_t *v37;
  int *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  int v42;
  uint8_t buf[4];
  int v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  int v48;
  __int16 v49;
  int v50;
  __int16 v51;
  int v52;
  __int16 v53;
  int v54;
  __int16 v55;
  int v56;
  __int16 v57;
  int v58;
  __int16 v59;
  int v60;
  __int16 v61;
  int v62;
  __int16 v63;
  int v64;
  __int16 v65;
  int v66;
  __int16 v67;
  int v68;
  __int16 v69;
  int v70;
  __int16 v71;
  int v72;
  __int16 v73;
  uint64_t v74;
  __int16 v75;
  uint64_t v76;
  __int16 v77;
  uint64_t v78;
  __int16 v79;
  uint64_t v80;
  __int16 v81;
  int v82;
  __int16 v83;
  void *v84;
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "br_pathWithFileSystemRepresentation:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "br_pathRelativeToPath:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pathComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count") == 1)
  {
    v39 = 0;
    v40 = &v39;
    v41 = 0x2020000000;
    v42 = 0;
    objc_msgSend(*(id *)(a1 + 40), "clientTruthWorkloop");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__BRCStageRegistry__garbageCollectOldVersions__block_invoke_2;
    block[3] = &unk_1E875FD98;
    v9 = *(id *)(a1 + 40);
    v37 = &v39;
    v38 = a3;
    v36 = v9;
    dispatch_async_and_wait(v8, block);

    v10 = *((unsigned int *)v40 + 6);
    if (!(_DWORD)v10)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += *((_QWORD *)a3 + 12);
      brc_bread_crumbs();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        v14 = *a3;
        v15 = *((_QWORD *)a3 + 1);
        v16 = *((unsigned __int16 *)a3 + 2);
        v17 = aPcDBLSW[v16 >> 12];
        if ((v16 & 0x100) != 0)
          v18 = 114;
        else
          v18 = 45;
        v19 = *((unsigned __int16 *)a3 + 3);
        if ((v16 & 0x80) != 0)
          v20 = 119;
        else
          v20 = 45;
        v21 = a3[4];
        v22 = a3[5];
        if ((v16 & 0x40) != 0)
          v23 = 120;
        else
          v23 = 45;
        v24 = *((_QWORD *)a3 + 4);
        if ((v16 & 0x20) != 0)
          v25 = 114;
        else
          v25 = 45;
        v26 = *((_QWORD *)a3 + 6);
        if ((v16 & 0x10) != 0)
          v27 = 119;
        else
          v27 = 45;
        v28 = *((_QWORD *)a3 + 8);
        if ((v16 & 8) != 0)
          v29 = 120;
        else
          v29 = 45;
        if ((v16 & 4) != 0)
          v30 = 114;
        else
          v30 = 45;
        v31 = *((_QWORD *)a3 + 12);
        if ((v16 & 2) != 0)
          v32 = 119;
        else
          v32 = 45;
        v33 = a3[29];
        *(_DWORD *)buf = 67114242;
        if ((v16 & 1) != 0)
          v34 = 120;
        else
          v34 = 45;
        v44 = v14;
        v45 = 2048;
        v46 = v15;
        v47 = 1024;
        v48 = v17;
        v49 = 1024;
        v50 = v18;
        v51 = 1024;
        v52 = v20;
        v53 = 1024;
        v54 = v23;
        v55 = 1024;
        v56 = v25;
        v57 = 1024;
        v58 = v27;
        v59 = 1024;
        v60 = v29;
        v61 = 1024;
        v62 = v30;
        v63 = 1024;
        v64 = v32;
        v65 = 1024;
        v66 = v34;
        v67 = 1024;
        v68 = v19;
        v69 = 1024;
        v70 = v21;
        v71 = 1024;
        v72 = v22;
        v73 = 2048;
        v74 = v24;
        v75 = 2048;
        v76 = v26;
        v77 = 2048;
        v78 = v28;
        v79 = 2048;
        v80 = v31;
        v81 = 1024;
        v82 = v33;
        v83 = 2112;
        v84 = v11;
        _os_log_debug_impl(&dword_1CBD43000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] removing deviceID:%u fileID:%llu mode:%c%c%c%c%c%c%c%c%c%c nlink:%u uid:%u gid:%u atime:%lu mtime:%lu ctime:%lu size:%llu flags:0x%x%@", buf, 0x98u);
      }

      v10 = *((unsigned int *)v40 + 6);
    }

    _Block_object_dispose(&v39, 8);
  }
  else
  {
    v10 = 0;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += *((_QWORD *)a3 + 12);
  }

  return v10;
}

uint64_t __46__BRCStageRegistry__garbageCollectOldVersions__block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v3[4];
  __int128 v4;

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __46__BRCStageRegistry__garbageCollectOldVersions__block_invoke_3;
  v3[3] = &unk_1E8763B20;
  v4 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(v1, "enumeratePrivateServerZones:", v3);
}

BOOL __46__BRCStageRegistry__garbageCollectOldVersions__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "clientZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemByFileID:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return v4 == 0;
}

- (unint64_t)_processPendingListDatabaseObjects:(id)a3
{
  id v4;
  NSString *v5;
  NSString *v6;
  id v7;
  unint64_t v8;
  _QWORD v10[4];
  NSString *v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v5 = self->_stageDirectoryPath[7];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __55__BRCStageRegistry__processPendingListDatabaseObjects___block_invoke;
  v10[3] = &unk_1E8763B48;
  v6 = v5;
  v11 = v6;
  v13 = &v14;
  v7 = v4;
  v12 = v7;
  BRCRemoveFolderInAutoreleasepool(v6, v10, 1, 0);
  v8 = v15[3];

  _Block_object_dispose(&v14, 8);
  return v8;
}

uint64_t __55__BRCStageRegistry__processPendingListDatabaseObjects___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v19;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "br_pathWithFileSystemRepresentation:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "br_pathRelativeToPath:", a1[4]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pathComponents");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count") != 1)
    {
      v10 = 0;
      *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) += *(_QWORD *)(a3 + 96);
LABEL_16:

      return v10;
    }
    objc_msgSend(v6, "componentsSeparatedByString:", CFSTR(":"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count") == 3)
    {
      v19 = v5;
      v9 = (id)*MEMORY[0x1E0C94730];
    }
    else
    {
      if (objc_msgSend(v8, "count") != 4)
      {
        brc_bread_crumbs();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
          __55__BRCStageRegistry__processPendingListDatabaseObjects___block_invoke_cold_1((uint64_t)v6);

        v10 = 0;
        *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) += *(_QWORD *)(a3 + 96);
        goto LABEL_15;
      }
      v19 = v5;
      objc_msgSend(v8, "lastObject");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v11 = v9;
    objc_msgSend(v8, "objectAtIndexedSubscript:", 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringByAppendingPathComponent:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (*(uint64_t (**)(void))(a1[5] + 16))();
    if (!(_DWORD)v10)
      *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) += *(_QWORD *)(a3 + 96);

    v5 = v19;
LABEL_15:

    goto LABEL_16;
  }
  return 1;
}

- (void)removeDatabaseObjectsForZone:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSString *v7;
  uint64_t v8;
  id v9;
  NSString *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  NSString *v15;
  id v16;

  v4 = a3;
  objc_msgSend(v4, "zoneID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCStageRegistry _anchorNamePrefixForRecordZoneID:](self, "_anchorNamePrefixForRecordZoneID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = self->_stageDirectoryPath[6];
  v8 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __49__BRCStageRegistry_removeDatabaseObjectsForZone___block_invoke;
  v14[3] = &unk_1E8763B70;
  v15 = v7;
  v16 = v6;
  v9 = v6;
  v10 = v7;
  BRCRemoveFolderInAutoreleasepool(v10, v14, 1, 0);
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __49__BRCStageRegistry_removeDatabaseObjectsForZone___block_invoke_2;
  v12[3] = &unk_1E8763AD0;
  v13 = v4;
  v11 = v4;
  -[BRCStageRegistry _processPendingListDatabaseObjects:](self, "_processPendingListDatabaseObjects:", v12);

}

uint64_t __49__BRCStageRegistry_removeDatabaseObjectsForZone___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;

  if (!a3)
    return 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "br_pathWithFileSystemRepresentation:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "br_pathRelativeToPath:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pathComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "hasPrefix:", *(_QWORD *)(a1 + 40)) & 1) != 0)
  {

    v8 = 0;
  }
  else
  {
    v8 = objc_msgSend(v5, "length") != 0;

  }
  return v8;
}

uint64_t __49__BRCStageRegistry_removeDatabaseObjectsForZone___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;

  v6 = a4;
  v7 = *(void **)(a1 + 32);
  v8 = a3;
  objc_msgSend(v7, "zoneName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_msgSend(v9, "isEqualToString:", v8);

  if ((v7 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "ownerName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (!v10)
      v10 = (void *)*MEMORY[0x1E0C94730];
    v12 = objc_msgSend(v10, "isEqualToString:", v6);

    v13 = v12 ^ 1u;
  }
  else
  {

    v13 = 1;
  }

  return v13;
}

- (BOOL)_hasContentsInPath:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v3, 0, 5, &__block_literal_global_107);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(v3, "br_isParentOfURL:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10) & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

uint64_t __39__BRCStageRegistry__hasContentsInPath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  brc_bread_crumbs();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, (os_log_type_t)0x90u))
  {
    v9 = 138412802;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    _os_log_error_impl(&dword_1CBD43000, v7, (os_log_type_t)0x90u, "[ERROR] Failed checking contents at %@ - %@%@", (uint8_t *)&v9, 0x20u);
  }

  return 1;
}

- (int64_t)_removeUnusedXattrBlobs
{
  time_t v3;
  void *v4;
  double v5;
  double v6;
  BRCAccountSession *v7;
  NSString *v8;
  NSObject *v9;
  const char *v10;
  int64_t v11;
  NSString *v12;
  _QWORD v14[4];
  NSObject *v15;
  BRCAccountSession *v16;
  uint64_t *v17;
  time_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint8_t buf[4];
  NSString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v3 = time(0);
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "xattrAgeDelta");
  v6 = v5;

  v7 = self->_session;
  if (-[BRCStageRegistry _hasContentsInPath:](self, "_hasContentsInPath:", self->_stageDirectoryPath[6]))
  {
    brc_bread_crumbs();
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v8;
      v10 = "[WARNING] Skipping xattr check because we're in the middle of fetching delta change records%@";
LABEL_7:
      _os_log_impl(&dword_1CBD43000, v9, OS_LOG_TYPE_DEFAULT, v10, buf, 0xCu);
    }
  }
  else
  {
    if (!-[BRCStageRegistry _hasContentsInPath:](self, "_hasContentsInPath:", self->_stageDirectoryPath[7]))
    {
      v12 = self->_stageDirectoryPath[9];
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __43__BRCStageRegistry__removeUnusedXattrBlobs__block_invoke;
      v14[3] = &unk_1E8763BB8;
      v8 = v12;
      v15 = v8;
      v18 = v3;
      v19 = (uint64_t)v6;
      v16 = v7;
      v17 = &v20;
      BRCRemoveFolderInAutoreleasepool(v8, v14, 1, 0);
      v11 = v21[3];

      v9 = v15;
      goto LABEL_10;
    }
    brc_bread_crumbs();
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v8;
      v10 = "[WARNING] Skipping xattr check because we're in the middle of fetching item records%@";
      goto LABEL_7;
    }
  }
  v11 = 0;
LABEL_10:

  _Block_object_dispose(&v20, 8);
  return v11;
}

uint64_t __43__BRCStageRegistry__removeUnusedXattrBlobs__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v16;
  NSObject *v17;
  _QWORD block[4];
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "br_pathWithFileSystemRepresentation:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "br_pathRelativeToPath:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pathComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    if (*(_QWORD *)(a1 + 56) - *(_QWORD *)(a3 + 48) >= *(_QWORD *)(a1 + 64))
    {
      if (objc_msgSend(v7, "count") != 1)
      {
        brc_bread_crumbs();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
          __43__BRCStageRegistry__removeUnusedXattrBlobs__block_invoke_cold_1();

      }
      objc_msgSend(v7, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "brc_dataFromHexidecimalString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v22 = 0;
        v23 = &v22;
        v24 = 0x2020000000;
        v25 = 0;
        objc_msgSend(*(id *)(a1 + 40), "clientTruthWorkloop");
        v11 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __43__BRCStageRegistry__removeUnusedXattrBlobs__block_invoke_108;
        block[3] = &unk_1E87615A8;
        v19 = *(id *)(a1 + 40);
        v12 = v10;
        v20 = v12;
        v21 = &v22;
        dispatch_async_and_wait(v11, block);

        if (*((_BYTE *)v23 + 24))
        {
          v8 = 1;
        }
        else
        {
          brc_bread_crumbs();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v27 = v12;
            v28 = 2112;
            v29 = v13;
            _os_log_impl(&dword_1CBD43000, v14, OS_LOG_TYPE_DEFAULT, "[WARNING] Removing unused xattr signature %@%@", buf, 0x16u);
          }

          v8 = 0;
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += *(_QWORD *)(a3 + 96);
        }

        _Block_object_dispose(&v22, 8);
      }
      else
      {
        v8 = 1;
      }

    }
    else
    {
      v8 = 1;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __43__BRCStageRegistry__removeUnusedXattrBlobs__block_invoke_108(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "clientDB");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v2, "numberWithSQL:", CFSTR("SELECT EXISTS (SELECT 1 FROM client_pkg_items WHERE xattrs = %@)"), *(_QWORD *)(a1 + 40));

  if ((objc_msgSend(v8, "BOOLValue") & 1) != 0)
  {
    v3 = v8;
LABEL_6:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 32), "clientDB");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "numberWithSQL:", CFSTR("SELECT EXISTS (SELECT 1 FROM client_items WHERE item_xattr_signature = %@ OR version_xattr_signature = %@ LIMIT 1)"), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 40));

  if ((objc_msgSend(v5, "BOOLValue") & 1) != 0)
  {
    v3 = v5;
    goto LABEL_6;
  }
  objc_msgSend(*(id *)(a1 + 32), "clientDB");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v6, "numberWithSQL:", CFSTR("SELECT EXISTS (SELECT 1 FROM server_items WHERE item_xattr_signature = %@ OR version_xattr_signature = %@ LIMIT 1)"), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 40));

  v7 = objc_msgSend(v9, "BOOLValue");
  v3 = v9;
  if (v7)
    goto LABEL_6;
LABEL_7:

}

- (int64_t)_garbageCollectUploadThumbnailsIncludingActiveUploads:(BOOL)a3
{
  void *v5;
  NSObject *v6;
  NSString *v7;
  NSString *v8;
  int64_t v9;
  _QWORD v11[4];
  NSString *v12;
  BRCStageRegistry *v13;
  _QWORD *v14;
  uint64_t *v15;
  BOOL v16;
  _QWORD v17[3];
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[BRCStageRegistry _garbageCollectUploadThumbnailsIncludingActiveUploads:].cold.1(a3);

  v7 = self->_stageDirectoryPath[8];
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v18 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __74__BRCStageRegistry__garbageCollectUploadThumbnailsIncludingActiveUploads___block_invoke;
  v11[3] = &unk_1E8763BE0;
  v14 = v17;
  v8 = v7;
  v16 = a3;
  v12 = v8;
  v13 = self;
  v15 = &v19;
  BRCRemoveFolderInAutoreleasepool(v8, v11, 1, 0);
  v9 = v20[3];

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(&v19, 8);

  return v9;
}

uint64_t __74__BRCStageRegistry__garbageCollectUploadThumbnailsIncludingActiveUploads___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  int v7;
  uint64_t result;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char v14;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

    if (v7)
    {
      result = 0;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      return result;
    }
  }
  if (!a3)
    return 1;
  if (!*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "br_pathWithFileSystemRepresentation:", a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "br_pathRelativeToPath:", *(_QWORD *)(a1 + 32));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pathComponents");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    if (v12 == 1)
    {
      objc_msgSend(v10, "lastPathComponent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(*(id *)(a1 + 40), "_hasActiveUploadWithStageID:", v13);

      if ((v14 & 1) != 0)
      {

        return 1;
      }
    }

  }
  result = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) += *(_QWORD *)(a3 + 96);
  return result;
}

- (int64_t)_garbageCollectSpace:(int64_t)a3
{
  int64_t v5;
  int64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  int64_t v10;
  int64_t v11;
  int64_t v12;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = -[BRCStageRegistry _garbageCollectPackages](self, "_garbageCollectPackages");
  v6 = -[BRCStageRegistry _garbageCollectUploads](self, "_garbageCollectUploads") + v5;
  v7 = -[BRCStageRegistry _garbageCollectFaults](self, "_garbageCollectFaults");
  v8 = v6 + v7 + -[BRCStageRegistry _garbageCollectDownloads](self, "_garbageCollectDownloads");
  v9 = -[BRCStageRegistry _garbageCollectDeltaSyncDatabases](self, "_garbageCollectDeltaSyncDatabases");
  v10 = v9 + -[BRCStageRegistry _garbageCollectQBSDatabases](self, "_garbageCollectQBSDatabases");
  v11 = v8 + v10 + -[BRCStageRegistry _removeUnusedXattrBlobs](self, "_removeUnusedXattrBlobs");
  v12 = v11
      + -[BRCStageRegistry _garbageCollectUploadThumbnailsIncludingActiveUploads:](self, "_garbageCollectUploadThumbnailsIncludingActiveUploads:", 0);
  if (v12 < a3)
    -[BRCStageRegistry _garbageCollectOldVersions](self, "_garbageCollectOldVersions");
  return v12;
}

- (int64_t)garbageCollectSpace:(int64_t)a3
{
  time_t v5;
  void *v6;
  NSObject *v7;
  int64_t v8;

  v5 = time(0);
  brc_bread_crumbs();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[BRCStageRegistry garbageCollectSpace:].cold.1((uint64_t)v6, v5, v7);

  v8 = -[BRCStageRegistry _garbageCollectSpace:](self, "_garbageCollectSpace:", a3);
  -[BRCStageRegistry _updatePersistedStateWithLatestGCStartTime:](self, "_updatePersistedStateWithLatestGCStartTime:", v5);
  return v8;
}

- (void)_updatePersistedStateWithLatestGCStartTime:(int64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[BRCAccountSession clientTruthWorkloop](self->_session, "clientTruthWorkloop");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__BRCStageRegistry__updatePersistedStateWithLatestGCStartTime___block_invoke;
  v6[3] = &unk_1E875F828;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async_and_wait(v5, v6);

}

void __63__BRCStageRegistry__updatePersistedStateWithLatestGCStartTime___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  BRCStagePersistedState *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __63__BRCStageRegistry__updatePersistedStateWithLatestGCStartTime___block_invoke_cold_1(a1, (uint64_t)v2, v3);

  v4 = -[BRCStagePersistedState initWithLatestGCStartTime:]([BRCStagePersistedState alloc], "initWithLatestGCStartTime:", *(_QWORD *)(a1 + 40));
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 224);
  *(_QWORD *)(v5 + 224) = v4;

  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(v7 + 224);
  objc_msgSend(*(id *)(v7 + 8), "clientState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, CFSTR("stage"));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "clientDB");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "forceBatchStart");

}

+ (void)migrateStageToVersion2_0WithSession:(id)a3
{
  void *v3;
  id v4;

  objc_msgSend(a3, "sessionDirPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("i"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  BRCRemoveFolder(v4, 0, 0, 0);
}

- (void)close
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] closing%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __25__BRCStageRegistry_close__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  +[BRCSystemResourcesManager manager](BRCSystemResourcesManager, "manager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeLowDiskObserver:forDevice:", *(_QWORD *)(a1 + 32), *(unsigned int *)(*(_QWORD *)(a1 + 32) + 256));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 224);
  *(_QWORD *)(v2 + 224) = 0;

}

uint64_t __25__BRCStageRegistry_close__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "forgetWatchedLockedFileIDsForAppLibrary:", 0);
}

- (void)disarmLockedTestTimer
{
  NSObject *lockedTestTimer;
  OS_dispatch_source *v4;

  lockedTestTimer = self->_lockedTestTimer;
  if (lockedTestTimer)
  {
    dispatch_source_cancel(lockedTestTimer);
    v4 = self->_lockedTestTimer;
    self->_lockedTestTimer = 0;

  }
}

- (void)resume
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: minDelta >= 0%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __26__BRCStageRegistry_resume__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 224))
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      __26__BRCStageRegistry_resume__block_invoke_cold_2();

    v2 = *(_QWORD *)(a1 + 32);
  }
  +[BRCPersistedState loadFromClientStateInSession:](BRCStagePersistedState, "loadFromClientStateInSession:", *(_QWORD *)(v2 + 8));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 224);
  *(_QWORD *)(v4 + 224) = v3;

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 224))
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      __26__BRCStageRegistry_resume__block_invoke_cold_1();

  }
}

void __26__BRCStageRegistry_resume__block_invoke_122(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "timeSinceLatestGCStartTime");
  if (v2 <= *(_QWORD *)(a1 + 48))
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v8 = *(_QWORD *)(a1 + 40);
      v9 = 134218498;
      v10 = v2;
      v11 = 2112;
      v12 = v8;
      v13 = 2112;
      v14 = v5;
      _os_log_debug_impl(&dword_1CBD43000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] skipping GC at startup after %lld seconds; %@%@",
        (uint8_t *)&v9,
        0x20u);
    }

  }
  else
  {
    brc_bread_crumbs();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v7 = *(_QWORD *)(a1 + 40);
      v9 = 134218498;
      v10 = v2;
      v11 = 2112;
      v12 = v7;
      v13 = 2112;
      v14 = v3;
      _os_log_debug_impl(&dword_1CBD43000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] running GC at startup after %lld seconds; %@%@",
        (uint8_t *)&v9,
        0x20u);
    }

    objc_msgSend(*(id *)(a1 + 32), "garbageCollectSpace:", 0x7FFFFFFFFFFFFFFFLL);
  }
}

void __26__BRCStageRegistry_resume__block_invoke_128(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  _QWORD *WeakRetained;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  _QWORD block[5];
  id v12;
  uint64_t v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (xpc_activity_should_defer(v3))
    {
      if (xpc_activity_set_state(v3, 3))
        goto LABEL_13;
      brc_bread_crumbs();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v5;
        _os_log_impl(&dword_1CBD43000, v6, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to defer the state%@", buf, 0xCu);
      }

    }
    if (xpc_activity_get_state(v3) == 2)
    {
      v7 = WeakRetained[30];
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __26__BRCStageRegistry_resume__block_invoke_129;
      block[3] = &unk_1E875E038;
      v8 = *(_QWORD *)(a1 + 48);
      block[4] = WeakRetained;
      v13 = v8;
      v12 = *(id *)(a1 + 32);
      dispatch_sync(v7, block);
      if (!xpc_activity_set_state(v3, 5))
      {
        brc_bread_crumbs();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v15 = v9;
          _os_log_impl(&dword_1CBD43000, v10, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to set the xpc state to done%@", buf, 0xCu);
        }

      }
    }
  }
LABEL_13:

}

void __26__BRCStageRegistry_resume__block_invoke_129(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  +[BRCAccountsManager sharedManager](BRCAccountsManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "accountHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "acAccountID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "personaIdentifierForACAccountID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "isEqualToString:", CFSTR("__defaultPersonaID__")))
    v6 = 0;
  else
    v6 = v5;
  v7 = v6;
  v8 = v5;
  if (!v7)
  {
    if (_block_invoke___personaOnceToken_1 != -1)
      dispatch_once(&_block_invoke___personaOnceToken_1, &__block_literal_global_133);
    v8 = (id)_block_invoke___personalPersona_1;
  }
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentPersona");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = 0;
  objc_msgSend(v10, "userPersonaUniqueString");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11 == v8 || (objc_msgSend(v11, "isEqualToString:", v8) & 1) != 0)
  {
    v13 = 0;
    goto LABEL_11;
  }
  if (voucher_process_can_use_arbitrary_personas())
  {
    v30 = 0;
    v19 = (void *)objc_msgSend(v10, "copyCurrentPersonaContextWithError:", &v30);
    v20 = v30;
    v21 = v31;
    v31 = v19;

    if (v20)
    {
      brc_bread_crumbs();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, (os_log_type_t)0x90u))
        -[BRCContainerScheduler syncContextDidBecomeForeground:].cold.1((uint64_t)v20);

    }
    objc_msgSend(v10, "generateAndRestorePersonaContextWithPersonaUniqueString:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      brc_bread_crumbs();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, (os_log_type_t)0x90u))
      {
        *(_DWORD *)buf = 138412802;
        v33 = (uint64_t)v5;
        v34 = 2112;
        v35 = v13;
        v36 = 2112;
        v37 = v24;
        _os_log_error_impl(&dword_1CBD43000, v25, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
      }
LABEL_35:

    }
  }
  else
  {
    if (!v7 && (objc_msgSend(v10, "isDataSeparatedPersona") & 1) == 0)
    {
      brc_bread_crumbs();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        -[_BRCOperation completedWithResult:error:].cold.3();
      v13 = 0;
      goto LABEL_35;
    }
    brc_bread_crumbs();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      -[_BRCOperation completedWithResult:error:].cold.2();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_11:
  v14 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "timeSinceLatestGCStartTime");
  if (v14 >= *(_QWORD *)(a1 + 48))
  {
    brc_bread_crumbs();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v29 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 134218498;
      v33 = v14;
      v34 = 2112;
      v35 = v29;
      v36 = 2112;
      v37 = v17;
      _os_log_debug_impl(&dword_1CBD43000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] running GC in XPC activity after %lld seconds; %@%@",
        buf,
        0x20u);
    }

    objc_msgSend(*(id *)(a1 + 32), "garbageCollectSpace:", 0x7FFFFFFFFFFFFFFFLL);
  }
  else
  {
    brc_bread_crumbs();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v28 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 134218498;
      v33 = v14;
      v34 = 2112;
      v35 = v28;
      v36 = 2112;
      v37 = v15;
      _os_log_debug_impl(&dword_1CBD43000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] skipping GC in XPC activity after %lld seconds; %@%@",
        buf,
        0x20u);
    }

  }
  _BRRestorePersona();

}

void __26__BRCStageRegistry_resume__block_invoke_2()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0DC5F00], "personaAttributesForPersonaType:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userPersonaUniqueString");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_block_invoke___personalPersona_1;
  _block_invoke___personalPersona_1 = v0;

}

- (void)cancel
{
  self->_isCancelled = 1;
  brc_task_tracker_cancel(self->_tracker);
}

+ (unsigned)computeItemModeFromStatInfo:(id)a3 isPackage:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  unsigned int v6;
  unsigned int v7;
  __int16 v8;
  unsigned __int16 v9;

  v4 = a4;
  v5 = a3;
  v6 = objc_msgSend(v5, "type");
  v7 = (v6 < 0xB) & (0x611u >> v6);
  if (objc_msgSend(v5, "type") == 5)
    v8 = -24284;
  else
    v8 = 292;
  if ((v7 & 1) != 0 || v4)
  {
    v9 = v8 | 0x49;
LABEL_12:
    v9 |= 0x92u;
    goto LABEL_13;
  }
  if ((objc_msgSend(v5, "mode") & 2) != 0)
    v9 = v8 | 0x49;
  else
    v9 = v8;
  if ((objc_msgSend(v5, "mode") & 1) != 0)
    goto LABEL_12;
LABEL_13:

  return v9;
}

- (BOOL)saveXattrAtURL:(id)a3 forSignature:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  BOOL v15;
  void *v16;
  char v17;
  id v18;
  void *v19;
  NSObject *v20;
  const char *v22;
  const char *v23;
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (v8)
  {
    -[BRCStageRegistry urlForXattrSignature:](self, "urlForXattrSignature:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "checkResourceIsReachableAndReturnError:", 0) & 1) != 0)
    {
      v10 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 0;
      v17 = objc_msgSend(v16, "moveItemAtURL:toURL:error:", v8, v9, &v24);
      v18 = v24;
      v10 = v24;

      if ((v17 & 1) == 0)
      {
        v10 = v10;
        if (v10)
        {
          brc_bread_crumbs();
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
          {
            v23 = "(passed to caller)";
            *(_DWORD *)buf = 136315906;
            v26 = "-[BRCStageRegistry saveXattrAtURL:forSignature:error:]";
            v27 = 2080;
            if (!a5)
              v23 = "(ignored by caller)";
            v28 = v23;
            v29 = 2112;
            v30 = v10;
            v31 = 2112;
            v32 = v19;
            _os_log_error_impl(&dword_1CBD43000, v20, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
          }

        }
        if (a5)
          objc_storeStrong(a5, v18);

        v15 = 0;
        goto LABEL_19;
      }
    }
    v15 = 1;
  }
  else
  {
    brc_bread_crumbs();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      -[BRCStageRegistry saveXattrAtURL:forSignature:error:].cold.1();

    objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", *MEMORY[0x1E0D10C90], 15, CFSTR("unreachable: Asked to save xattr without url"));
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      brc_bread_crumbs();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, (os_log_type_t)0x90u))
      {
        v22 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v26 = "-[BRCStageRegistry saveXattrAtURL:forSignature:error:]";
        v27 = 2080;
        if (!a5)
          v22 = "(ignored by caller)";
        v28 = v22;
        v29 = 2112;
        v30 = v10;
        v31 = 2112;
        v32 = v13;
        _os_log_error_impl(&dword_1CBD43000, v14, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (!a5)
    {
      v15 = 0;
      goto LABEL_20;
    }
    v10 = v10;
    v15 = 0;
    v9 = *a5;
    *a5 = v10;
  }
LABEL_19:

LABEL_20:
  return v15;
}

- (BOOL)saveXattrBlob:(id)a3 forSignature:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  char v10;
  id v11;
  id v12;
  BOOL v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  char v22;
  id v23;
  char v24;
  char v25;
  void *v26;
  NSObject *v27;
  void *v29;
  NSObject *v30;
  const char *v31;
  const char *v32;
  const char *v33;
  id v34;
  id v35;
  id v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (v8 && a4)
  {
    -[BRCStageRegistry urlForXattrSignature:](self, "urlForXattrSignature:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0;
    v10 = objc_msgSend(v8, "writeToURL:options:error:", v9, 2, &v36);
    v11 = v36;
    v12 = v11;
    if ((v10 & 1) != 0)
    {
LABEL_4:
      v13 = 1;
LABEL_32:

      goto LABEL_33;
    }
    if (objc_msgSend(v11, "br_isCocoaErrorCode:", 516))
    {
      brc_bread_crumbs();
      v18 = (id)objc_claimAutoreleasedReturnValue();
      v13 = 1;
      brc_default_log();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        -[BRCStageRegistry saveXattrBlob:forSignature:error:].cold.1(v9, (uint64_t)v18, v19);
      goto LABEL_30;
    }
    if ((objc_msgSend(v12, "br_isCocoaErrorCode:", 4) & 1) != 0
      || objc_msgSend(v12, "br_isCocoaErrorCode:", 260))
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "URLByDeletingLastPathComponent");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v12;
      v22 = objc_msgSend(v20, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v21, 1, 0, &v35);
      v23 = v35;

      if ((v22 & 1) != 0)
      {

      }
      else
      {
        v24 = objc_msgSend(v23, "br_isCocoaErrorCode:", 516);

        if ((v24 & 1) == 0)
        {
          v18 = v23;
          if (v18)
          {
            brc_bread_crumbs();
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, (os_log_type_t)0x90u))
            {
              v33 = "(passed to caller)";
              *(_DWORD *)buf = 136315906;
              v38 = "-[BRCStageRegistry saveXattrBlob:forSignature:error:]";
              v39 = 2080;
              if (!a5)
                v33 = "(ignored by caller)";
              v40 = v33;
              v41 = 2112;
              v42 = v18;
              v43 = 2112;
              v44 = v29;
              _os_log_error_impl(&dword_1CBD43000, v30, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
            }

          }
          if (a5)
            goto LABEL_29;
          goto LABEL_38;
        }
      }
      v34 = v23;
      v25 = objc_msgSend(v8, "writeToURL:options:error:", v9, 2, &v34);
      v12 = v34;

      if ((v25 & 1) != 0)
        goto LABEL_4;
      if (objc_msgSend(v12, "br_isCocoaErrorCode:", 516))
      {
        brc_bread_crumbs();
        v18 = (id)objc_claimAutoreleasedReturnValue();
        v13 = 1;
        brc_default_log();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          -[BRCStageRegistry saveXattrBlob:forSignature:error:].cold.1(v9, (uint64_t)v18, v19);
        goto LABEL_30;
      }
    }
    v18 = v12;
    if (v18)
    {
      brc_bread_crumbs();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, (os_log_type_t)0x90u))
      {
        v32 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v38 = "-[BRCStageRegistry saveXattrBlob:forSignature:error:]";
        v39 = 2080;
        if (!a5)
          v32 = "(ignored by caller)";
        v40 = v32;
        v41 = 2112;
        v42 = v18;
        v43 = 2112;
        v44 = v26;
        _os_log_error_impl(&dword_1CBD43000, v27, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a5)
    {
LABEL_29:
      v18 = v18;
      v13 = 0;
      v19 = *a5;
      *a5 = v18;
      v12 = v18;
LABEL_30:

LABEL_31:
      goto LABEL_32;
    }
LABEL_38:
    v13 = 0;
    v12 = v18;
    goto LABEL_31;
  }
  brc_bread_crumbs();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    -[BRCStageRegistry saveXattrBlob:forSignature:error:].cold.3();

  objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", *MEMORY[0x1E0D10C90], 15, CFSTR("unreachable: Asked to save xattr without signature or data"));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    brc_bread_crumbs();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, (os_log_type_t)0x90u))
    {
      v31 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v38 = "-[BRCStageRegistry saveXattrBlob:forSignature:error:]";
      v39 = 2080;
      if (!a5)
        v31 = "(ignored by caller)";
      v40 = v31;
      v41 = 2112;
      v42 = v12;
      v43 = 2112;
      v44 = v16;
      _os_log_error_impl(&dword_1CBD43000, v17, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }

  }
  if (a5)
  {
    v12 = v12;
    v13 = 0;
    v9 = *a5;
    *a5 = v12;
    goto LABEL_32;
  }
  v13 = 0;
LABEL_33:

  return v13;
}

- (id)loadXattrBlobForSignature:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  const char *v17;
  const char *v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    -[BRCStageRegistry urlForXattrSignature:](self, "urlForXattrSignature:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v5, 1, &v19);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v19;
    v8 = v19;
    v9 = v8;
    if (!v6)
    {
      v9 = v8;
      if (v9)
      {
        brc_bread_crumbs();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, (os_log_type_t)0x90u))
        {
          v18 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          v21 = "-[BRCStageRegistry loadXattrBlobForSignature:error:]";
          v22 = 2080;
          if (!a4)
            v18 = "(ignored by caller)";
          v23 = v18;
          v24 = 2112;
          v25 = v9;
          v26 = 2112;
          v27 = v10;
          _os_log_error_impl(&dword_1CBD43000, v11, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        }

      }
      if (a4)
        objc_storeStrong(a4, v7);

    }
  }
  else
  {
    brc_bread_crumbs();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[BRCStageRegistry loadXattrBlobForSignature:error:].cold.1();

    objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithDomain:code:description:", *MEMORY[0x1E0D10C90], 15, CFSTR("unreachable: Asked for xattr without signature"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      brc_bread_crumbs();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, (os_log_type_t)0x90u))
      {
        v17 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v21 = "-[BRCStageRegistry loadXattrBlobForSignature:error:]";
        v22 = 2080;
        if (!a4)
          v17 = "(ignored by caller)";
        v23 = v17;
        v24 = 2112;
        v25 = v9;
        v26 = 2112;
        v27 = v14;
        _os_log_error_impl(&dword_1CBD43000, v15, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (!a4)
    {
      v6 = 0;
      goto LABEL_17;
    }
    v9 = v9;
    v6 = 0;
    v5 = *a4;
    *a4 = v9;
  }

LABEL_17:
  return v6;
}

- (id)urlForXattrSignature:(id)a3
{
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;

  if (a3)
  {
    v4 = self->_stageDirectoryPath[9];
    objc_msgSend(a3, "brc_hexadecimalString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSString stringByAppendingPathComponent:](v4, "stringByAppendingPathComponent:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[BRCStageRegistry loadXattrBlobForSignature:error:].cold.1();

    v7 = 0;
  }
  return v7;
}

- (int)deviceID
{
  return self->_deviceID;
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (void).cxx_destruct
{
  uint64_t i;

  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_persistedState, 0);
  objc_storeStrong((id *)&self->_flushingQueue, 0);
  objc_storeStrong((id *)&self->_lockedTestTimer, 0);
  objc_storeStrong((id *)&self->_watchedLockedFileIDs, 0);
  objc_storeStrong((id *)&self->_unflushedStagedFileIDs, 0);
  objc_storeStrong((id *)&self->_activeDownloadStageIDs, 0);
  objc_storeStrong((id *)&self->_activeUploadStageIDs, 0);
  for (i = 88; i != 8; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  objc_storeStrong((id *)&self->_session, 0);
}

- (void)associateDownloadStageID:(id)a3 withOperation:(id)a4
{
  id v6;
  id v7;
  NSMutableSet *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  NSMutableSet *v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = self->_activeDownloadStageIDs;
  objc_sync_enter(v8);
  if ((-[NSMutableSet containsObject:](self->_activeDownloadStageIDs, "containsObject:", v6) & 1) != 0)
  {
    objc_sync_exit(v8);
  }
  else
  {
    -[NSMutableSet addObject:](self->_activeDownloadStageIDs, "addObject:", v6);
    objc_sync_exit(v8);

    objc_msgSend(v7, "completionBlock");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __76__BRCStageRegistry_LegacyAdditions__associateDownloadStageID_withOperation___block_invoke;
    v10[3] = &unk_1E8763968;
    objc_copyWeak(&v13, &location);
    v8 = v9;
    v12 = v8;
    v11 = v6;
    objc_msgSend(v7, "setCompletionBlock:", v10);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

}

void __76__BRCStageRegistry_LegacyAdditions__associateDownloadStageID_withOperation___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id *v7;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v7 = WeakRetained;
    v4 = WeakRetained[23];
    objc_sync_enter(v4);
    objc_msgSend(v7[23], "removeObject:", *(_QWORD *)(a1 + 32));
    objc_sync_exit(v4);

    v5 = *(_QWORD *)(a1 + 40);
    if (v5)
      (*(void (**)(void))(v5 + 16))();
    objc_msgSend(v7, "cleanupStagedDownloadWithID:forItemID:", *(_QWORD *)(a1 + 32), 0);
    goto LABEL_7;
  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    v7 = 0;
    (*(void (**)(void))(v6 + 16))();
LABEL_7:
    v3 = v7;
  }

}

- (id)nonLocalFaultURLForAdditionName:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "br_sideFaultName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C99E98];
  v9[0] = self->_stageDirectoryPath[1];
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fileURLWithPathComponents:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)makeNonLocalVersionSideFaultWithAdditionName:(id)a3 clientZone:(id)a4 statInfo:(id)a5 version:(id)a6 sharingOptions:(unint64_t)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  void *Properties;
  void *v19;
  char SideFault;
  id v21;
  id v22;
  void *v23;
  NSObject *v24;
  id v25;
  const char *v27;
  id v28;
  _QWORD v29[5];
  id v30;
  id v31;
  id v32;
  uint64_t *v33;
  uint64_t *v34;
  unint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint8_t buf[4];
  const char *v50;
  __int16 v51;
  const char *v52;
  __int16 v53;
  id v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v28 = a5;
  v16 = a6;
  objc_msgSend(v15, "db");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "assertOnQueue");

  objc_msgSend(v16, "originalPOSIXName");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v16, "size"));
  objc_msgSend(v16, "isPackage");
  Properties = (void *)_CFURLPromiseCreateProperties();
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__45;
  v47 = __Block_byref_object_dispose__45;
  -[BRCStageRegistry nonLocalFaultURLForAdditionName:](self, "nonLocalFaultURLForAdditionName:", v14);
  v48 = (id)objc_claimAutoreleasedReturnValue();
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__45;
  v41 = __Block_byref_object_dispose__45;
  v42 = 0;
  v19 = (void *)v44[5];
  v36 = 0;
  SideFault = _makeSideFault(v19, Properties, &v36);
  v21 = v36;

  if ((SideFault & 1) != 0)
  {
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __131__BRCStageRegistry_LegacyAdditions__makeNonLocalVersionSideFaultWithAdditionName_clientZone_statInfo_version_sharingOptions_error___block_invoke;
    v29[3] = &unk_1E8765ED0;
    v33 = &v43;
    v34 = &v37;
    v29[4] = self;
    v30 = v15;
    v31 = v28;
    v32 = v16;
    v35 = a7;
    -[BRCStageRegistry _performInStageDirectory:block:](self, "_performInStageDirectory:block:", 1, v29);
    v22 = (id)v38[5];
    if (v22)
    {
      brc_bread_crumbs();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, (os_log_type_t)0x90u))
      {
        v27 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v50 = "-[BRCStageRegistry(LegacyAdditions) makeNonLocalVersionSideFaultWithAdditionName:clientZone:statInfo:versi"
              "on:sharingOptions:error:]";
        v51 = 2080;
        if (!a8)
          v27 = "(ignored by caller)";
        v52 = v27;
        v53 = 2112;
        v54 = v22;
        v55 = 2112;
        v56 = v23;
        _os_log_error_impl(&dword_1CBD43000, v24, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a8)
      *a8 = objc_retainAutorelease(v22);

    v25 = (id)v44[5];
  }
  else if (objc_msgSend(v21, "br_isCocoaErrorCode:", 516))
  {
    v25 = (id)v44[5];
  }
  else
  {
    v25 = 0;
    if (a8)
      *a8 = objc_retainAutorelease(v21);
  }

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v43, 8);

  return v25;
}

uint64_t __131__BRCStageRegistry_LegacyAdditions__makeNonLocalVersionSideFaultWithAdditionName_clientZone_statInfo_version_sharingOptions_error___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  NSObject *v18;
  void *v20;
  unsigned __int16 v21;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "lastPathComponent");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (const char *)objc_msgSend(v4, "fileSystemRepresentation");
  v11 = BRCOpenAt(a2, v5, 33028, v6, v7, v8, v9, v10, v21);
  if ((v11 & 0x80000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorFromErrno");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

    v16 = *__error();
    brc_bread_crumbs();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, (os_log_type_t)0x90u))
    {
      objc_msgSend(v4, "lastPathComponent");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109890;
      v23 = a2;
      v24 = 2112;
      v25 = v20;
      v26 = 1024;
      v27 = v16;
      v28 = 2112;
      v29 = v17;
      _os_log_error_impl(&dword_1CBD43000, v18, (os_log_type_t)0x90u, "[ERROR] openat(%d, '%@') failed %{errno}d%@", buf, 0x22u);

    }
    *__error() = v16;
  }
  else
  {
    v12 = v11;
    objc_msgSend(*(id *)(a1 + 32), "applyMetadataOnFileDescriptor:liveFileDescriptor:itemID:clientZone:statInfo:version:sharingOptions:", v11, 0xFFFFFFFFLL, 0, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 80));
    close(v12);
  }

  return 0;
}

- (BOOL)makeSideFaultInStageGatherFileID:(unint64_t *)a3 generationID:(unsigned int *)a4 documentID:(unsigned int *)a5 properties:(id)a6 inAppLibrary:(id)a7 forCreation:(BOOL)a8 error:(id *)a9
{
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  int v25;
  NSMutableSet *unflushedStagedFileIDs;
  id v27;
  void *v28;
  id v29;
  void *v30;
  NSObject *v31;
  const char *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  uint64_t *v38;
  unint64_t *v39;
  unsigned int *v40;
  unsigned int *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint8_t buf[4];
  const char *v49;
  __int16 v50;
  const char *v51;
  __int16 v52;
  id v53;
  __int16 v54;
  void *v55;
  _QWORD v56[5];

  v56[2] = *MEMORY[0x1E0C80C00];
  v15 = a6;
  v16 = a7;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "UUIDString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x1E0C99E98];
  v56[0] = self->_stageDirectoryPath[0];
  v56[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "fileURLWithPathComponents:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__45;
  v46 = __Block_byref_object_dispose__45;
  v47 = 0;
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __136__BRCStageRegistry_LegacyAdditions__makeSideFaultInStageGatherFileID_generationID_documentID_properties_inAppLibrary_forCreation_error___block_invoke;
  v34[3] = &unk_1E8765EF8;
  v22 = v21;
  v35 = v22;
  v23 = v15;
  v36 = v23;
  v38 = &v42;
  v24 = v18;
  v37 = v24;
  v39 = a3;
  v40 = a4;
  v41 = a5;
  v25 = -[BRCStageRegistry _performInStageDirectory:block:](self, "_performInStageDirectory:block:", 0, v34);
  if (v25 < 0)
  {
    v28 = (void *)v43[5];
    if (v28)
    {
      v29 = v28;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorFromErrno");
      v29 = (id)objc_claimAutoreleasedReturnValue();
      if (!v29)
      {
LABEL_9:
        if (a9)
          *a9 = objc_retainAutorelease(v29);

        v27 = v35;
        goto LABEL_12;
      }
    }
    brc_bread_crumbs();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, (os_log_type_t)0x90u))
    {
      v33 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      v49 = "-[BRCStageRegistry(LegacyAdditions) makeSideFaultInStageGatherFileID:generationID:documentID:properties:inAp"
            "pLibrary:forCreation:error:]";
      v50 = 2080;
      if (!a9)
        v33 = "(ignored by caller)";
      v51 = v33;
      v52 = 2112;
      v53 = v29;
      v54 = 2112;
      v55 = v30;
      _os_log_error_impl(&dword_1CBD43000, v31, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }

    goto LABEL_9;
  }

  if (!a8)
  {
    unflushedStagedFileIDs = self->_unflushedStagedFileIDs;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *a3);
    v27 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet addObject:](unflushedStagedFileIDs, "addObject:", v27);
LABEL_12:

  }
  _Block_object_dispose(&v42, 8);

  return v25 >= 0;
}

uint64_t __136__BRCStageRegistry_LegacyAdditions__makeSideFaultInStageGatherFileID_generationID_documentID_properties_inAppLibrary_forCreation_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  int SideFault;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  int v17;
  void *v18;
  NSObject *v19;
  uint64_t v21;
  unsigned __int16 v22;
  id obj;
  uint8_t buf[4];
  int v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  int v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = *(void **)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v6 + 40);
  SideFault = _makeSideFault(v4, v5, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);
  if (!SideFault)
    return 0xFFFFFFFFLL;
  v8 = (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 48)), "fileSystemRepresentation");
  v14 = BRCOpenAt(a2, v8, 33028, v9, v10, v11, v12, v13, v22);
  if ((v14 & 0x80000000) != 0)
  {
    v17 = *__error();
    brc_bread_crumbs();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, (os_log_type_t)0x90u))
    {
      v21 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 67109890;
      v25 = a2;
      v26 = 2112;
      v27 = v21;
      v28 = 1024;
      v29 = v17;
      v30 = 2112;
      v31 = v18;
      _os_log_error_impl(&dword_1CBD43000, v19, (os_log_type_t)0x90u, "[ERROR] openat(%d, '%@') failed %{errno}d%@", buf, 0x22u);
    }

    v16 = 0xFFFFFFFFLL;
  }
  else
  {
    v15 = v14;
    v16 = _fstatItem(v14, *(_QWORD **)(a1 + 64), *(_DWORD **)(a1 + 72), *(_DWORD **)(a1 + 80), 0, 0);
    v17 = *__error();
    close(v15);
  }
  *__error() = v17;
  return v16;
}

- (BOOL)existsInOldVersionStageOrGraveyard:(unint64_t)a3
{
  void *v4;
  BOOL v5;
  void *v6;
  NSObject *v7;
  const char *v9;
  char v10;
  uint8_t buf[4];
  unint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  if (a3)
  {
    -[BRCStageRegistry _pathInStage:index:generationID:](self, "_pathInStage:index:generationID:", a3, &v10, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 0;
    if (v4 && (v10 & 0xFE) == 2)
    {
      brc_bread_crumbs();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218498;
        if (v10 == 3)
          v9 = "graveyard";
        else
          v9 = "old versions stage";
        v12 = a3;
        v13 = 2080;
        v14 = v9;
        v15 = 2112;
        v16 = v6;
        _os_log_debug_impl(&dword_1CBD43000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] fileID:%llu is in the %s%@", buf, 0x20u);
      }

      v5 = 1;
    }
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }

  return v5;
}

- (void)willFlushAllStagedFileIDs
{
  void *v3;
  NSObject *v4;
  BRCStageRegistry *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9[3];
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableSet count](self->_unflushedStagedFileIDs, "count"))
  {
    memset(v9, 0, sizeof(v9));
    __brc_create_section(0, (uint64_t)"-[BRCStageRegistry(LegacyAdditions) willFlushAllStagedFileIDs]", 198, v9);
    brc_bread_crumbs();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v7 = v9[0];
      v8 = -[NSMutableSet count](self->_unflushedStagedFileIDs, "count");
      *(_DWORD *)buf = 134218498;
      v11 = v7;
      v12 = 2048;
      v13 = v8;
      v14 = 2112;
      v15 = v3;
      _os_log_debug_impl(&dword_1CBD43000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx kicking apply changes: %ld unflushed staged file IDs%@", buf, 0x20u);
    }

    -[NSMutableSet removeAllObjects](self->_unflushedStagedFileIDs, "removeAllObjects");
    v5 = self;
    objc_sync_enter(v5);
    -[BRCAccountSession applyScheduler](v5->_session, "applyScheduler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rescheduleSuspendedJobsMatching:inState:", 0, 20);

    objc_sync_exit(v5);
    __brc_leave_section(v9);
  }
}

- (void)_fileIDMightHaveBeenUnlocked:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8[3];
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "unsignedLongLongValue");
  memset(v8, 0, sizeof(v8));
  __brc_create_section(0, (uint64_t)"-[BRCStageRegistry(LegacyAdditions) _fileIDMightHaveBeenUnlocked:]", 212, v8);
  brc_bread_crumbs();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    v10 = v8[0];
    v11 = 2048;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    _os_log_debug_impl(&dword_1CBD43000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx file %llu might have been unlocked%@", buf, 0x20u);
  }

  -[BRCStageRegistry forgetWatchedLockedFileID:](self, "forgetWatchedLockedFileID:", v4);
  __brc_leave_section(v8);

}

- (void)_watchLockedRelpath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSMutableDictionary *watchedLockedFileIDs;
  void *v8;
  void *v9;
  unsigned int v10;
  uintptr_t v11;
  NSObject *v12;
  dispatch_source_t v13;
  NSObject *v14;
  _QWORD *v15;
  NSObject *v16;
  _QWORD *v17;
  void *v18;
  void *v19;
  dispatch_block_t v20;
  NSMutableDictionary *v21;
  void *v22;
  int v23;
  void *v24;
  NSObject *v25;
  _QWORD v26[4];
  id v27[2];
  id location;

  v4 = a3;
  -[BRCAccountSession clientDB](self->_session, "clientDB");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertOnQueue");

  v6 = (void *)objc_msgSend(v4, "fileID");
  watchedLockedFileIDs = self->_watchedLockedFileIDs;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](watchedLockedFileIDs, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v10 = BRCOpenByID(self->_deviceID, (uint64_t)v6, 33028);
    if ((v10 & 0x80000000) != 0)
    {
      v23 = *__error();
      brc_bread_crumbs();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, (os_log_type_t)0x90u))
        -[BRCStageRegistry(LegacyAdditions) _watchLockedRelpath:].cold.1();

      *__error() = v23;
    }
    else
    {
      v11 = v10;
      -[BRCAccountSession clientTruthWorkloop](self->_session, "clientTruthWorkloop");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = dispatch_source_create(MEMORY[0x1E0C80DE8], v11, 0x141uLL, v12);

      objc_initWeak(&location, self);
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __57__BRCStageRegistry_LegacyAdditions___watchLockedRelpath___block_invoke;
      v26[3] = &unk_1E8765F20;
      objc_copyWeak(v27, &location);
      v27[1] = v6;
      v14 = v13;
      v15 = v26;
      v16 = v14;
      v17 = v15;
      v18 = v17;
      v19 = v17;
      if (*MEMORY[0x1E0D11070])
      {
        ((void (*)(_QWORD *))*MEMORY[0x1E0D11070])(v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v20 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v19);
      dispatch_source_set_event_handler(v16, v20);

      dispatch_resume(v16);
      v21 = self->_watchedLockedFileIDs;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v6);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v16, v22);

      objc_destroyWeak(v27);
      objc_destroyWeak(&location);

    }
  }

}

void __57__BRCStageRegistry_LegacyAdditions___watchLockedRelpath___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_fileIDMightHaveBeenUnlocked:", v2);

}

- (BOOL)_flockToMakeLiveAtPath:(id)a3 error:(id *)a4
{
  id v6;
  char v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  int v18;
  const char *v20;
  _BYTE v21[32];
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_msgSend(v6, "flock:", 6);
  if ((v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorFromErrno");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      brc_bread_crumbs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, (os_log_type_t)0x90u))
      {
        v20 = "(passed to caller)";
        *(_DWORD *)v21 = 136315906;
        *(_QWORD *)&v21[4] = "-[BRCStageRegistry(LegacyAdditions) _flockToMakeLiveAtPath:error:]";
        *(_WORD *)&v21[12] = 2080;
        if (!a4)
          v20 = "(ignored by caller)";
        *(_QWORD *)&v21[14] = v20;
        *(_WORD *)&v21[22] = 2112;
        *(_QWORD *)&v21[24] = v8;
        v22 = 2112;
        v23 = v9;
        _os_log_error_impl(&dword_1CBD43000, v10, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", v21, 0x2Au);
      }

    }
    if (a4)
      *a4 = objc_retainAutorelease(v8);

    -[BRCAccountSession globalItemByFileID:](self->_session, "globalItemByFileID:", objc_msgSend(v6, "fileID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "clientZone");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "itemID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "serverItemByItemID:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[BRCAccountSession applyScheduler](self->_session, "applyScheduler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setState:forServerItem:localItem:", 29, v14, v11);

    }
    -[BRCStageRegistry _watchLockedRelpath:](self, "_watchLockedRelpath:", v6, *(_OWORD *)v21);
    brc_bread_crumbs();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = *__error();
      *(_DWORD *)v21 = 138412802;
      *(_QWORD *)&v21[4] = v6;
      *(_WORD *)&v21[12] = 1024;
      *(_DWORD *)&v21[14] = v18;
      *(_WORD *)&v21[18] = 2112;
      *(_QWORD *)&v21[20] = v16;
      _os_log_impl(&dword_1CBD43000, v17, OS_LOG_TYPE_DEFAULT, "[WARNING] Abort making live: unable to flock %@ %{errno}d%@", v21, 0x1Cu);
    }

  }
  return v7;
}

- (BOOL)makeItemLive:(id)a3 fromStage:(unint64_t)a4 bySwappingWith:(id)a5 fileName:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  BOOL v19;
  void *v20;
  NSObject *v21;
  uint64_t v23;
  void *v24;
  void *v25;
  NSObject *v26;
  const char *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, int);
  void *v33;
  id v34;
  id v35;
  unint64_t v36;
  unsigned int v37;
  char v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  id v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v38 = 0;
  v37 = 0;
  -[BRCStageRegistry _pathInStage:index:generationID:](self, "_pathInStage:index:generationID:", a4, &v38, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithPOSIXCode:", 70);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      brc_bread_crumbs();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, (os_log_type_t)0x90u))
      {
        v28 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v40 = "-[BRCStageRegistry(LegacyAdditions) makeItemLive:fromStage:bySwappingWith:fileName:error:]";
        v41 = 2080;
        if (!a7)
          v28 = "(ignored by caller)";
        v42 = v28;
        v43 = 2112;
        v44 = v16;
        v45 = 2112;
        v46 = v20;
        _os_log_error_impl(&dword_1CBD43000, v21, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a7)
      goto LABEL_7;
    goto LABEL_12;
  }
  if ((v38 & 0xFB) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithPOSIXCode:", 70);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      brc_bread_crumbs();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, (os_log_type_t)0x90u))
      {
        v27 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v40 = "-[BRCStageRegistry(LegacyAdditions) makeItemLive:fromStage:bySwappingWith:fileName:error:]";
        v41 = 2080;
        if (!a7)
          v27 = "(ignored by caller)";
        v42 = v27;
        v43 = 2112;
        v44 = v16;
        v45 = 2112;
        v46 = v17;
        _os_log_error_impl(&dword_1CBD43000, v18, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a7)
    {
LABEL_7:
      v16 = objc_retainAutorelease(v16);
      v19 = 0;
      *a7 = v16;
      goto LABEL_13;
    }
LABEL_12:
    v19 = 0;
    goto LABEL_13;
  }
  if (!-[BRCStageRegistry _flockToMakeLiveAtPath:error:](self, "_flockToMakeLiveAtPath:error:", v13, a7))
  {
    v19 = 0;
    goto LABEL_14;
  }
  v30 = MEMORY[0x1E0C809B0];
  v31 = 3221225472;
  v32 = __90__BRCStageRegistry_LegacyAdditions__makeItemLive_fromStage_bySwappingWith_fileName_error___block_invoke;
  v33 = &unk_1E8765F48;
  v34 = v15;
  v35 = v14;
  v36 = a4;
  if ((objc_msgSend(v13, "performOnOpenParentFileDescriptor:error:", &v30, &v37) & 1) != 0)
  {

    v23 = objc_msgSend(v13, "fileID", v30, v31, v32, v33);
    objc_msgSend(v12, "itemID");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    -[BRCStageRegistry moveFromStageToGraveyard:forItemID:](self, "moveFromStageToGraveyard:forItemID:", v23, v16);
    v19 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithPOSIXCode:", v37, v30, v31, v32, v33);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      brc_bread_crumbs();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        v29 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v40 = "-[BRCStageRegistry(LegacyAdditions) makeItemLive:fromStage:bySwappingWith:fileName:error:]";
        v41 = 2080;
        if (!a7)
          v29 = "(ignored by caller)";
        v42 = v29;
        v43 = 2112;
        v44 = v24;
        v45 = 2112;
        v46 = v25;
        _os_log_debug_impl(&dword_1CBD43000, v26, OS_LOG_TYPE_DEBUG, "[DEBUG] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a7)
      *a7 = objc_retainAutorelease(v24);

    v19 = 0;
    v16 = v34;
  }
LABEL_13:

LABEL_14:
  return v19;
}

uint64_t __90__BRCStageRegistry_LegacyAdditions__makeItemLive_fromStage_bySwappingWith_fileName_error___block_invoke(uint64_t a1, int a2)
{
  void *v4;
  NSObject *v5;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  _BYTE v19[30];
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if ((BRCRenameAt(-1, *(void **)(a1 + 32), a2, *(void **)(a1 + 40), 2u) & 0x80000000) != 0)
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v12 = *(_QWORD *)(a1 + 32);
      v13 = *(_QWORD *)(a1 + 40);
      v14 = *(_QWORD *)(a1 + 48);
      v15 = *__error();
      v16 = 138413570;
      v17 = v12;
      v18 = 1024;
      *(_DWORD *)v19 = a2;
      *(_WORD *)&v19[4] = 2112;
      *(_QWORD *)&v19[6] = v13;
      *(_WORD *)&v19[14] = 2048;
      *(_QWORD *)&v19[16] = v14;
      *(_WORD *)&v19[24] = 1024;
      *(_DWORD *)&v19[26] = v15;
      v20 = 2112;
      v21 = v7;
      _os_log_debug_impl(&dword_1CBD43000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] renameat(-1, '%@', %d, '%@', RENAME_SWAP) failed for fileID=%llu,  %{errno}d%@", (uint8_t *)&v16, 0x36u);
    }

    return *__error();
  }
  else
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(_QWORD *)(a1 + 40);
      v11 = *(_QWORD *)(a1 + 48);
      v16 = 138413058;
      v17 = v9;
      v18 = 2112;
      *(_QWORD *)v19 = v10;
      *(_WORD *)&v19[8] = 2048;
      *(_QWORD *)&v19[10] = v11;
      *(_WORD *)&v19[18] = 2112;
      *(_QWORD *)&v19[20] = v4;
      _os_log_debug_impl(&dword_1CBD43000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] swapped '%@' and '%@' fileID=%llu%@", (uint8_t *)&v16, 0x2Au);
    }

    return 0;
  }
}

- (BOOL)moveOldVersionFromPath:(id)a3 error:(id *)a4
{
  char *v6;
  void *v7;
  void *v8;
  void *v9;
  char *v10;
  id v11;
  void *v12;
  NSObject *v13;
  BOOL v14;
  void *v15;
  void *v16;
  NSObject *v17;
  char *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  const char *v24;
  const char *v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, int);
  void *v31;
  BRCStageRegistry *v32;
  char *v33;
  id v34;
  unsigned int v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = (char *)a3;
  -[BRCAccountSession clientDB](self->_session, "clientDB");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assertOnQueue");

  v35 = 0;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "exists") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithPOSIXCode:", 22);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      brc_bread_crumbs();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, (os_log_type_t)0x90u))
      {
        v24 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v37 = "-[BRCStageRegistry(LegacyAdditions) moveOldVersionFromPath:error:]";
        v38 = 2080;
        if (!a4)
          v24 = "(ignored by caller)";
        v39 = v24;
        v40 = 2112;
        v41 = v15;
        v42 = 2112;
        v43 = v16;
        _os_log_error_impl(&dword_1CBD43000, v17, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a4)
      *a4 = objc_retainAutorelease(v15);

    brc_bread_crumbs();
    v18 = (char *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v37 = v6;
      v38 = 2112;
      v39 = v18;
      _os_log_impl(&dword_1CBD43000, v19, OS_LOG_TYPE_DEFAULT, "[WARNING] Abort making live: path doesn't exist %@%@", buf, 0x16u);
    }

    goto LABEL_22;
  }
  if (!-[BRCStageRegistry _flockToMakeLiveAtPath:error:](self, "_flockToMakeLiveAtPath:error:", v6, a4))
  {
LABEL_22:
    v14 = 0;
    goto LABEL_23;
  }
  if (!v6)
  {
    brc_bread_crumbs();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      -[BRCFSReader fseventAtPath:flags:unresolvedLastPathComponent:].cold.1();

  }
  v28 = MEMORY[0x1E0C809B0];
  v29 = 3221225472;
  v30 = __66__BRCStageRegistry_LegacyAdditions__moveOldVersionFromPath_error___block_invoke;
  v31 = &unk_1E8765F98;
  v32 = self;
  v10 = v6;
  v33 = v10;
  v11 = v9;
  v34 = v11;
  if ((objc_msgSend(v10, "performOnOpenParentFileDescriptor:error:", &v28, &v35) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithPOSIXCode:", v35, v28, v29, v30, v31, v32);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      brc_bread_crumbs();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, (os_log_type_t)0x90u))
      {
        v25 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v37 = "-[BRCStageRegistry(LegacyAdditions) moveOldVersionFromPath:error:]";
        v38 = 2080;
        if (!a4)
          v25 = "(ignored by caller)";
        v39 = v25;
        v40 = 2112;
        v41 = v20;
        v42 = 2112;
        v43 = v21;
        _os_log_error_impl(&dword_1CBD43000, v22, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a4)
      *a4 = objc_retainAutorelease(v20);

    goto LABEL_22;
  }

  brc_bread_crumbs();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v37 = v10;
    v38 = 2112;
    v39 = (const char *)v11;
    v40 = 2112;
    v41 = v12;
    _os_log_debug_impl(&dword_1CBD43000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] moved from %@\nto '%@' in old version stage%@", buf, 0x20u);
  }

  v14 = 1;
LABEL_23:

  return v14;
}

uint64_t __66__BRCStageRegistry_LegacyAdditions__moveOldVersionFromPath_error___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v6[4];
  id v7;
  id v8;
  int v9;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__BRCStageRegistry_LegacyAdditions__moveOldVersionFromPath_error___block_invoke_2;
  v6[3] = &unk_1E8765F70;
  v9 = a2;
  v3 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v8 = *(id *)(a1 + 48);
  if ((objc_msgSend(v3, "_performInStageDirectory:block:", 2, v6) & 0x80000000) != 0)
    v4 = *__error();
  else
    v4 = 0;

  return v4;
}

uint64_t __66__BRCStageRegistry_LegacyAdditions__moveOldVersionFromPath_error___block_invoke_2(uint64_t a1, int a2)
{
  int v4;
  void *v5;
  int v6;
  uint64_t result;
  void *v8;
  NSObject *v9;
  int v10;
  void *v11;
  uint64_t v12;
  int v13;
  _DWORD v14[2];
  __int16 v15;
  void *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = *(_DWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "filename");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = BRCRenameAt(v4, v5, a2, *(void **)(a1 + 40), 0);

  result = 0;
  if (v6 < 0)
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10 = *(_DWORD *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 32), "filename");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 40);
      v13 = *__error();
      v14[0] = 67110402;
      v14[1] = v10;
      v15 = 2112;
      v16 = v11;
      v17 = 1024;
      v18 = a2;
      v19 = 2112;
      v20 = v12;
      v21 = 1024;
      v22 = v13;
      v23 = 2112;
      v24 = v8;
      _os_log_debug_impl(&dword_1CBD43000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] renameat(%d, '%@', %d, '%@') failed %{errno}d%@", (uint8_t *)v14, 0x32u);

    }
    return 0xFFFFFFFFLL;
  }
  return result;
}

- (void)forgetWatchedLockedFileID:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int handle;

  v4 = a3;
  -[BRCAccountSession clientDB](self->_session, "clientDB");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertOnQueue");

  -[NSMutableDictionary objectForKeyedSubscript:](self->_watchedLockedFileIDs, "objectForKeyedSubscript:", v4);
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[BRCStageRegistry(LegacyAdditions) forgetWatchedLockedFileID:].cold.1();

    -[BRCAccountSession globalItemByFileID:](self->_session, "globalItemByFileID:", objc_msgSend(v4, "unsignedLongLongValue"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "clientZone");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "itemID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "serverItemByItemID:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[BRCAccountSession applyScheduler](self->_session, "applyScheduler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setState:forServerItem:localItem:", 1, v12, v9);

    }
    dispatch_source_cancel(v6);
    handle = dispatch_source_get_handle(v6);
    close(handle);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_watchedLockedFileIDs, "setObject:forKeyedSubscript:", 0, v4);

  }
}

- (void)forgetWatchedLockedFileIDsForAppLibrary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[BRCAccountSession clientDB](self->_session, "clientDB");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertOnQueue");

  v6 = (void *)-[NSMutableDictionary copy](self->_watchedLockedFileIDs, "copy");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        -[BRCAccountSession globalItemByFileID:](self->_session, "globalItemByFileID:", objc_msgSend(v12, "unsignedLongLongValue", (_QWORD)v16));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (!v4
          || (objc_msgSend(v13, "appLibrary"),
              v15 = (id)objc_claimAutoreleasedReturnValue(),
              v15,
              v15 == v4))
        {
          -[BRCStageRegistry forgetWatchedLockedFileID:](self, "forgetWatchedLockedFileID:", v12);
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

}

- (BOOL)moveFromStage:(unint64_t)a3 toPath:(id)a4 fileName:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  const char *v17;
  char v18;
  void *v19;
  void *v20;
  NSObject *v21;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, int);
  void *v27;
  BRCStageRegistry *v28;
  id v29;
  id v30;
  id v31;
  unint64_t v32;
  unsigned int v33;
  char v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v34 = 0;
  v33 = 0;
  -[BRCStageRegistry _pathInStage:index:generationID:](self, "_pathInStage:index:generationID:", a3, &v34, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithPOSIXCode:", 70);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      brc_bread_crumbs();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, (os_log_type_t)0x90u))
      {
        v17 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v36 = "-[BRCStageRegistry(LegacyAdditions) moveFromStage:toPath:fileName:error:]";
        v37 = 2080;
        if (!a6)
          v17 = "(ignored by caller)";
        goto LABEL_25;
      }
LABEL_10:

    }
LABEL_11:
    if (a6)
      *a6 = objc_retainAutorelease(v14);

    v18 = 0;
    goto LABEL_22;
  }
  if ((v34 & 0xFB) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithPOSIXCode:", 70);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      brc_bread_crumbs();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, (os_log_type_t)0x90u))
      {
        v17 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v36 = "-[BRCStageRegistry(LegacyAdditions) moveFromStage:toPath:fileName:error:]";
        v37 = 2080;
        if (!a6)
          v17 = "(ignored by caller)";
LABEL_25:
        v38 = v17;
        v39 = 2112;
        v40 = v14;
        v41 = 2112;
        v42 = v15;
        _os_log_error_impl(&dword_1CBD43000, v16, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        goto LABEL_10;
      }
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v24 = MEMORY[0x1E0C809B0];
  v25 = 3221225472;
  v26 = __73__BRCStageRegistry_LegacyAdditions__moveFromStage_toPath_fileName_error___block_invoke;
  v27 = &unk_1E8765FC0;
  v28 = self;
  v29 = v12;
  v30 = v11;
  v32 = a3;
  v31 = v10;
  v18 = objc_msgSend(v31, "performOnOpenParentFileDescriptor:error:", &v24, &v33);
  if ((v18 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithPOSIXCode:", v33, v24, v25, v26, v27, v28, v29, v30);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      brc_bread_crumbs();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, (os_log_type_t)0x90u))
      {
        v23 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v36 = "-[BRCStageRegistry(LegacyAdditions) moveFromStage:toPath:fileName:error:]";
        v37 = 2080;
        if (!a6)
          v23 = "(ignored by caller)";
        v38 = v23;
        v39 = 2112;
        v40 = v19;
        v41 = 2112;
        v42 = v20;
        _os_log_error_impl(&dword_1CBD43000, v21, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a6)
      *a6 = objc_retainAutorelease(v19);

  }
LABEL_22:

  return v18;
}

uint64_t __73__BRCStageRegistry_LegacyAdditions__moveFromStage_toPath_fileName_error___block_invoke(uint64_t a1, int a2)
{
  void *v4;
  unsigned int v5;
  void *v6;
  NSObject *v7;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  _BYTE v21[20];
  _BYTE v22[10];
  __int16 v23;
  int v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "volume");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "hasRenameExcl"))
    v5 = 4;
  else
    v5 = 0;

  if ((BRCRenameAt(-1, *(void **)(a1 + 40), a2, *(void **)(a1 + 48), v5) & 0x80000000) != 0)
  {
    brc_bread_crumbs();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v14 = *(_QWORD *)(a1 + 40);
      v15 = *(_QWORD *)(a1 + 48);
      v16 = *(_QWORD *)(a1 + 64);
      v17 = *__error();
      v18 = 138413826;
      v19 = v14;
      v20 = 1024;
      *(_DWORD *)v21 = a2;
      *(_WORD *)&v21[4] = 2112;
      *(_QWORD *)&v21[6] = v15;
      *(_WORD *)&v21[14] = 1024;
      *(_DWORD *)&v21[16] = v5;
      *(_WORD *)v22 = 2048;
      *(_QWORD *)&v22[2] = v16;
      v23 = 1024;
      v24 = v17;
      v25 = 2112;
      v26 = v9;
      _os_log_debug_impl(&dword_1CBD43000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] renameatx_np(-1, '%@', %d, '%@', %u) failed for fileID=%llu,  %{errno}d%@", (uint8_t *)&v18, 0x3Cu);
    }

    return *__error();
  }
  else
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v11 = *(_QWORD *)(a1 + 40);
      v12 = *(_QWORD *)(a1 + 48);
      v13 = objc_msgSend(*(id *)(a1 + 56), "parentFileID");
      v18 = 138413058;
      v19 = v11;
      v20 = 2112;
      *(_QWORD *)v21 = v12;
      *(_WORD *)&v21[8] = 2048;
      *(_QWORD *)&v21[10] = v13;
      *(_WORD *)&v21[18] = 2112;
      *(_QWORD *)v22 = v6;
      _os_log_debug_impl(&dword_1CBD43000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] renamed from '%@' to '%@' in parentFileID:%llu%@", (uint8_t *)&v18, 0x2Au);
    }

    return 0;
  }
}

- (BOOL)moveToGraveyardFromPath:(id)a3 forItemID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  char v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  const char *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void *v25;
  id v26;
  BRCStageRegistry *v27;
  id v28;
  unsigned int v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v29 = 0;
  if (!v8)
  {
    brc_bread_crumbs();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      -[BRCFSReader fseventAtPath:flags:unresolvedLastPathComponent:].cold.1();

  }
  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __77__BRCStageRegistry_LegacyAdditions__moveToGraveyardFromPath_forItemID_error___block_invoke;
  v25 = &unk_1E8765F98;
  v10 = v8;
  v26 = v10;
  v27 = self;
  v11 = v9;
  v28 = v11;
  v12 = objc_msgSend(v10, "performOnOpenParentFileDescriptor:error:", &v22, &v29);
  if ((v12 & 1) != 0)
  {

    brc_bread_crumbs();
    v13 = (id)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v31 = (const char *)v10;
      v32 = 2112;
      v33 = (const char *)v11;
      v34 = 2112;
      v35 = v13;
      _os_log_debug_impl(&dword_1CBD43000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] moved from %@\nto '%@' in graveyard%@", buf, 0x20u);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithPOSIXCode:", v29, v22, v23, v24, v25);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      brc_bread_crumbs();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        v19 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v31 = "-[BRCStageRegistry(LegacyAdditions) moveToGraveyardFromPath:forItemID:error:]";
        v32 = 2080;
        if (!a5)
          v19 = "(ignored by caller)";
        v33 = v19;
        v34 = 2112;
        v35 = v15;
        v36 = 2112;
        v37 = v16;
        _os_log_debug_impl(&dword_1CBD43000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a5)
      *a5 = objc_retainAutorelease(v15);

    v13 = v26;
  }

  return v12;
}

uint64_t __77__BRCStageRegistry_LegacyAdditions__moveToGraveyardFromPath_forItemID_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  NSObject *v5;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  char v11;

  if ((objc_msgSend(*(id *)(a1 + 32), "exists") & 1) == 0)
  {
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __77__BRCStageRegistry_LegacyAdditions__moveToGraveyardFromPath_forItemID_error___block_invoke_cold_2();

    return 0;
  }
  if (!objc_msgSend(*(id *)(a1 + 32), "isBusy"))
  {
    v9 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "filename");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "_graveyardAt:path:forItemID:", a2, v10, *(_QWORD *)(a1 + 48));

    if ((v11 & 1) == 0)
      return *__error();
    return 0;
  }
  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __77__BRCStageRegistry_LegacyAdditions__moveToGraveyardFromPath_forItemID_error___block_invoke_cold_1();

  return 16;
}

- (BOOL)transferDocumentID:(unsigned int)a3 fromOldVersionStage:(unint64_t)a4 toStage:(unint64_t)a5
{
  uint64_t v9;
  int v10;
  uint64_t v11;
  int v12;
  void *v13;
  NSObject *v14;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  int v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  int v25;
  int v26;
  int v27;
  int v28;
  void *v29;
  NSObject *v30;
  int v31;
  int v32;
  uint64_t v33;
  uint8_t buf[4];
  _BYTE v35[14];
  __int16 v36;
  _BYTE v37[24];
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v33 = 0;
  v32 = 0;
  v9 = BRCOpenByID(self->_deviceID, a4, 33028);
  if ((v9 & 0x80000000) != 0)
  {
    brc_bread_crumbs();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v27 = *__error();
      *(_DWORD *)buf = 67110146;
      *(_DWORD *)v35 = a3;
      *(_WORD *)&v35[4] = 2048;
      *(_QWORD *)&v35[6] = a4;
      v36 = 2048;
      *(_QWORD *)v37 = a5;
      *(_WORD *)&v37[8] = 1024;
      *(_DWORD *)&v37[10] = v27;
      *(_WORD *)&v37[14] = 2112;
      *(_QWORD *)&v37[16] = v16;
      _os_log_debug_impl(&dword_1CBD43000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] can't open src to transfer documentID:%u from fileID:%llu to fileID:%llu %{errno}d%@", buf, 0x2Cu);
    }

    return 0;
  }
  v10 = v9;
  if ((_fstatItem(v9, 0, 0, &v32, &v33, 0) & 0x80000000) != 0)
  {
LABEL_23:
    close(v10);
    return 0;
  }
  if (v33 != self->_stageDirectoryFileID[2])
  {
    brc_bread_crumbs();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v20 = v33;
      v21 = *__error();
      *(_DWORD *)buf = 134219266;
      *(_QWORD *)v35 = v20;
      *(_WORD *)&v35[8] = 1024;
      *(_DWORD *)&v35[10] = a3;
      v36 = 2048;
      *(_QWORD *)v37 = a4;
      *(_WORD *)&v37[8] = 2048;
      *(_QWORD *)&v37[10] = a5;
      *(_WORD *)&v37[18] = 1024;
      *(_DWORD *)&v37[20] = v21;
      v38 = 2112;
      v39 = v18;
      v22 = "[DEBUG] src parentFileID:%llu not in graveyard, can't transfer documentID:%u from fileID:%llu to fileID:%llu %{errno}d%@";
      v23 = v19;
      v24 = 54;
LABEL_21:
      _os_log_debug_impl(&dword_1CBD43000, v23, OS_LOG_TYPE_DEBUG, v22, buf, v24);
      goto LABEL_22;
    }
    goto LABEL_22;
  }
  if (v32 != a3)
  {
    brc_bread_crumbs();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134219010;
      *(_QWORD *)v35 = a4;
      *(_WORD *)&v35[8] = 1024;
      *(_DWORD *)&v35[10] = a3;
      v36 = 1024;
      *(_DWORD *)v37 = v32;
      *(_WORD *)&v37[4] = 2048;
      *(_QWORD *)&v37[6] = a5;
      *(_WORD *)&v37[14] = 2112;
      *(_QWORD *)&v37[16] = v18;
      v22 = "[DEBUG] documentID mismatch on fileID:%llu (expected:%u actual:%u) not transferring to fileID:%llu%@";
LABEL_20:
      v23 = v19;
      v24 = 44;
      goto LABEL_21;
    }
LABEL_22:

    goto LABEL_23;
  }
  v11 = BRCOpenByID(self->_deviceID, a5, 33028);
  v31 = v11;
  if ((v11 & 0x80000000) != 0)
  {
    brc_bread_crumbs();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v25 = *__error();
      *(_DWORD *)buf = 67110146;
      *(_DWORD *)v35 = a3;
      *(_WORD *)&v35[4] = 2048;
      *(_QWORD *)&v35[6] = a4;
      v36 = 2048;
      *(_QWORD *)v37 = a5;
      *(_WORD *)&v37[8] = 1024;
      *(_DWORD *)&v37[10] = v25;
      *(_WORD *)&v37[14] = 2112;
      *(_QWORD *)&v37[16] = v18;
      v22 = "[DEBUG] can't open dst to transfer documentID:%u from fileID:%llu to fileID:%llu %{errno}d%@";
      goto LABEL_20;
    }
    goto LABEL_22;
  }
  v12 = v11;
  if ((_fstatItem(v11, 0, 0, 0, &v33, 0) & 0x80000000) != 0)
  {
    v26 = v12;
LABEL_29:
    close(v26);
    goto LABEL_23;
  }
  if (ffsctl(v10, 0x80046820uLL, &v31, 0) < 0)
  {
    v28 = *__error();
    brc_bread_crumbs();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 67110146;
      *(_DWORD *)v35 = a3;
      *(_WORD *)&v35[4] = 2048;
      *(_QWORD *)&v35[6] = a4;
      v36 = 2048;
      *(_QWORD *)v37 = a5;
      *(_WORD *)&v37[8] = 1024;
      *(_DWORD *)&v37[10] = v28;
      *(_WORD *)&v37[14] = 2112;
      *(_QWORD *)&v37[16] = v29;
      _os_log_error_impl(&dword_1CBD43000, v30, (os_log_type_t)0x90u, "[ERROR] failed transferring documentID:%u from fileID:%llu to fileID:%llu %{errno}d%@", buf, 0x2Cu);
    }

    *__error() = v28;
    v26 = v31;
    goto LABEL_29;
  }
  brc_bread_crumbs();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)v35 = a3;
    *(_WORD *)&v35[4] = 2048;
    *(_QWORD *)&v35[6] = a4;
    v36 = 2048;
    *(_QWORD *)v37 = a5;
    *(_WORD *)&v37[8] = 2112;
    *(_QWORD *)&v37[10] = v13;
    _os_log_debug_impl(&dword_1CBD43000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] transferred documentID:%u from fileID:%llu to fileID:%llu%@", buf, 0x26u);
  }

  close(v31);
  close(v10);
  return 1;
}

- (BOOL)didFlushStagedFileID:(unint64_t)a3
{
  NSMutableSet *unflushedStagedFileIDs;
  void *v6;
  void *v8;
  NSObject *v9;

  if (!a3)
  {
    brc_bread_crumbs();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[BRCStageRegistry(LegacyAdditions) didFlushStagedFileID:].cold.1();

  }
  unflushedStagedFileIDs = self->_unflushedStagedFileIDs;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(unflushedStagedFileIDs) = -[NSMutableSet containsObject:](unflushedStagedFileIDs, "containsObject:", v6) ^ 1;

  return (char)unflushedStagedFileIDs;
}

- (BOOL)makeDirectoryInStageGatherFileID:(unint64_t *)a3 generationID:(unsigned int *)a4 error:(id *)a5
{
  int v6;
  void *v7;
  void *v8;
  NSObject *v9;
  const char *v11;
  _QWORD v12[6];
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __89__BRCStageRegistry_LegacyAdditions__makeDirectoryInStageGatherFileID_generationID_error___block_invoke;
  v12[3] = &__block_descriptor_48_e8_i12__0i8l;
  v12[4] = a3;
  v12[5] = a4;
  v6 = -[BRCStageRegistry _performInStageDirectory:block:](self, "_performInStageDirectory:block:", 0, v12);
  if (v6 < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorFromErrno");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      brc_bread_crumbs();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, (os_log_type_t)0x90u))
      {
        v11 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v14 = "-[BRCStageRegistry(LegacyAdditions) makeDirectoryInStageGatherFileID:generationID:error:]";
        v15 = 2080;
        if (!a5)
          v11 = "(ignored by caller)";
        v16 = v11;
        v17 = 2112;
        v18 = v7;
        v19 = 2112;
        v20 = v8;
        _os_log_error_impl(&dword_1CBD43000, v9, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a5)
      *a5 = objc_retainAutorelease(v7);

  }
  return v6 >= 0;
}

uint64_t __89__BRCStageRegistry_LegacyAdditions__makeDirectoryInStageGatherFileID_generationID_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  int v16;
  int v17;
  void *v18;
  NSObject *v19;
  int v20;
  void *v21;
  NSObject *v22;
  int v24;
  int v25;
  __int16 v26;
  id v27;
  __int16 v28;
  int v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((BRCMkdirAt(a2, v5, 493) & 0x80000000) != 0)
  {
    v17 = *__error();
    brc_bread_crumbs();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, (os_log_type_t)0x90u))
    {
      v24 = 67109890;
      v25 = a2;
      v26 = 2112;
      v27 = v5;
      v28 = 1024;
      v29 = v17;
      v30 = 2112;
      v31 = v18;
      _os_log_error_impl(&dword_1CBD43000, v19, (os_log_type_t)0x90u, "[ERROR] mkdirat(%d, '%@') failed %{errno}d%@", (uint8_t *)&v24, 0x22u);
    }

    *__error() = v17;
    goto LABEL_10;
  }
  v6 = objc_retainAutorelease(v5);
  v7 = (const char *)objc_msgSend(v6, "fileSystemRepresentation");
  v13 = BRCOpenAt(a2, v7, 33028, v8, v9, v10, v11, v12, v24);
  if ((v13 & 0x80000000) != 0)
  {
    v20 = *__error();
    brc_bread_crumbs();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, (os_log_type_t)0x90u))
    {
      v24 = 67109890;
      v25 = a2;
      v26 = 2112;
      v27 = v6;
      v28 = 1024;
      v29 = v20;
      v30 = 2112;
      v31 = v21;
      _os_log_error_impl(&dword_1CBD43000, v22, (os_log_type_t)0x90u, "[ERROR] openat(%d, '%@') failed %{errno}d%@", (uint8_t *)&v24, 0x22u);
    }

    *__error() = v20;
LABEL_10:
    v15 = 0xFFFFFFFFLL;
    goto LABEL_11;
  }
  v14 = v13;
  v15 = _fstatItem(v13, *(_QWORD **)(a1 + 32), *(_DWORD **)(a1 + 40), 0, 0, 0);
  v16 = *__error();
  close(v14);
  *__error() = v16;
LABEL_11:

  return v15;
}

- (BOOL)makeSymlinkWithTarget:(id)a3 inStageGatherFileID:(unint64_t *)a4 generationID:(unsigned int *)a5 error:(id *)a6
{
  id v10;
  id v11;
  int v12;
  void *v13;
  void *v14;
  NSObject *v15;
  const char *v17;
  _QWORD v18[4];
  id v19;
  unint64_t *v20;
  unsigned int *v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __98__BRCStageRegistry_LegacyAdditions__makeSymlinkWithTarget_inStageGatherFileID_generationID_error___block_invoke;
  v18[3] = &unk_1E8766008;
  v11 = v10;
  v19 = v11;
  v20 = a4;
  v21 = a5;
  v12 = -[BRCStageRegistry _performInStageDirectory:block:](self, "_performInStageDirectory:block:", 0, v18);
  if (v12 < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorFromErrno");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      brc_bread_crumbs();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, (os_log_type_t)0x90u))
      {
        v17 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v23 = "-[BRCStageRegistry(LegacyAdditions) makeSymlinkWithTarget:inStageGatherFileID:generationID:error:]";
        v24 = 2080;
        if (!a6)
          v17 = "(ignored by caller)";
        v25 = v17;
        v26 = 2112;
        v27 = v13;
        v28 = 2112;
        v29 = v14;
        _os_log_error_impl(&dword_1CBD43000, v15, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a6)
      *a6 = objc_retainAutorelease(v13);

  }
  return v12 >= 0;
}

uint64_t __98__BRCStageRegistry_LegacyAdditions__makeSymlinkWithTarget_inStageGatherFileID_generationID_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  int v16;
  int v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  uint64_t v23;
  int v24;
  _BYTE v25[14];
  __int16 v26;
  _BYTE v27[14];
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((BRCSymlinkAt(*(void **)(a1 + 32), a2, v5) & 0x80000000) != 0)
  {
    v17 = *__error();
    brc_bread_crumbs();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, (os_log_type_t)0x90u))
    {
      v23 = *(_QWORD *)(a1 + 32);
      v24 = 138413314;
      *(_QWORD *)v25 = v23;
      *(_WORD *)&v25[8] = 1024;
      *(_DWORD *)&v25[10] = a2;
      v26 = 2112;
      *(_QWORD *)v27 = v5;
      *(_WORD *)&v27[8] = 1024;
      *(_DWORD *)&v27[10] = v17;
      v28 = 2112;
      v29 = v18;
      _os_log_error_impl(&dword_1CBD43000, v19, (os_log_type_t)0x90u, "[ERROR] symlinkat('%@', %d, '%@') failed %{errno}d%@", (uint8_t *)&v24, 0x2Cu);
    }

    goto LABEL_10;
  }
  v6 = objc_retainAutorelease(v5);
  v7 = (const char *)objc_msgSend(v6, "fileSystemRepresentation");
  v13 = BRCOpenAt(a2, v7, 32772, v8, v9, v10, v11, v12, v24);
  if ((v13 & 0x80000000) != 0)
  {
    v17 = *__error();
    brc_bread_crumbs();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, (os_log_type_t)0x90u))
    {
      v24 = 67109890;
      *(_DWORD *)v25 = a2;
      *(_WORD *)&v25[4] = 2112;
      *(_QWORD *)&v25[6] = v6;
      v26 = 1024;
      *(_DWORD *)v27 = v17;
      *(_WORD *)&v27[4] = 2112;
      *(_QWORD *)&v27[6] = v20;
      _os_log_error_impl(&dword_1CBD43000, v21, (os_log_type_t)0x90u, "[ERROR] openat(%d, '%@') failed %{errno}d%@", (uint8_t *)&v24, 0x22u);
    }

LABEL_10:
    *__error() = v17;
    v15 = 0xFFFFFFFFLL;
    goto LABEL_11;
  }
  v14 = v13;
  v15 = _fstatItem(v13, *(_QWORD **)(a1 + 40), *(_DWORD **)(a1 + 48), 0, 0, 0);
  v16 = *__error();
  close(v14);
  *__error() = v16;
LABEL_11:

  return v15;
}

- (void)applyMetadataOnFileDescriptor:(int)a3 liveFileDescriptor:(int)a4 itemID:(id)a5 clientZone:(id)a6 statInfo:(id)a7 version:(id)a8 sharingOptions:(unint64_t)a9
{
  id v14;
  id v15;
  id v16;
  BRCStageRegistry *v17;
  id v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  unsigned int v22;
  int v23;
  time_t v24;
  int v25;
  int v26;
  void *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  __darwin_time_t tv_sec;
  int v32;
  int v33;
  void *v34;
  void *v35;
  int v36;
  char v37;
  void *v38;
  uint64_t v39;
  char v40;
  int v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  void *v48;
  int v49;
  uint64_t v50;
  void *v51;
  NSObject *v52;
  id v53;
  int v54;
  void *v55;
  NSObject *v56;
  void *v57;
  id v58;
  int v59;
  void *v60;
  id v61;
  int v62;
  void *v63;
  NSObject *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  char *v69;
  void *v70;
  NSObject *v71;
  void *v72;
  NSObject *v73;
  BOOL v74;
  id v75;
  void *v76;
  NSObject *v77;
  void *v78;
  void *v79;
  BRFieldXattrBlob *v80;
  BOOL v81;
  id v82;
  void *v83;
  NSObject *v84;
  void *v85;
  void *v86;
  void *v87;
  BRFieldXattrBlob *v88;
  BOOL v89;
  void *v90;
  void *v91;
  void *v92;
  NSObject *v93;
  void *v94;
  uint64_t v95;
  BRFieldFinderTags *v96;
  void *v97;
  BRFieldFinderTags *v98;
  void *v99;
  void *v100;
  void *v101;
  id v102;
  uint64_t v103;
  ssize_t v104;
  void *v105;
  id v106;
  id v107;
  const char **v108;
  unsigned int v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  void *v113;
  const char *v114;
  id v115;
  int v116;
  void *v117;
  NSObject *v118;
  void *v119;
  NSObject *v120;
  const char *v121;
  const char *v122;
  void *v123;
  NSObject *v124;
  int v125;
  void *v126;
  NSObject *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  BRFieldXattrBlob *v132;
  void *v133;
  id v134;
  id v135;
  void *v136;
  id v137;
  id v138;
  void *v139;
  void *v140;
  unsigned int fd;
  id v143;
  id v144;
  id v145;
  id v146;
  id v147;
  _QWORD v148[3];
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  int v154;
  stat v155;
  uint64_t v156;

  v156 = *MEMORY[0x1E0C80C00];
  v138 = a5;
  v14 = a6;
  v15 = a7;
  v16 = a8;
  v17 = self;
  -[BRCAccountSession clientDB](self->_session, "clientDB");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "assertOnQueue");

  if (!v14)
  {
    brc_bread_crumbs();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      v155.st_dev = 138412802;
      *(_QWORD *)&v155.st_mode = v15;
      WORD2(v155.st_ino) = 2112;
      *(__darwin_ino64_t *)((char *)&v155.st_ino + 6) = (__darwin_ino64_t)v16;
      HIWORD(v155.st_gid) = 2112;
      *(_QWORD *)&v155.st_rdev = v19;
      _os_log_fault_impl(&dword_1CBD43000, v20, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: nil client zone when applying %@ and %@%@", (uint8_t *)&v155, 0x20u);
    }

  }
  v154 = 0;
  v152 = 0u;
  v153 = 0u;
  v150 = 0u;
  v151 = 0u;
  v149 = 0u;
  v21 = 0;
  v22 = objc_msgSend(v15, "type") + 1;
  fd = a3;
  if (v22 > 0xB)
  {
    v23 = 0;
  }
  else if (((1 << v22) & 0x38C) != 0)
  {
    v23 = objc_msgSend(v16, "isPackage");
    v21 = 1;
  }
  else if (((1 << v22) & 0xC22) != 0)
  {
    v21 = 0;
    v23 = 1;
  }
  else
  {
    v23 = 0;
    if (!v22)
    {
      brc_bread_crumbs();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
        -[BRCStageRegistry(LegacyAdditions) applyMetadataOnFileDescriptor:liveFileDescriptor:itemID:clientZone:statInfo:version:sharingOptions:].cold.13();

      v21 = 0;
      v23 = 0;
    }
  }
  v154 = 0;
  v152 = 0u;
  v153 = 0u;
  v150 = 0u;
  v151 = 0u;
  v149 = 0u;
  v148[1] = 0;
  v148[2] = 0;
  v148[0] = 0x2560000000005;
  *(_QWORD *)&v149 = objc_msgSend(v15, "birthtime");
  *(_QWORD *)&v151 = time(0);
  if (v16)
    v24 = objc_msgSend(v16, "mtime");
  else
    v24 = time(0);
  *(_QWORD *)&v150 = v24;
  v139 = v16;
  if (((v21 | v23 ^ 1) & 1) == 0
    && (!objc_msgSend(v15, "state") || objc_msgSend(v15, "state") == -1))
  {
    memset(&v155.st_blksize, 0, 32);
    if (a4 >= 0)
      v25 = a4;
    else
      v25 = a3;
    memset(&v155, 0, 112);
    if (fstat(v25, &v155))
    {
      v26 = *__error();
      brc_bread_crumbs();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, (os_log_type_t)0x90u))
        -[BRCStageRegistry(LegacyAdditions) applyMetadataOnFileDescriptor:liveFileDescriptor:itemID:clientZone:statInfo:version:sharingOptions:].cold.12();

      *__error() = v26;
    }
    else
    {
      tv_sec = v155.st_birthtimespec.tv_sec;
      if ((BRCIsBusyDate(v155.st_birthtimespec.tv_sec) & 1) != 0)
        *(_QWORD *)&v149 = tv_sec;
    }
  }
  if (a4 >= 0)
    v32 = a4;
  else
    v32 = fd;
  fgetxattr(v32, "com.apple.FinderInfo", &v152, 0x20uLL, 0, 0);
  v33 = objc_msgSend(v15, "isHiddenExt");
  objc_msgSend(v15, "logicalName");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "br_pathExtension");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "isEqualToString:", CFSTR("app"));

  if (v36 | v33)
    v37 = 16;
  else
    v37 = 0;
  BYTE9(v152) = BYTE9(v152) & 0xEF | v37;
  objc_msgSend(v15, "finderTags");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "length");

  if (v39)
  {
    if ((BYTE9(v152) & 0xE) != 0)
      goto LABEL_41;
    v40 = BYTE9(v152) & 0xF1 | 2;
  }
  else
  {
    if (!objc_msgSend(v14, "isPrivateZone"))
      goto LABEL_41;
    v40 = BYTE9(v152) & 0xF1;
  }
  BYTE9(v152) = v40;
LABEL_41:
  if ((v21 & v23) == 1)
    BYTE8(v152) |= 0x20u;
  if (objc_msgSend(v15, "type") == 6)
    BYTE8(v152) |= 0x80u;
  v154 = +[BRCStageRegistry computeItemModeFromStatInfo:isPackage:](BRCStageRegistry, "computeItemModeFromStatInfo:isPackage:", v15, v21 & v23);
  if (fcntl(fd, 64, 3))
  {
    v41 = *__error();
    brc_bread_crumbs();
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, (os_log_type_t)0x90u))
      -[BRCStageRegistry(LegacyAdditions) applyMetadataOnFileDescriptor:liveFileDescriptor:itemID:clientZone:statInfo:version:sharingOptions:].cold.11();

    *__error() = v41;
  }
  objc_msgSend(v14, "mangledID");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  v140 = v45;
  if (objc_msgSend(v15, "type") == 4)
  {
    v46 = objc_msgSend(v45, "stageFSRootUmask");
  }
  else if ((v23 & 1) != 0 || objc_msgSend(v139, "isPackage"))
  {
    v46 = objc_msgSend(v45, "stageDirectoryUmask");
  }
  else
  {
    v46 = objc_msgSend(v45, "stageFileUmask");
  }
  v154 &= ~v46;
  objc_msgSend(v15, "trashPutBackPath");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "pathComponents");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v48, "containsObject:", CFSTR(".Trash"));

  v50 = fd;
  if (v49)
  {
    brc_bread_crumbs();
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
      -[BRCStageRegistry(LegacyAdditions) applyMetadataOnFileDescriptor:liveFileDescriptor:itemID:clientZone:statInfo:version:sharingOptions:].cold.8(v15, (uint64_t)v51, v52);
LABEL_65:

    goto LABEL_66;
  }
  objc_msgSend(v15, "trashPutBackPath");
  v53 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v54 = brc_set_or_remove_xattr(fd, "com.apple.trash.put-back.path#PS", (char *)objc_msgSend(v53, "fileSystemRepresentation"));

  if (v54)
  {
    brc_bread_crumbs();
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, (os_log_type_t)0x90u))
      -[BRCStageRegistry(LegacyAdditions) applyMetadataOnFileDescriptor:liveFileDescriptor:itemID:clientZone:statInfo:version:sharingOptions:].cold.10();

  }
  objc_msgSend(v15, "trashPutBackParentID");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "zoneUniqueItemIDStringWithSession:", v17->_session);
  v58 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v59 = brc_set_or_remove_xattr(fd, "com.apple.trash.put-back.icloud-parent-id#PS", (char *)objc_msgSend(v58, "UTF8String"));

  if (v59)
  {
    brc_bread_crumbs();
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, (os_log_type_t)0x90u))
      -[BRCStageRegistry(LegacyAdditions) applyMetadataOnFileDescriptor:liveFileDescriptor:itemID:clientZone:statInfo:version:sharingOptions:].cold.9();
    goto LABEL_65;
  }
LABEL_66:
  if (objc_msgSend(v15, "favoriteRank"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v15, "favoriteRank"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "stringValue");
    v61 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v62 = brc_set_or_remove_xattr(fd, "com.apple.favorite-rank.number#PS", (char *)objc_msgSend(v61, "UTF8String"));

    if (!v62)
      goto LABEL_68;
  }
  else if (!brc_set_or_remove_xattr(fd, "com.apple.favorite-rank.number#PS", 0))
  {
LABEL_68:
    if ((a9 & 4) == 0)
      goto LABEL_76;
    goto LABEL_74;
  }
  brc_bread_crumbs();
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v64 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v64, (os_log_type_t)0x90u))
    -[BRCStageRegistry(LegacyAdditions) applyMetadataOnFileDescriptor:liveFileDescriptor:itemID:clientZone:statInfo:version:sharingOptions:].cold.7();

  if ((a9 & 4) == 0)
    goto LABEL_76;
LABEL_74:
  if (objc_msgSend(v14, "isSharedZone"))
  {
    v65 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v138, "itemIDString");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "serverZone");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "bookmarkDataWithItemResolutionString:serverZone:", v66, v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_77;
  }
LABEL_76:
  v68 = 0;
LABEL_77:
  v134 = objc_retainAutorelease(v68);
  v69 = (char *)objc_msgSend(v134, "UTF8String");
  if (brc_set_or_remove_xattr(fd, "com.apple.clouddocs.private.share-bookmark#B", v69))
  {
    if (!v69)
      brc_set_or_remove_xattr_data(fd, "com.apple.finder.copy.preserveinbackups.com.apple.clouddocs.private.share-bookmark#N", 0, 0);
    brc_bread_crumbs();
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v71 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v71, (os_log_type_t)0x90u))
      -[BRCStageRegistry(LegacyAdditions) applyMetadataOnFileDescriptor:liveFileDescriptor:itemID:clientZone:statInfo:version:sharingOptions:].cold.6();

  }
  if (objc_msgSend(v15, "lastUsedTime"))
  {
    *(_QWORD *)&v155.st_dev = 0;
    v155.st_ino = 0;
    *(_QWORD *)&v155.st_dev = objc_msgSend(v15, "lastUsedTime");
    v155.st_ino = 0;
    if ((BRSetLastUsedDate() & 0x80000000) == 0)
      goto LABEL_92;
    brc_bread_crumbs();
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v73 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v73, (os_log_type_t)0x90u))
      -[BRCStageRegistry(LegacyAdditions) applyMetadataOnFileDescriptor:liveFileDescriptor:itemID:clientZone:statInfo:version:sharingOptions:].cold.5();
    goto LABEL_91;
  }
  if (fremovexattr(fd, "com.apple.lastuseddate#PS", 0) < 0 && *__error() != 93)
  {
    brc_bread_crumbs();
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v73 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v73, (os_log_type_t)0x90u))
      -[BRCStageRegistry(LegacyAdditions) applyMetadataOnFileDescriptor:liveFileDescriptor:itemID:clientZone:statInfo:version:sharingOptions:].cold.4();
LABEL_91:

  }
LABEL_92:
  v137 = v14;
  v147 = 0;
  v74 = +[BRFieldXattrBlob removeXattrsOnFD:includingContentRelated:error:](BRFieldXattrBlob, "removeXattrsOnFD:includingContentRelated:error:", fd, v21, &v147);
  v75 = v147;
  if (!v74)
  {
    brc_bread_crumbs();
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v77 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v77, (os_log_type_t)0x90u))
      -[BRCStageRegistry(LegacyAdditions) applyMetadataOnFileDescriptor:liveFileDescriptor:itemID:clientZone:statInfo:version:sharingOptions:].cold.3();

  }
  -[BRCAccountSession stageRegistry](v17->_session, "stageRegistry");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "lazyXattrWithStageRegistry:", v78);
  v79 = (void *)objc_claimAutoreleasedReturnValue();

  if (v79)
  {
    v80 = -[BRFieldXattrBlob initWithData:]([BRFieldXattrBlob alloc], "initWithData:", v79);
    v146 = v75;
    v81 = -[BRFieldXattrBlob applyToFileDescriptor:error:](v80, "applyToFileDescriptor:error:", fd, &v146);
    v82 = v146;

    if (!v81)
    {
      brc_bread_crumbs();
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v84 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v84, (os_log_type_t)0x90u))
      {
        objc_msgSend(v15, "xattrSignature");
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v136, "brc_hexadecimalString");
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        v155.st_dev = 138412802;
        *(_QWORD *)&v155.st_mode = v128;
        WORD2(v155.st_ino) = 2112;
        *(__darwin_ino64_t *)((char *)&v155.st_ino + 6) = (__darwin_ino64_t)v82;
        HIWORD(v155.st_gid) = 2112;
        *(_QWORD *)&v155.st_rdev = v83;
        _os_log_error_impl(&dword_1CBD43000, v84, (os_log_type_t)0x90u, "[ERROR] Unable to set structural xattrs for signature %@: %@%@", (uint8_t *)&v155, 0x20u);

      }
      v50 = fd;
    }
  }
  else
  {
    v80 = 0;
    v82 = v75;
  }
  -[BRCAccountSession stageRegistry](v17->_session, "stageRegistry");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = v139;
  objc_msgSend(v139, "lazyXattrWithStageRegistry:", v85);
  v87 = (void *)objc_claimAutoreleasedReturnValue();

  if (v87)
  {
    v88 = -[BRFieldXattrBlob initWithData:]([BRFieldXattrBlob alloc], "initWithData:", v87);

    v145 = v82;
    v89 = -[BRFieldXattrBlob applyToFileDescriptor:error:](v88, "applyToFileDescriptor:error:", v50, &v145);
    v135 = v145;

    v90 = v138;
    if (v89)
    {
      v91 = v137;
    }
    else
    {
      brc_bread_crumbs();
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v93 = objc_claimAutoreleasedReturnValue();
      v91 = v137;
      if (os_log_type_enabled(v93, (os_log_type_t)0x90u))
      {
        objc_msgSend(v139, "xattrSignature");
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v129, "brc_hexadecimalString");
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        v155.st_dev = 138412802;
        *(_QWORD *)&v155.st_mode = v130;
        WORD2(v155.st_ino) = 2112;
        *(__darwin_ino64_t *)((char *)&v155.st_ino + 6) = (__darwin_ino64_t)v135;
        HIWORD(v155.st_gid) = 2112;
        *(_QWORD *)&v155.st_rdev = v92;
        _os_log_error_impl(&dword_1CBD43000, v93, (os_log_type_t)0x90u, "[ERROR] Unable to set structural xattrs for signature %@: %@%@", (uint8_t *)&v155, 0x20u);

        v86 = v139;
      }

    }
  }
  else
  {
    v88 = v80;
    v135 = v82;
    v91 = v137;
    v90 = v138;
  }
  objc_msgSend(v15, "finderTags");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = objc_msgSend(v94, "length");

  if (v95)
  {
    v96 = [BRFieldFinderTags alloc];
    objc_msgSend(v15, "finderTags");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = -[BRFieldFinderTags initWithData:](v96, "initWithData:", v97);

    v99 = (void *)MEMORY[0x1E0CB36F8];
    -[BRFieldFinderTags tags](v98, "tags");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "archivedDataWithRootObject:requiringSecureCoding:error:", v100, 1, 0);
    v101 = (void *)objc_claimAutoreleasedReturnValue();

    v102 = objc_retainAutorelease(v101);
    brc_set_or_remove_xattr_data(v50, "com.apple.metadata:_kMDItemUserTags", (const void *)objc_msgSend(v102, "bytes"), objc_msgSend(v102, "length"));

  }
  else
  {
    fremovexattr(v50, "com.apple.metadata:_kMDItemUserTags", 0);
  }
  v103 = objc_msgSend(v140, "maxPreservedXattrBlobSize");
  if ((a4 & 0x80000000) == 0)
  {
    v104 = v103;
    if (v103)
    {
      v133 = v87;
      v144 = 0;
      v105 = (void *)objc_msgSend((id)objc_opt_new(), "initWithFD:sizeLimit:syncable:error:", a4, v103, 0, &v144);
      v106 = v144;
      v131 = v105;
      v132 = v88;
      if (v105)
      {
        v107 = objc_retainAutorelease(v105);
        v108 = (const char **)objc_msgSend(v107, "structuralXattrNamesBegin");
        v109 = objc_msgSend(v107, "structuralXattrNamesCount");
        if (v109)
        {
          v110 = v109;
          do
          {
            v111 = v106;
            v112 = *v108;
            v143 = v106;
            BRCGetXattrValue(a4, v112, v104, &v143);
            v113 = (void *)objc_claimAutoreleasedReturnValue();
            v106 = v143;

            if (v113)
            {
              v114 = *v108;
              v115 = objc_retainAutorelease(v113);
              if (fsetxattr(fd, v114, (const void *)objc_msgSend(v115, "bytes"), objc_msgSend(v115, "length"), 0, 2)
                && *__error() != 17)
              {
                v116 = *__error();
                brc_bread_crumbs();
                v117 = (void *)objc_claimAutoreleasedReturnValue();
                brc_default_log();
                v118 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v118, (os_log_type_t)0x90u))
                {
                  v122 = *v108;
                  v155.st_dev = 136315650;
                  *(_QWORD *)&v155.st_mode = v122;
                  WORD2(v155.st_ino) = 1024;
                  *(_DWORD *)((char *)&v155.st_ino + 6) = v116;
                  HIWORD(v155.st_uid) = 2112;
                  *(_QWORD *)&v155.st_gid = v117;
                  _os_log_error_impl(&dword_1CBD43000, v118, (os_log_type_t)0x90u, "[ERROR] fsetxattr(%s) failed %{errno}d%@", (uint8_t *)&v155, 0x1Cu);
                }

                *__error() = v116;
              }
            }
            else
            {
              brc_bread_crumbs();
              v119 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v120 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v120, (os_log_type_t)0x90u))
              {
                v121 = *v108;
                v155.st_dev = 136315650;
                *(_QWORD *)&v155.st_mode = v121;
                WORD2(v155.st_ino) = 2112;
                *(__darwin_ino64_t *)((char *)&v155.st_ino + 6) = (__darwin_ino64_t)v106;
                HIWORD(v155.st_gid) = 2112;
                *(_QWORD *)&v155.st_rdev = v119;
                _os_log_error_impl(&dword_1CBD43000, v120, (os_log_type_t)0x90u, "[ERROR] cannot read xattr '%s': %@%@", (uint8_t *)&v155, 0x20u);
              }

            }
            ++v108;
            --v110;
          }
          while (v110);
        }
      }
      else
      {
        brc_bread_crumbs();
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v124 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v124, (os_log_type_t)0x90u))
          -[BRCStageRegistry(LegacyAdditions) applyMetadataOnFileDescriptor:liveFileDescriptor:itemID:clientZone:statInfo:version:sharingOptions:].cold.2();

      }
      v91 = v137;
      v90 = v138;
      v86 = v139;
      v50 = fd;
      v88 = v132;
      v87 = v133;
    }
  }
  if (BRCFSetAttrList(v50, v148, &v149, 0x54uLL))
  {
    v125 = *__error();
    brc_bread_crumbs();
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v127 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v127, (os_log_type_t)0x90u))
      -[BRCStageRegistry(LegacyAdditions) applyMetadataOnFileDescriptor:liveFileDescriptor:itemID:clientZone:statInfo:version:sharingOptions:].cold.1();

    *__error() = v125;
  }
  +[BRCStageRegistry applySharingReadonlyACLsToFD:statInfo:version:clientZone:sharingOptions:](BRCStageRegistry, "applySharingReadonlyACLsToFD:statInfo:version:clientZone:sharingOptions:", v50, v15, v86, v91, a9);

}

+ (BOOL)applySharingReadonlyACLsToFD:(int)a3 statInfo:(id)a4 version:(id)a5 clientZone:(id)a6 sharingOptions:(unint64_t)a7
{
  char v7;
  id v11;
  id v12;
  unsigned int v13;
  _acl *v14;
  int v15;
  void *v16;
  NSObject *v17;
  acl_permset_mask_t v18;
  int v19;
  void *v20;
  NSObject *v21;
  acl_t v22;
  void *v23;
  char v24;
  int v25;
  void *v26;
  NSObject *v27;
  BOOL v28;
  acl_entry_t entry_d;
  group *v31;
  group v32;
  acl_t acl_p;
  char v34[1024];
  uuid_t uu;
  uint64_t v36;

  v7 = a7;
  v36 = *MEMORY[0x1E0C80C00];
  v11 = a5;
  v12 = a6;
  v13 = objc_msgSend(a4, "type");
  if (v13 <= 0xA && ((1 << v13) & 0x611) != 0)
  {
    if ((objc_msgSend(v12, "isPrivateZone") & 1) == 0)
      goto LABEL_4;
LABEL_29:
    v28 = 1;
    goto LABEL_30;
  }
  objc_msgSend(v11, "contentSignature");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v23, "brc_signatureIsPackage") & 1) == 0)
  {

    goto LABEL_29;
  }
  v24 = objc_msgSend(v12, "isPrivateZone");

  if ((v24 & 1) != 0)
    goto LABEL_29;
LABEL_4:
  v14 = acl_init(0);
  acl_p = v14;
  if ((v7 & 0x20) == 0)
  {
    if (acl_set_fd_np(a3, v14, ACL_TYPE_EXTENDED))
    {
      v15 = *__error();
      brc_bread_crumbs();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, (os_log_type_t)0x90u))
        +[BRCStageRegistry(LegacyAdditions) applySharingReadonlyACLsToFD:statInfo:version:clientZone:sharingOptions:].cold.1();

      *__error() = v15;
      free(v14);
      goto LABEL_25;
    }
    goto LABEL_28;
  }
  memset(&v32, 0, sizeof(v32));
  memset(uu, 0, sizeof(uu));
  v31 = 0;
  if (getgrnam_r("everyone", &v32, v34, 0x400uLL, &v31) || !v31)
  {
    v25 = *__error();
    brc_bread_crumbs();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, (os_log_type_t)0x90u))
      +[BRCStageRegistry(LegacyAdditions) applySharingReadonlyACLsToFD:statInfo:version:clientZone:sharingOptions:].cold.3();

    *__error() = v25;
    v22 = v14;
  }
  else
  {
    mbr_gid_to_uuid(v31->gr_gid, uu);
    entry_d = 0;
    acl_create_entry_np(&acl_p, &entry_d, 0);
    if ((v7 & 4) != 0)
      v18 = 4;
    else
      v18 = 36;
    acl_set_permset_mask_np(entry_d, v18);
    acl_set_tag_type(entry_d, ACL_EXTENDED_DENY);
    acl_set_qualifier(entry_d, uu);
    if (!acl_set_fd_np(a3, acl_p, ACL_TYPE_EXTENDED))
    {
      v14 = acl_p;
LABEL_28:
      acl_free(v14);
      goto LABEL_29;
    }
    v19 = *__error();
    brc_bread_crumbs();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, (os_log_type_t)0x90u))
      +[BRCStageRegistry(LegacyAdditions) applySharingReadonlyACLsToFD:statInfo:version:clientZone:sharingOptions:].cold.2();

    *__error() = v19;
    v22 = acl_p;
  }
  acl_free(v22);
LABEL_25:
  v28 = 0;
LABEL_30:

  return v28;
}

- (void)_openStageDirectory:(os_log_t)log .cold.1(uint64_t a1, int a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109378;
  v3[1] = a2;
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_1CBD43000, log, (os_log_type_t)0x90u, "[ERROR] Can't set data protection %{errno}d%@", (uint8_t *)v3, 0x12u);
  OUTLINED_FUNCTION_2();
}

- (void)_pathInStage:(uint64_t)a1 index:(uint64_t)a2 generationID:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  __error();
  v6 = 134218498;
  v7 = a2;
  OUTLINED_FUNCTION_9_3();
  v8 = a1;
  _os_log_debug_impl(&dword_1CBD43000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] can't open by fileID:%llu %{errno}d%@", (uint8_t *)&v6, 0x1Cu);
  OUTLINED_FUNCTION_5_0();
}

- (void)pendingFetchRecordDirExistsInStageWithStartingChangeToken:recordZoneID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _stageDirectoryPath[kBRCStageDirectoryForPendingFetchStream] != nil%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)existsInStage:generationID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] fileID:0 doesn't exist in stage (metadata-only update)%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __65__BRCStageRegistry_lowDiskStatusChangedForDevice_hasEnoughSpace___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] running GC because we are in low disk space%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)purgableSpace
{
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  __error();
  v6 = 138412802;
  v7 = a1;
  OUTLINED_FUNCTION_9_3();
  v8 = a2;
  _os_log_error_impl(&dword_1CBD43000, a3, (os_log_type_t)0x90u, "[ERROR] fts_open(%@) failed %{errno}d%@", (uint8_t *)&v6, 0x1Cu);
  OUTLINED_FUNCTION_5_0();
}

- (void)purgeGraveyardSpace:(uint64_t)a1 withUrgency:.cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 134218242;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(*(_QWORD *)a1 + 24);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] Collected %lld bytes from purging the graveyard%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void __65__BRCStageRegistry__garbageCollectUploadsIncludingActiveUploads___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] removing staged file for upload: %@%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void __41__BRCStageRegistry__garbageCollectFaults__block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 134218242;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 8);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v1, v2, "[DEBUG] removing staged file with id %llu%@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2();
}

void __55__BRCStageRegistry__processPendingListDatabaseObjects___block_invoke_cold_1(uint64_t a1)
{
  os_log_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412546;
  v3 = a1;
  OUTLINED_FUNCTION_5();
  _os_log_fault_impl(&dword_1CBD43000, v1, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Unexpected record name %@%@", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_2();
}

void __43__BRCStageRegistry__removeUnusedXattrBlobs__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: components.count == 1%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_garbageCollectUploadThumbnailsIncludingActiveUploads:(char)a1 .cold.1(char a1)
{
  const char *v1;
  uint64_t v2;
  os_log_t v3;
  __int128 v4;

  v1 = "YES";
  if ((a1 & 1) == 0)
    v1 = "NO";
  LODWORD(v4) = 136315394;
  *(_QWORD *)((char *)&v4 + 4) = v1;
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v2, v3, "[DEBUG] _garbageCollectUploadThumbnailsIncludingActiveUploads: [%s]%@", (_QWORD)v4, DWORD2(v4));
  OUTLINED_FUNCTION_2();
}

- (void)garbageCollectSpace:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 134218242;
  *(_QWORD *)&v3[4] = a2;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a1;
  OUTLINED_FUNCTION_0(&dword_1CBD43000, a2, a3, "[DEBUG] starting garbage collection at %ld%@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_2();
}

void __63__BRCStageRegistry__updatePersistedStateWithLatestGCStartTime___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 224);
  if (v4)
    v4 = *(_QWORD *)(v4 + 16);
  v5 = 134218498;
  v6 = v3;
  v7 = 2048;
  v8 = v4;
  v9 = 2112;
  v10 = a2;
  _os_log_debug_impl(&dword_1CBD43000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] latest GC:%ld; previous GC:%ld%@",
    (uint8_t *)&v5,
    0x20u);
}

void __26__BRCStageRegistry_resume__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _persistedState%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __26__BRCStageRegistry_resume__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: !_persistedState%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)saveXattrAtURL:forSignature:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: Asked to save xattr without url%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)saveXattrBlob:(void *)a1 forSignature:(uint64_t)a2 error:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_2(&dword_1CBD43000, a3, v5, "[DEBUG] Saving an xattr signature that already exists! %@%@", v6);

  OUTLINED_FUNCTION_6();
}

- (void)saveXattrBlob:forSignature:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: Asked to save xattr without signature or data%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)loadXattrBlobForSignature:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: Asked for xattr without signature%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __77__BRCStageRegistry_LegacyAdditions__moveToGraveyardFromPath_forItemID_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Failing the move to graveyard because the item is busy%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __77__BRCStageRegistry_LegacyAdditions__moveToGraveyardFromPath_forItemID_error___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Making the move to the graveyard succeed even though the file doesn't exists anymore%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
