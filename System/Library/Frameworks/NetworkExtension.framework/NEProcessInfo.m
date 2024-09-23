@implementation NEProcessInfo

- (NEProcessInfo)init
{
  __assert_rtn("-[NEProcessInfo init]", "NEProcessInfo.m", 36, "0");
}

+ (id)copyUUIDsForBundleID:(id)a3 uid:(unsigned int)a4
{
  objc_class *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD applier[4];
  id v11;

  v4 = (objc_class *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v5, "UTF8String");
  v7 = NEHelperCacheCopyAppUUIDMappingForUIDExtended();
  v8 = (void *)v7;
  if (v7 && MEMORY[0x1A1ACFDA4](v7) == MEMORY[0x1E0C812C8])
  {
    applier[0] = MEMORY[0x1E0C809B0];
    applier[1] = 3221225472;
    applier[2] = __42__NEProcessInfo_copyUUIDsForBundleID_uid___block_invoke;
    applier[3] = &unk_1E3CC2300;
    v11 = v6;
    xpc_array_apply(v8, applier);

  }
  return v6;
}

+ (id)copyUUIDsForExecutable:(id)a3
{
  id v3;
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id v14;

  v3 = a3;
  +[NEProcessInfo initGlobals]();
  v4 = 0;
  if (v3 && g_executableUUIDMapping)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v6 = g_queue;
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __40__NEProcessInfo_copyUUIDsForExecutable___block_invoke;
    v12 = &unk_1E3CC2F98;
    v13 = v3;
    v7 = v5;
    v14 = v7;
    dispatch_sync(v6, &v9);
    if (objc_msgSend(v7, "count", v9, v10, v11, v12))
      v4 = v7;
    else
      v4 = 0;

  }
  return v4;
}

+ (void)clearUUIDCache
{
  +[NEProcessInfo initGlobals]();
  dispatch_sync((dispatch_queue_t)g_queue, &__block_literal_global_9_14018);
}

+ (id)copyDNSUUIDs
{
  id v2;
  id v3;

  v2 = +[NEProcessInfo copyUUIDsForExecutable:](NEProcessInfo, "copyUUIDsForExecutable:", CFSTR("/usr/sbin/mDNSResponder"));
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v3, "addObjectsFromArray:", v2);
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

+ (id)copyNEHelperUUIDs
{
  id v2;
  id v3;

  v2 = +[NEProcessInfo copyUUIDsForExecutable:](NEProcessInfo, "copyUUIDsForExecutable:", CFSTR("/usr/libexec/nehelper"));
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v3, "addObjectsFromArray:", v2);
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

+ (BOOL)is64bitCapable
{
  NSObject *v2;
  int *v4;
  char *v5;
  size_t v6;
  int v7;
  uint8_t buf[4];
  char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  v6 = 4;
  if (sysctlbyname("hw.cpu64bit_capable", &v7, &v6, 0, 0))
  {
    ne_log_obj();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v4 = __error();
      v5 = strerror(*v4);
      *(_DWORD *)buf = 136315138;
      v9 = v5;
      _os_log_error_impl(&dword_19BD16000, v2, OS_LOG_TYPE_ERROR, "Failed to get 64 bit capability: %s", buf, 0xCu);
    }

  }
  return v7 != 0;
}

+ (id)copyUUIDsForPID:(int)a3
{
  void *v4;
  id v5;
  _BYTE buffer[1024];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  bzero(buffer, 0x400uLL);
  if (proc_pidpath(a3, buffer, 0x400u) < 0)
    return 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", buffer);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[NEProcessInfo copyUUIDsForExecutable:](NEProcessInfo, "copyUUIDsForExecutable:", v4);

  return v5;
}

+ (void)initGlobals
{
  objc_opt_self();
  if (initGlobals_mapping_init != -1)
    dispatch_once(&initGlobals_mapping_init, &__block_literal_global_14019);
}

uint64_t __31__NEProcessInfo_clearUUIDCache__block_invoke()
{
  return objc_msgSend((id)g_executableUUIDMapping, "removeAllObjects");
}

void __28__NEProcessInfo_initGlobals__block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  uint64_t v3;
  void *v4;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("NEProcessInfo queue", v0);
  v2 = (void *)g_queue;
  g_queue = (uint64_t)v1;

  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 0);
  v4 = (void *)g_executableUUIDMapping;
  g_executableUUIDMapping = v3;

}

