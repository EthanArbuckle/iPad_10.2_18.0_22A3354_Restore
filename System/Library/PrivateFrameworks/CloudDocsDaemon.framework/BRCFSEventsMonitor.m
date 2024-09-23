@implementation BRCFSEventsMonitor

- (BOOL)volumeIsCaseSensitive
{
  return -[BRCVolume isCaseSensitive](self->_volume, "isCaseSensitive");
}

- (BOOL)setUpRoot:(id)a3 isImmutableRoot:(BOOL)a4 volume:(id)a5 error:(id *)a6
{
  _BOOL4 v8;
  id v11;
  id v12;
  BRCRelativePath **p_root;
  BRCRelativePath *root;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  BRCRelativePath *v26;
  unint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  NSObject *v31;
  BOOL v32;
  void *v33;
  void *v34;
  id v35;
  NSString *v36;
  NSString *devicePath;
  void *v38;
  NSObject *v39;
  BRCRelativePath *v41;
  const char *v42;
  const char *v43;
  void *v44;
  NSObject *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t (*v48)(_QWORD *, int);
  void *v49;
  BRCFSEventsMonitor *v50;
  id v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  int v57;
  uint8_t buf[4];
  const char *v59;
  __int16 v60;
  _BYTE v61[18];
  __int16 v62;
  void *v63;
  uint64_t v64;

  v8 = a4;
  v64 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v57 = 0;
  v53 = 0;
  v54 = &v53;
  v55 = 0x2020000000;
  v56 = 0;
  if (!v12)
  {
    brc_bread_crumbs();
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
      -[BRCFSEventsMonitor setUpRoot:isImmutableRoot:volume:error:].cold.2();

  }
  p_root = &self->_root;
  objc_storeStrong((id *)&self->_root, a3);
  objc_storeStrong((id *)&self->_volume, a5);
  root = self->_root;
  if (v8)
  {
    v46 = MEMORY[0x1E0C809B0];
    v47 = 3221225472;
    v48 = __61__BRCFSEventsMonitor_setUpRoot_isImmutableRoot_volume_error___block_invoke;
    v49 = &unk_1E8767C60;
    v50 = self;
    v51 = v11;
    v52 = &v53;
    -[BRCRelativePath performOnOpenFileDescriptor:error:](root, "performOnOpenFileDescriptor:error:", &v46, &v57);
    if (v57)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithPOSIXCode:", v46, v47, v48, v49, v50);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        brc_bread_crumbs();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, (os_log_type_t)0x90u))
        {
          v42 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          v59 = "-[BRCFSEventsMonitor setUpRoot:isImmutableRoot:volume:error:]";
          v60 = 2080;
          if (!a6)
            v42 = "(ignored by caller)";
          *(_QWORD *)v61 = v42;
          *(_WORD *)&v61[8] = 2112;
          *(_QWORD *)&v61[10] = v15;
          v62 = 2112;
          v63 = v16;
          _os_log_error_impl(&dword_1CBD43000, v17, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        }

      }
      if (a6)
        *a6 = objc_retainAutorelease(v15);

LABEL_29:
      v32 = 0;
      goto LABEL_34;
    }

  }
  else if (-[BRCRelativePath resolveAndKeepOpenMustExist:error:](*p_root, "resolveAndKeepOpenMustExist:error:", 0, &v57))
  {
    v18 = -[BRCRelativePath fileID](*p_root, "fileID");
    v54[3] = v18;
    -[BRCRelativePath close](*p_root, "close");
  }
  else
  {
    brc_bread_crumbs();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      v41 = *p_root;
      *(_DWORD *)buf = 138412802;
      v59 = (const char *)v41;
      v60 = 1024;
      *(_DWORD *)v61 = v57;
      *(_WORD *)&v61[4] = 2112;
      *(_QWORD *)&v61[6] = v19;
      _os_log_debug_impl(&dword_1CBD43000, v20, OS_LOG_TYPE_DEBUG, "[DEBUG] root:%@ can't be opened %{errno}d%@", buf, 0x1Cu);
    }

  }
  brc_bread_crumbs();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v59 = (const char *)v11;
    v60 = 2112;
    *(_QWORD *)v61 = v12;
    *(_WORD *)&v61[8] = 2112;
    *(_QWORD *)&v61[10] = v21;
    _os_log_impl(&dword_1CBD43000, v22, OS_LOG_TYPE_DEFAULT, "[NOTICE] root:'%@' is on device: %@%@", buf, 0x20u);
  }

  v23 = v54[3];
  if (v23 != -[BRCFSEventsPersistedState rootID](self->_persistedState, "rootID"))
  {
    if (-[BRCFSEventsPersistedState rootID](self->_persistedState, "rootID") && v8)
    {
      brc_bread_crumbs();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = self->_root;
        v27 = -[BRCFSEventsPersistedState rootID](self->_persistedState, "rootID");
        v28 = v54[3];
        *(_DWORD *)buf = 138413058;
        v59 = (const char *)v26;
        v60 = 2048;
        *(_QWORD *)v61 = v27;
        *(_WORD *)&v61[8] = 2048;
        *(_QWORD *)&v61[10] = v28;
        v62 = 2112;
        v63 = v24;
        _os_log_impl(&dword_1CBD43000, v25, OS_LOG_TYPE_DEFAULT, "[WARNING] root %@ changed ino from %llu to %llu%@", buf, 0x2Au);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorWithPOSIXCode:", 70);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v29)
      {
        brc_bread_crumbs();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, (os_log_type_t)0x90u))
        {
          v43 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          v59 = "-[BRCFSEventsMonitor setUpRoot:isImmutableRoot:volume:error:]";
          v60 = 2080;
          if (!a6)
            v43 = "(ignored by caller)";
          *(_QWORD *)v61 = v43;
          *(_WORD *)&v61[8] = 2112;
          *(_QWORD *)&v61[10] = v29;
          v62 = 2112;
          v63 = v30;
          _os_log_error_impl(&dword_1CBD43000, v31, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        }

      }
      if (a6)
        *a6 = objc_retainAutorelease(v29);

      goto LABEL_29;
    }
    v33 = (void *)-[BRCFSEventsPersistedState copy](self->_persistedState, "copy", v46, v47, v48, v49, v50);
    objc_msgSend(v33, "setRootID:", -[BRCRelativePath fileID](*p_root, "fileID"));
    -[BRCFSEventsMonitor _updatePersistedStateWithState:](self, "_updatePersistedStateWithState:", v33);

  }
  v34 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v12, "mountPath", v46, v47, v48, v49, v50);
  v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v34, "br_pathWithFileSystemRepresentation:", objc_msgSend(v35, "fileSystemRepresentation"));
  v36 = (NSString *)objc_claimAutoreleasedReturnValue();
  devicePath = self->_devicePath;
  self->_devicePath = v36;

  brc_bread_crumbs();
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
    -[BRCFSEventsMonitor setUpRoot:isImmutableRoot:volume:error:].cold.1();

  v32 = 1;
LABEL_34:
  _Block_object_dispose(&v53, 8);

  return v32;
}

uint64_t __61__BRCFSEventsMonitor_setUpRoot_isImmutableRoot_volume_error___block_invoke(_QWORD *a1, int a2)
{
  int v5;
  void *v6;
  NSObject *v7;
  int v8;
  dispatch_source_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  dispatch_block_t v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1[4] + 168), "isDocument") & 1) != 0)
    return 20;
  if (fcntl(a2, 64, 3))
  {
    v5 = *__error();
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, (os_log_type_t)0x90u))
    {
      v19 = a1[5];
      *(_DWORD *)buf = 138412802;
      v23 = v19;
      v24 = 1024;
      v25 = v5;
      v26 = 2112;
      v27 = v6;
      _os_log_error_impl(&dword_1CBD43000, v7, (os_log_type_t)0x90u, "[ERROR] Can't set data protection on '%@' %{errno}d%@", buf, 0x1Cu);
    }

    *__error() = v5;
  }
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(*(id *)(a1[4] + 168), "fileID");
  v8 = dup(a2);
  v9 = dispatch_source_create(MEMORY[0x1E0C80DE8], v8, 0x21uLL, *(dispatch_queue_t *)(a1[4] + 80));
  v10 = a1[4];
  v11 = *(void **)(v10 + 48);
  *(_QWORD *)(v10 + 48) = v9;

  v12 = (void *)a1[5];
  v13 = *(void **)(a1[4] + 48);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __61__BRCFSEventsMonitor_setUpRoot_isImmutableRoot_volume_error___block_invoke_48;
  v20[3] = &unk_1E875D500;
  v21 = v12;
  v14 = v13;
  v15 = v20;
  v16 = v15;
  v17 = v15;
  if (*MEMORY[0x1E0D11070])
  {
    ((void (*)(_QWORD *))*MEMORY[0x1E0D11070])(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v18 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v17);
  dispatch_source_set_event_handler(v14, v18);

  return 0;
}

void __61__BRCFSEventsMonitor_setUpRoot_isImmutableRoot_volume_error___block_invoke_48(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  const char *v7;
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  abc_report_panic_with_signature();
  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "filename");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v2, "stringWithFormat:", CFSTR("the root %s was deleted by an external process"), objc_msgSend(v3, "fileSystemRepresentation"));
  objc_claimAutoreleasedReturnValue();

  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
  {
    brc_append_system_info_to_message();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v9 = v6;
    v10 = 2112;
    v11 = v4;
    _os_log_fault_impl(&dword_1CBD43000, v5, OS_LOG_TYPE_FAULT, "[CRIT] %@%@", buf, 0x16u);

  }
  brc_append_system_info_to_message();
  v7 = (const char *)objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
  __assert_rtn("-[BRCFSEventsMonitor setUpRoot:isImmutableRoot:volume:error:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/legacy/BRCFSEventsMonitor.m", 168, v7);
}

- (BOOL)setUpStreamSynchronously:(BOOL)a3 reason:(id)a4 error:(id *)a5
{
  _BOOL4 v6;
  __CFString *v8;
  const __CFUUID *v9;
  const __CFUUID *v10;
  CFStringRef v11;
  void *v12;
  double v13;
  CFTimeInterval v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  const __CFString *v19;
  FSEventStreamEventId v20;
  void *v21;
  __FSEventStream *stream;
  void *v23;
  int v24;
  int v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  NSObject *v36;
  NSObject *v37;
  OS_dispatch_source *v38;
  OS_dispatch_source *historicalEventSource;
  OS_dispatch_source *v40;
  id v41;
  NSObject *v42;
  id v43;
  void *v44;
  void *v45;
  dispatch_block_t v46;
  OS_dispatch_source *v47;
  NSObject *v48;
  _QWORD *v49;
  void *v50;
  uint64_t v51;
  void *v53;
  void *v54;
  int v55;
  void *v56;
  const char *v57;
  int v58;
  void *v59;
  unint64_t v60;
  void *v61;
  void *v62;
  int v63;
  int v64;
  void *v65;
  void *v66;
  _QWORD v67[4];
  NSObject *v68;
  _BYTE *v69;
  _QWORD v70[5];
  __CFString *v71;
  NSObject *v72;
  _BYTE *v73;
  FSEventStreamContext context;
  void *v75;
  _BYTE buf[48];
  uint64_t v77;

  v6 = a3;
  v77 = *MEMORY[0x1E0C80C00];
  v8 = (__CFString *)a4;
  self->_drainEvents = 0;
  -[BRCFSEventsPersistedState streamUUID](self->_persistedState, "streamUUID");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = FSEventsCopyUUIDForDevice(-[BRCVolume deviceID](self->_volume, "deviceID"));
  if (v9)
  {
    v10 = v9;
    v11 = CFUUIDCreateString(0, v9);
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v11);
    CFRelease(v11);
    CFRelease(v10);
  }
  else
  {
    v12 = 0;
  }
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "fseventsLatency");
  v14 = v13;
  if (v12)
  {
    if (v65)
    {
      if (objc_msgSend(v12, "isEqual:"))
      {
        brc_bread_crumbs();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          v58 = -[BRCVolume deviceID](self->_volume, "deviceID");
          objc_msgSend(v12, "UUIDString");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = -[BRCFSEventsPersistedState latestEventID](self->_persistedState, "latestEventID");
          *(_DWORD *)buf = 67110146;
          *(_DWORD *)&buf[4] = v58;
          *(_WORD *)&buf[8] = 2112;
          *(_QWORD *)&buf[10] = v59;
          *(_WORD *)&buf[18] = 2048;
          *(CFTimeInterval *)&buf[20] = v14;
          *(_WORD *)&buf[28] = 2048;
          *(_QWORD *)&buf[30] = v60;
          *(_WORD *)&buf[38] = 2112;
          *(_QWORD *)&buf[40] = v15;
          _os_log_debug_impl(&dword_1CBD43000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] resuming fsevents on device:%u uuid:%@ latency:%f from id:%llu%@", buf, 0x30u);

        }
        goto LABEL_22;
      }
      brc_bread_crumbs();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, (os_log_type_t)0x90u))
      {
        v64 = -[BRCVolume deviceID](self->_volume, "deviceID");
        objc_msgSend(v65, "UUIDString");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "UUIDString");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67110146;
        *(_DWORD *)&buf[4] = v64;
        *(_WORD *)&buf[8] = 2114;
        *(_QWORD *)&buf[10] = v61;
        *(_WORD *)&buf[18] = 2114;
        *(_QWORD *)&buf[20] = v62;
        *(_WORD *)&buf[28] = 2048;
        *(CFTimeInterval *)&buf[30] = v14;
        *(_WORD *)&buf[38] = 2112;
        *(_QWORD *)&buf[40] = v17;
        _os_log_error_impl(&dword_1CBD43000, v18, (os_log_type_t)0x90u, "[ERROR] device:%u changed uuid from %{public}@ to %{public}@ - falling back to full scan latency:%f%@", buf, 0x30u);

      }
      v19 = CFSTR("device changed fsevent UUID");
    }
    else
    {
      brc_bread_crumbs();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        v55 = -[BRCVolume deviceID](self->_volume, "deviceID");
        objc_msgSend(v12, "UUIDString");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)&buf[4] = v55;
        *(_WORD *)&buf[8] = 2112;
        *(_QWORD *)&buf[10] = v56;
        *(_WORD *)&buf[18] = 2048;
        *(CFTimeInterval *)&buf[20] = v14;
        *(_WORD *)&buf[28] = 2112;
        *(_QWORD *)&buf[30] = v17;
        _os_log_debug_impl(&dword_1CBD43000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] starting fsevents on device:%u uuid:%@ latency:%f%@", buf, 0x26u);

      }
      v19 = CFSTR("creating a new stream");
    }
  }
  else
  {
    brc_bread_crumbs();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v63 = -[BRCVolume deviceID](self->_volume, "deviceID");
      objc_msgSend(v65, "UUIDString");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(0, "UUIDString");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67110146;
      *(_DWORD *)&buf[4] = v63;
      *(_WORD *)&buf[8] = 2112;
      *(_QWORD *)&buf[10] = v53;
      *(_WORD *)&buf[18] = 2112;
      *(_QWORD *)&buf[20] = v54;
      *(_WORD *)&buf[28] = 2048;
      *(CFTimeInterval *)&buf[30] = v14;
      *(_WORD *)&buf[38] = 2112;
      *(_QWORD *)&buf[40] = v17;
      _os_log_debug_impl(&dword_1CBD43000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] device:%u changed uuid from %@ to %@ - falling back to full scan latency:%f%@", buf, 0x30u);

    }
    v19 = CFSTR("historical events not availible");
  }

  if (!v8)
    v8 = (__CFString *)v19;
  v15 = (void *)-[BRCFSEventsPersistedState copy](self->_persistedState, "copy");
  objc_msgSend(v15, "setStreamUUID:", v12);
  -[BRCFSEventsMonitor _updatePersistedStateWithState:](self, "_updatePersistedStateWithState:", v15);
LABEL_22:

  context.version = 0;
  memset(&context.retain, 0, 24);
  context.info = self;
  if (-[BRCFSEventsPersistedState latestEventID](self->_persistedState, "latestEventID"))
    v20 = -[BRCFSEventsPersistedState latestEventID](self->_persistedState, "latestEventID");
  else
    v20 = -1;
  -[BRCRelativePath absolutePath](self->_root, "absolutePath");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = v21;
  self->_stream = FSEventStreamCreate(0, (FSEventStreamCallback)fseventsCallback, &context, (CFArrayRef)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v75, 1), v20, v14, 0x31u);

  stream = self->_stream;
  if (stream)
  {
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "scheduleDeepScanOnFSEventsReset");

    if (v20 == -1)
      v25 = v24;
    else
      v25 = 0;
    if (v25 == 1)
    {
      -[BRCAccountSession(LegacyAdditions) fsReader](self->_session, "fsReader");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "lostScanGroup");
      v27 = objc_claimAutoreleasedReturnValue();

      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      buf[24] = 1;
      dispatch_group_enter(v27);
      v70[0] = MEMORY[0x1E0C809B0];
      v70[1] = 3221225472;
      v70[2] = __60__BRCFSEventsMonitor_setUpStreamSynchronously_reason_error___block_invoke;
      v70[3] = &unk_1E8764AD8;
      v70[4] = self;
      v71 = v8;
      v73 = buf;
      v28 = v27;
      v72 = v28;
      v29 = MEMORY[0x1D17A6DB0](v70);
      v30 = (void *)v29;
      if (v6)
      {
        (*(void (**)(uint64_t))(v29 + 16))(v29);
      }
      else
      {
        -[BRCAccountSession clientTruthWorkloop](self->_session, "clientTruthWorkloop");
        v37 = objc_claimAutoreleasedReturnValue();
        v38 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80D78], 0, 0, v37);
        historicalEventSource = self->_historicalEventSource;
        self->_historicalEventSource = v38;

        v40 = self->_historicalEventSource;
        v41 = v30;
        v42 = v40;
        v43 = v41;
        v44 = v43;
        v45 = v43;
        if (*MEMORY[0x1E0D11070])
        {
          ((void (*)(id))*MEMORY[0x1E0D11070])(v43);
          v45 = (void *)objc_claimAutoreleasedReturnValue();

        }
        v46 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v45);
        dispatch_source_set_event_handler(v42, v46);

        v47 = self->_historicalEventSource;
        v67[0] = MEMORY[0x1E0C809B0];
        v67[1] = 3221225472;
        v67[2] = __60__BRCFSEventsMonitor_setUpStreamSynchronously_reason_error___block_invoke_65;
        v67[3] = &unk_1E8760960;
        v69 = buf;
        v68 = v28;
        v48 = v47;
        v49 = v67;
        v50 = v49;
        if (*MEMORY[0x1E0D11070])
        {
          ((void (*)(_QWORD *))*MEMORY[0x1E0D11070])(v49);
          v51 = objc_claimAutoreleasedReturnValue();

          v50 = (void *)v51;
        }
        dispatch_source_set_cancel_handler(v48, v50);

        dispatch_source_merge_data((dispatch_source_t)self->_historicalEventSource, 1uLL);
      }

      _Block_object_dispose(buf, 8);
    }
    FSEventStreamSetDispatchQueue(self->_stream, (dispatch_queue_t)self->_streamQueue);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorFromErrno");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      brc_bread_crumbs();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, (os_log_type_t)0x90u))
      {
        v57 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = "-[BRCFSEventsMonitor setUpStreamSynchronously:reason:error:]";
        *(_WORD *)&buf[12] = 2080;
        if (!a5)
          v57 = "(ignored by caller)";
        *(_QWORD *)&buf[14] = v57;
        *(_WORD *)&buf[22] = 2112;
        *(_QWORD *)&buf[24] = v31;
        *(_WORD *)&buf[32] = 2112;
        *(_QWORD *)&buf[34] = v32;
        _os_log_error_impl(&dword_1CBD43000, v33, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a5)
      *a5 = objc_retainAutorelease(v31);

    v34 = *__error();
    brc_bread_crumbs();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, (os_log_type_t)0x90u))
      -[BRCFSEventsMonitor setUpStreamSynchronously:reason:error:].cold.1((uint64_t)v35, v34, v36);

    *__error() = v34;
  }

  return stream != 0;
}

void __60__BRCFSEventsMonitor_setUpStreamSynchronously_reason_error___block_invoke(uint64_t a1)
{
  void *v2;
  FSEventStreamEventId CurrentEventId;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8[3];
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  FSEventStreamEventId v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17A6BE8]();
  CurrentEventId = FSEventsGetCurrentEventId();
  memset(v8, 0, sizeof(v8));
  __brc_create_section(0, (uint64_t)"-[BRCFSEventsMonitor setUpStreamSynchronously:reason:error:]_block_invoke", 298, v8);
  brc_bread_crumbs();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = v8[0];
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "absolutePath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v10 = v6;
    v11 = 2112;
    v12 = v7;
    v13 = 2048;
    v14 = CurrentEventId;
    v15 = 2112;
    v16 = v4;
    _os_log_debug_impl(&dword_1CBD43000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx initial full scan of root:'%@' current-id:%llu%@", buf, 0x2Au);

  }
  objc_msgSend(*(id *)(a1 + 32), "fseventOnRootWithEventID:andReason:", CurrentEventId, *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  __brc_leave_section(v8);
  objc_autoreleasePoolPop(v2);
}