void __40__NEProcessInfo_copyUUIDsForExecutable___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  const char *v8;
  int v9;
  int v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  host_t v16;
  NSObject *v17;
  const char *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  int v22;
  unsigned int v23;
  NSObject *v24;
  unint64_t v25;
  unsigned int *v26;
  unsigned int *v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  unsigned int *v32;
  __int128 v33;
  int *v34;
  char *v35;
  int *v36;
  char *v37;
  NSObject *v38;
  unsigned int *v39;
  int v40;
  int v41;
  uint64_t v42;
  NSObject *v43;
  const char *v44;
  NSObject *v45;
  uint32_t v46;
  int v47;
  NSObject *v48;
  unsigned int *v49;
  uint64_t v50;
  int v51;
  __int128 v52;
  unsigned int v53;
  uint64_t v54;
  mach_msg_type_number_t host_info_outCnt;
  uint64_t v56;
  uint8_t v57[4];
  const char *v58;
  __int16 v59;
  _QWORD v60[2];
  uint8_t buf[32];
  __int128 v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  objc_msgSend((id)g_executableUUIDMapping, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *(void **)(a1 + 40);
    objc_msgSend((id)g_executableUUIDMapping, "objectForKeyedSubscript:", v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v5);

    ne_log_obj();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)g_executableUUIDMapping, "objectForKeyedSubscript:", v2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "+[NEProcessInfo copyUUIDsForExecutable:]_block_invoke";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v2;
      *(_WORD *)&buf[22] = 2112;
      *(_QWORD *)&buf[24] = v7;
      _os_log_debug_impl(&dword_19BD16000, v6, OS_LOG_TYPE_DEBUG, "%s: cached %@ UUID %@", buf, 0x20u);

    }
    goto LABEL_32;
  }
  v8 = (const char *)objc_msgSend(v2, "UTF8String");
  objc_opt_self();
  if (!v8)
    goto LABEL_29;
  v9 = open(v8, 0);
  if (v9 < 0)
  {
    ne_log_obj();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v34 = __error();
      v35 = strerror(*v34);
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "+[NEProcessInfo copyUUIDsFromExecutable:]";
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = v8;
      *(_WORD *)&buf[22] = 2080;
      *(_QWORD *)&buf[24] = v35;
      _os_log_error_impl(&dword_19BD16000, v13, OS_LOG_TYPE_ERROR, "%s: cannot open %s: %s", buf, 0x20u);
    }

    goto LABEL_29;
  }
  v10 = v9;
  v51 = 0;
  if (read(v9, &v51, 4uLL) != 4)
  {
    ne_log_obj();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v36 = __error();
      v37 = strerror(*v36);
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "+[NEProcessInfo copyUUIDsFromExecutable:]";
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = v8;
      *(_WORD *)&buf[22] = 2080;
      *(_QWORD *)&buf[24] = v37;
      _os_log_error_impl(&dword_19BD16000, v14, OS_LOG_TYPE_ERROR, "%s: cannot read magic for %s: %s", buf, 0x20u);
    }

    goto LABEL_16;
  }
  lseek(v10, 0, 0);
  if ((v51 + 17958194) < 2)
  {
    v11 = +[NEProcessInfo copyUUIDForSingleArch:]((uint64_t)NEProcessInfo, v10);
    v12 = (void *)v11;
    if (v11)
    {
      v56 = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v56, 1);
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      ne_log_obj();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = "+[NEProcessInfo copyUUIDsFromExecutable:]";
        _os_log_error_impl(&dword_19BD16000, v19, OS_LOG_TYPE_ERROR, "%s: failed to get UUID for Single Arch", buf, 0xCu);
      }

      v6 = 0;
    }

    goto LABEL_25;
  }
  v6 = 0;
  if (v51 != -1095041334)
    goto LABEL_25;
  v15 = objc_opt_self();
  v62 = 0u;
  memset(buf, 0, sizeof(buf));
  host_info_outCnt = 12;
  v16 = MEMORY[0x1A1ACE994](v15);
  if (host_info(v16, 1, (host_info_t)buf, &host_info_outCnt))
  {
    ne_log_obj();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v57 = 136315138;
      v58 = "+[NEProcessInfo copyUUIDsForFatBinary:]";
      v18 = "%s: cannot get host_info";
LABEL_52:
      _os_log_error_impl(&dword_19BD16000, v17, OS_LOG_TYPE_ERROR, v18, v57, 0xCu);
      goto LABEL_55;
    }
    goto LABEL_55;
  }
  v54 = 0;
  if (read(v10, &v54, 8uLL) != 8)
  {
    ne_log_obj();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v57 = 136315138;
      v58 = "+[NEProcessInfo copyUUIDsForFatBinary:]";
      v18 = "%s: failed to read file";
      goto LABEL_52;
    }