void __60__BRCFSEventsMonitor_setUpStreamSynchronously_reason_error___block_invoke_65(uint64_t a1)
{
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (BOOL)openWithRoot:(id)a3 volume:(id)a4 error:(id *)a5
{
  return -[BRCFSEventsMonitor openWithRoot:isImmutableRoot:volume:error:](self, "openWithRoot:isImmutableRoot:volume:error:", a3, 1, a4, a5);
}

- (BOOL)openWithRoot:(id)a3 isImmutableRoot:(BOOL)a4 volume:(id)a5 error:(id *)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  NSString *name;
  void *v15;
  BRCFSEventsPersistedState *v16;
  BRCFSEventsPersistedState *persistedState;
  BOOL v18;
  uint64_t v20[3];
  const __CFString *v21;
  NSString *v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v8 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  memset(v20, 0, sizeof(v20));
  __brc_create_section(0, (uint64_t)"-[BRCFSEventsMonitor openWithRoot:isImmutableRoot:volume:error:]", 333, v20);
  brc_bread_crumbs();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    v24 = v20[0];
    v25 = 2112;
    v26 = v10;
    v27 = 2112;
    v28 = v12;
    _os_log_debug_impl(&dword_1CBD43000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Start monitoring root at %@%@", buf, 0x20u);
  }

  name = self->_name;
  if (name)
  {
    v21 = CFSTR("name");
    v22 = name;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
  +[BRCFSEventsPersistedState loadFromClientStateInSession:options:](BRCFSEventsPersistedState, "loadFromClientStateInSession:options:", self->_session, v15);
  v16 = (BRCFSEventsPersistedState *)objc_claimAutoreleasedReturnValue();
  persistedState = self->_persistedState;
  self->_persistedState = v16;

  if (-[BRCFSEventsMonitor setUpRoot:isImmutableRoot:volume:error:](self, "setUpRoot:isImmutableRoot:volume:error:", v10, v8, v11, a6))
  {
    v18 = -[BRCFSEventsMonitor setUpStreamSynchronously:reason:error:](self, "setUpStreamSynchronously:reason:error:", 0, 0, a6);
  }
  else
  {
    v18 = 0;
  }

  __brc_leave_section(v20);
  return v18;
}

- (void)signalAfterCurrentFSEvent:(id)a3
{
  id v5;
  BRCFSEventsMonitor *v6;
  uint64_t v7;
  BRCFSEventsPersistedState *rendezVous;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  BRCFSEventsPersistedState *v13;
  BRCFSEventsPersistedState *persistedState;
  _QWORD block[5];
  uint8_t buf[4];
  BRCFSEventsPersistedState *v17;
  __int16 v18;
  BRCFSEventsPersistedState *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = self;
  objc_sync_enter(v6);
  objc_storeStrong((id *)&v6->_semaphore, a3);
  v7 = objc_opt_new();
  rendezVous = v6->_rendezVous;
  v6->_rendezVous = (BRCFSEventsPersistedState *)v7;

  -[BRCFSEventsPersistedState setRootID:](v6->_rendezVous, "setRootID:", -[BRCFSEventsPersistedState rootID](v6->_persistedState, "rootID"));
  -[BRCFSEventsPersistedState streamUUID](v6->_persistedState, "streamUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCFSEventsPersistedState setStreamUUID:](v6->_rendezVous, "setStreamUUID:", v9);

  -[BRCFSEventsPersistedState setLatestEventID:](v6->_rendezVous, "setLatestEventID:", FSEventsGetCurrentEventId());
  brc_bread_crumbs();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v13 = v6->_rendezVous;
    persistedState = v6->_persistedState;
    *(_DWORD *)buf = 138412802;
    v17 = v13;
    v18 = 2112;
    v19 = persistedState;
    v20 = 2112;
    v21 = v10;
    _os_log_debug_impl(&dword_1CBD43000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] setting rendez-vous:{%@} current:{%@}%@", buf, 0x20u);
  }

  objc_sync_exit(v6);
  dispatch_get_global_queue(0, 0);
  v12 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__BRCFSEventsMonitor_signalAfterCurrentFSEvent___block_invoke;
  block[3] = &unk_1E875D500;
  block[4] = v6;
  dispatch_async(v12, block);

}

void __48__BRCFSEventsMonitor_signalAfterCurrentFSEvent___block_invoke(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  int v3;

  v3 = 0;
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "performOnOpenFileDescriptor:error:", &__block_literal_global_66, &v3) & 1) == 0)
  {
    brc_bread_crumbs();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, (os_log_type_t)0x90u))
      __48__BRCFSEventsMonitor_signalAfterCurrentFSEvent___block_invoke_cold_1(&v3, (uint64_t)v1, v2);

  }
}

uint64_t __48__BRCFSEventsMonitor_signalAfterCurrentFSEvent___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int v15;
  uint64_t v16;
  int v17;
  void *v18;
  NSObject *v19;
  const char *v20;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("rendez-vous.%@.nosync"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_retainAutorelease(v6);
  v8 = (const char *)objc_msgSend(v7, "fileSystemRepresentation");
  v14 = BRCOpenAt(a2, v8, 774, v9, v10, v11, v12, v13, 0x1B0u);
  if (v14 < 0)
  {
    v17 = *__error();
    brc_bread_crumbs();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 138412802;
      v23 = v7;
      v24 = 1024;
      v25 = v17;
      v26 = 2112;
      v27 = v18;
      v20 = "[ERROR] failed creating '%@' %{errno}d%@";
      goto LABEL_9;
    }
LABEL_6:

    *__error() = v17;
    v16 = *__error();
    goto LABEL_7;
  }
  close(v14);
  v15 = BRCUnlinkAt(a2, v7, 0);
  v16 = 0;
  if (v15 < 0)
  {
    v17 = *__error();
    brc_bread_crumbs();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 138412802;
      v23 = v7;
      v24 = 1024;
      v25 = v17;
      v26 = 2112;
      v27 = v18;
      v20 = "[ERROR] failed deleting '%@' %{errno}d%@";
LABEL_9:
      _os_log_error_impl(&dword_1CBD43000, v19, (os_log_type_t)0x90u, v20, buf, 0x1Cu);
      goto LABEL_6;
    }
    goto LABEL_6;
  }
LABEL_7:

  return v16;
}

- (void)didProcessEventID:(unint64_t)a3
{
  BRCFSEventsMonitor *v4;
  BRCFSEventsPersistedState *rendezVous;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  NSObject *v11;
  OS_dispatch_semaphore *semaphore;
  BRCFSEventsPersistedState *v13;
  BRCFSEventsPersistedState *v14;
  BRCFSEventsPersistedState *persistedState;
  int v16;
  BRCFSEventsPersistedState *v17;
  __int16 v18;
  BRCFSEventsPersistedState *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[BRCFSEventsPersistedState setLatestEventID:](self->_persistedState, "setLatestEventID:", a3);
  v4 = self;
  objc_sync_enter(v4);
  rendezVous = v4->_rendezVous;
  if (rendezVous)
  {
    -[BRCFSEventsPersistedState streamUUID](rendezVous, "streamUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCFSEventsPersistedState streamUUID](self->_persistedState, "streamUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v7))
    {
      v8 = -[BRCFSEventsPersistedState latestEventID](v4->_rendezVous, "latestEventID");
      v9 = -[BRCFSEventsPersistedState latestEventID](self->_persistedState, "latestEventID");

      if (v8 > v9)
        goto LABEL_9;
    }
    else
    {

    }
    brc_bread_crumbs();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v14 = v4->_rendezVous;
      persistedState = self->_persistedState;
      v16 = 138412802;
      v17 = v14;
      v18 = 2112;
      v19 = persistedState;
      v20 = 2112;
      v21 = v10;
      _os_log_debug_impl(&dword_1CBD43000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] signaling rendez-vous:{%@} current:{%@}%@", (uint8_t *)&v16, 0x20u);
    }

    dispatch_semaphore_signal((dispatch_semaphore_t)v4->_semaphore);
    semaphore = v4->_semaphore;
    v4->_semaphore = 0;

    v13 = v4->_rendezVous;
    v4->_rendezVous = 0;

  }
LABEL_9:
  objc_sync_exit(v4);

}

- (void)_updatePersistedStateWithState:(id)a3
{
  __CFString *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_storeStrong((id *)&self->_persistedState, a3);
  if (self->_name)
  {
    objc_msgSend(CFSTR("fsevents"), "stringByAppendingPathComponent:");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = CFSTR("fsevents");
  }
  -[BRCAccountSession clientState](self->_session, "clientState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, v5);

}

- (BOOL)_queueEvents:(id)a3 markSelfEncountered:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  int v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  NSObject *v14;
  NSMutableArray *fseventsToProcess;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  int v23;
  unint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  BOOL v31;
  void *v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v4 = a4;
  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[NSMutableArray count](self->_fseventsToProcess, "count"))
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_fseventsToProcess, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "flags") & 0xE;

    if (v8)
    {
      brc_bread_crumbs();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[BRCFSEventsMonitor _queueEvents:markSelfEncountered:].cold.3();

      goto LABEL_37;
    }
  }
  objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "flags") & 0xE;

  if (v12)
  {
    brc_bread_crumbs();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[BRCFSEventsMonitor _queueEvents:markSelfEncountered:].cold.2();

    -[NSMutableArray removeAllObjects](self->_fseventsToProcess, "removeAllObjects");
    fseventsToProcess = self->_fseventsToProcess;
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](fseventsToProcess, "addObject:", v16);

    -[BRCFairSource signal](self->_fseventsProcessSource, "signal");
    goto LABEL_37;
  }
  if (v4)
  {
    if (self->_hasMarkSelf)
    {
      v17 = -[NSMutableArray count](self->_fseventsToProcess, "count");
      if (v17 >= 1)
      {
        v18 = v17 + 1;
        while (1)
        {
          -[NSMutableArray objectAtIndexedSubscript:](self->_fseventsToProcess, "objectAtIndexedSubscript:", (v18 - 2));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v19, "flags") & 0x80000) != 0)
            break;

          if ((unint64_t)--v18 <= 1)
            goto LABEL_19;
        }
        -[NSMutableArray removeObjectAtIndex:](self->_fseventsToProcess, "removeObjectAtIndex:", (v18 - 2));

      }
    }
    else
    {
      self->_hasMarkSelf = 1;
    }
  }
LABEL_19:
  if (-[NSMutableArray count](self->_fseventsToProcess, "count") >= self->_maxFSEventQueueSize)
  {
    brc_bread_crumbs();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
      -[BRCFSEventsMonitor _queueEvents:markSelfEncountered:].cold.1();

  }
  -[NSMutableArray addObjectsFromArray:](self->_fseventsToProcess, "addObjectsFromArray:", v6);
  if (-[NSMutableArray count](self->_fseventsToProcess, "count"))
    -[BRCFairSource signal](self->_fseventsProcessSource, "signal");
  if (-[NSMutableArray count](self->_fseventsToProcess, "count") < self->_maxFSEventQueueSize)
    goto LABEL_37;
  brc_bread_crumbs();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v39 = v20;
    _os_log_impl(&dword_1CBD43000, v21, OS_LOG_TYPE_DEFAULT, "[WARNING] We've reached the fsevent processing cap. Trying to coalesce pkg level events%@", buf, 0xCu);
  }

  v22 = (void *)objc_opt_new();
  v23 = -[NSMutableArray count](self->_fseventsToProcess, "count");
  if (v23 >= 1)
  {
    v24 = v23 + 1;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_fseventsToProcess, "objectAtIndexedSubscript:", (v24 - 2));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "path");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "br_pathOfPackageRoot");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        objc_msgSend(v22, "objectForKeyedSubscript:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (v28)
        {
          brc_bread_crumbs();
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v25, "path");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v39 = v37;
            v40 = 2112;
            v41 = v27;
            v42 = 2112;
            v43 = v29;
            _os_log_debug_impl(&dword_1CBD43000, v30, OS_LOG_TYPE_DEBUG, "[DEBUG] Coalescing event at %@ to pkg root at %@%@", buf, 0x20u);

          }
          objc_msgSend(v28, "setPath:", v27);
          objc_msgSend(v28, "setFlags:", 131073);
          -[NSMutableArray removeObjectAtIndex:](self->_fseventsToProcess, "removeObjectAtIndex:", (v24 - 2));
        }
        else
        {
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v25, v27);
        }

      }
      --v24;
    }
    while (v24 > 1);
  }
  if (-[NSMutableArray count](self->_fseventsToProcess, "count") < self->_maxFSEventQueueSize)
  {

LABEL_37:
    v31 = 0;
    goto LABEL_38;
  }
  brc_bread_crumbs();
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v39 = v33;
    _os_log_impl(&dword_1CBD43000, v34, OS_LOG_TYPE_DEFAULT, "[WARNING] We still have too many events in the queue, blocking until events are flushed%@", buf, 0xCu);
  }

  v31 = 1;
LABEL_38:

  return v31;
}

- (void)queueEvents:(id)a3 markSelfEncountered:(BOOL)a4
{
  void *v5;
  id v6;
  id v7;

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    -[BRCAccountSession personaIdentifier](self->_session, "personaIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    BRPerformWithPersonaAndError();

  }
}

void __54__BRCFSEventsMonitor_queueEvents_markSelfEncountered___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD v11[5];
  _QWORD block[5];
  id v13;
  uint64_t *v14;
  char v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v3 = a2;
  if (v3)
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      __54__BRCFSEventsMonitor_queueEvents_markSelfEncountered___block_invoke_cold_1();

  }
  else
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = 0;
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(a1 + 40);
    v8 = *(NSObject **)(v6 + 80);
    block[2] = __54__BRCFSEventsMonitor_queueEvents_markSelfEncountered___block_invoke_74;
    block[3] = &unk_1E8767FC0;
    v9 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    v14 = &v16;
    block[4] = v6;
    v13 = v7;
    v15 = *(_BYTE *)(a1 + 48);
    dispatch_sync(v8, block);
    if (*((_BYTE *)v17 + 24))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "clientTruthWorkloop");
      v10 = objc_claimAutoreleasedReturnValue();
      v11[0] = v9;
      v11[1] = 3221225472;
      v11[2] = __54__BRCFSEventsMonitor_queueEvents_markSelfEncountered___block_invoke_2;
      v11[3] = &unk_1E875D500;
      v11[4] = *(_QWORD *)(a1 + 32);
      dispatch_async_and_wait(v10, v11);

    }
    _Block_object_dispose(&v16, 8);
  }

}

uint64_t __54__BRCFSEventsMonitor_queueEvents_markSelfEncountered___block_invoke_74(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_queueEvents:markSelfEncountered:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

uint64_t __54__BRCFSEventsMonitor_queueEvents_markSelfEncountered___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "processFseventBatch");
}

- (void)processFseventBatch
{
  OS_dispatch_queue *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  _QWORD block[7];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v3 = self->_processQueue;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__56;
  v22 = __Block_byref_object_dispose__56;
  v23 = 0;
  -[BRCAccountSession clientTruthWorkloop](self->_session, "clientTruthWorkloop");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  if (v3)
  {
    v5 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __41__BRCFSEventsMonitor_processFseventBatch__block_invoke;
    block[3] = &unk_1E8768010;
    block[4] = self;
    block[5] = &v18;
    block[6] = &v14;
    dispatch_sync((dispatch_queue_t)v3, block);
    v6 = objc_msgSend((id)v19[5], "count");
    v7 = v6;
    if ((int)v6 >= 1)
    {
      v8 = 0;
      v9 = v6;
      do
      {
        objc_msgSend((id)v19[5], "objectAtIndexedSubscript:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "path");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[BRCFSEventsMonitor fseventAtPath:withFlags:andID:eventIndex:eventCount:initialScan:](self, "fseventAtPath:withFlags:andID:eventIndex:eventCount:initialScan:", v11, objc_msgSend(v10, "flags"), objc_msgSend(v10, "eventID"), v8, v7, 0);

        ++v8;
      }
      while (v9 != v8);
    }
    if (*((_BYTE *)v15 + 24))
    {
      v12[0] = v5;
      v12[1] = 3221225472;
      v12[2] = __41__BRCFSEventsMonitor_processFseventBatch__block_invoke_2;
      v12[3] = &unk_1E875D500;
      v12[4] = self;
      dispatch_async((dispatch_queue_t)v3, v12);
    }
  }
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

}

uint64_t __41__BRCFSEventsMonitor_processFseventBatch__block_invoke(_QWORD *a1)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t result;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  v3 = *(_QWORD *)(v2 + 112);
  v4 = objc_msgSend(*(id *)(v2 + 96), "count");
  v5 = a1[4];
  if (v3 >= v4)
  {
    v6 = objc_msgSend(*(id *)(v5 + 96), "count");
    v5 = a1[4];
  }
  else
  {
    v6 = *(_QWORD *)(v5 + 112);
  }
  objc_msgSend(*(id *)(v5 + 96), "subarrayWithRange:", 0, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1[5] + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  objc_msgSend(*(id *)(a1[4] + 96), "removeObjectsInRange:", 0, v6);
  *(_BYTE *)(a1[4] + 120) = 0;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = *(id *)(a1[4] + 96);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "flags", (_QWORD)v16) & 0x80000) != 0)
        {
          *(_BYTE *)(a1[4] + 120) = 1;
          goto LABEL_14;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v12)
        continue;
      break;
    }
  }
LABEL_14:

  result = objc_msgSend(*(id *)(a1[4] + 96), "count");
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = result != 0;
  return result;
}

uint64_t __41__BRCFSEventsMonitor_processFseventBatch__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "signal");
}