LABEL_55:

LABEL_16:
    v6 = 0;
    goto LABEL_25;
  }
  v22 = HIDWORD(v54);
  v23 = bswap32(HIDWORD(v54));
  ne_log_obj();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v57 = 136315394;
    v58 = "+[NEProcessInfo copyUUIDsForFatBinary:]";
    v59 = 1024;
    LODWORD(v60[0]) = v23;
    _os_log_debug_impl(&dword_19BD16000, v24, OS_LOG_TYPE_DEBUG, "%s: number of arch detected: %d", v57, 0x12u);
  }

  if (!v22)
  {
    ne_log_obj();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v57 = 0;
      _os_log_impl(&dword_19BD16000, v17, OS_LOG_TYPE_DEFAULT, "Number of architectures is 0", v57, 2u);
    }
    goto LABEL_55;
  }
  if (v23 >= 0x20)
    v25 = 32;
  else
    v25 = v23;
  v26 = (unsigned int *)malloc_type_malloc(4 * (v25 + 4 * v25), 0x1000040A86A77D5uLL);
  if (!v26)
    goto LABEL_16;
  v27 = v26;
  v28 = 0;
  if (v25 <= 1)
    v29 = 1;
  else
    v29 = v25;
  v50 = v29;
  v30 = 20 * v29;
  do
  {
    v52 = 0uLL;
    v53 = 0;
    if (read(v10, &v52, 0x14uLL) != 20)
    {
      ne_log_obj();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v57 = 136315138;
        v58 = "+[NEProcessInfo copyUUIDsForFatBinary:]";
        _os_log_error_impl(&dword_19BD16000, v38, OS_LOG_TYPE_ERROR, "%s: failed to read arch info", v57, 0xCu);
      }

      v6 = 0;
      goto LABEL_83;
    }
    LODWORD(v52) = bswap32(v52);
    ne_log_obj();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v57 = 136315650;
      v58 = "+[NEProcessInfo copyUUIDsForFatBinary:]";
      v59 = 1024;
      LODWORD(v60[0]) = v52;
      WORD2(v60[0]) = 1024;
      *(_DWORD *)((char *)v60 + 6) = v52;
      _os_log_debug_impl(&dword_19BD16000, v31, OS_LOG_TYPE_DEBUG, "%s: cpu type %X (%d)", v57, 0x18u);
    }

    DWORD2(v52) = bswap32(DWORD2(v52));
    v32 = &v27[v28 / 4];
    v33 = v52;
    v32[4] = v53;
    *(_OWORD *)v32 = v33;
    v28 += 20;
  }
  while (v30 != v28);
  v6 = 0;
  v39 = v27 + 2;
  v49 = v27;
  do
  {
    v40 = *v39;
    if (!*v39)
    {
      ne_log_obj();
      v43 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        goto LABEL_82;
      *(_DWORD *)v57 = 136315138;
      v58 = "+[NEProcessInfo copyUUIDsForFatBinary:]";
      v44 = "%s: invalid offset";
      v45 = v43;
      v46 = 12;
LABEL_74:
      _os_log_error_impl(&dword_19BD16000, v45, OS_LOG_TYPE_ERROR, v44, v57, v46);
      goto LABEL_82;
    }
    v41 = *(v39 - 2);
    if (lseek(v10, *v39, 0) == -1)
    {
      ne_log_obj();
      v43 = objc_claimAutoreleasedReturnValue();
      v27 = v49;
      if (!os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        goto LABEL_82;
      *(_DWORD *)v57 = 136315394;
      v58 = "+[NEProcessInfo copyUUIDsForFatBinary:]";
      v59 = 1024;
      LODWORD(v60[0]) = v40;
      v44 = "%s: failed to seek to offset %u";
      v45 = v43;
      v46 = 18;
      goto LABEL_74;
    }
    v42 = +[NEProcessInfo copyUUIDForSingleArch:]((uint64_t)NEProcessInfo, v10);
    if (!v42)
    {
      v47 = v40;
      ne_log_obj();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v57 = 136315394;
        v58 = "+[NEProcessInfo copyUUIDsForFatBinary:]";
        v59 = 1024;
        LODWORD(v60[0]) = v47;
        _os_log_error_impl(&dword_19BD16000, v48, OS_LOG_TYPE_ERROR, "%s: failed to get uuid for offset %u", v57, 0x12u);
      }
      v43 = 0;
      goto LABEL_81;
    }
    v43 = v42;
    if (!v6)
    {
      v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      if (!v6)
      {
        ne_log_obj();
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v57 = 136315138;
          v58 = "+[NEProcessInfo copyUUIDsForFatBinary:]";
          _os_log_error_impl(&dword_19BD16000, v48, OS_LOG_TYPE_ERROR, "%s: failed allocate UUID array", v57, 0xCu);
        }
        v6 = 0;
LABEL_81:
        v27 = v49;

        goto LABEL_82;
      }
    }
    if (v41 == *(_DWORD *)&buf[12])
      -[NSObject insertObject:atIndex:](v6, "insertObject:atIndex:", v43, 0);
    else
      -[NSObject addObject:](v6, "addObject:", v43);
    v27 = v49;
    v39 += 5;

    --v50;
  }
  while (v50);
  ne_log_obj();
  v43 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v57 = 136315394;
    v58 = "+[NEProcessInfo copyUUIDsForFatBinary:]";
    v59 = 2112;
    v60[0] = v6;
    _os_log_debug_impl(&dword_19BD16000, v43, OS_LOG_TYPE_DEBUG, "%s: uuids %@", v57, 0x16u);
  }