- (void)fseventAtPath:(id)a3 withFlags:(unsigned int)a4 andID:(unint64_t)a5 eventIndex:(unsigned int)a6 eventCount:(unsigned int)a7 initialScan:(BOOL)a8
{
  _BOOL4 v8;
  uint64_t v12;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  void *v28;
  NSObject *v29;
  id v30;
  uint64_t v31;
  id v32;
  int v33;
  void *v34;
  NSObject *v35;
  void *v36;
  id v37;
  int v38;
  __darwin_ino64_t st_ino;
  void *v40;
  NSObject *v41;
  BRCRelativePath *root;
  int v43;
  int v44;
  int v45;
  int v46;
  int v47;
  int v48;
  int v49;
  int v50;
  int v51;
  int v52;
  void *v53;
  int IsOwnedByUbd;
  void *v55;
  NSObject *v56;
  uint64_t v57;
  void *v58;
  NSObject *v59;
  const char *v60;
  void *v61;
  NSObject *v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  void *v66;
  NSObject *v67;
  NSObject *v68;
  NSObject *v69;
  uint64_t v70;
  const char *v71;
  void *v72;
  PQLConnection *db;
  void *v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  int v78;
  void *v79;
  NSObject *v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  void *v87;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  id WeakRetained;
  _QWORD v94[4];
  id v95;
  id v96;
  id v97;
  BRCFSEventsMonitor *v98;
  unint64_t v99;
  int v100;
  stat v101;
  int v102;
  uint8_t buf[4];
  _BYTE v104[10];
  _BYTE v105[20];
  __int16 v106;
  _BYTE v107[10];
  const char *v108;
  _BYTE v109[22];
  void *v110;
  int v111;
  __int16 v112;
  int st_nlink;
  __int16 v114;
  uid_t st_uid;
  __int16 v116;
  gid_t st_gid;
  __int16 v118;
  __darwin_time_t tv_sec;
  __int16 v120;
  __darwin_time_t v121;
  __int16 v122;
  __darwin_time_t v123;
  __int16 v124;
  off_t st_size;
  __int16 v126;
  __uint32_t st_flags;
  __int16 v128;
  void *v129;
  uint64_t v130;

  v8 = a8;
  v12 = *(_QWORD *)&a4;
  v130 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((v12 & 8) != 0)
  {
    brc_bread_crumbs();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      BRCPrettyPrintBitmap();
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)v20;
      *(_DWORD *)buf = 67110658;
      *(_DWORD *)v104 = a6 + 1;
      v22 = " (initial scan)";
      *(_WORD *)&v104[4] = 1024;
      if (!v8)
        v22 = "";
      *(_DWORD *)&v104[6] = a7;
      *(_WORD *)v105 = 2112;
      *(_QWORD *)&v105[2] = v14;
      *(_WORD *)&v105[10] = 2112;
      *(_QWORD *)&v105[12] = v20;
      v106 = 2048;
      *(_QWORD *)v107 = a5;
      *(_WORD *)&v107[8] = 2080;
      v108 = v22;
      *(_WORD *)v109 = 2112;
      *(_QWORD *)&v109[2] = v18;
      _os_log_impl(&dword_1CBD43000, v19, OS_LOG_TYPE_DEFAULT, "[WARNING] fsevent:%u/%u path:'%@' flags:%@ id:%llu%s fsevents id wrapped%@", buf, 0x40u);

    }
    -[BRCFSEventsMonitor resetWithReason:](self, "resetWithReason:", CFSTR("fsevents wrapped"));
  }
  else
  {
    if ((v12 & 2) != 0 && !v8)
    {
      brc_bread_crumbs();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        BRCPrettyPrintBitmap();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67110658;
        *(_DWORD *)v104 = a6 + 1;
        *(_WORD *)&v104[4] = 1024;
        *(_DWORD *)&v104[6] = a7;
        *(_WORD *)v105 = 2112;
        *(_QWORD *)&v105[2] = v14;
        *(_WORD *)&v105[10] = 2112;
        *(_QWORD *)&v105[12] = v17;
        v106 = 2048;
        *(_QWORD *)v107 = a5;
        *(_WORD *)&v107[8] = 2080;
        v108 = "";
        *(_WORD *)v109 = 2112;
        *(_QWORD *)&v109[2] = v15;
        _os_log_impl(&dword_1CBD43000, v16, OS_LOG_TYPE_DEFAULT, "[WARNING] fsevent:%u/%u path:'%@' flags:%@ id:%llu%s user dropped fsevents%@", buf, 0x40u);

      }
      -[BRCFSEventsMonitor resetWithReason:dropFSEventID:](self, "resetWithReason:dropFSEventID:", CFSTR("soft dropped fsevents"), 0);
      goto LABEL_97;
    }
    if ((v12 & 6) != 0)
    {
      brc_bread_crumbs();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        BRCPrettyPrintBitmap();
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = (void *)v25;
        *(_DWORD *)buf = 67110658;
        *(_DWORD *)v104 = a6 + 1;
        v27 = " (initial scan)";
        *(_WORD *)&v104[4] = 1024;
        if (!v8)
          v27 = "";
        *(_DWORD *)&v104[6] = a7;
        *(_WORD *)v105 = 2112;
        *(_QWORD *)&v105[2] = v14;
        *(_WORD *)&v105[10] = 2112;
        *(_QWORD *)&v105[12] = v25;
        v106 = 2048;
        *(_QWORD *)v107 = a5;
        *(_WORD *)&v107[8] = 2080;
        v108 = v27;
        *(_WORD *)v109 = 2112;
        *(_QWORD *)&v109[2] = v23;
        _os_log_impl(&dword_1CBD43000, v24, OS_LOG_TYPE_DEFAULT, "[WARNING] fsevent:%u/%u path:'%@' flags:%@ id:%llu%s dropped fsevents%@", buf, 0x40u);

      }
      brc_bread_crumbs();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
        -[BRCFSEventsMonitor fseventAtPath:withFlags:andID:eventIndex:eventCount:initialScan:].cold.3();

      -[BRCFSEventsMonitor resetWithReason:](self, "resetWithReason:", CFSTR("dropped fsevents"));
      goto LABEL_97;
    }
    if ((v12 & 0x10) == 0)
    {
      if ((v12 & 0x80000) != 0)
      {
        brc_bread_crumbs();
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v67 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
        {
          BRCPrettyPrintBitmap();
          v75 = objc_claimAutoreleasedReturnValue();
          v76 = (void *)v75;
          *(_DWORD *)buf = 67110658;
          *(_DWORD *)v104 = a6 + 1;
          v77 = " (initial scan)";
          *(_WORD *)&v104[4] = 1024;
          if (!v8)
            v77 = "";
          *(_DWORD *)&v104[6] = a7;
          *(_WORD *)v105 = 2112;
          *(_QWORD *)&v105[2] = v14;
          *(_WORD *)&v105[10] = 2112;
          *(_QWORD *)&v105[12] = v75;
          v106 = 2048;
          *(_QWORD *)v107 = a5;
          *(_WORD *)&v107[8] = 2080;
          v108 = v77;
          *(_WORD *)v109 = 2112;
          *(_QWORD *)&v109[2] = v66;
          _os_log_debug_impl(&dword_1CBD43000, v67, OS_LOG_TYPE_DEBUG, "[DEBUG] fsevent:%u/%u path:'%@' flags:%@ id:%llu%s ignored (own event)%@", buf, 0x40u);

        }
      }
      else
      {
        if ((v12 & 0xFFA8FFFF) != 0)
        {
          v30 = v14;
          v31 = (uint64_t)v30;
          if ((objc_msgSend(v30, "hasPrefix:", CFSTR("/")) & 1) == 0)
          {
            -[NSString stringByAppendingPathComponent:](self->_devicePath, "stringByAppendingPathComponent:", v30);
            v31 = objc_claimAutoreleasedReturnValue();

          }
          v91 = (void *)v31;
          v32 = -[BRCRelativePath _initWithPath:relativeToRoot:]([BRCRelativePath alloc], "_initWithPath:relativeToRoot:", v31, self->_root);
          v102 = 0;
          v92 = v32;
          if ((objc_msgSend(v32, "resolveAndKeepOpenMustExist:error:", 0, &v102) & 1) != 0)
          {
            if (v8)
              goto LABEL_81;
            v33 = objc_msgSend(v92, "isRoot") ^ 1;
            if ((v12 & 0xB01) == 0)
              LOBYTE(v33) = 1;
            if ((v33 & 1) != 0)
            {
LABEL_81:
              memset(&v101, 0, 24);
              __brc_create_section(1, (uint64_t)"-[BRCFSEventsMonitor fseventAtPath:withFlags:andID:eventIndex:eventCount:initialScan:]", 732, &v101);
              brc_bread_crumbs();
              v90 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v69 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
              {
                v88 = *(_QWORD *)&v101.st_dev;
                BRCPrettyPrintBitmap();
                v70 = objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 134220034;
                v71 = "";
                *(_QWORD *)v104 = v88;
                *(_WORD *)&v104[8] = 1024;
                if (v8)
                  v71 = " (initial scan)";
                *(_DWORD *)v105 = a6 + 1;
                *(_WORD *)&v105[4] = 1024;
                *(_DWORD *)&v105[6] = a7;
                *(_WORD *)&v105[10] = 2112;
                *(_QWORD *)&v105[12] = v30;
                v106 = 2112;
                *(_QWORD *)v107 = v70;
                *(_WORD *)&v107[8] = 2048;
                v108 = (const char *)a5;
                *(_WORD *)v109 = 2080;
                *(_QWORD *)&v109[2] = v71;
                *(_WORD *)&v109[10] = 2112;
                *(_QWORD *)&v109[12] = v92;
                *(_WORD *)&v109[20] = 2112;
                v110 = v90;
                v72 = (void *)v70;
                _os_log_impl(&dword_1CBD43000, v69, OS_LOG_TYPE_INFO, "[INFO] ┏%llx fsevent:%u/%u path:'%@' flags:%@ id:%llu%s %@%@", buf, 0x54u);

              }
              kdebug_trace();
              db = self->_db;
              if (db)
              {
                v94[0] = MEMORY[0x1E0C809B0];
                v94[1] = 3221225472;
                v94[2] = __86__BRCFSEventsMonitor_fseventAtPath_withFlags_andID_eventIndex_eventCount_initialScan___block_invoke;
                v94[3] = &unk_1E8768038;
                v95 = WeakRetained;
                v96 = v92;
                v100 = v12;
                v97 = v91;
                v98 = self;
                v99 = a5;
                -[PQLConnection groupInBatch:](db, "groupInBatch:", v94);

              }
              else
              {
                objc_msgSend(v91, "lastPathComponent");
                v74 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(WeakRetained, "fseventAtPath:flags:unresolvedLastPathComponent:", v92, v12, v74);

                -[BRCFSEventsMonitor didProcessEventID:](self, "didProcessEventID:", a5);
              }
              objc_msgSend(v92, "close");
              __brc_leave_section((uint64_t *)&v101.st_dev);
            }
            else
            {
              brc_bread_crumbs();
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log();
              v35 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
              {
                BRCPrettyPrintBitmap();
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 67110658;
                *(_DWORD *)v104 = a6 + 1;
                *(_WORD *)&v104[4] = 1024;
                *(_DWORD *)&v104[6] = a7;
                *(_WORD *)v105 = 2112;
                *(_QWORD *)&v105[2] = v30;
                *(_WORD *)&v105[10] = 2112;
                *(_QWORD *)&v105[12] = v36;
                v106 = 2048;
                *(_QWORD *)v107 = a5;
                *(_WORD *)&v107[8] = 2080;
                v108 = "";
                *(_WORD *)v109 = 2112;
                *(_QWORD *)&v109[2] = v34;
                _os_log_impl(&dword_1CBD43000, v35, OS_LOG_TYPE_DEFAULT, "[NOTICE] fsevent:%u/%u path:'%@' flags:%@ id:%llu%s root needs deep-scan%@", buf, 0x40u);

              }
              memset(&v101, 0, sizeof(v101));
              -[BRCRelativePath absolutePath](self->_root, "absolutePath");
              v37 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v38 = lstat((const char *)objc_msgSend(v37, "fileSystemRepresentation"), &v101);

              if (v38 < 0)
              {
                v78 = *__error();
                brc_bread_crumbs();
                v79 = (void *)objc_claimAutoreleasedReturnValue();
                brc_default_log();
                v80 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v80, (os_log_type_t)0x90u))
                {
                  -[BRCRelativePath absolutePath](self->_root, "absolutePath");
                  v87 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412802;
                  *(_QWORD *)v104 = v87;
                  *(_WORD *)&v104[8] = 1024;
                  *(_DWORD *)v105 = v78;
                  *(_WORD *)&v105[4] = 2112;
                  *(_QWORD *)&v105[6] = v79;
                  _os_log_error_impl(&dword_1CBD43000, v80, (os_log_type_t)0x90u, "[ERROR] can't stat root at '%@' after fsevent %{errno}d%@", buf, 0x1Cu);

                }
                *__error() = v78;
              }
              else
              {
                st_ino = v101.st_ino;
                if (st_ino != -[BRCRelativePath fileID](self->_root, "fileID"))
                {
                  brc_bread_crumbs();
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  brc_default_log();
                  v41 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
                  {
                    root = self->_root;
                    v43 = aPcDBLSW[(unint64_t)v101.st_mode >> 12];
                    if ((v101.st_mode & 0x100) != 0)
                      v44 = 114;
                    else
                      v44 = 45;
                    if ((v101.st_mode & 0x80) != 0)
                      v45 = 119;
                    else
                      v45 = 45;
                    if ((v101.st_mode & 0x40) != 0)
                      v46 = 120;
                    else
                      v46 = 45;
                    if ((v101.st_mode & 0x20) != 0)
                      v47 = 114;
                    else
                      v47 = 45;
                    if ((v101.st_mode & 0x10) != 0)
                      v48 = 119;
                    else
                      v48 = 45;
                    if ((v101.st_mode & 8) != 0)
                      v49 = 120;
                    else
                      v49 = 45;
                    if ((v101.st_mode & 4) != 0)
                      v50 = 114;
                    else
                      v50 = 45;
                    if ((v101.st_mode & 2) != 0)
                      v51 = 119;
                    else
                      v51 = 45;
                    if ((v101.st_mode & 1) != 0)
                      v52 = 120;
                    else
                      v52 = 45;
                    *(_DWORD *)buf = 138417666;
                    *(_QWORD *)v104 = root;
                    *(_WORD *)&v104[8] = 1024;
                    *(_DWORD *)v105 = v101.st_dev;
                    *(_WORD *)&v105[4] = 2048;
                    *(_QWORD *)&v105[6] = v101.st_ino;
                    *(_WORD *)&v105[14] = 1024;
                    *(_DWORD *)&v105[16] = v43;
                    v106 = 1024;
                    *(_DWORD *)v107 = v44;
                    *(_WORD *)&v107[4] = 1024;
                    *(_DWORD *)&v107[6] = v45;
                    LOWORD(v108) = 1024;
                    *(_DWORD *)((char *)&v108 + 2) = v46;
                    HIWORD(v108) = 1024;
                    *(_DWORD *)v109 = v47;
                    *(_WORD *)&v109[4] = 1024;
                    *(_DWORD *)&v109[6] = v48;
                    *(_WORD *)&v109[10] = 1024;
                    *(_DWORD *)&v109[12] = v49;
                    *(_WORD *)&v109[16] = 1024;
                    *(_DWORD *)&v109[18] = v50;
                    LOWORD(v110) = 1024;
                    *(_DWORD *)((char *)&v110 + 2) = v51;
                    HIWORD(v110) = 1024;
                    v111 = v52;
                    v112 = 1024;
                    st_nlink = v101.st_nlink;
                    v114 = 1024;
                    st_uid = v101.st_uid;
                    v116 = 1024;
                    st_gid = v101.st_gid;
                    v118 = 2048;
                    tv_sec = v101.st_atimespec.tv_sec;
                    v120 = 2048;
                    v121 = v101.st_mtimespec.tv_sec;
                    v122 = 2048;
                    v123 = v101.st_ctimespec.tv_sec;
                    v124 = 2048;
                    st_size = v101.st_size;
                    v126 = 1024;
                    st_flags = v101.st_flags;
                    v128 = 2112;
                    v129 = v40;
                    _os_log_fault_impl(&dword_1CBD43000, v41, OS_LOG_TYPE_FAULT, "[CRIT] the root changed fileID\n  from %@\n    to deviceID:%u fileID:%llu mode:%c%c%c%c%c%c%c%c%c%c nlink:%u uid:%u gid:%u atime:%lu mtime:%lu ctime:%lu size:%llu flags:0x%x%@", buf, 0xA2u);
                  }

                  -[BRCRelativePath absolutePath](self->_root, "absolutePath");
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  IsOwnedByUbd = BRCRootIsOwnedByUbd(v53);

                  if (IsOwnedByUbd)
                  {
                    brc_bread_crumbs();
                    v55 = (void *)objc_claimAutoreleasedReturnValue();
                    brc_default_log();
                    v56 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v56, (os_log_type_t)0x90u))
                      -[BRCFSEventsMonitor fseventAtPath:withFlags:andID:eventIndex:eventCount:initialScan:].cold.2();

                  }
                  abc_report_panic_with_signature();
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The root changed filedID from %llu to %llu"), v101.st_ino, -[BRCRelativePath fileID](self->_root, "fileID"));
                  v57 = objc_claimAutoreleasedReturnValue();
                  brc_bread_crumbs();
                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                  brc_default_log();
                  v59 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v59, OS_LOG_TYPE_FAULT))
                    -[BRCFSEventsMonitor fseventAtPath:withFlags:andID:eventIndex:eventCount:initialScan:].cold.1(v57, (uint64_t)v58, v59);

                  brc_append_system_info_to_message();
                  v60 = (const char *)objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()), "UTF8String");
                  __assert_rtn("-[BRCFSEventsMonitor fseventAtPath:withFlags:andID:eventIndex:eventCount:initialScan:]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/legacy/BRCFSEventsMonitor.m", 724, v60);
                }
              }
              objc_msgSend(v92, "close");
              -[BRCFSEventsMonitor resetWithReason:](self, "resetWithReason:", CFSTR("root needs deep scan"));
            }
          }
          else
          {
            brc_bread_crumbs();
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            brc_default_log();
            v68 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
            {
              BRCPrettyPrintBitmap();
              v84 = objc_claimAutoreleasedReturnValue();
              v85 = (void *)v84;
              *(_DWORD *)buf = 67110914;
              *(_DWORD *)v104 = a6 + 1;
              if (v8)
                v86 = " (initial scan)";
              else
                v86 = "";
              *(_WORD *)&v104[4] = 1024;
              *(_DWORD *)&v104[6] = a7;
              *(_WORD *)v105 = 2112;
              *(_QWORD *)&v105[2] = v30;
              *(_WORD *)&v105[10] = 2112;
              *(_QWORD *)&v105[12] = v84;
              v106 = 2048;
              *(_QWORD *)v107 = a5;
              *(_WORD *)&v107[8] = 2080;
              v108 = v86;
              *(_WORD *)v109 = 1024;
              *(_DWORD *)&v109[2] = v102;
              *(_WORD *)&v109[6] = 2112;
              *(_QWORD *)&v109[8] = v89;
              _os_log_debug_impl(&dword_1CBD43000, v68, OS_LOG_TYPE_DEBUG, "[DEBUG] fsevent:%u/%u path:'%@' flags:%@ id:%llu%s ignored %{errno}d%@", buf, 0x46u);

            }
            -[BRCFSEventsMonitor didProcessEventID:](self, "didProcessEventID:", a5);
          }

          goto LABEL_97;
        }
        brc_bread_crumbs();
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log();
        v67 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
        {
          BRCPrettyPrintBitmap();
          v81 = objc_claimAutoreleasedReturnValue();
          v82 = (void *)v81;
          *(_DWORD *)buf = 67110658;
          *(_DWORD *)v104 = a6 + 1;
          v83 = " (initial scan)";
          *(_WORD *)&v104[4] = 1024;
          if (!v8)
            v83 = "";
          *(_DWORD *)&v104[6] = a7;
          *(_WORD *)v105 = 2112;
          *(_QWORD *)&v105[2] = v14;
          *(_WORD *)&v105[10] = 2112;
          *(_QWORD *)&v105[12] = v81;
          v106 = 2048;
          *(_QWORD *)v107 = a5;
          *(_WORD *)&v107[8] = 2080;
          v108 = v83;
          *(_WORD *)v109 = 2112;
          *(_QWORD *)&v109[2] = v66;
          _os_log_debug_impl(&dword_1CBD43000, v67, OS_LOG_TYPE_DEBUG, "[DEBUG] fsevent:%u/%u path:'%@' flags:%@ id:%llu%s ignored (cloned)%@", buf, 0x40u);

        }
      }

      -[BRCFSEventsMonitor didProcessEventID:](self, "didProcessEventID:", a5);
      goto LABEL_97;
    }
    brc_bread_crumbs();
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v62 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      BRCPrettyPrintBitmap();
      v63 = objc_claimAutoreleasedReturnValue();
      v64 = (void *)v63;
      *(_DWORD *)buf = 67110658;
      *(_DWORD *)v104 = a6 + 1;
      v65 = " (initial scan)";
      *(_WORD *)&v104[4] = 1024;
      if (!v8)
        v65 = "";
      *(_DWORD *)&v104[6] = a7;
      *(_WORD *)v105 = 2112;
      *(_QWORD *)&v105[2] = v14;
      *(_WORD *)&v105[10] = 2112;
      *(_QWORD *)&v105[12] = v63;
      v106 = 2048;
      *(_QWORD *)v107 = a5;
      *(_WORD *)&v107[8] = 2080;
      v108 = v65;
      *(_WORD *)v109 = 2112;
      *(_QWORD *)&v109[2] = v61;
      _os_log_impl(&dword_1CBD43000, v62, OS_LOG_TYPE_DEFAULT, "[NOTICE] fsevent:%u/%u path:'%@' flags:%@ id:%llu%s done processing history%@", buf, 0x40u);

    }
  }
LABEL_97:

}

uint64_t __86__BRCFSEventsMonitor_fseventAtPath_withFlags_andID_eventIndex_eventCount_initialScan___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(unsigned int *)(a1 + 72);
  objc_msgSend(*(id *)(a1 + 48), "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fseventAtPath:flags:unresolvedLastPathComponent:", v3, v4, v5);

  return objc_msgSend(*(id *)(a1 + 56), "didProcessEventID:", *(_QWORD *)(a1 + 64));
}

- (void)fseventOnRootWithEventID:(unint64_t)a3 andReason:(id)a4
{
  id WeakRetained;
  BRCRelativePath *v7;
  PQLConnection *db;
  id v9;
  _QWORD v10[4];
  id v11;
  BRCRelativePath *v12;
  id v13;
  BRCFSEventsMonitor *v14;
  unint64_t v15;

  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = self->_root;
  db = self->_db;
  if (db)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __57__BRCFSEventsMonitor_fseventOnRootWithEventID_andReason___block_invoke;
    v10[3] = &unk_1E8768060;
    v11 = WeakRetained;
    v12 = v7;
    v13 = v9;
    v14 = self;
    v15 = a3;
    -[PQLConnection groupInBatch:](db, "groupInBatch:", v10);

  }
  else
  {
    objc_msgSend(WeakRetained, "fseventRecursiveAtRoot:withReason:", v7, v9);
    -[BRCFSEventsMonitor didProcessEventID:](self, "didProcessEventID:", a3);
  }

}