LABEL_82:

LABEL_83:
  free(v27);
LABEL_25:
  close(v10);
  ne_log_obj();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "+[NEProcessInfo copyUUIDsFromExecutable:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v6;
    _os_log_debug_impl(&dword_19BD16000, v20, OS_LOG_TYPE_DEBUG, "%s: UUIDs %@", buf, 0x16u);
  }

  if (v6)
  {
    objc_msgSend((id)g_executableUUIDMapping, "setObject:forKeyedSubscript:", v6, v2);
    objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v6);
    goto LABEL_32;
  }
LABEL_29:
  ne_log_obj();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "+[NEProcessInfo copyUUIDsForExecutable:]_block_invoke";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v2;
    _os_log_error_impl(&dword_19BD16000, v21, OS_LOG_TYPE_ERROR, "%s: failed to get UUIDs for %@", buf, 0x16u);
  }

  v6 = 0;
LABEL_32:

}

+ (uint64_t)copyUUIDForSingleArch:(uint64_t)a1
{
  uint64_t v3;
  unint64_t i;
  NSObject *v6;
  uint64_t v7;
  _QWORD v8[2];
  uint64_t v9;
  int v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v8[0] = 0;
  v8[1] = 0;
  v10 = 0;
  v9 = 0;
  v3 = 0;
  if (read(a2, v8, 0x1CuLL) == 28)
  {
    if (LODWORD(v8[0]) == -17958193)
      lseek(a2, 4, 1);
    if ((_DWORD)v9)
    {
      for (i = 0; i < v9; ++i)
      {
        v7 = 0;
        if (read(a2, &v7, 8uLL) != 8)
          break;
        if ((_DWORD)v7 == 27)
        {
          v15 = 0;
          v16[0] = 0;
          v16[1] = 0;
          v3 = 0;
          if (read(a2, v16, 0x10uLL) == 16)
          {
            v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v16);
            ne_log_obj();
            v6 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315394;
              v12 = "+[NEProcessInfo copyUUIDForSingleArch:]";
              v13 = 2112;
              v14 = v3;
              _os_log_debug_impl(&dword_19BD16000, v6, OS_LOG_TYPE_DEBUG, "%s: got UUID %@", buf, 0x16u);
            }

          }
          return v3;
        }
        lseek(a2, HIDWORD(v7) - 8, 1);
      }
    }
    return 0;
  }
  return v3;
}

uint64_t __42__NEProcessInfo_copyUUIDsForBundleID_uid___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = v4;
  if (v4 && MEMORY[0x1A1ACFDA4](v4) == MEMORY[0x1E0C813A0])
  {
    v6 = *(void **)(a1 + 32);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", xpc_uuid_get_bytes(v5));
    objc_msgSend(v6, "addObject:", v7);

  }
  return 1;
}

@end