uint64_t __57__BRCFSEventsMonitor_fseventOnRootWithEventID_andReason___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "fseventRecursiveAtRoot:withReason:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 56), "didProcessEventID:", *(_QWORD *)(a1 + 64));
}

- (BRCFSEventsMonitor)initWithAccountSession:(id)a3
{
  return -[BRCFSEventsMonitor initWithAccountSession:name:](self, "initWithAccountSession:name:", a3, 0);
}

- (BRCFSEventsMonitor)initWithAccountSession:(id)a3 name:(id)a4
{
  id v7;
  id v8;
  BRCFSEventsMonitor *v9;
  BRCFSEventsMonitor *v10;
  NSObject *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *streamQueue;
  NSObject *v15;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *processQueue;
  BRCFairSource *v19;
  void *v20;
  uint64_t v21;
  BRCFairSource *fseventsProcessSource;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t maxFSEventQueueSize;
  uint64_t v28;
  NSMutableArray *fseventsToProcess;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t);
  void *v34;
  id v35;
  id location;
  objc_super v37;

  v7 = a3;
  v8 = a4;
  v37.receiver = self;
  v37.super_class = (Class)BRCFSEventsMonitor;
  v9 = -[BRCFSEventsMonitor init](&v37, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a4);
    objc_storeStrong((id *)&v10->_session, a3);
    atomic_store(1u, (unsigned int *)&v10->_suspendCount);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v11, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create("com.apple.brc.fs.events", v12);

    streamQueue = v10->_streamQueue;
    v10->_streamQueue = (OS_dispatch_queue *)v13;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v15 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v15, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = dispatch_queue_create("com.apple.brc.fs.events-process", v16);

    processQueue = v10->_processQueue;
    v10->_processQueue = (OS_dispatch_queue *)v17;

    v19 = [BRCFairSource alloc];
    objc_msgSend(v7, "fairClientDBScheduler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[BRCFairSource initWithName:scheduler:](v19, "initWithName:scheduler:", CFSTR("fsevents"), v20);
    fseventsProcessSource = v10->_fseventsProcessSource;
    v10->_fseventsProcessSource = (BRCFairSource *)v21;

    objc_msgSend(v7, "clientTruthWorkloop");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRCFairSource setWorkloop:](v10->_fseventsProcessSource, "setWorkloop:", v23);

    objc_initWeak(&location, v10);
    v31 = MEMORY[0x1E0C809B0];
    v32 = 3221225472;
    v33 = __50__BRCFSEventsMonitor_initWithAccountSession_name___block_invoke;
    v34 = &unk_1E875DC98;
    objc_copyWeak(&v35, &location);
    -[BRCFairSource setEventHandler:](v10->_fseventsProcessSource, "setEventHandler:", &v31);
    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0, v31, v32, v33, v34);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_maxFSEventQueueSize = objc_msgSend(v24, "fseventQueueBufferSize");

    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_fseventProcessBatchSize = objc_msgSend(v25, "fseventProcessBatchSize");

    v26 = objc_alloc(MEMORY[0x1E0C99DE8]);
    if (v10->_maxFSEventQueueSize >= 0xC8)
      maxFSEventQueueSize = 200;
    else
      maxFSEventQueueSize = v10->_maxFSEventQueueSize;
    v28 = objc_msgSend(v26, "initWithCapacity:", maxFSEventQueueSize);
    fseventsToProcess = v10->_fseventsToProcess;
    v10->_fseventsToProcess = (NSMutableArray *)v28;

    objc_destroyWeak(&v35);
    objc_destroyWeak(&location);
  }

  return v10;
}

void __50__BRCFSEventsMonitor_initWithAccountSession_name___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "processFseventBatch");

}

- (void)dealloc
{
  NSString *devicePath;
  OS_dispatch_queue *streamQueue;
  OS_dispatch_queue *processQueue;
  objc_super v6;

  devicePath = self->_devicePath;
  self->_devicePath = 0;

  streamQueue = self->_streamQueue;
  self->_streamQueue = 0;

  processQueue = self->_processQueue;
  self->_processQueue = 0;

  v6.receiver = self;
  v6.super_class = (Class)BRCFSEventsMonitor;
  -[BRCFSEventsMonitor dealloc](&v6, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[BRCFSEventsMonitor root](self, "root");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "absolutePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = atomic_load((unsigned int *)&self->_suspendCount);
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p root:%@ suspendCount:%d>"), v4, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (void)stopWatcher
{
  NSObject *processQueue;
  _QWORD block[5];

  processQueue = self->_processQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__BRCFSEventsMonitor_stopWatcher__block_invoke;
  block[3] = &unk_1E875D500;
  block[4] = self;
  dispatch_sync(processQueue, block);
}

void __33__BRCFSEventsMonitor_stopWatcher__block_invoke(uint64_t a1)
{
  NSObject *v1;

  v1 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 48);
  if (v1)
    dispatch_source_cancel(v1);
}

- (void)flushStream
{
  if (!atomic_load((unsigned int *)&self->_suspendCount))
    FSEventStreamFlushSync(self->_stream);
}

- (void)_close
{
  BRCFSEventsMonitor *v3;
  NSObject *rootVnodeWatcher;
  OS_dispatch_source *v5;
  NSObject *historicalEventSource;
  OS_dispatch_source *v7;
  __FSEventStream *stream;
  BRCRelativePath *root;
  BRCRelativePath *v10;
  BRCVolume *volume;
  NSString *devicePath;
  BRCFSEventsPersistedState *persistedState;
  PQLConnection *db;
  BRCFSEventsMonitor *obj;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_processQueue);
  -[BRCFSEventsMonitor suspend](self, "suspend");
  obj = self;
  objc_sync_enter(obj);
  v3 = obj;
  rootVnodeWatcher = obj->_rootVnodeWatcher;
  if (rootVnodeWatcher)
  {
    dispatch_resume(rootVnodeWatcher);
    v5 = obj->_rootVnodeWatcher;
    obj->_rootVnodeWatcher = 0;

    v3 = obj;
  }
  historicalEventSource = v3->_historicalEventSource;
  if (historicalEventSource)
  {
    dispatch_resume(historicalEventSource);
    v7 = obj->_historicalEventSource;
    obj->_historicalEventSource = 0;

    v3 = obj;
  }
  stream = v3->_stream;
  if (stream)
  {
    FSEventStreamRelease(stream);
    v3 = obj;
    obj->_drainEvents = 1;
    obj->_stream = 0;
  }
  root = v3->_root;
  if (root)
  {
    -[BRCRelativePath close](root, "close");
    v10 = obj->_root;
    obj->_root = 0;

    volume = obj->_volume;
    obj->_volume = 0;

    devicePath = obj->_devicePath;
    obj->_devicePath = 0;

    v3 = obj;
  }
  persistedState = v3->_persistedState;
  v3->_persistedState = 0;

  db = obj->_db;
  obj->_db = 0;

  objc_sync_exit(obj);
}

- (void)close
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *streamQueue;
  NSObject *v7;
  NSObject *processQueue;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  _QWORD block[5];
  uint64_t v14[3];
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  memset(v14, 0, sizeof(v14));
  __brc_create_section(0, (uint64_t)"-[BRCFSEventsMonitor close]", 876, v14);
  brc_bread_crumbs();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v9 = v14[0];
    v10 = (void *)objc_opt_class();
    *(_DWORD *)buf = 134218498;
    v16 = v9;
    v17 = 2112;
    v18 = v10;
    v19 = 2112;
    v20 = v3;
    v11 = v10;
    _os_log_debug_impl(&dword_1CBD43000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx closing the %@%@", buf, 0x20u);

  }
  -[BRCFSEventsMonitor stopWatcher](self, "stopWatcher");
  v5 = MEMORY[0x1E0C809B0];
  streamQueue = self->_streamQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__BRCFSEventsMonitor_close__block_invoke;
  block[3] = &unk_1E875D500;
  block[4] = self;
  dispatch_sync(streamQueue, block);
  -[BRCAccountSession clientTruthWorkloop](self->_session, "clientTruthWorkloop");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_async_and_wait(v7, &__block_literal_global_104_0);

  processQueue = self->_processQueue;
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __27__BRCFSEventsMonitor_close__block_invoke_4;
  v12[3] = &unk_1E875D500;
  v12[4] = self;
  dispatch_sync(processQueue, v12);
  __brc_leave_section(v14);
}

void __27__BRCFSEventsMonitor_close__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 80);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__BRCFSEventsMonitor_close__block_invoke_2;
  block[3] = &unk_1E875D500;
  block[4] = v1;
  dispatch_sync(v2, block);
}

uint64_t __27__BRCFSEventsMonitor_close__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancel");
}

uint64_t __27__BRCFSEventsMonitor_close__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_close");
}

- (void)resetWithReason:(id)a3
{
  -[BRCFSEventsMonitor resetWithReason:dropFSEventID:](self, "resetWithReason:dropFSEventID:", a3, 1);
}

- (void)resetWithReason:(id)a3 dropFSEventID:(BOOL)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  int *p_resetCount;
  unsigned int v10;
  void *v11;
  double v12;
  dispatch_time_t v13;
  NSObject *streamQueue;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  BOOL v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  brc_bread_crumbs();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v21 = (id)objc_opt_class();
    v22 = 2112;
    v23 = v6;
    v24 = 2112;
    v25 = v7;
    v16 = v21;
    _os_log_debug_impl(&dword_1CBD43000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] resetting the %@ because of %@%@", buf, 0x20u);

  }
  p_resetCount = &self->_resetCount;
  do
    v10 = __ldaxr((unsigned int *)p_resetCount);
  while (__stlxr(v10 + 1, (unsigned int *)p_resetCount));
  if (!v10)
    -[BRCFSEventsMonitor suspend](self, "suspend");
  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fseventsResetBackoff");
  v13 = dispatch_time(0, (uint64_t)(v12 * 1000000000.0));
  streamQueue = self->_streamQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__BRCFSEventsMonitor_resetWithReason_dropFSEventID___block_invoke;
  block[3] = &unk_1E87619A0;
  v19 = a4;
  block[4] = self;
  v18 = v6;
  v15 = v6;
  dispatch_after(v13, streamQueue, block);

}

void __52__BRCFSEventsMonitor_resetWithReason_dropFSEventID___block_invoke(uint64_t a1)
{
  void *v2;
  unsigned int *v3;
  unsigned int v4;
  BOOL v5;
  signed int v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  uint64_t v15;
  id v16;
  char v17;
  uint64_t v18[3];

  v2 = (void *)MEMORY[0x1D17A6BE8]();
  v3 = (unsigned int *)(*(_QWORD *)(a1 + 32) + 28);
  do
  {
    v4 = __ldaxr(v3);
    v5 = __OFSUB__(v4, 1);
    v6 = v4 - 1;
  }
  while (__stlxr(v6, v3));
  if ((v6 < 0) ^ v5 | (v6 == 0))
  {
    memset(v18, 0, sizeof(v18));
    __brc_create_section(0, (uint64_t)"-[BRCFSEventsMonitor resetWithReason:dropFSEventID:]_block_invoke", 923, v18);
    brc_bread_crumbs();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __52__BRCFSEventsMonitor_resetWithReason_dropFSEventID___block_invoke_cold_1();

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 144) = 1;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "clientTruthWorkloop");
    v9 = objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __52__BRCFSEventsMonitor_resetWithReason_dropFSEventID___block_invoke_105;
    v14 = &unk_1E87619A0;
    v10 = *(void **)(a1 + 40);
    v15 = *(_QWORD *)(a1 + 32);
    v17 = *(_BYTE *)(a1 + 48);
    v16 = v10;
    dispatch_async_and_wait(v9, &v11);

    objc_msgSend(*(id *)(a1 + 32), "resume", v11, v12, v13, v14, v15);
    __brc_leave_section(v18);
  }
  objc_autoreleasePoolPop(v2);
}

void __52__BRCFSEventsMonitor_resetWithReason_dropFSEventID___block_invoke_105(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  NSObject *v3;
  _QWORD block[5];
  id v5;
  char v6;

  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __52__BRCFSEventsMonitor_resetWithReason_dropFSEventID___block_invoke_2;
  block[3] = &unk_1E87619A0;
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(NSObject **)(v1 + 80);
  block[1] = 3221225472;
  v6 = *(_BYTE *)(a1 + 48);
  block[4] = v1;
  v5 = v2;
  dispatch_sync(v3, block);

}

uint64_t __52__BRCFSEventsMonitor_resetWithReason_dropFSEventID___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  FSEventStreamRef *v5;

  brc_bread_crumbs();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __52__BRCFSEventsMonitor_resetWithReason_dropFSEventID___block_invoke_2_cold_1();

  if (*(_BYTE *)(a1 + 48))
  {
    v4 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "copy");
    objc_msgSend(v4, "setStreamUUID:", 0);
    objc_msgSend(*(id *)(a1 + 32), "_updatePersistedStateWithState:", v4);

  }
  v5 = *(FSEventStreamRef **)(a1 + 32);
  if (v5[7])
  {
    FSEventStreamInvalidate(v5[7]);
    FSEventStreamRelease(*(FSEventStreamRef *)(*(_QWORD *)(a1 + 32) + 56));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = 0;
    v5 = *(FSEventStreamRef **)(a1 + 32);
  }
  return -[FSEventStreamRef setUpStreamSynchronously:reason:error:](v5, "setUpStreamSynchronously:reason:error:", 1, *(_QWORD *)(a1 + 40), 0);
}

- (void)suspend
{
  int *p_suspendCount;
  int v4;
  void *v5;
  NSObject *v6;
  BRCFSEventsMonitor *v7;
  __FSEventStream *stream;
  NSObject *rootVnodeWatcher;
  NSObject *historicalEventSource;

  p_suspendCount = &self->_suspendCount;
  do
    v4 = __ldaxr((unsigned int *)p_suspendCount);
  while (__stlxr(v4 + 1, (unsigned int *)p_suspendCount));
  brc_bread_crumbs();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[BRCFileUnlinker suspend].cold.1(v4, (uint64_t)v5, v6);

  if (!v4)
  {
    v7 = self;
    objc_sync_enter(v7);
    stream = v7->_stream;
    if (stream)
      FSEventStreamStop(stream);
    rootVnodeWatcher = v7->_rootVnodeWatcher;
    if (rootVnodeWatcher)
      dispatch_suspend(rootVnodeWatcher);
    historicalEventSource = v7->_historicalEventSource;
    if (historicalEventSource)
      dispatch_suspend(historicalEventSource);
    -[BRCFairSource suspend](v7->_fseventsProcessSource, "suspend");
    objc_sync_exit(v7);

  }
}

- (void)resume
{
  int v4;

  v4 = *a1;
  *(_DWORD *)buf = 67109378;
  *((_DWORD *)buf + 1) = v4;
  *((_WORD *)buf + 4) = 2112;
  *(_QWORD *)(buf + 10) = a2;
  _os_log_error_impl(&dword_1CBD43000, log, (os_log_type_t)0x90u, "[ERROR] failed starting fsevent stream %{errno}d%@", buf, 0x12u);
}

- (void)_cancel
{
  int *p_resetCount;
  unsigned int v4;
  __FSEventStream *stream;
  NSObject *rootVnodeWatcher;
  NSObject *historicalEventSource;
  BRCFairSource *fseventsProcessSource;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_processQueue);
  if (!self->_isCancelled)
  {
    self->_isCancelled = 1;
    p_resetCount = &self->_resetCount;
    do
      v4 = __ldaxr((unsigned int *)p_resetCount);
    while (__stlxr(v4 + 1, (unsigned int *)p_resetCount));
    stream = self->_stream;
    if (stream)
    {
      FSEventStreamStop(stream);
      FSEventStreamInvalidate(self->_stream);
    }
    rootVnodeWatcher = self->_rootVnodeWatcher;
    if (rootVnodeWatcher)
      dispatch_source_cancel(rootVnodeWatcher);
    historicalEventSource = self->_historicalEventSource;
    if (historicalEventSource)
      dispatch_source_cancel(historicalEventSource);
    fseventsProcessSource = self->_fseventsProcessSource;
    if (fseventsProcessSource)
      -[BRCFairSource cancel](fseventsProcessSource, "cancel");
  }
}

- (void)cancel
{
  NSObject *streamQueue;
  _QWORD block[5];

  streamQueue = self->_streamQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__BRCFSEventsMonitor_cancel__block_invoke;
  block[3] = &unk_1E875D500;
  block[4] = self;
  dispatch_async(streamQueue, block);
}

void __28__BRCFSEventsMonitor_cancel__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 80);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__BRCFSEventsMonitor_cancel__block_invoke_2;
  block[3] = &unk_1E875D500;
  block[4] = v1;
  dispatch_sync(v2, block);
}

uint64_t __28__BRCFSEventsMonitor_cancel__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancel");
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (BRCRelativePath)root
{
  return self->_root;
}

- (BRCFSEventsDelegate)delegate
{
  return (BRCFSEventsDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PQLConnection)db
{
  return self->_db;
}

- (void)setDB:(id)a3
{
  objc_storeStrong((id *)&self->_db, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_db, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_root, 0);
  objc_storeStrong((id *)&self->_volume, 0);
  objc_storeStrong((id *)&self->_semaphore, 0);
  objc_storeStrong((id *)&self->_rendezVous, 0);
  objc_storeStrong((id *)&self->_fseventsToProcess, 0);
  objc_storeStrong((id *)&self->_fseventsProcessSource, 0);
  objc_storeStrong((id *)&self->_processQueue, 0);
  objc_storeStrong((id *)&self->_historicalEventSource, 0);
  objc_storeStrong((id *)&self->_streamQueue, 0);
  objc_storeStrong((id *)&self->_rootVnodeWatcher, 0);
  objc_storeStrong((id *)&self->_devicePath, 0);
  objc_storeStrong((id *)&self->_persistedState, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

- (void)setUpRoot:isImmutableRoot:volume:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] opened root %@%@");
  OUTLINED_FUNCTION_2();
}

- (void)setUpRoot:isImmutableRoot:volume:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: volume%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setUpStreamSynchronously:(uint64_t)a1 reason:(uint64_t)a2 error:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  __int128 v4;

  LODWORD(v3) = 67109378;
  HIDWORD(v3) = a2;
  LOWORD(v4) = 2112;
  *(_QWORD *)((char *)&v4 + 2) = a1;
  OUTLINED_FUNCTION_15(&dword_1CBD43000, a2, a3, "[ERROR] FSEventStreamCreateRelativeToDevice failed %{errno}d%@", v3, (_QWORD)v4, WORD4(v4));
  OUTLINED_FUNCTION_2();
}

void __48__BRCFSEventsMonitor_signalAfterCurrentFSEvent___block_invoke_cold_1(_DWORD *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  __int128 v4;

  LODWORD(v3) = 67109378;
  HIDWORD(v3) = *a1;
  LOWORD(v4) = 2112;
  *(_QWORD *)((char *)&v4 + 2) = a2;
  OUTLINED_FUNCTION_15(&dword_1CBD43000, a2, a3, "[ERROR] failed generating fsevent for rendez-voud %{errno}d%@", v3, (_QWORD)v4, WORD4(v4));
  OUTLINED_FUNCTION_2();
}

- (void)_queueEvents:markSelfEncountered:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] Assertion failed: _fseventsToProcess.count < _maxFSEventQueueSize%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_queueEvents:markSelfEncountered:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Incoming events need deep scan.  Dropping all existing events%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_queueEvents:markSelfEncountered:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] Already need deep scan.  Dropping all incoming events%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __54__BRCFSEventsMonitor_queueEvents_markSelfEncountered___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: Couldn't adopt the correct persona when processing fsevents%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)fseventAtPath:(NSObject *)a3 withFlags:andID:eventIndex:eventCount:initialScan:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint8_t v6[12];
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  brc_append_system_info_to_message();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  v7 = 2112;
  v8 = a2;
  _os_log_fault_impl(&dword_1CBD43000, a3, OS_LOG_TYPE_FAULT, "[CRIT] %@%@", v6, 0x16u);

}

- (void)fseventAtPath:withFlags:andID:eventIndex:eventCount:initialScan:.cold.2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_0();
  _os_log_error_impl(&dword_1CBD43000, v0, (os_log_type_t)0x90u, "[ERROR] ubd is still running%@", v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)fseventAtPath:withFlags:andID:eventIndex:eventCount:initialScan:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_1CBD43000, v0, v1, "[CRIT] UNREACHABLE: We should try our best to avoid dropping fsevents%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __52__BRCFSEventsMonitor_resetWithReason_dropFSEventID___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0(&dword_1CBD43000, v0, v1, "[DEBUG] ┏%llx reset: drained all fsevents from the old stream%@");
  OUTLINED_FUNCTION_2();
}

void __52__BRCFSEventsMonitor_resetWithReason_dropFSEventID___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_1(&dword_1CBD43000, v0, v1, "[DEBUG] creating the new stream%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
