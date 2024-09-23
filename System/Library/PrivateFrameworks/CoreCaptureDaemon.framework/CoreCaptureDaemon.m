uint64_t CCPipeInterface::ccfree(CCPipeInterface *this)
{
  uint64_t result;

  result = CCPipeInterface::freeResources(this);
  if (this)
    return (*(uint64_t (**)(CCPipeInterface *))(*(_QWORD *)this + 8))(this);
  return result;
}

void CCLogTap::tapLoop(CCLogTap *this)
{
  int v2;
  uint64_t v3;
  int v4;
  const char *CStringPtr;
  const char *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  const char *v10;
  __int128 v11;
  int v12;
  int v13;
  const char *v14;
  const char *v15;
  uint64_t (*v16)(uint64_t, int, void **);
  int v17;
  NSObject *v18;
  __int128 v19;
  time_t v20;
  tm v21;
  _BYTE buf[48];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v2 = (*(uint64_t (**)(_QWORD))(**((_QWORD **)this + 8) + 72))(*((_QWORD *)this + 8));
  v3 = coreCaptureOsLog;
  if (!v2)
  {
    if (coreCaptureOsLog)
    {
      if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      {
        v4 = *((_DWORD *)this + 4);
        CStringPtr = CFStringGetCStringPtr(*((CFStringRef *)this + 5), 0);
        v6 = CFStringGetCStringPtr(*((CFStringRef *)this + 6), 0);
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)&buf[4] = "tapLoop";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 123;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = v4;
        *(_WORD *)&buf[24] = 2080;
        *(_QWORD *)&buf[26] = CStringPtr;
        *(_WORD *)&buf[34] = 2080;
        *(_QWORD *)&buf[36] = v6;
        v7 = v3;
LABEL_7:
        _os_log_impl(&dword_1DB697000, v7, OS_LOG_TYPE_DEFAULT, "CCLogTap::%s:%d tapLoop entry:%u Owner:%s Name:%s\n", buf, 0x2Cu);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v8 = *((_DWORD *)this + 4);
      v9 = CFStringGetCStringPtr(*((CFStringRef *)this + 5), 0);
      v10 = CFStringGetCStringPtr(*((CFStringRef *)this + 6), 0);
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = "tapLoop";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 123;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v8;
      *(_WORD *)&buf[24] = 2080;
      *(_QWORD *)&buf[26] = v9;
      *(_WORD *)&buf[34] = 2080;
      *(_QWORD *)&buf[36] = v10;
      v7 = MEMORY[0x1E0C81028];
      goto LABEL_7;
    }
    if (glog_fd)
    {
      *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v26 = v11;
      v27 = v11;
      v24 = v11;
      v25 = v11;
      *(_OWORD *)&buf[32] = v11;
      v23 = v11;
      *(_OWORD *)buf = v11;
      *(_OWORD *)&buf[16] = v11;
      memset(&v21, 0, sizeof(v21));
      v20 = 0xAAAAAAAAAAAAAAAALL;
      time(&v20);
      localtime_r(&v20, &v21);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v21);
      dprintf(glog_fd, "%s ", buf);
      v12 = glog_fd;
      v13 = *((_DWORD *)this + 4);
      v14 = CFStringGetCStringPtr(*((CFStringRef *)this + 5), 0);
      v15 = CFStringGetCStringPtr(*((CFStringRef *)this + 6), 0);
      dprintf(v12, "CCLogTap::%s:%d tapLoop entry:%u Owner:%s Name:%s\n", "tapLoop", 123, v13, v14, v15);
    }
    if ((*(unsigned int (**)(_QWORD))(**((_QWORD **)this + 8) + 88))(*((_QWORD *)this + 8)))
      v16 = _logTapInterestCallback_kext;
    else
      v16 = _logTapInterestCallback_dext;
    (*(void (**)(_QWORD, uint64_t (*)(uint64_t, int, void **), CCLogTap *))(**((_QWORD **)this + 8)
                                                                                              + 56))(*((_QWORD *)this + 8), v16, this);
    return;
  }
  v17 = v2;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
      goto LABEL_19;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v17;
    v18 = v3;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_19;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v17;
    v18 = MEMORY[0x1E0C81028];
  }
  _os_log_error_impl(&dword_1DB697000, v18, OS_LOG_TYPE_ERROR, "CCLogTap::tapLoop(), Error setting notification port rc[0x%08x]\n", buf, 8u);
LABEL_19:
  if (glog_fd)
  {
    *(_QWORD *)&v19 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v26 = v19;
    v27 = v19;
    v24 = v19;
    v25 = v19;
    *(_OWORD *)&buf[32] = v19;
    v23 = v19;
    *(_OWORD *)buf = v19;
    *(_OWORD *)&buf[16] = v19;
    memset(&v21, 0, sizeof(v21));
    v20 = 0xAAAAAAAAAAAAAAAALL;
    time(&v20);
    localtime_r(&v20, &v21);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v21);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "CCLogTap::tapLoop(), Error setting notification port rc[0x%08x]\n", v17);
  }
}

uint64_t CCTap::ccfree(CCTap *this)
{
  uint64_t result;

  result = CCTap::freeResources(this);
  if (this)
    return (*(uint64_t (**)(CCTap *))(*(_QWORD *)this + 8))(this);
  return result;
}

off_t CCLogFile::closeMMAP(CCLogFile *this)
{
  off_t result;

  msync(*((void **)this + 157), *((_QWORD *)this + 158), 16);
  munmap(*((void **)this + 157), *((_QWORD *)this + 158));
  ftruncate(*((_DWORD *)this + 9), *((_QWORD *)this + 159));
  result = lseek(*((_DWORD *)this + 9), 0, 2);
  *((_QWORD *)this + 157) = 0;
  *((_QWORD *)this + 159) = 0;
  *((_QWORD *)this + 158) = 0;
  return result;
}

uint64_t CCLogFile::initWithRegistryEntry(CCLogFile *this, CCFormatter *a2)
{
  uint64_t v4;
  NSObject *v5;
  __int128 v6;
  const __CFAllocator *v7;
  const __CFNumber *CFProperty;
  const __CFNumber *v9;
  int v10;
  const __CFNumber *v11;
  _DWORD *v12;
  const __CFNumber *v13;
  const __CFNumber *v14;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  NSObject *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  int v35;
  int v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  NSObject *v40;
  uint64_t v41;
  NSObject *v42;
  uint64_t v43;
  NSObject *v44;
  __int128 v45;
  uint64_t v46;
  NSObject *v47;
  uint64_t v48;
  NSObject *v49;
  uint64_t v50;
  NSObject *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;
  time_t v58;
  tm v59;
  pthread_mutexattr_t v60;
  _BYTE buf[32];
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v4 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v5 = v4;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v5 = MEMORY[0x1E0C81028];
  }
  _os_log_impl(&dword_1DB697000, v5, OS_LOG_TYPE_DEFAULT, "CCLogFile::initWithRegistryEntry \n", buf, 2u);
LABEL_7:
  if (glog_fd)
  {
    *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v66 = v6;
    v67 = v6;
    v64 = v6;
    v65 = v6;
    v63 = v6;
    *(_OWORD *)&buf[16] = v6;
    v62 = v6;
    *(_OWORD *)buf = v6;
    memset(&v59, 0, sizeof(v59));
    v60.__sig = 0xAAAAAAAAAAAAAAAALL;
    time(&v60.__sig);
    localtime_r(&v60.__sig, &v59);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v59);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "CCLogFile::initWithRegistryEntry \n");
  }
  v60.__sig = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)v60.__opaque = 0xAAAAAAAAAAAAAAAALL;
  if (!(_DWORD)a2)
  {
    v16 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_51;
      *(_WORD *)buf = 0;
      v17 = v16;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_51;
      *(_WORD *)buf = 0;
      v17 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v17, OS_LOG_TYPE_ERROR, "CCLogFile::initWithRegistryEntry: Invalid arguments\n", buf, 2u);
LABEL_51:
    if (glog_fd)
    {
      *(_QWORD *)&v30 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v30 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v66 = v30;
      v67 = v30;
      v64 = v30;
      v65 = v30;
      v63 = v30;
      *(_OWORD *)&buf[16] = v30;
      v62 = v30;
      *(_OWORD *)buf = v30;
      memset(&v59, 0, sizeof(v59));
      v58 = 0xAAAAAAAAAAAAAAAALL;
      time(&v58);
      localtime_r(&v58, &v59);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v59);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "CCLogFile::initWithRegistryEntry: Invalid arguments\n");
    }
    return 0;
  }
  if (pthread_mutexattr_init(&v60))
  {
    v18 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_54;
      *(_WORD *)buf = 0;
      v19 = v18;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_54;
      *(_WORD *)buf = 0;
      v19 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v19, OS_LOG_TYPE_ERROR, "CCLogFile::initWithRegistryEntry: pthread_mutexattr_init failed\n", buf, 2u);
LABEL_54:
    if (glog_fd)
    {
      *(_QWORD *)&v31 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v31 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v66 = v31;
      v67 = v31;
      v64 = v31;
      v65 = v31;
      v63 = v31;
      *(_OWORD *)&buf[16] = v31;
      v62 = v31;
      *(_OWORD *)buf = v31;
      memset(&v59, 0, sizeof(v59));
      v58 = 0xAAAAAAAAAAAAAAAALL;
      time(&v58);
      localtime_r(&v58, &v59);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v59);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "CCLogFile::initWithRegistryEntry: pthread_mutexattr_init failed\n");
    }
    return 0;
  }
  if (pthread_mutexattr_settype(&v60, 2))
  {
    v20 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_57;
      *(_WORD *)buf = 0;
      v21 = v20;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_57;
      *(_WORD *)buf = 0;
      v21 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v21, OS_LOG_TYPE_ERROR, "CCLogFile::initWithRegistryEntry: pthread_mutexattr_settype failed\n", buf, 2u);
LABEL_57:
    if (glog_fd)
    {
      *(_QWORD *)&v32 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v32 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v66 = v32;
      v67 = v32;
      v64 = v32;
      v65 = v32;
      v63 = v32;
      *(_OWORD *)&buf[16] = v32;
      v62 = v32;
      *(_OWORD *)buf = v32;
      memset(&v59, 0, sizeof(v59));
      v58 = 0xAAAAAAAAAAAAAAAALL;
      time(&v58);
      localtime_r(&v58, &v59);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v59);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "CCLogFile::initWithRegistryEntry: pthread_mutexattr_settype failed\n");
    }
    return 0;
  }
  if (pthread_mutex_init((pthread_mutex_t *)((char *)this + 160), &v60))
  {
    v22 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_60;
      *(_WORD *)buf = 0;
      v23 = v22;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_60;
      *(_WORD *)buf = 0;
      v23 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v23, OS_LOG_TYPE_ERROR, "CCLogFile::initWithRegistryEntry: pthread_mutex_init failed\n", buf, 2u);
LABEL_60:
    if (glog_fd)
    {
      *(_QWORD *)&v33 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v33 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v66 = v33;
      v67 = v33;
      v64 = v33;
      v65 = v33;
      v63 = v33;
      *(_OWORD *)&buf[16] = v33;
      v62 = v33;
      *(_OWORD *)buf = v33;
      memset(&v59, 0, sizeof(v59));
      v58 = 0xAAAAAAAAAAAAAAAALL;
      time(&v58);
      localtime_r(&v58, &v59);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v59);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "CCLogFile::initWithRegistryEntry: pthread_mutex_init failed\n");
    }
    return 0;
  }
  pthread_mutexattr_destroy(&v60);
  if (CCFile::initWithRegistryEntry(this, a2))
  {
    v7 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty((io_registry_entry_t)a2, CFSTR("LogType"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
    if (CFProperty)
    {
      v9 = CFProperty;
      if (CFNumberGetValue(CFProperty, kCFNumberSInt32Type, (char *)this + 112))
      {
        CFRelease(v9);
        if (*((_DWORD *)this + 28))
        {
          *((_DWORD *)this + 29) = -1;
          v10 = 2;
          goto LABEL_26;
        }
        v11 = (const __CFNumber *)IORegistryEntryCreateCFProperty((io_registry_entry_t)a2, CFSTR("NumberOfFiles"), v7, 0);
        if (v11)
        {
          v9 = v11;
          v12 = (_DWORD *)((char *)this + 120);
          if (CFNumberGetValue(v11, kCFNumberSInt32Type, (char *)this + 120))
          {
            CFRelease(v9);
            if (*v12)
            {
              v13 = (const __CFNumber *)IORegistryEntryCreateCFProperty((io_registry_entry_t)a2, CFSTR("FileSize"), v7, 0);
              if (v13)
              {
                v9 = v13;
                if (CFNumberGetValue(v13, kCFNumberSInt32Type, (char *)this + 116))
                {
                  CFRelease(v9);
                  v14 = (const __CFNumber *)IORegistryEntryCreateCFProperty((io_registry_entry_t)a2, CFSTR("FileOptions"), v7, 0);
                  if (v14)
                  {
                    v9 = v14;
                    if (CFNumberGetValue(v14, kCFNumberSInt32Type, (char *)this + 124))
                    {
                      CFRelease(v9);
                      v10 = *v12 + 1;
LABEL_26:
                      *((_DWORD *)this + 30) = v10;
                      *((_DWORD *)this + 9) = -1;
                      if ((CCLogFile::buildFileTables((CFStringRef *)this) & 1) != 0)
                        return 1;
                      v28 = coreCaptureOsLog;
                      if (coreCaptureOsLog)
                      {
                        if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
                          goto LABEL_81;
                        *(_WORD *)buf = 0;
                        v29 = v28;
                      }
                      else
                      {
                        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                          goto LABEL_81;
                        *(_WORD *)buf = 0;
                        v29 = MEMORY[0x1E0C81028];
                      }
                      _os_log_error_impl(&dword_1DB697000, v29, OS_LOG_TYPE_ERROR, "CCLogFile::initWithRegistryEntry buildFileTables\n", buf, 2u);
LABEL_81:
                      if (glog_fd)
                      {
                        *(_QWORD *)&v45 = 0xAAAAAAAAAAAAAAAALL;
                        *((_QWORD *)&v45 + 1) = 0xAAAAAAAAAAAAAAAALL;
                        v66 = v45;
                        v67 = v45;
                        v64 = v45;
                        v65 = v45;
                        v63 = v45;
                        *(_OWORD *)&buf[16] = v45;
                        v62 = v45;
                        *(_OWORD *)buf = v45;
                        memset(&v59, 0, sizeof(v59));
                        v58 = 0xAAAAAAAAAAAAAAAALL;
                        time(&v58);
                        localtime_r(&v58, &v59);
                        strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v59);
                        dprintf(glog_fd, "%s ", buf);
                        dprintf(glog_fd, "CCLogFile::initWithRegistryEntry buildFileTables\n", v57);
                      }
                      goto LABEL_116;
                    }
                    v50 = coreCaptureOsLog;
                    if (coreCaptureOsLog)
                    {
                      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
                        goto LABEL_111;
                      *(_DWORD *)buf = 136315394;
                      *(_QWORD *)&buf[4] = "initWithRegistryEntry";
                      *(_WORD *)&buf[12] = 1024;
                      *(_DWORD *)&buf[14] = 328;
                      v51 = v50;
                    }
                    else
                    {
                      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                        goto LABEL_111;
                      *(_DWORD *)buf = 136315394;
                      *(_QWORD *)&buf[4] = "initWithRegistryEntry";
                      *(_WORD *)&buf[12] = 1024;
                      *(_DWORD *)&buf[14] = 328;
                      v51 = MEMORY[0x1E0C81028];
                    }
                    _os_log_error_impl(&dword_1DB697000, v51, OS_LOG_TYPE_ERROR, "%s:%06u: Failed getting number\n", buf, 0x12u);
LABEL_111:
                    if (glog_fd)
                    {
                      *(_QWORD *)&v56 = 0xAAAAAAAAAAAAAAAALL;
                      *((_QWORD *)&v56 + 1) = 0xAAAAAAAAAAAAAAAALL;
                      v66 = v56;
                      v67 = v56;
                      v64 = v56;
                      v65 = v56;
                      v63 = v56;
                      *(_OWORD *)&buf[16] = v56;
                      v62 = v56;
                      *(_OWORD *)buf = v56;
                      memset(&v59, 0, sizeof(v59));
                      v58 = 0xAAAAAAAAAAAAAAAALL;
                      time(&v58);
                      localtime_r(&v58, &v59);
                      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v59);
                      dprintf(glog_fd, "%s ", buf);
                      v36 = 328;
                      goto LABEL_113;
                    }
LABEL_115:
                    CFRelease(v9);
                    goto LABEL_116;
                  }
                  v48 = coreCaptureOsLog;
                  if (coreCaptureOsLog)
                  {
                    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
                      goto LABEL_108;
                    *(_DWORD *)buf = 136315650;
                    *(_QWORD *)&buf[4] = "initWithRegistryEntry";
                    *(_WORD *)&buf[12] = 1024;
                    *(_DWORD *)&buf[14] = 326;
                    *(_WORD *)&buf[18] = 2080;
                    *(_QWORD *)&buf[20] = "FileOptions";
                    v49 = v48;
                  }
                  else
                  {
                    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                      goto LABEL_108;
                    *(_DWORD *)buf = 136315650;
                    *(_QWORD *)&buf[4] = "initWithRegistryEntry";
                    *(_WORD *)&buf[12] = 1024;
                    *(_DWORD *)&buf[14] = 326;
                    *(_WORD *)&buf[18] = 2080;
                    *(_QWORD *)&buf[20] = "FileOptions";
                    v49 = MEMORY[0x1E0C81028];
                  }
                  _os_log_error_impl(&dword_1DB697000, v49, OS_LOG_TYPE_ERROR, "%s:%06u: Failed reading '%s' from registry\n", buf, 0x1Cu);
LABEL_108:
                  if (glog_fd)
                  {
LABEL_109:
                    *(_QWORD *)&v55 = 0xAAAAAAAAAAAAAAAALL;
                    *((_QWORD *)&v55 + 1) = 0xAAAAAAAAAAAAAAAALL;
                    v66 = v55;
                    v67 = v55;
                    v64 = v55;
                    v65 = v55;
                    v63 = v55;
                    *(_OWORD *)&buf[16] = v55;
                    v62 = v55;
                    *(_OWORD *)buf = v55;
                    memset(&v59, 0, sizeof(v59));
                    v58 = 0xAAAAAAAAAAAAAAAALL;
                    time(&v58);
                    localtime_r(&v58, &v59);
                    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v59);
                    dprintf(glog_fd, "%s ", buf);
                    dprintf(glog_fd, "%s:%06u: Failed reading '%s' from registry\n");
                  }
LABEL_116:
                  CCLogFile::freeResources(this);
                  return 0;
                }
                v46 = coreCaptureOsLog;
                if (coreCaptureOsLog)
                {
                  if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136315394;
                    *(_QWORD *)&buf[4] = "initWithRegistryEntry";
                    *(_WORD *)&buf[12] = 1024;
                    *(_DWORD *)&buf[14] = 322;
                    v47 = v46;
LABEL_141:
                    _os_log_error_impl(&dword_1DB697000, v47, OS_LOG_TYPE_ERROR, "%s:%06u: Failed getting number\n", buf, 0x12u);
                  }
                }
                else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315394;
                  *(_QWORD *)&buf[4] = "initWithRegistryEntry";
                  *(_WORD *)&buf[12] = 1024;
                  *(_DWORD *)&buf[14] = 322;
                  v47 = MEMORY[0x1E0C81028];
                  goto LABEL_141;
                }
                if (!glog_fd)
                  goto LABEL_115;
                *(_QWORD *)&v54 = 0xAAAAAAAAAAAAAAAALL;
                *((_QWORD *)&v54 + 1) = 0xAAAAAAAAAAAAAAAALL;
                v66 = v54;
                v67 = v54;
                v64 = v54;
                v65 = v54;
                v63 = v54;
                *(_OWORD *)&buf[16] = v54;
                v62 = v54;
                *(_OWORD *)buf = v54;
                memset(&v59, 0, sizeof(v59));
                v58 = 0xAAAAAAAAAAAAAAAALL;
                time(&v58);
                localtime_r(&v58, &v59);
                strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v59);
                dprintf(glog_fd, "%s ", buf);
                v36 = 322;
                goto LABEL_113;
              }
              v43 = coreCaptureOsLog;
              if (coreCaptureOsLog)
              {
                if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
                  goto LABEL_102;
                *(_DWORD *)buf = 136315650;
                *(_QWORD *)&buf[4] = "initWithRegistryEntry";
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = 320;
                *(_WORD *)&buf[18] = 2080;
                *(_QWORD *)&buf[20] = "FileSize";
                v44 = v43;
              }
              else
              {
                if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                  goto LABEL_102;
                *(_DWORD *)buf = 136315650;
                *(_QWORD *)&buf[4] = "initWithRegistryEntry";
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = 320;
                *(_WORD *)&buf[18] = 2080;
                *(_QWORD *)&buf[20] = "FileSize";
                v44 = MEMORY[0x1E0C81028];
              }
              _os_log_error_impl(&dword_1DB697000, v44, OS_LOG_TYPE_ERROR, "%s:%06u: Failed reading '%s' from registry\n", buf, 0x1Cu);
LABEL_102:
              if (glog_fd)
                goto LABEL_109;
              goto LABEL_116;
            }
            v41 = coreCaptureOsLog;
            if (coreCaptureOsLog)
            {
              if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
                goto LABEL_99;
              *(_WORD *)buf = 0;
              v42 = v41;
            }
            else
            {
              if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                goto LABEL_99;
              *(_WORD *)buf = 0;
              v42 = MEMORY[0x1E0C81028];
            }
            _os_log_error_impl(&dword_1DB697000, v42, OS_LOG_TYPE_ERROR, "CCLogFile::initWithRegistryEntry Number of files can not be 0.\n", buf, 2u);
LABEL_99:
            if (glog_fd)
            {
              *(_QWORD *)&v53 = 0xAAAAAAAAAAAAAAAALL;
              *((_QWORD *)&v53 + 1) = 0xAAAAAAAAAAAAAAAALL;
              v66 = v53;
              v67 = v53;
              v64 = v53;
              v65 = v53;
              v63 = v53;
              *(_OWORD *)&buf[16] = v53;
              v62 = v53;
              *(_OWORD *)buf = v53;
              memset(&v59, 0, sizeof(v59));
              v58 = 0xAAAAAAAAAAAAAAAALL;
              time(&v58);
              localtime_r(&v58, &v59);
              strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v59);
              dprintf(glog_fd, "%s ", buf);
              dprintf(glog_fd, "CCLogFile::initWithRegistryEntry Number of files can not be 0.\n");
            }
            goto LABEL_116;
          }
          v39 = coreCaptureOsLog;
          if (coreCaptureOsLog)
          {
            if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              *(_QWORD *)&buf[4] = "initWithRegistryEntry";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 315;
              v40 = v39;
LABEL_135:
              _os_log_error_impl(&dword_1DB697000, v40, OS_LOG_TYPE_ERROR, "%s:%06u: Failed getting number\n", buf, 0x12u);
            }
          }
          else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            *(_QWORD *)&buf[4] = "initWithRegistryEntry";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 315;
            v40 = MEMORY[0x1E0C81028];
            goto LABEL_135;
          }
          if (!glog_fd)
            goto LABEL_115;
          *(_QWORD *)&v52 = 0xAAAAAAAAAAAAAAAALL;
          *((_QWORD *)&v52 + 1) = 0xAAAAAAAAAAAAAAAALL;
          v66 = v52;
          v67 = v52;
          v64 = v52;
          v65 = v52;
          v63 = v52;
          *(_OWORD *)&buf[16] = v52;
          v62 = v52;
          *(_OWORD *)buf = v52;
          memset(&v59, 0, sizeof(v59));
          v58 = 0xAAAAAAAAAAAAAAAALL;
          time(&v58);
          localtime_r(&v58, &v59);
          strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v59);
          dprintf(glog_fd, "%s ", buf);
          v36 = 315;
LABEL_113:
          v35 = glog_fd;
          goto LABEL_114;
        }
        v37 = coreCaptureOsLog;
        if (coreCaptureOsLog)
        {
          if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
            goto LABEL_93;
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)&buf[4] = "initWithRegistryEntry";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 312;
          *(_WORD *)&buf[18] = 2080;
          *(_QWORD *)&buf[20] = "NumberOfFiles";
          v38 = v37;
        }
        else
        {
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            goto LABEL_93;
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)&buf[4] = "initWithRegistryEntry";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 312;
          *(_WORD *)&buf[18] = 2080;
          *(_QWORD *)&buf[20] = "NumberOfFiles";
          v38 = MEMORY[0x1E0C81028];
        }
        _os_log_error_impl(&dword_1DB697000, v38, OS_LOG_TYPE_ERROR, "%s:%06u: Failed reading '%s' from registry\n", buf, 0x1Cu);
LABEL_93:
        if (glog_fd)
          goto LABEL_109;
        goto LABEL_116;
      }
      v26 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
          goto LABEL_66;
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "initWithRegistryEntry";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 307;
        v27 = v26;
      }
      else
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_66;
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "initWithRegistryEntry";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 307;
        v27 = MEMORY[0x1E0C81028];
      }
      _os_log_error_impl(&dword_1DB697000, v27, OS_LOG_TYPE_ERROR, "%s:%06u: Failed getting number\n", buf, 0x12u);
LABEL_66:
      if (glog_fd)
      {
        *(_QWORD *)&v34 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v34 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v66 = v34;
        v67 = v34;
        v64 = v34;
        v65 = v34;
        v63 = v34;
        *(_OWORD *)&buf[16] = v34;
        v62 = v34;
        *(_OWORD *)buf = v34;
        memset(&v59, 0, sizeof(v59));
        v58 = 0xAAAAAAAAAAAAAAAALL;
        time(&v58);
        localtime_r(&v58, &v59);
        strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v59);
        dprintf(glog_fd, "%s ", buf);
        v35 = glog_fd;
        v36 = 307;
LABEL_114:
        dprintf(v35, "%s:%06u: Failed getting number\n", "initWithRegistryEntry", v36);
        goto LABEL_115;
      }
      goto LABEL_115;
    }
    v24 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_63;
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "initWithRegistryEntry";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 305;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = "LogType";
      v25 = v24;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_63;
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "initWithRegistryEntry";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 305;
      *(_WORD *)&buf[18] = 2080;
      *(_QWORD *)&buf[20] = "LogType";
      v25 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v25, OS_LOG_TYPE_ERROR, "%s:%06u: Failed reading '%s' from registry\n", buf, 0x1Cu);
LABEL_63:
    if (glog_fd)
      goto LABEL_109;
    goto LABEL_116;
  }
  pthread_mutex_destroy((pthread_mutex_t *)((char *)this + 160));
  return 0;
}

void CCPcapngFormatter::~CCPcapngFormatter(void *this)
{
  if (this)
    free(this);
}

uint64_t CCPcapngFormatter::ccfree(CCPcapngFormatter *this)
{
  CCPcapngFormatter::freeInterfaceTables(this);
  return CCFormatter::ccfree(this);
}

void CCTap::cleanCaptureDirectories(CFStringRef *this)
{
  const char *v2;
  const char *v3;
  uint64_t v4;
  const __CFAllocator *v5;
  char v6;
  char v7;
  CFMutableStringRef Mutable;
  const char *v9;
  uint64_t v10;
  NSObject *v11;
  __int128 v12;
  time_t v13;
  tm v14;
  uint8_t buf[16];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[5];

  v23[2] = *MEMORY[0x1E0C80C00];
  if ((isSeedAndiOS() & (CCProfileMonitor::fProfileLoaded == 0)) != 0)
    v2 = "/Library/Logs/CoreCapture";
  else
    v2 = "/Library/Logs/CrashReporter/CoreCapture";
  v23[0] = v2;
  if ((isSeedAndiOS() & (CCProfileMonitor::fProfileLoaded == 0)) != 0)
    v3 = "/Library/Logs/CrashReporter/CoreCapture";
  else
    v3 = "/Library/Logs/CoreCapture";
  v23[1] = v3;
  if (this[11])
  {
    v4 = 0;
    v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v6 = 1;
    do
    {
      v7 = v6;
      Mutable = CFStringCreateMutable(v5, 512);
      v9 = (const char *)v23[v4];
      CFStringAppendCString(Mutable, v9, 0);
      if (CFStringGetLength(this[11]))
      {
        CFStringAppendCString(Mutable, "/", 0);
        CFStringAppend(Mutable, this[11]);
      }
      v10 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)&buf[4] = v9;
          v11 = v10;
LABEL_16:
          _os_log_impl(&dword_1DB697000, v11, OS_LOG_TYPE_DEFAULT, "cleanCaptureDirectories %s\n", buf, 0xCu);
        }
      }
      else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = v9;
        v11 = MEMORY[0x1E0C81028];
        goto LABEL_16;
      }
      if (glog_fd)
      {
        *(_QWORD *)&v12 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v21 = v12;
        v22 = v12;
        v19 = v12;
        v20 = v12;
        v17 = v12;
        v18 = v12;
        *(_OWORD *)buf = v12;
        v16 = v12;
        memset(&v14, 0, sizeof(v14));
        v13 = 0xAAAAAAAAAAAAAAAALL;
        time(&v13);
        localtime_r(&v13, &v14);
        strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v14);
        dprintf(glog_fd, "%s ", (const char *)buf);
        dprintf(glog_fd, "cleanCaptureDirectories %s\n", v9);
      }
      cleanCaptureDirectory(Mutable);
      if (Mutable)
        CFRelease(Mutable);
      v6 = 0;
      v4 = 1;
    }
    while ((v7 & 1) != 0);
  }
}

void CCDataTap::tapLoop(CCDataTap *this)
{
  int v2;
  uint64_t v3;
  int v4;
  const char *CStringPtr;
  const char *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  const char *v10;
  __int128 v11;
  int v12;
  int v13;
  const char *v14;
  const char *v15;
  uint64_t (*v16)(uint64_t, int, void **);
  int v17;
  NSObject *v18;
  __int128 v19;
  time_t v20;
  tm v21;
  _BYTE buf[48];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v2 = (*(uint64_t (**)(_QWORD))(**((_QWORD **)this + 8) + 72))(*((_QWORD *)this + 8));
  v3 = coreCaptureOsLog;
  if (!v2)
  {
    if (coreCaptureOsLog)
    {
      if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      {
        v4 = *((_DWORD *)this + 4);
        CStringPtr = CFStringGetCStringPtr(*((CFStringRef *)this + 5), 0);
        v6 = CFStringGetCStringPtr(*((CFStringRef *)this + 6), 0);
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)&buf[4] = "tapLoop";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 102;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = v4;
        *(_WORD *)&buf[24] = 2080;
        *(_QWORD *)&buf[26] = CStringPtr;
        *(_WORD *)&buf[34] = 2080;
        *(_QWORD *)&buf[36] = v6;
        v7 = v3;
LABEL_7:
        _os_log_impl(&dword_1DB697000, v7, OS_LOG_TYPE_DEFAULT, "CCDataTap::%s:%d tapLoop entry:%u Owner:%s Name:%s\n", buf, 0x2Cu);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v8 = *((_DWORD *)this + 4);
      v9 = CFStringGetCStringPtr(*((CFStringRef *)this + 5), 0);
      v10 = CFStringGetCStringPtr(*((CFStringRef *)this + 6), 0);
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = "tapLoop";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 102;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v8;
      *(_WORD *)&buf[24] = 2080;
      *(_QWORD *)&buf[26] = v9;
      *(_WORD *)&buf[34] = 2080;
      *(_QWORD *)&buf[36] = v10;
      v7 = MEMORY[0x1E0C81028];
      goto LABEL_7;
    }
    if (glog_fd)
    {
      *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v26 = v11;
      v27 = v11;
      v24 = v11;
      v25 = v11;
      *(_OWORD *)&buf[32] = v11;
      v23 = v11;
      *(_OWORD *)buf = v11;
      *(_OWORD *)&buf[16] = v11;
      memset(&v21, 0, sizeof(v21));
      v20 = 0xAAAAAAAAAAAAAAAALL;
      time(&v20);
      localtime_r(&v20, &v21);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v21);
      dprintf(glog_fd, "%s ", buf);
      v12 = glog_fd;
      v13 = *((_DWORD *)this + 4);
      v14 = CFStringGetCStringPtr(*((CFStringRef *)this + 5), 0);
      v15 = CFStringGetCStringPtr(*((CFStringRef *)this + 6), 0);
      dprintf(v12, "CCDataTap::%s:%d tapLoop entry:%u Owner:%s Name:%s\n", "tapLoop", 102, v13, v14, v15);
    }
    if ((*(unsigned int (**)(_QWORD))(**((_QWORD **)this + 8) + 88))(*((_QWORD *)this + 8)))
      v16 = _dataTapInterestCallback_kext;
    else
      v16 = _dataTapInterestCallback_dext;
    (*(void (**)(_QWORD, uint64_t (*)(uint64_t, int, void **), CCDataTap *))(**((_QWORD **)this + 8)
                                                                                               + 56))(*((_QWORD *)this + 8), v16, this);
    return;
  }
  v17 = v2;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
      goto LABEL_19;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v17;
    v18 = v3;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_19;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v17;
    v18 = MEMORY[0x1E0C81028];
  }
  _os_log_error_impl(&dword_1DB697000, v18, OS_LOG_TYPE_ERROR, "CCDataTap::tapLoop(), Error setting notification port rc[0x%08x]\n", buf, 8u);
LABEL_19:
  if (glog_fd)
  {
    *(_QWORD *)&v19 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v26 = v19;
    v27 = v19;
    v24 = v19;
    v25 = v19;
    *(_OWORD *)&buf[32] = v19;
    v23 = v19;
    *(_OWORD *)buf = v19;
    *(_OWORD *)&buf[16] = v19;
    memset(&v21, 0, sizeof(v21));
    v20 = 0xAAAAAAAAAAAAAAAALL;
    time(&v20);
    localtime_r(&v20, &v21);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v21);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "CCDataTap::tapLoop(), Error setting notification port rc[0x%08x]\n", v17);
  }
}

void CCTextFormatter::~CCTextFormatter(void *this)
{
  if (this)
    free(this);
}

uint64_t isSeedAndiOS(void)
{
  size_t v1[2];

  v1[1] = *MEMORY[0x1E0C80C00];
  if ((gBootArgsParsed & 1) == 0)
  {
    v1[0] = 256;
    if (!sysctlbyname("kern.bootargs", gBootArgs, v1, 0, 0))
    {
      byte_1F02F7671 = 0;
      gBootArgsParsed = 1;
      if (strnstr(gBootArgs, "cc.log.seed", 0x100uLL))
        isSeedAndiOS(void)::bootArgSet = 1;
    }
  }
  return isSeedAndiOS(void)::bootArgSet;
}

uint64_t CCLogPipeInterface::ccfree(CCLogPipeInterface *this)
{
  uint64_t result;

  CCLogPipeInterface::freeResources((uint64_t)this);
  result = CCPipeInterface::freeResources(this);
  if (this)
    return (*(uint64_t (**)(CCLogPipeInterface *))(*(_QWORD *)this + 8))(this);
  return result;
}

uint64_t CCDataPipeInterface::ccfree(CCDataPipeInterface *this)
{
  uint64_t result;

  CCDataPipeInterface::freeResources((uint64_t)this);
  result = CCPipeInterface::freeResources(this);
  if (this)
    return (*(uint64_t (**)(CCDataPipeInterface *))(*(_QWORD *)this + 8))(this);
  return result;
}

uint64_t CCPcapngFormatter::writeFileHeader(io_registry_entry_t *this)
{
  uint64_t v2;
  const __CFAllocator *v3;
  int Length;
  const __CFString *CFProperty;
  CFIndex v6;
  CFIndex v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  const __CFString *v11;
  int v12;
  __int16 v13;
  uint64_t v14;
  CFIndex v15;
  const __CFString *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  __int128 v29;
  __int128 v30;
  int v32;
  uint64_t v33;
  uint64_t v34;
  __int16 v35;
  const __CFString *cf;
  time_t v37;
  tm v38;
  unint64_t v39;
  int v40;
  int v41;
  unint64_t v42;
  unint64_t v43;
  uint8_t buf[16];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[260];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v2 = (*(uint64_t (**)(io_registry_entry_t *, void *, uint64_t))(*(_QWORD *)this + 112))(this, &kSectionHeaderBlock, 28);
  CCPcapngFormatter::buildStreamToInterfaceTable((CCPcapngFormatter *)this);
  v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  cf = (const __CFString *)IORegistryEntryCreateCFProperty(this[3], CFSTR("Owner"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  Length = CFStringGetLength(cf);
  CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty(this[3], CFSTR("Name"), v3, 0);
  v6 = CFStringGetLength(CFProperty);
  if (!this[8])
    goto LABEL_20;
  v7 = v6;
  v8 = 0;
  v34 = ((Length + 3) & 0xFFFFFFFC) + 4;
  v35 = Length;
  v33 = (((_DWORD)v6 + 3) & 0xFFFFFFFC) + 4;
  v32 = Length + v33 + 31;
  while (1)
  {
    v42 = 0xAAAAAAAAAAAAAAAALL;
    v43 = 0xAAAAAAAAAAAAAAAALL;
    v40 = -1431655766;
    v41 = 0;
    v39 = 0xAAAAAAAAAAAAAAAALL;
    *(_DWORD *)&v52[256] = -1431655766;
    *(_QWORD *)&v9 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&v52[224] = v9;
    *(_OWORD *)&v52[240] = v9;
    *(_OWORD *)&v52[192] = v9;
    *(_OWORD *)&v52[208] = v9;
    *(_OWORD *)&v52[160] = v9;
    *(_OWORD *)&v52[176] = v9;
    *(_OWORD *)&v52[128] = v9;
    *(_OWORD *)&v52[144] = v9;
    *(_OWORD *)&v52[96] = v9;
    *(_OWORD *)&v52[112] = v9;
    *(_OWORD *)&v52[64] = v9;
    *(_OWORD *)&v52[80] = v9;
    *(_OWORD *)&v52[32] = v9;
    *(_OWORD *)&v52[48] = v9;
    *(_OWORD *)v52 = v9;
    *(_OWORD *)&v52[16] = v9;
    v10 = *((_QWORD *)this + 5);
    if (!v10)
      break;
    v11 = *(const __CFString **)(v10 + 8 * v8);
    if (!v11)
      break;
    if (!*((_QWORD *)this + 8))
    {
      v27 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v8;
          v28 = v27;
          goto LABEL_28;
        }
      }
      else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v8;
        v28 = MEMORY[0x1E0C81028];
LABEL_28:
        _os_log_error_impl(&dword_1DB697000, v28, OS_LOG_TYPE_ERROR, "CCPcapngFormatter::writeFileHeader Uninitialized fDLTArray, i: %d\n", buf, 8u);
      }
      if (glog_fd)
      {
        *(_QWORD *)&v30 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v30 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v50 = v30;
        v51 = v30;
        v48 = v30;
        v49 = v30;
        v46 = v30;
        v47 = v30;
        *(_OWORD *)buf = v30;
        v45 = v30;
        memset(&v38, 0, sizeof(v38));
        v37 = 0xAAAAAAAAAAAAAAAALL;
        time(&v37);
        localtime_r(&v37, &v38);
        strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v38);
        dprintf(glog_fd, "%s ", (const char *)buf);
        dprintf(glog_fd, "CCPcapngFormatter::writeFileHeader Uninitialized fDLTArray, i: %d\n");
      }
      goto LABEL_20;
    }
    v12 = CFStringGetLength(v11);
    v13 = v12;
    v14 = ((v12 + 3) & 0xFFFFFFFC) + 4;
    LODWORD(v42) = 1;
    HIDWORD(v42) = ((v32 + v14) & 0xFFFFFFFC) + 8;
    LODWORD(v43) = *(unsigned __int16 *)(*((_QWORD *)this + 8) + 2 * v8);
    HIDWORD(v43) = 0x80000;
    v15 = v7;
    v16 = CFProperty;
    v17 = (*(uint64_t (**)(io_registry_entry_t *, unint64_t *, uint64_t))(*(_QWORD *)this + 112))(this, &v42, 16)+ v2;
    v39 = 0x600010009;
    v18 = (*(uint64_t (**)(io_registry_entry_t *, unint64_t *, uint64_t))(*(_QWORD *)this + 112))(this, &v39, 8);
    *(_WORD *)v52 = 2;
    *(_WORD *)&v52[2] = v35;
    memset(&v52[4], 0, 256);
    CFStringGetCString(cf, &v52[4], 256, 0);
    v19 = (*(uint64_t (**)(io_registry_entry_t *, _BYTE *, uint64_t))(*(_QWORD *)this + 112))(this, v52, v34);
    *(_WORD *)v52 = 3;
    v20 = v17 + v18 + v19;
    CFProperty = v16;
    v7 = v15;
    *(_WORD *)&v52[2] = v15;
    memset(&v52[4], 0, 256);
    CFStringGetCString(CFProperty, &v52[4], 256, 0);
    v21 = (*(uint64_t (**)(io_registry_entry_t *, _BYTE *, uint64_t))(*(_QWORD *)this + 112))(this, v52, v33);
    *(_WORD *)v52 = 12;
    v22 = v20 + v21;
    *(_WORD *)&v52[2] = v13;
    memset(&v52[4], 0, 256);
    CFStringGetCString(*(CFStringRef *)(*((_QWORD *)this + 5) + 8 * v8), &v52[4], 256, 0);
    v23 = (*(uint64_t (**)(io_registry_entry_t *, _BYTE *, uint64_t))(*(_QWORD *)this + 112))(this, v52, v14);
    v24 = v22
        + (*(uint64_t (**)(io_registry_entry_t *, int *, uint64_t))(*(_QWORD *)this + 112))(this, &v41, 4);
    v40 = ((v32 + v14) & 0xFFFFFFFC) + 8;
    v2 = v24
       + (*(uint64_t (**)(io_registry_entry_t *, int *, uint64_t))(*(_QWORD *)this + 112))(this, &v40, 4)
       + v23;
    if (++v8 >= (unint64_t)this[8])
      goto LABEL_20;
  }
  v25 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v8;
    v26 = v25;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v8;
    v26 = MEMORY[0x1E0C81028];
  }
  _os_log_error_impl(&dword_1DB697000, v26, OS_LOG_TYPE_ERROR, "CCPcapngFormatter::writeFileHeader Uninitialized fStreamNameArray, i: %d\n", buf, 8u);
LABEL_15:
  if (glog_fd)
  {
    *(_QWORD *)&v29 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v29 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v50 = v29;
    v51 = v29;
    v48 = v29;
    v49 = v29;
    v46 = v29;
    v47 = v29;
    *(_OWORD *)buf = v29;
    v45 = v29;
    memset(&v38, 0, sizeof(v38));
    v37 = 0xAAAAAAAAAAAAAAAALL;
    time(&v37);
    localtime_r(&v37, &v38);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v38);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCPcapngFormatter::writeFileHeader Uninitialized fStreamNameArray, i: %d\n");
  }
LABEL_20:
  if (cf)
    CFRelease(cf);
  if (CFProperty)
    CFRelease(CFProperty);
  return v2;
}

uint64_t CCServiceMonitor::servicesPublished(uint64_t this, io_iterator_t a2)
{
  _BYTE *v2;
  io_object_t v4;

  v2 = (_BYTE *)this;
  *(_BYTE *)(this + 12) = 1;
  if (!shutDownPending)
  {
    usleep(0x186A0u);
    while (1)
    {
      this = IOIteratorNext(a2);
      if (!(_DWORD)this)
        break;
      v4 = this;
      (*(void (**)(_BYTE *, uint64_t))(*(_QWORD *)v2 + 56))(v2, this);
      IOObjectRelease(v4);
    }
  }
  v2[12] = 0;
  return this;
}

void CCPipeMonitor::cleanCaptureDirectories(CFDictionaryRef *this)
{
  pthread_mutex_t *v2;
  uint64_t v3;
  NSObject *v4;
  pthread_mutex_t *v5;
  CFIndex Count;
  CFIndex v7;
  size_t v8;
  const void **v9;
  const void **v10;
  const void **v11;
  const void **v12;
  uint64_t i;
  const void **v14;
  uint64_t v15;
  __int128 v16;
  NSObject *v17;
  __int128 v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  __int128 v23;
  __int128 v24;
  time_t v25;
  tm v26;
  uint8_t buf[16];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v2 = (pthread_mutex_t *)(this + 10);
  if (pthread_mutex_lock((pthread_mutex_t *)(this + 10)))
  {
    v3 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
        goto LABEL_19;
      *(_WORD *)buf = 0;
      v4 = v3;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        goto LABEL_19;
      *(_WORD *)buf = 0;
      v4 = MEMORY[0x1E0C81028];
    }
    _os_log_impl(&dword_1DB697000, v4, OS_LOG_TYPE_DEFAULT, "fMutexCleanDirectories not acquired, bail out\n", buf, 2u);
LABEL_19:
    if (glog_fd)
    {
      *(_QWORD *)&v16 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v33 = v16;
      v34 = v16;
      v31 = v16;
      v32 = v16;
      v29 = v16;
      v30 = v16;
      *(_OWORD *)buf = v16;
      v28 = v16;
      memset(&v26, 0, sizeof(v26));
      v25 = 0xAAAAAAAAAAAAAAAALL;
      time(&v25);
      localtime_r(&v25, &v26);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v26);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "fMutexCleanDirectories not acquired, bail out\n");
    }
    return;
  }
  v5 = (pthread_mutex_t *)(this + 18);
  pthread_mutex_lock((pthread_mutex_t *)(this + 18));
  Count = CFDictionaryGetCount(this[7]);
  if (Count)
  {
    v7 = Count;
    v8 = 8 * Count;
    v9 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
    if (v9)
    {
      v10 = v9;
      v11 = (const void **)malloc_type_malloc(v8, 0x80040B8603338uLL);
      if (v11)
      {
        v12 = v11;
        CFDictionaryGetKeysAndValues(this[7], v10, v11);
        for (i = 0; i != v7; ++i)
          (*(void (**)(const void *))(*(_QWORD *)v12[i] + 96))(v12[i]);
        pthread_mutex_unlock(v5);
        free(v10);
        v14 = v12;
LABEL_11:
        free(v14);
LABEL_12:
        if (!pthread_mutex_unlock(v2))
          return;
        v15 = coreCaptureOsLog;
        if (!coreCaptureOsLog)
        {
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            goto LABEL_31;
          *(_WORD *)buf = 0;
          v17 = MEMORY[0x1E0C81028];
          goto LABEL_30;
        }
        if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
          goto LABEL_31;
        *(_WORD *)buf = 0;
        goto LABEL_25;
      }
      v21 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          v22 = v21;
LABEL_51:
          _os_log_error_impl(&dword_1DB697000, v22, OS_LOG_TYPE_ERROR, "cleanCaptureDirectories:Failed to malloc memory for valueArray", buf, 2u);
        }
      }
      else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v22 = MEMORY[0x1E0C81028];
        goto LABEL_51;
      }
      if (glog_fd)
      {
        *(_QWORD *)&v24 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v33 = v24;
        v34 = v24;
        v31 = v24;
        v32 = v24;
        v29 = v24;
        v30 = v24;
        *(_OWORD *)buf = v24;
        v28 = v24;
        memset(&v26, 0, sizeof(v26));
        v25 = 0xAAAAAAAAAAAAAAAALL;
        time(&v25);
        localtime_r(&v25, &v26);
        strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v26);
        dprintf(glog_fd, "%s ", (const char *)buf);
        dprintf(glog_fd, "cleanCaptureDirectories:Failed to malloc memory for valueArray");
      }
      pthread_mutex_unlock(v5);
      v14 = v10;
      goto LABEL_11;
    }
    v19 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v20 = v19;
LABEL_49:
        _os_log_error_impl(&dword_1DB697000, v20, OS_LOG_TYPE_ERROR, "cleanCaptureDirectories:Failed to malloc memory for keyArray", buf, 2u);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v20 = MEMORY[0x1E0C81028];
      goto LABEL_49;
    }
    if (glog_fd)
    {
      *(_QWORD *)&v23 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v23 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v33 = v23;
      v34 = v23;
      v31 = v23;
      v32 = v23;
      v29 = v23;
      v30 = v23;
      *(_OWORD *)buf = v23;
      v28 = v23;
      memset(&v26, 0, sizeof(v26));
      v25 = 0xAAAAAAAAAAAAAAAALL;
      time(&v25);
      localtime_r(&v25, &v26);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v26);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "cleanCaptureDirectories:Failed to malloc memory for keyArray");
    }
    pthread_mutex_unlock((pthread_mutex_t *)(this + 18));
    goto LABEL_12;
  }
  pthread_mutex_unlock((pthread_mutex_t *)(this + 18));
  if (!pthread_mutex_unlock(v2))
    return;
  v15 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_31;
    *(_WORD *)buf = 0;
LABEL_25:
    v17 = v15;
    goto LABEL_30;
  }
  if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    goto LABEL_31;
  *(_WORD *)buf = 0;
  v17 = MEMORY[0x1E0C81028];
LABEL_30:
  _os_log_impl(&dword_1DB697000, v17, OS_LOG_TYPE_DEFAULT, "CCPipeMonitor::cleanCaptureDirectories - fails to unlock\n", buf, 2u);
LABEL_31:
  if (glog_fd)
  {
    *(_QWORD *)&v18 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v33 = v18;
    v34 = v18;
    v31 = v18;
    v32 = v18;
    v29 = v18;
    v30 = v18;
    *(_OWORD *)buf = v18;
    v28 = v18;
    memset(&v26, 0, sizeof(v26));
    v25 = 0xAAAAAAAAAAAAAAAALL;
    time(&v25);
    localtime_r(&v25, &v26);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v26);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCPipeMonitor::cleanCaptureDirectories - fails to unlock\n");
  }
}

uint64_t CCIOReporterFormatter::refreshSubscriptionsFromStreamRegistry(CCIOReporterFormatter *this)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  __int128 v5;
  const void *v6;
  const void *v7;
  const __CFAllocator *v8;
  CFMutableArrayRef Mutable;
  CFMutableArrayRef v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  __int128 v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  time_t v31;
  tm v32;
  io_iterator_t iterator;
  _BYTE buf[32];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  iterator = 0;
  v2 = *((unsigned int *)this + 8);
  v3 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "CCIOReporterFormatter";
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "refreshSubscriptionsFromStreamRegistry";
    v4 = v3;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "CCIOReporterFormatter";
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "refreshSubscriptionsFromStreamRegistry";
    v4 = MEMORY[0x1E0C81028];
  }
  _os_log_impl(&dword_1DB697000, v4, OS_LOG_TYPE_DEFAULT, "%s::%s clearing out any previous subscriptions\n", buf, 0x16u);
LABEL_7:
  if (glog_fd)
  {
    *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v39 = v5;
    v40 = v5;
    v37 = v5;
    v38 = v5;
    v35 = v5;
    v36 = v5;
    *(_OWORD *)buf = v5;
    *(_OWORD *)&buf[16] = v5;
    memset(&v32, 0, sizeof(v32));
    v31 = 0xAAAAAAAAAAAAAAAALL;
    time(&v31);
    localtime_r(&v31, &v32);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v32);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "%s::%s clearing out any previous subscriptions\n", "CCIOReporterFormatter", "refreshSubscriptionsFromStreamRegistry");
  }
  v6 = (const void *)*((_QWORD *)this + 6);
  if (v6)
  {
    CFRelease(v6);
    *((_QWORD *)this + 6) = 0;
  }
  v7 = (const void *)*((_QWORD *)this + 5);
  if (v7)
  {
    CFRelease(v7);
    *((_QWORD *)this + 5) = 0;
  }
  v8 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 1, MEMORY[0x1E0C9B378]);
  *((_QWORD *)this + 5) = Mutable;
  if (!Mutable)
  {
    v13 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_43;
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "CCIOReporterFormatter";
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "refreshSubscriptionsFromStreamRegistry";
      v14 = v13;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_43;
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "CCIOReporterFormatter";
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "refreshSubscriptionsFromStreamRegistry";
      v14 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v14, OS_LOG_TYPE_ERROR, "%s::%s channelStreamArray not valid\n", buf, 0x16u);
LABEL_43:
    if (glog_fd)
    {
      *(_QWORD *)&v25 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v25 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v39 = v25;
      v40 = v25;
      v37 = v25;
      v38 = v25;
      v35 = v25;
      v36 = v25;
      *(_OWORD *)buf = v25;
      *(_OWORD *)&buf[16] = v25;
      memset(&v32, 0, sizeof(v32));
      v31 = 0xAAAAAAAAAAAAAAAALL;
      time(&v31);
      localtime_r(&v31, &v32);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v32);
      dprintf(glog_fd, "%s ", buf);
      v26 = 3758097085;
      dprintf(glog_fd, "%s::%s channelStreamArray not valid\n");
      return v26;
    }
    return 3758097085;
  }
  if (!MEMORY[0x1DF0B21D0](v2, "IOService", &iterator))
  {
    v15 = IOIteratorNext(iterator);
    *(_QWORD *)&v16 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v39 = v16;
    v40 = v16;
    v37 = v16;
    v38 = v16;
    v35 = v16;
    v36 = v16;
    *(_OWORD *)buf = v16;
    *(_OWORD *)&buf[16] = v16;
    if ((_DWORD)v15)
    {
      v17 = v15;
      do
      {
        v18 = IOIteratorNext(iterator);
        MEMORY[0x1DF0B21DC](v17, buf);
        if (*(_QWORD *)buf != 0x6F7065524F494343
          || *(_QWORD *)&buf[8] != 0x53676F4C72657472
          || *(_QWORD *)&buf[14] != 0x6D616572745367)
        {
          break;
        }
        CCIOReporterFormatter::addRegistryChildToChannelDictionary((CFMutableArrayRef *)this, v17);
        v17 = v18;
      }
      while ((_DWORD)v18);
    }
  }
  if (CFArrayGetCount(*((CFArrayRef *)this + 5)))
  {
    v10 = CFArrayCreateMutable(v8, 1, MEMORY[0x1E0C9B378]);
    *((_QWORD *)this + 6) = v10;
    if (v10)
    {
      if (!CCIOReporterFormatter::shapeIOReportLibraryFriendlyDictionary((CFArrayRef *)this))
        return 0;
      v11 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
          goto LABEL_50;
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "CCIOReporterFormatter";
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "refreshSubscriptionsFromStreamRegistry";
        v12 = v11;
      }
      else
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_50;
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "CCIOReporterFormatter";
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "refreshSubscriptionsFromStreamRegistry";
        v12 = MEMORY[0x1E0C81028];
      }
      _os_log_error_impl(&dword_1DB697000, v12, OS_LOG_TYPE_ERROR, "%s::%s shapeIOReportLibraryFriendlyDictionary failed\n", buf, 0x16u);
LABEL_50:
      v26 = 3758097084;
      if (glog_fd)
      {
        *(_QWORD *)&v28 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v28 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v39 = v28;
        v40 = v28;
        v37 = v28;
        v38 = v28;
        v35 = v28;
        v36 = v28;
        *(_OWORD *)buf = v28;
        *(_OWORD *)&buf[16] = v28;
        memset(&v32, 0, sizeof(v32));
        v31 = 0xAAAAAAAAAAAAAAAALL;
        time(&v31);
        localtime_r(&v31, &v32);
        strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v32);
        dprintf(glog_fd, "%s ", buf);
        dprintf(glog_fd, "%s::%s shapeIOReportLibraryFriendlyDictionary failed\n");
      }
      return v26;
    }
    v23 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_53;
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "CCIOReporterFormatter";
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "refreshSubscriptionsFromStreamRegistry";
      v24 = v23;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_53;
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "CCIOReporterFormatter";
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "refreshSubscriptionsFromStreamRegistry";
      v24 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v24, OS_LOG_TYPE_ERROR, "%s::%s rawStreamAndSubscriptionArray not valid\n", buf, 0x16u);
LABEL_53:
    if (glog_fd)
    {
      *(_QWORD *)&v29 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v29 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v39 = v29;
      v40 = v29;
      v37 = v29;
      v38 = v29;
      v35 = v29;
      v36 = v29;
      *(_OWORD *)buf = v29;
      *(_OWORD *)&buf[16] = v29;
      memset(&v32, 0, sizeof(v32));
      v31 = 0xAAAAAAAAAAAAAAAALL;
      time(&v31);
      localtime_r(&v31, &v32);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v32);
      dprintf(glog_fd, "%s ", buf);
      v26 = 3758097085;
      dprintf(glog_fd, "%s::%s rawStreamAndSubscriptionArray not valid\n");
      return v26;
    }
    return 3758097085;
  }
  v21 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
      goto LABEL_47;
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "CCIOReporterFormatter";
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "refreshSubscriptionsFromStreamRegistry";
    v22 = v21;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_47;
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "CCIOReporterFormatter";
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "refreshSubscriptionsFromStreamRegistry";
    v22 = MEMORY[0x1E0C81028];
  }
  _os_log_error_impl(&dword_1DB697000, v22, OS_LOG_TYPE_ERROR, "%s::%s channelStreamArray empty\n", buf, 0x16u);
LABEL_47:
  v26 = 3758097084;
  if (glog_fd)
  {
    *(_QWORD *)&v27 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v27 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v39 = v27;
    v40 = v27;
    v37 = v27;
    v38 = v27;
    v35 = v27;
    v36 = v27;
    *(_OWORD *)buf = v27;
    *(_OWORD *)&buf[16] = v27;
    memset(&v32, 0, sizeof(v32));
    v31 = 0xAAAAAAAAAAAAAAAALL;
    time(&v31);
    localtime_r(&v31, &v32);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v32);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "%s::%s channelStreamArray empty\n");
  }
  return v26;
}

uint64_t CCDataTap::initWithRegistryEntry(CCDataTap *this, CCPipeInterface *a2, CCTap *a3)
{
  io_object_t v3;
  CCPipeInterface *v5;
  void *v6;
  uint64_t v8;
  NSObject *v9;
  __int128 v10;
  time_t v11;
  tm v12;
  uint8_t buf[16];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  v3 = a2;
  v21 = *MEMORY[0x1E0C80C00];
  *((_DWORD *)this + 18) = 2;
  v5 = CCPipeInterface::withRegistryEntry(a2, this, a3);
  if (v5)
  {
    *((_QWORD *)this + 8) = v6;
    if (v6)
    {
      CCTap::initWithRegistryEntry(this, v3);
      return 1;
    }
  }
  else
  {
    *((_QWORD *)this + 8) = 0;
  }
  v8 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v9 = v8;
LABEL_14:
      _os_log_error_impl(&dword_1DB697000, v9, OS_LOG_TYPE_ERROR, "CCDataTap::initWithRegistryEntry invalid fPipeInterface\n", buf, 2u);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v9 = MEMORY[0x1E0C81028];
    goto LABEL_14;
  }
  if (glog_fd)
  {
    *(_QWORD *)&v10 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v19 = v10;
    v20 = v10;
    v17 = v10;
    v18 = v10;
    v15 = v10;
    v16 = v10;
    *(_OWORD *)buf = v10;
    v14 = v10;
    memset(&v12, 0, sizeof(v12));
    v11 = 0xAAAAAAAAAAAAAAAALL;
    time(&v11);
    localtime_r(&v11, &v12);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v12);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCDataTap::initWithRegistryEntry invalid fPipeInterface\n");
  }
  return 0;
}

uint64_t CCFormatter::writeFileHeader(CCFormatter *this)
{
  return 0;
}

void CCDataTap::~CCDataTap(void *this)
{
  if (this)
    free(this);
}

uint64_t CCDataTap::profileRemoved(CFStringRef *this)
{
  uint64_t v2;
  const char *CStringPtr;
  const char *v4;
  NSObject *v5;
  const char *v6;
  const char *v7;
  __int128 v8;
  int v9;
  const char *v10;
  const char *v11;
  CFStringRef v12;
  _DWORD *v13;
  time_t v15;
  tm v16;
  _BYTE buf[32];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    CStringPtr = CFStringGetCStringPtr(this[5], 0);
    v4 = CFStringGetCStringPtr(this[6], 0);
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = CStringPtr;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = v4;
    v5 = v2;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    v6 = CFStringGetCStringPtr(this[5], 0);
    v7 = CFStringGetCStringPtr(this[6], 0);
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = v7;
    v5 = MEMORY[0x1E0C81028];
  }
  _os_log_impl(&dword_1DB697000, v5, OS_LOG_TYPE_DEFAULT, "CCDataTap::profileRemoved, Owner: %s, Name: %s\n", buf, 0x16u);
LABEL_7:
  if (glog_fd)
  {
    *(_QWORD *)&v8 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v22 = v8;
    v23 = v8;
    v20 = v8;
    v21 = v8;
    v18 = v8;
    v19 = v8;
    *(_OWORD *)buf = v8;
    *(_OWORD *)&buf[16] = v8;
    memset(&v16, 0, sizeof(v16));
    v15 = 0xAAAAAAAAAAAAAAAALL;
    time(&v15);
    localtime_r(&v15, &v16);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v16);
    dprintf(glog_fd, "%s ", buf);
    v9 = glog_fd;
    v10 = CFStringGetCStringPtr(this[5], 0);
    v11 = CFStringGetCStringPtr(this[6], 0);
    dprintf(v9, "CCDataTap::profileRemoved, Owner: %s, Name: %s\n", v10, v11);
  }
  v12 = this[8];
  if (v12)
  {
    if (v13)
      IOConnectCallMethod(v13[22], 7u, 0, 0, 0, 0, 0, 0, 0, 0);
  }
  return 0;
}

uint64_t CCDataPipeInterface::getUserClientID(CCDataPipeInterface *this)
{
  return 1682991440;
}

void CCXPCService::~CCXPCService(void *this)
{
  if (this)
    free(this);
}

void CCIOReportDumpQueue::_processorThread(CCIOReportDumpQueue *this)
{
  __CFSet *Mutable;
  const __CFAllocator *v3;
  uint64_t v4;
  unsigned __int8 v5;
  int v6;
  __CFString *v7;
  __CFString *v8;
  const char *v9;
  __CFString *MutableCopy;
  __CFString *v11;
  io_object_t v12;
  uint64_t v13;
  const void *Aggregate;
  dispatch_time_t v15;
  const void *v16;
  io_object_t v17;
  uint64_t v18;
  NSObject *v19;
  __int128 v20;
  CFIndex Count;
  const void **v22;
  const __CFString *v23;
  __CFDictionary *Value;
  __CFString *v25;
  const __CFString *v26;
  CCIOReportDumpQueue *v27;
  uint64_t v28;
  NSObject *v29;
  __int128 v30;
  uint64_t v31;
  NSObject *v32;
  __int128 v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v38;
  NSObject *v39;
  uint64_t v40;
  NSObject *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  void **keys;
  pthread_mutex_t *v47;
  __CFDictionary *theDict;
  _QWORD block[5];
  time_t v50;
  tm v51;
  io_registry_entry_t parent;
  _BYTE buf[32];
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  Mutable = CFSetCreateMutable(0, 0, MEMORY[0x1E0C9B3B0]);
  theDict = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (!theDict)
    goto LABEL_62;
  v47 = (pthread_mutex_t *)((char *)this + 40);
  v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  while (1)
  {
    pthread_mutex_lock(v47);
    if (*((_BYTE *)this + 12))
      goto LABEL_72;
    if (!*((_BYTE *)this + 13) && !*((_QWORD *)this + 2))
    {
      if (pthread_cond_wait((pthread_cond_t *)((char *)this + 104), v47))
        goto LABEL_62;
      if (*((_BYTE *)this + 12))
      {
LABEL_72:
        pthread_mutex_unlock(v47);
        goto LABEL_62;
      }
    }
    pthread_mutex_unlock(v47);
    while (1)
    {
      v4 = CCIOReportDumpQueue::dequeue(this);
      if (!v4)
        break;
      v5 = isSeedAndiOS();
      v6 = CCProfileMonitor::fProfileLoaded;
      v7 = CFStringCreateMutable(v3, 512);
      v8 = v7;
      if (!v7)
        goto LABEL_62;
      if ((v5 & (v6 == 0)) != 0)
        v9 = "/Library/Logs/CoreCapture";
      else
        v9 = "/Library/Logs/CrashReporter/CoreCapture";
      CFStringAppendCString(v7, v9, 0);
      CFStringAppendFormat(v8, 0, CFSTR("/%s/%s/"), v4, "Data");
      parent = 0;
      MutableCopy = CFStringCreateMutableCopy(v3, 0, v8);
      v11 = MutableCopy;
      if (!MutableCopy)
      {
        v28 = coreCaptureOsLog;
        if (coreCaptureOsLog)
        {
          if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            *(_QWORD *)&buf[4] = "_processorThread";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 189;
            v29 = v28;
LABEL_58:
            _os_log_error_impl(&dword_1DB697000, v29, OS_LOG_TYPE_ERROR, "%s@%d: bail - !hash\n", buf, 0x12u);
          }
        }
        else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "_processorThread";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 189;
          v29 = MEMORY[0x1E0C81028];
          goto LABEL_58;
        }
        if (glog_fd)
        {
          *(_QWORD *)&v30 = 0xAAAAAAAAAAAAAAAALL;
          *((_QWORD *)&v30 + 1) = 0xAAAAAAAAAAAAAAAALL;
          v58 = v30;
          v59 = v30;
          v56 = v30;
          v57 = v30;
          v54 = v30;
          v55 = v30;
          *(_OWORD *)buf = v30;
          *(_OWORD *)&buf[16] = v30;
          memset(&v51, 0, sizeof(v51));
          v50 = 0xAAAAAAAAAAAAAAAALL;
          time(&v50);
          localtime_r(&v50, &v51);
          strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v51);
          dprintf(glog_fd, "%s ", buf);
          dprintf(glog_fd, "%s@%d: bail - !hash\n", "_processorThread", 189);
        }
        CFRelease(v8);
        goto LABEL_62;
      }
      CFStringAppendFormat(MutableCopy, 0, CFSTR("0x%016x"), *(unsigned int *)(v4 + 512));
      if (CFSetContainsValue(Mutable, v11))
      {
        v12 = *(_DWORD *)(v4 + 512);
        if (v12)
          IOObjectRelease(v12);
        MEMORY[0x1DF0B22E4](v4, 0x1020C404FABDE88);
        CFRelease(v11);
        CFRelease(v8);
      }
      else
      {
        CFSetAddValue(Mutable, v11);
        CFRelease(v11);
        if (!IORegistryEntryGetParentEntry(*(_DWORD *)(v4 + 512), "IOService", &parent))
        {
          v13 = operator new();
          *(_DWORD *)(v13 + 512) = *(_DWORD *)(v4 + 512);
          *(_OWORD *)(v13 + 520) = 0u;
          strlcpy((char *)v13, (const char *)v4, 0x200uLL);
          *(_DWORD *)(v13 + 512) = parent;
          if (!CCIOReportDumpQueue::enqueue((uint64_t)this, v13))
            MEMORY[0x1DF0B22E4](v13, 0x1020C404FABDE88);
        }
        if (CFDictionaryGetValue(theDict, v8))
        {
LABEL_25:
          v16 = (const void *)IOReportCopyChannelsForDriver();
          if (v16)
          {
            if (IOReportGetChannelCount() && IOReportMergeChannels())
            {
              v31 = coreCaptureOsLog;
              if (coreCaptureOsLog)
              {
                if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315394;
                  *(_QWORD *)&buf[4] = "_processorThread";
                  *(_WORD *)&buf[12] = 1024;
                  *(_DWORD *)&buf[14] = 254;
                  v32 = v31;
LABEL_68:
                  _os_log_error_impl(&dword_1DB697000, v32, OS_LOG_TYPE_ERROR, "%s@%d: Problem merging channels\n", buf, 0x12u);
                }
              }
              else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                *(_QWORD *)&buf[4] = "_processorThread";
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = 254;
                v32 = MEMORY[0x1E0C81028];
                goto LABEL_68;
              }
              if (glog_fd)
              {
                *(_QWORD *)&v33 = 0xAAAAAAAAAAAAAAAALL;
                *((_QWORD *)&v33 + 1) = 0xAAAAAAAAAAAAAAAALL;
                v58 = v33;
                v59 = v33;
                v56 = v33;
                v57 = v33;
                v54 = v33;
                v55 = v33;
                *(_OWORD *)buf = v33;
                *(_OWORD *)&buf[16] = v33;
                memset(&v51, 0, sizeof(v51));
                v50 = 0xAAAAAAAAAAAAAAAALL;
                time(&v50);
                localtime_r(&v50, &v51);
                strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v51);
                dprintf(glog_fd, "%s ", buf);
                dprintf(glog_fd, "%s@%d: Problem merging channels\n", "_processorThread", 254);
              }
              CFRelease(v16);
              CFRelease(v8);
              goto LABEL_62;
            }
            CFRelease(v16);
          }
          CFRelease(v8);
          v17 = *(_DWORD *)(v4 + 512);
          if (v17)
            IOObjectRelease(v17);
          MEMORY[0x1DF0B22E4](v4, 0x1020C404FABDE88);
        }
        else
        {
          Aggregate = (const void *)IOReportCreateAggregate();
          if (Aggregate)
          {
            v15 = dispatch_time(0, 1000000000);
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 0x40000000;
            block[2] = ___ZN19CCIOReportDumpQueue16_processorThreadEv_block_invoke;
            block[3] = &__block_descriptor_tmp_1363;
            block[4] = this;
            dispatch_after(v15, MEMORY[0x1E0C80D38], block);
            CFDictionarySetValue(theDict, v8, Aggregate);
            CFRelease(Aggregate);
            goto LABEL_25;
          }
          v18 = coreCaptureOsLog;
          if (coreCaptureOsLog)
          {
            if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
              goto LABEL_36;
            *(_WORD *)buf = 0;
            v19 = v18;
          }
          else
          {
            if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              goto LABEL_36;
            *(_WORD *)buf = 0;
            v19 = MEMORY[0x1E0C81028];
          }
          _os_log_error_impl(&dword_1DB697000, v19, OS_LOG_TYPE_ERROR, "Unable to create IOReport Aggregate\n", buf, 2u);
LABEL_36:
          if (glog_fd)
          {
            *(_QWORD *)&v20 = 0xAAAAAAAAAAAAAAAALL;
            *((_QWORD *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
            v58 = v20;
            v59 = v20;
            v56 = v20;
            v57 = v20;
            v54 = v20;
            v55 = v20;
            *(_OWORD *)buf = v20;
            *(_OWORD *)&buf[16] = v20;
            memset(&v51, 0, sizeof(v51));
            v50 = 0xAAAAAAAAAAAAAAAALL;
            time(&v50);
            localtime_r(&v50, &v51);
            strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v51);
            dprintf(glog_fd, "%s ", buf);
            dprintf(glog_fd, "Unable to create IOReport Aggregate\n");
          }
          CFRelease(v8);
        }
      }
    }
    if (*((_BYTE *)this + 13))
    {
      *((_BYTE *)this + 13) = 0;
      Count = CFDictionaryGetCount(theDict);
      keys = (void **)malloc_type_malloc(8 * Count, 0xC0040B8AA526DuLL);
      if (!keys)
        goto LABEL_62;
      CFDictionaryGetKeysAndValues(theDict, (const void **)keys, 0);
      if (Count)
      {
        v22 = (const void **)keys;
        while (1)
        {
          v23 = (const __CFString *)*v22;
          if (!*v22)
            break;
          Value = (__CFDictionary *)CFDictionaryGetValue(theDict, *v22);
          if (!Value)
          {
            v38 = coreCaptureOsLog;
            if (coreCaptureOsLog)
            {
              if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                *(_QWORD *)&buf[4] = "_processorThread";
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = 288;
                v39 = v38;
LABEL_97:
                _os_log_error_impl(&dword_1DB697000, v39, OS_LOG_TYPE_ERROR, "%s@%d: bail - !allChannels\n", buf, 0x12u);
              }
            }
            else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              *(_QWORD *)&buf[4] = "_processorThread";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 288;
              v39 = MEMORY[0x1E0C81028];
              goto LABEL_97;
            }
            if (glog_fd)
            {
              *(_QWORD *)&v44 = 0xAAAAAAAAAAAAAAAALL;
              *((_QWORD *)&v44 + 1) = 0xAAAAAAAAAAAAAAAALL;
              v58 = v44;
              v59 = v44;
              v56 = v44;
              v57 = v44;
              v54 = v44;
              v55 = v44;
              *(_OWORD *)buf = v44;
              *(_OWORD *)&buf[16] = v44;
              memset(&v51, 0, sizeof(v51));
              v50 = 0xAAAAAAAAAAAAAAAALL;
              time(&v50);
              localtime_r(&v50, &v51);
              strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v51);
              dprintf(glog_fd, "%s ", buf);
              dprintf(glog_fd, "%s@%d: bail - !allChannels\n", "_processorThread", 288);
            }
            goto LABEL_105;
          }
          if ((mkdirRecursive(v23) & 1) == 0)
          {
            v34 = coreCaptureOsLog;
            if (coreCaptureOsLog)
            {
              if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                *(_QWORD *)&buf[4] = "_processorThread";
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = 295;
                v35 = v34;
LABEL_87:
                _os_log_error_impl(&dword_1DB697000, v35, OS_LOG_TYPE_ERROR, "%s@%d: bail - !mkdirRecursive\n", buf, 0x12u);
              }
            }
            else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              *(_QWORD *)&buf[4] = "_processorThread";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 295;
              v35 = MEMORY[0x1E0C81028];
              goto LABEL_87;
            }
            if (glog_fd)
            {
              *(_QWORD *)&v42 = 0xAAAAAAAAAAAAAAAALL;
              *((_QWORD *)&v42 + 1) = 0xAAAAAAAAAAAAAAAALL;
              v58 = v42;
              v59 = v42;
              v56 = v42;
              v57 = v42;
              v54 = v42;
              v55 = v42;
              *(_OWORD *)buf = v42;
              *(_OWORD *)&buf[16] = v42;
              memset(&v51, 0, sizeof(v51));
              v50 = 0xAAAAAAAAAAAAAAAALL;
              time(&v50);
              localtime_r(&v50, &v51);
              strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v51);
              dprintf(glog_fd, "%s ", buf);
              dprintf(glog_fd, "%s@%d: bail - !mkdirRecursive\n", "_processorThread", 295);
            }
            goto LABEL_105;
          }
          v25 = CFStringCreateMutableCopy(v3, 0, v23);
          v26 = v25;
          if (!v25)
          {
            v40 = coreCaptureOsLog;
            if (coreCaptureOsLog)
            {
              if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                *(_QWORD *)&buf[4] = "_processorThread";
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = 303;
                v41 = v40;
LABEL_102:
                _os_log_error_impl(&dword_1DB697000, v41, OS_LOG_TYPE_ERROR, "%s@%d: bail - !filePath\n", buf, 0x12u);
              }
            }
            else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              *(_QWORD *)&buf[4] = "_processorThread";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 303;
              v41 = MEMORY[0x1E0C81028];
              goto LABEL_102;
            }
            if (glog_fd)
            {
              *(_QWORD *)&v45 = 0xAAAAAAAAAAAAAAAALL;
              *((_QWORD *)&v45 + 1) = 0xAAAAAAAAAAAAAAAALL;
              v58 = v45;
              v59 = v45;
              v56 = v45;
              v57 = v45;
              v54 = v45;
              v55 = v45;
              *(_OWORD *)buf = v45;
              *(_OWORD *)&buf[16] = v45;
              memset(&v51, 0, sizeof(v51));
              v50 = 0xAAAAAAAAAAAAAAAALL;
              time(&v50);
              localtime_r(&v50, &v51);
              strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v51);
              dprintf(glog_fd, "%s ", buf);
              dprintf(glog_fd, "%s@%d: bail - !filePath\n", "_processorThread", 303);
            }
LABEL_105:
            free(keys);
LABEL_62:
            pthread_exit(0);
          }
          CFStringAppendFormat(v25, 0, CFSTR("/IOReporters.%s"), "xml");
          CCIOReportDumpQueue::doSaveChannels(v27, v26, Value);
          CFRelease(v26);
          CFDictionaryRemoveValue(theDict, v23);
          ++v22;
          if (!--Count)
            goto LABEL_50;
        }
        v36 = coreCaptureOsLog;
        if (coreCaptureOsLog)
        {
          if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            *(_QWORD *)&buf[4] = "_processorThread";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 281;
            v37 = v36;
LABEL_92:
            _os_log_error_impl(&dword_1DB697000, v37, OS_LOG_TYPE_ERROR, "%s@%d: bail - !saveDir\n", buf, 0x12u);
          }
        }
        else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "_processorThread";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 281;
          v37 = MEMORY[0x1E0C81028];
          goto LABEL_92;
        }
        if (glog_fd)
        {
          *(_QWORD *)&v43 = 0xAAAAAAAAAAAAAAAALL;
          *((_QWORD *)&v43 + 1) = 0xAAAAAAAAAAAAAAAALL;
          v58 = v43;
          v59 = v43;
          v56 = v43;
          v57 = v43;
          v54 = v43;
          v55 = v43;
          *(_OWORD *)buf = v43;
          *(_OWORD *)&buf[16] = v43;
          memset(&v51, 0, sizeof(v51));
          v50 = 0xAAAAAAAAAAAAAAAALL;
          time(&v50);
          localtime_r(&v50, &v51);
          strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v51);
          dprintf(glog_fd, "%s ", buf);
          dprintf(glog_fd, "%s@%d: bail - !saveDir\n", "_processorThread", 281);
        }
        goto LABEL_105;
      }
LABEL_50:
      free(keys);
      if (Mutable)
        CFRelease(Mutable);
      Mutable = CFSetCreateMutable(0, 0, MEMORY[0x1E0C9B3B0]);
    }
  }
}

void sub_1DB69C6FC(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x1DF0B22E4](v1, 0x1020C404FABDE88);
  _Unwind_Resume(a1);
}

BOOL getOsVersion(char *a1)
{
  int v1;
  uint64_t v2;
  int *v3;
  char *v4;
  NSObject *v5;
  __int128 v6;
  int v7;
  int *v8;
  char *v9;
  int *v11;
  char *v12;
  time_t v13;
  tm v14;
  size_t v15;
  uint8_t buf[16];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  int v24[2];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)v24 = 0x4100000001;
  v15 = 32;
  v1 = sysctl(v24, 2u, a1, &v15, 0, 0);
  if (!v1)
    return v1 == 0;
  v2 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
      goto LABEL_6;
    v3 = __error();
    v4 = strerror(*v3);
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = v4;
    v5 = v2;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_6;
    v11 = __error();
    v12 = strerror(*v11);
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = v12;
    v5 = MEMORY[0x1E0C81028];
  }
  _os_log_error_impl(&dword_1DB697000, v5, OS_LOG_TYPE_ERROR, "getOsVersion %s\n", buf, 0xCu);
LABEL_6:
  if (glog_fd)
  {
    *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v22 = v6;
    v23 = v6;
    v20 = v6;
    v21 = v6;
    v18 = v6;
    v19 = v6;
    *(_OWORD *)buf = v6;
    v17 = v6;
    memset(&v14, 0, sizeof(v14));
    v13 = 0xAAAAAAAAAAAAAAAALL;
    time(&v13);
    localtime_r(&v13, &v14);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v14);
    dprintf(glog_fd, "%s ", (const char *)buf);
    v7 = glog_fd;
    v8 = __error();
    v9 = strerror(*v8);
    dprintf(v7, "getOsVersion %s\n", v9);
  }
  return v1 == 0;
}

uint64_t CCLogPipeInterface::getUserClientID(CCLogPipeInterface *this)
{
  return 1817209168;
}

DIR *pruneDirectoryNDaysDo(const char *a1, int a2, time_t a3, uint64_t a4)
{
  DIR *result;
  DIR *v9;
  timespec v10;
  dirent *v11;
  __int128 v12;
  const char *d_name;
  uint64_t v14;
  int *v15;
  char *v16;
  NSObject *v17;
  __int128 v18;
  int v19;
  int *v20;
  char *v21;
  __CFString *Mutable;
  uint64_t v23;
  NSObject *v24;
  __int128 v25;
  int *v26;
  char *v27;
  int v28;
  const __CFAllocator *alloc;
  int v30;
  time_t v31;
  tm v32;
  _BYTE buf[32];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  char __str[16];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  stat v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  result = opendir(a1);
  if (result)
  {
    v9 = result;
    v10.tv_sec = 0xAAAAAAAAAAAAAAAALL;
    v10.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
    *(timespec *)&v72.st_blksize = v10;
    *(timespec *)v72.st_qspare = v10;
    v72.st_birthtimespec = v10;
    *(timespec *)&v72.st_size = v10;
    v72.st_mtimespec = v10;
    v72.st_ctimespec = v10;
    *(timespec *)&v72.st_uid = v10;
    v72.st_atimespec = v10;
    *(timespec *)&v72.st_dev = v10;
    v30 = a2;
    v28 = a2 + 1;
    alloc = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    while (1)
    {
      while (1)
      {
        while (1)
        {
          while (1)
          {
            v11 = readdir(v9);
            if (!v11)
              return (DIR *)closedir(v9);
            if (v11->d_type == 4)
            {
              *(_QWORD *)&v12 = 0xAAAAAAAAAAAAAAAALL;
              *((_QWORD *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
              v70 = v12;
              v71 = v12;
              v68 = v12;
              v69 = v12;
              v66 = v12;
              v67 = v12;
              v64 = v12;
              v65 = v12;
              v62 = v12;
              v63 = v12;
              v60 = v12;
              v61 = v12;
              v58 = v12;
              v59 = v12;
              v56 = v12;
              v57 = v12;
              v54 = v12;
              v55 = v12;
              v52 = v12;
              v53 = v12;
              v50 = v12;
              v51 = v12;
              v48 = v12;
              v49 = v12;
              v46 = v12;
              v47 = v12;
              v44 = v12;
              v45 = v12;
              v42 = v12;
              v43 = v12;
              d_name = v11->d_name;
              *(_OWORD *)__str = v12;
              v41 = v12;
              if (strcmp(v11->d_name, "."))
              {
                if (strcmp(d_name, ".."))
                  break;
              }
            }
          }
          __str[snprintf(__str, 0x200uLL, "%s/%s", a1, d_name)] = 0;
          if (!lstat(__str, &v72))
            break;
          v14 = coreCaptureOsLog;
          if (coreCaptureOsLog)
          {
            if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
            {
              v15 = __error();
              v16 = strerror(*v15);
              *(_DWORD *)buf = 136315394;
              *(_QWORD *)&buf[4] = __str;
              *(_WORD *)&buf[12] = 2080;
              *(_QWORD *)&buf[14] = v16;
              v17 = v14;
LABEL_28:
              _os_log_error_impl(&dword_1DB697000, v17, OS_LOG_TYPE_ERROR, "pruneDirectoryNDaysDo lstat failed on %s:\n%s\n", buf, 0x16u);
            }
          }
          else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            v26 = __error();
            v27 = strerror(*v26);
            *(_DWORD *)buf = 136315394;
            *(_QWORD *)&buf[4] = __str;
            *(_WORD *)&buf[12] = 2080;
            *(_QWORD *)&buf[14] = v27;
            v17 = MEMORY[0x1E0C81028];
            goto LABEL_28;
          }
          if (glog_fd)
          {
            *(_QWORD *)&v18 = 0xAAAAAAAAAAAAAAAALL;
            *((_QWORD *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
            v38 = v18;
            v39 = v18;
            v36 = v18;
            v37 = v18;
            v34 = v18;
            v35 = v18;
            *(_OWORD *)buf = v18;
            *(_OWORD *)&buf[16] = v18;
            memset(&v32, 0, sizeof(v32));
            v31 = 0xAAAAAAAAAAAAAAAALL;
            time(&v31);
            localtime_r(&v31, &v32);
            strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v32);
            dprintf(glog_fd, "%s ", buf);
            v19 = glog_fd;
            v20 = __error();
            v21 = strerror(*v20);
            dprintf(v19, "pruneDirectoryNDaysDo lstat failed on %s:\n%s\n", __str, v21);
          }
        }
        if (difftime(a3, v72.st_mtimespec.tv_sec) >= (double)(86400 * a4))
          break;
        if (v30 <= 3)
          pruneDirectoryNDaysDo(__str, v28, a3, a4);
      }
      Mutable = CFStringCreateMutable(alloc, 512);
      CFStringAppendCString(Mutable, __str, 0);
      v23 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
          goto LABEL_23;
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = __str;
        v24 = v23;
      }
      else
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          goto LABEL_23;
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = __str;
        v24 = MEMORY[0x1E0C81028];
      }
      _os_log_impl(&dword_1DB697000, v24, OS_LOG_TYPE_DEFAULT, "pruneDirectoryNDaysDo %s\n", buf, 0xCu);
LABEL_23:
      if (glog_fd)
      {
        *(_QWORD *)&v25 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v25 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v38 = v25;
        v39 = v25;
        v36 = v25;
        v37 = v25;
        v34 = v25;
        v35 = v25;
        *(_OWORD *)buf = v25;
        *(_OWORD *)&buf[16] = v25;
        memset(&v32, 0, sizeof(v32));
        v31 = 0xAAAAAAAAAAAAAAAALL;
        time(&v31);
        localtime_r(&v31, &v32);
        strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v32);
        dprintf(glog_fd, "%s ", buf);
        dprintf(glog_fd, "pruneDirectoryNDaysDo %s\n", __str);
      }
      deleteDirectory(Mutable);
      if (Mutable)
        CFRelease(Mutable);
    }
  }
  return result;
}

uint64_t CCServiceMonitor::servicesTerminated(uint64_t this, io_iterator_t iterator)
{
  _BYTE *v2;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  __int128 v7;
  time_t v8;
  tm v9;
  _BYTE buf[32];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v2 = (_BYTE *)this;
  v17 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(this + 12) = 1;
  if (!shutDownPending)
  {
    while (1)
    {
      this = IOIteratorNext(iterator);
      if (!(_DWORD)this)
        break;
      v4 = this;
      v5 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
          goto LABEL_10;
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "servicesTerminated";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 170;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = v4;
        v6 = v5;
      }
      else
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          goto LABEL_10;
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "servicesTerminated";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 170;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = v4;
        v6 = MEMORY[0x1E0C81028];
      }
      _os_log_impl(&dword_1DB697000, v6, OS_LOG_TYPE_DEFAULT, "%s:%d registry entry:%u", buf, 0x18u);
LABEL_10:
      if (glog_fd)
      {
        *(_QWORD *)&v7 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v15 = v7;
        v16 = v7;
        v13 = v7;
        v14 = v7;
        v11 = v7;
        v12 = v7;
        *(_OWORD *)buf = v7;
        *(_OWORD *)&buf[16] = v7;
        memset(&v9, 0, sizeof(v9));
        v8 = 0xAAAAAAAAAAAAAAAALL;
        time(&v8);
        localtime_r(&v8, &v9);
        strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v9);
        dprintf(glog_fd, "%s ", buf);
        dprintf(glog_fd, "%s:%d registry entry:%u", "servicesTerminated", 170, v4);
      }
      (*(void (**)(_BYTE *, uint64_t))(*(_QWORD *)v2 + 64))(v2, v4);
      IOObjectRelease(v4);
    }
  }
  v2[12] = 0;
  return this;
}

void ___ZN16CCProfileMonitor21setStreamEventHandlerEv_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  NSObject *v4;
  __int128 v5;
  xpc_object_t value;
  void *v8;
  const char *string_ptr;
  uint64_t v10;
  NSObject *v11;
  __int128 v12;
  time_t v13;
  tm v14;
  uint8_t buf[16];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v4 = v3;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v4 = MEMORY[0x1E0C81028];
  }
  _os_log_impl(&dword_1DB697000, v4, OS_LOG_TYPE_DEFAULT, "CCProfileMonitor::setStreamEventHandler Woken up by notifyd.\n", buf, 2u);
LABEL_7:
  if (glog_fd)
  {
    *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v21 = v5;
    v22 = v5;
    v19 = v5;
    v20 = v5;
    v17 = v5;
    v18 = v5;
    *(_OWORD *)buf = v5;
    v16 = v5;
    memset(&v14, 0, sizeof(v14));
    v13 = 0xAAAAAAAAAAAAAAAALL;
    time(&v13);
    localtime_r(&v13, &v14);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v14);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCProfileMonitor::setStreamEventHandler Woken up by notifyd.\n");
  }
  if (MEMORY[0x1DF0B289C](a2) == MEMORY[0x1E0C812F8] && MEMORY[0x1E0C81310] != MEMORY[0x1E0C812F8])
  {
    value = xpc_dictionary_get_value(a2, (const char *)*MEMORY[0x1E0C81298]);
    if (value)
    {
      v8 = value;
      if (MEMORY[0x1DF0B289C]() == MEMORY[0x1E0C81390])
      {
        string_ptr = xpc_string_get_string_ptr(v8);
        if (string_ptr)
        {
          if (!strcmp(string_ptr, "com.apple.ManagedConfiguration.profileListChanged"))
          {
            v10 = coreCaptureOsLog;
            if (coreCaptureOsLog)
            {
              if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
                goto LABEL_24;
              *(_DWORD *)buf = 136315138;
              *(_QWORD *)&buf[4] = "com.apple.ManagedConfiguration.profileListChanged";
              v11 = v10;
            }
            else
            {
              if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
                goto LABEL_24;
              *(_DWORD *)buf = 136315138;
              *(_QWORD *)&buf[4] = "com.apple.ManagedConfiguration.profileListChanged";
              v11 = MEMORY[0x1E0C81028];
            }
            _os_log_impl(&dword_1DB697000, v11, OS_LOG_TYPE_DEFAULT, "CCProfileMonitor::setStreamEventHandler event received:%s\n", buf, 0xCu);
LABEL_24:
            if (glog_fd)
            {
              *(_QWORD *)&v12 = 0xAAAAAAAAAAAAAAAALL;
              *((_QWORD *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
              v21 = v12;
              v22 = v12;
              v19 = v12;
              v20 = v12;
              v17 = v12;
              v18 = v12;
              *(_OWORD *)buf = v12;
              v16 = v12;
              memset(&v14, 0, sizeof(v14));
              v13 = 0xAAAAAAAAAAAAAAAALL;
              time(&v13);
              localtime_r(&v13, &v14);
              strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v14);
              dprintf(glog_fd, "%s ", (const char *)buf);
              dprintf(glog_fd, "CCProfileMonitor::setStreamEventHandler event received:%s\n", "com.apple.ManagedConfiguration.profileListChanged");
            }
          }
        }
      }
    }
  }
}

BOOL CCFile::initWithRegistryEntry(CCFile *this, CCFormatter *object)
{
  const __CFAllocator *v4;
  const __CFNumber *CFProperty;
  void *v6;
  void *v7;
  __CFString *MutableCopy;
  CFIndex Length;
  char *v10;
  const __CFString *v11;
  CFIndex v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  __int128 v17;
  __int128 v18;
  time_t v20;
  tm v21;
  int valuePtr;
  uint8_t buf[16];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  *((_DWORD *)this + 3) = 0;
  *((_DWORD *)this + 8) = 0;
  IOObjectRetain((io_object_t)object);
  *((_DWORD *)this + 16) = (_DWORD)object;
  *((_DWORD *)this + 9) = -1;
  v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  *((_QWORD *)this + 9) = IORegistryEntryCreateCFProperty((io_registry_entry_t)object, CFSTR("Owner"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  *((_QWORD *)this + 10) = IORegistryEntryCreateCFProperty((io_registry_entry_t)object, CFSTR("Name"), v4, 0);
  *((_QWORD *)this + 11) = IORegistryEntryCreateCFProperty((io_registry_entry_t)object, CFSTR("Filename"), v4, 0);
  *((_QWORD *)this + 12) = IORegistryEntryCreateCFProperty((io_registry_entry_t)object, CFSTR("DirectoryName"), v4, 0);
  CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty((io_registry_entry_t)object, CFSTR("LogDataType"), v4, 0);
  *((_QWORD *)this + 13) = CFProperty;
  valuePtr = -1431655766;
  CFNumberGetValue(CFProperty, kCFNumberSInt32Type, &valuePtr);
  v6 = CCFormatter::withRegistryEntry(object);
  v7 = v6;
  *((_QWORD *)this + 2) = v6;
  if (v6)
  {
    (*(void (**)(void *, CCFile *, uint64_t (*)(uint64_t)))(*(_QWORD *)v6 + 96))(v6, this, CCFile::_doWrite);
    MutableCopy = CFStringCreateMutableCopy(v4, 512, CFSTR("/var/log/CoreCapture"));
    *((_QWORD *)this + 6) = MutableCopy;
    CFStringAppendCString(MutableCopy, "/", 0);
    CFStringAppend(*((CFMutableStringRef *)this + 6), *((CFStringRef *)this + 9));
    CFStringAppendCString(*((CFMutableStringRef *)this + 6), "/", 0);
    CFStringAppend(*((CFMutableStringRef *)this + 6), *((CFStringRef *)this + 10));
    CFStringAppendCString(*((CFMutableStringRef *)this + 6), "/", 0);
    if ((mkdirRecursive(*((const __CFString **)this + 6)) & 1) != 0)
    {
LABEL_17:
      *((_QWORD *)this + 7) = 0;
      return v7 != 0;
    }
    Length = CFStringGetLength(*((CFStringRef *)this + 6));
    v10 = (char *)malloc_type_malloc(Length + 1, 0x91A35A86uLL);
    v11 = (const __CFString *)*((_QWORD *)this + 6);
    v12 = CFStringGetLength(v11);
    CFStringGetCString(v11, v10, v12 + 1, 0);
    v13 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = v10;
        v14 = v13;
LABEL_22:
        _os_log_error_impl(&dword_1DB697000, v14, OS_LOG_TYPE_ERROR, "CCFile::initWithTap Failed to create  %s\n", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = v10;
      v14 = MEMORY[0x1E0C81028];
      goto LABEL_22;
    }
    if (glog_fd)
    {
      *(_QWORD *)&v18 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v29 = v18;
      v30 = v18;
      v27 = v18;
      v28 = v18;
      v25 = v18;
      v26 = v18;
      *(_OWORD *)buf = v18;
      v24 = v18;
      memset(&v21, 0, sizeof(v21));
      v20 = 0xAAAAAAAAAAAAAAAALL;
      time(&v20);
      localtime_r(&v20, &v21);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v21);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "CCFile::initWithTap Failed to create  %s\n", v10);
    }
    if (v10)
      free(v10);
    goto LABEL_17;
  }
  v15 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
      goto LABEL_10;
    *(_WORD *)buf = 0;
    v16 = v15;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_10;
    *(_WORD *)buf = 0;
    v16 = MEMORY[0x1E0C81028];
  }
  _os_log_error_impl(&dword_1DB697000, v16, OS_LOG_TYPE_ERROR, "CCFile::initWithTap Failed to create formatter\n", buf, 2u);
LABEL_10:
  if (glog_fd)
  {
    *(_QWORD *)&v17 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v17 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v29 = v17;
    v30 = v17;
    v27 = v17;
    v28 = v17;
    v25 = v17;
    v26 = v17;
    *(_OWORD *)buf = v17;
    v24 = v17;
    memset(&v21, 0, sizeof(v21));
    v20 = 0xAAAAAAAAAAAAAAAALL;
    time(&v20);
    localtime_r(&v20, &v21);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v21);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCFile::initWithTap Failed to create formatter\n");
  }
  return v7 != 0;
}

uint64_t CCLogTap::ccfree(CCLogTap *this)
{
  *((_BYTE *)this + 56) = 1;
  CCTap::freeResources(this);
  return (*(uint64_t (**)(CCLogTap *))(*(_QWORD *)this + 8))(this);
}

void ___ZN12CCXPCService15startXPCServiceEv_block_invoke(uint64_t a1, void *a2)
{
  CCXPCService::handleConnectionEvent(*(dispatch_queue_t **)(a1 + 32), a2);
}

void CCIOReporterFormatter::~CCIOReporterFormatter(void *this)
{
  if (this)
    free(this);
}

void CCPipeMonitor::servicePublished(CCPipeMonitor *this, CCTap *entry)
{
  const __CFAllocator *v4;
  const __CFString *CFProperty;
  const __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  __int128 v9;
  int v10;
  const char *CStringPtr;
  const char *v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  time_t v16;
  tm v17;
  _BYTE buf[32];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty((io_registry_entry_t)entry, CFSTR("Owner"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  v6 = (const __CFString *)IORegistryEntryCreateCFProperty((io_registry_entry_t)entry, CFSTR("Name"), v4, 0);
  v7 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "servicePublished";
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = CFStringGetCStringPtr(CFProperty, 0);
    *(_WORD *)&buf[22] = 2080;
    *(_QWORD *)&buf[24] = CFStringGetCStringPtr(v6, 0);
    LOWORD(v19) = 1024;
    *(_DWORD *)((char *)&v19 + 2) = (_DWORD)entry;
    v8 = v7;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "servicePublished";
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = CFStringGetCStringPtr(CFProperty, 0);
    *(_WORD *)&buf[22] = 2080;
    *(_QWORD *)&buf[24] = CFStringGetCStringPtr(v6, 0);
    LOWORD(v19) = 1024;
    *(_DWORD *)((char *)&v19 + 2) = (_DWORD)entry;
    v8 = MEMORY[0x1E0C81028];
  }
  _os_log_impl(&dword_1DB697000, v8, OS_LOG_TYPE_DEFAULT, "%s Owner:%s Name:%s entry:%u\n", buf, 0x26u);
LABEL_7:
  if (glog_fd)
  {
    *(_QWORD *)&v9 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v23 = v9;
    v24 = v9;
    v21 = v9;
    v22 = v9;
    v19 = v9;
    v20 = v9;
    *(_OWORD *)buf = v9;
    *(_OWORD *)&buf[16] = v9;
    memset(&v17, 0, sizeof(v17));
    v16 = 0xAAAAAAAAAAAAAAAALL;
    time(&v16);
    localtime_r(&v16, &v17);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v17);
    dprintf(glog_fd, "%s ", buf);
    v10 = glog_fd;
    CStringPtr = CFStringGetCStringPtr(CFProperty, 0);
    v12 = CFStringGetCStringPtr(v6, 0);
    dprintf(v10, "%s Owner:%s Name:%s entry:%u\n", "servicePublished", CStringPtr, v12, (_DWORD)entry);
  }
  v13 = CCTap::withRegistryEntry(entry);
  if (v13)
  {
    v14 = v13;
    v15 = *((_QWORD *)this + 8);
    v14[10] = v15;
    if (v15)
      (*(void (**)(uint64_t))(*(_QWORD *)v15 + 40))(v15);
    pthread_mutex_lock((pthread_mutex_t *)((char *)this + 144));
    CFDictionaryAddValue(*((CFMutableDictionaryRef *)this + 7), (const void *)entry, v14);
    pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 144));
    if (*((_QWORD *)this + 9) && CCProfileMonitor::fProfileLoaded)
    {
      (*(void (**)(_QWORD *))(*v14 + 72))(v14);
      CCProfileMonitor::applyProfile(*((_QWORD *)this + 9), CFProperty, v6);
    }
  }
  if (CFProperty)
    CFRelease(CFProperty);
  if (v6)
    CFRelease(v6);
}

const char *CCTextFormatter::getFormatterFileExtension(CCTextFormatter *this)
{
  return "txt";
}

uint64_t mkdirRecursive(const __CFString *a1)
{
  CFIndex Length;
  char *v3;
  char *v4;
  CFIndex v5;
  char *v6;
  char *v7;
  timespec v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  __int128 v15;
  __int128 v16;
  time_t v18;
  tm v19;
  _BYTE buf[32];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  stat v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  Length = CFStringGetLength(a1);
  v3 = (char *)malloc_type_malloc(Length + 1, 0x16A3DA63uLL);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = CFStringGetLength(a1);
  CFStringGetCString(a1, v4, v5 + 1, 0);
  v6 = strdup(v4);
  v7 = v6;
  v8.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v8.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v27.st_blksize = v8;
  *(timespec *)v27.st_qspare = v8;
  v27.st_birthtimespec = v8;
  *(timespec *)&v27.st_size = v8;
  v27.st_mtimespec = v8;
  v27.st_ctimespec = v8;
  *(timespec *)&v27.st_uid = v8;
  v27.st_atimespec = v8;
  *(timespec *)&v27.st_dev = v8;
  if (*v6 == 47)
    v9 = v6 + 1;
  else
    v9 = v6;
  while (*v9 != 47)
  {
    if (!*v9)
    {
      v10 = 1;
      goto LABEL_30;
    }
LABEL_15:
    ++v9;
  }
  *v9 = 0;
  if (stat(v7, &v27))
  {
    if (mkdir(v7, 0x1EDu) && (stat(v7, &v27) || (v27.st_mode & 0xF000) != 0x4000))
    {
      v11 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)&buf[4] = v7;
          v12 = v11;
          goto LABEL_33;
        }
      }
      else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = v7;
        v12 = MEMORY[0x1E0C81028];
LABEL_33:
        _os_log_error_impl(&dword_1DB697000, v12, OS_LOG_TYPE_ERROR, "CCFile::mkdirRecursive Unable to mkdir on '%s'\n", buf, 0xCu);
      }
      if (glog_fd)
      {
        *(_QWORD *)&v15 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v15 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v25 = v15;
        v26 = v15;
        v23 = v15;
        v24 = v15;
        v21 = v15;
        v22 = v15;
        *(_OWORD *)buf = v15;
        *(_OWORD *)&buf[16] = v15;
        memset(&v19, 0, sizeof(v19));
        v18 = 0xAAAAAAAAAAAAAAAALL;
        time(&v18);
        localtime_r(&v18, &v19);
        strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v19);
        dprintf(glog_fd, "%s ", buf);
        dprintf(glog_fd, "CCFile::mkdirRecursive Unable to mkdir on '%s'\n");
      }
      goto LABEL_29;
    }
    goto LABEL_14;
  }
  if ((v27.st_mode & 0xF000) == 0x4000)
  {
LABEL_14:
    *v9 = 47;
    goto LABEL_15;
  }
  v13 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = v4;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = v7;
      v14 = v13;
      goto LABEL_35;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = v4;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = v7;
    v14 = MEMORY[0x1E0C81028];
LABEL_35:
    _os_log_error_impl(&dword_1DB697000, v14, OS_LOG_TYPE_ERROR, "CCFile::mkdirRecursive Unable to create path '%s' as '%s' is not a directory\n", buf, 0x16u);
  }
  if (glog_fd)
  {
    *(_QWORD *)&v16 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v25 = v16;
    v26 = v16;
    v23 = v16;
    v24 = v16;
    v21 = v16;
    v22 = v16;
    *(_OWORD *)buf = v16;
    *(_OWORD *)&buf[16] = v16;
    memset(&v19, 0, sizeof(v19));
    v18 = 0xAAAAAAAAAAAAAAAALL;
    time(&v18);
    localtime_r(&v18, &v19);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v19);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "CCFile::mkdirRecursive Unable to create path '%s' as '%s' is not a directory\n");
  }
LABEL_29:
  v10 = 0;
  *v9 = 47;
LABEL_30:
  free(v7);
  free(v4);
  return v10;
}

uint64_t CCTap::initWithRegistryEntry(CCTap *this, io_object_t object)
{
  const __CFAllocator *v4;
  const __CFString *v5;
  const __CFString *v6;
  char v8[16];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  char buffer[16];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  *((_DWORD *)this + 5) = 0;
  IOObjectRetain(object);
  *((_DWORD *)this + 4) = object;
  v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  *((_QWORD *)this + 5) = IORegistryEntryCreateCFProperty(object, CFSTR("Owner"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  *((_QWORD *)this + 6) = IORegistryEntryCreateCFProperty(object, CFSTR("Name"), v4, 0);
  *((_QWORD *)this + 11) = IORegistryEntryCreateCFProperty(object, CFSTR("DirectoryName"), v4, 0);
  *((_QWORD *)this + 13) = 0;
  *((_QWORD *)this + 14) = 0;
  v14 = 0u;
  v15 = 0u;
  *(_OWORD *)buffer = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  *(_OWORD *)v8 = 0u;
  v9 = 0u;
  v5 = (const __CFString *)*((_QWORD *)this + 6);
  if (v5
    && CFStringGetCString(v5, buffer, 64, 0)
    && (v6 = (const __CFString *)*((_QWORD *)this + 5)) != 0
    && CFStringGetCString(v6, v8, 64, 0))
  {
    snprintf((char *)this + 120, 0x40uLL, "%s:%s", v8, buffer);
  }
  else
  {
    strcpy((char *)this + 120, "com.apple.corecaptured.CCTap");
  }
  pthread_setname_np((const char *)this + 120);
  (*(void (**)(CCTap *))(*(_QWORD *)this + 136))(this);
  *((_DWORD *)this + 5) = 1;
  *((_BYTE *)this + 56) = 0;
  *((_WORD *)this + 48) = 0;
  return 1;
}

void deleteDirectory(__CFString *a1)
{
  CFTypeID TypeID;
  CFIndex Length;
  char *v4;
  char *v5;
  CFIndex v6;
  DIR *v7;
  DIR *v8;
  const __CFAllocator *v9;
  dirent *v10;
  dirent *v11;
  const char *d_name;
  CFMutableStringRef MutableCopy;
  CFIndex v14;
  char *v15;
  char *v16;
  CFIndex v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  int *v27;
  char *v28;
  NSObject *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  int v35;
  int *v36;
  int *v37;
  char *v38;
  time_t v39;
  tm v40;
  _BYTE buf[32];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    TypeID = CFStringGetTypeID();
    if (TypeID == CFGetTypeID(a1))
    {
      Length = CFStringGetLength(a1);
      v4 = (char *)malloc_type_malloc(Length + 1, 0x5962114EuLL);
      if (v4)
      {
        v5 = v4;
        v6 = CFStringGetLength(a1);
        if (CFStringGetCString(a1, v5, v6 + 1, 0))
        {
          v7 = opendir(v5);
          if (v7)
          {
            v8 = v7;
            v9 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
            while (1)
            {
              v10 = readdir(v8);
              if (!v10)
                break;
              v11 = v10;
              d_name = v10->d_name;
              if (strcmp(v10->d_name, ".") && strcmp(d_name, ".."))
              {
                MutableCopy = CFStringCreateMutableCopy(v9, 512, a1);
                CFStringAppendCString(MutableCopy, "/", 0);
                CFStringAppendCString(MutableCopy, d_name, 0);
                if (v11->d_type == 4)
                {
                  deleteDirectory(MutableCopy);
                }
                else
                {
                  v14 = CFStringGetLength(MutableCopy);
                  v15 = (char *)malloc_type_malloc(v14 + 1, 0x1FEDAD68uLL);
                  if (v15)
                  {
                    v16 = v15;
                    v17 = CFStringGetLength(MutableCopy);
                    if (CFStringGetCString(MutableCopy, v16, v17 + 1, 0) == 1)
                      unlink(v16);
                    free(v16);
                  }
                }
                if (MutableCopy)
                  CFRelease(MutableCopy);
              }
            }
            closedir(v8);
            rmdir(v5);
LABEL_19:
            free(v5);
            return;
          }
          v26 = coreCaptureOsLog;
          if (coreCaptureOsLog)
          {
            if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
              goto LABEL_50;
            v27 = __error();
            v28 = strerror(*v27);
            *(_DWORD *)buf = 136315650;
            *(_QWORD *)&buf[4] = "deleteDirectory";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 187;
            *(_WORD *)&buf[18] = 2080;
            *(_QWORD *)&buf[20] = v28;
            v29 = v26;
          }
          else
          {
            if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              goto LABEL_50;
            v37 = __error();
            v38 = strerror(*v37);
            *(_DWORD *)buf = 136315650;
            *(_QWORD *)&buf[4] = "deleteDirectory";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 187;
            *(_WORD *)&buf[18] = 2080;
            *(_QWORD *)&buf[20] = v38;
            v29 = MEMORY[0x1E0C81028];
          }
          _os_log_error_impl(&dword_1DB697000, v29, OS_LOG_TYPE_ERROR, "%s:%06u: opendir failure - %s\n", buf, 0x1Cu);
LABEL_50:
          if (glog_fd)
          {
            *(_QWORD *)&v34 = 0xAAAAAAAAAAAAAAAALL;
            *((_QWORD *)&v34 + 1) = 0xAAAAAAAAAAAAAAAALL;
            v46 = v34;
            v47 = v34;
            v44 = v34;
            v45 = v34;
            v42 = v34;
            v43 = v34;
            *(_OWORD *)buf = v34;
            *(_OWORD *)&buf[16] = v34;
            memset(&v40, 0, sizeof(v40));
            v39 = 0xAAAAAAAAAAAAAAAALL;
            time(&v39);
            localtime_r(&v39, &v40);
            strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v40);
            dprintf(glog_fd, "%s ", buf);
            v35 = glog_fd;
            v36 = __error();
            strerror(*v36);
            dprintf(v35, "%s:%06u: opendir failure - %s\n");
          }
          goto LABEL_19;
        }
        v24 = coreCaptureOsLog;
        if (coreCaptureOsLog)
        {
          if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
            goto LABEL_47;
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "deleteDirectory";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 183;
          v25 = v24;
        }
        else
        {
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            goto LABEL_47;
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "deleteDirectory";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 183;
          v25 = MEMORY[0x1E0C81028];
        }
        _os_log_error_impl(&dword_1DB697000, v25, OS_LOG_TYPE_ERROR, "%s:%06u: CFStringGetCString failure\n", buf, 0x12u);
LABEL_47:
        if (glog_fd)
        {
          *(_QWORD *)&v33 = 0xAAAAAAAAAAAAAAAALL;
          *((_QWORD *)&v33 + 1) = 0xAAAAAAAAAAAAAAAALL;
          v46 = v33;
          v47 = v33;
          v44 = v33;
          v45 = v33;
          v42 = v33;
          v43 = v33;
          *(_OWORD *)buf = v33;
          *(_OWORD *)&buf[16] = v33;
          memset(&v40, 0, sizeof(v40));
          v39 = 0xAAAAAAAAAAAAAAAALL;
          time(&v39);
          localtime_r(&v39, &v40);
          strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v40);
          dprintf(glog_fd, "%s ", buf);
          dprintf(glog_fd, "%s:%06u: CFStringGetCString failure\n");
        }
        goto LABEL_19;
      }
      v22 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
          goto LABEL_43;
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "deleteDirectory";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 180;
        v23 = v22;
      }
      else
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_43;
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "deleteDirectory";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 180;
        v23 = MEMORY[0x1E0C81028];
      }
      _os_log_error_impl(&dword_1DB697000, v23, OS_LOG_TYPE_ERROR, "%s:%06u: Allocation failure\n", buf, 0x12u);
LABEL_43:
      if (glog_fd)
      {
        *(_QWORD *)&v32 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v32 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v46 = v32;
        v47 = v32;
        v44 = v32;
        v45 = v32;
        v42 = v32;
        v43 = v32;
        *(_OWORD *)buf = v32;
        *(_OWORD *)&buf[16] = v32;
        memset(&v40, 0, sizeof(v40));
        v39 = 0xAAAAAAAAAAAAAAAALL;
        time(&v39);
        localtime_r(&v39, &v40);
        strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v40);
        dprintf(glog_fd, "%s ", buf);
        dprintf(glog_fd, "%s:%06u: Allocation failure\n");
      }
      return;
    }
    v20 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_40;
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "deleteDirectory";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 177;
      v21 = v20;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_40;
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "deleteDirectory";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 177;
      v21 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v21, OS_LOG_TYPE_ERROR, "%s:%06u: Invalid type\n", buf, 0x12u);
LABEL_40:
    if (glog_fd)
    {
      *(_QWORD *)&v31 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v31 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v46 = v31;
      v47 = v31;
      v44 = v31;
      v45 = v31;
      v42 = v31;
      v43 = v31;
      *(_OWORD *)buf = v31;
      *(_OWORD *)&buf[16] = v31;
      memset(&v40, 0, sizeof(v40));
      v39 = 0xAAAAAAAAAAAAAAAALL;
      time(&v39);
      localtime_r(&v39, &v40);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v40);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "%s:%06u: Invalid type\n");
    }
    return;
  }
  v18 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
      goto LABEL_37;
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "deleteDirectory";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 176;
    v19 = v18;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_37;
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "deleteDirectory";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 176;
    v19 = MEMORY[0x1E0C81028];
  }
  _os_log_error_impl(&dword_1DB697000, v19, OS_LOG_TYPE_ERROR, "%s:%06u: Invalid argument\n", buf, 0x12u);
LABEL_37:
  if (glog_fd)
  {
    *(_QWORD *)&v30 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v30 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v46 = v30;
    v47 = v30;
    v44 = v30;
    v45 = v30;
    v42 = v30;
    v43 = v30;
    *(_OWORD *)buf = v30;
    *(_OWORD *)&buf[16] = v30;
    memset(&v40, 0, sizeof(v40));
    v39 = 0xAAAAAAAAAAAAAAAALL;
    time(&v39);
    localtime_r(&v39, &v40);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v40);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "%s:%06u: Invalid argument\n");
  }
}

BOOL CCLogTap::initWithRegistryEntry(CFAbsoluteTime *this, CCPipeInterface *a2)
{
  CCTap *v4;
  CCPipeInterface *v5;
  void *v6;
  const __CFNumber *CFProperty;
  const __CFNumber *v8;
  int Value;
  _BOOL8 v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  __int128 v15;
  uint64_t v16;
  NSObject *v17;
  __int128 v18;
  __int128 v19;
  time_t v21;
  tm v22;
  uint8_t buf[16];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  this[44] = CFAbsoluteTimeGetCurrent();
  *((_DWORD *)this + 18) = 1;
  *((_BYTE *)this + 344) = 0;
  v5 = CCPipeInterface::withRegistryEntry(a2, (CCTap *)this, v4);
  if (!v5)
  {
    this[8] = 0.0;
LABEL_9:
    v13 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_13;
      *(_WORD *)buf = 0;
      v14 = v13;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_13;
      *(_WORD *)buf = 0;
      v14 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v14, OS_LOG_TYPE_ERROR, "(CCLogTap) CCPipeInterface::withRegistryEntry failed\n", buf, 2u);
LABEL_13:
    if (glog_fd)
    {
      *(_QWORD *)&v15 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v15 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v29 = v15;
      v30 = v15;
      v27 = v15;
      v28 = v15;
      v25 = v15;
      v26 = v15;
      *(_OWORD *)buf = v15;
      v24 = v15;
      memset(&v22, 0, sizeof(v22));
      v21 = 0xAAAAAAAAAAAAAAAALL;
      time(&v21);
      localtime_r(&v21, &v22);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v22);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "(CCLogTap) CCPipeInterface::withRegistryEntry failed\n");
    }
    return 0;
  }
  *((_QWORD *)this + 8) = v6;
  if (!v6)
    goto LABEL_9;
  CCTap::initWithRegistryEntry((CCTap *)this, (io_object_t)a2);
  CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty((io_registry_entry_t)a2, CFSTR("LogDataType"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  if (CFProperty)
  {
    v8 = CFProperty;
    Value = CFNumberGetValue(CFProperty, kCFNumberSInt32Type, this + 26);
    v10 = Value != 0;
    if (Value)
    {
LABEL_25:
      CFRelease(v8);
      return v10;
    }
    v11 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_23;
      *(_WORD *)buf = 0;
      v12 = v11;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_23;
      *(_WORD *)buf = 0;
      v12 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v12, OS_LOG_TYPE_ERROR, "(CCLogTap) CFNumberGetValue failed\n", buf, 2u);
LABEL_23:
    if (glog_fd)
    {
      *(_QWORD *)&v19 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v29 = v19;
      v30 = v19;
      v27 = v19;
      v28 = v19;
      v25 = v19;
      v26 = v19;
      *(_OWORD *)buf = v19;
      v24 = v19;
      memset(&v22, 0, sizeof(v22));
      v21 = 0xAAAAAAAAAAAAAAAALL;
      time(&v21);
      localtime_r(&v21, &v22);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v22);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "(CCLogTap) CFNumberGetValue failed\n");
    }
    goto LABEL_25;
  }
  v16 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
      goto LABEL_20;
    *(_WORD *)buf = 0;
    v17 = v16;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_20;
    *(_WORD *)buf = 0;
    v17 = MEMORY[0x1E0C81028];
  }
  _os_log_error_impl(&dword_1DB697000, v17, OS_LOG_TYPE_ERROR, "(CCLogTap) IORegistryEntryCreateCFProperty failed\n", buf, 2u);
LABEL_20:
  if (glog_fd)
  {
    *(_QWORD *)&v18 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v29 = v18;
    v30 = v18;
    v27 = v18;
    v28 = v18;
    v25 = v18;
    v26 = v18;
    *(_OWORD *)buf = v18;
    v24 = v18;
    memset(&v22, 0, sizeof(v22));
    v21 = 0xAAAAAAAAAAAAAAAALL;
    time(&v21);
    localtime_r(&v21, &v22);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v22);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "(CCLogTap) IORegistryEntryCreateCFProperty failed\n");
  }
  return 0;
}

CCLogFile *CCFile::withRegistryEntry(CCFile *this)
{
  uint64_t v2;
  NSObject *v3;
  __int128 v4;
  const __CFNumber *CFProperty;
  unsigned int v6;
  uint64_t v8;
  NSObject *v9;
  __int128 v10;
  unsigned int valuePtr;
  time_t v12;
  tm v13;
  uint8_t buf[16];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = (_DWORD)this;
    v3 = v2;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = (_DWORD)this;
    v3 = MEMORY[0x1E0C81028];
  }
  _os_log_impl(&dword_1DB697000, v3, OS_LOG_TYPE_DEFAULT, "CCFile::withRegistryEntry() entered entry:%u\n", buf, 8u);
LABEL_7:
  if (glog_fd)
  {
    *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v20 = v4;
    v21 = v4;
    v18 = v4;
    v19 = v4;
    v16 = v4;
    v17 = v4;
    *(_OWORD *)buf = v4;
    v15 = v4;
    memset(&v13, 0, sizeof(v13));
    v12 = 0xAAAAAAAAAAAAAAAALL;
    time(&v12);
    localtime_r(&v12, &v13);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v13);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCFile::withRegistryEntry() entered entry:%u\n", (_DWORD)this);
  }
  CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty((io_registry_entry_t)this, CFSTR("LogType"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  valuePtr = -1431655766;
  CFNumberGetValue(CFProperty, kCFNumberSInt32Type, &valuePtr);
  if (CFProperty)
    CFRelease(CFProperty);
  v6 = valuePtr;
  if (valuePtr < 2)
    return CCLogFile::withRegistryEntry(this);
  if (valuePtr == 2)
    return CCDataFile::withRegistryEntry(this);
  v8 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v6;
      v9 = v8;
LABEL_23:
      _os_log_error_impl(&dword_1DB697000, v9, OS_LOG_TYPE_ERROR, "CCFile::withTap Unsupported file type(%d) \n", buf, 8u);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v6;
    v9 = MEMORY[0x1E0C81028];
    goto LABEL_23;
  }
  if (glog_fd)
  {
    *(_QWORD *)&v10 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v20 = v10;
    v21 = v10;
    v18 = v10;
    v19 = v10;
    v16 = v10;
    v17 = v10;
    *(_OWORD *)buf = v10;
    v15 = v10;
    memset(&v13, 0, sizeof(v13));
    v12 = 0xAAAAAAAAAAAAAAAALL;
    time(&v12);
    localtime_r(&v12, &v13);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v13);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCFile::withTap Unsupported file type(%d) \n", valuePtr);
  }
  return 0;
}

uint64_t CCXPCService::initWithConfigureAndPipeMonitor(CCXPCService *this, CCConfigure *a2, CCPipeMonitor *a3)
{
  int v5;
  int v6;
  uint64_t v7;
  NSObject *v8;
  __int128 v9;
  time_t v11;
  tm v12;
  uint8_t buf[16];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  *((_QWORD *)this + 2) = a2;
  (*(void (**)(CCConfigure *))(*(_QWORD *)a2 + 40))(a2);
  *((_QWORD *)this + 3) = a3;
  (*(void (**)(CCPipeMonitor *))(*(_QWORD *)a3 + 40))(a3);
  *((_QWORD *)this + 4) = 0;
  *((_QWORD *)this + 5) = 0;
  *((_BYTE *)this + 48) = 0;
  v5 = pthread_mutex_init((pthread_mutex_t *)((char *)this + 56), 0);
  if (!v5)
  {
    CCXPCService::startXPCService(this);
    return 1;
  }
  v6 = v5;
  v7 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v6;
    v8 = v7;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v6;
    v8 = MEMORY[0x1E0C81028];
  }
  _os_log_error_impl(&dword_1DB697000, v8, OS_LOG_TYPE_ERROR, "CCXPCService::initWithConfigureAndPipeMonitor ERROR INIT MUTEX: %d\n", buf, 8u);
LABEL_7:
  if (glog_fd)
  {
    *(_QWORD *)&v9 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v19 = v9;
    v20 = v9;
    v17 = v9;
    v18 = v9;
    v15 = v9;
    v16 = v9;
    *(_OWORD *)buf = v9;
    v14 = v9;
    memset(&v12, 0, sizeof(v12));
    v11 = 0xAAAAAAAAAAAAAAAALL;
    time(&v11);
    localtime_r(&v11, &v12);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v12);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCXPCService::initWithConfigureAndPipeMonitor ERROR INIT MUTEX: %d\n", v6);
  }
  return 1;
}

uint64_t CCFormatter::registerWriteCallback(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(result + 16) = a3;
  *(_QWORD *)(result + 24) = a2;
  return result;
}

BOOL CCProfileMonitor::initWithConfigure(CCProfileMonitor *this, CCConfigure *a2)
{
  int v4;
  int v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL8 v8;
  dispatch_time_t v9;
  __int128 v10;
  _QWORD block[5];
  time_t v13;
  tm v14;
  uint8_t buf[16];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = pthread_mutex_init((pthread_mutex_t *)((char *)this + 16), 0);
  if (v4)
  {
    v5 = v4;
    v6 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v5;
        v7 = v6;
LABEL_14:
        _os_log_error_impl(&dword_1DB697000, v7, OS_LOG_TYPE_ERROR, "CCProfileMonitor::initWithConfigure ERROR INIT MUTEX: %d\n", buf, 8u);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v5;
      v7 = MEMORY[0x1E0C81028];
      goto LABEL_14;
    }
    if (glog_fd)
    {
      *(_QWORD *)&v10 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v21 = v10;
      v22 = v10;
      v19 = v10;
      v20 = v10;
      v17 = v10;
      v18 = v10;
      *(_OWORD *)buf = v10;
      v16 = v10;
      memset(&v14, 0, sizeof(v14));
      v13 = 0xAAAAAAAAAAAAAAAALL;
      time(&v13);
      localtime_r(&v13, &v14);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v14);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "CCProfileMonitor::initWithConfigure ERROR INIT MUTEX: %d\n", v5);
    }
    return 0;
  }
  *((_QWORD *)this + 11) = a2;
  (*(void (**)(CCConfigure *))(*(_QWORD *)a2 + 40))(a2);
  CCProfileMonitor::setStreamEventHandler(this);
  v8 = CCProfileMonitor::initializeProfilePort(this);
  if (!v8)
    CCProfileMonitor::freeResources(this);
  v9 = dispatch_time(0, 10000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 0x40000000;
  block[2] = ___ZN16CCProfileMonitor17initWithConfigureEP11CCConfigure_block_invoke;
  block[3] = &__block_descriptor_tmp_1136;
  block[4] = this;
  dispatch_after(v9, MEMORY[0x1E0C80D38], block);
  return v8;
}

uint64_t CCFile::_doWrite(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 184))(a1);
}

void CCLogFile::deleteFile(CCLogFile *this, __CFString *a2)
{
  uint64_t v3;
  NSObject *v4;
  __int128 v5;
  int v6;
  const char *CStringPtr;
  CFIndex Length;
  char *v9;
  CFIndex v10;
  time_t v11;
  tm v12;
  uint8_t buf[16];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!a2)
    return;
  v3 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = CFStringGetCStringPtr(a2, 0);
      v4 = v3;
LABEL_7:
      _os_log_impl(&dword_1DB697000, v4, OS_LOG_TYPE_DEFAULT, "CCLogFile::deleteFile name: %s \n", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = CFStringGetCStringPtr(a2, 0);
    v4 = MEMORY[0x1E0C81028];
    goto LABEL_7;
  }
  if (glog_fd)
  {
    *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v19 = v5;
    v20 = v5;
    v17 = v5;
    v18 = v5;
    v15 = v5;
    v16 = v5;
    *(_OWORD *)buf = v5;
    v14 = v5;
    memset(&v12, 0, sizeof(v12));
    v11 = 0xAAAAAAAAAAAAAAAALL;
    time(&v11);
    localtime_r(&v11, &v12);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v12);
    dprintf(glog_fd, "%s ", (const char *)buf);
    v6 = glog_fd;
    CStringPtr = CFStringGetCStringPtr(a2, 0);
    dprintf(v6, "CCLogFile::deleteFile name: %s \n", CStringPtr);
  }
  Length = CFStringGetLength(a2);
  v9 = (char *)malloc_type_malloc(Length + 1, 0xB9AD6B70uLL);
  v10 = CFStringGetLength(a2);
  CFStringGetCString(a2, v9, v10 + 1, 0);
  unlink(v9);
  if (v9)
    free(v9);
  CFRelease(a2);
}

uint64_t CCIOReportDumpQueue::ccfree(CCIOReportDumpQueue *this)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  CCIOReportDumpQueue::stopProcessorThread(this);
  while (1)
  {
    v2 = CCIOReportDumpQueue::dequeue(this);
    if (!v2)
      break;
    v3 = v2;
    IOObjectRelease(*(_DWORD *)(v2 + 512));
    MEMORY[0x1DF0B22E4](v3, 0x1020C404FABDE88);
  }
  pthread_cond_destroy((pthread_cond_t *)((char *)this + 104));
  result = pthread_mutex_destroy((pthread_mutex_t *)((char *)this + 40));
  if (this)
    return (*(uint64_t (**)(CCIOReportDumpQueue *))(*(_QWORD *)this + 8))(this);
  return result;
}

uint64_t CCIOReporterFormatter::writeFileHeader(CCIOReporterFormatter *this)
{
  CCIOReporterFormatter::refreshSubscriptionsFromStreamRegistry(this);
  *((_DWORD *)this + 46) = 0;
  return (*(uint64_t (**)(CCIOReporterFormatter *, const char *, uint64_t))(*(_QWORD *)this + 112))(this, "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">\n<plist version=\"1.0\">\n<array>\n", 172);
}

uint64_t CCIOReporterFormatter::ccfree(CCIOReporterFormatter *this)
{
  const void *v2;
  const void *v3;
  io_object_t v4;

  v2 = (const void *)*((_QWORD *)this + 6);
  if (v2)
  {
    CFRelease(v2);
    *((_QWORD *)this + 6) = 0;
  }
  v3 = (const void *)*((_QWORD *)this + 5);
  if (v3)
  {
    CFRelease(v3);
    *((_QWORD *)this + 5) = 0;
  }
  v4 = *((_DWORD *)this + 3);
  if (v4)
  {
    IOObjectRelease(v4);
    *((_DWORD *)this + 3) = 0;
  }
  return (*(uint64_t (**)(CCIOReporterFormatter *))(*(_QWORD *)this + 8))(this);
}

uint64_t CCLogFile::buildFileTables(CFStringRef *this)
{
  const __CFAllocator *v2;
  const __CFString *MutableCopy;
  pthread_mutex_t *v4;
  CFIndex Length;
  char *v6;
  char *v7;
  CFIndex v8;
  DIR *v9;
  unsigned int v10;
  dirent *v11;
  unsigned int v12;
  size_t v13;
  const __CFString *v14;
  CFIndex v15;
  char *v16;
  char *v17;
  CFIndex v18;
  DIR *v19;
  __CFString *v20;
  dirent *v21;
  const char *d_name;
  __CFString *v23;
  __CFString *v24;
  CFStringRef v25;
  uint64_t v26;
  unsigned int v27;
  unint64_t v28;
  uint64_t v29;
  unsigned int v30;
  unint64_t v31;
  unsigned int v32;
  unsigned int v33;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  NSObject *v40;
  uint64_t v41;
  NSObject *v42;
  uint64_t v43;
  NSObject *v44;
  __int128 v45;
  char *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  time_t v50;
  tm v51;
  _BYTE buf[32];
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  MutableCopy = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 512, this[6]);
  v4 = (pthread_mutex_t *)(this + 20);
  pthread_mutex_lock((pthread_mutex_t *)(this + 20));
  Length = CFStringGetLength(MutableCopy);
  v6 = (char *)malloc_type_malloc(Length + 1, 0x51BD4FB3uLL);
  if (!v6)
  {
    v35 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_60;
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "buildFileTables";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 180;
      v36 = v35;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_60;
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "buildFileTables";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 180;
      v36 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v36, OS_LOG_TYPE_ERROR, "%s:%06u: Allocation failure\n", buf, 0x12u);
LABEL_60:
    if (glog_fd)
      goto LABEL_75;
    goto LABEL_81;
  }
  v7 = v6;
  v8 = CFStringGetLength(MutableCopy);
  if (!CFStringGetCString(MutableCopy, v7, v8 + 1, 0))
  {
    v37 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "buildFileTables";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 183;
        v38 = v37;
LABEL_87:
        _os_log_error_impl(&dword_1DB697000, v38, OS_LOG_TYPE_ERROR, "%s:%06u: CFStringGetCString failure\n", buf, 0x12u);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "buildFileTables";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 183;
      v38 = MEMORY[0x1E0C81028];
      goto LABEL_87;
    }
    if (glog_fd)
    {
      *(_QWORD *)&v45 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v45 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v57 = v45;
      v58 = v45;
      v55 = v45;
      v56 = v45;
      v53 = v45;
      v54 = v45;
      *(_OWORD *)buf = v45;
      *(_OWORD *)&buf[16] = v45;
      memset(&v51, 0, sizeof(v51));
      v50 = 0xAAAAAAAAAAAAAAAALL;
      time(&v50);
      localtime_r(&v50, &v51);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v51);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "%s:%06u: CFStringGetCString failure\n", "buildFileTables", 183);
    }
    v46 = v7;
    goto LABEL_80;
  }
  v9 = opendir(v7);
  free(v7);
  v10 = 0;
  if (v9)
  {
    while (1)
    {
      v11 = readdir(v9);
      if (!v11)
        break;
      if (v11->d_name[0] != 46)
        ++v10;
    }
    closedir(v9);
  }
  v12 = *((_DWORD *)this + 30);
  if (v12 <= v10)
    v13 = v10;
  else
    v13 = v12;
  *((_DWORD *)this + 32) = v13;
  if (!(_DWORD)v13)
  {
    v39 = coreCaptureOsLog;
    if (!coreCaptureOsLog)
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_71;
      *(_WORD *)buf = 0;
      v40 = MEMORY[0x1E0C81028];
      goto LABEL_70;
    }
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
      goto LABEL_71;
    *(_WORD *)buf = 0;
    goto LABEL_52;
  }
  v14 = (const __CFString *)malloc_type_calloc(v13, 8uLL, 0x2004093837F09uLL);
  this[17] = v14;
  if (!v14)
  {
    v39 = coreCaptureOsLog;
    if (!coreCaptureOsLog)
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_71;
      *(_WORD *)buf = 0;
      v40 = MEMORY[0x1E0C81028];
LABEL_70:
      _os_log_error_impl(&dword_1DB697000, v40, OS_LOG_TYPE_ERROR, "CCLogFile::buildFileTables fNumberOfArrayEntries is zero\n", buf, 2u);
LABEL_71:
      if (glog_fd)
      {
        *(_QWORD *)&v47 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v47 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v57 = v47;
        v58 = v47;
        v55 = v47;
        v56 = v47;
        v53 = v47;
        v54 = v47;
        *(_OWORD *)buf = v47;
        *(_OWORD *)&buf[16] = v47;
        memset(&v51, 0, sizeof(v51));
        v50 = 0xAAAAAAAAAAAAAAAALL;
        time(&v50);
        localtime_r(&v50, &v51);
        strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v51);
        dprintf(glog_fd, "%s ", buf);
        dprintf(glog_fd, "CCLogFile::buildFileTables fNumberOfArrayEntries is zero\n");
      }
      goto LABEL_81;
    }
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
      goto LABEL_71;
    *(_WORD *)buf = 0;
LABEL_52:
    v40 = v39;
    goto LABEL_70;
  }
  *((_DWORD *)this + 36) = 0;
  v15 = CFStringGetLength(MutableCopy);
  v16 = (char *)malloc_type_malloc(v15 + 1, 0x508D7C94uLL);
  if (v16)
  {
    v17 = v16;
    v18 = CFStringGetLength(MutableCopy);
    if (CFStringGetCString(MutableCopy, v17, v18 + 1, 0))
    {
      v19 = opendir(v17);
      free(v17);
      if (v19)
      {
        while (1)
        {
          v21 = readdir(v19);
          if (!v21)
            break;
          d_name = v21->d_name;
          if (v21->d_name[0] != 46)
          {
            v23 = CFStringCreateMutableCopy(v2, 512, MutableCopy);
            if (v23)
            {
              v24 = v23;
              CFStringAppendCString(v23, "/", 0);
              CFStringAppendCString(v24, d_name, 0);
              v25 = this[17];
              v26 = *((unsigned int *)this + 36);
              *((_DWORD *)this + 36) = v26 + 1;
              *((_QWORD *)&v25->isa + v26) = v24;
            }
          }
        }
        v20 = (__CFString *)closedir(v19);
      }
      if (MutableCopy)
        CFRelease(MutableCopy);
      if (v10 >= 2)
        v20 = (__CFString *)CCLogFile::sortByFileName((const __CFString *)this, v10);
      v27 = *((_DWORD *)this + 30);
      v28 = v10 - v27;
      if (v10 > v27)
      {
        v29 = 0;
        do
        {
          CCLogFile::deleteFile((CCLogFile *)v20, *((__CFString **)&this[17]->isa + v29));
          *((_QWORD *)&this[17]->isa + v29++) = 0;
        }
        while (v28 != v29);
        if (v28 < v10)
        {
          v30 = 0;
          v31 = *((unsigned int *)this + 30);
          do
          {
            *((_QWORD *)&this[17]->isa + v30) = *((_QWORD *)&this[17]->isa + v28);
            if (v28 >= v31)
              *((_QWORD *)&this[17]->isa + v28) = 0;
            ++v28;
            ++v30;
          }
          while (v10 != v28);
        }
      }
      if (*((_DWORD *)this + 28))
      {
        v32 = 0;
      }
      else
      {
        v33 = *((_DWORD *)this + 30);
        if (v10 >= v33)
          v32 = v33 - 1;
        else
          v32 = v10;
      }
      *((_DWORD *)this + 36) = v32;
      pthread_mutex_unlock((pthread_mutex_t *)(this + 20));
      return 1;
    }
    v43 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "buildFileTables";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 212;
        v44 = v43;
LABEL_91:
        _os_log_error_impl(&dword_1DB697000, v44, OS_LOG_TYPE_ERROR, "%s:%06u: CFStringGetCString failure\n", buf, 0x12u);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "buildFileTables";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 212;
      v44 = MEMORY[0x1E0C81028];
      goto LABEL_91;
    }
    if (glog_fd)
    {
      *(_QWORD *)&v49 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v49 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v57 = v49;
      v58 = v49;
      v55 = v49;
      v56 = v49;
      v53 = v49;
      v54 = v49;
      *(_OWORD *)buf = v49;
      *(_OWORD *)&buf[16] = v49;
      memset(&v51, 0, sizeof(v51));
      v50 = 0xAAAAAAAAAAAAAAAALL;
      time(&v50);
      localtime_r(&v50, &v51);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v51);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "%s:%06u: CFStringGetCString failure\n", "buildFileTables", 212);
    }
    v46 = v17;
LABEL_80:
    free(v46);
    goto LABEL_81;
  }
  v41 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
      goto LABEL_74;
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "buildFileTables";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 209;
    v42 = v41;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_74;
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "buildFileTables";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 209;
    v42 = MEMORY[0x1E0C81028];
  }
  _os_log_error_impl(&dword_1DB697000, v42, OS_LOG_TYPE_ERROR, "%s:%06u: Allocation failure\n", buf, 0x12u);
LABEL_74:
  if (glog_fd)
  {
LABEL_75:
    *(_QWORD *)&v48 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v48 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v57 = v48;
    v58 = v48;
    v55 = v48;
    v56 = v48;
    v53 = v48;
    v54 = v48;
    *(_OWORD *)buf = v48;
    *(_OWORD *)&buf[16] = v48;
    memset(&v51, 0, sizeof(v51));
    v50 = 0xAAAAAAAAAAAAAAAALL;
    time(&v50);
    localtime_r(&v50, &v51);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v51);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "%s:%06u: Allocation failure\n");
  }
LABEL_81:
  if (MutableCopy)
    CFRelease(MutableCopy);
  pthread_mutex_unlock(v4);
  return 0;
}

void CCDaemon::~CCDaemon(void *this)
{
  if (this)
    free(this);
}

uint64_t CCFormatter::doWrite(CCFormatter *this, void *a2)
{
  uint64_t (*v2)(void);

  if (*((_QWORD *)this + 3) && (v2 = (uint64_t (*)(void))*((_QWORD *)this + 2)) != 0)
    return v2();
  else
    return 0;
}

uint64_t CCLogFile::ccfree(CCLogFile *this)
{
  uint64_t result;

  CCLogFile::freeResources(this);
  result = CCFile::freeResources(this);
  if (this)
    return (*(uint64_t (**)(CCLogFile *))(*(_QWORD *)this + 8))(this);
  return result;
}

uint64_t CCObject::retain(uint64_t this)
{
  unsigned int *v1;
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;

  v1 = (unsigned int *)(this + 8);
LABEL_2:
  v2 = *v1;
  v3 = *v1 + 1;
  do
  {
    v4 = __ldxr(v1);
    if (v4 != v2)
    {
      __clrex();
      goto LABEL_2;
    }
  }
  while (__stxr(v3, v1));
  return this;
}

unsigned int *CCObject::release(unsigned int *this)
{
  unsigned int *v1;
  unsigned int v2;
  unsigned int v3;
  unsigned int v4;

  v1 = this + 2;
LABEL_2:
  v2 = *v1;
  v3 = *v1 - 1;
  do
  {
    v4 = __ldxr(v1);
    if (v4 != v2)
    {
      __clrex();
      goto LABEL_2;
    }
  }
  while (__stxr(v3, v1));
  if (!v3)
    return (unsigned int *)(*(uint64_t (**)(unsigned int *))(*(_QWORD *)this + 24))(this);
  return this;
}

uint64_t CCLogTap::isActive(CCLogTap *this, CFAbsoluteTime a2)
{
  const __CFNumber *CFProperty;
  uint64_t v5;
  int v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  NSObject *v10;
  int v11;
  __int128 v12;
  uint64_t v13;
  int v14;
  NSObject *v15;
  int v16;
  __int128 v17;
  int v19;
  __int128 v20;
  time_t v21;
  tm v22;
  int valuePtr;
  _BYTE buf[32];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(*((_DWORD *)this + 4), CFSTR("LogPolicy"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  valuePtr = -1431655766;
  CFNumberGetValue(CFProperty, kCFNumberSInt32Type, &valuePtr);
  if (CFProperty)
    CFRelease(CFProperty);
  if (valuePtr != 1)
  {
    if (*((_BYTE *)this + 345))
    {
      v8 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
          goto LABEL_23;
        v9 = *((_DWORD *)this + 4);
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v9;
        v10 = v8;
      }
      else
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          goto LABEL_23;
        v16 = *((_DWORD *)this + 4);
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v16;
        v10 = MEMORY[0x1E0C81028];
      }
      _os_log_impl(&dword_1DB697000, v10, OS_LOG_TYPE_DEFAULT, "CCLogTap::isActive tap is fBusy Active 2 entry:%u\n", buf, 8u);
LABEL_23:
      if (glog_fd)
      {
        *(_QWORD *)&v17 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v17 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v29 = v17;
        v30 = v17;
        v27 = v17;
        v28 = v17;
        v25 = v17;
        v26 = v17;
        *(_OWORD *)buf = v17;
        *(_OWORD *)&buf[16] = v17;
        memset(&v22, 0, sizeof(v22));
        v21 = 0xAAAAAAAAAAAAAAAALL;
        time(&v21);
        localtime_r(&v21, &v22);
        strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v22);
        dprintf(glog_fd, "%s ", buf);
        dprintf(glog_fd, "CCLogTap::isActive tap is fBusy Active 2 entry:%u\n");
      }
      return 1;
    }
    if (CFAbsoluteTimeGetCurrent() - *((double *)this + 44) >= a2)
      return 0;
    v13 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
        goto LABEL_29;
      v14 = *((_DWORD *)this + 4);
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&buf[4] = v14;
      *(_WORD *)&buf[8] = 2048;
      *(CFAbsoluteTime *)&buf[10] = a2;
      v15 = v13;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        goto LABEL_29;
      v19 = *((_DWORD *)this + 4);
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&buf[4] = v19;
      *(_WORD *)&buf[8] = 2048;
      *(CFAbsoluteTime *)&buf[10] = a2;
      v15 = MEMORY[0x1E0C81028];
    }
    _os_log_impl(&dword_1DB697000, v15, OS_LOG_TYPE_DEFAULT, "CCLogTap::isActive idle < duration  3 entry:%u duration:%f\n", buf, 0x12u);
LABEL_29:
    if (glog_fd)
    {
      *(_QWORD *)&v20 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v29 = v20;
      v30 = v20;
      v27 = v20;
      v28 = v20;
      v25 = v20;
      v26 = v20;
      *(_OWORD *)buf = v20;
      *(_OWORD *)&buf[16] = v20;
      memset(&v22, 0, sizeof(v22));
      v21 = 0xAAAAAAAAAAAAAAAALL;
      time(&v21);
      localtime_r(&v21, &v22);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v22);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "CCLogTap::isActive idle < duration  3 entry:%u duration:%f\n");
    }
    return 1;
  }
  v5 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    v6 = *((_DWORD *)this + 4);
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&buf[4] = 1;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = v6;
    v7 = v5;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_14;
    v11 = *((_DWORD *)this + 4);
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&buf[4] = 1;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = v11;
    v7 = MEMORY[0x1E0C81028];
  }
  _os_log_impl(&dword_1DB697000, v7, OS_LOG_TYPE_DEFAULT, "CCLogTap::isActive policy is %d entry:%u\n", buf, 0xEu);
LABEL_14:
  if (glog_fd)
  {
    *(_QWORD *)&v12 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v29 = v12;
    v30 = v12;
    v27 = v12;
    v28 = v12;
    v25 = v12;
    v26 = v12;
    *(_OWORD *)buf = v12;
    *(_OWORD *)&buf[16] = v12;
    memset(&v22, 0, sizeof(v22));
    v21 = 0xAAAAAAAAAAAAAAAALL;
    time(&v21);
    localtime_r(&v21, &v22);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v22);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "CCLogTap::isActive policy is %d entry:%u\n");
  }
  return 1;
}

void CCLogTap::~CCLogTap(void *this)
{
  if (this)
    free(this);
}

uint64_t CCTap::runDrainThread(CCTap *this, void *a2)
{
  pthread_setname_np((const char *)this + 120);
  (*(void (**)(CCTap *))(*(_QWORD *)this + 136))(this);
  return 0;
}

uint64_t CCConfigure::ccfree(CCConfigure *this)
{
  uint64_t v2;

  v2 = *((_QWORD *)this + 2);
  if (v2)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 48))(v2);
    *((_QWORD *)this + 2) = 0;
  }
  return (*(uint64_t (**)(CCConfigure *))(*(_QWORD *)this + 8))(this);
}

void CCLogFile::fileDidOpen(CCLogFile *this, unint64_t a2)
{
  size_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  __int128 v8;
  time_t v9;
  tm v10;
  _BYTE buf[32];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a2 <= 0x5000000 && (*((_DWORD *)this + 31) & 1) == 0)
  {
    v4 = a2 + 2048;
    ftruncate(*((_DWORD *)this + 9), a2 + 2048);
    v5 = mmap(0, v4, 2, 1, *((_DWORD *)this + 9), 0);
    *((_QWORD *)this + 157) = v5;
    if (v5 != (void *)-1)
    {
LABEL_15:
      *((_QWORD *)this + 159) = 0;
      *((_QWORD *)this + 158) = v4;
      return;
    }
    *((_QWORD *)this + 157) = 0;
    v6 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "fileDidOpen";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 47;
      v7 = v6;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        goto LABEL_13;
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "fileDidOpen";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 47;
      v7 = MEMORY[0x1E0C81028];
    }
    _os_log_impl(&dword_1DB697000, v7, OS_LOG_TYPE_DEFAULT, "%s:%d: mmap failed\n", buf, 0x12u);
LABEL_13:
    if (glog_fd)
    {
      *(_QWORD *)&v8 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v16 = v8;
      v17 = v8;
      v14 = v8;
      v15 = v8;
      v12 = v8;
      v13 = v8;
      *(_OWORD *)buf = v8;
      *(_OWORD *)&buf[16] = v8;
      memset(&v10, 0, sizeof(v10));
      v9 = 0xAAAAAAAAAAAAAAAALL;
      time(&v9);
      localtime_r(&v9, &v10);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v10);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "%s:%d: mmap failed\n", "fileDidOpen", 47);
    }
    goto LABEL_15;
  }
}

void CCPipeMonitor::ccfree(CCPipeMonitor *this)
{
  uint64_t v2;
  NSObject *v3;
  __int128 v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  NSObject *v12;
  __int128 v13;
  __int128 v14;
  int v15;
  int v16;
  uint64_t v17;
  NSObject *v18;
  __int128 v19;
  int v20;
  int v21;
  uint64_t v22;
  NSObject *v23;
  __int128 v24;
  uint64_t v25;
  NSObject *v26;
  __int128 v27;
  uint64_t v28;
  NSObject *v29;
  __int128 v30;
  uint64_t v31;
  NSObject *v32;
  __int128 v33;
  time_t v34;
  tm v35;
  uint8_t buf[16];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v2 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v3 = v2;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v3 = MEMORY[0x1E0C81028];
  }
  _os_log_impl(&dword_1DB697000, v3, OS_LOG_TYPE_DEFAULT, "CCPipeMonitor::ccfree Entered\n", buf, 2u);
LABEL_7:
  if (glog_fd)
  {
    *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v42 = v4;
    v43 = v4;
    v40 = v4;
    v41 = v4;
    v38 = v4;
    v39 = v4;
    *(_OWORD *)buf = v4;
    v37 = v4;
    memset(&v35, 0, sizeof(v35));
    v34 = 0xAAAAAAAAAAAAAAAALL;
    time(&v34);
    localtime_r(&v34, &v35);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v35);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCPipeMonitor::ccfree Entered\n");
  }
  if (pthread_mutex_lock((pthread_mutex_t *)((char *)this + 80)))
  {
    v5 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
        goto LABEL_24;
      *(_WORD *)buf = 0;
      v6 = v5;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        goto LABEL_24;
      *(_WORD *)buf = 0;
      v6 = MEMORY[0x1E0C81028];
    }
    _os_log_impl(&dword_1DB697000, v6, OS_LOG_TYPE_DEFAULT, "CCPipeMonitor::ccfree Failed to acquire lock\n", buf, 2u);
LABEL_24:
    if (glog_fd)
    {
      *(_QWORD *)&v13 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v42 = v13;
      v43 = v13;
      v40 = v13;
      v41 = v13;
      v38 = v13;
      v39 = v13;
      *(_OWORD *)buf = v13;
      v37 = v13;
      memset(&v35, 0, sizeof(v35));
      v34 = 0xAAAAAAAAAAAAAAAALL;
      time(&v34);
      localtime_r(&v34, &v35);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v35);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "CCPipeMonitor::ccfree Failed to acquire lock\n");
    }
    return;
  }
  v7 = *((_QWORD *)this + 9);
  if (v7)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)v7 + 48))(v7);
    *((_QWORD *)this + 9) = 0;
  }
  CCPipeMonitor::stopPipeMonitor(this);
  v8 = *((_QWORD *)this + 8);
  if (v8)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)v8 + 48))(v8);
    *((_QWORD *)this + 8) = 0;
  }
  v9 = pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 80));
  if (v9)
  {
    v10 = v9;
    v11 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
        goto LABEL_29;
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v10;
      v12 = v11;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        goto LABEL_29;
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v10;
      v12 = MEMORY[0x1E0C81028];
    }
    _os_log_impl(&dword_1DB697000, v12, OS_LOG_TYPE_DEFAULT, "CCPipeMonitor::ccfree - fails to unlock. Error[%d]\n", buf, 8u);
LABEL_29:
    if (glog_fd)
    {
      *(_QWORD *)&v14 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v42 = v14;
      v43 = v14;
      v40 = v14;
      v41 = v14;
      v38 = v14;
      v39 = v14;
      *(_OWORD *)buf = v14;
      v37 = v14;
      memset(&v35, 0, sizeof(v35));
      v34 = 0xAAAAAAAAAAAAAAAALL;
      time(&v34);
      localtime_r(&v34, &v35);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v35);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "CCPipeMonitor::ccfree - fails to unlock. Error[%d]\n", v10);
    }
  }
  v15 = pthread_mutex_destroy((pthread_mutex_t *)((char *)this + 80));
  if (!v15)
    goto LABEL_40;
  v16 = v15;
  v17 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_38;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v16;
    v18 = v17;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_38;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v16;
    v18 = MEMORY[0x1E0C81028];
  }
  _os_log_impl(&dword_1DB697000, v18, OS_LOG_TYPE_DEFAULT, "CCPipeMonitor::ccfree - fails to destroy lock. Error[%d]\n", buf, 8u);
LABEL_38:
  if (glog_fd)
  {
    *(_QWORD *)&v19 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v42 = v19;
    v43 = v19;
    v40 = v19;
    v41 = v19;
    v38 = v19;
    v39 = v19;
    *(_OWORD *)buf = v19;
    v37 = v19;
    memset(&v35, 0, sizeof(v35));
    v34 = 0xAAAAAAAAAAAAAAAALL;
    time(&v34);
    localtime_r(&v34, &v35);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v35);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCPipeMonitor::ccfree - fails to destroy lock. Error[%d]\n", v16);
  }
LABEL_40:
  v20 = pthread_mutex_destroy((pthread_mutex_t *)((char *)this + 144));
  if (!v20)
    goto LABEL_49;
  v21 = v20;
  v22 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_47;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v21;
    v23 = v22;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_47;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v21;
    v23 = MEMORY[0x1E0C81028];
  }
  _os_log_impl(&dword_1DB697000, v23, OS_LOG_TYPE_DEFAULT, "CCPipeMonitor::ccfree - fails to destroy fMutex lock. Error[%d]\n", buf, 8u);
LABEL_47:
  if (glog_fd)
  {
    *(_QWORD *)&v24 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v42 = v24;
    v43 = v24;
    v40 = v24;
    v41 = v24;
    v38 = v24;
    v39 = v24;
    *(_OWORD *)buf = v24;
    v37 = v24;
    memset(&v35, 0, sizeof(v35));
    v34 = 0xAAAAAAAAAAAAAAAALL;
    time(&v34);
    localtime_r(&v34, &v35);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v35);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCPipeMonitor::ccfree - fails to destroy fMutex lock. Error[%d]\n", v21);
  }
LABEL_49:
  v25 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_55;
    *(_WORD *)buf = 0;
    v26 = v25;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_55;
    *(_WORD *)buf = 0;
    v26 = MEMORY[0x1E0C81028];
  }
  _os_log_impl(&dword_1DB697000, v26, OS_LOG_TYPE_DEFAULT, "CCPipeMonitor::ccfree Exit - Destroyed lock\n", buf, 2u);
LABEL_55:
  if (glog_fd)
  {
    *(_QWORD *)&v27 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v27 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v42 = v27;
    v43 = v27;
    v40 = v27;
    v41 = v27;
    v38 = v27;
    v39 = v27;
    *(_OWORD *)buf = v27;
    v37 = v27;
    memset(&v35, 0, sizeof(v35));
    v34 = 0xAAAAAAAAAAAAAAAALL;
    time(&v34);
    localtime_r(&v34, &v35);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v35);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCPipeMonitor::ccfree Exit - Destroyed lock\n");
  }
  v28 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_63;
    *(_WORD *)buf = 0;
    v29 = v28;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_63;
    *(_WORD *)buf = 0;
    v29 = MEMORY[0x1E0C81028];
  }
  _os_log_impl(&dword_1DB697000, v29, OS_LOG_TYPE_DEFAULT, "CCServiceMonitor::ccfree()\n", buf, 2u);
LABEL_63:
  if (glog_fd)
  {
    *(_QWORD *)&v30 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v30 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v42 = v30;
    v43 = v30;
    v40 = v30;
    v41 = v30;
    v38 = v30;
    v39 = v30;
    *(_OWORD *)buf = v30;
    v37 = v30;
    memset(&v35, 0, sizeof(v35));
    v34 = 0xAAAAAAAAAAAAAAAALL;
    time(&v34);
    localtime_r(&v34, &v35);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v35);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCServiceMonitor::ccfree()\n");
  }
  CCServiceMonitor::freeresources(this);
  (*(void (**)(CCPipeMonitor *))(*(_QWORD *)this + 8))(this);
  if (glog_fd)
  {
    close(glog_fd);
    glog_fd = 0;
  }
  v31 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_73;
    *(_WORD *)buf = 0;
    v32 = v31;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_73;
    *(_WORD *)buf = 0;
    v32 = MEMORY[0x1E0C81028];
  }
  _os_log_impl(&dword_1DB697000, v32, OS_LOG_TYPE_DEFAULT, "CCPipeMonitor::ccfree Exit\n", buf, 2u);
LABEL_73:
  if (glog_fd)
  {
    *(_QWORD *)&v33 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v33 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v42 = v33;
    v43 = v33;
    v40 = v33;
    v41 = v33;
    v38 = v33;
    v39 = v33;
    *(_OWORD *)buf = v33;
    v37 = v33;
    memset(&v35, 0, sizeof(v35));
    v34 = 0xAAAAAAAAAAAAAAAALL;
    time(&v34);
    localtime_r(&v34, &v35);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v35);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCPipeMonitor::ccfree Exit\n");
  }
}

uint64_t CCLogFile::closeFile(CCLogFile *this)
{
  (*(void (**)(_QWORD))(**((_QWORD **)this + 2) + 64))(*((_QWORD *)this + 2));
  (*(void (**)(CCLogFile *))(*(_QWORD *)this + 176))(this);
  fsync(*((_DWORD *)this + 9));
  close(*((_DWORD *)this + 9));
  *((_DWORD *)this + 9) = -1;
  return 1;
}

uint64_t CCFormatter::writeFileFooter(CCFormatter *this)
{
  return 0;
}

uint64_t CCFile::ccfree(CCFile *this)
{
  uint64_t result;

  result = CCFile::freeResources(this);
  if (this)
    return (*(uint64_t (**)(CCFile *))(*(_QWORD *)this + 8))(this);
  return result;
}

CCLogFile *CCLogFile::fileWillClose(CCLogFile *this)
{
  if (*((_QWORD *)this + 157))
    return (CCLogFile *)CCLogFile::closeMMAP(this);
  return this;
}

void CCDataPipeInterface::~CCDataPipeInterface(void *this)
{
  if (this)
    free(this);
}

uint64_t CCLogFile::freeResources(CCLogFile *this)
{
  pthread_mutex_t *v2;

  v2 = (pthread_mutex_t *)((char *)this + 160);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 160));
  CCLogFile::freeFilePathArray(this);
  pthread_mutex_unlock(v2);
  return pthread_mutex_destroy(v2);
}

ssize_t CCLogFile::doWrite(CCLogFile *this, void *__buf, size_t __nbyte)
{
  ssize_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = __nbyte;
  if (!__nbyte)
    return v3;
  v6 = *((_QWORD *)this + 157);
  if (!v6)
    goto LABEL_6;
  v7 = *((_QWORD *)this + 159);
  if (v7 + __nbyte >= *((_QWORD *)this + 158))
  {
    CCLogFile::closeMMAP(this);
    *((_BYTE *)this + 1248) = 1;
LABEL_6:
    v3 = write(*((_DWORD *)this + 9), __buf, v3);
    goto LABEL_7;
  }
  memcpy((void *)(v6 + v7), __buf, __nbyte);
  *((_QWORD *)this + 159) += v3;
LABEL_7:
  v8 = *((_QWORD *)this + 19);
  if (v3 >= 1)
  {
    v8 += v3;
    *((_QWORD *)this + 19) = v8;
  }
  if (v8 > *((unsigned int *)this + 29))
    *((_BYTE *)this + 1248) = 1;
  return v3;
}

uint64_t CCTap::isActive(CCTap *this, double a2)
{
  return 0;
}

uint64_t CCDaemon::ccfree(CCDaemon *this)
{
  uint64_t result;

  result = CCDaemon::freeResources(this);
  if (this)
    return (*(uint64_t (**)(CCDaemon *))(*(_QWORD *)this + 8))(this);
  return result;
}

void CCProfileMonitor::profileCallback(CCProfileMonitor *this, int a2)
{
  uint64_t v2;
  NSObject *v3;
  pthread_mutex_t *v6;
  const void *v7;
  __int128 v8;
  CFURLRef v9;
  uint64_t v10;
  NSObject *v11;
  __int128 v12;
  uint64_t v13;
  NSObject *v14;
  const __CFAllocator *v15;
  uint64_t v16;
  NSObject *v17;
  __int128 v18;
  uint64_t v19;
  int v20;
  NSObject *v21;
  CFPropertyListRef v22;
  CFTypeID v23;
  CFIndex Count;
  uint64_t v25;
  NSObject *v26;
  __int128 v27;
  int v28;
  __int128 v29;
  NSObject *v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  NSObject *v34;
  __int128 v35;
  time_t v36;
  tm v37;
  CFDataRef resourceData;
  uint8_t buf[16];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  resourceData = 0;
  if (shutDownPending)
  {
    v2 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
        goto LABEL_10;
      *(_WORD *)buf = 0;
      v3 = v2;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        goto LABEL_10;
      *(_WORD *)buf = 0;
      v3 = MEMORY[0x1E0C81028];
    }
    _os_log_impl(&dword_1DB697000, v3, OS_LOG_TYPE_DEFAULT, "CCProfileMonitor::profileCallback during shutdown (1) \n", buf, 2u);
LABEL_10:
    if (glog_fd)
    {
      *(_QWORD *)&v8 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v45 = v8;
      v46 = v8;
      v43 = v8;
      v44 = v8;
      v41 = v8;
      v42 = v8;
      *(_OWORD *)buf = v8;
      v40 = v8;
      memset(&v37, 0, sizeof(v37));
      v36 = 0xAAAAAAAAAAAAAAAALL;
      time(&v36);
      localtime_r(&v36, &v37);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v37);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "CCProfileMonitor::profileCallback during shutdown (1) \n");
    }
    return;
  }
  *((_BYTE *)this + 104) = 1;
  v6 = (pthread_mutex_t *)((char *)this + 16);
  if (!pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16)))
  {
    v9 = CFURLCreateWithString(0, CFSTR("file:///private/var/Managed%20Preferences/mobile/com.apple.corecapture.configure.plist"), 0);
    v10 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
        goto LABEL_18;
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = a2;
      v11 = v10;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        goto LABEL_18;
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = a2;
      v11 = MEMORY[0x1E0C81028];
    }
    _os_log_impl(&dword_1DB697000, v11, OS_LOG_TYPE_DEFAULT, "CCProfileMonitor::profileCallback Entered token:%d\n", buf, 8u);
LABEL_18:
    if (glog_fd)
    {
      *(_QWORD *)&v12 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v45 = v12;
      v46 = v12;
      v43 = v12;
      v44 = v12;
      v41 = v12;
      v42 = v12;
      *(_OWORD *)buf = v12;
      v40 = v12;
      memset(&v37, 0, sizeof(v37));
      v36 = 0xAAAAAAAAAAAAAAAALL;
      time(&v36);
      localtime_r(&v36, &v37);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v37);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "CCProfileMonitor::profileCallback Entered token:%d\n", a2);
    }
    if (shutDownPending)
    {
      v13 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
          goto LABEL_32;
        *(_WORD *)buf = 0;
        v14 = v13;
      }
      else
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          goto LABEL_32;
        *(_WORD *)buf = 0;
        v14 = MEMORY[0x1E0C81028];
      }
      _os_log_impl(&dword_1DB697000, v14, OS_LOG_TYPE_DEFAULT, "CCProfileMonitor::profileCallback during shutdown (2) \n", buf, 2u);
LABEL_32:
      if (glog_fd)
      {
        *(_QWORD *)&v18 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v45 = v18;
        v46 = v18;
        v43 = v18;
        v44 = v18;
        v41 = v18;
        v42 = v18;
        *(_OWORD *)buf = v18;
        v40 = v18;
        memset(&v37, 0, sizeof(v37));
        v36 = 0xAAAAAAAAAAAAAAAALL;
        time(&v36);
        localtime_r(&v36, &v37);
        strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v37);
        dprintf(glog_fd, "%s ", (const char *)buf);
        dprintf(glog_fd, "CCProfileMonitor::profileCallback during shutdown (2) \n");
      }
LABEL_34:
      v7 = 0;
      goto LABEL_35;
    }
    v15 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    if (CFURLCreateDataAndPropertiesFromResource((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v9, &resourceData, 0, 0, 0))
    {
      if (CCProfileMonitor::fProfileLoaded)
      {
        v16 = coreCaptureOsLog;
        if (coreCaptureOsLog)
        {
          if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
            goto LABEL_56;
          *(_WORD *)buf = 0;
          v17 = v16;
        }
        else
        {
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            goto LABEL_56;
          *(_WORD *)buf = 0;
          v17 = MEMORY[0x1E0C81028];
        }
        _os_log_impl(&dword_1DB697000, v17, OS_LOG_TYPE_DEFAULT, "CCProfileMonitor::profileCallback fProfileLoaded is true\n", buf, 2u);
LABEL_56:
        if (glog_fd)
        {
          *(_QWORD *)&v27 = 0xAAAAAAAAAAAAAAAALL;
          *((_QWORD *)&v27 + 1) = 0xAAAAAAAAAAAAAAAALL;
          v45 = v27;
          v46 = v27;
          v43 = v27;
          v44 = v27;
          v41 = v27;
          v42 = v27;
          *(_OWORD *)buf = v27;
          v40 = v27;
          memset(&v37, 0, sizeof(v37));
          v36 = 0xAAAAAAAAAAAAAAAALL;
          time(&v36);
          localtime_r(&v36, &v37);
          strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v37);
          dprintf(glog_fd, "%s ", (const char *)buf);
          dprintf(glog_fd, "CCProfileMonitor::profileCallback fProfileLoaded is true\n");
        }
        goto LABEL_34;
      }
      v22 = CFPropertyListCreateWithData(v15, resourceData, 0, 0, 0);
      v7 = v22;
      if (!v22
        || !CFPropertyListIsValid(v22, kCFPropertyListXMLFormat_v1_0)
        || (v23 = CFGetTypeID(v7), v23 != CFDictionaryGetTypeID()))
      {
LABEL_35:
        pthread_mutex_unlock(v6);
        if (v9)
          CFRelease(v9);
        goto LABEL_37;
      }
      Count = CFDictionaryGetCount((CFDictionaryRef)v7);
      *((_QWORD *)this + 12) = Count;
      v25 = coreCaptureOsLog;
      if (Count)
      {
        if (coreCaptureOsLog)
        {
          if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v26 = v25;
LABEL_71:
            _os_log_impl(&dword_1DB697000, v26, OS_LOG_TYPE_DEFAULT, "CCProfileMonitor::profileCallback Loaded \n", buf, 2u);
          }
        }
        else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v26 = MEMORY[0x1E0C81028];
          goto LABEL_71;
        }
        if (glog_fd)
        {
          *(_QWORD *)&v31 = 0xAAAAAAAAAAAAAAAALL;
          *((_QWORD *)&v31 + 1) = 0xAAAAAAAAAAAAAAAALL;
          v45 = v31;
          v46 = v31;
          v43 = v31;
          v44 = v31;
          v41 = v31;
          v42 = v31;
          *(_OWORD *)buf = v31;
          v40 = v31;
          memset(&v37, 0, sizeof(v37));
          v36 = 0xAAAAAAAAAAAAAAAALL;
          time(&v36);
          localtime_r(&v36, &v37);
          strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v37);
          dprintf(glog_fd, "%s ", (const char *)buf);
          dprintf(glog_fd, "CCProfileMonitor::profileCallback Loaded \n");
        }
        CCPipeMonitor::profileLoaded(*(CFDictionaryRef **)(*((_QWORD *)this + 11) + 16));
        *((_QWORD *)this + 14) = CFDictionaryCreateCopy(v15, (CFDictionaryRef)v7);
        CCProfileMonitor::applyConfiguration(this, 0, 0);
        CCProfileMonitor::fProfileLoaded = 1;
        *((_BYTE *)this + 105) = 0;
        CFPreferencesFlushCaches();
        goto LABEL_35;
      }
      if (coreCaptureOsLog)
      {
        if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
          goto LABEL_78;
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = CCProfileMonitor::fProfileLoaded;
        v30 = v25;
      }
      else
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          goto LABEL_78;
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = CCProfileMonitor::fProfileLoaded;
        v30 = MEMORY[0x1E0C81028];
      }
      _os_log_impl(&dword_1DB697000, v30, OS_LOG_TYPE_DEFAULT, "CCProfileMonitor::profileCallback fProfileLoaded:%d Removed\n", buf, 8u);
LABEL_78:
      if (glog_fd)
      {
        *(_QWORD *)&v32 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v32 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v45 = v32;
        v46 = v32;
        v43 = v32;
        v44 = v32;
        v41 = v32;
        v42 = v32;
        *(_OWORD *)buf = v32;
        v40 = v32;
        memset(&v37, 0, sizeof(v37));
        v36 = 0xAAAAAAAAAAAAAAAALL;
        time(&v36);
        localtime_r(&v36, &v37);
        strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v37);
        dprintf(glog_fd, "%s ", (const char *)buf);
        dprintf(glog_fd, "CCProfileMonitor::profileCallback fProfileLoaded:%d Removed\n", CCProfileMonitor::fProfileLoaded);
      }
      v33 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
          goto LABEL_86;
        *(_WORD *)buf = 0;
        v34 = v33;
      }
      else
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          goto LABEL_86;
        *(_WORD *)buf = 0;
        v34 = MEMORY[0x1E0C81028];
      }
      _os_log_impl(&dword_1DB697000, v34, OS_LOG_TYPE_DEFAULT, "CCProfileMonitor::profileCallback Removed\n", buf, 2u);
LABEL_86:
      if (glog_fd)
      {
        *(_QWORD *)&v35 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v35 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v45 = v35;
        v46 = v35;
        v43 = v35;
        v44 = v35;
        v41 = v35;
        v42 = v35;
        *(_OWORD *)buf = v35;
        v40 = v35;
        memset(&v37, 0, sizeof(v37));
        v36 = 0xAAAAAAAAAAAAAAAALL;
        time(&v36);
        localtime_r(&v36, &v37);
        strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v37);
        dprintf(glog_fd, "%s ", (const char *)buf);
        dprintf(glog_fd, "CCProfileMonitor::profileCallback Removed\n");
      }
LABEL_64:
      if (!*((_BYTE *)this + 105))
        CCProfileMonitor::profileRemoved(this);
      goto LABEL_35;
    }
    v19 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      {
        v20 = *((unsigned __int8 *)this + 105);
        *(_DWORD *)buf = 67109888;
        *(_DWORD *)&buf[4] = 183;
        *(_WORD *)&buf[8] = 1024;
        *(_DWORD *)&buf[10] = a2;
        *(_WORD *)&buf[14] = 1024;
        LODWORD(v40) = CCProfileMonitor::fProfileLoaded;
        WORD2(v40) = 1024;
        *(_DWORD *)((char *)&v40 + 6) = v20;
        v21 = v19;
LABEL_60:
        _os_log_impl(&dword_1DB697000, v21, OS_LOG_TYPE_DEFAULT, "CCProfileMonitor::profileCallback:%d removePending token:%d fProfileLoaded:%d fProfileRemoveApplied:%d\n", buf, 0x1Au);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v28 = *((unsigned __int8 *)this + 105);
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)&buf[4] = 183;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = a2;
      *(_WORD *)&buf[14] = 1024;
      LODWORD(v40) = CCProfileMonitor::fProfileLoaded;
      WORD2(v40) = 1024;
      *(_DWORD *)((char *)&v40 + 6) = v28;
      v21 = MEMORY[0x1E0C81028];
      goto LABEL_60;
    }
    if (glog_fd)
    {
      *(_QWORD *)&v29 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v29 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v45 = v29;
      v46 = v29;
      v43 = v29;
      v44 = v29;
      v41 = v29;
      v42 = v29;
      *(_OWORD *)buf = v29;
      v40 = v29;
      memset(&v37, 0, sizeof(v37));
      v36 = 0xAAAAAAAAAAAAAAAALL;
      time(&v36);
      localtime_r(&v36, &v37);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v37);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "CCProfileMonitor::profileCallback:%d removePending token:%d fProfileLoaded:%d fProfileRemoveApplied:%d\n", 183, a2, CCProfileMonitor::fProfileLoaded, *((unsigned __int8 *)this + 105));
    }
    v7 = 0;
    goto LABEL_64;
  }
  pthread_mutex_unlock(v6);
  v7 = 0;
LABEL_37:
  if (resourceData)
  {
    CFRelease(resourceData);
    resourceData = 0;
  }
  if (v7)
    CFRelease(v7);
  *((_BYTE *)this + 104) = 0;
}

void CCDaemon::shutdown(CCDaemon *this)
{
  uint64_t v1;
  NSObject *v2;
  __int128 v3;
  time_t v5;
  tm v6;
  uint8_t buf[16];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v1 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v2 = v1;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v2 = MEMORY[0x1E0C81028];
  }
  _os_log_impl(&dword_1DB697000, v2, OS_LOG_TYPE_DEFAULT, "CCDaemon::shutdown is fired\n", buf, 2u);
LABEL_7:
  if (glog_fd)
  {
    *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v13 = v3;
    v14 = v3;
    v11 = v3;
    v12 = v3;
    v9 = v3;
    v10 = v3;
    *(_OWORD *)buf = v3;
    v8 = v3;
    memset(&v6, 0, sizeof(v6));
    v5 = 0xAAAAAAAAAAAAAAAALL;
    time(&v5);
    localtime_r(&v5, &v6);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v6);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCDaemon::shutdown is fired\n");
  }
  while (!__ldxr((unsigned int *)&shutDownPending))
  {
    if (!__stxr(1u, (unsigned int *)&shutDownPending))
    {
      *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
      pthread_create((pthread_t *)buf, 0, (void *(__cdecl *)(void *))CCDaemon::runShutdownThread, 0);
      return;
    }
  }
  __clrex();
}

uint64_t CCLogFile::addFile(CCLogFile *this)
{
  pthread_mutex_t *v2;
  CCLogFile *v3;
  uint64_t v4;
  __CFString *v5;
  CFIndex Length;
  char *v7;
  const __CFString *v8;
  CFIndex v9;
  uint64_t v10;
  CFIndex v11;
  std::__fs::filesystem::path *v12;
  CFIndex v13;
  uint64_t v14;
  std::error_code *v15;
  std::error_code *v16;
  int v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  __int128 v22;
  __int128 v23;
  time_t v25;
  tm v26;
  uint8_t buf[16];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v2 = (pthread_mutex_t *)((char *)this + 160);
  v3 = (CCLogFile *)pthread_mutex_lock((pthread_mutex_t *)((char *)this + 160));
  v4 = (*((_DWORD *)this + 36) + 1) % *((_DWORD *)this + 30);
  v5 = *(__CFString **)(*((_QWORD *)this + 17) + 8 * v4);
  if (v5)
  {
    CCLogFile::deleteFile(v3, v5);
    *(_QWORD *)(*((_QWORD *)this + 17) + 8 * v4) = 0;
  }
  if (*((_DWORD *)this + 9) != -1)
    (*(void (**)(CCLogFile *))(*(_QWORD *)this + 88))(this);
  Length = CFStringGetLength(*((CFStringRef *)this + 11));
  v7 = (char *)malloc_type_malloc(Length + 1, 0x7F3D2BD2uLL);
  v8 = (const __CFString *)*((_QWORD *)this + 11);
  v9 = CFStringGetLength(v8);
  CFStringGetCString(v8, v7, v9 + 1, 0);
  v10 = (*(uint64_t (**)(CCLogFile *, char *))(*(_QWORD *)this + 136))(this, v7);
  if (v7)
    free(v7);
  v11 = CFStringGetLength((CFStringRef)v10);
  v12 = (std::__fs::filesystem::path *)malloc_type_malloc(v11 + 1, 0x51FC60BDuLL);
  v13 = CFStringGetLength((CFStringRef)v10);
  CFStringGetCString((CFStringRef)v10, (char *)v12, v13 + 1, 0);
  v14 = isSeedAndiOS();
  if ((_DWORD)v14)
  {
    if (deviceUnlockedSinceBoot(v14, v15))
    {
      remove(v12, v16);
      v17 = open_dprotected_np((const char *)v12, 1538, 3, 0, 420);
      goto LABEL_11;
    }
    v20 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
        goto LABEL_27;
      *(_WORD *)buf = 0;
      v21 = v20;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        goto LABEL_27;
      *(_WORD *)buf = 0;
      v21 = MEMORY[0x1E0C81028];
    }
    _os_log_impl(&dword_1DB697000, v21, OS_LOG_TYPE_DEFAULT, "CCLogFile::addFile: No log before device first unlocked for PROTECTION_CLASS_C\n", buf, 2u);
LABEL_27:
    if (glog_fd)
    {
      *(_QWORD *)&v23 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v23 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v33 = v23;
      v34 = v23;
      v31 = v23;
      v32 = v23;
      v29 = v23;
      v30 = v23;
      *(_OWORD *)buf = v23;
      v28 = v23;
      memset(&v26, 0, sizeof(v26));
      v25 = 0xAAAAAAAAAAAAAAAALL;
      time(&v25);
      localtime_r(&v25, &v26);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v26);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "CCLogFile::addFile: No log before device first unlocked for PROTECTION_CLASS_C\n");
    }
    goto LABEL_29;
  }
  v17 = open((const char *)v12, 1538, 420);
LABEL_11:
  *((_DWORD *)this + 9) = v17;
  if (v17 != -1)
  {
    (*(void (**)(CCLogFile *, _QWORD))(*(_QWORD *)this + 168))(this, *((unsigned int *)this + 29));
    if (v12)
      free(v12);
    *((_BYTE *)this + 1248) = 0;
    *((_QWORD *)this + 19) = 0;
    (*(void (**)(_QWORD))(**((_QWORD **)this + 2) + 56))(*((_QWORD *)this + 2));
    *(_QWORD *)(*((_QWORD *)this + 17) + 8 * v4) = v10;
    *((_DWORD *)this + 36) = v4;
    v10 = 1;
    goto LABEL_33;
  }
  v18 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
      goto LABEL_22;
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = v12;
    v19 = v18;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_22;
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = v12;
    v19 = MEMORY[0x1E0C81028];
  }
  _os_log_error_impl(&dword_1DB697000, v19, OS_LOG_TYPE_ERROR, "CCLogFile::addFile Failed to create %s\n", buf, 0xCu);
LABEL_22:
  if (glog_fd)
  {
    *(_QWORD *)&v22 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v22 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v33 = v22;
    v34 = v22;
    v31 = v22;
    v32 = v22;
    v29 = v22;
    v30 = v22;
    *(_OWORD *)buf = v22;
    v28 = v22;
    memset(&v26, 0, sizeof(v26));
    v25 = 0xAAAAAAAAAAAAAAAALL;
    time(&v25);
    localtime_r(&v25, &v26);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v26);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCLogFile::addFile Failed to create %s\n");
  }
LABEL_29:
  if (v12)
    free(v12);
  if (v10)
  {
    CFRelease((CFTypeRef)v10);
    v10 = 0;
  }
LABEL_33:
  pthread_mutex_unlock(v2);
  return v10;
}

uint64_t CCDataPipeInterface::openUserClient(CCDataPipeInterface *this)
{
  return IOConnectCallScalarMethod(*((_DWORD *)this + 22), 1u, 0, 0, 0, 0);
}

void CCProfileMonitor::ccfree(CCProfileMonitor *this)
{
  CCProfileMonitor::freeResources(this);
  if (this)
    (*(void (**)(CCProfileMonitor *))(*(_QWORD *)this + 8))(this);
}

__CFString *CCFile::generateFileName(CFStringRef *this, const char *a2)
{
  __int128 v3;
  __int128 v4;
  int v5;
  int v6;
  int tm_mday;
  int tm_hour;
  int tm_min;
  int tm_sec;
  __darwin_suseconds_t tv_usec;
  int v12;
  const char *v13;
  CFStringRef v14;
  const __CFAllocator *alloc;
  __CFString *theString;
  timeval v18;
  tm v19;
  time_t v20;
  char buffer[16];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  char __str[16];
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  alloc = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  theString = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 512, this[6]);
  *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v59 = v3;
  v60 = v3;
  v57 = v3;
  v58 = v3;
  v55 = v3;
  v56 = v3;
  *(_OWORD *)__str = v3;
  v54 = v3;
  v20 = 0xAAAAAAAAAAAAAAAALL;
  memset(&v19, 0, sizeof(v19));
  time(&v20);
  localtime_r(&v20, &v19);
  *((_DWORD *)this + 8) = (*((_DWORD *)this + 8) + 1) % 0x3E8u;
  v18.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v18.tv_usec = 0xAAAAAAAAAAAAAAAALL;
  gettimeofday(&v18, 0);
  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v51 = v4;
  v52 = v4;
  v49 = v4;
  v50 = v4;
  v47 = v4;
  v48 = v4;
  v45 = v4;
  v46 = v4;
  v43 = v4;
  v44 = v4;
  v41 = v4;
  v42 = v4;
  v39 = v4;
  v40 = v4;
  v37 = v4;
  v38 = v4;
  v35 = v4;
  v36 = v4;
  v33 = v4;
  v34 = v4;
  v31 = v4;
  v32 = v4;
  v29 = v4;
  v30 = v4;
  v27 = v4;
  v28 = v4;
  v25 = v4;
  v26 = v4;
  v23 = v4;
  v24 = v4;
  *(_OWORD *)buffer = v4;
  v22 = v4;
  CFStringGetCString(this[11], buffer, 512, 0);
  v5 = v19.tm_year + 1900;
  v6 = v19.tm_mon + 1;
  tm_hour = v19.tm_hour;
  tm_mday = v19.tm_mday;
  tm_sec = v19.tm_sec;
  tm_min = v19.tm_min;
  tv_usec = v18.tv_usec;
  v12 = *((_DWORD *)this + 8);
  v13 = (const char *)(*((uint64_t (**)(CFStringRef))this[2]->isa + 11))(this[2]);
  snprintf(__str, 0x80uLL, "[%04d-%02d-%02d_%02d,%02d,%02d.%06u]-%s-%03d.%s", v5, v6, tm_mday, tm_hour, tm_min, tm_sec, tv_usec, buffer, v12, v13);
  v14 = this[5];
  if (v14)
  {
    CFRelease(v14);
    this[5] = 0;
  }
  this[5] = CFStringCreateWithCString(alloc, __str, 0);
  CFStringAppendCString(theString, __str, 0);
  return theString;
}

void CCConfigure::~CCConfigure(void *this)
{
  if (this)
    free(this);
}

uint64_t CCConfigure::initWithPipeMonitor(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(a1 + 16) = a2;
  (*(void (**)(uint64_t))(*(_QWORD *)a2 + 40))(a2);
  return 1;
}

void CCConfigure::CCConfigure(CCConfigure *this)
{
  *((_DWORD *)this + 2) = 1;
  *(_QWORD *)this = off_1EA31F2D8;
}

{
  *((_DWORD *)this + 2) = 1;
  *(_QWORD *)this = off_1EA31F2D8;
}

_QWORD *CCConfigure::withPipeMonitor(uint64_t a1)
{
  _QWORD *v2;

  v2 = malloc_type_malloc(0x18uLL, 0xEE9A6C17uLL);
  v2[1] = 1;
  *v2 = off_1EA31F2D8;
  v2[2] = a1;
  (*(void (**)(uint64_t))(*(_QWORD *)a1 + 40))(a1);
  return v2;
}

BOOL CCConfigure::configure(uint64_t a1, const void *a2, uint64_t a3, uint64_t a4, __int128 *a5)
{
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  *((_QWORD *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v13 = 0xAAAAAAAAAAAAAA01;
  v6 = a1;
  v7 = 0u;
  v8 = 0u;
  v9 = a3;
  v10 = a4;
  v11 = 0;
  *(_QWORD *)&v12 = 0xAAAAAAAAAAAAAAAALL;
  if (a5)
    v12 = *a5;
  else
    v12 = 0uLL;
  return CCConfigure::applyConfiguration(a1, a2, (char *)&v6);
}

BOOL CCConfigure::applyConfiguration(uint64_t a1, CFTypeRef cf, char *a3)
{
  CFTypeID v6;
  CFTypeID TypeID;
  CFIndex Count;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  __int128 v13;
  const void **v14;
  const void **v15;
  uint64_t v16;
  const char *CStringPtr;
  NSObject *v18;
  const char *v19;
  __int128 v20;
  int v21;
  const char *v22;
  const void *v23;
  CFTypeID v24;
  const void *v25;
  CFTypeID v26;
  uint64_t v27;
  NSObject *v28;
  __int128 v29;
  uint64_t v30;
  CCDaemon *v31;
  NSObject *v32;
  __int128 v33;
  __int128 v34;
  const void **v36;
  const void **v37;
  CFTypeID v38;
  time_t v39;
  tm v40;
  uint8_t buf[16];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = CFGetTypeID(cf);
  TypeID = CFDictionaryGetTypeID();
  if (v6 != TypeID)
  {
    v11 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_53;
      *(_WORD *)buf = 0;
      v12 = v11;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_53;
      *(_WORD *)buf = 0;
      v12 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v12, OS_LOG_TYPE_ERROR, "CCConfigure::applyConfiguration Configuration type is not directory\n", buf, 2u);
LABEL_53:
    if (glog_fd)
    {
      *(_QWORD *)&v34 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v34 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v47 = v34;
      v48 = v34;
      v45 = v34;
      v46 = v34;
      v43 = v34;
      v44 = v34;
      *(_OWORD *)buf = v34;
      v42 = v34;
      memset(&v40, 0, sizeof(v40));
      v39 = 0xAAAAAAAAAAAAAAAALL;
      time(&v39);
      localtime_r(&v39, &v40);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v40);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "CCConfigure::applyConfiguration Configuration type is not directory\n");
    }
    return v6 == TypeID;
  }
  Count = CFDictionaryGetCount((CFDictionaryRef)cf);
  v9 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = Count;
    v10 = v9;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_11;
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = Count;
    v10 = MEMORY[0x1E0C81028];
  }
  _os_log_impl(&dword_1DB697000, v10, OS_LOG_TYPE_DEFAULT, "CCConfigure::configure keycount : %ld\n", buf, 0xCu);
LABEL_11:
  if (glog_fd)
  {
    *(_QWORD *)&v13 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v47 = v13;
    v48 = v13;
    v45 = v13;
    v46 = v13;
    v43 = v13;
    v44 = v13;
    *(_OWORD *)buf = v13;
    v42 = v13;
    memset(&v40, 0, sizeof(v40));
    v39 = 0xAAAAAAAAAAAAAAAALL;
    time(&v39);
    localtime_r(&v39, &v40);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v40);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCConfigure::configure keycount : %ld\n", Count);
  }
  if (Count)
  {
    v38 = v6;
    v14 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
    v15 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
    CFDictionaryGetKeysAndValues((CFDictionaryRef)cf, v14, v15);
    v36 = v14;
    v37 = v15;
    if (Count >= 1)
    {
      while (1)
      {
        *(_QWORD *)a3 = a1;
        *(_OWORD *)(a3 + 8) = 0u;
        *(_OWORD *)(a3 + 24) = 0u;
        a3[80] = 1;
        v16 = coreCaptureOsLog;
        if (coreCaptureOsLog)
        {
          if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
            goto LABEL_21;
          CStringPtr = CFStringGetCStringPtr((CFStringRef)*v14, 0);
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)&buf[4] = CStringPtr;
          v18 = v16;
        }
        else
        {
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            goto LABEL_21;
          v19 = CFStringGetCStringPtr((CFStringRef)*v14, 0);
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)&buf[4] = v19;
          v18 = MEMORY[0x1E0C81028];
        }
        _os_log_impl(&dword_1DB697000, v18, OS_LOG_TYPE_DEFAULT, "CCConfigure::configure key is %s\n", buf, 0xCu);
LABEL_21:
        if (glog_fd)
        {
          *(_QWORD *)&v20 = 0xAAAAAAAAAAAAAAAALL;
          *((_QWORD *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
          v47 = v20;
          v48 = v20;
          v45 = v20;
          v46 = v20;
          v43 = v20;
          v44 = v20;
          *(_OWORD *)buf = v20;
          v42 = v20;
          memset(&v40, 0, sizeof(v40));
          v39 = 0xAAAAAAAAAAAAAAAALL;
          time(&v39);
          localtime_r(&v39, &v40);
          strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v40);
          dprintf(glog_fd, "%s ", (const char *)buf);
          v21 = glog_fd;
          v22 = CFStringGetCStringPtr((CFStringRef)*v14, 0);
          dprintf(v21, "CCConfigure::configure key is %s\n", v22);
        }
        v23 = *v14;
        v24 = CFStringGetTypeID();
        if (!validCFObjectReference("CCConfigure::applyConfiguration", v23, v24))
          goto LABEL_56;
        v25 = *v15;
        v26 = CFDictionaryGetTypeID();
        if (!validCFObjectReference("CCConfigure::applyConfiguration", v25, v26))
          goto LABEL_56;
        if (CFStringCompare((CFStringRef)*v14, CFSTR("CCConfigureStream"), 0) == kCFCompareEqualTo)
          CFDictionaryApplyFunction((CFDictionaryRef)*v15, (CFDictionaryApplierFunction)CCConfigure::streamOwnerCFDictionaryApplier, a3);
        if (CFStringCompare((CFStringRef)*v14, CFSTR("CCConfigurePipe"), 0) == kCFCompareEqualTo)
          CFDictionaryApplyFunction((CFDictionaryRef)*v15, (CFDictionaryApplierFunction)CCConfigure::pipeOwnerCFDictionaryApplier, a3);
        if (CFStringCompare((CFStringRef)*v14, CFSTR("CCCaptureDirectory"), 0) == kCFCompareEqualTo)
          CFDictionaryApplyFunction((CFDictionaryRef)*v15, (CFDictionaryApplierFunction)CCConfigure::captureDictionaryCFDictionaryApplier, a3);
        if (CFStringCompare((CFStringRef)*v14, CFSTR("CCStart"), 0) == kCFCompareEqualTo)
        {
          v27 = coreCaptureOsLog;
          if (coreCaptureOsLog)
          {
            if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              v28 = v27;
              goto LABEL_37;
            }
          }
          else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v28 = MEMORY[0x1E0C81028];
LABEL_37:
            _os_log_impl(&dword_1DB697000, v28, OS_LOG_TYPE_DEFAULT, "CCConfigure::applyConfiguration CCSTART key \n", buf, 2u);
          }
          if (glog_fd)
          {
            *(_QWORD *)&v29 = 0xAAAAAAAAAAAAAAAALL;
            *((_QWORD *)&v29 + 1) = 0xAAAAAAAAAAAAAAAALL;
            v47 = v29;
            v48 = v29;
            v45 = v29;
            v46 = v29;
            v43 = v29;
            v44 = v29;
            *(_OWORD *)buf = v29;
            v42 = v29;
            memset(&v40, 0, sizeof(v40));
            v39 = 0xAAAAAAAAAAAAAAAALL;
            time(&v39);
            localtime_r(&v39, &v40);
            strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v40);
            dprintf(glog_fd, "%s ", (const char *)buf);
            dprintf(glog_fd, "CCConfigure::applyConfiguration CCSTART key \n");
          }
        }
        if (CFStringCompare((CFStringRef)*v14, CFSTR("CCStop"), 0) == kCFCompareEqualTo)
        {
          v30 = coreCaptureOsLog;
          if (coreCaptureOsLog)
          {
            v31 = (CCDaemon *)os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT);
            if ((_DWORD)v31)
            {
              *(_WORD *)buf = 0;
              v32 = v30;
              goto LABEL_46;
            }
          }
          else
          {
            v31 = (CCDaemon *)os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
            if ((_DWORD)v31)
            {
              *(_WORD *)buf = 0;
              v32 = MEMORY[0x1E0C81028];
LABEL_46:
              _os_log_impl(&dword_1DB697000, v32, OS_LOG_TYPE_DEFAULT, "CCConfigure::applyConfiguration CCSTOP key  \n", buf, 2u);
            }
          }
          if (glog_fd)
          {
            *(_QWORD *)&v33 = 0xAAAAAAAAAAAAAAAALL;
            *((_QWORD *)&v33 + 1) = 0xAAAAAAAAAAAAAAAALL;
            v47 = v33;
            v48 = v33;
            v45 = v33;
            v46 = v33;
            v43 = v33;
            v44 = v33;
            *(_OWORD *)buf = v33;
            v42 = v33;
            memset(&v40, 0, sizeof(v40));
            v39 = 0xAAAAAAAAAAAAAAAALL;
            time(&v39);
            localtime_r(&v39, &v40);
            strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v40);
            dprintf(glog_fd, "%s ", (const char *)buf);
            v31 = (CCDaemon *)dprintf(glog_fd, "CCConfigure::applyConfiguration CCSTOP key  \n");
          }
          CCDaemon::shutdown(v31);
        }
        ++v15;
        ++v14;
        if (!--Count)
          goto LABEL_56;
      }
    }
    if (v14)
LABEL_56:
      free(v36);
    v6 = v38;
    if (v37)
      free(v37);
  }
  return v6 == TypeID;
}

void CCConfigure::streamOwnerCFDictionaryApplier(const __CFString *this, const __CFDictionary *a2, _QWORD *a3, void *a4)
{
  CFTypeID TypeID;
  CFTypeID v8;
  const __CFString *v9;

  TypeID = CFStringGetTypeID();
  if (validCFObjectReference("CCConfigure::streamOwnerCFDictionaryApplier", this, TypeID))
  {
    v8 = CFDictionaryGetTypeID();
    if (validCFObjectReference("CCConfigure::streamOwnerCFDictionaryApplier", a2, v8))
    {
      a3[2] = this;
      v9 = (const __CFString *)a3[5];
      if (!v9 || CFStringCompare(this, v9, 0) == kCFCompareEqualTo)
        CFDictionaryApplyFunction(a2, (CFDictionaryApplierFunction)CCConfigure::streamPipeCFDictionaryApplier, a3);
    }
  }
}

void CCConfigure::pipeOwnerCFDictionaryApplier(const __CFString *this, const void *a2, _QWORD *a3, void *a4)
{
  CFTypeID TypeID;
  CFTypeID v8;
  uint64_t v9;
  NSObject *v10;
  __int128 v11;
  int v12;
  const char *CStringPtr;
  time_t v14;
  tm v15;
  uint8_t buf[16];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  TypeID = CFStringGetTypeID();
  if (!validCFObjectReference("CCConfigure::pipeOwnerCFDictionaryApplier", this, TypeID))
    return;
  v8 = CFDictionaryGetTypeID();
  if (!validCFObjectReference("CCConfigure::pipeOwnerCFDictionaryApplier", a2, v8))
    return;
  a3[2] = this;
  v9 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = CFStringGetCStringPtr(this, 0);
      v10 = v9;
LABEL_8:
      _os_log_impl(&dword_1DB697000, v10, OS_LOG_TYPE_DEFAULT, "CCConfigure::pipeOwnerCFDictionaryApplier Owner: %s\n", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = CFStringGetCStringPtr(this, 0);
    v10 = MEMORY[0x1E0C81028];
    goto LABEL_8;
  }
  if (glog_fd)
  {
    *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v22 = v11;
    v23 = v11;
    v20 = v11;
    v21 = v11;
    v18 = v11;
    v19 = v11;
    *(_OWORD *)buf = v11;
    v17 = v11;
    memset(&v15, 0, sizeof(v15));
    v14 = 0xAAAAAAAAAAAAAAAALL;
    time(&v14);
    localtime_r(&v14, &v15);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v15);
    dprintf(glog_fd, "%s ", (const char *)buf);
    v12 = glog_fd;
    CStringPtr = CFStringGetCStringPtr(this, 0);
    dprintf(v12, "CCConfigure::pipeOwnerCFDictionaryApplier Owner: %s\n", CStringPtr);
  }
  CFDictionaryApplyFunction((CFDictionaryRef)a2, (CFDictionaryApplierFunction)CCConfigure::pipePipeCFDictionaryApplier, a3);
}

void CCConfigure::captureDictionaryCFDictionaryApplier(const __CFString *this, const void *a2, _QWORD *a3, void *a4)
{
  CFTypeID TypeID;
  CFTypeID v8;
  uint64_t v9;
  NSObject *v10;
  __int128 v11;
  int v12;
  const char *CStringPtr;
  time_t v14;
  tm v15;
  uint8_t buf[16];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  TypeID = CFStringGetTypeID();
  if (!validCFObjectReference("CCConfigure::captureDictionaryCFDictionaryApplier", this, TypeID))
    return;
  v8 = CFDictionaryGetTypeID();
  if (!validCFObjectReference("CCConfigure::captureDictionaryCFDictionaryApplier", a2, v8))
    return;
  a3[1] = this;
  v9 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = CFStringGetCStringPtr(this, 0);
      v10 = v9;
LABEL_8:
      _os_log_impl(&dword_1DB697000, v10, OS_LOG_TYPE_DEFAULT, "CCConfigure::captureDictionaryCFDictionaryApplier dirName: %s\n", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = CFStringGetCStringPtr(this, 0);
    v10 = MEMORY[0x1E0C81028];
    goto LABEL_8;
  }
  if (glog_fd)
  {
    *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v22 = v11;
    v23 = v11;
    v20 = v11;
    v21 = v11;
    v18 = v11;
    v19 = v11;
    *(_OWORD *)buf = v11;
    v17 = v11;
    memset(&v15, 0, sizeof(v15));
    v14 = 0xAAAAAAAAAAAAAAAALL;
    time(&v14);
    localtime_r(&v14, &v15);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v15);
    dprintf(glog_fd, "%s ", (const char *)buf);
    v12 = glog_fd;
    CStringPtr = CFStringGetCStringPtr(this, 0);
    dprintf(v12, "CCConfigure::captureDictionaryCFDictionaryApplier dirName: %s\n", CStringPtr);
  }
  a3[2] = CFSTR("*");
  a3[3] = CFSTR("*");
  CFDictionaryApplyFunction((CFDictionaryRef)a2, (CFDictionaryApplierFunction)CCConfigure::captureDirectoryCFDictionaryApplier, a3);
}

uint64_t CCConfigure::captureDirectoryCFDictionaryApplier(const __CFString *this, const __CFString *a2, CFStringRef *a3, void *a4)
{
  uint64_t v7;
  const char *CStringPtr;
  NSObject *v9;
  const char *v10;
  __int128 v11;
  int v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  NSObject *v16;
  const char *v17;
  __int128 v18;
  int v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  NSObject *v23;
  const char *v24;
  __int128 v25;
  int v26;
  const char *v27;
  uint64_t v28;
  const char *v29;
  NSObject *v30;
  const char *v31;
  __int128 v32;
  int v33;
  const char *v34;
  CFTypeID TypeID;
  uint64_t result;
  CFTypeID v37;
  uint64_t v38;
  NSObject *v39;
  __int128 v40;
  time_t v41;
  tm v42;
  uint8_t buf[16];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v7 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    CStringPtr = CFStringGetCStringPtr(a3[2], 0);
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = CStringPtr;
    v9 = v7;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    v10 = CFStringGetCStringPtr(a3[2], 0);
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = v10;
    v9 = MEMORY[0x1E0C81028];
  }
  _os_log_impl(&dword_1DB697000, v9, OS_LOG_TYPE_DEFAULT, "CCConfigure::captureDirectoryCFDictionaryApplier Owner: %s\n", buf, 0xCu);
LABEL_7:
  if (glog_fd)
  {
    *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v49 = v11;
    v50 = v11;
    v47 = v11;
    v48 = v11;
    v45 = v11;
    v46 = v11;
    *(_OWORD *)buf = v11;
    v44 = v11;
    memset(&v42, 0, sizeof(v42));
    v41 = 0xAAAAAAAAAAAAAAAALL;
    time(&v41);
    localtime_r(&v41, &v42);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v42);
    dprintf(glog_fd, "%s ", (const char *)buf);
    v12 = glog_fd;
    v13 = CFStringGetCStringPtr(a3[2], 0);
    dprintf(v12, "CCConfigure::captureDirectoryCFDictionaryApplier Owner: %s\n", v13);
  }
  v14 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    v15 = CFStringGetCStringPtr(a3[3], 0);
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = v15;
    v16 = v14;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    v17 = CFStringGetCStringPtr(a3[3], 0);
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = v17;
    v16 = MEMORY[0x1E0C81028];
  }
  _os_log_impl(&dword_1DB697000, v16, OS_LOG_TYPE_DEFAULT, "CCConfigure::captureDirectoryCFDictionaryApplier Pipe: %s\n", buf, 0xCu);
LABEL_15:
  if (glog_fd)
  {
    *(_QWORD *)&v18 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v49 = v18;
    v50 = v18;
    v47 = v18;
    v48 = v18;
    v45 = v18;
    v46 = v18;
    *(_OWORD *)buf = v18;
    v44 = v18;
    memset(&v42, 0, sizeof(v42));
    v41 = 0xAAAAAAAAAAAAAAAALL;
    time(&v41);
    localtime_r(&v41, &v42);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v42);
    dprintf(glog_fd, "%s ", (const char *)buf);
    v19 = glog_fd;
    v20 = CFStringGetCStringPtr(a3[3], 0);
    dprintf(v19, "CCConfigure::captureDirectoryCFDictionaryApplier Pipe: %s\n", v20);
  }
  v21 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_23;
    v22 = CFStringGetCStringPtr(a3[1], 0);
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = v22;
    v23 = v21;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_23;
    v24 = CFStringGetCStringPtr(a3[1], 0);
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = v24;
    v23 = MEMORY[0x1E0C81028];
  }
  _os_log_impl(&dword_1DB697000, v23, OS_LOG_TYPE_DEFAULT, "CCConfigure::captureDirectoryCFDictionaryApplier dirName: %s\n", buf, 0xCu);
LABEL_23:
  if (glog_fd)
  {
    *(_QWORD *)&v25 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v25 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v49 = v25;
    v50 = v25;
    v47 = v25;
    v48 = v25;
    v45 = v25;
    v46 = v25;
    *(_OWORD *)buf = v25;
    v44 = v25;
    memset(&v42, 0, sizeof(v42));
    v41 = 0xAAAAAAAAAAAAAAAALL;
    time(&v41);
    localtime_r(&v41, &v42);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v42);
    dprintf(glog_fd, "%s ", (const char *)buf);
    v26 = glog_fd;
    v27 = CFStringGetCStringPtr(a3[1], 0);
    dprintf(v26, "CCConfigure::captureDirectoryCFDictionaryApplier dirName: %s\n", v27);
  }
  v28 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_31;
    v29 = CFStringGetCStringPtr(this, 0);
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = v29;
    v30 = v28;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_31;
    v31 = CFStringGetCStringPtr(this, 0);
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = v31;
    v30 = MEMORY[0x1E0C81028];
  }
  _os_log_impl(&dword_1DB697000, v30, OS_LOG_TYPE_DEFAULT, "CCConfigure::captureDirectoryCFDictionaryApplier Key: %s\n", buf, 0xCu);
LABEL_31:
  if (glog_fd)
  {
    *(_QWORD *)&v32 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v32 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v49 = v32;
    v50 = v32;
    v47 = v32;
    v48 = v32;
    v45 = v32;
    v46 = v32;
    *(_OWORD *)buf = v32;
    v44 = v32;
    memset(&v42, 0, sizeof(v42));
    v41 = 0xAAAAAAAAAAAAAAAALL;
    time(&v41);
    localtime_r(&v41, &v42);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v42);
    dprintf(glog_fd, "%s ", (const char *)buf);
    v33 = glog_fd;
    v34 = CFStringGetCStringPtr(this, 0);
    dprintf(v33, "CCConfigure::captureDirectoryCFDictionaryApplier Key: %s\n", v34);
  }
  TypeID = CFStringGetTypeID();
  result = validCFObjectReference("CCConfigure::captureDirectoryCFDictionaryApplier", this, TypeID);
  if ((_DWORD)result)
  {
    result = CFStringCompare(this, CFSTR("CaptureReason"), 0);
    if (!result)
    {
      v37 = CFStringGetTypeID();
      result = validCFObjectReference("CCConfigure::captureDirectoryCFDictionaryApplier", a2, v37);
      if ((_DWORD)result)
      {
        v38 = coreCaptureOsLog;
        if (coreCaptureOsLog)
        {
          if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v39 = v38;
LABEL_41:
            _os_log_impl(&dword_1DB697000, v39, OS_LOG_TYPE_DEFAULT, "CCConfigure::captureDirectoryCFDictionaryApplier capture\n", buf, 2u);
          }
        }
        else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v39 = MEMORY[0x1E0C81028];
          goto LABEL_41;
        }
        if (glog_fd)
        {
          *(_QWORD *)&v40 = 0xAAAAAAAAAAAAAAAALL;
          *((_QWORD *)&v40 + 1) = 0xAAAAAAAAAAAAAAAALL;
          v49 = v40;
          v50 = v40;
          v47 = v40;
          v48 = v40;
          v45 = v40;
          v46 = v40;
          *(_OWORD *)buf = v40;
          v44 = v40;
          memset(&v42, 0, sizeof(v42));
          v41 = 0xAAAAAAAAAAAAAAAALL;
          time(&v41);
          localtime_r(&v41, &v42);
          strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v42);
          dprintf(glog_fd, "%s ", (const char *)buf);
          dprintf(glog_fd, "CCConfigure::captureDirectoryCFDictionaryApplier capture\n");
        }
        return CCConfigure::captureDirectory((uint64_t)*a3, (uint64_t)a3, a2);
      }
    }
  }
  return result;
}

uint64_t CCConfigure::captureDirectory(uint64_t a1, uint64_t a2, const __CFString *a3)
{
  CFTypeID TypeID;
  uint64_t result;
  CFMutableStringRef MutableCopy;
  uint64_t v9;
  NSObject *v10;
  __int128 v11;
  time_t v12;
  tm v13;
  uint8_t buf[16];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  CFRange v23;

  v22 = *MEMORY[0x1E0C80C00];
  TypeID = CFStringGetTypeID();
  result = validCFObjectReference("CCConfigure::captureDirectory", a3, TypeID);
  if (!(_DWORD)result)
    return result;
  MutableCopy = CFStringCreateMutableCopy(0, 0, a3);
  v23.length = CFStringGetLength(MutableCopy);
  v23.location = 0;
  CFStringFindAndReplace(MutableCopy, CFSTR("/"), CFSTR("_"), v23, 0);
  if (CFStringGetLength(MutableCopy))
  {
    *((_QWORD *)&v15 + 1) = 0xAAAAAAAAAAAAAA00;
    *(_QWORD *)buf = MutableCopy;
    *(_QWORD *)&v13.tm_sec = 0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)&v13.tm_hour = 0xAAAAAAAAAAAAAAAALL;
    gettimeofday((timeval *)&v13, 0);
    *(_QWORD *)&buf[8] = *(_QWORD *)&v13.tm_sec;
    *(_QWORD *)&v15 = v13.tm_hour;
    CCPipeMonitor::forEachTapWithDirectory(*(CFDictionaryRef **)(a1 + 16), *(const __CFString **)(a2 + 8), (void (*)(CCTap *, void *))_captureTapCallback, buf);
    if (MutableCopy)
      CFRelease(MutableCopy);
    return BYTE8(v15) != 0;
  }
  v9 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v10 = v9;
LABEL_17:
      _os_log_error_impl(&dword_1DB697000, v10, OS_LOG_TYPE_ERROR, "CCConfigure::capture capture reason can not be NULL\n", buf, 2u);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v10 = MEMORY[0x1E0C81028];
    goto LABEL_17;
  }
  if (glog_fd)
  {
    *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v20 = v11;
    v21 = v11;
    v18 = v11;
    v19 = v11;
    v16 = v11;
    v17 = v11;
    *(_OWORD *)buf = v11;
    v15 = v11;
    memset(&v13, 0, sizeof(v13));
    v12 = 0xAAAAAAAAAAAAAAAALL;
    time(&v12);
    localtime_r(&v12, &v13);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v13);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCConfigure::capture capture reason can not be NULL\n");
  }
  if (MutableCopy)
    CFRelease(MutableCopy);
  return 0;
}

uint64_t _captureTapCallback(uint64_t result, char *a2)
{
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  NSObject *v6;
  __int128 v7;
  time_t v8;
  tm v9;
  uint8_t buf[16];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _OWORD buffer[8];
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v3 = result;
  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  buffer[7] = v4;
  v19 = v4;
  buffer[5] = v4;
  buffer[6] = v4;
  buffer[3] = v4;
  buffer[4] = v4;
  buffer[1] = v4;
  buffer[2] = v4;
  buffer[0] = v4;
  a2[24] = 1;
  CFStringGetCString(*(CFStringRef *)a2, (char *)buffer, 128, 0);
  v19 = *(_OWORD *)(a2 + 8);
  v5 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = buffer;
      v6 = v5;
LABEL_7:
      _os_log_impl(&dword_1DB697000, v6, OS_LOG_TYPE_DEFAULT, "CCConfigure::capture Reason: %s\n", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = buffer;
    v6 = MEMORY[0x1E0C81028];
    goto LABEL_7;
  }
  if (glog_fd)
  {
    *(_QWORD *)&v7 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v16 = v7;
    v17 = v7;
    v14 = v7;
    v15 = v7;
    v12 = v7;
    v13 = v7;
    *(_OWORD *)buf = v7;
    v11 = v7;
    memset(&v9, 0, sizeof(v9));
    v8 = 0xAAAAAAAAAAAAAAAALL;
    time(&v8);
    localtime_r(&v8, &v9);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v9);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCConfigure::capture Reason: %s\n", (const char *)buffer);
  }
  return (*(uint64_t (**)(uint64_t, _OWORD *))(*(_QWORD *)v3 + 88))(v3, buffer);
}

void CCConfigure::pipePipeCFDictionaryApplier(const __CFString *this, const void *a2, _QWORD *a3, void *a4)
{
  CFTypeID TypeID;
  CFTypeID v8;
  uint64_t v9;
  NSObject *v10;
  __int128 v11;
  int v12;
  const char *CStringPtr;
  time_t v14;
  tm v15;
  uint8_t buf[16];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  TypeID = CFStringGetTypeID();
  if (!validCFObjectReference("CCConfigure::pipePipeCFDictionaryApplier", this, TypeID))
    return;
  v8 = CFDictionaryGetTypeID();
  if (!validCFObjectReference("CCConfigure::pipePipeCFDictionaryApplier", a2, v8))
    return;
  a3[3] = this;
  a3[1] = CFSTR("*");
  v9 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = CFStringGetCStringPtr(this, 0);
      v10 = v9;
LABEL_8:
      _os_log_impl(&dword_1DB697000, v10, OS_LOG_TYPE_DEFAULT, "CCConfigure::pipePipeCFDictionaryApplier Pipe: %s\n", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = CFStringGetCStringPtr(this, 0);
    v10 = MEMORY[0x1E0C81028];
    goto LABEL_8;
  }
  if (glog_fd)
  {
    *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v22 = v11;
    v23 = v11;
    v20 = v11;
    v21 = v11;
    v18 = v11;
    v19 = v11;
    *(_OWORD *)buf = v11;
    v17 = v11;
    memset(&v15, 0, sizeof(v15));
    v14 = 0xAAAAAAAAAAAAAAAALL;
    time(&v14);
    localtime_r(&v14, &v15);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v15);
    dprintf(glog_fd, "%s ", (const char *)buf);
    v12 = glog_fd;
    CStringPtr = CFStringGetCStringPtr(this, 0);
    dprintf(v12, "CCConfigure::pipePipeCFDictionaryApplier Pipe: %s\n", CStringPtr);
  }
  CFDictionaryApplyFunction((CFDictionaryRef)a2, (CFDictionaryApplierFunction)CCConfigure::pipeConfigureCFDictionaryApplier, a3);
}

void CCConfigure::pipeConfigureCFDictionaryApplier(const __CFString *this, const __CFString *a2, CFStringRef *a3, void *a4)
{
  uint64_t v7;
  const char *CStringPtr;
  NSObject *v9;
  const char *v10;
  __int128 v11;
  int v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  NSObject *v16;
  const char *v17;
  __int128 v18;
  int v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  NSObject *v23;
  const char *v24;
  __int128 v25;
  int v26;
  const char *v27;
  CFTypeID TypeID;
  uint64_t v29;
  const char *v30;
  NSObject *v31;
  CFTypeID v32;
  uint64_t v33;
  NSObject *v34;
  CFTypeID v35;
  uint64_t v36;
  NSObject *v37;
  CFTypeID v38;
  uint64_t v39;
  NSObject *v40;
  CFTypeID v41;
  uint64_t v42;
  NSObject *v43;
  __int128 v44;
  CFTypeID v45;
  uint64_t v46;
  NSObject *v47;
  __int128 v48;
  __int128 v49;
  int v50;
  const char *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  const char *v55;
  time_t v56;
  tm v57;
  uint8_t buf[16];
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v7 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    CStringPtr = CFStringGetCStringPtr(a3[2], 0);
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = CStringPtr;
    v9 = v7;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    v10 = CFStringGetCStringPtr(a3[2], 0);
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = v10;
    v9 = MEMORY[0x1E0C81028];
  }
  _os_log_impl(&dword_1DB697000, v9, OS_LOG_TYPE_DEFAULT, "CCConfigure::pipeConfigureCFDictionaryApplier Owner: %s\n", buf, 0xCu);
LABEL_7:
  if (glog_fd)
  {
    *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v64 = v11;
    v65 = v11;
    v62 = v11;
    v63 = v11;
    v60 = v11;
    v61 = v11;
    *(_OWORD *)buf = v11;
    v59 = v11;
    memset(&v57, 0, sizeof(v57));
    v56 = 0xAAAAAAAAAAAAAAAALL;
    time(&v56);
    localtime_r(&v56, &v57);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v57);
    dprintf(glog_fd, "%s ", (const char *)buf);
    v12 = glog_fd;
    v13 = CFStringGetCStringPtr(a3[2], 0);
    dprintf(v12, "CCConfigure::pipeConfigureCFDictionaryApplier Owner: %s\n", v13);
  }
  v14 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    v15 = CFStringGetCStringPtr(a3[3], 0);
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = v15;
    v16 = v14;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    v17 = CFStringGetCStringPtr(a3[3], 0);
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = v17;
    v16 = MEMORY[0x1E0C81028];
  }
  _os_log_impl(&dword_1DB697000, v16, OS_LOG_TYPE_DEFAULT, "CCConfigure::pipeConfigureCFDictionaryApplier Pipe: %s\n", buf, 0xCu);
LABEL_15:
  if (glog_fd)
  {
    *(_QWORD *)&v18 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v64 = v18;
    v65 = v18;
    v62 = v18;
    v63 = v18;
    v60 = v18;
    v61 = v18;
    *(_OWORD *)buf = v18;
    v59 = v18;
    memset(&v57, 0, sizeof(v57));
    v56 = 0xAAAAAAAAAAAAAAAALL;
    time(&v56);
    localtime_r(&v56, &v57);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v57);
    dprintf(glog_fd, "%s ", (const char *)buf);
    v19 = glog_fd;
    v20 = CFStringGetCStringPtr(a3[3], 0);
    dprintf(v19, "CCConfigure::pipeConfigureCFDictionaryApplier Pipe: %s\n", v20);
  }
  v21 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_23;
    v22 = CFStringGetCStringPtr(this, 0);
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = v22;
    v23 = v21;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_23;
    v24 = CFStringGetCStringPtr(this, 0);
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = v24;
    v23 = MEMORY[0x1E0C81028];
  }
  _os_log_impl(&dword_1DB697000, v23, OS_LOG_TYPE_DEFAULT, "CCConfigure::pipeConfigureCFDictionaryApplier Key: %s\n", buf, 0xCu);
LABEL_23:
  if (glog_fd)
  {
    *(_QWORD *)&v25 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v25 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v64 = v25;
    v65 = v25;
    v62 = v25;
    v63 = v25;
    v60 = v25;
    v61 = v25;
    *(_OWORD *)buf = v25;
    v59 = v25;
    memset(&v57, 0, sizeof(v57));
    v56 = 0xAAAAAAAAAAAAAAAALL;
    time(&v56);
    localtime_r(&v56, &v57);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v57);
    dprintf(glog_fd, "%s ", (const char *)buf);
    v26 = glog_fd;
    v27 = CFStringGetCStringPtr(this, 0);
    dprintf(v26, "CCConfigure::pipeConfigureCFDictionaryApplier Key: %s\n", v27);
  }
  TypeID = CFStringGetTypeID();
  if (validCFObjectReference("CCConfigure::pipeConfigureCFDictionaryApplier", this, TypeID))
  {
    if (CFStringCompare(this, CFSTR("CaptureReason"), 0))
    {
      if (CFStringCompare(this, CFSTR("LogOptions"), 0))
      {
        if (CFStringCompare(this, CFSTR("NotifyTimeout"), 0))
        {
          if (CFStringCompare(this, CFSTR("WatermarkLevel"), 0))
          {
            if (CFStringCompare(this, CFSTR("Policy"), 0))
            {
              v29 = coreCaptureOsLog;
              if (coreCaptureOsLog)
              {
                if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
                  goto LABEL_67;
                v30 = CFStringGetCStringPtr(this, 0);
                *(_DWORD *)buf = 136315138;
                *(_QWORD *)&buf[4] = v30;
                v31 = v29;
              }
              else
              {
                if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                  goto LABEL_67;
                v55 = CFStringGetCStringPtr(this, 0);
                *(_DWORD *)buf = 136315138;
                *(_QWORD *)&buf[4] = v55;
                v31 = MEMORY[0x1E0C81028];
              }
              _os_log_error_impl(&dword_1DB697000, v31, OS_LOG_TYPE_ERROR, "CCConfigure::pipeConfigureCFDictionaryApplier Unsupported Key %s\n", buf, 0xCu);
LABEL_67:
              if (glog_fd)
              {
                *(_QWORD *)&v49 = 0xAAAAAAAAAAAAAAAALL;
                *((_QWORD *)&v49 + 1) = 0xAAAAAAAAAAAAAAAALL;
                v64 = v49;
                v65 = v49;
                v62 = v49;
                v63 = v49;
                v60 = v49;
                v61 = v49;
                *(_OWORD *)buf = v49;
                v59 = v49;
                memset(&v57, 0, sizeof(v57));
                v56 = 0xAAAAAAAAAAAAAAAALL;
                time(&v56);
                localtime_r(&v56, &v57);
                strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v57);
                dprintf(glog_fd, "%s ", (const char *)buf);
                v50 = glog_fd;
                v51 = CFStringGetCStringPtr(this, 0);
                dprintf(v50, "CCConfigure::pipeConfigureCFDictionaryApplier Unsupported Key %s\n", v51);
              }
              return;
            }
            v45 = CFNumberGetTypeID();
            if (!validCFObjectReference("CCConfigure::pipeConfigureCFDictionaryApplier", a2, v45))
              return;
            v46 = coreCaptureOsLog;
            if (coreCaptureOsLog)
            {
              if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                v47 = v46;
LABEL_83:
                _os_log_impl(&dword_1DB697000, v47, OS_LOG_TYPE_DEFAULT, "CCConfigure::pipeConfigureCFDictionaryApplier pipe policy\n", buf, 2u);
              }
            }
            else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              v47 = MEMORY[0x1E0C81028];
              goto LABEL_83;
            }
            if (glog_fd)
            {
              *(_QWORD *)&v54 = 0xAAAAAAAAAAAAAAAALL;
              *((_QWORD *)&v54 + 1) = 0xAAAAAAAAAAAAAAAALL;
              v64 = v54;
              v65 = v54;
              v62 = v54;
              v63 = v54;
              v60 = v54;
              v61 = v54;
              *(_OWORD *)buf = v54;
              v59 = v54;
              memset(&v57, 0, sizeof(v57));
              v56 = 0xAAAAAAAAAAAAAAAALL;
              time(&v56);
              localtime_r(&v56, &v57);
              strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v57);
              dprintf(glog_fd, "%s ", (const char *)buf);
              dprintf(glog_fd, "CCConfigure::pipeConfigureCFDictionaryApplier pipe policy\n");
            }
            CCConfigure::policy((uint64_t)*a3, (uint64_t)a3, a2);
            return;
          }
          v41 = CFNumberGetTypeID();
          if (!validCFObjectReference("CCConfigure::pipeConfigureCFDictionaryApplier", a2, v41))
            return;
          v42 = coreCaptureOsLog;
          if (coreCaptureOsLog)
          {
            if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              v43 = v42;
LABEL_77:
              _os_log_impl(&dword_1DB697000, v43, OS_LOG_TYPE_DEFAULT, "CCConfigure::pipeConfigureCFDictionaryApplier watermark level to notify\n", buf, 2u);
            }
          }
          else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v43 = MEMORY[0x1E0C81028];
            goto LABEL_77;
          }
          if (glog_fd)
          {
            *(_QWORD *)&v53 = 0xAAAAAAAAAAAAAAAALL;
            *((_QWORD *)&v53 + 1) = 0xAAAAAAAAAAAAAAAALL;
            v64 = v53;
            v65 = v53;
            v62 = v53;
            v63 = v53;
            v60 = v53;
            v61 = v53;
            *(_OWORD *)buf = v53;
            v59 = v53;
            memset(&v57, 0, sizeof(v57));
            v56 = 0xAAAAAAAAAAAAAAAALL;
            time(&v56);
            localtime_r(&v56, &v57);
            strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v57);
            dprintf(glog_fd, "%s ", (const char *)buf);
            dprintf(glog_fd, "CCConfigure::pipeConfigureCFDictionaryApplier watermark level to notify\n");
          }
          CCConfigure::watermarkLevel((uint64_t)*a3, (uint64_t)a3, a2);
          return;
        }
        v38 = CFNumberGetTypeID();
        if (!validCFObjectReference("CCConfigure::pipeConfigureCFDictionaryApplier", a2, v38))
          return;
        v39 = coreCaptureOsLog;
        if (coreCaptureOsLog)
        {
          if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v40 = v39;
LABEL_71:
            _os_log_impl(&dword_1DB697000, v40, OS_LOG_TYPE_DEFAULT, "CCConfigure::pipeConfigureCFDictionaryApplier notify timeout\n", buf, 2u);
          }
        }
        else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v40 = MEMORY[0x1E0C81028];
          goto LABEL_71;
        }
        if (glog_fd)
        {
          *(_QWORD *)&v52 = 0xAAAAAAAAAAAAAAAALL;
          *((_QWORD *)&v52 + 1) = 0xAAAAAAAAAAAAAAAALL;
          v64 = v52;
          v65 = v52;
          v62 = v52;
          v63 = v52;
          v60 = v52;
          v61 = v52;
          *(_OWORD *)buf = v52;
          v59 = v52;
          memset(&v57, 0, sizeof(v57));
          v56 = 0xAAAAAAAAAAAAAAAALL;
          time(&v56);
          localtime_r(&v56, &v57);
          strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v57);
          dprintf(glog_fd, "%s ", (const char *)buf);
          dprintf(glog_fd, "CCConfigure::pipeConfigureCFDictionaryApplier notify timeout\n");
        }
        CCConfigure::notifyTimeout((uint64_t)*a3, (uint64_t)a3, a2);
        return;
      }
      v35 = CFStringGetTypeID();
      if (!validCFObjectReference("CCConfigure::pipeConfigureCFDictionaryApplier", a2, v35))
        return;
      v36 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v37 = v36;
LABEL_62:
          _os_log_impl(&dword_1DB697000, v37, OS_LOG_TYPE_DEFAULT, "CCConfigure::pipeConfigureCFDictionaryApplier Configure Log Options\n", buf, 2u);
        }
      }
      else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v37 = MEMORY[0x1E0C81028];
        goto LABEL_62;
      }
      if (glog_fd)
      {
        *(_QWORD *)&v48 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v48 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v64 = v48;
        v65 = v48;
        v62 = v48;
        v63 = v48;
        v60 = v48;
        v61 = v48;
        *(_OWORD *)buf = v48;
        v59 = v48;
        memset(&v57, 0, sizeof(v57));
        v56 = 0xAAAAAAAAAAAAAAAALL;
        time(&v56);
        localtime_r(&v56, &v57);
        strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v57);
        dprintf(glog_fd, "%s ", (const char *)buf);
        dprintf(glog_fd, "CCConfigure::pipeConfigureCFDictionaryApplier Configure Log Options\n");
      }
      CCConfigure::configureLogOptions((uint64_t)*a3, (uint64_t)a3, a2);
      return;
    }
    v32 = CFStringGetTypeID();
    if (!validCFObjectReference("CCConfigure::pipeConfigureCFDictionaryApplier", a2, v32))
      return;
    v33 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v34 = v33;
LABEL_52:
        _os_log_impl(&dword_1DB697000, v34, OS_LOG_TYPE_DEFAULT, "CCConfigure::pipeConfigureCFDictionaryApplier capture\n", buf, 2u);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v34 = MEMORY[0x1E0C81028];
      goto LABEL_52;
    }
    if (glog_fd)
    {
      *(_QWORD *)&v44 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v44 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v64 = v44;
      v65 = v44;
      v62 = v44;
      v63 = v44;
      v60 = v44;
      v61 = v44;
      *(_OWORD *)buf = v44;
      v59 = v44;
      memset(&v57, 0, sizeof(v57));
      v56 = 0xAAAAAAAAAAAAAAAALL;
      time(&v56);
      localtime_r(&v56, &v57);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v57);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "CCConfigure::pipeConfigureCFDictionaryApplier capture\n");
    }
    CCConfigure::capture((uint64_t)*a3, (uint64_t)a3, a2);
  }
}

uint64_t CCConfigure::capture(uint64_t a1, uint64_t a2, const __CFString *a3)
{
  CFTypeID TypeID;
  uint64_t result;
  CFMutableStringRef MutableCopy;
  uint64_t v9;
  NSObject *v10;
  __int128 v11;
  time_t v12;
  tm v13;
  uint8_t buf[16];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  CFRange v23;

  v22 = *MEMORY[0x1E0C80C00];
  TypeID = CFStringGetTypeID();
  result = validCFObjectReference("CCConfigure::capture", a3, TypeID);
  if (!(_DWORD)result)
    return result;
  MutableCopy = CFStringCreateMutableCopy(0, 0, a3);
  v23.length = CFStringGetLength(MutableCopy);
  v23.location = 0;
  CFStringFindAndReplace(MutableCopy, CFSTR("/"), CFSTR("_"), v23, 0);
  if (CFStringGetLength(MutableCopy))
  {
    *((_QWORD *)&v15 + 1) = 0xAAAAAAAAAAAAAA00;
    *(_QWORD *)buf = MutableCopy;
    *(_QWORD *)&v13.tm_sec = 0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)&v13.tm_hour = 0xAAAAAAAAAAAAAAAALL;
    gettimeofday((timeval *)&v13, 0);
    *(_QWORD *)&buf[8] = *(_QWORD *)&v13.tm_sec;
    *(_QWORD *)&v15 = v13.tm_hour;
    CCPipeMonitor::forEachTapWithOwnerAndPipe(*(CFDictionaryRef **)(a1 + 16), *(const __CFString **)(a2 + 16), *(const __CFString **)(a2 + 24), (void (*)(CCTap *, void *))_captureTapCallback, buf);
    if (MutableCopy)
      CFRelease(MutableCopy);
    return BYTE8(v15) != 0;
  }
  v9 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v10 = v9;
LABEL_17:
      _os_log_error_impl(&dword_1DB697000, v10, OS_LOG_TYPE_ERROR, "CCConfigure::capture capture reason can not be NULL\n", buf, 2u);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v10 = MEMORY[0x1E0C81028];
    goto LABEL_17;
  }
  if (glog_fd)
  {
    *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v20 = v11;
    v21 = v11;
    v18 = v11;
    v19 = v11;
    v16 = v11;
    v17 = v11;
    *(_OWORD *)buf = v11;
    v15 = v11;
    memset(&v13, 0, sizeof(v13));
    v12 = 0xAAAAAAAAAAAAAAAALL;
    time(&v12);
    localtime_r(&v12, &v13);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v13);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCConfigure::capture capture reason can not be NULL\n");
  }
  if (MutableCopy)
    CFRelease(MutableCopy);
  return 0;
}

uint64_t CCConfigure::configureLogOptions(uint64_t a1, uint64_t a2, const __CFString *a3)
{
  CFStringRef *TapWithOwnerAndPipe;
  void *v6;
  uint64_t v7;
  __int128 v8;
  CFTypeID TypeID;
  uint64_t valid;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  NSObject *v14;
  __int128 v15;
  time_t v17;
  tm v18;
  _BYTE buf[32];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _OWORD v26[16];
  __int128 buffer;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  TapWithOwnerAndPipe = CCConfigure::findTapWithOwnerAndPipe(a1, a2);
  if (TapWithOwnerAndPipe)
  {
    if (v6)
    {
      v7 = (uint64_t)v6;
      *(_QWORD *)&v8 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v33 = v8;
      v34 = v8;
      v31 = v8;
      v32 = v8;
      v29 = v8;
      v30 = v8;
      buffer = v8;
      v28 = v8;
      TypeID = CFStringGetTypeID();
      valid = validCFObjectReference("CCConfigure::configureLogOptions", a3, TypeID);
      if ((_DWORD)valid)
      {
        CFStringGetCString(a3, (char *)&buffer, 128, 0);
        CCLogTap::configureLogOptions(v7, (uint64_t)&buffer);
      }
      return valid;
    }
  }
  *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v41 = v11;
  v42 = v11;
  v39 = v11;
  v40 = v11;
  v37 = v11;
  v38 = v11;
  v35 = v11;
  v36 = v11;
  v33 = v11;
  v34 = v11;
  v31 = v11;
  v32 = v11;
  v29 = v11;
  v30 = v11;
  buffer = v11;
  v28 = v11;
  CFStringGetCString(*(CFStringRef *)(a2 + 16), (char *)&buffer, 256, 0);
  *(_QWORD *)&v12 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v26[14] = v12;
  v26[15] = v12;
  v26[12] = v12;
  v26[13] = v12;
  v26[10] = v12;
  v26[11] = v12;
  v26[8] = v12;
  v26[9] = v12;
  v26[6] = v12;
  v26[7] = v12;
  v26[4] = v12;
  v26[5] = v12;
  v26[2] = v12;
  v26[3] = v12;
  v26[0] = v12;
  v26[1] = v12;
  CFStringGetCString(*(CFStringRef *)(a2 + 24), (char *)v26, 256, 0);
  v13 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = &buffer;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = v26;
      v14 = v13;
LABEL_10:
      _os_log_impl(&dword_1DB697000, v14, OS_LOG_TYPE_DEFAULT, "CCConfigure::configureOptions Not found the tap owner:%s, pipe: %s\n", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = &buffer;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = v26;
    v14 = MEMORY[0x1E0C81028];
    goto LABEL_10;
  }
  if (glog_fd)
  {
    *(_QWORD *)&v15 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v15 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v24 = v15;
    v25 = v15;
    v22 = v15;
    v23 = v15;
    v20 = v15;
    v21 = v15;
    *(_OWORD *)buf = v15;
    *(_OWORD *)&buf[16] = v15;
    memset(&v18, 0, sizeof(v18));
    v17 = 0xAAAAAAAAAAAAAAAALL;
    time(&v17);
    localtime_r(&v17, &v18);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v18);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "CCConfigure::configureOptions Not found the tap owner:%s, pipe: %s\n", (const char *)&buffer, (const char *)v26);
  }
  return 0;
}

uint64_t CCConfigure::notifyTimeout(uint64_t a1, uint64_t a2, const void *a3)
{
  CFStringRef *TapWithOwnerAndPipe;
  void *v5;
  uint64_t v6;
  CFTypeID TypeID;
  uint64_t valid;
  uint64_t v9;
  NSObject *v10;
  __int128 v11;
  time_t v13;
  tm v14;
  int valuePtr;
  uint8_t buf[16];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  TapWithOwnerAndPipe = CCConfigure::findTapWithOwnerAndPipe(a1, a2);
  if (!TapWithOwnerAndPipe)
    return 0;
  if (!v5)
    return 0;
  v6 = (uint64_t)v5;
  valuePtr = -1431655766;
  TypeID = CFNumberGetTypeID();
  valid = validCFObjectReference("CCConfigure::notifyTimeout", a3, TypeID);
  if ((_DWORD)valid)
  {
    CFNumberGetValue((CFNumberRef)a3, kCFNumberSInt32Type, &valuePtr);
    v9 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = valuePtr;
        v10 = v9;
LABEL_10:
        _os_log_impl(&dword_1DB697000, v10, OS_LOG_TYPE_DEFAULT, "CCConfigure::notifyTimeout notifyTimeout: %u\n", buf, 8u);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = valuePtr;
      v10 = MEMORY[0x1E0C81028];
      goto LABEL_10;
    }
    if (glog_fd)
    {
      *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v22 = v11;
      v23 = v11;
      v20 = v11;
      v21 = v11;
      v18 = v11;
      v19 = v11;
      *(_OWORD *)buf = v11;
      v17 = v11;
      memset(&v14, 0, sizeof(v14));
      v13 = 0xAAAAAAAAAAAAAAAALL;
      time(&v13);
      localtime_r(&v13, &v14);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v14);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "CCConfigure::notifyTimeout notifyTimeout: %u\n", valuePtr);
    }
    *(_DWORD *)buf = valuePtr;
    CCLogTap::setNotifyTimeout(v6, buf);
  }
  return valid;
}

uint64_t CCConfigure::watermarkLevel(uint64_t a1, uint64_t a2, const void *a3)
{
  CFStringRef *TapWithOwnerAndPipe;
  void *v5;
  uint64_t v6;
  CFTypeID TypeID;
  uint64_t valid;
  uint64_t v9;
  NSObject *v10;
  __int128 v11;
  time_t v13;
  tm v14;
  int valuePtr;
  uint8_t buf[16];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  TapWithOwnerAndPipe = CCConfigure::findTapWithOwnerAndPipe(a1, a2);
  if (!TapWithOwnerAndPipe)
    return 0;
  if (!v5)
    return 0;
  v6 = (uint64_t)v5;
  valuePtr = -1431655766;
  TypeID = CFNumberGetTypeID();
  valid = validCFObjectReference("CCConfigure::notifyTimeout", a3, TypeID);
  if ((_DWORD)valid)
  {
    CFNumberGetValue((CFNumberRef)a3, kCFNumberSInt32Type, &valuePtr);
    v9 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = valuePtr;
        v10 = v9;
LABEL_10:
        _os_log_impl(&dword_1DB697000, v10, OS_LOG_TYPE_DEFAULT, "CCConfigure::watermarkLevel watermarkLevel: %u\n", buf, 8u);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = valuePtr;
      v10 = MEMORY[0x1E0C81028];
      goto LABEL_10;
    }
    if (glog_fd)
    {
      *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v22 = v11;
      v23 = v11;
      v20 = v11;
      v21 = v11;
      v18 = v11;
      v19 = v11;
      *(_OWORD *)buf = v11;
      v17 = v11;
      memset(&v14, 0, sizeof(v14));
      v13 = 0xAAAAAAAAAAAAAAAALL;
      time(&v13);
      localtime_r(&v13, &v14);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v14);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "CCConfigure::watermarkLevel watermarkLevel: %u\n", valuePtr);
    }
    *(_DWORD *)buf = valuePtr;
    CCLogTap::setWatermarkLevel(v6, buf);
  }
  return valid;
}

uint64_t CCConfigure::policy(uint64_t a1, uint64_t a2, const void *a3)
{
  CFStringRef *TapWithOwnerAndPipe;
  void *v5;
  uint64_t v6;
  CFTypeID TypeID;
  uint64_t valid;
  uint64_t v9;
  NSObject *v10;
  __int128 v11;
  time_t v13;
  tm v14;
  int valuePtr;
  uint8_t buf[16];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  TapWithOwnerAndPipe = CCConfigure::findTapWithOwnerAndPipe(a1, a2);
  if (!TapWithOwnerAndPipe)
    return 0;
  if (!v5)
    return 0;
  v6 = (uint64_t)v5;
  valuePtr = -1431655766;
  TypeID = CFNumberGetTypeID();
  valid = validCFObjectReference("CCConfigure::policy", a3, TypeID);
  if ((_DWORD)valid)
  {
    CFNumberGetValue((CFNumberRef)a3, kCFNumberSInt32Type, &valuePtr);
    v9 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = valuePtr;
        v10 = v9;
LABEL_10:
        _os_log_impl(&dword_1DB697000, v10, OS_LOG_TYPE_DEFAULT, "CCConfigure::policy policy: %u\n", buf, 8u);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = valuePtr;
      v10 = MEMORY[0x1E0C81028];
      goto LABEL_10;
    }
    if (glog_fd)
    {
      *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v22 = v11;
      v23 = v11;
      v20 = v11;
      v21 = v11;
      v18 = v11;
      v19 = v11;
      *(_OWORD *)buf = v11;
      v17 = v11;
      memset(&v14, 0, sizeof(v14));
      v13 = 0xAAAAAAAAAAAAAAAALL;
      time(&v13);
      localtime_r(&v13, &v14);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v14);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "CCConfigure::policy policy: %u\n", valuePtr);
    }
    *(_DWORD *)buf = valuePtr;
    CCLogTap::setPolicy(v6, buf);
  }
  return valid;
}

CFStringRef *CCConfigure::findTapWithOwnerAndPipe(uint64_t a1, uint64_t a2)
{
  CFStringRef *TapWithOwnerAndPipe;
  __int128 v4;
  __int128 v5;
  uint64_t v6;
  NSObject *v7;
  __int128 v8;
  time_t v10;
  tm v11;
  _BYTE buf[32];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _OWORD v19[16];
  _OWORD buffer[16];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  TapWithOwnerAndPipe = CCPipeMonitor::findTapWithOwnerAndPipe(*(CFDictionaryRef **)(a1 + 16), *(const __CFString **)(a2 + 16), *(const __CFString **)(a2 + 24));
  if (!TapWithOwnerAndPipe)
    return TapWithOwnerAndPipe;
  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  buffer[14] = v4;
  buffer[15] = v4;
  buffer[12] = v4;
  buffer[13] = v4;
  buffer[10] = v4;
  buffer[11] = v4;
  buffer[8] = v4;
  buffer[9] = v4;
  buffer[6] = v4;
  buffer[7] = v4;
  buffer[4] = v4;
  buffer[5] = v4;
  buffer[2] = v4;
  buffer[3] = v4;
  buffer[0] = v4;
  buffer[1] = v4;
  CFStringGetCString(*(CFStringRef *)(a2 + 16), (char *)buffer, 256, 0);
  *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v19[14] = v5;
  v19[15] = v5;
  v19[12] = v5;
  v19[13] = v5;
  v19[10] = v5;
  v19[11] = v5;
  v19[8] = v5;
  v19[9] = v5;
  v19[6] = v5;
  v19[7] = v5;
  v19[4] = v5;
  v19[5] = v5;
  v19[2] = v5;
  v19[3] = v5;
  v19[0] = v5;
  v19[1] = v5;
  CFStringGetCString(*(CFStringRef *)(a2 + 24), (char *)v19, 256, 0);
  v6 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_8;
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = buffer;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = v19;
    v7 = v6;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_8;
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = buffer;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = v19;
    v7 = MEMORY[0x1E0C81028];
  }
  _os_log_impl(&dword_1DB697000, v7, OS_LOG_TYPE_DEFAULT, "CCConfigure::findTapWithOwnerAndPipe  found CCTap, Owner: %s, Pipe: %s\n", buf, 0x16u);
LABEL_8:
  if (glog_fd)
  {
    *(_QWORD *)&v8 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v17 = v8;
    v18 = v8;
    v15 = v8;
    v16 = v8;
    v13 = v8;
    v14 = v8;
    *(_OWORD *)buf = v8;
    *(_OWORD *)&buf[16] = v8;
    memset(&v11, 0, sizeof(v11));
    v10 = 0xAAAAAAAAAAAAAAAALL;
    time(&v10);
    localtime_r(&v10, &v11);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v11);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "CCConfigure::findTapWithOwnerAndPipe  found CCTap, Owner: %s, Pipe: %s\n", (const char *)buffer, (const char *)v19);
  }
  return TapWithOwnerAndPipe;
}

void CCConfigure::streamPipeCFDictionaryApplier(const __CFString *this, const __CFDictionary *a2, _QWORD *a3, void *a4)
{
  CFTypeID TypeID;
  CFTypeID v8;
  const __CFString *v9;

  TypeID = CFStringGetTypeID();
  if (validCFObjectReference("CCConfigure::streamPipeCFDictionaryApplier", this, TypeID))
  {
    v8 = CFDictionaryGetTypeID();
    if (validCFObjectReference("CCConfigure::streamPipeCFDictionaryApplier", a2, v8))
    {
      a3[3] = this;
      v9 = (const __CFString *)a3[6];
      if (!v9 || CFStringCompare(this, v9, 0) == kCFCompareEqualTo)
        CFDictionaryApplyFunction(a2, (CFDictionaryApplierFunction)CCConfigure::streamStreamCFDictionaryApplier, a3);
    }
  }
}

void CCConfigure::streamStreamCFDictionaryApplier(CCConfigure *this, const __CFDictionary *a2, _QWORD *a3, void *a4)
{
  CFTypeID TypeID;
  CFTypeID v8;

  TypeID = CFStringGetTypeID();
  if (validCFObjectReference("CCConfigure::streamStreamCFDictionaryApplier", this, TypeID))
  {
    v8 = CFDictionaryGetTypeID();
    if (validCFObjectReference("CCConfigure::streamStreamCFDictionaryApplier", a2, v8))
    {
      a3[4] = this;
      CFDictionaryApplyFunction(a2, (CFDictionaryApplierFunction)CCConfigure::streamConfigureCFDictionaryApplier, a3);
    }
  }
}

void CCConfigure::streamConfigureCFDictionaryApplier(const __CFString *this, const __CFDictionary *a2, void *a3, void *a4)
{
  CFTypeID TypeID;
  CFTypeID v8;
  void (__cdecl *v9)(const void *, const void *, void *);

  TypeID = CFStringGetTypeID();
  if (validCFObjectReference("CCConfigure::streamConfigureCFDictionaryApplier", this, TypeID))
  {
    v8 = CFDictionaryGetTypeID();
    if (validCFObjectReference("CCConfigure::streamConfigureCFDictionaryApplier", a2, v8))
    {
      if (CFStringCompare(this, CFSTR("CoreCapture"), 0))
      {
        if (CFStringCompare(this, CFSTR("Console"), 0))
          return;
        v9 = (void (__cdecl *)(const void *, const void *, void *))CCConfigure::streamConfigureConsoleCFDictionaryApplier;
      }
      else
      {
        v9 = (void (__cdecl *)(const void *, const void *, void *))CCConfigure::streamConfigureCoreCaptureCFDictionaryApplier;
      }
      CFDictionaryApplyFunction(a2, v9, a3);
    }
  }
}

uint64_t CCConfigure::streamConfigureCoreCaptureCFDictionaryApplier(const __CFString *this, const void *a2, uint64_t *a3, void *a4)
{
  CFTypeID TypeID;
  uint64_t result;
  CFTypeID v9;

  TypeID = CFStringGetTypeID();
  result = validCFObjectReference("CCConfigure::streamConfigureCoreCaptureCFDictionaryApplier", this, TypeID);
  if ((_DWORD)result)
  {
    v9 = CFNumberGetTypeID();
    result = validCFObjectReference("CCConfigure::streamConfigureCoreCaptureCFDictionaryApplier", a2, v9);
    if ((_DWORD)result)
    {
      if (CFStringCompare(this, CFSTR("LogFlags"), 0))
      {
        result = CFStringCompare(this, CFSTR("LogLevel"), 0);
        if (!result)
          return CCConfigure::setLevel(*a3, (uint64_t)a3, a2);
      }
      else
      {
        return CCConfigure::setFlags(*a3, (uint64_t)a3, a2);
      }
    }
  }
  return result;
}

uint64_t CCConfigure::streamConfigureConsoleCFDictionaryApplier(const __CFString *this, const void *a2, uint64_t *a3, void *a4)
{
  CFTypeID TypeID;
  uint64_t result;
  CFTypeID v9;

  TypeID = CFStringGetTypeID();
  result = validCFObjectReference("CCConfigure::streamConfigureConsoleCFDictionaryApplier", this, TypeID);
  if ((_DWORD)result)
  {
    v9 = CFNumberGetTypeID();
    result = validCFObjectReference("CCConfigure::streamConfigureConsoleCFDictionaryApplier", a2, v9);
    if ((_DWORD)result)
    {
      if (CFStringCompare(this, CFSTR("LogFlags"), 0))
      {
        result = CFStringCompare(this, CFSTR("LogLevel"), 0);
        if (!result)
          return CCConfigure::setConsoleLevel(*a3, (uint64_t)a3, a2);
      }
      else
      {
        return CCConfigure::setConsoleFlags(*a3, (uint64_t)a3, a2);
      }
    }
  }
  return result;
}

uint64_t CCConfigure::setConsoleFlags(uint64_t a1, uint64_t a2, const void *a3)
{
  CFTypeID TypeID;
  uint64_t result;
  uint64_t v8;
  __int128 v9;
  unint64_t valuePtr;
  char buffer[16];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  unint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  TypeID = CFNumberGetTypeID();
  result = validCFObjectReference("CCConfigure::setConsoleFlags", a3, TypeID);
  if ((_DWORD)result)
  {
    valuePtr = 0xAAAAAAAAAAAAAAAALL;
    CFNumberGetValue((CFNumberRef)a3, kCFNumberSInt64Type, &valuePtr);
    result = (uint64_t)CCConfigure::findTapWithOwnerAndPipe(a1, a2);
    if (result)
    {
      if (result)
      {
        v8 = result;
        v27 = 0xAAAAAAAAAAAAAAAALL;
        *(_QWORD *)&v9 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v25 = v9;
        v26 = v9;
        v23 = v9;
        v24 = v9;
        v21 = v9;
        v22 = v9;
        v19 = v9;
        v20 = v9;
        v17 = v9;
        v18 = v9;
        v15 = v9;
        v16 = v9;
        v13 = v9;
        v14 = v9;
        *(_OWORD *)buffer = v9;
        v12 = v9;
        CFStringGetCString(*(CFStringRef *)(a2 + 32), buffer, 256, 0);
        v27 = valuePtr;
        CCLogTap::setConsoleLogFlags(v8, buffer);
        return 1;
      }
    }
  }
  return result;
}

uint64_t CCConfigure::setConsoleLevel(uint64_t a1, uint64_t a2, const void *a3)
{
  CFTypeID TypeID;
  uint64_t result;
  uint64_t v8;
  __int128 v9;
  int valuePtr;
  char buffer[16];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  TypeID = CFNumberGetTypeID();
  result = validCFObjectReference("CCConfigure::setConsoleLevel", a3, TypeID);
  if ((_DWORD)result)
  {
    valuePtr = -1431655766;
    CFNumberGetValue((CFNumberRef)a3, kCFNumberSInt32Type, &valuePtr);
    result = (uint64_t)CCConfigure::findTapWithOwnerAndPipe(a1, a2);
    if (result)
    {
      if (result)
      {
        v8 = result;
        v27 = -1431655766;
        *(_QWORD *)&v9 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v25 = v9;
        v26 = v9;
        v23 = v9;
        v24 = v9;
        v21 = v9;
        v22 = v9;
        v19 = v9;
        v20 = v9;
        v17 = v9;
        v18 = v9;
        v15 = v9;
        v16 = v9;
        v13 = v9;
        v14 = v9;
        *(_OWORD *)buffer = v9;
        v12 = v9;
        CFStringGetCString(*(CFStringRef *)(a2 + 32), buffer, 256, 0);
        v27 = valuePtr;
        CCLogTap::setConsoleLogLevel(v8, buffer);
        return 1;
      }
    }
  }
  return result;
}

uint64_t CCConfigure::setFlags(uint64_t a1, uint64_t a2, const void *a3)
{
  CFStringRef *TapWithOwnerAndPipe;
  void *v6;
  CFTypeID v7;
  _BOOL8 v8;
  __int128 v9;
  CFTypeID v10;
  CFIndex Count;
  CFIndex v12;
  CFIndex v13;
  const void *ValueAtIndex;
  CFTypeID v15;
  const __CFString *v16;
  const char *CStringPtr;
  int v18;
  const char *v19;
  unint64_t valuePtr;
  char buffer[520];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  TapWithOwnerAndPipe = CCConfigure::findTapWithOwnerAndPipe(a1, a2);
  if (TapWithOwnerAndPipe)
  else
    v6 = 0;
  v7 = CFGetTypeID(a3);
  if (v7 == CFNumberGetTypeID())
  {
    valuePtr = 0xAAAAAAAAAAAAAAAALL;
    CFNumberGetValue((CFNumberRef)a3, kCFNumberSInt64Type, &valuePtr);
    v8 = v6 != 0;
    if (v6)
    {
      *(_QWORD *)&buffer[256] = 0xAAAAAAAAAAAAAAAALL;
      *(_QWORD *)&v9 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)&buffer[224] = v9;
      *(_OWORD *)&buffer[240] = v9;
      *(_OWORD *)&buffer[192] = v9;
      *(_OWORD *)&buffer[208] = v9;
      *(_OWORD *)&buffer[160] = v9;
      *(_OWORD *)&buffer[176] = v9;
      *(_OWORD *)&buffer[128] = v9;
      *(_OWORD *)&buffer[144] = v9;
      *(_OWORD *)&buffer[96] = v9;
      *(_OWORD *)&buffer[112] = v9;
      *(_OWORD *)&buffer[64] = v9;
      *(_OWORD *)&buffer[80] = v9;
      *(_OWORD *)&buffer[32] = v9;
      *(_OWORD *)&buffer[48] = v9;
      *(_OWORD *)buffer = v9;
      *(_OWORD *)&buffer[16] = v9;
      CFStringGetCString(*(CFStringRef *)(a2 + 32), buffer, 256, 0);
      *(_QWORD *)&buffer[256] = valuePtr;
      CCLogTap::setLogFlags((uint64_t)v6, buffer);
    }
    return v8;
  }
  v10 = CFGetTypeID(a3);
  if (v10 != CFArrayGetTypeID())
    return 0;
  Count = CFArrayGetCount((CFArrayRef)a3);
  v8 = 1;
  if (Count >= 1)
  {
    v12 = Count;
    v13 = 0;
    while (1)
    {
      ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)a3, v13);
      v15 = CFGetTypeID(ValueAtIndex);
      if (v15 == CFStringGetTypeID())
      {
        v16 = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)a3, v13);
        CStringPtr = CFStringGetCStringPtr(v16, 0);
        memset(buffer, 170, 0x204uLL);
        CFStringGetCString(*(CFStringRef *)(a2 + 32), buffer, 256, 0);
        *(_DWORD *)&buffer[512] = 1;
        v18 = *(unsigned __int8 *)CStringPtr;
        if (v18 == 43)
        {
          v19 = CStringPtr + 1;
        }
        else
        {
          if (v18 == 45)
          {
            strlcpy(&buffer[256], CStringPtr + 1, 0x100uLL);
            *(_DWORD *)&buffer[512] = 2;
            if (!v6)
              goto LABEL_19;
LABEL_18:
            CCLogTap::updateLogFlags((uint64_t)v6, buffer);
            goto LABEL_19;
          }
          v19 = CStringPtr;
        }
        strlcpy(&buffer[256], v19, 0x100uLL);
        if (v6)
          goto LABEL_18;
      }
LABEL_19:
      if (v12 == ++v13)
        return 1;
    }
  }
  return v8;
}

uint64_t CCConfigure::setLevel(uint64_t a1, uint64_t a2, const void *a3)
{
  CFTypeID TypeID;
  uint64_t result;
  uint64_t v8;
  __int128 v9;
  int valuePtr;
  char buffer[16];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  TypeID = CFNumberGetTypeID();
  result = validCFObjectReference("CCConfigure::setLevel", a3, TypeID);
  if ((_DWORD)result)
  {
    valuePtr = -1431655766;
    CFNumberGetValue((CFNumberRef)a3, kCFNumberSInt32Type, &valuePtr);
    result = (uint64_t)CCConfigure::findTapWithOwnerAndPipe(a1, a2);
    if (result)
    {
      if (result)
      {
        v8 = result;
        v27 = -1431655766;
        *(_QWORD *)&v9 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v25 = v9;
        v26 = v9;
        v23 = v9;
        v24 = v9;
        v21 = v9;
        v22 = v9;
        v19 = v9;
        v20 = v9;
        v17 = v9;
        v18 = v9;
        v15 = v9;
        v16 = v9;
        v13 = v9;
        v14 = v9;
        *(_OWORD *)buffer = v9;
        v12 = v9;
        CFStringGetCString(*(CFStringRef *)(a2 + 32), buffer, 256, 0);
        v27 = valuePtr;
        CCLogTap::setLogLevel(v8, buffer);
        return 1;
      }
    }
  }
  return result;
}

void CCConfigure::profileLoaded(CFDictionaryRef **this)
{
  CCPipeMonitor::profileLoaded(this[2]);
}

void CCConfigure::profileRemoved(CFDictionaryRef **this)
{
  CCPipeMonitor::profileRemoved(this[2]);
}

void CCOSSerializeFormatter::~CCOSSerializeFormatter(void *this)
{
  if (this)
    free(this);
}

CFIndex CCOSSerializeFormatter::writeLog(uint64_t a1, uint64_t a2, const void *a3, size_t a4, const void *a5, size_t a6)
{
  char *v11;
  CFTypeRef v12;
  const void *v13;
  CFTypeID v14;
  const void *v15;
  const UInt8 *BytePtr;
  const UInt8 *v17;
  CFIndex Length;
  uint64_t v19;
  CFIndex v20;
  uint64_t v21;
  const char *CStringPtr;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  __int128 v26;
  int v27;
  const char *v28;
  __int128 v29;
  uint64_t v30;
  NSObject *v31;
  __int128 v32;
  uint64_t v34;
  NSObject *v35;
  __int128 v36;
  const char *v37;
  time_t v38;
  tm v39;
  CFStringRef errorString;
  _BYTE buf[32];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  if (a5)
  {
    v11 = (char *)malloc_type_malloc(a6 + a4, 0x56CD9DDDuLL);
    memcpy(v11, a3, a4);
    memcpy(&v11[a4], a5, a6);
    a3 = v11;
  }
  else
  {
    v11 = 0;
  }
  errorString = (CFStringRef)0xAAAAAAAAAAAAAAAALL;
  v12 = IOCFUnserialize((const char *)a3, (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, &errorString);
  v13 = v12;
  if (!v12)
  {
    v21 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
      {
        CStringPtr = CFStringGetCStringPtr(errorString, 0);
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = CStringPtr;
        v23 = v21;
LABEL_47:
        _os_log_error_impl(&dword_1DB697000, v23, OS_LOG_TYPE_ERROR, "Error: %s", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v37 = CFStringGetCStringPtr(errorString, 0);
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = v37;
      v23 = MEMORY[0x1E0C81028];
      goto LABEL_47;
    }
    if (glog_fd)
    {
      *(_QWORD *)&v26 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v26 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v46 = v26;
      v47 = v26;
      v44 = v26;
      v45 = v26;
      v42 = v26;
      v43 = v26;
      *(_OWORD *)buf = v26;
      *(_OWORD *)&buf[16] = v26;
      memset(&v39, 0, sizeof(v39));
      v38 = 0xAAAAAAAAAAAAAAAALL;
      time(&v38);
      localtime_r(&v38, &v39);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v39);
      dprintf(glog_fd, "%s ", buf);
      v27 = glog_fd;
      v28 = CFStringGetCStringPtr(errorString, 0);
      dprintf(v27, "Error: %s", v28);
    }
    v15 = 0;
    goto LABEL_30;
  }
  v14 = CFGetTypeID(v12);
  if (v14 != CFArrayGetTypeID())
  {
    v24 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v25 = v24;
LABEL_49:
        _os_log_error_impl(&dword_1DB697000, v25, OS_LOG_TYPE_ERROR, "CCOSSerializeFormatter::writeLog unsupported root type for JSON Serialization", buf, 2u);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v25 = MEMORY[0x1E0C81028];
      goto LABEL_49;
    }
    if (glog_fd)
    {
      *(_QWORD *)&v29 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v29 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v46 = v29;
      v47 = v29;
      v44 = v29;
      v45 = v29;
      v42 = v29;
      v43 = v29;
      *(_OWORD *)buf = v29;
      *(_OWORD *)&buf[16] = v29;
      memset(&v39, 0, sizeof(v39));
      v38 = 0xAAAAAAAAAAAAAAAALL;
      time(&v38);
      localtime_r(&v38, &v39);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v39);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "CCOSSerializeFormatter::writeLog unsupported root type for JSON Serialization");
    }
    v15 = 0;
LABEL_24:
    v30 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_28;
      *(_WORD *)buf = 0;
      v31 = v30;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_28;
      *(_WORD *)buf = 0;
      v31 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v31, OS_LOG_TYPE_ERROR, "CCOSSerializeFormatter::writeLog CFDataGetBytePtr() failed", buf, 2u);
LABEL_28:
    if (glog_fd)
    {
      *(_QWORD *)&v32 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v32 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v46 = v32;
      v47 = v32;
      v44 = v32;
      v45 = v32;
      v42 = v32;
      v43 = v32;
      *(_OWORD *)buf = v32;
      *(_OWORD *)&buf[16] = v32;
      memset(&v39, 0, sizeof(v39));
      v38 = 0xAAAAAAAAAAAAAAAALL;
      time(&v38);
      localtime_r(&v38, &v39);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v39);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "CCOSSerializeFormatter::writeLog CFDataGetBytePtr() failed");
    }
LABEL_30:
    v20 = 0;
    goto LABEL_31;
  }
  v15 = (const void *)objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v13, 1, 0);
  CFRetain(v15);
  if (!v15)
    goto LABEL_24;
  BytePtr = CFDataGetBytePtr((CFDataRef)v15);
  if (!BytePtr)
    goto LABEL_24;
  v17 = BytePtr;
  Length = CFDataGetLength((CFDataRef)v15);
  v19 = (*(uint64_t (**)(uint64_t, const UInt8 *, CFIndex))(*(_QWORD *)a1 + 112))(a1, v17, Length);
  if (v19 == Length)
  {
    v20 = Length;
    goto LABEL_31;
  }
  v20 = v19;
  v34 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
      goto LABEL_42;
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)&buf[4] = Length;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v20;
    v35 = v34;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_42;
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)&buf[4] = Length;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v20;
    v35 = MEMORY[0x1E0C81028];
  }
  _os_log_error_impl(&dword_1DB697000, v35, OS_LOG_TYPE_ERROR, "CCOSSerializeFormatter::writeLog Failed to write(1) dsize=%lu, tempLength=%lu\n", buf, 0x16u);
LABEL_42:
  if (glog_fd)
  {
    *(_QWORD *)&v36 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v36 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v46 = v36;
    v47 = v36;
    v44 = v36;
    v45 = v36;
    v42 = v36;
    v43 = v36;
    *(_OWORD *)buf = v36;
    *(_OWORD *)&buf[16] = v36;
    memset(&v39, 0, sizeof(v39));
    v38 = 0xAAAAAAAAAAAAAAAALL;
    time(&v38);
    localtime_r(&v38, &v39);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v39);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "CCOSSerializeFormatter::writeLog Failed to write(1) dsize=%lu, tempLength=%lu\n", Length, v20);
  }
LABEL_31:
  if (v11)
    free(v11);
  if (v15)
    CFRelease(v15);
  if (v13)
    CFRelease(v13);
  return v20;
}

uint64_t CCOSSerializeFormatter::writeCommentEntry()
{
  return 0;
}

const char *CCOSSerializeFormatter::getFormatterFileExtension(CCOSSerializeFormatter *this)
{
  return "json";
}

uint64_t CCOSSerializeFormatter::initWithRegistryEntry(CCOSSerializeFormatter *this, io_object_t object)
{
  *((_DWORD *)this + 8) = object;
  IOObjectRetain(object);
  *((_DWORD *)this + 3) = object;
  return 1;
}

char *CCOSSerializeFormatter::withRegistryEntry(CCOSSerializeFormatter *this)
{
  io_object_t v1;
  char *v2;

  v1 = this;
  v2 = (char *)malloc_type_malloc(0x28uLL, 0xEE9A6C17uLL);
  *(_OWORD *)(v2 + 8) = 0u;
  *(_OWORD *)(v2 + 24) = 0u;
  *((_DWORD *)v2 + 2) = 1;
  *(_QWORD *)v2 = off_1EA31F340;
  *((_DWORD *)v2 + 8) = v1;
  IOObjectRetain(v1);
  *((_DWORD *)v2 + 3) = v1;
  return v2;
}

uint64_t CCOSSerializeFormatter::writeLogPayload(CCOSSerializeFormatter *this, const char *a2)
{
  return (*(uint64_t (**)(CCOSSerializeFormatter *, const char *))(*(_QWORD *)this + 112))(this, a2);
}

uint64_t CCDaemon::init(CCDaemon *this)
{
  __int128 v2;
  __CFString *MutableCopy;
  __CFString *v4;
  dispatch_source_t v5;
  NSObject *v6;
  dispatch_time_t v7;
  NSObject *v8;
  const __CFDictionary *v9;
  uint64_t v10;
  __CFDictionary *v11;
  CFIndex Count;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  __int128 v19;
  CFIndex v20;
  __int128 v21;
  int v22;
  CFIndex v23;
  CCPipeMonitor *v24;
  const void *v25;
  CCProfileMonitor *v26;
  CCConfigure *v27;
  char *v28;
  CCConfigure *v29;
  CCPipeMonitor *v30;
  char *v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  NSObject *v35;
  __int128 v36;
  uint64_t v37;
  NSObject *v38;
  __int128 v39;
  uint64_t result;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD handler[5];
  time_t v45;
  tm v46;
  size_t v47;
  uint8_t buf[16];
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  char __big[16];
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  shutDownPending = 0;
  *(_QWORD *)&v2 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v70 = v2;
  v71 = v2;
  v68 = v2;
  v69 = v2;
  v66 = v2;
  v67 = v2;
  v64 = v2;
  v65 = v2;
  v62 = v2;
  v63 = v2;
  v60 = v2;
  v61 = v2;
  v58 = v2;
  v59 = v2;
  *(_OWORD *)__big = v2;
  v57 = v2;
  *((_BYTE *)this + 208) = 0;
  v47 = 256;
  if (sysctlbyname("kern.bootargs", __big, &v47, 0, 0)
    || (HIBYTE(v71) = 0, !strnstr(__big, "cc.debug.keepwd", 0x100uLL)))
  {
    if (!*((_BYTE *)this + 208))
    {
      MutableCopy = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 512, CFSTR("/var/log/CoreCapture"));
      v4 = MutableCopy;
      if (!MutableCopy)
        return 0;
      deleteDirectory(MutableCopy);
      CFRelease(v4);
    }
  }
  else
  {
    *((_BYTE *)this + 208) = 1;
  }
  pruneDirectoryOnOSUpgrade();
  _gQueuePrivate = (uint64_t)dispatch_queue_create("com.apple.corecaptured.serial_queue", 0);
  if (!_gQueuePrivate)
  {
    v14 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_23;
      *(_WORD *)buf = 0;
      v15 = v14;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_23;
      *(_WORD *)buf = 0;
      v15 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v15, OS_LOG_TYPE_ERROR, "CCDaemon::init failed to create com.apple.corecaptured.serial_queue\n", buf, 2u);
LABEL_23:
    if (glog_fd)
    {
      *(_QWORD *)&v19 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v54 = v19;
      v55 = v19;
      v52 = v19;
      v53 = v19;
      v50 = v19;
      v51 = v19;
      *(_OWORD *)buf = v19;
      v49 = v19;
      memset(&v46, 0, sizeof(v46));
      v45 = 0xAAAAAAAAAAAAAAAALL;
      time(&v45);
      localtime_r(&v45, &v46);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v46);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "CCDaemon::init failed to create com.apple.corecaptured.serial_queue\n");
    }
    return 0;
  }
  v5 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
  *((_QWORD *)this + 37) = v5;
  if (!v5)
  {
    v16 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_42;
      *(_WORD *)buf = 0;
      v17 = v16;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_42;
      *(_WORD *)buf = 0;
      v17 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v17, OS_LOG_TYPE_ERROR, "CCDaemon::init Failed to create timer dispatch source\n", buf, 2u);
LABEL_42:
    if (glog_fd)
    {
      *(_QWORD *)&v36 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v36 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v54 = v36;
      v55 = v36;
      v52 = v36;
      v53 = v36;
      v50 = v36;
      v51 = v36;
      *(_OWORD *)buf = v36;
      v49 = v36;
      memset(&v46, 0, sizeof(v46));
      v45 = 0xAAAAAAAAAAAAAAAALL;
      time(&v45);
      localtime_r(&v45, &v46);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v46);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "CCDaemon::init Failed to create timer dispatch source\n");
    }
    return 0;
  }
  v6 = v5;
  v7 = dispatch_time(0, 60000000000);
  dispatch_source_set_timer(v6, v7, 0xDF8475800uLL, 0);
  v8 = *((_QWORD *)this + 37);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 0x40000000;
  handler[2] = ___ZN8CCDaemon4initEv_block_invoke;
  handler[3] = &__block_descriptor_tmp;
  handler[4] = this;
  dispatch_source_set_event_handler(v8, handler);
  dispatch_resume(*((dispatch_object_t *)this + 37));
  v9 = IOServiceNameMatching("CCPipe");
  *((_QWORD *)this + 25) = v9;
  v10 = coreCaptureOsLog;
  if (!v9)
  {
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_48;
      *(_WORD *)buf = 0;
      v18 = v10;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_48;
      *(_WORD *)buf = 0;
      v18 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v18, OS_LOG_TYPE_ERROR, "CCDaemon:: No name matching CCPipe service found \n", buf, 2u);
LABEL_48:
    if (glog_fd)
    {
      *(_QWORD *)&v39 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v39 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v54 = v39;
      v55 = v39;
      v52 = v39;
      v53 = v39;
      v50 = v39;
      v51 = v39;
      *(_OWORD *)buf = v39;
      v49 = v39;
      memset(&v46, 0, sizeof(v46));
      v45 = 0xAAAAAAAAAAAAAAAALL;
      time(&v45);
      localtime_r(&v45, &v46);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v46);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "CCDaemon:: No name matching CCPipe service found \n");
    }
    return 0;
  }
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_28;
    Count = CFDictionaryGetCount(v9);
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = Count;
    v13 = v10;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_28;
    v20 = CFDictionaryGetCount(v9);
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v20;
    v13 = MEMORY[0x1E0C81028];
  }
  _os_log_impl(&dword_1DB697000, v13, OS_LOG_TYPE_DEFAULT, "CCDaemon::No of matching CCPipe %ld\n", buf, 0xCu);
LABEL_28:
  if (glog_fd)
  {
    *(_QWORD *)&v21 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v21 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v54 = v21;
    v55 = v21;
    v52 = v21;
    v53 = v21;
    v50 = v21;
    v51 = v21;
    *(_OWORD *)buf = v21;
    v49 = v21;
    memset(&v46, 0, sizeof(v46));
    v45 = 0xAAAAAAAAAAAAAAAALL;
    time(&v45);
    localtime_r(&v45, &v46);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v46);
    dprintf(glog_fd, "%s ", (const char *)buf);
    v22 = glog_fd;
    v23 = CFDictionaryGetCount(*((CFDictionaryRef *)this + 25));
    dprintf(v22, "CCDaemon::No of matching CCPipe %ld\n", v23);
  }
  v24 = CCPipeMonitor::withDictionary(*((CCPipeMonitor **)this + 25), v11);
  *((_QWORD *)this + 2) = v24;
  if (v24)
  {
    v25 = (const void *)*((_QWORD *)this + 25);
    if (v25)
    {
      CFRelease(v25);
      *((_QWORD *)this + 25) = 0;
      v24 = (CCPipeMonitor *)*((_QWORD *)this + 2);
    }
    v26 = (CCProfileMonitor *)malloc_type_malloc(0x18uLL, 0xEE9A6C17uLL);
    *((_QWORD *)v26 + 1) = 1;
    *(_QWORD *)v26 = off_1EA31F2D8;
    *((_QWORD *)v26 + 2) = v24;
    (*(void (**)(CCPipeMonitor *))(*(_QWORD *)v24 + 40))(v24);
    *((_QWORD *)this + 4) = v26;
    v28 = CCProfileMonitor::withConfigure(v26, v27);
    *((_QWORD *)this + 3) = v28;
    if (v28)
    {
      *(_QWORD *)(*((_QWORD *)this + 2) + 72) = v28;
      (*(void (**)(char *))(*(_QWORD *)v28 + 40))(v28);
      v29 = (CCConfigure *)*((_QWORD *)this + 4);
      v30 = (CCPipeMonitor *)*((_QWORD *)this + 2);
      v31 = (char *)malloc_type_malloc(0x78uLL, 0xEE9A6C17uLL);
      *(_OWORD *)(v31 + 104) = 0u;
      *(_OWORD *)(v31 + 92) = 0u;
      *(_OWORD *)(v31 + 76) = 0u;
      *(_OWORD *)(v31 + 60) = 0u;
      *(_OWORD *)(v31 + 44) = 0u;
      *(_OWORD *)(v31 + 28) = 0u;
      *(_OWORD *)(v31 + 12) = 0u;
      *((_DWORD *)v31 + 2) = 1;
      *(_QWORD *)v31 = off_1EA320238;
      CCXPCService::initWithConfigureAndPipeMonitor((CCXPCService *)v31, v29, v30);
      *((_QWORD *)this + 5) = v31;
      if (!pthread_mutex_init((pthread_mutex_t *)((char *)this + 232), 0))
        return 1;
      v32 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
          goto LABEL_57;
        *(_WORD *)buf = 0;
        v33 = v32;
      }
      else
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_57;
        *(_WORD *)buf = 0;
        v33 = MEMORY[0x1E0C81028];
      }
      _os_log_error_impl(&dword_1DB697000, v33, OS_LOG_TYPE_ERROR, "CCDaemon::init Failed to initialize mutex\n", buf, 2u);
LABEL_57:
      if (glog_fd)
      {
        *(_QWORD *)&v42 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v42 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v54 = v42;
        v55 = v42;
        v52 = v42;
        v53 = v42;
        v50 = v42;
        v51 = v42;
        *(_OWORD *)buf = v42;
        v49 = v42;
        memset(&v46, 0, sizeof(v46));
        v45 = 0xAAAAAAAAAAAAAAAALL;
        time(&v45);
        localtime_r(&v45, &v46);
        strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v46);
        dprintf(glog_fd, "%s ", (const char *)buf);
        dprintf(glog_fd, "CCDaemon::init Failed to initialize mutex\n");
      }
      return 0;
    }
    v37 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_60;
      *(_WORD *)buf = 0;
      v38 = v37;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_60;
      *(_WORD *)buf = 0;
      v38 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v38, OS_LOG_TYPE_ERROR, "CCDaemon::init Failed to create CCProfileMonitor\n", buf, 2u);
LABEL_60:
    if (glog_fd)
    {
      *(_QWORD *)&v43 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v43 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v54 = v43;
      v55 = v43;
      v52 = v43;
      v53 = v43;
      v50 = v43;
      v51 = v43;
      *(_OWORD *)buf = v43;
      v49 = v43;
      memset(&v46, 0, sizeof(v46));
      v45 = 0xAAAAAAAAAAAAAAAALL;
      time(&v45);
      localtime_r(&v45, &v46);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v46);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "CCDaemon::init Failed to create CCProfileMonitor\n");
    }
    return 0;
  }
  v34 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v35 = v34;
LABEL_71:
      _os_log_error_impl(&dword_1DB697000, v35, OS_LOG_TYPE_ERROR, "CCDaemon::init Failed to create CCPipeMonitor\n", buf, 2u);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v35 = MEMORY[0x1E0C81028];
    goto LABEL_71;
  }
  if (glog_fd)
  {
    *(_QWORD *)&v41 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v41 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v54 = v41;
    v55 = v41;
    v52 = v41;
    v53 = v41;
    v50 = v41;
    v51 = v41;
    *(_OWORD *)buf = v41;
    v49 = v41;
    memset(&v46, 0, sizeof(v46));
    v45 = 0xAAAAAAAAAAAAAAAALL;
    time(&v45);
    localtime_r(&v45, &v46);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v46);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCDaemon::init Failed to create CCPipeMonitor\n");
  }
  result = *((_QWORD *)this + 25);
  if (result)
  {
    CFRelease((CFTypeRef)result);
    result = 0;
    *((_QWORD *)this + 25) = 0;
  }
  return result;
}

uint64_t CCDaemon::freeResources(CCDaemon *this)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  pthread_mutex_t *v10;
  __CFString *MutableCopy;
  __CFString *v12;

  v2 = *((_QWORD *)this + 2);
  if (v2)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 72))(v2);
    CCPipeMonitor::cleanCaptureDirectories(*((CFDictionaryRef **)this + 2));
    v3 = *((_QWORD *)this + 2);
    v4 = *(_QWORD *)(v3 + 72);
    if (v4)
    {
      (*(void (**)(uint64_t))(*(_QWORD *)v4 + 48))(v4);
      *(_QWORD *)(v3 + 72) = 0;
    }
  }
  v5 = *((_QWORD *)this + 37);
  if (v5)
  {
    dispatch_source_cancel(v5);
    dispatch_release(*((dispatch_object_t *)this + 37));
    *((_QWORD *)this + 37) = 0;
  }
  v6 = *((_QWORD *)this + 5);
  if (v6)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)v6 + 48))(v6);
    *((_QWORD *)this + 5) = 0;
  }
  v7 = *((_QWORD *)this + 3);
  if (v7)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)v7 + 48))(v7);
    *((_QWORD *)this + 3) = 0;
  }
  v8 = *((_QWORD *)this + 4);
  if (v8)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)v8 + 48))(v8);
    *((_QWORD *)this + 4) = 0;
  }
  v9 = *((_QWORD *)this + 2);
  if (v9)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)v9 + 48))(v9);
    *((_QWORD *)this + 2) = 0;
  }
  v10 = (pthread_mutex_t *)((char *)this + 232);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 232));
  if (!*((_BYTE *)this + 208))
  {
    MutableCopy = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 512, CFSTR("/var/log/CoreCapture"));
    if (MutableCopy)
    {
      v12 = MutableCopy;
      deleteDirectory(MutableCopy);
      CFRelease(v12);
    }
  }
  pthread_mutex_unlock(v10);
  return pthread_mutex_destroy(v10);
}

void ___ZN8CCDaemon4initEv_block_invoke(uint64_t a1)
{
  CCDaemon::activityCheck(*(CCDaemon **)(a1 + 32));
}

void CCDaemon::activityCheck(CCDaemon *this)
{
  uint64_t v1;
  CCDaemon *v2;
  NSObject *v3;
  __int128 v4;
  time_t v5;
  tm v6;
  uint8_t buf[16];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (shutDownPending
    || *(_BYTE *)(*((_QWORD *)this + 3) + 104)
    || *(_BYTE *)(*((_QWORD *)this + 5) + 48)
    || (CCPipeMonitor::isActive(*((CFDictionaryRef **)this + 2), 60.0) & 1) != 0)
  {
    return;
  }
  v1 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    v2 = (CCDaemon *)os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT);
    if ((_DWORD)v2)
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "activityCheck";
      v3 = v1;
LABEL_10:
      _os_log_impl(&dword_1DB697000, v3, OS_LOG_TYPE_DEFAULT, "CCDaemon::%s monitor NOT active, shutdown", buf, 0xCu);
    }
  }
  else
  {
    v2 = (CCDaemon *)os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
    if ((_DWORD)v2)
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "activityCheck";
      v3 = MEMORY[0x1E0C81028];
      goto LABEL_10;
    }
  }
  if (glog_fd)
  {
    *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v13 = v4;
    v14 = v4;
    v11 = v4;
    v12 = v4;
    v9 = v4;
    v10 = v4;
    *(_OWORD *)buf = v4;
    v8 = v4;
    memset(&v6, 0, sizeof(v6));
    v5 = 0xAAAAAAAAAAAAAAAALL;
    time(&v5);
    localtime_r(&v5, &v6);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v6);
    dprintf(glog_fd, "%s ", (const char *)buf);
    v2 = (CCDaemon *)dprintf(glog_fd, "CCDaemon::%s monitor NOT active, shutdown", "activityCheck");
  }
  CCDaemon::shutdown(v2);
}

void CCDaemon::runShutdownThread(CCDaemon *this, void *a2)
{
  pthread_setname_np("com.apple.corecaptured.shutdown");
  (*(void (**)(uint64_t))(*(_QWORD *)daemonGlbl + 24))(daemonGlbl);
  exit(0);
}

void CCDaemon::CCDaemon(CCDaemon *this)
{
  *((_DWORD *)this + 2) = 1;
  *(_QWORD *)this = off_1EA31F3E0;
}

{
  *((_DWORD *)this + 2) = 1;
  *(_QWORD *)this = off_1EA31F3E0;
}

char *CCDaemon::ccstart(CCDaemon *this)
{
  char *v1;
  uint64_t v2;
  NSObject *v3;
  __int128 v4;
  time_t v6;
  tm v7;
  uint8_t buf[16];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v1 = (char *)malloc_type_malloc(0x130uLL, 0xEE9A6C17uLL);
  *(_OWORD *)(v1 + 28) = 0u;
  *(_OWORD *)(v1 + 44) = 0u;
  *(_OWORD *)(v1 + 60) = 0u;
  *(_OWORD *)(v1 + 76) = 0u;
  *(_OWORD *)(v1 + 92) = 0u;
  *(_OWORD *)(v1 + 108) = 0u;
  *(_OWORD *)(v1 + 124) = 0u;
  *(_OWORD *)(v1 + 140) = 0u;
  *(_OWORD *)(v1 + 156) = 0u;
  *(_OWORD *)(v1 + 172) = 0u;
  *(_OWORD *)(v1 + 188) = 0u;
  *(_OWORD *)(v1 + 204) = 0u;
  *(_OWORD *)(v1 + 220) = 0u;
  *(_OWORD *)(v1 + 236) = 0u;
  *(_OWORD *)(v1 + 252) = 0u;
  *((_DWORD *)v1 + 75) = 0;
  *(_OWORD *)(v1 + 12) = 0u;
  *(_OWORD *)(v1 + 268) = 0u;
  *(_OWORD *)(v1 + 284) = 0u;
  *((_DWORD *)v1 + 2) = 1;
  *(_QWORD *)v1 = off_1EA31F3E0;
  if ((CCDaemon::init((CCDaemon *)v1) & 1) != 0)
  {
    daemonGlbl = (uint64_t)v1;
    return v1;
  }
  v2 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v3 = v2;
LABEL_12:
      _os_log_error_impl(&dword_1DB697000, v3, OS_LOG_TYPE_ERROR, "CCDaemon::ccstart to create CCDaemon\n", buf, 2u);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v3 = MEMORY[0x1E0C81028];
    goto LABEL_12;
  }
  if (glog_fd)
  {
    *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v14 = v4;
    v15 = v4;
    v12 = v4;
    v13 = v4;
    v10 = v4;
    v11 = v4;
    *(_OWORD *)buf = v4;
    v9 = v4;
    memset(&v7, 0, sizeof(v7));
    v6 = 0xAAAAAAAAAAAAAAAALL;
    time(&v6);
    localtime_r(&v6, &v7);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v7);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCDaemon::ccstart to create CCDaemon\n");
  }
  (*(void (**)(char *))(*(_QWORD *)v1 + 48))(v1);
  return 0;
}

void CoreCaptureStop(CCDaemon *this)
{
  if (!shutDownPending)
    CCDaemon::shutdown(this);
}

uint64_t CCDaemon::setCaptureIdAndReason(uint64_t a1, uint64_t a2, const char *a3)
{
  pthread_mutex_t *v6;

  v6 = (pthread_mutex_t *)(a1 + 232);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 232));
  if (*(_QWORD *)a2 != *(_QWORD *)(a1 + 56) || *(_QWORD *)(a2 + 8) != *(_QWORD *)(a1 + 64))
  {
    strlcpy((char *)(a1 + 72), a3, 0x80uLL);
    *(_OWORD *)(a1 + 56) = *(_OWORD *)a2;
  }
  return pthread_mutex_unlock(v6);
}

BOOL CCDaemon::lock(CCDaemon *this)
{
  return pthread_mutex_lock((pthread_mutex_t *)((char *)this + 232)) == 0;
}

BOOL CCDaemon::unlock(CCDaemon *this)
{
  return pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 232)) == 0;
}

void CCDaemon::quiesceAllTaps(CFDictionaryRef **this)
{
  CCPipeMonitor::quiesceAllTaps(this[2]);
}

void CCDaemon::resumeAllTaps(CFDictionaryRef **this)
{
  CCPipeMonitor::resumeAllTapsFromQuiesced(this[2]);
}

void CCDaemon::sysPowerNotificationCallback(CCDaemon *this, void *a2, int a3, intptr_t a4, void *a5)
{
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  time_t v16;
  tm v17;
  uint8_t buf[16];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (a3 <= -536870273)
  {
    if (a3 != -536870315)
    {
      if (a3 != -536870288)
        return;
LABEL_10:
      CCPipeMonitor::quiesceAllTaps(*(CFDictionaryRef **)(daemonGlbl + 16));
      v9 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = a3;
          v10 = v9;
LABEL_18:
          _os_log_impl(&dword_1DB697000, v10, OS_LOG_TYPE_DEFAULT, "CCDaemon received system sleep notification (0x%x), all cctap quiesced\n", buf, 8u);
        }
      }
      else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = a3;
        v10 = MEMORY[0x1E0C81028];
        goto LABEL_18;
      }
      if (glog_fd)
      {
        *(_QWORD *)&v13 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v24 = v13;
        v25 = v13;
        v22 = v13;
        v23 = v13;
        v20 = v13;
        v21 = v13;
        *(_OWORD *)buf = v13;
        v19 = v13;
        memset(&v17, 0, sizeof(v17));
        v16 = 0xAAAAAAAAAAAAAAAALL;
        time(&v16);
        localtime_r(&v16, &v17);
        strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v17);
        dprintf(glog_fd, "%s ", (const char *)buf);
        dprintf(glog_fd, "CCDaemon received system sleep notification (0x%x), all cctap quiesced\n", a3);
      }
      IOAllowPowerChange(gPMConnectRootPort, a4);
      return;
    }
    CCPipeMonitor::quiesceAllTaps(*(CFDictionaryRef **)(daemonGlbl + 16));
    v11 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
        goto LABEL_30;
      *(_WORD *)buf = 0;
      v12 = v11;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        goto LABEL_30;
      *(_WORD *)buf = 0;
      v12 = MEMORY[0x1E0C81028];
    }
    _os_log_impl(&dword_1DB697000, v12, OS_LOG_TYPE_DEFAULT, "CCDaemon received system shutdown notification, all cctap quiesced\n", buf, 2u);
LABEL_30:
    if (glog_fd)
    {
      *(_QWORD *)&v15 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v15 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v24 = v15;
      v25 = v15;
      v22 = v15;
      v23 = v15;
      v20 = v15;
      v21 = v15;
      *(_OWORD *)buf = v15;
      v19 = v15;
      memset(&v17, 0, sizeof(v17));
      v16 = 0xAAAAAAAAAAAAAAAALL;
      time(&v16);
      localtime_r(&v16, &v17);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v17);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "CCDaemon received system shutdown notification, all cctap quiesced\n");
    }
    return;
  }
  if (a3 == -536870272)
    goto LABEL_10;
  if (a3 != -536870144)
    return;
  CCPipeMonitor::resumeAllTapsFromQuiesced(*(CFDictionaryRef **)(daemonGlbl + 16));
  v7 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_25;
    *(_WORD *)buf = 0;
    v8 = v7;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_25;
    *(_WORD *)buf = 0;
    v8 = MEMORY[0x1E0C81028];
  }
  _os_log_impl(&dword_1DB697000, v8, OS_LOG_TYPE_DEFAULT, "CCDaemon received system wake, all cctap resumed from quiesced state\n", buf, 2u);
LABEL_25:
  if (glog_fd)
  {
    *(_QWORD *)&v14 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v24 = v14;
    v25 = v14;
    v22 = v14;
    v23 = v14;
    v20 = v14;
    v21 = v14;
    *(_OWORD *)buf = v14;
    v19 = v14;
    memset(&v17, 0, sizeof(v17));
    v16 = 0xAAAAAAAAAAAAAAAALL;
    time(&v16);
    localtime_r(&v16, &v17);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v17);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCDaemon received system wake, all cctap resumed from quiesced state\n");
  }
}

void CCDaemon::enablePowerNotification(CCDaemon *this)
{
  IONotificationPort **v2;
  _DWORD *v3;
  io_connect_t v4;
  IONotificationPort *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  __int128 v10;
  __int128 v11;
  time_t v12;
  tm v13;
  uint8_t buf[16];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  gPMConnectRootPort = 0;
  v2 = (IONotificationPort **)((char *)this + 216);
  v3 = (_DWORD *)((char *)this + 224);
  *(_QWORD *)((char *)this + 220) = 0;
  *(_QWORD *)((char *)this + 212) = 0;
  v4 = IORegisterForSystemPower(0, (IONotificationPortRef *)this + 27, (IOServiceInterestCallback)CCDaemon::sysPowerNotificationCallback, (io_object_t *)this + 56);
  *((_DWORD *)this + 53) = v4;
  if (v4)
  {
    v5 = *v2;
    if (*v2)
    {
      if (*v3)
      {
        gPMConnectRootPort = v4;
        IONotificationPortSetDispatchQueue(v5, MEMORY[0x1E0C80D38]);
        v6 = coreCaptureOsLog;
        if (coreCaptureOsLog)
        {
          if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
            goto LABEL_16;
          *(_WORD *)buf = 0;
          v7 = v6;
        }
        else
        {
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            goto LABEL_16;
          *(_WORD *)buf = 0;
          v7 = MEMORY[0x1E0C81028];
        }
        _os_log_impl(&dword_1DB697000, v7, OS_LOG_TYPE_DEFAULT, "CCDaemon power notification enabled\n", buf, 2u);
LABEL_16:
        if (glog_fd)
        {
          *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
          *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
          v20 = v11;
          v21 = v11;
          v18 = v11;
          v19 = v11;
          v16 = v11;
          v17 = v11;
          *(_OWORD *)buf = v11;
          v15 = v11;
          memset(&v13, 0, sizeof(v13));
          v12 = 0xAAAAAAAAAAAAAAAALL;
          time(&v12);
          localtime_r(&v12, &v13);
          strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v13);
          dprintf(glog_fd, "%s ", (const char *)buf);
          dprintf(glog_fd, "CCDaemon power notification enabled\n");
        }
        return;
      }
    }
  }
  v8 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    *(_WORD *)buf = 0;
    v9 = v8;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    *(_WORD *)buf = 0;
    v9 = MEMORY[0x1E0C81028];
  }
  _os_log_error_impl(&dword_1DB697000, v9, OS_LOG_TYPE_ERROR, "CCDaemon IORegisterForSystemPower failed\n", buf, 2u);
LABEL_11:
  if (glog_fd)
  {
    *(_QWORD *)&v10 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v20 = v10;
    v21 = v10;
    v18 = v10;
    v19 = v10;
    v16 = v10;
    v17 = v10;
    *(_OWORD *)buf = v10;
    v15 = v10;
    memset(&v13, 0, sizeof(v13));
    v12 = 0xAAAAAAAAAAAAAAAALL;
    time(&v12);
    localtime_r(&v12, &v13);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v13);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCDaemon IORegisterForSystemPower failed\n");
  }
}

void CCDaemon::disablePowerNotification(CCDaemon *this)
{
  _QWORD *v1;
  uint64_t v3;
  NSObject *v4;
  __int128 v5;
  time_t v6;
  tm v7;
  uint8_t buf[16];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v1 = (_QWORD *)((char *)this + 212);
  if (!*((_DWORD *)this + 53))
    return;
  IONotificationPortSetDispatchQueue(*((IONotificationPortRef *)this + 27), 0);
  IODeregisterForSystemPower((io_object_t *)this + 56);
  IOServiceClose(*((_DWORD *)this + 53));
  IONotificationPortDestroy(*((IONotificationPortRef *)this + 27));
  v3 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v4 = v3;
LABEL_7:
      _os_log_impl(&dword_1DB697000, v4, OS_LOG_TYPE_DEFAULT, "CCDaemon power notification disabled\n", buf, 2u);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v4 = MEMORY[0x1E0C81028];
    goto LABEL_7;
  }
  if (glog_fd)
  {
    *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v14 = v5;
    v15 = v5;
    v12 = v5;
    v13 = v5;
    v10 = v5;
    v11 = v5;
    *(_OWORD *)buf = v5;
    v9 = v5;
    memset(&v7, 0, sizeof(v7));
    v6 = 0xAAAAAAAAAAAAAAAALL;
    time(&v6);
    localtime_r(&v6, &v7);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v7);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCDaemon power notification disabled\n");
  }
  gPMConnectRootPort = 0;
  *v1 = 0;
  v1[1] = 0;
}

void CCCrashTracerFormatter::~CCCrashTracerFormatter(void *this)
{
  if (this)
    free(this);
}

uint64_t CCCrashTracerFormatter::writeLog(uint64_t a1, uint64_t a2, _DWORD *a3, int a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9;
  int v10;
  uint64_t v11;
  _DWORD *v12;

  v9 = 0;
  if (a3)
  {
    v10 = a4;
    if ((a4 & 0xFFFFFFF8) != 0)
    {
      v9 = 0;
      do
      {
        v11 = a3[1];
        v12 = a3 + 2;
        if (*a3 <= 1u)
          v9 += (*(uint64_t (**)(uint64_t, _DWORD *, _QWORD))(*(_QWORD *)a1 + 112))(a1, a3 + 2, a3[1]);
        v10 = v10 - v11 - 8;
        a3 = (_DWORD *)((char *)v12 + v11);
      }
      while ((v10 & 0xFFFFFFF8) != 0);
    }
  }
  if (a5)
    v9 += (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)a1 + 112))(a1, a5, a6);
  return v9;
}

const char *CCCrashTracerFormatter::getFormatterFileExtension(CCCrashTracerFormatter *this)
{
  return "ips";
}

uint64_t CCCrashTracerFormatter::initWithRegistryEntry(CCCrashTracerFormatter *this, io_object_t object)
{
  IOObjectRetain(object);
  *((_DWORD *)this + 3) = object;
  return 1;
}

_QWORD *CCCrashTracerFormatter::withRegistryEntry(CCCrashTracerFormatter *this)
{
  io_object_t v1;
  _QWORD *v2;

  v1 = this;
  v2 = malloc_type_malloc(0x20uLL, 0xEE9A6C17uLL);
  v2[2] = 0;
  v2[3] = 0;
  *v2 = off_1EA31F460;
  v2[1] = 0;
  *((_DWORD *)v2 + 2) = 1;
  IOObjectRetain(v1);
  *((_DWORD *)v2 + 3) = v1;
  return v2;
}

void CCDataFile::~CCDataFile(void *this)
{
  if (this)
    free(this);
}

uint64_t CCDataFile::ccfree(CCDataFile *this)
{
  uint64_t result;

  result = CCFile::freeResources(this);
  if (this)
    return (*(uint64_t (**)(CCDataFile *))(*(_QWORD *)this + 8))(this);
  return result;
}

uint64_t CCDataFile::openFile(CCDataFile *this, const char *a2)
{
  const __CFString *v3;
  CFIndex Length;
  char *v5;
  CFIndex v6;
  uint64_t v7;
  std::error_code *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  __int128 v13;
  time_t v15;
  tm v16;
  uint8_t buf[16];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = (const __CFString *)(*(uint64_t (**)(CCDataFile *, const char *))(*(_QWORD *)this + 136))(this, a2);
  mkdirRecursive(v3);
  Length = CFStringGetLength(v3);
  v5 = (char *)malloc_type_malloc(Length + 1, 0xCE9C643AuLL);
  v6 = CFStringGetLength(v3);
  CFStringGetCString(v3, v5, v6 + 1, 0);
  v7 = isSeedAndiOS();
  if ((_DWORD)v7)
  {
    if (!deviceUnlockedSinceBoot(v7, v8))
    {
      *((_DWORD *)this + 9) = -1;
      goto LABEL_9;
    }
    v9 = open_dprotected_np(v5, 514, 3, 0, 420);
  }
  else
  {
    v9 = creat(v5, 0x1A4u);
  }
  *((_DWORD *)this + 9) = v9;
  if (v9 != -1)
  {
    v10 = 1;
    if (!v3)
      goto LABEL_17;
LABEL_16:
    CFRelease(v3);
    goto LABEL_17;
  }
LABEL_9:
  v11 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = v5;
    v12 = v11;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = v5;
    v12 = MEMORY[0x1E0C81028];
  }
  _os_log_error_impl(&dword_1DB697000, v12, OS_LOG_TYPE_ERROR, "CCDataFile::open Failed to create %s\n", buf, 0xCu);
LABEL_13:
  if (glog_fd)
  {
    *(_QWORD *)&v13 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v23 = v13;
    v24 = v13;
    v21 = v13;
    v22 = v13;
    v19 = v13;
    v20 = v13;
    *(_OWORD *)buf = v13;
    v18 = v13;
    memset(&v16, 0, sizeof(v16));
    v15 = 0xAAAAAAAAAAAAAAAALL;
    time(&v15);
    localtime_r(&v15, &v16);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v16);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCDataFile::open Failed to create %s\n", v5);
  }
  v10 = 0;
  if (v3)
    goto LABEL_16;
LABEL_17:
  if (v5)
    free(v5);
  return v10;
}

uint64_t CCDataFile::writeLog(uint64_t a1)
{
  (*(void (**)(_QWORD))(**(_QWORD **)(a1 + 16) + 72))(*(_QWORD *)(a1 + 16));
  return 1;
}

uint64_t CCDataFile::writeCommentEntry(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD))(*(_QWORD *)a1 + 64))(a1, a2, a3, a4, 0, 0);
}

uint64_t CCDataFile::closeFile(CCDataFile *this)
{
  close(*((_DWORD *)this + 9));
  *((_DWORD *)this + 9) = -1;
  return 1;
}

uint64_t CCFile::configureLogOptions()
{
  return 0;
}

uint64_t CCDataFile::rollFile(CCDataFile *this)
{
  return 1;
}

__CFString *CCDataFile::generateFileName(CCDataFile *this, const char *a2)
{
  const char *v4;
  __CFString *Mutable;

  if ((isSeedAndiOS() & (CCProfileMonitor::fProfileLoaded == 0)) != 0)
    v4 = "/Library/Logs/CoreCapture";
  else
    v4 = "/Library/Logs/CrashReporter/CoreCapture";
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 512);
  CFStringAppendCString(Mutable, v4, 0);
  ++*((_DWORD *)this + 8);
  CFStringAppendCString(Mutable, "/", 0);
  CFStringAppend(Mutable, *((CFStringRef *)this + 9));
  CFStringAppendCString(Mutable, "/", 0);
  CFStringAppend(Mutable, *((CFStringRef *)this + 10));
  CFStringAppendCString(Mutable, "/", 0);
  CFStringAppendCString(Mutable, a2, 0);
  return Mutable;
}

uint64_t CCDataFile::openCaptureFile(_DWORD *a1, const char *a2, const char *a3, uint64_t a4, uint64_t a5)
{
  __CFString *v7;
  CFIndex Length;
  char *v9;
  CFIndex v10;
  uint64_t v11;
  std::error_code *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  __int128 v17;
  time_t v19;
  tm v20;
  uint8_t buf[16];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (!a2)
    a2 = "debug_data";
  v7 = (__CFString *)(*(uint64_t (**)(_DWORD *, const char *, uint64_t, uint64_t))(*(_QWORD *)a1 + 144))(a1, a2, a4, a5);
  mkdirRecursive(v7);
  CFStringAppendCString(v7, "/", 0);
  CFStringAppendCString(v7, a3, 0);
  Length = CFStringGetLength(v7);
  v9 = (char *)malloc_type_malloc(Length + 1, 0xAEC5040CuLL);
  v10 = CFStringGetLength(v7);
  CFStringGetCString(v7, v9, v10 + 1, 0);
  v11 = isSeedAndiOS();
  if ((_DWORD)v11)
  {
    if (!deviceUnlockedSinceBoot(v11, v12))
    {
      a1[9] = -1;
      goto LABEL_11;
    }
    v13 = open_dprotected_np(v9, 514, 3, 0, 420);
  }
  else
  {
    v13 = creat(v9, 0x1A4u);
  }
  a1[9] = v13;
  if (v13 != -1)
  {
    v14 = 1;
    if (!v9)
      goto LABEL_19;
LABEL_18:
    free(v9);
    goto LABEL_19;
  }
LABEL_11:
  v15 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = v9;
    v16 = v15;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = v9;
    v16 = MEMORY[0x1E0C81028];
  }
  _os_log_error_impl(&dword_1DB697000, v16, OS_LOG_TYPE_ERROR, "CCDataFile::open Failed to create %s\n", buf, 0xCu);
LABEL_15:
  if (glog_fd)
  {
    *(_QWORD *)&v17 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v17 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v27 = v17;
    v28 = v17;
    v25 = v17;
    v26 = v17;
    v23 = v17;
    v24 = v17;
    *(_OWORD *)buf = v17;
    v22 = v17;
    memset(&v20, 0, sizeof(v20));
    v19 = 0xAAAAAAAAAAAAAAAALL;
    time(&v19);
    localtime_r(&v19, &v20);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v20);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCDataFile::open Failed to create %s\n", v9);
  }
  v14 = 0;
  if (v9)
    goto LABEL_18;
LABEL_19:
  if (v7)
    CFRelease(v7);
  return v14;
}

CCFile *CCDataFile::withRegistryEntry(CCDataFile *this)
{
  CCFile *v2;

  v2 = (CCFile *)malloc_type_malloc(0x70uLL, 0xEE9A6C17uLL);
  *(_OWORD *)((char *)v2 + 8) = 0u;
  *(_OWORD *)((char *)v2 + 24) = 0u;
  *(_OWORD *)((char *)v2 + 40) = 0u;
  *(_OWORD *)((char *)v2 + 56) = 0u;
  *(_OWORD *)((char *)v2 + 72) = 0u;
  *(_OWORD *)((char *)v2 + 88) = 0u;
  *((_QWORD *)v2 + 13) = 0;
  *((_DWORD *)v2 + 2) = 1;
  *(_QWORD *)v2 = off_1EA31F500;
  if (!CCFile::initWithRegistryEntry(v2, this))
  {
    (*(void (**)(CCFile *))(*(_QWORD *)v2 + 48))(v2);
    return 0;
  }
  return v2;
}

void CCOSSerializeWithIOReporterFormatter::~CCOSSerializeWithIOReporterFormatter(void *this)
{
  if (this)
    free(this);
}

CFIndex CCOSSerializeWithIOReporterFormatter::writeLog(uint64_t a1, uint64_t a2, const void *a3, size_t a4, const void *a5, size_t a6)
{
  char *v12;
  const __CFArray *v13;
  __CFArray *v14;
  CFTypeID v15;
  const __CFData *Data;
  uint64_t v17;
  const char *CStringPtr;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  __int128 v22;
  int v23;
  const char *v24;
  __int128 v25;
  const UInt8 *BytePtr;
  const UInt8 *v27;
  CFIndex Length;
  uint64_t v29;
  CFIndex v30;
  uint64_t v31;
  NSObject *v32;
  __int128 v33;
  uint64_t v35;
  NSObject *v36;
  __int128 v37;
  const char *v38;
  time_t v39;
  tm v40;
  CFStringRef errorString;
  _BYTE buf[32];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  if (a5)
  {
    v12 = (char *)malloc_type_malloc(a6 + a4, 0x952164F1uLL);
    memcpy(v12, a3, a4);
    memcpy(&v12[a4], a5, a6);
    a3 = v12;
  }
  else
  {
    v12 = 0;
  }
  errorString = (CFStringRef)0xAAAAAAAAAAAAAAAALL;
  v13 = (const __CFArray *)IOCFUnserialize((const char *)a3, (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, &errorString);
  if (!v13)
  {
    v17 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
      {
        CStringPtr = CFStringGetCStringPtr(errorString, 0);
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = CStringPtr;
        v19 = v17;
LABEL_50:
        _os_log_error_impl(&dword_1DB697000, v19, OS_LOG_TYPE_ERROR, "Error: %s", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v38 = CFStringGetCStringPtr(errorString, 0);
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = v38;
      v19 = MEMORY[0x1E0C81028];
      goto LABEL_50;
    }
    if (glog_fd)
    {
      *(_QWORD *)&v22 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v22 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v47 = v22;
      v48 = v22;
      v45 = v22;
      v46 = v22;
      v43 = v22;
      v44 = v22;
      *(_OWORD *)buf = v22;
      *(_OWORD *)&buf[16] = v22;
      memset(&v40, 0, sizeof(v40));
      v39 = 0xAAAAAAAAAAAAAAAALL;
      time(&v39);
      localtime_r(&v39, &v40);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v40);
      dprintf(glog_fd, "%s ", buf);
      v23 = glog_fd;
      v24 = CFStringGetCStringPtr(errorString, 0);
      dprintf(v23, "Error: %s", v24);
    }
    Data = 0;
    goto LABEL_33;
  }
  v14 = CCOSSerializeWithIOReporterFormatter::processAllDictionarieswithinIncommingArray(a1, v13, a2);
  v15 = CFGetTypeID(v14);
  if (v15 == CFArrayGetTypeID())
  {
    Data = CFPropertyListCreateData(0, v14, kCFPropertyListXMLFormat_v1_0, 0, 0);
    if (!v14)
      goto LABEL_23;
    goto LABEL_22;
  }
  v20 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
      goto LABEL_19;
    *(_WORD *)buf = 0;
    v21 = v20;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_19;
    *(_WORD *)buf = 0;
    v21 = MEMORY[0x1E0C81028];
  }
  _os_log_error_impl(&dword_1DB697000, v21, OS_LOG_TYPE_ERROR, "CCOSSerializeWithIOReporterFormatter::writeLog unsupported root type for JSON Serialization", buf, 2u);
LABEL_19:
  if (glog_fd)
  {
    *(_QWORD *)&v25 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v25 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v47 = v25;
    v48 = v25;
    v45 = v25;
    v46 = v25;
    v43 = v25;
    v44 = v25;
    *(_OWORD *)buf = v25;
    *(_OWORD *)&buf[16] = v25;
    memset(&v40, 0, sizeof(v40));
    v39 = 0xAAAAAAAAAAAAAAAALL;
    time(&v39);
    localtime_r(&v39, &v40);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v40);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "CCOSSerializeWithIOReporterFormatter::writeLog unsupported root type for JSON Serialization");
  }
  Data = 0;
  if (v14)
LABEL_22:
    CFRelease(v14);
LABEL_23:
  if (!Data || (BytePtr = CFDataGetBytePtr(Data)) == 0)
  {
    v31 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_31;
      *(_WORD *)buf = 0;
      v32 = v31;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_31;
      *(_WORD *)buf = 0;
      v32 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v32, OS_LOG_TYPE_ERROR, "CCOSSerializeWithIOReporterFormatter::writeLog CFDataGetBytePtr() failed", buf, 2u);
LABEL_31:
    if (glog_fd)
    {
      *(_QWORD *)&v33 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v33 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v47 = v33;
      v48 = v33;
      v45 = v33;
      v46 = v33;
      v43 = v33;
      v44 = v33;
      *(_OWORD *)buf = v33;
      *(_OWORD *)&buf[16] = v33;
      memset(&v40, 0, sizeof(v40));
      v39 = 0xAAAAAAAAAAAAAAAALL;
      time(&v39);
      localtime_r(&v39, &v40);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v40);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "CCOSSerializeWithIOReporterFormatter::writeLog CFDataGetBytePtr() failed");
    }
LABEL_33:
    v30 = 0;
    goto LABEL_34;
  }
  v27 = BytePtr;
  Length = CFDataGetLength(Data);
  v29 = (*(uint64_t (**)(uint64_t, const UInt8 *, CFIndex))(*(_QWORD *)a1 + 112))(a1, v27, Length);
  if (v29 == Length)
  {
    v30 = Length;
    goto LABEL_34;
  }
  v30 = v29;
  v35 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
      goto LABEL_45;
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)&buf[4] = Length;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v30;
    v36 = v35;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_45;
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)&buf[4] = Length;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v30;
    v36 = MEMORY[0x1E0C81028];
  }
  _os_log_error_impl(&dword_1DB697000, v36, OS_LOG_TYPE_ERROR, "CCOSSerializeWithIOReporterFormatter::writeLog Failed to write(1) dsize=%lu, tempLength=%lu\n", buf, 0x16u);
LABEL_45:
  if (glog_fd)
  {
    *(_QWORD *)&v37 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v37 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v47 = v37;
    v48 = v37;
    v45 = v37;
    v46 = v37;
    v43 = v37;
    v44 = v37;
    *(_OWORD *)buf = v37;
    *(_OWORD *)&buf[16] = v37;
    memset(&v40, 0, sizeof(v40));
    v39 = 0xAAAAAAAAAAAAAAAALL;
    time(&v39);
    localtime_r(&v39, &v40);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v40);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "CCOSSerializeWithIOReporterFormatter::writeLog Failed to write(1) dsize=%lu, tempLength=%lu\n", Length, v30);
  }
LABEL_34:
  if (v12)
    free(v12);
  if (Data)
    CFRelease(Data);
  if (v13)
    CFRelease(v13);
  return v30;
}

uint64_t CCOSSerializeWithIOReporterFormatter::writeCommentEntry()
{
  return 0;
}

const char *CCOSSerializeWithIOReporterFormatter::getFormatterFileExtension(CCOSSerializeWithIOReporterFormatter *this)
{
  return "xml";
}

uint64_t CCOSSerializeWithIOReporterFormatter::initWithRegistryEntry(CCOSSerializeWithIOReporterFormatter *this, io_object_t object)
{
  *((_DWORD *)this + 8) = object;
  IOObjectRetain(object);
  *((_DWORD *)this + 3) = object;
  return 1;
}

__CFArray *CCOSSerializeWithIOReporterFormatter::processAllDictionarieswithinIncommingArray(int a1, const __CFArray *a2, uint64_t a3)
{
  __CFArray *Mutable;
  CFIndex i;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v9;
  CFTypeID v10;
  __CFDictionary *DictionaryWithProcessedIOReporter;
  uint64_t v12;
  NSObject *v13;
  __int128 v14;
  time_t v16;
  tm v17;
  uint8_t buf[16];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 1, MEMORY[0x1E0C9B378]);
  for (i = 0; i < CFArrayGetCount(a2); ++i)
  {
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a2, i);
    if (!ValueAtIndex || (v9 = ValueAtIndex, v10 = CFGetTypeID(ValueAtIndex), v10 != CFDictionaryGetTypeID()))
    {
      v12 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)&buf[4] = i;
          v13 = v12;
          goto LABEL_16;
        }
      }
      else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = i;
        v13 = MEMORY[0x1E0C81028];
LABEL_16:
        _os_log_error_impl(&dword_1DB697000, v13, OS_LOG_TYPE_ERROR, "CCOSSerializeWithIOReporterFormatter::processAllDictionarieswithinIncommingArray  didnt find or wrong type in array at i %ld\n", buf, 0xCu);
      }
      if (glog_fd)
      {
        *(_QWORD *)&v14 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v24 = v14;
        v25 = v14;
        v22 = v14;
        v23 = v14;
        v20 = v14;
        v21 = v14;
        *(_OWORD *)buf = v14;
        v19 = v14;
        memset(&v17, 0, sizeof(v17));
        v16 = 0xAAAAAAAAAAAAAAAALL;
        time(&v16);
        localtime_r(&v16, &v17);
        strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v17);
        dprintf(glog_fd, "%s ", (const char *)buf);
        dprintf(glog_fd, "CCOSSerializeWithIOReporterFormatter::processAllDictionarieswithinIncommingArray  didnt find or wrong type in array at i %ld\n", i);
      }
      return Mutable;
    }
    DictionaryWithProcessedIOReporter = CCOSSerializeWithIOReporterFormatter::createDictionaryWithProcessedIOReporter(a1, v9, a3);
    CFArrayAppendValue(Mutable, DictionaryWithProcessedIOReporter);
    if (DictionaryWithProcessedIOReporter)
      CFRelease(DictionaryWithProcessedIOReporter);
  }
  return Mutable;
}

__CFDictionary *CCOSSerializeWithIOReporterFormatter::createDictionaryWithProcessedIOReporter(int a1, CFDictionaryRef theDict, uint64_t a3)
{
  __CFDictionary *MutableCopy;
  int v6;
  const void *Value;
  const void *v8;
  CFTypeID v9;
  CFTypeID TypeID;
  const void *v11;
  const void *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  __int128 v17;
  const void *v18;
  CFTypeID v19;
  const __CFArray *v20;
  CCOSSerializeWithIOReporterFormatter *Aggregate;
  CCOSSerializeWithIOReporterFormatter *v22;
  __CFDictionary *v23;
  __int128 v24;
  int v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  NSObject *v29;
  __int128 v30;
  const __CFDictionary *SamplesRaw;
  __int128 v32;
  uint64_t v34;
  NSObject *v35;
  __int128 v36;
  uint64_t v37;
  uint64_t v38;
  time_t v39;
  tm v40;
  CFErrorRef err;
  _BYTE v42[64];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE buffer[48];
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, theDict);
  if (MutableCopy)
  {
    v6 = CFDictionaryContainsKey(theDict, CFSTR("CCIOReportInterests"));
    if (v6 == CFDictionaryContainsKey(theDict, CFSTR("CCIOReportRdata")))
    {
      Value = CFDictionaryGetValue(theDict, CFSTR("CCIOReportRdata"));
      if (Value)
      {
        v8 = Value;
        v9 = CFGetTypeID(Value);
        TypeID = CFDataGetTypeID();
        if (v9 != TypeID)
          v8 = 0;
        v11 = CFDictionaryGetValue(theDict, CFSTR("CCIOReportInterests"));
        if (!v11)
        {
          if (v9 != TypeID)
            return MutableCopy;
          goto LABEL_33;
        }
        v12 = v11;
      }
      else
      {
        v18 = CFDictionaryGetValue(theDict, CFSTR("CCIOReportInterests"));
        if (!v18)
          return MutableCopy;
        v12 = v18;
        v8 = 0;
      }
      v19 = CFGetTypeID(v12);
      if (v19 == CFArrayGetTypeID())
        v20 = (const __CFArray *)v12;
      else
        v20 = 0;
      if (v8 && v20)
      {
        err = 0;
        Aggregate = (CCOSSerializeWithIOReporterFormatter *)IOReportCreateAggregate();
        if (Aggregate)
        {
          v22 = Aggregate;
          if (CCOSSerializeWithIOReporterFormatter::convertInterestsArrayToIOReportLegend(Aggregate, Aggregate, v20))goto LABEL_26;
          SamplesRaw = (const __CFDictionary *)IOReportCreateSamplesRaw();
          v23 = SamplesRaw;
          if (SamplesRaw && CFDictionaryGetCount(SamplesRaw))
          {
LABEL_59:
            if (a3)
              v37 = *(_QWORD *)(a3 + 28) & 0xFFFFFFFFFFFFFFLL;
            else
              v37 = 0;
            addSystemInformationToDict(v23, v37);
            if (v23)
            {
              CFDictionarySetValue(MutableCopy, CFSTR("IOReporter"), v23);
              CFRelease(v22);
              goto LABEL_64;
            }
LABEL_26:
            v23 = v22;
LABEL_64:
            CFRelease(v23);
            CFDictionaryRemoveValue(MutableCopy, CFSTR("CCIOReportRkey"));
            CFDictionaryRemoveValue(MutableCopy, CFSTR("CCIOReportRdata"));
            CFDictionaryRemoveValue(MutableCopy, CFSTR("CCIOReportInterests"));
            return MutableCopy;
          }
          v57 = xmmword_1DB6CDDC0;
          v58 = unk_1DB6CDDD0;
          v59 = xmmword_1DB6CDDE0;
          v60 = unk_1DB6CDDF0;
          v53 = xmmword_1DB6CDD80;
          v54 = unk_1DB6CDD90;
          v55 = xmmword_1DB6CDDA0;
          v56 = unk_1DB6CDDB0;
          v49 = xmmword_1DB6CDD40;
          v50 = unk_1DB6CDD50;
          v51 = xmmword_1DB6CDD60;
          v52 = unk_1DB6CDD70;
          *(_OWORD *)buffer = *(_OWORD *)"<unknown>";
          memset(&buffer[16], 0, 32);
          v48 = unk_1DB6CDD30;
          v34 = coreCaptureOsLog;
          if (coreCaptureOsLog)
          {
            if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
              goto LABEL_57;
            *(_DWORD *)v42 = 136315138;
            *(_QWORD *)&v42[4] = buffer;
            v35 = v34;
          }
          else
          {
            if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              goto LABEL_57;
            *(_DWORD *)v42 = 136315138;
            *(_QWORD *)&v42[4] = buffer;
            v35 = MEMORY[0x1E0C81028];
          }
          _os_log_error_impl(&dword_1DB697000, v35, OS_LOG_TYPE_ERROR, "IOReportCreateSamplesRaw() returned 0 sized dictionary %s", v42, 0xCu);
LABEL_57:
          if (glog_fd)
          {
            *(_QWORD *)&v36 = 0xAAAAAAAAAAAAAAAALL;
            *((_QWORD *)&v36 + 1) = 0xAAAAAAAAAAAAAAAALL;
            v45 = v36;
            v46 = v36;
            v43 = v36;
            v44 = v36;
            *(_OWORD *)&v42[32] = v36;
            *(_OWORD *)&v42[48] = v36;
            *(_OWORD *)v42 = v36;
            *(_OWORD *)&v42[16] = v36;
            memset(&v40, 0, sizeof(v40));
            v39 = 0xAAAAAAAAAAAAAAAALL;
            time(&v39);
            localtime_r(&v39, &v40);
            strftime(v42, 0x80uLL, "%b %d %H:%M:%S", &v40);
            dprintf(glog_fd, "%s ", v42);
            dprintf(glog_fd, "IOReportCreateSamplesRaw() returned 0 sized dictionary %s", buffer);
          }
          goto LABEL_59;
        }
        v28 = coreCaptureOsLog;
        if (coreCaptureOsLog)
        {
          if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
            goto LABEL_46;
          *(_DWORD *)buffer = 136315394;
          *(_QWORD *)&buffer[4] = "createDictionaryWithProcessedIOReporter";
          *(_WORD *)&buffer[12] = 1024;
          *(_DWORD *)&buffer[14] = 116;
          v29 = v28;
        }
        else
        {
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            goto LABEL_46;
          *(_DWORD *)buffer = 136315394;
          *(_QWORD *)&buffer[4] = "createDictionaryWithProcessedIOReporter";
          *(_WORD *)&buffer[12] = 1024;
          *(_DWORD *)&buffer[14] = 116;
          v29 = MEMORY[0x1E0C81028];
        }
        _os_log_error_impl(&dword_1DB697000, v29, OS_LOG_TYPE_ERROR, "%s@%d: bail - !legend\n", buffer, 0x12u);
LABEL_46:
        if (glog_fd)
        {
          *(_QWORD *)&v32 = 0xAAAAAAAAAAAAAAAALL;
          *((_QWORD *)&v32 + 1) = 0xAAAAAAAAAAAAAAAALL;
          v51 = v32;
          v52 = v32;
          v49 = v32;
          v50 = v32;
          *(_OWORD *)&buffer[32] = v32;
          v48 = v32;
          *(_OWORD *)buffer = v32;
          *(_OWORD *)&buffer[16] = v32;
          memset(v42, 0, 56);
          *(_QWORD *)&v40.tm_sec = 0xAAAAAAAAAAAAAAAALL;
          time((time_t *)&v40.tm_sec);
          localtime_r((const time_t *)&v40.tm_sec, (tm *)v42);
          strftime(buffer, 0x80uLL, "%b %d %H:%M:%S", (const tm *)v42);
          dprintf(glog_fd, "%s ", buffer);
          dprintf(glog_fd, "%s@%d: bail - !legend\n");
        }
        return MutableCopy;
      }
      if ((v8 != 0) == (v20 != 0))
        return MutableCopy;
LABEL_33:
      v26 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
          goto LABEL_40;
        *(_WORD *)buffer = 0;
        v27 = v26;
      }
      else
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_40;
        *(_WORD *)buffer = 0;
        v27 = MEMORY[0x1E0C81028];
      }
      _os_log_error_impl(&dword_1DB697000, v27, OS_LOG_TYPE_ERROR, "CCOSSerializeWithIOReporterFormatter::createDictionaryWithProcessedIOReporter  rawData or interests not available\n", buffer, 2u);
LABEL_40:
      if (glog_fd)
      {
        *(_QWORD *)&v30 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v30 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v51 = v30;
        v52 = v30;
        v49 = v30;
        v50 = v30;
        *(_OWORD *)&buffer[32] = v30;
        v48 = v30;
        *(_OWORD *)buffer = v30;
        *(_OWORD *)&buffer[16] = v30;
        memset(v42, 0, 56);
        *(_QWORD *)&v40.tm_sec = 0xAAAAAAAAAAAAAAAALL;
        time((time_t *)&v40.tm_sec);
        localtime_r((const time_t *)&v40.tm_sec, (tm *)v42);
        strftime(buffer, 0x80uLL, "%b %d %H:%M:%S", (const tm *)v42);
        dprintf(glog_fd, "%s ", buffer);
        dprintf(glog_fd, "CCOSSerializeWithIOReporterFormatter::createDictionaryWithProcessedIOReporter  rawData or interests not available\n");
      }
      return MutableCopy;
    }
    v15 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_28;
      *(_DWORD *)buffer = 136315906;
      *(_QWORD *)&buffer[4] = "CCIOReportInterests";
      *(_WORD *)&buffer[12] = 1024;
      *(_DWORD *)&buffer[14] = CFDictionaryContainsKey(theDict, CFSTR("CCIOReportInterests"));
      *(_WORD *)&buffer[18] = 2080;
      *(_QWORD *)&buffer[20] = "CCIOReportRdata";
      *(_WORD *)&buffer[28] = 1024;
      *(_DWORD *)&buffer[30] = CFDictionaryContainsKey(theDict, CFSTR("CCIOReportRdata"));
      v16 = v15;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_28;
      *(_DWORD *)buffer = 136315906;
      *(_QWORD *)&buffer[4] = "CCIOReportInterests";
      *(_WORD *)&buffer[12] = 1024;
      *(_DWORD *)&buffer[14] = CFDictionaryContainsKey(theDict, CFSTR("CCIOReportInterests"));
      *(_WORD *)&buffer[18] = 2080;
      *(_QWORD *)&buffer[20] = "CCIOReportRdata";
      *(_WORD *)&buffer[28] = 1024;
      *(_DWORD *)&buffer[30] = CFDictionaryContainsKey(theDict, CFSTR("CCIOReportRdata"));
      v16 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v16, OS_LOG_TYPE_ERROR, "CCOSSerializeWithIOReporterFormatter::createDictionaryWithProcessedIOReporter  contains %s %d contains %s %d\n", buffer, 0x22u);
LABEL_28:
    if (glog_fd)
    {
      *(_QWORD *)&v24 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v51 = v24;
      v52 = v24;
      v49 = v24;
      v50 = v24;
      *(_OWORD *)&buffer[32] = v24;
      v48 = v24;
      *(_OWORD *)buffer = v24;
      *(_OWORD *)&buffer[16] = v24;
      memset(v42, 0, 56);
      *(_QWORD *)&v40.tm_sec = 0xAAAAAAAAAAAAAAAALL;
      time((time_t *)&v40.tm_sec);
      localtime_r((const time_t *)&v40.tm_sec, (tm *)v42);
      strftime(buffer, 0x80uLL, "%b %d %H:%M:%S", (const tm *)v42);
      dprintf(glog_fd, "%s ", buffer);
      v25 = glog_fd;
      CFDictionaryContainsKey(theDict, CFSTR("CCIOReportInterests"));
      CFDictionaryContainsKey(theDict, CFSTR("CCIOReportRdata"));
      dprintf(v25, "CCOSSerializeWithIOReporterFormatter::createDictionaryWithProcessedIOReporter  contains %s %d contains %s %d\n");
    }
    return MutableCopy;
  }
  v13 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    *(_WORD *)buffer = 0;
    v14 = v13;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    *(_WORD *)buffer = 0;
    v14 = MEMORY[0x1E0C81028];
  }
  _os_log_error_impl(&dword_1DB697000, v14, OS_LOG_TYPE_ERROR, "CCOSSerializeWithIOReporterFormatter::createDictionaryWithProcessedIOReporter  failed to duplicate dictionary\n", buffer, 2u);
LABEL_15:
  if (glog_fd)
  {
    *(_QWORD *)&v17 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v17 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v51 = v17;
    v52 = v17;
    v49 = v17;
    v50 = v17;
    *(_OWORD *)&buffer[32] = v17;
    v48 = v17;
    *(_OWORD *)buffer = v17;
    *(_OWORD *)&buffer[16] = v17;
    memset(v42, 0, 56);
    *(_QWORD *)&v40.tm_sec = 0xAAAAAAAAAAAAAAAALL;
    time((time_t *)&v40.tm_sec);
    localtime_r((const time_t *)&v40.tm_sec, (tm *)v42);
    strftime(buffer, 0x80uLL, "%b %d %H:%M:%S", (const tm *)v42);
    dprintf(glog_fd, "%s ", buffer);
    dprintf(glog_fd, "CCOSSerializeWithIOReporterFormatter::createDictionaryWithProcessedIOReporter  failed to duplicate dictionary\n", v38);
  }
  return MutableCopy;
}

uint64_t CCOSSerializeWithIOReporterFormatter::convertInterestsArrayToIOReportLegend(CCOSSerializeWithIOReporterFormatter *this, __CFDictionary *a2, CFArrayRef theArray)
{
  CFIndex v5;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v7;
  CFTypeID v8;
  CCOSSerializeWithIOReporterFormatter *TypeID;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  __int128 v16;
  __int128 v17;
  time_t v19;
  tm v20;
  uint8_t buf[16];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;

  v5 = 0;
  v29 = *MEMORY[0x1E0C80C00];
  while (1)
  {
    if (CFArrayGetCount(theArray) <= v5)
      return 0;
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(theArray, v5);
    if (!ValueAtIndex)
      break;
    v7 = ValueAtIndex;
    v8 = CFGetTypeID(ValueAtIndex);
    TypeID = (CCOSSerializeWithIOReporterFormatter *)CFDictionaryGetTypeID();
    if ((CCOSSerializeWithIOReporterFormatter *)v8 != TypeID)
      break;
    v10 = CCOSSerializeWithIOReporterFormatter::storeChannelDescriptionFromDriverGroup(TypeID, a2, v7);
    ++v5;
    if ((_DWORD)v10)
    {
      v11 = v10;
      v12 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          v13 = v12;
          goto LABEL_23;
        }
      }
      else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v13 = MEMORY[0x1E0C81028];
LABEL_23:
        _os_log_error_impl(&dword_1DB697000, v13, OS_LOG_TYPE_ERROR, "CCOSSerializeWithIOReporterFormatter::storeChannelDescriptionFromSubscription  failed to store Channel Description\n", buf, 2u);
      }
      if (glog_fd)
      {
        *(_QWORD *)&v17 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v17 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v27 = v17;
        v28 = v17;
        v25 = v17;
        v26 = v17;
        v23 = v17;
        v24 = v17;
        *(_OWORD *)buf = v17;
        v22 = v17;
        memset(&v20, 0, sizeof(v20));
        v19 = 0xAAAAAAAAAAAAAAAALL;
        time(&v19);
        localtime_r(&v19, &v20);
        strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v20);
        dprintf(glog_fd, "%s ", (const char *)buf);
        dprintf(glog_fd, "CCOSSerializeWithIOReporterFormatter::storeChannelDescriptionFromSubscription  failed to store Channel Description\n");
      }
      return v11;
    }
  }
  v14 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v15 = v14;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_WORD *)buf = 0;
    v15 = MEMORY[0x1E0C81028];
  }
  _os_log_error_impl(&dword_1DB697000, v15, OS_LOG_TYPE_ERROR, "CCOSSerializeWithIOReporterFormatter::storeChannelDescriptionFromSubscription  didnt find or not a dict in array\n", buf, 2u);
LABEL_14:
  v11 = 3758097136;
  if (glog_fd)
  {
    *(_QWORD *)&v16 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v27 = v16;
    v28 = v16;
    v25 = v16;
    v26 = v16;
    v23 = v16;
    v24 = v16;
    *(_OWORD *)buf = v16;
    v22 = v16;
    memset(&v20, 0, sizeof(v20));
    v19 = 0xAAAAAAAAAAAAAAAALL;
    time(&v19);
    localtime_r(&v19, &v20);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v20);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCOSSerializeWithIOReporterFormatter::storeChannelDescriptionFromSubscription  didnt find or not a dict in array\n");
  }
  return v11;
}

uint64_t CCOSSerializeWithIOReporterFormatter::storeChannelDescriptionFromDriverGroup(CCOSSerializeWithIOReporterFormatter *this, __CFDictionary *a2, CFDictionaryRef theDict)
{
  const void *Value;
  const void *v5;
  CFTypeID v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  __int128 v12;
  __int128 v13;
  int v14;
  const void *v15;
  const void *v16;
  CFTypeID v17;
  uint64_t v18;
  CFTypeID TypeID;
  CFTypeID v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  __int128 v24;
  __int128 v25;
  int v26;
  const __CFNumber *v27;
  const __CFNumber *v28;
  CFTypeID v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  CFTypeID v35;
  CFTypeID v36;
  NSObject *v37;
  __int128 v38;
  __int128 v39;
  int v40;
  __int128 v41;
  const __CFString *v42;
  CFStringRef v43;
  CFTypeID v44;
  const __CFDictionary *v45;
  uint64_t MatchingService;
  __int128 v47;
  uint64_t v48;
  CFTypeID v49;
  CFTypeID v50;
  NSObject *v51;
  uint64_t v52;
  NSObject *v53;
  __int128 v54;
  int v55;
  __int128 v56;
  const void *v57;
  const void *v58;
  CFTypeID v59;
  uint64_t v60;
  CFTypeID v61;
  CFTypeID v62;
  NSObject *v63;
  __int128 v64;
  int v65;
  CFTypeID v66;
  CFTypeID v67;
  const void *v68;
  const void *v69;
  CFTypeID v70;
  uint64_t v71;
  CFTypeID v72;
  CFTypeID v73;
  NSObject *v74;
  uint64_t v75;
  NSObject *v76;
  __int128 v77;
  __int128 v78;
  int v79;
  CFIndex v80;
  _BOOL4 v81;
  const __CFArray *ValueAtIndex;
  const __CFArray *v83;
  CFTypeID v84;
  const __CFNumber *v85;
  const __CFNumber *v86;
  CFTypeID v87;
  const __CFNumber *v88;
  const __CFNumber *v89;
  CFTypeID v90;
  const void *v91;
  const void *v92;
  CFTypeID v93;
  const void *v94;
  uint64_t v95;
  uint64_t v96;
  _BOOL4 v97;
  uint64_t v98;
  uint64_t v99;
  NSObject *v100;
  __int128 v101;
  CFTypeID v103;
  CFTypeID v104;
  CFTypeID v105;
  CFTypeID v106;
  CFTypeID v107;
  CFTypeID v108;
  CFTypeID v109;
  CFTypeID v110;
  CFTypeID v111;
  CFTypeID v112;
  unsigned int v113;
  time_t v115;
  tm v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t valuePtr;
  _BYTE cStr[32];
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  uint64_t v127;

  v127 = *MEMORY[0x1E0C80C00];
  v118 = 0;
  valuePtr = 0;
  v117 = 0;
  Value = CFDictionaryGetValue(theDict, CFSTR("IOReportGroupName"));
  if (!Value)
  {
    v8 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_11;
      *(_DWORD *)cStr = 136315138;
      *(_QWORD *)&cStr[4] = "IOReportGroupName";
      v9 = v8;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_11;
      *(_DWORD *)cStr = 136315138;
      *(_QWORD *)&cStr[4] = "IOReportGroupName";
      v9 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v9, OS_LOG_TYPE_ERROR, "CCOSSerializeWithIOReporterFormatter::storeChannelDescriptionFromDriverGroup %s expected \n", cStr, 0xCu);
LABEL_11:
    if (glog_fd)
    {
      *(_QWORD *)&v12 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v125 = v12;
      v126 = v12;
      v123 = v12;
      v124 = v12;
      v122 = v12;
      *(_OWORD *)&cStr[16] = v12;
      v121 = v12;
      *(_OWORD *)cStr = v12;
      memset(&v116, 0, sizeof(v116));
      v115 = 0xAAAAAAAAAAAAAAAALL;
      time(&v115);
      localtime_r(&v115, &v116);
      strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", &v116);
      dprintf(glog_fd, "%s ", cStr);
      dprintf(glog_fd, "CCOSSerializeWithIOReporterFormatter::storeChannelDescriptionFromDriverGroup %s expected \n");
    }
    goto LABEL_16;
  }
  v5 = Value;
  v6 = CFGetTypeID(Value);
  if (v6 == CFStringGetTypeID())
  {
    v7 = 0;
    goto LABEL_17;
  }
  v10 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_DWORD *)cStr = 136315906;
    *(_QWORD *)&cStr[4] = "IOReportGroupName";
    *(_WORD *)&cStr[12] = 2080;
    *(_QWORD *)&cStr[14] = " NOT";
    *(_WORD *)&cStr[22] = 2048;
    *(_QWORD *)&cStr[24] = CFStringGetTypeID();
    LOWORD(v121) = 2048;
    *(_QWORD *)((char *)&v121 + 2) = CFGetTypeID(v5);
    v11 = v10;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_DWORD *)cStr = 136315906;
    *(_QWORD *)&cStr[4] = "IOReportGroupName";
    *(_WORD *)&cStr[12] = 2080;
    *(_QWORD *)&cStr[14] = " NOT";
    *(_WORD *)&cStr[22] = 2048;
    *(_QWORD *)&cStr[24] = CFStringGetTypeID();
    LOWORD(v121) = 2048;
    *(_QWORD *)((char *)&v121 + 2) = CFGetTypeID(v5);
    v11 = MEMORY[0x1E0C81028];
  }
  _os_log_error_impl(&dword_1DB697000, v11, OS_LOG_TYPE_ERROR, "CCOSSerializeWithIOReporterFormatter::storeChannelDescriptionFromDriverGroup %s expected obj is %s NULL, with type %ld, but has type %ld\n", cStr, 0x2Au);
LABEL_14:
  if (glog_fd)
  {
    *(_QWORD *)&v13 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v125 = v13;
    v126 = v13;
    v123 = v13;
    v124 = v13;
    v122 = v13;
    *(_OWORD *)&cStr[16] = v13;
    v121 = v13;
    *(_OWORD *)cStr = v13;
    memset(&v116, 0, sizeof(v116));
    v115 = 0xAAAAAAAAAAAAAAAALL;
    time(&v115);
    localtime_r(&v115, &v116);
    strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", &v116);
    dprintf(glog_fd, "%s ", cStr);
    v14 = glog_fd;
    CFStringGetTypeID();
    CFGetTypeID(v5);
    dprintf(v14, "CCOSSerializeWithIOReporterFormatter::storeChannelDescriptionFromDriverGroup %s expected obj is %s NULL, with type %ld, but has type %ld\n");
  }
LABEL_16:
  v7 = -536870160;
LABEL_17:
  v15 = CFDictionaryGetValue(theDict, CFSTR("IOReportSubGroupName"));
  if (!v15)
  {
    v22 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_26;
      *(_DWORD *)cStr = 136315138;
      *(_QWORD *)&cStr[4] = "IOReportSubGroupName";
      v23 = v22;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_26;
      *(_DWORD *)cStr = 136315138;
      *(_QWORD *)&cStr[4] = "IOReportSubGroupName";
      v23 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v23, OS_LOG_TYPE_ERROR, "CCOSSerializeWithIOReporterFormatter::storeChannelDescriptionFromDriverGroup %s expected \n", cStr, 0xCu);
LABEL_26:
    if (glog_fd)
    {
      *(_QWORD *)&v24 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v125 = v24;
      v126 = v24;
      v123 = v24;
      v124 = v24;
      v122 = v24;
      *(_OWORD *)&cStr[16] = v24;
      v121 = v24;
      *(_OWORD *)cStr = v24;
      memset(&v116, 0, sizeof(v116));
      v115 = 0xAAAAAAAAAAAAAAAALL;
      time(&v115);
      localtime_r(&v115, &v116);
      strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", &v116);
      dprintf(glog_fd, "%s ", cStr);
      dprintf(glog_fd, "CCOSSerializeWithIOReporterFormatter::storeChannelDescriptionFromDriverGroup %s expected \n");
    }
    goto LABEL_31;
  }
  v16 = v15;
  v17 = CFGetTypeID(v15);
  if (v17 == CFStringGetTypeID())
    goto LABEL_32;
  v18 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
      goto LABEL_29;
    TypeID = CFStringGetTypeID();
    v20 = CFGetTypeID(v16);
    *(_DWORD *)cStr = 136315906;
    *(_QWORD *)&cStr[4] = "IOReportGroupName";
    *(_WORD *)&cStr[12] = 2080;
    *(_QWORD *)&cStr[14] = " NOT";
    *(_WORD *)&cStr[22] = 2048;
    *(_QWORD *)&cStr[24] = TypeID;
    LOWORD(v121) = 2048;
    *(_QWORD *)((char *)&v121 + 2) = v20;
    v21 = v18;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_29;
    v103 = CFStringGetTypeID();
    v104 = CFGetTypeID(v16);
    *(_DWORD *)cStr = 136315906;
    *(_QWORD *)&cStr[4] = "IOReportGroupName";
    *(_WORD *)&cStr[12] = 2080;
    *(_QWORD *)&cStr[14] = " NOT";
    *(_WORD *)&cStr[22] = 2048;
    *(_QWORD *)&cStr[24] = v103;
    LOWORD(v121) = 2048;
    *(_QWORD *)((char *)&v121 + 2) = v104;
    v21 = MEMORY[0x1E0C81028];
  }
  _os_log_error_impl(&dword_1DB697000, v21, OS_LOG_TYPE_ERROR, "CCOSSerializeWithIOReporterFormatter::storeChannelDescriptionFromDriverGroup %s expected obj is%s NULL, with type %ld, but has type %ld\n", cStr, 0x2Au);
LABEL_29:
  if (glog_fd)
  {
    *(_QWORD *)&v25 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v25 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v125 = v25;
    v126 = v25;
    v123 = v25;
    v124 = v25;
    v122 = v25;
    *(_OWORD *)&cStr[16] = v25;
    v121 = v25;
    *(_OWORD *)cStr = v25;
    memset(&v116, 0, sizeof(v116));
    v115 = 0xAAAAAAAAAAAAAAAALL;
    time(&v115);
    localtime_r(&v115, &v116);
    strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", &v116);
    dprintf(glog_fd, "%s ", cStr);
    v26 = glog_fd;
    CFStringGetTypeID();
    CFGetTypeID(v16);
    dprintf(v26, "CCOSSerializeWithIOReporterFormatter::storeChannelDescriptionFromDriverGroup %s expected obj is%s NULL, with type %ld, but has type %ld\n");
  }
LABEL_31:
  v7 = -536870160;
LABEL_32:
  v27 = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("DriverID"));
  if (v27)
  {
    v28 = v27;
    v29 = CFGetTypeID(v27);
    if (v29 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v28, kCFNumberLongLongType, &valuePtr);
      if (valuePtr)
        goto LABEL_54;
      v30 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)cStr = 0;
          v31 = v30;
LABEL_158:
          _os_log_error_impl(&dword_1DB697000, v31, OS_LOG_TYPE_ERROR, "CCOSSerializeWithIOReporterFormatter::storeChannelDescriptionFromDriverGroup kIOReportDriverIDKey invalid value \n", cStr, 2u);
        }
      }
      else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)cStr = 0;
        v31 = MEMORY[0x1E0C81028];
        goto LABEL_158;
      }
      if (glog_fd)
      {
        *(_QWORD *)&v41 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v41 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v125 = v41;
        v126 = v41;
        v123 = v41;
        v124 = v41;
        v122 = v41;
        *(_OWORD *)&cStr[16] = v41;
        v121 = v41;
        *(_OWORD *)cStr = v41;
        memset(&v116, 0, sizeof(v116));
        v115 = 0xAAAAAAAAAAAAAAAALL;
        time(&v115);
        localtime_r(&v115, &v116);
        strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", &v116);
        dprintf(glog_fd, "%s ", cStr);
        dprintf(glog_fd, "CCOSSerializeWithIOReporterFormatter::storeChannelDescriptionFromDriverGroup kIOReportDriverIDKey invalid value \n");
      }
      v7 = -536870911;
      goto LABEL_54;
    }
    v34 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_48;
      v35 = CFNumberGetTypeID();
      v36 = CFGetTypeID(v28);
      *(_DWORD *)cStr = 136315650;
      *(_QWORD *)&cStr[4] = " NOT";
      *(_WORD *)&cStr[12] = 2048;
      *(_QWORD *)&cStr[14] = v35;
      *(_WORD *)&cStr[22] = 2048;
      *(_QWORD *)&cStr[24] = v36;
      v37 = v34;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_48;
      v105 = CFNumberGetTypeID();
      v106 = CFGetTypeID(v28);
      *(_DWORD *)cStr = 136315650;
      *(_QWORD *)&cStr[4] = " NOT";
      *(_WORD *)&cStr[12] = 2048;
      *(_QWORD *)&cStr[14] = v105;
      *(_WORD *)&cStr[22] = 2048;
      *(_QWORD *)&cStr[24] = v106;
      v37 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v37, OS_LOG_TYPE_ERROR, "CCOSSerializeWithIOReporterFormatter::storeChannelDescriptionFromDriverGroup kIOReportDriverIDKey expected obj is%s NULL, with type %ld, but has type %ld\n", cStr, 0x20u);
LABEL_48:
    v7 = -536870160;
    if (glog_fd)
    {
      *(_QWORD *)&v39 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v39 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v125 = v39;
      v126 = v39;
      v123 = v39;
      v124 = v39;
      v122 = v39;
      *(_OWORD *)&cStr[16] = v39;
      v121 = v39;
      *(_OWORD *)cStr = v39;
      memset(&v116, 0, sizeof(v116));
      v115 = 0xAAAAAAAAAAAAAAAALL;
      time(&v115);
      localtime_r(&v115, &v116);
      strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", &v116);
      dprintf(glog_fd, "%s ", cStr);
      v40 = glog_fd;
      CFNumberGetTypeID();
      CFGetTypeID(v28);
      dprintf(v40, "CCOSSerializeWithIOReporterFormatter::storeChannelDescriptionFromDriverGroup kIOReportDriverIDKey expected obj is%s NULL, with type %ld, but has type %ld\n");
    }
    goto LABEL_54;
  }
  v32 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
      goto LABEL_45;
    *(_WORD *)cStr = 0;
    v33 = v32;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_45;
    *(_WORD *)cStr = 0;
    v33 = MEMORY[0x1E0C81028];
  }
  _os_log_error_impl(&dword_1DB697000, v33, OS_LOG_TYPE_ERROR, "CCOSSerializeWithIOReporterFormatter::storeChannelDescriptionFromDriverGroup kIOReportDriverIDKey expected \n", cStr, 2u);
LABEL_45:
  v7 = -536870160;
  if (glog_fd)
  {
    *(_QWORD *)&v38 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v38 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v125 = v38;
    v126 = v38;
    v123 = v38;
    v124 = v38;
    v122 = v38;
    *(_OWORD *)&cStr[16] = v38;
    v121 = v38;
    *(_OWORD *)cStr = v38;
    memset(&v116, 0, sizeof(v116));
    v115 = 0xAAAAAAAAAAAAAAAALL;
    time(&v115);
    localtime_r(&v115, &v116);
    strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", &v116);
    dprintf(glog_fd, "%s ", cStr);
    dprintf(glog_fd, "CCOSSerializeWithIOReporterFormatter::storeChannelDescriptionFromDriverGroup kIOReportDriverIDKey expected \n");
  }
LABEL_54:
  v42 = (const __CFString *)CFDictionaryGetValue(theDict, CFSTR("DriverName"));
  if (!v42)
  {
    v45 = IORegistryEntryIDMatching(valuePtr);
    if (v45)
    {
      MatchingService = IOServiceGetMatchingService(*MEMORY[0x1E0CBBAA8], v45);
      if ((_DWORD)MatchingService)
      {
        *(_QWORD *)&v47 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v47 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v125 = v47;
        v126 = v47;
        v123 = v47;
        v124 = v47;
        v122 = v47;
        *(_OWORD *)&cStr[16] = v47;
        v121 = v47;
        *(_OWORD *)cStr = v47;
        MEMORY[0x1DF0B21DC](MatchingService, cStr);
        v43 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], cStr, 0);
        goto LABEL_73;
      }
    }
    v52 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_70;
      *(_WORD *)cStr = 0;
      v53 = v52;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_70;
      *(_WORD *)cStr = 0;
      v53 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v53, OS_LOG_TYPE_ERROR, "CCOSSerializeWithIOReporterFormatter::storeChannelDescriptionFromDriverGroup kIOReportDriverNameKey expected, couldn't resolve device \n", cStr, 2u);
LABEL_70:
    if (glog_fd)
    {
      *(_QWORD *)&v56 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v56 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v125 = v56;
      v126 = v56;
      v123 = v56;
      v124 = v56;
      v122 = v56;
      *(_OWORD *)&cStr[16] = v56;
      v121 = v56;
      *(_OWORD *)cStr = v56;
      memset(&v116, 0, sizeof(v116));
      v115 = 0xAAAAAAAAAAAAAAAALL;
      time(&v115);
      localtime_r(&v115, &v116);
      strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", &v116);
      dprintf(glog_fd, "%s ", cStr);
      dprintf(glog_fd, "CCOSSerializeWithIOReporterFormatter::storeChannelDescriptionFromDriverGroup kIOReportDriverNameKey expected, couldn't resolve device \n");
    }
    goto LABEL_72;
  }
  v43 = v42;
  v44 = CFGetTypeID(v42);
  if (v44 != CFStringGetTypeID())
  {
    v48 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_67;
      v49 = CFStringGetTypeID();
      v50 = CFGetTypeID(v43);
      *(_DWORD *)cStr = 136315650;
      *(_QWORD *)&cStr[4] = " NOT";
      *(_WORD *)&cStr[12] = 2048;
      *(_QWORD *)&cStr[14] = v49;
      *(_WORD *)&cStr[22] = 2048;
      *(_QWORD *)&cStr[24] = v50;
      v51 = v48;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_67;
      v107 = CFStringGetTypeID();
      v108 = CFGetTypeID(v43);
      *(_DWORD *)cStr = 136315650;
      *(_QWORD *)&cStr[4] = " NOT";
      *(_WORD *)&cStr[12] = 2048;
      *(_QWORD *)&cStr[14] = v107;
      *(_WORD *)&cStr[22] = 2048;
      *(_QWORD *)&cStr[24] = v108;
      v51 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v51, OS_LOG_TYPE_ERROR, "CCOSSerializeWithIOReporterFormatter::storeChannelDescriptionFromDriverGroup kIOReportDriverNameKey expected obj %s is NULL, with type %ld, but has type %ld\n", cStr, 0x20u);
LABEL_67:
    if (glog_fd)
    {
      *(_QWORD *)&v54 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v54 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v125 = v54;
      v126 = v54;
      v123 = v54;
      v124 = v54;
      v122 = v54;
      *(_OWORD *)&cStr[16] = v54;
      v121 = v54;
      *(_OWORD *)cStr = v54;
      memset(&v116, 0, sizeof(v116));
      v115 = 0xAAAAAAAAAAAAAAAALL;
      time(&v115);
      localtime_r(&v115, &v116);
      strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", &v116);
      dprintf(glog_fd, "%s ", cStr);
      v55 = glog_fd;
      CFStringGetTypeID();
      CFGetTypeID(v43);
      dprintf(v55, "CCOSSerializeWithIOReporterFormatter::storeChannelDescriptionFromDriverGroup kIOReportDriverNameKey expected obj %s is NULL, with type %ld, but has type %ld\n");
    }
LABEL_72:
    v43 = 0;
    v7 = -536870160;
    goto LABEL_73;
  }
  CFRetain(v43);
LABEL_73:
  v57 = CFDictionaryGetValue(theDict, CFSTR("IOReportChannelInfo"));
  v58 = v57;
  if (!v57)
    goto LABEL_81;
  v59 = CFGetTypeID(v57);
  if (v59 == CFDictionaryGetTypeID())
    goto LABEL_81;
  v60 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
      goto LABEL_79;
    v61 = CFDictionaryGetTypeID();
    v62 = CFGetTypeID(v58);
    *(_DWORD *)cStr = 136315906;
    *(_QWORD *)&cStr[4] = "IOReportChannelInfo";
    *(_WORD *)&cStr[12] = 2080;
    *(_QWORD *)&cStr[14] = " NOT";
    *(_WORD *)&cStr[22] = 2048;
    *(_QWORD *)&cStr[24] = v61;
    LOWORD(v121) = 2048;
    *(_QWORD *)((char *)&v121 + 2) = v62;
    v63 = v60;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_79;
    v109 = CFDictionaryGetTypeID();
    v110 = CFGetTypeID(v58);
    *(_DWORD *)cStr = 136315906;
    *(_QWORD *)&cStr[4] = "IOReportChannelInfo";
    *(_WORD *)&cStr[12] = 2080;
    *(_QWORD *)&cStr[14] = " NOT";
    *(_WORD *)&cStr[22] = 2048;
    *(_QWORD *)&cStr[24] = v109;
    LOWORD(v121) = 2048;
    *(_QWORD *)((char *)&v121 + 2) = v110;
    v63 = MEMORY[0x1E0C81028];
  }
  _os_log_error_impl(&dword_1DB697000, v63, OS_LOG_TYPE_ERROR, "CCOSSerializeWithIOReporterFormatter::storeChannelDescriptionFromDriverGroup %s expected obj %s is NULL, with type %ld, but has type %ld\n", cStr, 0x2Au);
LABEL_79:
  if (glog_fd)
  {
    *(_QWORD *)&v64 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v64 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v125 = v64;
    v126 = v64;
    v123 = v64;
    v124 = v64;
    v122 = v64;
    *(_OWORD *)&cStr[16] = v64;
    v121 = v64;
    *(_OWORD *)cStr = v64;
    memset(&v116, 0, sizeof(v116));
    v115 = 0xAAAAAAAAAAAAAAAALL;
    time(&v115);
    localtime_r(&v115, &v116);
    strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", &v116);
    dprintf(glog_fd, "%s ", cStr);
    v65 = glog_fd;
    v66 = CFDictionaryGetTypeID();
    v67 = CFGetTypeID(v58);
    dprintf(v65, "CCOSSerializeWithIOReporterFormatter::storeChannelDescriptionFromDriverGroup %s expected obj %s is NULL, with type %ld, but has type %ld\n", "IOReportChannelInfo", " NOT", v66, v67);
  }
LABEL_81:
  v68 = CFDictionaryGetValue(theDict, CFSTR("IOReportChannels"));
  v69 = v68;
  if (!v68)
  {
    v75 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_90;
      *(_DWORD *)cStr = 136315138;
      *(_QWORD *)&cStr[4] = "IOReportChannels";
      v76 = v75;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_90;
      *(_DWORD *)cStr = 136315138;
      *(_QWORD *)&cStr[4] = "IOReportChannels";
      v76 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v76, OS_LOG_TYPE_ERROR, "CCOSSerializeWithIOReporterFormatter::storeChannelDescriptionFromDriverGroup %s expected \n", cStr, 0xCu);
LABEL_90:
    if (glog_fd)
    {
      *(_QWORD *)&v77 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v77 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v125 = v77;
      v126 = v77;
      v123 = v77;
      v124 = v77;
      v122 = v77;
      *(_OWORD *)&cStr[16] = v77;
      v121 = v77;
      *(_OWORD *)cStr = v77;
      memset(&v116, 0, sizeof(v116));
      v115 = 0xAAAAAAAAAAAAAAAALL;
      time(&v115);
      localtime_r(&v115, &v116);
      strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", &v116);
      dprintf(glog_fd, "%s ", cStr);
      dprintf(glog_fd, "CCOSSerializeWithIOReporterFormatter::storeChannelDescriptionFromDriverGroup %s expected \n");
    }
    goto LABEL_95;
  }
  v70 = CFGetTypeID(v68);
  if (v70 == CFArrayGetTypeID())
    goto LABEL_96;
  v71 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
      goto LABEL_93;
    v72 = CFArrayGetTypeID();
    v73 = CFGetTypeID(v69);
    *(_DWORD *)cStr = 136315906;
    *(_QWORD *)&cStr[4] = "IOReportChannels";
    *(_WORD *)&cStr[12] = 2080;
    *(_QWORD *)&cStr[14] = " NOT";
    *(_WORD *)&cStr[22] = 2048;
    *(_QWORD *)&cStr[24] = v72;
    LOWORD(v121) = 2048;
    *(_QWORD *)((char *)&v121 + 2) = v73;
    v74 = v71;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_93;
    v111 = CFArrayGetTypeID();
    v112 = CFGetTypeID(v69);
    *(_DWORD *)cStr = 136315906;
    *(_QWORD *)&cStr[4] = "IOReportChannels";
    *(_WORD *)&cStr[12] = 2080;
    *(_QWORD *)&cStr[14] = " NOT";
    *(_WORD *)&cStr[22] = 2048;
    *(_QWORD *)&cStr[24] = v111;
    LOWORD(v121) = 2048;
    *(_QWORD *)((char *)&v121 + 2) = v112;
    v74 = MEMORY[0x1E0C81028];
  }
  _os_log_error_impl(&dword_1DB697000, v74, OS_LOG_TYPE_ERROR, "CCOSSerializeWithIOReporterFormatter::storeChannelDescriptionFromDriverGroup %s expected obj %s is NULL, with type %ld, but has type %ld\n", cStr, 0x2Au);
LABEL_93:
  if (glog_fd)
  {
    *(_QWORD *)&v78 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v78 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v125 = v78;
    v126 = v78;
    v123 = v78;
    v124 = v78;
    v122 = v78;
    *(_OWORD *)&cStr[16] = v78;
    v121 = v78;
    *(_OWORD *)cStr = v78;
    memset(&v116, 0, sizeof(v116));
    v115 = 0xAAAAAAAAAAAAAAAALL;
    time(&v115);
    localtime_r(&v115, &v116);
    strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", &v116);
    dprintf(glog_fd, "%s ", cStr);
    v79 = glog_fd;
    CFArrayGetTypeID();
    CFGetTypeID(v69);
    dprintf(v79, "CCOSSerializeWithIOReporterFormatter::storeChannelDescriptionFromDriverGroup %s expected obj %s is NULL, with type %ld, but has type %ld\n");
  }
LABEL_95:
  v7 = -536870160;
LABEL_96:
  v80 = 0;
  v113 = v7;
  if (v7)
    v81 = 0;
  else
    v81 = a2 != 0;
  while (CFArrayGetCount((CFArrayRef)v69) > v80)
  {
    ValueAtIndex = (const __CFArray *)CFArrayGetValueAtIndex((CFArrayRef)v69, v80);
    if (!ValueAtIndex)
      break;
    v83 = ValueAtIndex;
    v84 = CFGetTypeID(ValueAtIndex);
    if (v84 != CFArrayGetTypeID() || CFArrayGetCount(v83) < 2)
      break;
    v85 = (const __CFNumber *)CFArrayGetValueAtIndex(v83, 0);
    if (v85)
    {
      v86 = v85;
      v87 = CFGetTypeID(v85);
      if (v87 == CFNumberGetTypeID())
        CFNumberGetValue(v86, kCFNumberSInt64Type, &v118);
    }
    v88 = (const __CFNumber *)CFArrayGetValueAtIndex(v83, 1);
    if (v88)
    {
      v89 = v88;
      v90 = CFGetTypeID(v88);
      if (v90 == CFNumberGetTypeID())
        CFNumberGetValue(v89, kCFNumberSInt64Type, &v117);
    }
    v91 = CFArrayGetValueAtIndex(v83, 2);
    if (v91)
    {
      v92 = v91;
      v93 = CFGetTypeID(v91);
      if (v93 == CFStringGetTypeID())
        v94 = v92;
      else
        v94 = 0;
    }
    else
    {
      v94 = 0;
    }
    v96 = v118;
    v95 = valuePtr;
    if (valuePtr)
      v97 = v81;
    else
      v97 = 0;
    v98 = v117;
    if (v94 && v97 && v43 && v118 && v117)
    {
      IOReportAddChannelDescription();
      goto LABEL_129;
    }
    v99 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_127;
      *(_DWORD *)cStr = 67110400;
      *(_DWORD *)&cStr[4] = a2 != 0;
      *(_WORD *)&cStr[8] = 1024;
      *(_DWORD *)&cStr[10] = v95 != 0;
      *(_WORD *)&cStr[14] = 1024;
      *(_DWORD *)&cStr[16] = v43 != 0;
      *(_WORD *)&cStr[20] = 1024;
      *(_DWORD *)&cStr[22] = v96 != 0;
      *(_WORD *)&cStr[26] = 1024;
      *(_DWORD *)&cStr[28] = v98 != 0;
      LOWORD(v121) = 1024;
      *(_DWORD *)((char *)&v121 + 2) = v94 != 0;
      v100 = v99;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_127;
      *(_DWORD *)cStr = 67110400;
      *(_DWORD *)&cStr[4] = a2 != 0;
      *(_WORD *)&cStr[8] = 1024;
      *(_DWORD *)&cStr[10] = v95 != 0;
      *(_WORD *)&cStr[14] = 1024;
      *(_DWORD *)&cStr[16] = v43 != 0;
      *(_WORD *)&cStr[20] = 1024;
      *(_DWORD *)&cStr[22] = v96 != 0;
      *(_WORD *)&cStr[26] = 1024;
      *(_DWORD *)&cStr[28] = v98 != 0;
      LOWORD(v121) = 1024;
      *(_DWORD *)((char *)&v121 + 2) = v94 != 0;
      v100 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v100, OS_LOG_TYPE_ERROR, "CCOSSerializeWithIOReporterFormatter::storeChannelDescriptionFromDriverGroup failed to find required objects legend %d && providerID %d && providerName %d && channelID %d && channelType %d && channelName %d\n", cStr, 0x26u);
LABEL_127:
    if (glog_fd)
    {
      *(_QWORD *)&v101 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v101 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v125 = v101;
      v126 = v101;
      v123 = v101;
      v124 = v101;
      v122 = v101;
      *(_OWORD *)&cStr[16] = v101;
      v121 = v101;
      *(_OWORD *)cStr = v101;
      memset(&v116, 0, sizeof(v116));
      v115 = 0xAAAAAAAAAAAAAAAALL;
      time(&v115);
      localtime_r(&v115, &v116);
      strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", &v116);
      dprintf(glog_fd, "%s ", cStr);
      dprintf(glog_fd, "CCOSSerializeWithIOReporterFormatter::storeChannelDescriptionFromDriverGroup failed to find required objects legend %d && providerID %d && providerName %d && channelID %d && channelType %d && channelName %d\n", a2 != 0, valuePtr != 0, v43 != 0, v118 != 0, v117 != 0, v94 != 0);
    }
LABEL_129:
    v117 = 0;
    v118 = 0;
    ++v80;
  }
  if (v43)
    CFRelease(v43);
  return v113;
}

char *CCOSSerializeWithIOReporterFormatter::withRegistryEntry(CCOSSerializeWithIOReporterFormatter *this)
{
  io_object_t v1;
  char *v2;

  v1 = this;
  v2 = (char *)malloc_type_malloc(0x28uLL, 0xEE9A6C17uLL);
  *(_OWORD *)(v2 + 8) = 0u;
  *(_OWORD *)(v2 + 24) = 0u;
  *((_DWORD *)v2 + 2) = 1;
  *(_QWORD *)v2 = off_1EA31F5D8;
  *((_DWORD *)v2 + 8) = v1;
  IOObjectRetain(v1);
  *((_DWORD *)v2 + 3) = v1;
  return v2;
}

uint64_t CCOSSerializeWithIOReporterFormatter::writeLogPayload(CCOSSerializeWithIOReporterFormatter *this, const char *a2)
{
  return (*(uint64_t (**)(CCOSSerializeWithIOReporterFormatter *, const char *))(*(_QWORD *)this + 112))(this, a2);
}

uint64_t CCDataPipeInterface::wakeupTapLoop(CCDataPipeInterface *this)
{
  return IOConnectCallMethod(*((_DWORD *)this + 22), 3u, 0, 0, 0, 0, 0, 0, 0, 0);
}

uint64_t CCDataPipeInterface::freeResources(uint64_t this)
{
  uint64_t v1;

  if (*(int *)(this + 80) >= 3)
  {
    v1 = this;
    this = IOConnectCallScalarMethod(*(_DWORD *)(this + 88), 2u, 0, 0, 0, 0);
    *(_DWORD *)(v1 + 80) = 1;
  }
  return this;
}

CCPipeInterface *CCDataPipeInterface::withRegistryEntry(CCDataPipeInterface *this, CCTap *a2, CCTap *a3)
{
  io_registry_entry_t v4;
  CCPipeInterface *v5;

  v4 = this;
  v5 = (CCPipeInterface *)malloc_type_malloc(0x90uLL, 0xEE9A6C17uLL);
  *(_OWORD *)((char *)v5 + 8) = 0u;
  *(_OWORD *)((char *)v5 + 24) = 0u;
  *(_OWORD *)((char *)v5 + 40) = 0u;
  *(_OWORD *)((char *)v5 + 56) = 0u;
  *(_OWORD *)((char *)v5 + 72) = 0u;
  *(_OWORD *)((char *)v5 + 88) = 0u;
  *(_OWORD *)((char *)v5 + 104) = 0u;
  *(_OWORD *)((char *)v5 + 120) = 0u;
  *((_QWORD *)v5 + 17) = 0;
  *((_DWORD *)v5 + 2) = 1;
  *(_QWORD *)v5 = off_1EA31F678;
  if ((CCPipeInterface::initWithRegistryEntry(v5, v4, a2) & 1) == 0)
  {
    (*(void (**)(CCPipeInterface *))(*(_QWORD *)v5 + 48))(v5);
    return 0;
  }
  return v5;
}

uint64_t CCDataPipeInterface::queryMetaData(uint64_t a1, _QWORD *inputStruct)
{
  size_t v3;
  uint32_t outputCnt;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  outputCnt = 0;
  v3 = inputStruct[1] + 16;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 88), 4u, 0, 0, inputStruct, 0x10uLL, 0, &outputCnt, inputStruct, &v3);
}

uint64_t CCDataPipeInterface::readData(uint64_t a1, _QWORD *inputStruct)
{
  size_t v3;
  uint32_t outputCnt;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  outputCnt = 0;
  v3 = inputStruct[1] + 16;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 88), 5u, 0, 0, inputStruct, 0x10uLL, 0, &outputCnt, inputStruct, &v3);
}

uint64_t CCDataPipeInterface::profileLoaded(CCDataPipeInterface *this)
{
  return IOConnectCallMethod(*((_DWORD *)this + 22), 6u, 0, 0, 0, 0, 0, 0, 0, 0);
}

uint64_t CCDataPipeInterface::profileRemoved(CCDataPipeInterface *this)
{
  return IOConnectCallMethod(*((_DWORD *)this + 22), 7u, 0, 0, 0, 0, 0, 0, 0, 0);
}

uint64_t CCDataPipeInterface::capture(uint64_t a1, void *inputStruct)
{
  return IOConnectCallMethod(*(_DWORD *)(a1 + 88), 8u, 0, 0, inputStruct, 0x90uLL, 0, 0, 0, 0);
}

uint64_t CCDataTap::ccfree(CCDataTap *this)
{
  uint64_t result;

  result = CCTap::freeResources(this);
  if (this)
    return (*(uint64_t (**)(CCDataTap *))(*(_QWORD *)this + 8))(this);
  return result;
}

uint64_t CCDataTap::isActive(CCDataTap *this, CFAbsoluteTime a2)
{
  uint64_t v3;
  int v4;
  NSObject *v5;
  uint64_t v7;
  int v8;
  NSObject *v9;
  int v10;
  __int128 v11;
  int v13;
  __int128 v14;
  time_t v15;
  tm v16;
  _BYTE buf[32];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!*((_BYTE *)this + 184))
  {
    if (CFAbsoluteTimeGetCurrent() - *((double *)this + 24) >= a2)
      return 0;
    v7 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
        goto LABEL_18;
      v8 = *((_DWORD *)this + 4);
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&buf[4] = v8;
      *(_WORD *)&buf[8] = 2048;
      *(CFAbsoluteTime *)&buf[10] = a2;
      v9 = v7;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        goto LABEL_18;
      v13 = *((_DWORD *)this + 4);
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&buf[4] = v13;
      *(_WORD *)&buf[8] = 2048;
      *(CFAbsoluteTime *)&buf[10] = a2;
      v9 = MEMORY[0x1E0C81028];
    }
    _os_log_impl(&dword_1DB697000, v9, OS_LOG_TYPE_DEFAULT, "CCDataTap::isActive idle < duration  3 entry:%u duration:%f\n", buf, 0x12u);
LABEL_18:
    if (glog_fd)
    {
      *(_QWORD *)&v14 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v22 = v14;
      v23 = v14;
      v20 = v14;
      v21 = v14;
      v18 = v14;
      v19 = v14;
      *(_OWORD *)buf = v14;
      *(_OWORD *)&buf[16] = v14;
      memset(&v16, 0, sizeof(v16));
      v15 = 0xAAAAAAAAAAAAAAAALL;
      time(&v15);
      localtime_r(&v15, &v16);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v16);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "CCDataTap::isActive idle < duration  3 entry:%u duration:%f\n");
    }
    return 1;
  }
  v3 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    v4 = *((_DWORD *)this + 4);
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v4;
    v5 = v3;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_12;
    v10 = *((_DWORD *)this + 4);
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v10;
    v5 = MEMORY[0x1E0C81028];
  }
  _os_log_impl(&dword_1DB697000, v5, OS_LOG_TYPE_DEFAULT, "CCDataTap::isActive tap is fBusy Active 2 entry:%u\n", buf, 8u);
LABEL_12:
  if (glog_fd)
  {
    *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v22 = v11;
    v23 = v11;
    v20 = v11;
    v21 = v11;
    v18 = v11;
    v19 = v11;
    *(_OWORD *)buf = v11;
    *(_OWORD *)&buf[16] = v11;
    memset(&v16, 0, sizeof(v16));
    v15 = 0xAAAAAAAAAAAAAAAALL;
    time(&v15);
    localtime_r(&v15, &v16);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v16);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "CCDataTap::isActive tap is fBusy Active 2 entry:%u\n");
  }
  return 1;
}

uint64_t CCDataTap::profileLoaded(CFStringRef *this)
{
  uint64_t v2;
  const char *CStringPtr;
  const char *v4;
  NSObject *v5;
  const char *v6;
  const char *v7;
  __int128 v8;
  int v9;
  const char *v10;
  const char *v11;
  CFStringRef v12;
  _DWORD *v13;
  time_t v15;
  tm v16;
  _BYTE buf[32];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    CStringPtr = CFStringGetCStringPtr(this[5], 0);
    v4 = CFStringGetCStringPtr(this[6], 0);
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = CStringPtr;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = v4;
    v5 = v2;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    v6 = CFStringGetCStringPtr(this[5], 0);
    v7 = CFStringGetCStringPtr(this[6], 0);
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = v7;
    v5 = MEMORY[0x1E0C81028];
  }
  _os_log_impl(&dword_1DB697000, v5, OS_LOG_TYPE_DEFAULT, "CCDataTap::profileLoaded, Owner: %s, Name: %s\n", buf, 0x16u);
LABEL_7:
  if (glog_fd)
  {
    *(_QWORD *)&v8 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v22 = v8;
    v23 = v8;
    v20 = v8;
    v21 = v8;
    v18 = v8;
    v19 = v8;
    *(_OWORD *)buf = v8;
    *(_OWORD *)&buf[16] = v8;
    memset(&v16, 0, sizeof(v16));
    v15 = 0xAAAAAAAAAAAAAAAALL;
    time(&v15);
    localtime_r(&v15, &v16);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v16);
    dprintf(glog_fd, "%s ", buf);
    v9 = glog_fd;
    v10 = CFStringGetCStringPtr(this[5], 0);
    v11 = CFStringGetCStringPtr(this[6], 0);
    dprintf(v9, "CCDataTap::profileLoaded, Owner: %s, Name: %s\n", v10, v11);
  }
  v12 = this[8];
  if (v12)
  {
    if (v13)
      IOConnectCallMethod(v13[22], 6u, 0, 0, 0, 0, 0, 0, 0, 0);
  }
  return 0;
}

uint64_t CCDataTap::capture(uint64_t a1, const void *a2)
{
  uint64_t v4;
  const char *CStringPtr;
  const char *v6;
  NSObject *v7;
  const char *v8;
  const char *v9;
  __int128 v10;
  int v11;
  const char *v12;
  const char *v13;
  const void *v14;
  _DWORD *v15;
  uint64_t v16;
  time_t v18;
  tm v19;
  _BYTE buf[32];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    CStringPtr = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 40), 0);
    v6 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 48), 0);
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = CStringPtr;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = v6;
    v7 = v4;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    v8 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 40), 0);
    v9 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 48), 0);
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = v9;
    v7 = MEMORY[0x1E0C81028];
  }
  _os_log_impl(&dword_1DB697000, v7, OS_LOG_TYPE_DEFAULT, "CCDataTap::capture, Owner: %s, Name: %s\n", buf, 0x16u);
LABEL_7:
  if (glog_fd)
  {
    *(_QWORD *)&v10 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v25 = v10;
    v26 = v10;
    v23 = v10;
    v24 = v10;
    v21 = v10;
    v22 = v10;
    *(_OWORD *)buf = v10;
    *(_OWORD *)&buf[16] = v10;
    memset(&v19, 0, sizeof(v19));
    v18 = 0xAAAAAAAAAAAAAAAALL;
    time(&v18);
    localtime_r(&v18, &v19);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v19);
    dprintf(glog_fd, "%s ", buf);
    v11 = glog_fd;
    v12 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 40), 0);
    v13 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 48), 0);
    dprintf(v11, "CCDataTap::capture, Owner: %s, Name: %s\n", v12, v13);
  }
  v14 = *(const void **)(a1 + 64);
  if (v14)
  else
    v15 = 0;
  *(CFAbsoluteTime *)(a1 + 192) = CFAbsoluteTimeGetCurrent();
  *(_BYTE *)(a1 + 184) = 1;
  if (v15)
    v16 = IOConnectCallMethod(v15[22], 8u, 0, 0, a2, 0x90uLL, 0, 0, 0, 0);
  else
    v16 = 0;
  *(CFAbsoluteTime *)(a1 + 192) = CFAbsoluteTimeGetCurrent();
  *(_BYTE *)(a1 + 184) = 0;
  return v16;
}

void CCDataTap::tapLoopImpl(CCDataTap *this)
{
  uint64_t v2;
  int v3;
  NSObject *v4;
  int v5;
  __int128 v6;
  uint64_t v7;
  int v8;
  NSObject *v9;
  int v10;
  __int128 v11;
  int v12;
  uint64_t v13;
  int v14;
  NSObject *v15;
  int v16;
  __int128 v17;
  time_t v18;
  tm v19;
  _BYTE buf[32];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v2 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
    {
      v3 = *((_DWORD *)this + 4);
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "tapLoopImpl";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 118;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v3;
      v4 = v2;
LABEL_6:
      _os_log_impl(&dword_1DB697000, v4, OS_LOG_TYPE_DEFAULT, "%s:%d CCDataTap::tapLoopImpl for entry:%u", buf, 0x18u);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v5 = *((_DWORD *)this + 4);
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "tapLoopImpl";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 118;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = v5;
    v4 = MEMORY[0x1E0C81028];
    goto LABEL_6;
  }
  if (glog_fd)
  {
    *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v25 = v6;
    v26 = v6;
    v23 = v6;
    v24 = v6;
    v21 = v6;
    v22 = v6;
    *(_OWORD *)buf = v6;
    *(_OWORD *)&buf[16] = v6;
    memset(&v19, 0, sizeof(v19));
    v18 = 0xAAAAAAAAAAAAAAAALL;
    time(&v18);
    localtime_r(&v18, &v19);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v19);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "%s:%d CCDataTap::tapLoopImpl for entry:%u", "tapLoopImpl", 118, *((_DWORD *)this + 4));
  }
  *((_BYTE *)this + 184) = 1;
  while (1)
  {
    v7 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
        goto LABEL_16;
      v8 = *((_DWORD *)this + 4);
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "tapLoopImpl";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 124;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v8;
      v9 = v7;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        goto LABEL_16;
      v10 = *((_DWORD *)this + 4);
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "tapLoopImpl";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 124;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v10;
      v9 = MEMORY[0x1E0C81028];
    }
    _os_log_impl(&dword_1DB697000, v9, OS_LOG_TYPE_DEFAULT, "%s:%d processEvent for entry:%u", buf, 0x18u);
LABEL_16:
    if (glog_fd)
    {
      *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v25 = v11;
      v26 = v11;
      v23 = v11;
      v24 = v11;
      v21 = v11;
      v22 = v11;
      *(_OWORD *)buf = v11;
      *(_OWORD *)&buf[16] = v11;
      memset(&v19, 0, sizeof(v19));
      v18 = 0xAAAAAAAAAAAAAAAALL;
      time(&v18);
      localtime_r(&v18, &v19);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v19);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "%s:%d processEvent for entry:%u", "tapLoopImpl", 124, *((_DWORD *)this + 4));
    }
    if (!CCDataTap::processEvent(this))
      break;
    pthread_mutex_lock((pthread_mutex_t *)(*((_QWORD *)this + 8) + 16));
    v12 = *((unsigned __int8 *)this + 56);
    pthread_mutex_unlock((pthread_mutex_t *)(*((_QWORD *)this + 8) + 16));
    if (v12)
      break;
    *((CFAbsoluteTime *)this + 24) = CFAbsoluteTimeGetCurrent();
    usleep(0x3E8u);
  }
  *((_BYTE *)this + 184) = 0;
  v13 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
    {
      v14 = *((_DWORD *)this + 4);
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v14;
      v15 = v13;
      goto LABEL_26;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v16 = *((_DWORD *)this + 4);
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v16;
    v15 = MEMORY[0x1E0C81028];
LABEL_26:
    _os_log_impl(&dword_1DB697000, v15, OS_LOG_TYPE_DEFAULT, "CCDataTap::tapLoopImpl exit :%u Exiting taploop\n", buf, 8u);
  }
  if (glog_fd)
  {
    *(_QWORD *)&v17 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v17 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v25 = v17;
    v26 = v17;
    v23 = v17;
    v24 = v17;
    v21 = v17;
    v22 = v17;
    *(_OWORD *)buf = v17;
    *(_OWORD *)&buf[16] = v17;
    memset(&v19, 0, sizeof(v19));
    v18 = 0xAAAAAAAAAAAAAAAALL;
    time(&v18);
    localtime_r(&v18, &v19);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v19);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "CCDataTap::tapLoopImpl exit :%u Exiting taploop\n", *((_DWORD *)this + 4));
  }
}

uint64_t CCDataTap::processEvent(CCDataTap *this)
{
  uint64_t v2;
  std::error_code *v3;
  uint64_t result;
  _QWORD *v5;
  const char *v6;
  void *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  NSObject *v30;
  __int128 v31;
  unint64_t v32;
  _QWORD *v33;
  _BOOL4 v34;
  _BOOL4 v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  CCLogFile *v39;
  void *v40;
  unint64_t v41;
  uint64_t v42;
  NSObject *v43;
  __int128 v44;
  CCDataTap *v45;
  const void *v46;
  void *v47;
  int Data;
  uint64_t v49;
  NSObject *v50;
  uint64_t v51;
  NSObject *v52;
  __int128 v53;
  __int128 v54;
  _QWORD *v55;
  const char *v57;
  const char *v58;
  time_t v59;
  tm v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t __dst;
  uint64_t v65;
  _BYTE buf[48];
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  __dst = 0;
  v65 = 0;
  v62 = 0;
  v63 = 0;
  v61 = 0;
  if (*((_BYTE *)this + 96))
  {
    result = 0;
    *((_WORD *)this + 48) = 256;
    return result;
  }
  if (*((_BYTE *)this + 97))
    return 0;
  v2 = isSeedAndiOS();
  if ((_DWORD)v2 && (deviceUnlockedSinceBoot(v2, v3) & 1) == 0)
  {
    v49 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
        goto LABEL_107;
      *(_WORD *)buf = 0;
      v50 = v49;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        goto LABEL_107;
      *(_WORD *)buf = 0;
      v50 = MEMORY[0x1E0C81028];
    }
    _os_log_impl(&dword_1DB697000, v50, OS_LOG_TYPE_DEFAULT, "CCDataTap::processEvent() seed build and device hasn't been unlocked since boot - not processing event and waiting for the next.\n", buf, 2u);
LABEL_107:
    if (glog_fd)
    {
      *(_QWORD *)&v53 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v53 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v70 = v53;
      v71 = v53;
      v68 = v53;
      v69 = v53;
      *(_OWORD *)&buf[32] = v53;
      v67 = v53;
      *(_OWORD *)buf = v53;
      *(_OWORD *)&buf[16] = v53;
      memset(&v60, 0, sizeof(v60));
      v59 = 0xAAAAAAAAAAAAAAAALL;
      time(&v59);
      localtime_r(&v59, &v60);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v60);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "CCDataTap::processEvent() seed build and device hasn't been unlocked since boot - not processing event and waiting for the next.\n");
    }
    return 0;
  }
  result = (uint64_t)malloc_type_calloc(0x1000uLL, 1uLL, 0xCD511FE5uLL);
  if (result)
  {
    v5 = (_QWORD *)result;
    v6 = (const char *)(result + 16);
    *(_QWORD *)result = result + 16;
    *(_QWORD *)(result + 8) = 4080;
    v7 = (void *)*((_QWORD *)this + 8);
    if (v7)
    if (!CCDataPipeInterface::queryMetaData((uint64_t)v7, v5))
    {
      v55 = v5;
      v58 = 0;
      v57 = 0;
      while (2)
      {
        v8 = *(_QWORD *)v6;
        v9 = v6 + 16;
        v10 = *((_QWORD *)v6 + 1);
        switch(*(_QWORD *)v6)
        {
          case 0:
            v29 = coreCaptureOsLog;
            if (coreCaptureOsLog)
            {
              v5 = v55;
              if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
                goto LABEL_67;
              *(_WORD *)buf = 0;
              v30 = v29;
            }
            else
            {
              v5 = v55;
              if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
                goto LABEL_67;
              *(_WORD *)buf = 0;
              v30 = MEMORY[0x1E0C81028];
            }
            _os_log_impl(&dword_1DB697000, v30, OS_LOG_TYPE_DEFAULT, "Invalid Meta Key. Bail.", buf, 2u);
LABEL_67:
            if (glog_fd)
            {
              *(_QWORD *)&v31 = 0xAAAAAAAAAAAAAAAALL;
              *((_QWORD *)&v31 + 1) = 0xAAAAAAAAAAAAAAAALL;
              v70 = v31;
              v71 = v31;
              v68 = v31;
              v69 = v31;
              *(_OWORD *)&buf[32] = v31;
              v67 = v31;
              *(_OWORD *)buf = v31;
              *(_OWORD *)&buf[16] = v31;
              memset(&v60, 0, sizeof(v60));
              v59 = 0xAAAAAAAAAAAAAAAALL;
              time(&v59);
              localtime_r(&v59, &v60);
              strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v60);
              dprintf(glog_fd, "%s ", buf);
              dprintf(glog_fd, "Invalid Meta Key. Bail.");
            }
            v32 = v61;
            if (!v61)
              break;
            v33 = malloc_type_malloc(v61 + 16, 0x95CAC9C3uLL);
            *v33 = v33 + 2;
            v33[1] = v32;
            v34 = __dst != 0;
            v35 = v57 != 0;
            if (v34 && v35)
              v36 = __dst;
            else
              v36 = v62;
            if (v34 && v35)
              v37 = &v65;
            else
              v37 = &v63;
            v38 = *v37;
            v39 = CCFile::withRegistryEntry((CCFile *)*((unsigned int *)this + 4));
            *((_QWORD *)this + 4) = v39;
            if (v39)
            {
              if (v40)
                (*(void (**)(void *, const char *, const char *, uint64_t, uint64_t))(*(_QWORD *)v40 + 192))(v40, v57, v58, v36, v38);
              v41 = 0;
              while (1)
              {
                v42 = coreCaptureOsLog;
                if (coreCaptureOsLog)
                {
                  if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315906;
                    *(_QWORD *)&buf[4] = v57;
                    *(_WORD *)&buf[12] = 2080;
                    *(_QWORD *)&buf[14] = v58;
                    *(_WORD *)&buf[22] = 2048;
                    *(_QWORD *)&buf[24] = v36;
                    *(_WORD *)&buf[32] = 2048;
                    *(_QWORD *)&buf[34] = v38;
                    v43 = v42;
LABEL_85:
                    _os_log_impl(&dword_1DB697000, v43, OS_LOG_TYPE_DEFAULT, "Session Name: %s, Blob Name: %s %llu.%llu\n", buf, 0x2Au);
                  }
                }
                else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315906;
                  *(_QWORD *)&buf[4] = v57;
                  *(_WORD *)&buf[12] = 2080;
                  *(_QWORD *)&buf[14] = v58;
                  *(_WORD *)&buf[22] = 2048;
                  *(_QWORD *)&buf[24] = v36;
                  *(_WORD *)&buf[32] = 2048;
                  *(_QWORD *)&buf[34] = v38;
                  v43 = MEMORY[0x1E0C81028];
                  goto LABEL_85;
                }
                if (glog_fd)
                {
                  *(_QWORD *)&v44 = 0xAAAAAAAAAAAAAAAALL;
                  *((_QWORD *)&v44 + 1) = 0xAAAAAAAAAAAAAAAALL;
                  v70 = v44;
                  v71 = v44;
                  v68 = v44;
                  v69 = v44;
                  *(_OWORD *)&buf[32] = v44;
                  v67 = v44;
                  *(_OWORD *)buf = v44;
                  *(_OWORD *)&buf[16] = v44;
                  memset(&v60, 0, sizeof(v60));
                  v59 = 0xAAAAAAAAAAAAAAAALL;
                  time(&v59);
                  localtime_r(&v59, &v60);
                  strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v60);
                  dprintf(glog_fd, "%s ", buf);
                  dprintf(glog_fd, "Session Name: %s, Blob Name: %s %llu.%llu\n", v57, v58, v36, v38);
                }
                v45 = this;
                v46 = (const void *)*((_QWORD *)this + 8);
                if (v46)
                {
                  if (v47)
                    Data = CCDataPipeInterface::readData((uint64_t)v47, v33);
                  else
                    Data = 0;
                  v45 = this;
                }
                else
                {
                  Data = 0;
                }
                (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(**((_QWORD **)v45 + 4) + 64))(*((_QWORD *)v45 + 4), 0, *v33, v33[1], 0, 0);
                if (!Data)
                {
                  v41 += v33[1];
                  if (v41 < v61)
                    continue;
                }
                (*(void (**)(_QWORD))(**((_QWORD **)this + 4) + 88))(*((_QWORD *)this + 4));
                (*(void (**)(_QWORD))(**((_QWORD **)this + 4) + 48))(*((_QWORD *)this + 4));
                *((_QWORD *)this + 4) = 0;
                goto LABEL_113;
              }
            }
            v51 = coreCaptureOsLog;
            if (coreCaptureOsLog)
            {
              if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
                goto LABEL_111;
              *(_WORD *)buf = 0;
              v52 = v51;
            }
            else
            {
              if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                goto LABEL_111;
              *(_WORD *)buf = 0;
              v52 = MEMORY[0x1E0C81028];
            }
            _os_log_error_impl(&dword_1DB697000, v52, OS_LOG_TYPE_ERROR, "CCDataTap: Unable to create CCFile.\n", buf, 2u);
LABEL_111:
            if (glog_fd)
            {
              *(_QWORD *)&v54 = 0xAAAAAAAAAAAAAAAALL;
              *((_QWORD *)&v54 + 1) = 0xAAAAAAAAAAAAAAAALL;
              v70 = v54;
              v71 = v54;
              v68 = v54;
              v69 = v54;
              *(_OWORD *)&buf[32] = v54;
              v67 = v54;
              *(_OWORD *)buf = v54;
              *(_OWORD *)&buf[16] = v54;
              memset(&v60, 0, sizeof(v60));
              v59 = 0xAAAAAAAAAAAAAAAALL;
              time(&v59);
              localtime_r(&v59, &v60);
              strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v60);
              dprintf(glog_fd, "%s ", buf);
              dprintf(glog_fd, "CCDataTap: Unable to create CCFile.\n");
            }
LABEL_113:
            free(v5);
            free(v33);
            return 1;
          case 1:
            v11 = coreCaptureOsLog;
            if (coreCaptureOsLog)
            {
              if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315906;
                *(_QWORD *)&buf[4] = "processEvent";
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = 196;
                *(_WORD *)&buf[18] = 2048;
                *(_QWORD *)&buf[20] = v10;
                *(_WORD *)&buf[28] = 2080;
                *(_QWORD *)&buf[30] = v6 + 16;
                v12 = v11;
LABEL_31:
                _os_log_impl(&dword_1DB697000, v12, OS_LOG_TYPE_DEFAULT, "Found SessionName: %s:%d %llu %s\n", buf, 0x26u);
              }
            }
            else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315906;
              *(_QWORD *)&buf[4] = "processEvent";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 196;
              *(_WORD *)&buf[18] = 2048;
              *(_QWORD *)&buf[20] = v10;
              *(_WORD *)&buf[28] = 2080;
              *(_QWORD *)&buf[30] = v6 + 16;
              v12 = MEMORY[0x1E0C81028];
              goto LABEL_31;
            }
            if (glog_fd)
            {
              *(_QWORD *)&v23 = 0xAAAAAAAAAAAAAAAALL;
              *((_QWORD *)&v23 + 1) = 0xAAAAAAAAAAAAAAAALL;
              v70 = v23;
              v71 = v23;
              v68 = v23;
              v69 = v23;
              *(_OWORD *)&buf[32] = v23;
              v67 = v23;
              *(_OWORD *)buf = v23;
              *(_OWORD *)&buf[16] = v23;
              memset(&v60, 0, sizeof(v60));
              v59 = 0xAAAAAAAAAAAAAAAALL;
              time(&v59);
              localtime_r(&v59, &v60);
              strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v60);
              dprintf(glog_fd, "%s ", buf);
              dprintf(glog_fd, "Found SessionName: %s:%d %llu %s\n", "processEvent", 196, v10, v6 + 16);
            }
            v6 = &v9[v10];
            v57 = v9;
            continue;
          case 2:
            memcpy(&__dst, v6 + 16, *((_QWORD *)v6 + 1));
            v13 = coreCaptureOsLog;
            if (coreCaptureOsLog)
            {
              if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
                goto LABEL_38;
              *(_DWORD *)buf = 136316162;
              *(_QWORD *)&buf[4] = "processEvent";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 203;
              *(_WORD *)&buf[18] = 2048;
              *(_QWORD *)&buf[20] = v10;
              *(_WORD *)&buf[28] = 2048;
              *(_QWORD *)&buf[30] = __dst;
              *(_WORD *)&buf[38] = 2048;
              *(_QWORD *)&buf[40] = v65;
              v14 = v13;
            }
            else
            {
              if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
                goto LABEL_38;
              *(_DWORD *)buf = 136316162;
              *(_QWORD *)&buf[4] = "processEvent";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 203;
              *(_WORD *)&buf[18] = 2048;
              *(_QWORD *)&buf[20] = v10;
              *(_WORD *)&buf[28] = 2048;
              *(_QWORD *)&buf[30] = __dst;
              *(_WORD *)&buf[38] = 2048;
              *(_QWORD *)&buf[40] = v65;
              v14 = MEMORY[0x1E0C81028];
            }
            _os_log_impl(&dword_1DB697000, v14, OS_LOG_TYPE_DEFAULT, "Found session timestamp: %s:%d %llu %llu.%llu\n", buf, 0x30u);
LABEL_38:
            if (glog_fd)
            {
              *(_QWORD *)&v24 = 0xAAAAAAAAAAAAAAAALL;
              *((_QWORD *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
              v70 = v24;
              v71 = v24;
              v68 = v24;
              v69 = v24;
              *(_OWORD *)&buf[32] = v24;
              v67 = v24;
              *(_OWORD *)buf = v24;
              *(_OWORD *)&buf[16] = v24;
              memset(&v60, 0, sizeof(v60));
              v59 = 0xAAAAAAAAAAAAAAAALL;
              time(&v59);
              localtime_r(&v59, &v60);
              strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v60);
              dprintf(glog_fd, "%s ", buf);
              dprintf(glog_fd, "Found session timestamp: %s:%d %llu %llu.%llu\n");
            }
            goto LABEL_60;
          case 3:
            v19 = coreCaptureOsLog;
            if (coreCaptureOsLog)
            {
              if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
                goto LABEL_53;
              *(_DWORD *)buf = 136315906;
              *(_QWORD *)&buf[4] = "processEvent";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 209;
              *(_WORD *)&buf[18] = 2048;
              *(_QWORD *)&buf[20] = v10;
              *(_WORD *)&buf[28] = 2080;
              *(_QWORD *)&buf[30] = v9;
              v20 = v19;
            }
            else
            {
              if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
                goto LABEL_53;
              *(_DWORD *)buf = 136315906;
              *(_QWORD *)&buf[4] = "processEvent";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 209;
              *(_WORD *)&buf[18] = 2048;
              *(_QWORD *)&buf[20] = v10;
              *(_WORD *)&buf[28] = 2080;
              *(_QWORD *)&buf[30] = v9;
              v20 = MEMORY[0x1E0C81028];
            }
            _os_log_impl(&dword_1DB697000, v20, OS_LOG_TYPE_DEFAULT, "Found blob name: %s:%d %llu %s\n", buf, 0x26u);
LABEL_53:
            v6 = &v9[v10];
            v58 = v9;
            if (glog_fd)
            {
              *(_QWORD *)&v27 = 0xAAAAAAAAAAAAAAAALL;
              *((_QWORD *)&v27 + 1) = 0xAAAAAAAAAAAAAAAALL;
              v70 = v27;
              v71 = v27;
              v68 = v27;
              v69 = v27;
              *(_OWORD *)&buf[32] = v27;
              v67 = v27;
              *(_OWORD *)buf = v27;
              *(_OWORD *)&buf[16] = v27;
              memset(&v60, 0, sizeof(v60));
              v59 = 0xAAAAAAAAAAAAAAAALL;
              time(&v59);
              localtime_r(&v59, &v60);
              strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v60);
              dprintf(glog_fd, "%s ", buf);
              dprintf(glog_fd, "Found blob name: %s:%d %llu %s\n", "processEvent", 209, v10, v9);
              v58 = v9;
            }
            continue;
          case 4:
            memcpy(&v62, v6 + 16, *((_QWORD *)v6 + 1));
            v15 = coreCaptureOsLog;
            if (coreCaptureOsLog)
            {
              if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
                goto LABEL_43;
              *(_DWORD *)buf = 136316162;
              *(_QWORD *)&buf[4] = "processEvent";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 215;
              *(_WORD *)&buf[18] = 2048;
              *(_QWORD *)&buf[20] = v10;
              *(_WORD *)&buf[28] = 2048;
              *(_QWORD *)&buf[30] = v62;
              *(_WORD *)&buf[38] = 2048;
              *(_QWORD *)&buf[40] = v63;
              v16 = v15;
            }
            else
            {
              if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
                goto LABEL_43;
              *(_DWORD *)buf = 136316162;
              *(_QWORD *)&buf[4] = "processEvent";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 215;
              *(_WORD *)&buf[18] = 2048;
              *(_QWORD *)&buf[20] = v10;
              *(_WORD *)&buf[28] = 2048;
              *(_QWORD *)&buf[30] = v62;
              *(_WORD *)&buf[38] = 2048;
              *(_QWORD *)&buf[40] = v63;
              v16 = MEMORY[0x1E0C81028];
            }
            _os_log_impl(&dword_1DB697000, v16, OS_LOG_TYPE_DEFAULT, "Found blob timestamp: %s:%d %llu %llu.%llu\n", buf, 0x30u);
LABEL_43:
            if (glog_fd)
            {
              *(_QWORD *)&v25 = 0xAAAAAAAAAAAAAAAALL;
              *((_QWORD *)&v25 + 1) = 0xAAAAAAAAAAAAAAAALL;
              v70 = v25;
              v71 = v25;
              v68 = v25;
              v69 = v25;
              *(_OWORD *)&buf[32] = v25;
              v67 = v25;
              *(_OWORD *)buf = v25;
              *(_OWORD *)&buf[16] = v25;
              memset(&v60, 0, sizeof(v60));
              v59 = 0xAAAAAAAAAAAAAAAALL;
              time(&v59);
              localtime_r(&v59, &v60);
              strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v60);
              dprintf(glog_fd, "%s ", buf);
              dprintf(glog_fd, "Found blob timestamp: %s:%d %llu %llu.%llu\n");
            }
            goto LABEL_60;
          case 5:
            memcpy(&v61, v6 + 16, *((_QWORD *)v6 + 1));
            v21 = coreCaptureOsLog;
            if (coreCaptureOsLog)
            {
              if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
                goto LABEL_58;
              *(_DWORD *)buf = 136315906;
              *(_QWORD *)&buf[4] = "processEvent";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 221;
              *(_WORD *)&buf[18] = 2048;
              *(_QWORD *)&buf[20] = v10;
              *(_WORD *)&buf[28] = 2048;
              *(_QWORD *)&buf[30] = v61;
              v22 = v21;
            }
            else
            {
              if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
                goto LABEL_58;
              *(_DWORD *)buf = 136315906;
              *(_QWORD *)&buf[4] = "processEvent";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 221;
              *(_WORD *)&buf[18] = 2048;
              *(_QWORD *)&buf[20] = v10;
              *(_WORD *)&buf[28] = 2048;
              *(_QWORD *)&buf[30] = v61;
              v22 = MEMORY[0x1E0C81028];
            }
            _os_log_impl(&dword_1DB697000, v22, OS_LOG_TYPE_DEFAULT, "Found blob length: %s:%d %llu %zu\n", buf, 0x26u);
LABEL_58:
            if (glog_fd)
            {
              *(_QWORD *)&v28 = 0xAAAAAAAAAAAAAAAALL;
              *((_QWORD *)&v28 + 1) = 0xAAAAAAAAAAAAAAAALL;
              v70 = v28;
              v71 = v28;
              v68 = v28;
              v69 = v28;
              *(_OWORD *)&buf[32] = v28;
              v67 = v28;
              *(_OWORD *)buf = v28;
              *(_OWORD *)&buf[16] = v28;
              memset(&v60, 0, sizeof(v60));
              v59 = 0xAAAAAAAAAAAAAAAALL;
              time(&v59);
              localtime_r(&v59, &v60);
              strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v60);
              dprintf(glog_fd, "%s ", buf);
              dprintf(glog_fd, "Found blob length: %s:%d %llu %zu\n");
            }
LABEL_60:
            v6 = &v9[v10];
            continue;
          default:
            v17 = coreCaptureOsLog;
            if (coreCaptureOsLog)
            {
              if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
                goto LABEL_48;
              *(_DWORD *)buf = 134218498;
              *(_QWORD *)&buf[4] = v8;
              *(_WORD *)&buf[12] = 2080;
              *(_QWORD *)&buf[14] = "processEvent";
              *(_WORD *)&buf[22] = 1024;
              *(_DWORD *)&buf[24] = 225;
              v18 = v17;
            }
            else
            {
              if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
                goto LABEL_48;
              *(_DWORD *)buf = 134218498;
              *(_QWORD *)&buf[4] = v8;
              *(_WORD *)&buf[12] = 2080;
              *(_QWORD *)&buf[14] = "processEvent";
              *(_WORD *)&buf[22] = 1024;
              *(_DWORD *)&buf[24] = 225;
              v18 = MEMORY[0x1E0C81028];
            }
            _os_log_impl(&dword_1DB697000, v18, OS_LOG_TYPE_DEFAULT, "Unknown type: %llu %s:%d\n", buf, 0x1Cu);
LABEL_48:
            v6 += 16;
            if (glog_fd)
            {
              *(_QWORD *)&v26 = 0xAAAAAAAAAAAAAAAALL;
              *((_QWORD *)&v26 + 1) = 0xAAAAAAAAAAAAAAAALL;
              v70 = v26;
              v71 = v26;
              v68 = v26;
              v69 = v26;
              *(_OWORD *)&buf[32] = v26;
              v67 = v26;
              *(_OWORD *)buf = v26;
              *(_OWORD *)&buf[16] = v26;
              memset(&v60, 0, sizeof(v60));
              v59 = 0xAAAAAAAAAAAAAAAALL;
              time(&v59);
              localtime_r(&v59, &v60);
              strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v60);
              dprintf(glog_fd, "%s ", buf);
              dprintf(glog_fd, "Unknown type: %llu %s:%d\n", v8, "processEvent", 225);
              v6 = v9;
            }
            continue;
        }
        break;
      }
    }
    free(v5);
    return 0;
  }
  return result;
}

uint64_t _dataTapInterestCallback_kext(uint64_t result, int a2, void **a3)
{
  if (!shutDownPending)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 144))(result);
  return result;
}

uint64_t _dataTapInterestCallback_dext(uint64_t result, int a2, void **a3)
{
  if (!shutDownPending)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 144))(result);
  return result;
}

CCDataTap *CCDataTap::withRegistryEntry(CCDataTap *this)
{
  CCDataTap *v2;
  CCTap *v3;

  v2 = (CCDataTap *)malloc_type_malloc(0xC8uLL, 0xEE9A6C17uLL);
  *(_OWORD *)((char *)v2 + 8) = 0u;
  *(_OWORD *)((char *)v2 + 24) = 0u;
  *(_OWORD *)((char *)v2 + 40) = 0u;
  *(_OWORD *)((char *)v2 + 56) = 0u;
  *(_OWORD *)((char *)v2 + 72) = 0u;
  *(_OWORD *)((char *)v2 + 88) = 0u;
  *(_OWORD *)((char *)v2 + 104) = 0u;
  *(_OWORD *)((char *)v2 + 120) = 0u;
  *(_OWORD *)((char *)v2 + 136) = 0u;
  *(_OWORD *)((char *)v2 + 152) = 0u;
  *(_OWORD *)((char *)v2 + 168) = 0u;
  *(_OWORD *)((char *)v2 + 184) = 0u;
  *((_DWORD *)v2 + 2) = 1;
  *(_QWORD *)v2 = off_1EA31F730;
  if ((CCDataTap::initWithRegistryEntry(v2, this, v3) & 1) == 0)
  {
    (*(void (**)(CCDataTap *))(*(_QWORD *)v2 + 48))(v2);
    return 0;
  }
  return v2;
}

uint64_t CCFile::captureLog(uint64_t a1, uint64_t a2, const void *a3, size_t a4, const void *a5, size_t a6)
{
  uint64_t v11;
  NSObject *v12;
  __int128 v13;
  const __CFString *v14;
  CFIndex Length;
  char *v16;
  const __CFString *v17;
  CFIndex v18;
  uint64_t v19;
  NSObject *v20;
  char *v21;
  uint64_t v22;
  NSObject *v23;
  __int128 v24;
  uint64_t v25;
  __int128 v26;
  time_t v27;
  uint64_t v28;
  time_t v30;
  time_t v31[2];
  tm v32;
  uint8_t buf[16];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v11 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v12 = v11;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v12 = MEMORY[0x1E0C81028];
  }
  _os_log_impl(&dword_1DB697000, v12, OS_LOG_TYPE_DEFAULT, "CCFile::captureLog\n", buf, 2u);
LABEL_7:
  if (glog_fd)
  {
    *(_QWORD *)&v13 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v39 = v13;
    v40 = v13;
    v37 = v13;
    v38 = v13;
    v36 = v13;
    v34 = v13;
    v35 = v13;
    *(_OWORD *)buf = v13;
    memset(&v32, 0, sizeof(v32));
    v31[0] = 0xAAAAAAAAAAAAAAAALL;
    time(v31);
    localtime_r(v31, &v32);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v32);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCFile::captureLog\n");
  }
  v14 = *(const __CFString **)(a1 + 56);
  if (!v14)
  {
    v21 = (char *)malloc_type_malloc(a6 + a4, 0x548BE6BAuLL);
    memcpy(v21, a3, a4);
    if (a5)
      memcpy(&v21[a4], a5, a6);
    *(_OWORD *)v31 = *(_OWORD *)v21;
    if (daemonGlbl)
      CCDaemon::setCaptureIdAndReason(daemonGlbl, (uint64_t)v31, v21 + 16);
    v22 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)&buf[4] = v31[0];
        *(_WORD *)&buf[8] = 1024;
        *(_DWORD *)&buf[10] = v31[1];
        *(_WORD *)&buf[14] = 2080;
        *(_QWORD *)&v34 = v21 + 16;
        v23 = v22;
LABEL_30:
        _os_log_impl(&dword_1DB697000, v23, OS_LOG_TYPE_DEFAULT, "CCFile::captureLog Received Capture notice id: %d.%06d, reason = %s\n", buf, 0x18u);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)&buf[4] = v31[0];
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v31[1];
      *(_WORD *)&buf[14] = 2080;
      *(_QWORD *)&v34 = v21 + 16;
      v23 = MEMORY[0x1E0C81028];
      goto LABEL_30;
    }
    if (glog_fd)
    {
      *(_QWORD *)&v26 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v26 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v39 = v26;
      v40 = v26;
      v37 = v26;
      v38 = v26;
      v36 = v26;
      v34 = v26;
      v35 = v26;
      *(_OWORD *)buf = v26;
      memset(&v32, 0, sizeof(v32));
      v30 = 0xAAAAAAAAAAAAAAAALL;
      time(&v30);
      localtime_r(&v30, &v32);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v32);
      dprintf(glog_fd, "%s ", (const char *)buf);
      v27 = v31[0];
      v28 = v31[1];
      dprintf(glog_fd, "CCFile::captureLog Received Capture notice id: %d.%06d, reason = %s\n", LODWORD(v31[0]), LODWORD(v31[1]), v21 + 16);
    }
    else
    {
      v27 = v31[0];
      v28 = v31[1];
    }
    writeMetadataFiles(*(const __CFString **)(a1 + 96), v21 + 16, v27, v28);
    v25 = CCFile::writeDataFiles((_QWORD *)a1);
    free(v21);
    return v25;
  }
  Length = CFStringGetLength(v14);
  v16 = (char *)malloc_type_malloc(Length + 1, 0xF967EB6DuLL);
  v17 = *(const __CFString **)(a1 + 56);
  v18 = CFStringGetLength(v17);
  CFStringGetCString(v17, v16, v18 + 1, 0);
  v19 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = v16;
      v20 = v19;
LABEL_22:
      _os_log_impl(&dword_1DB697000, v20, OS_LOG_TYPE_DEFAULT, "CCFile::captureLog Capture(%s) is in progress. Ignoring new one.\n", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = v16;
    v20 = MEMORY[0x1E0C81028];
    goto LABEL_22;
  }
  if (glog_fd)
  {
    *(_QWORD *)&v24 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v39 = v24;
    v40 = v24;
    v37 = v24;
    v38 = v24;
    v36 = v24;
    v34 = v24;
    v35 = v24;
    *(_OWORD *)buf = v24;
    memset(&v32, 0, sizeof(v32));
    v31[0] = 0xAAAAAAAAAAAAAAAALL;
    time(v31);
    localtime_r(v31, &v32);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v32);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCFile::captureLog Capture(%s) is in progress. Ignoring new one.\n", v16);
  }
  if (v16)
    free(v16);
  return 0;
}

void CCFile::copyFile(CFStringRef *this, const char *a2)
{
  const __CFAllocator *v4;
  CFMutableStringRef MutableCopy;
  CFMutableStringRef v6;
  CFIndex Length;
  char *v8;
  CFIndex v9;
  CFIndex v10;
  std::__fs::filesystem::path *v11;
  CFIndex v12;
  uint64_t v13;
  NSObject *v14;
  __int128 v15;
  off_t st_size;
  uint64_t v17;
  NSObject *v18;
  __int128 v19;
  void *v20;
  FILE *v21;
  FILE *v22;
  gzFile v23;
  gzFile_s *i;
  size_t v25;
  uint64_t v26;
  const char *v27;
  NSObject *v28;
  uint64_t v29;
  NSObject *v30;
  __int128 v31;
  __int128 v32;
  int v33;
  const char *v34;
  int v35;
  uint64_t v36;
  NSObject *v37;
  NSObject *v38;
  __int128 v39;
  __int128 v40;
  const char *v41;
  off_t v42;
  time_t v43;
  tm v44;
  int errnum;
  _BYTE buf[32];
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  stat v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  MutableCopy = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 512, this[6]);
  CFStringAppendCString(MutableCopy, "/", 0);
  CFStringAppendCString(MutableCopy, a2, 0);
  v6 = CFStringCreateMutableCopy(v4, 512, this[7]);
  CFStringAppendCString(v6, "/", 0);
  CFStringAppendCString(v6, a2, 0);
  CFStringAppendCString(v6, ".gz", 0);
  errnum = 0;
  Length = CFStringGetLength(MutableCopy);
  v8 = (char *)malloc_type_malloc(Length + 1, 0x999DAE98uLL);
  v9 = CFStringGetLength(MutableCopy);
  CFStringGetCString(MutableCopy, v8, v9 + 1, 0);
  v10 = CFStringGetLength(v6);
  v11 = (std::__fs::filesystem::path *)malloc_type_malloc(v10 + 1, 0xB49C05FuLL);
  v12 = CFStringGetLength(v6);
  CFStringGetCString(v6, (char *)v11, v12 + 1, 0);
  memset(&v53, 0, sizeof(v53));
  if (!stat(v8, &v53))
    goto LABEL_10;
  v13 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_8;
    *(_WORD *)buf = 0;
    v14 = v13;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_8;
    *(_WORD *)buf = 0;
    v14 = MEMORY[0x1E0C81028];
  }
  _os_log_impl(&dword_1DB697000, v14, OS_LOG_TYPE_DEFAULT, "CCFIle::copyFile: Unable to stat source path\n", buf, 2u);
LABEL_8:
  if (glog_fd)
  {
    *(_QWORD *)&v15 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v15 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v51 = v15;
    v52 = v15;
    v49 = v15;
    v50 = v15;
    v47 = v15;
    v48 = v15;
    *(_OWORD *)buf = v15;
    *(_OWORD *)&buf[16] = v15;
    memset(&v44, 0, sizeof(v44));
    v43 = 0xAAAAAAAAAAAAAAAALL;
    time(&v43);
    localtime_r(&v43, &v44);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v44);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "CCFIle::copyFile: Unable to stat source path\n");
  }
LABEL_10:
  st_size = v53.st_size;
  v17 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_16;
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = a2;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 2080;
    *(_QWORD *)&buf[24] = v11;
    LOWORD(v47) = 2048;
    *(_QWORD *)((char *)&v47 + 2) = st_size;
    v18 = v17;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_16;
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = a2;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 2080;
    *(_QWORD *)&buf[24] = v11;
    LOWORD(v47) = 2048;
    *(_QWORD *)((char *)&v47 + 2) = st_size;
    v18 = MEMORY[0x1E0C81028];
  }
  _os_log_impl(&dword_1DB697000, v18, OS_LOG_TYPE_DEFAULT, "CCFile::copyFile Attempt to write fileName %s, source path:%s, dest path:%s, length: %lld\n", buf, 0x2Au);
LABEL_16:
  if (glog_fd)
  {
    *(_QWORD *)&v19 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v51 = v19;
    v52 = v19;
    v49 = v19;
    v50 = v19;
    v47 = v19;
    v48 = v19;
    *(_OWORD *)buf = v19;
    *(_OWORD *)&buf[16] = v19;
    memset(&v44, 0, sizeof(v44));
    v43 = 0xAAAAAAAAAAAAAAAALL;
    time(&v43);
    localtime_r(&v43, &v44);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v44);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "CCFile::copyFile Attempt to write fileName %s, source path:%s, dest path:%s, length: %lld\n", a2, v8, (const char *)v11, st_size);
  }
  if (ifSeedCreateClassCProtectedFile(v11))
  {
    v20 = malloc_type_malloc(0x4000uLL, 0x16EFEA22uLL);
    v21 = fopen(v8, "rb");
    if (v21)
    {
      v22 = v21;
      v42 = st_size;
      v23 = gzopen((const char *)v11, "wb");
      if (!v23)
      {
        fclose(v22);
LABEL_41:
        st_size = v42;
LABEL_42:
        if (v20)
          free(v20);
        goto LABEL_44;
      }
      for (i = v23; ; gzwrite(i, v20, v25))
      {
        v25 = fread(v20, 1uLL, 0x4000uLL, v22);
        if (!v25)
          break;
      }
      errnum = gzflush(i, 4);
      if (!*__error())
      {
LABEL_40:
        fclose(v22);
        gzclose(i);
        goto LABEL_41;
      }
      v26 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
          goto LABEL_38;
        v27 = gzerror(i, &errnum);
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = v27;
        v28 = v26;
      }
      else
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_38;
        v41 = gzerror(i, &errnum);
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = v41;
        v28 = MEMORY[0x1E0C81028];
      }
      _os_log_error_impl(&dword_1DB697000, v28, OS_LOG_TYPE_ERROR, "%s\n", buf, 0xCu);
LABEL_38:
      if (glog_fd)
      {
        *(_QWORD *)&v32 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v32 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v51 = v32;
        v52 = v32;
        v49 = v32;
        v50 = v32;
        v47 = v32;
        v48 = v32;
        *(_OWORD *)buf = v32;
        *(_OWORD *)&buf[16] = v32;
        memset(&v44, 0, sizeof(v44));
        v43 = 0xAAAAAAAAAAAAAAAALL;
        time(&v43);
        localtime_r(&v43, &v44);
        strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v44);
        dprintf(glog_fd, "%s ", buf);
        v33 = glog_fd;
        v34 = gzerror(i, &errnum);
        dprintf(v33, "%s\n", v34);
      }
      goto LABEL_40;
    }
    v29 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
        goto LABEL_35;
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = v8;
      v30 = v29;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        goto LABEL_35;
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = v8;
      v30 = MEMORY[0x1E0C81028];
    }
    _os_log_impl(&dword_1DB697000, v30, OS_LOG_TYPE_DEFAULT, "CCFile::copyFile Failed to open source file:%s\n", buf, 0xCu);
LABEL_35:
    if (glog_fd)
    {
      *(_QWORD *)&v31 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v31 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v51 = v31;
      v52 = v31;
      v49 = v31;
      v50 = v31;
      v47 = v31;
      v48 = v31;
      *(_OWORD *)buf = v31;
      *(_OWORD *)&buf[16] = v31;
      memset(&v44, 0, sizeof(v44));
      v43 = 0xAAAAAAAAAAAAAAAALL;
      time(&v43);
      localtime_r(&v43, &v44);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v44);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "CCFile::copyFile Failed to open source file:%s\n", v8);
    }
    goto LABEL_42;
  }
LABEL_44:
  v35 = stat((const char *)v11, &v53);
  v36 = coreCaptureOsLog;
  if (v35)
  {
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
        goto LABEL_54;
      *(_WORD *)buf = 0;
      v37 = v36;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        goto LABEL_54;
      *(_WORD *)buf = 0;
      v37 = MEMORY[0x1E0C81028];
    }
    _os_log_impl(&dword_1DB697000, v37, OS_LOG_TYPE_DEFAULT, "CCFile::copyFile Unable to stat dest path\n", buf, 2u);
LABEL_54:
    if (glog_fd)
    {
      *(_QWORD *)&v39 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v39 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v51 = v39;
      v52 = v39;
      v49 = v39;
      v50 = v39;
      v47 = v39;
      v48 = v39;
      *(_OWORD *)buf = v39;
      *(_OWORD *)&buf[16] = v39;
      memset(&v44, 0, sizeof(v44));
      v43 = 0xAAAAAAAAAAAAAAAALL;
      time(&v43);
      localtime_r(&v43, &v44);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v44);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "CCFile::copyFile Unable to stat dest path\n");
    }
    goto LABEL_61;
  }
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_59;
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = a2;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = st_size;
    *(_WORD *)&buf[22] = 2048;
    *(_QWORD *)&buf[24] = v53.st_size;
    v38 = v36;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_59;
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = a2;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = st_size;
    *(_WORD *)&buf[22] = 2048;
    *(_QWORD *)&buf[24] = v53.st_size;
    v38 = MEMORY[0x1E0C81028];
  }
  _os_log_impl(&dword_1DB697000, v38, OS_LOG_TYPE_DEFAULT, "CCFile::copyFile Wrote fileName %s with source length: %lld archive length: %lld\n", buf, 0x20u);
LABEL_59:
  if (glog_fd)
  {
    *(_QWORD *)&v40 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v40 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v51 = v40;
    v52 = v40;
    v49 = v40;
    v50 = v40;
    v47 = v40;
    v48 = v40;
    *(_OWORD *)buf = v40;
    *(_OWORD *)&buf[16] = v40;
    memset(&v44, 0, sizeof(v44));
    v43 = 0xAAAAAAAAAAAAAAAALL;
    time(&v43);
    localtime_r(&v43, &v44);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v44);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "CCFile::copyFile Wrote fileName %s with source length: %lld archive length: %lld\n");
  }
LABEL_61:
  if (v8)
    free(v8);
  CFRelease(MutableCopy);
  if (v11)
    free(v11);
  CFRelease(v6);
}

uint64_t CCFile::isLogdirExists(CFStringRef *this)
{
  CFIndex Length;
  char *v3;
  const __CFString *v4;
  CFIndex v5;
  uint64_t v6;
  uint64_t v8;
  NSObject *v9;
  __int128 v10;
  time_t v11;
  tm v12;
  uint8_t buf[16];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  stat v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  Length = CFStringGetLength(this[6]);
  v3 = (char *)malloc_type_malloc(Length + 1, 0xF305885EuLL);
  v4 = this[6];
  v5 = CFStringGetLength(v4);
  CFStringGetCString(v4, v3, v5 + 1, 0);
  memset(&v21, 0, sizeof(v21));
  if (stat(v3, &v21) && (mkdirRecursive(this[6]) & 1) == 0)
  {
    v8 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_10;
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = v3;
      v9 = v8;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_10;
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = v3;
      v9 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v9, OS_LOG_TYPE_ERROR, "CCFile::isLogdirExists Failed to create  %s\n", buf, 0xCu);
LABEL_10:
    if (glog_fd)
    {
      *(_QWORD *)&v10 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v19 = v10;
      v20 = v10;
      v17 = v10;
      v18 = v10;
      v15 = v10;
      v16 = v10;
      *(_OWORD *)buf = v10;
      v14 = v10;
      memset(&v12, 0, sizeof(v12));
      v11 = 0xAAAAAAAAAAAAAAAALL;
      time(&v11);
      localtime_r(&v11, &v12);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v12);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "CCFile::isLogdirExists Failed to create  %s\n", v3);
    }
    v6 = 0;
    if (v3)
      goto LABEL_4;
    return v6;
  }
  v6 = 1;
  if (v3)
LABEL_4:
    free(v3);
  return v6;
}

__CFString *CCFile::generateCaptureDirPath(CFStringRef *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  const char *v8;
  __CFString *Mutable;
  size_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  NSObject *v14;
  __int128 v15;
  time_t v17;
  tm v18;
  _BYTE v19[64];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if ((isSeedAndiOS() & (CCProfileMonitor::fProfileLoaded == 0)) != 0)
    v8 = "/Library/Logs/CoreCapture";
  else
    v8 = "/Library/Logs/CrashReporter/CoreCapture";
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 512);
  CFStringAppendCString(Mutable, v8, 0);
  CFStringAppendCString(Mutable, "/", 0);
  if (CFStringGetLength(a1[12]))
  {
    CFStringAppend(Mutable, a1[12]);
    CFStringAppendCString(Mutable, "/", 0);
  }
  v10 = strlen(a2) + 128;
  v11 = (char *)malloc_type_malloc(v10, 0x8118ACF8uLL);
  if (v11)
  {
    v12 = v11;
    memset(v19, 0, 56);
    *(_QWORD *)&v18.tm_sec = a3;
    localtime_r((const time_t *)&v18.tm_sec, (tm *)v19);
    snprintf(v12, v10, "[%04d-%02d-%02d_%02d,%02d,%02d.%06llu]=%s", *(_DWORD *)&v19[20] + 1900, *(_DWORD *)&v19[16] + 1, *(_DWORD *)&v19[12], *(_DWORD *)&v19[8], *(_DWORD *)&v19[4], *(_DWORD *)v19, a4, a2);
    CFStringAppendCString(Mutable, v12, 0);
    CFStringAppendCString(Mutable, "/", 0);
    CFStringAppendCString(Mutable, "Data", 0);
    CFStringAppendCString(Mutable, "/", 0);
    CFStringAppend(Mutable, a1[9]);
    CFStringAppendCString(Mutable, "/", 0);
    CFStringAppend(Mutable, a1[10]);
    CFStringAppendCString(Mutable, "/", 0);
    free(v12);
    return Mutable;
  }
  if (Mutable)
    CFRelease(Mutable);
  v13 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v19 = 0;
      v14 = v13;
LABEL_19:
      _os_log_error_impl(&dword_1DB697000, v14, OS_LOG_TYPE_ERROR, "CCFile::generateCaptureDirPath failed malloc\n", v19, 2u);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v19 = 0;
    v14 = MEMORY[0x1E0C81028];
    goto LABEL_19;
  }
  if (glog_fd)
  {
    *(_QWORD *)&v15 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v15 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v22 = v15;
    v23 = v15;
    v20 = v15;
    v21 = v15;
    *(_OWORD *)&v19[32] = v15;
    *(_OWORD *)&v19[48] = v15;
    *(_OWORD *)v19 = v15;
    *(_OWORD *)&v19[16] = v15;
    memset(&v18, 0, sizeof(v18));
    v17 = 0xAAAAAAAAAAAAAAAALL;
    time(&v17);
    localtime_r(&v17, &v18);
    strftime(v19, 0x80uLL, "%b %d %H:%M:%S", &v18);
    dprintf(glog_fd, "%s ", v19);
    dprintf(glog_fd, "CCFile::generateCaptureDirPath failed malloc\n");
  }
  return 0;
}

void CCFile::captureLogRun(CFStringRef *this)
{
  CFIndex Length;
  char *v3;
  const __CFString *v4;
  CFIndex v5;
  DIR *v6;
  CFIndex v7;
  char *v8;
  const __CFString *v9;
  CFIndex v10;
  uint64_t v11;
  NSObject *v12;
  __int128 v13;
  dirent *v14;
  const char *d_name;
  uint64_t v16;
  NSObject *v17;
  __int128 v18;
  uint64_t v19;
  NSObject *v20;
  __int128 v21;
  time_t v22;
  tm v23;
  _BYTE buf[32];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  Length = CFStringGetLength(this[6]);
  v3 = (char *)malloc_type_malloc(Length + 1, 0x9B379E20uLL);
  v4 = this[6];
  v5 = CFStringGetLength(v4);
  CFStringGetCString(v4, v3, v5 + 1, 0);
  v6 = opendir(v3);
  if (v3)
    free(v3);
  v7 = CFStringGetLength(this[5]);
  v8 = (char *)malloc_type_malloc(v7 + 1, 0x86CCC2DFuLL);
  v9 = this[5];
  v10 = CFStringGetLength(v9);
  CFStringGetCString(v9, v8, v10 + 1, 0);
  v11 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = v8;
    v12 = v11;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = v8;
    v12 = MEMORY[0x1E0C81028];
  }
  _os_log_impl(&dword_1DB697000, v12, OS_LOG_TYPE_DEFAULT, "CCFile::captureLogRun Current File %s\n", buf, 0xCu);
LABEL_9:
  if (glog_fd)
  {
    *(_QWORD *)&v13 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v29 = v13;
    v30 = v13;
    v27 = v13;
    v28 = v13;
    v25 = v13;
    v26 = v13;
    *(_OWORD *)buf = v13;
    *(_OWORD *)&buf[16] = v13;
    memset(&v23, 0, sizeof(v23));
    v22 = 0xAAAAAAAAAAAAAAAALL;
    time(&v22);
    localtime_r(&v22, &v23);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v23);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "CCFile::captureLogRun Current File %s\n", v8);
  }
  if (v6)
  {
    while (1)
    {
      while (1)
      {
        do
        {
          v14 = readdir(v6);
          if (!v14)
            goto LABEL_24;
          d_name = v14->d_name;
        }
        while (v14->d_name[0] == 46);
        if (!strcmp(v8, d_name))
          break;
        ((void (*)(CFStringRef *, const char *))(*this)[3].isa)(this, d_name);
      }
      v16 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = d_name;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = v8;
          v17 = v16;
LABEL_21:
          _os_log_impl(&dword_1DB697000, v17, OS_LOG_TYPE_DEFAULT, "CCFile::captureLogRun Skipping current file Dir file %s, Current File %s\n", buf, 0x16u);
        }
      }
      else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = d_name;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = v8;
        v17 = MEMORY[0x1E0C81028];
        goto LABEL_21;
      }
      if (glog_fd)
      {
        *(_QWORD *)&v18 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v29 = v18;
        v30 = v18;
        v27 = v18;
        v28 = v18;
        v25 = v18;
        v26 = v18;
        *(_OWORD *)buf = v18;
        *(_OWORD *)&buf[16] = v18;
        memset(&v23, 0, sizeof(v23));
        v22 = 0xAAAAAAAAAAAAAAAALL;
        time(&v22);
        localtime_r(&v22, &v23);
        strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v23);
        dprintf(glog_fd, "%s ", buf);
        dprintf(glog_fd, "CCFile::captureLogRun Skipping current file Dir file %s, Current File %s\n", d_name, v8);
      }
    }
  }
LABEL_24:
  if (v8)
    free(v8);
  if (v6)
    closedir(v6);
  ((void (*)(CFStringRef *))(*this)[5].isa)(this);
  v19 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_34;
    *(_WORD *)buf = 0;
    v20 = v19;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_34;
    *(_WORD *)buf = 0;
    v20 = MEMORY[0x1E0C81028];
  }
  _os_log_impl(&dword_1DB697000, v20, OS_LOG_TYPE_DEFAULT, "CCFile::captureLogRun() Exiting CCFile::captureLogRun \n", buf, 2u);
LABEL_34:
  if (glog_fd)
  {
    *(_QWORD *)&v21 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v21 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v29 = v21;
    v30 = v21;
    v27 = v21;
    v28 = v21;
    v25 = v21;
    v26 = v21;
    *(_OWORD *)buf = v21;
    *(_OWORD *)&buf[16] = v21;
    memset(&v23, 0, sizeof(v23));
    v22 = 0xAAAAAAAAAAAAAAAALL;
    time(&v22);
    localtime_r(&v22, &v23);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v23);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "CCFile::captureLogRun() Exiting CCFile::captureLogRun \n");
  }
}

ssize_t CCFile::doWrite(CCFile *this, void *a2, size_t a3)
{
  return write(*((_DWORD *)this + 9), a2, a3);
}

uint64_t CCFile::writeDataFiles(_QWORD *a1)
{
  const __CFString *v2;
  uint64_t v3;
  CFIndex Length;
  char *v5;
  const __CFString *v6;
  CFIndex v7;
  uint64_t v8;
  NSObject *v9;
  __int128 v10;
  const void *v11;
  time_t v13;
  tm v14;
  uint8_t buf[16];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = (const __CFString *)(*(uint64_t (**)(_QWORD *))(*a1 + 144))(a1);
  a1[7] = v2;
  v3 = mkdirRecursive(v2);
  if ((v3 & 1) != 0)
  {
    if (*((_DWORD *)a1 + 9) != -1)
      (*(void (**)(_QWORD *))(*a1 + 112))(a1);
    (*(void (**)(_QWORD *))(*a1 + 152))(a1);
    goto LABEL_13;
  }
  Length = CFStringGetLength((CFStringRef)a1[7]);
  v5 = (char *)malloc_type_malloc(Length + 1, 0xEC1AC0BCuLL);
  v6 = (const __CFString *)a1[7];
  v7 = CFStringGetLength(v6);
  CFStringGetCString(v6, v5, v7 + 1, 0);
  v8 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = v5;
      v9 = v8;
LABEL_17:
      _os_log_error_impl(&dword_1DB697000, v9, OS_LOG_TYPE_ERROR, "CCFile::captureLog Failed to create directory %s\n", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = v5;
    v9 = MEMORY[0x1E0C81028];
    goto LABEL_17;
  }
  if (glog_fd)
  {
    *(_QWORD *)&v10 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v21 = v10;
    v22 = v10;
    v19 = v10;
    v20 = v10;
    v17 = v10;
    v18 = v10;
    *(_OWORD *)buf = v10;
    v16 = v10;
    memset(&v14, 0, sizeof(v14));
    v13 = 0xAAAAAAAAAAAAAAAALL;
    time(&v13);
    localtime_r(&v13, &v14);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v14);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCFile::captureLog Failed to create directory %s\n", v5);
  }
  if (v5)
    free(v5);
LABEL_13:
  v11 = (const void *)a1[7];
  if (v11)
  {
    CFRelease(v11);
    a1[7] = 0;
  }
  return v3;
}

uint64_t CCFile::freeResources(CCFile *this)
{
  uint64_t v2;
  const void *v3;
  const void *v4;
  const void *v5;
  const void *v6;
  const void *v7;
  const void *v8;
  const void *v9;
  const void *v10;
  uint64_t result;

  v2 = *((_QWORD *)this + 2);
  if (v2)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 48))(v2);
    *((_QWORD *)this + 2) = 0;
  }
  if (*((_DWORD *)this + 9) != -1)
  {
    (*(void (**)(CCFile *))(*(_QWORD *)this + 176))(this);
    close(*((_DWORD *)this + 9));
    *((_DWORD *)this + 9) = -1;
  }
  v3 = (const void *)*((_QWORD *)this + 6);
  if (v3)
  {
    CFRelease(v3);
    *((_QWORD *)this + 6) = 0;
  }
  v4 = (const void *)*((_QWORD *)this + 7);
  if (v4)
  {
    CFRelease(v4);
    *((_QWORD *)this + 7) = 0;
  }
  v5 = (const void *)*((_QWORD *)this + 9);
  if (v5)
  {
    CFRelease(v5);
    *((_QWORD *)this + 9) = 0;
  }
  v6 = (const void *)*((_QWORD *)this + 10);
  if (v6)
  {
    CFRelease(v6);
    *((_QWORD *)this + 10) = 0;
  }
  v7 = (const void *)*((_QWORD *)this + 11);
  if (v7)
  {
    CFRelease(v7);
    *((_QWORD *)this + 11) = 0;
  }
  v8 = (const void *)*((_QWORD *)this + 12);
  if (v8)
  {
    CFRelease(v8);
    *((_QWORD *)this + 12) = 0;
  }
  v9 = (const void *)*((_QWORD *)this + 13);
  if (v9)
  {
    CFRelease(v9);
    *((_QWORD *)this + 13) = 0;
  }
  v10 = (const void *)*((_QWORD *)this + 5);
  if (v10)
  {
    CFRelease(v10);
    *((_QWORD *)this + 5) = 0;
  }
  result = *((unsigned int *)this + 16);
  if ((_DWORD)result)
  {
    result = IOObjectRelease(result);
    *((_DWORD *)this + 16) = 0;
  }
  return result;
}

void CCFile::CCFile(CCFile *this)
{
  *((_DWORD *)this + 2) = 1;
  *(_QWORD *)this = off_1EA31F7F8;
}

uint64_t CCFormatter::ccfree(CCFormatter *this)
{
  io_object_t v2;

  v2 = *((_DWORD *)this + 3);
  if (v2)
  {
    IOObjectRelease(v2);
    *((_DWORD *)this + 3) = 0;
  }
  return (*(uint64_t (**)(CCFormatter *))(*(_QWORD *)this + 8))(this);
}

uint64_t CCFormatter::writeLog()
{
  return 0;
}

uint64_t CCFormatter::writeCommentEntry(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD))(*(_QWORD *)a1 + 72))(a1, a2, a3, a4, 0, 0);
}

uint64_t CCFormatter::initWithRegistryEntry(CCFormatter *this, io_object_t object)
{
  IOObjectRetain(object);
  *((_DWORD *)this + 3) = object;
  return 1;
}

void CCFormatter::CCFormatter(CCFormatter *this)
{
  *((_DWORD *)this + 2) = 1;
  *(_QWORD *)this = off_1EA31F8C8;
}

void *CCFormatter::withRegistryEntry(CCFormatter *this)
{
  const __CFNumber *CFProperty;
  int v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  __int128 v9;
  time_t v10;
  tm v11;
  int valuePtr;
  uint8_t buf[16];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty((io_registry_entry_t)this, CFSTR("LogDataType"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  valuePtr = -1431655766;
  CFNumberGetValue(CFProperty, kCFNumberSInt32Type, &valuePtr);
  v3 = valuePtr;
  switch(valuePtr)
  {
    case 0:
      v4 = CCPcapngFormatter::withRegistryEntry(this);
      goto LABEL_12;
    case 1:
      v4 = CCTextFormatter::withRegistryEntry(this);
      goto LABEL_12;
    case 2:
      v4 = CCRawFormatter::withRegistryEntry(this);
      goto LABEL_12;
    case 3:
      v4 = CCIOReporterFormatter::withRegistryEntry(this);
      goto LABEL_12;
    case 4:
      v4 = CCOSSerializeFormatter::withRegistryEntry(this);
      goto LABEL_12;
    case 5:
      v4 = CCOSSerializeWithIOReporterFormatter::withRegistryEntry(this);
      goto LABEL_12;
    case 6:
      v4 = CCCrashTracerFormatter::withRegistryEntry(this);
LABEL_12:
      v7 = v4;
      if (CFProperty)
        goto LABEL_13;
      return v7;
    default:
      v5 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
          goto LABEL_16;
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v3;
        v6 = v5;
      }
      else
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_16;
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v3;
        v6 = MEMORY[0x1E0C81028];
      }
      _os_log_error_impl(&dword_1DB697000, v6, OS_LOG_TYPE_ERROR, "CCFormatter::withLogType Unsupported log data type(%d) \n", buf, 8u);
LABEL_16:
      if (glog_fd)
      {
        *(_QWORD *)&v9 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v19 = v9;
        v20 = v9;
        v17 = v9;
        v18 = v9;
        v15 = v9;
        v16 = v9;
        *(_OWORD *)buf = v9;
        v14 = v9;
        memset(&v11, 0, sizeof(v11));
        v10 = 0xAAAAAAAAAAAAAAAALL;
        time(&v10);
        localtime_r(&v10, &v11);
        strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v11);
        dprintf(glog_fd, "%s ", (const char *)buf);
        dprintf(glog_fd, "CCFormatter::withLogType Unsupported log data type(%d) \n", valuePtr);
      }
      v7 = 0;
      if (CFProperty)
LABEL_13:
        CFRelease(CFProperty);
      return v7;
  }
}

uint64_t CCFormatter::freeResources(CCFormatter *this)
{
  uint64_t result;

  result = *((unsigned int *)this + 3);
  if ((_DWORD)result)
  {
    result = IOObjectRelease(result);
    *((_DWORD *)this + 3) = 0;
  }
  return result;
}

void CCLogPipeInterface::~CCLogPipeInterface(void *this)
{
  if (this)
    free(this);
}

uint64_t CCLogPipeInterface::wakeupTapLoop(CCLogPipeInterface *this)
{
  return IOConnectCallMethod(*((_DWORD *)this + 22), 3u, 0, 0, 0, 0, 0, 0, 0, 0);
}

uint64_t CCLogPipeInterface::openUserClient(CCLogPipeInterface *this)
{
  return IOConnectCallScalarMethod(*((_DWORD *)this + 22), 1u, 0, 0, 0, 0);
}

uint64_t CCLogPipeInterface::freeResources(uint64_t this)
{
  uint64_t v1;

  if (*(int *)(this + 80) >= 3)
  {
    v1 = this;
    this = IOConnectCallScalarMethod(*(_DWORD *)(this + 88), 2u, 0, 0, 0, 0);
    *(_DWORD *)(v1 + 80) = 1;
  }
  return this;
}

CCPipeInterface *CCLogPipeInterface::withRegistryEntry(CCLogPipeInterface *this, CCTap *a2, CCTap *a3)
{
  io_registry_entry_t v4;
  CCPipeInterface *v5;

  v4 = this;
  v5 = (CCPipeInterface *)malloc_type_malloc(0x90uLL, 0xEE9A6C17uLL);
  *(_OWORD *)((char *)v5 + 8) = 0u;
  *(_OWORD *)((char *)v5 + 24) = 0u;
  *(_OWORD *)((char *)v5 + 40) = 0u;
  *(_OWORD *)((char *)v5 + 56) = 0u;
  *(_OWORD *)((char *)v5 + 72) = 0u;
  *(_OWORD *)((char *)v5 + 88) = 0u;
  *(_OWORD *)((char *)v5 + 104) = 0u;
  *(_OWORD *)((char *)v5 + 120) = 0u;
  *((_QWORD *)v5 + 17) = 0;
  *((_DWORD *)v5 + 2) = 1;
  *(_QWORD *)v5 = off_1EA31F950;
  if ((CCPipeInterface::initWithRegistryEntry(v5, v4, a2) & 1) == 0)
  {
    (*(void (**)(CCPipeInterface *))(*(_QWORD *)v5 + 48))(v5);
    return 0;
  }
  return v5;
}

uint64_t CCLogPipeInterface::mapPipe(uint64_t a1, uint64_t a2)
{
  unsigned int *v4;
  uint64_t result;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v6[0] = 0;
  v4 = (unsigned int *)MEMORY[0x1E0C83DA0];
  result = MEMORY[0x1DF0B2128](*(unsigned int *)(a1 + 88), 0, *MEMORY[0x1E0C83DA0], a2, a2 + 8, 1);
  if (!(_DWORD)result)
    return MEMORY[0x1DF0B2128](*(unsigned int *)(a1 + 88), 1, *v4, a2 + 16, v6, 1);
  return result;
}

uint64_t CCLogPipeInterface::unmapPipe(uint64_t a1, _QWORD *a2)
{
  uint64_t result;

  result = MEMORY[0x1DF0B2140](*(unsigned int *)(a1 + 88), 0, *MEMORY[0x1E0C83DA0], *a2);
  if (!(_DWORD)result)
    JUMPOUT(0x1DF0B2140);
  return result;
}

uint64_t CCLogPipeInterface::setLogFlags(uint64_t a1, void *inputStruct)
{
  return IOConnectCallMethod(*(_DWORD *)(a1 + 88), 4u, 0, 0, inputStruct, 0x108uLL, 0, 0, 0, 0);
}

uint64_t CCLogPipeInterface::updateLogFlags(uint64_t a1, void *inputStruct)
{
  return IOConnectCallMethod(*(_DWORD *)(a1 + 88), 0xDu, 0, 0, inputStruct, 0x204uLL, 0, 0, 0, 0);
}

uint64_t CCLogPipeInterface::setLogLevel(uint64_t a1, void *inputStruct)
{
  return IOConnectCallMethod(*(_DWORD *)(a1 + 88), 5u, 0, 0, inputStruct, 0x104uLL, 0, 0, 0, 0);
}

uint64_t CCLogPipeInterface::setConsoleLogFlags(uint64_t a1, void *inputStruct)
{
  return IOConnectCallMethod(*(_DWORD *)(a1 + 88), 6u, 0, 0, inputStruct, 0x108uLL, 0, 0, 0, 0);
}

uint64_t CCLogPipeInterface::updateConsoleLogFlags(uint64_t a1, void *inputStruct)
{
  return IOConnectCallMethod(*(_DWORD *)(a1 + 88), 0xEu, 0, 0, inputStruct, 0x204uLL, 0, 0, 0, 0);
}

uint64_t CCLogPipeInterface::setConsoleLogLevel(uint64_t a1, void *inputStruct)
{
  return IOConnectCallMethod(*(_DWORD *)(a1 + 88), 7u, 0, 0, inputStruct, 0x104uLL, 0, 0, 0, 0);
}

uint64_t CCLogPipeInterface::capture(uint64_t a1, void *inputStruct)
{
  return IOConnectCallMethod(*(_DWORD *)(a1 + 88), 8u, 0, 0, inputStruct, 0x90uLL, 0, 0, 0, 0);
}

uint64_t CCLogPipeInterface::setNotifyTimeout(uint64_t a1, void *inputStruct)
{
  return IOConnectCallMethod(*(_DWORD *)(a1 + 88), 9u, 0, 0, inputStruct, 4uLL, 0, 0, 0, 0);
}

uint64_t CCLogPipeInterface::setWatermarkLevel(uint64_t a1, void *inputStruct)
{
  return IOConnectCallMethod(*(_DWORD *)(a1 + 88), 0xAu, 0, 0, inputStruct, 4uLL, 0, 0, 0, 0);
}

uint64_t CCLogPipeInterface::setPolicy(uint64_t a1, void *inputStruct)
{
  return IOConnectCallMethod(*(_DWORD *)(a1 + 88), 0xBu, 0, 0, inputStruct, 4uLL, 0, 0, 0, 0);
}

uint64_t CCLogPipeInterface::profileLoaded(CCLogPipeInterface *this)
{
  return IOConnectCallMethod(*((_DWORD *)this + 22), 0xCu, 0, 0, 0, 0, 0, 0, 0, 0);
}

uint64_t CCLogPipeInterface::profileRemoved(CCLogPipeInterface *this)
{
  return IOConnectCallMethod(*((_DWORD *)this + 22), 0xFu, 0, 0, 0, 0, 0, 0, 0, 0);
}

uint64_t CCLogTap::profileLoaded(CFStringRef *this)
{
  uint64_t v2;
  const char *CStringPtr;
  const char *v4;
  NSObject *v5;
  const char *v6;
  const char *v7;
  __int128 v8;
  int v9;
  const char *v10;
  const char *v11;
  CFStringRef v12;
  _DWORD *v13;
  time_t v15;
  tm v16;
  _BYTE buf[32];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    CStringPtr = CFStringGetCStringPtr(this[5], 0);
    v4 = CFStringGetCStringPtr(this[6], 0);
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = CStringPtr;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = v4;
    v5 = v2;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    v6 = CFStringGetCStringPtr(this[5], 0);
    v7 = CFStringGetCStringPtr(this[6], 0);
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = v7;
    v5 = MEMORY[0x1E0C81028];
  }
  _os_log_impl(&dword_1DB697000, v5, OS_LOG_TYPE_DEFAULT, "CCLogTap::profileLoaded, Owner:%s Name:%s\n", buf, 0x16u);
LABEL_7:
  if (glog_fd)
  {
    *(_QWORD *)&v8 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v22 = v8;
    v23 = v8;
    v20 = v8;
    v21 = v8;
    v18 = v8;
    v19 = v8;
    *(_OWORD *)buf = v8;
    *(_OWORD *)&buf[16] = v8;
    memset(&v16, 0, sizeof(v16));
    v15 = 0xAAAAAAAAAAAAAAAALL;
    time(&v15);
    localtime_r(&v15, &v16);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v16);
    dprintf(glog_fd, "%s ", buf);
    v9 = glog_fd;
    v10 = CFStringGetCStringPtr(this[5], 0);
    v11 = CFStringGetCStringPtr(this[6], 0);
    dprintf(v9, "CCLogTap::profileLoaded, Owner:%s Name:%s\n", v10, v11);
  }
  v12 = this[8];
  if (v12)
  {
    if (v13)
      IOConnectCallMethod(v13[22], 0xCu, 0, 0, 0, 0, 0, 0, 0, 0);
  }
  return 0;
}

uint64_t CCLogTap::profileRemoved(CFStringRef *this)
{
  uint64_t v2;
  const char *CStringPtr;
  const char *v4;
  int v5;
  NSObject *v6;
  const char *v7;
  const char *v8;
  int v9;
  __int128 v10;
  int v11;
  const char *v12;
  const char *v13;
  CFStringRef v14;
  _DWORD *v15;
  time_t v17;
  tm v18;
  _BYTE buf[32];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    CStringPtr = CFStringGetCStringPtr(this[5], 0);
    v4 = CFStringGetCStringPtr(this[6], 0);
    v5 = *((_DWORD *)this + 4);
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = CStringPtr;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = v4;
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = v5;
    v6 = v2;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    v7 = CFStringGetCStringPtr(this[5], 0);
    v8 = CFStringGetCStringPtr(this[6], 0);
    v9 = *((_DWORD *)this + 4);
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = v7;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = v8;
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = v9;
    v6 = MEMORY[0x1E0C81028];
  }
  _os_log_impl(&dword_1DB697000, v6, OS_LOG_TYPE_DEFAULT, "CCLogTap::profileRemoved, Owner:%s Name:%s entry:%u\n", buf, 0x1Cu);
LABEL_7:
  if (glog_fd)
  {
    *(_QWORD *)&v10 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v24 = v10;
    v25 = v10;
    v22 = v10;
    v23 = v10;
    v20 = v10;
    v21 = v10;
    *(_OWORD *)buf = v10;
    *(_OWORD *)&buf[16] = v10;
    memset(&v18, 0, sizeof(v18));
    v17 = 0xAAAAAAAAAAAAAAAALL;
    time(&v17);
    localtime_r(&v17, &v18);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v18);
    dprintf(glog_fd, "%s ", buf);
    v11 = glog_fd;
    v12 = CFStringGetCStringPtr(this[5], 0);
    v13 = CFStringGetCStringPtr(this[6], 0);
    dprintf(v11, "CCLogTap::profileRemoved, Owner:%s Name:%s entry:%u\n", v12, v13, *((_DWORD *)this + 4));
  }
  v14 = this[8];
  if (v14)
  {
    if (v15)
      IOConnectCallMethod(v15[22], 0xFu, 0, 0, 0, 0, 0, 0, 0, 0);
  }
  return 0;
}

uint64_t CCLogTap::capture(uint64_t a1, const void *a2)
{
  uint64_t v4;
  const char *CStringPtr;
  const char *v6;
  NSObject *v7;
  const char *v8;
  const char *v9;
  __int128 v10;
  int v11;
  const char *v12;
  const char *v13;
  const void *v14;
  _DWORD *v15;
  uint64_t v16;
  time_t v18;
  tm v19;
  _BYTE buf[32];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    CStringPtr = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 40), 0);
    v6 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 48), 0);
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = CStringPtr;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = v6;
    v7 = v4;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    v8 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 40), 0);
    v9 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 48), 0);
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = v9;
    v7 = MEMORY[0x1E0C81028];
  }
  _os_log_impl(&dword_1DB697000, v7, OS_LOG_TYPE_DEFAULT, "CCLogTap::capture, Owner:%s Name:%s\n", buf, 0x16u);
LABEL_7:
  if (glog_fd)
  {
    *(_QWORD *)&v10 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v25 = v10;
    v26 = v10;
    v23 = v10;
    v24 = v10;
    v21 = v10;
    v22 = v10;
    *(_OWORD *)buf = v10;
    *(_OWORD *)&buf[16] = v10;
    memset(&v19, 0, sizeof(v19));
    v18 = 0xAAAAAAAAAAAAAAAALL;
    time(&v18);
    localtime_r(&v18, &v19);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v19);
    dprintf(glog_fd, "%s ", buf);
    v11 = glog_fd;
    v12 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 40), 0);
    v13 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 48), 0);
    dprintf(v11, "CCLogTap::capture, Owner:%s Name:%s\n", v12, v13);
  }
  v14 = *(const void **)(a1 + 64);
  if (v14)
  else
    v15 = 0;
  *(CFAbsoluteTime *)(a1 + 352) = CFAbsoluteTimeGetCurrent();
  *(_BYTE *)(a1 + 345) = 1;
  if (v15)
    v16 = IOConnectCallMethod(v15[22], 8u, 0, 0, a2, 0x90uLL, 0, 0, 0, 0);
  else
    v16 = 0;
  *(CFAbsoluteTime *)(a1 + 352) = CFAbsoluteTimeGetCurrent();
  *(_BYTE *)(a1 + 345) = 0;
  return v16;
}

void CCLogTap::tapLoopImpl(CCLogTap *this)
{
  const void *v2;
  void *v3;
  uint64_t v4;
  int v5;
  const char *CStringPtr;
  const char *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  const char *v11;
  __int128 v12;
  int v13;
  int v14;
  const char *v15;
  const char *v16;
  int v17;
  int v18;
  uint64_t v19;
  std::error_code *v20;
  CCLogFile *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  __int128 v25;
  uint64_t v26;
  int v27;
  const char *v28;
  const char *v29;
  NSObject *v30;
  int v31;
  const char *v32;
  const char *v33;
  __int128 v34;
  int v35;
  int v36;
  const char *v37;
  const char *v38;
  int v39;
  uint64_t v40;
  int v41;
  const char *v42;
  const char *v43;
  NSObject *v44;
  int v45;
  const char *v46;
  const char *v47;
  __int128 v48;
  int v49;
  int v50;
  const char *v51;
  const char *v52;
  uint64_t v53;
  int v54;
  NSObject *v55;
  int v56;
  uint64_t v57;
  int v58;
  NSObject *v59;
  int v60;
  uint64_t v61;
  int v62;
  NSObject *v63;
  int v64;
  __int128 v65;
  int v66;
  __int128 v67;
  int v68;
  __int128 v69;
  time_t v70;
  tm v71;
  _BYTE buf[48];
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v2 = (const void *)*((_QWORD *)this + 8);
  if (v2)
  else
    v3 = 0;
  v4 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_10;
    v5 = *((_DWORD *)this + 4);
    CStringPtr = CFStringGetCStringPtr(*((CFStringRef *)this + 5), 0);
    v7 = CFStringGetCStringPtr(*((CFStringRef *)this + 6), 0);
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = "tapLoopImpl";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 140;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = v5;
    *(_WORD *)&buf[24] = 2080;
    *(_QWORD *)&buf[26] = CStringPtr;
    *(_WORD *)&buf[34] = 2080;
    *(_QWORD *)&buf[36] = v7;
    v8 = v4;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_10;
    v9 = *((_DWORD *)this + 4);
    v10 = CFStringGetCStringPtr(*((CFStringRef *)this + 5), 0);
    v11 = CFStringGetCStringPtr(*((CFStringRef *)this + 6), 0);
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = "tapLoopImpl";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 140;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = v9;
    *(_WORD *)&buf[24] = 2080;
    *(_QWORD *)&buf[26] = v10;
    *(_WORD *)&buf[34] = 2080;
    *(_QWORD *)&buf[36] = v11;
    v8 = MEMORY[0x1E0C81028];
  }
  _os_log_impl(&dword_1DB697000, v8, OS_LOG_TYPE_DEFAULT, "CCLogTap::%s:%d tapLoopImpl entry:%u Owner:%s Name:%s\n", buf, 0x2Cu);
LABEL_10:
  if (glog_fd)
  {
    *(_QWORD *)&v12 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v76 = v12;
    v77 = v12;
    v74 = v12;
    v75 = v12;
    *(_OWORD *)&buf[32] = v12;
    v73 = v12;
    *(_OWORD *)buf = v12;
    *(_OWORD *)&buf[16] = v12;
    memset(&v71, 0, sizeof(v71));
    v70 = 0xAAAAAAAAAAAAAAAALL;
    time(&v70);
    localtime_r(&v70, &v71);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v71);
    dprintf(glog_fd, "%s ", buf);
    v13 = glog_fd;
    v14 = *((_DWORD *)this + 4);
    v15 = CFStringGetCStringPtr(*((CFStringRef *)this + 5), 0);
    v16 = CFStringGetCStringPtr(*((CFStringRef *)this + 6), 0);
    dprintf(v13, "CCLogTap::%s:%d tapLoopImpl entry:%u Owner:%s Name:%s\n", "tapLoopImpl", 140, v14, v15, v16);
  }
  pthread_mutex_lock((pthread_mutex_t *)(*((_QWORD *)this + 8) + 16));
  v17 = *((unsigned __int8 *)this + 56);
  pthread_mutex_unlock((pthread_mutex_t *)(*((_QWORD *)this + 8) + 16));
  if (!v17)
  {
    __dmb(0xBu);
    *((_BYTE *)this + 345) = 1;
    if (v3)
    {
      v18 = CCLogPipeInterface::mapPipe((uint64_t)v3, (uint64_t)this + 184);
      if (!v18)
      {
        if (*((_BYTE *)this + 96))
        {
          *((_WORD *)this + 48) = 256;
        }
        else if (!*((_BYTE *)this + 97) && !*((_QWORD *)this + 4))
        {
          v19 = isSeedAndiOS();
          if (!(_DWORD)v19 || deviceUnlockedSinceBoot(v19, v20))
          {
            v21 = CCFile::withRegistryEntry((CCFile *)*((unsigned int *)this + 4));
            *((_QWORD *)this + 4) = v21;
            if (v21)
              (*(void (**)(CCLogFile *, _QWORD))(*(_QWORD *)v21 + 56))(v21, 0);
          }
        }
        v22 = *((_QWORD *)this + 4);
        if (!v22 || ((*(uint64_t (**)(uint64_t))(*(_QWORD *)v22 + 120))(v22) & 1) != 0)
        {
LABEL_31:
          if (*((_BYTE *)this + 56) || *((_BYTE *)this + 97))
            goto LABEL_42;
          v26 = coreCaptureOsLog;
          if (coreCaptureOsLog)
          {
            if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
            {
              v27 = *((_DWORD *)this + 4);
              v28 = CFStringGetCStringPtr(*((CFStringRef *)this + 5), 0);
              v29 = CFStringGetCStringPtr(*((CFStringRef *)this + 6), 0);
              *(_DWORD *)buf = 136316162;
              *(_QWORD *)&buf[4] = "tapLoopImpl";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 183;
              *(_WORD *)&buf[18] = 1024;
              *(_DWORD *)&buf[20] = v27;
              *(_WORD *)&buf[24] = 2080;
              *(_QWORD *)&buf[26] = v28;
              *(_WORD *)&buf[34] = 2080;
              *(_QWORD *)&buf[36] = v29;
              v30 = v26;
LABEL_38:
              _os_log_impl(&dword_1DB697000, v30, OS_LOG_TYPE_DEFAULT, "%s:%d processEvent entry:%u Owner:%s Name:%s", buf, 0x2Cu);
            }
          }
          else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            v31 = *((_DWORD *)this + 4);
            v32 = CFStringGetCStringPtr(*((CFStringRef *)this + 5), 0);
            v33 = CFStringGetCStringPtr(*((CFStringRef *)this + 6), 0);
            *(_DWORD *)buf = 136316162;
            *(_QWORD *)&buf[4] = "tapLoopImpl";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 183;
            *(_WORD *)&buf[18] = 1024;
            *(_DWORD *)&buf[20] = v31;
            *(_WORD *)&buf[24] = 2080;
            *(_QWORD *)&buf[26] = v32;
            *(_WORD *)&buf[34] = 2080;
            *(_QWORD *)&buf[36] = v33;
            v30 = MEMORY[0x1E0C81028];
            goto LABEL_38;
          }
          if (glog_fd)
          {
            *(_QWORD *)&v34 = 0xAAAAAAAAAAAAAAAALL;
            *((_QWORD *)&v34 + 1) = 0xAAAAAAAAAAAAAAAALL;
            v76 = v34;
            v77 = v34;
            v74 = v34;
            v75 = v34;
            *(_OWORD *)&buf[32] = v34;
            v73 = v34;
            *(_OWORD *)buf = v34;
            *(_OWORD *)&buf[16] = v34;
            memset(&v71, 0, sizeof(v71));
            v70 = 0xAAAAAAAAAAAAAAAALL;
            time(&v70);
            localtime_r(&v70, &v71);
            strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v71);
            dprintf(glog_fd, "%s ", buf);
            v35 = glog_fd;
            v36 = *((_DWORD *)this + 4);
            v37 = CFStringGetCStringPtr(*((CFStringRef *)this + 5), 0);
            v38 = CFStringGetCStringPtr(*((CFStringRef *)this + 6), 0);
            dprintf(v35, "%s:%d processEvent entry:%u Owner:%s Name:%s", "tapLoopImpl", 183, v36, v37, v38);
          }
          CCLogTap::processEvent(this);
LABEL_42:
          v39 = CCLogPipeInterface::unmapPipe((uint64_t)v3, (_QWORD *)this + 23);
          if (!v39)
          {
            *((CFAbsoluteTime *)this + 44) = CFAbsoluteTimeGetCurrent();
            *((_BYTE *)this + 345) = 0;
            v40 = coreCaptureOsLog;
            if (coreCaptureOsLog)
            {
              if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
                goto LABEL_49;
              v41 = *((_DWORD *)this + 4);
              v42 = CFStringGetCStringPtr(*((CFStringRef *)this + 5), 0);
              v43 = CFStringGetCStringPtr(*((CFStringRef *)this + 6), 0);
              *(_DWORD *)buf = 67109634;
              *(_DWORD *)&buf[4] = v41;
              *(_WORD *)&buf[8] = 2080;
              *(_QWORD *)&buf[10] = v42;
              *(_WORD *)&buf[18] = 2080;
              *(_QWORD *)&buf[20] = v43;
              v44 = v40;
            }
            else
            {
              if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
                goto LABEL_49;
              v45 = *((_DWORD *)this + 4);
              v46 = CFStringGetCStringPtr(*((CFStringRef *)this + 5), 0);
              v47 = CFStringGetCStringPtr(*((CFStringRef *)this + 6), 0);
              *(_DWORD *)buf = 67109634;
              *(_DWORD *)&buf[4] = v45;
              *(_WORD *)&buf[8] = 2080;
              *(_QWORD *)&buf[10] = v46;
              *(_WORD *)&buf[18] = 2080;
              *(_QWORD *)&buf[20] = v47;
              v44 = MEMORY[0x1E0C81028];
            }
            _os_log_impl(&dword_1DB697000, v44, OS_LOG_TYPE_DEFAULT, "CCLogTap::tapLoop entry:%u Owner:%s Name:%s Exiting taploop\n", buf, 0x1Cu);
LABEL_49:
            if (glog_fd)
            {
              *(_QWORD *)&v48 = 0xAAAAAAAAAAAAAAAALL;
              *((_QWORD *)&v48 + 1) = 0xAAAAAAAAAAAAAAAALL;
              v76 = v48;
              v77 = v48;
              v74 = v48;
              v75 = v48;
              *(_OWORD *)&buf[32] = v48;
              v73 = v48;
              *(_OWORD *)buf = v48;
              *(_OWORD *)&buf[16] = v48;
              memset(&v71, 0, sizeof(v71));
              v70 = 0xAAAAAAAAAAAAAAAALL;
              time(&v70);
              localtime_r(&v70, &v71);
              strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v71);
              dprintf(glog_fd, "%s ", buf);
              v49 = glog_fd;
              v50 = *((_DWORD *)this + 4);
              v51 = CFStringGetCStringPtr(*((CFStringRef *)this + 5), 0);
              v52 = CFStringGetCStringPtr(*((CFStringRef *)this + 6), 0);
              dprintf(v49, "CCLogTap::tapLoop entry:%u Owner:%s Name:%s Exiting taploop\n", v50, v51, v52);
            }
            return;
          }
          v60 = v39;
          v61 = coreCaptureOsLog;
          if (coreCaptureOsLog)
          {
            if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
              goto LABEL_76;
            v68 = *((_DWORD *)this + 4);
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)&buf[4] = v68;
            *(_WORD *)&buf[8] = 1024;
            *(_DWORD *)&buf[10] = v60;
            v63 = v61;
          }
          else
          {
            if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              goto LABEL_76;
            v62 = *((_DWORD *)this + 4);
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)&buf[4] = v62;
            *(_WORD *)&buf[8] = 1024;
            *(_DWORD *)&buf[10] = v60;
            v63 = MEMORY[0x1E0C81028];
          }
          _os_log_error_impl(&dword_1DB697000, v63, OS_LOG_TYPE_ERROR, "CCLogTap::tapLoopImpl() entry:%u failed to unmap pipe with rc[0x%08x]\n", buf, 0xEu);
LABEL_76:
          if (glog_fd)
          {
            *(_QWORD *)&v69 = 0xAAAAAAAAAAAAAAAALL;
            *((_QWORD *)&v69 + 1) = 0xAAAAAAAAAAAAAAAALL;
            v76 = v69;
            v77 = v69;
            v74 = v69;
            v75 = v69;
            *(_OWORD *)&buf[32] = v69;
            v73 = v69;
            *(_OWORD *)buf = v69;
            *(_OWORD *)&buf[16] = v69;
            memset(&v71, 0, sizeof(v71));
            v70 = 0xAAAAAAAAAAAAAAAALL;
            time(&v70);
            localtime_r(&v70, &v71);
            strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v71);
            dprintf(glog_fd, "%s ", buf);
            dprintf(glog_fd, "CCLogTap::tapLoopImpl() entry:%u failed to unmap pipe with rc[0x%08x]\n");
          }
          goto LABEL_78;
        }
        v23 = coreCaptureOsLog;
        if (coreCaptureOsLog)
        {
          if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
            goto LABEL_29;
          *(_WORD *)buf = 0;
          v24 = v23;
        }
        else
        {
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            goto LABEL_29;
          *(_WORD *)buf = 0;
          v24 = MEMORY[0x1E0C81028];
        }
        _os_log_error_impl(&dword_1DB697000, v24, OS_LOG_TYPE_ERROR, "CCLogTap::tapLoopImpl() isLogdirExists failed\n", buf, 2u);
LABEL_29:
        if (glog_fd)
        {
          *(_QWORD *)&v25 = 0xAAAAAAAAAAAAAAAALL;
          *((_QWORD *)&v25 + 1) = 0xAAAAAAAAAAAAAAAALL;
          v76 = v25;
          v77 = v25;
          v74 = v25;
          v75 = v25;
          *(_OWORD *)&buf[32] = v25;
          v73 = v25;
          *(_OWORD *)buf = v25;
          *(_OWORD *)&buf[16] = v25;
          memset(&v71, 0, sizeof(v71));
          v70 = 0xAAAAAAAAAAAAAAAALL;
          time(&v70);
          localtime_r(&v70, &v71);
          strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v71);
          dprintf(glog_fd, "%s ", buf);
          dprintf(glog_fd, "CCLogTap::tapLoopImpl() isLogdirExists failed\n");
        }
        goto LABEL_31;
      }
      v56 = v18;
      v57 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
          goto LABEL_71;
        v66 = *((_DWORD *)this + 4);
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)&buf[4] = v66;
        *(_WORD *)&buf[8] = 1024;
        *(_DWORD *)&buf[10] = v56;
        v59 = v57;
      }
      else
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_71;
        v58 = *((_DWORD *)this + 4);
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)&buf[4] = v58;
        *(_WORD *)&buf[8] = 1024;
        *(_DWORD *)&buf[10] = v56;
        v59 = MEMORY[0x1E0C81028];
      }
      _os_log_error_impl(&dword_1DB697000, v59, OS_LOG_TYPE_ERROR, "CCLogTap::tapLoopImpl() entry:%u failed to map pipe with rc[0x%08x]\n", buf, 0xEu);
LABEL_71:
      if (glog_fd)
      {
        *(_QWORD *)&v67 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v67 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v76 = v67;
        v77 = v67;
        v74 = v67;
        v75 = v67;
        *(_OWORD *)&buf[32] = v67;
        v73 = v67;
        *(_OWORD *)buf = v67;
        *(_OWORD *)&buf[16] = v67;
        memset(&v71, 0, sizeof(v71));
        v70 = 0xAAAAAAAAAAAAAAAALL;
        time(&v70);
        localtime_r(&v70, &v71);
        strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v71);
        dprintf(glog_fd, "%s ", buf);
        dprintf(glog_fd, "CCLogTap::tapLoopImpl() entry:%u failed to map pipe with rc[0x%08x]\n");
      }
      goto LABEL_78;
    }
    v53 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_66;
      v64 = *((_DWORD *)this + 4);
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v64;
      v55 = v53;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_66;
      v54 = *((_DWORD *)this + 4);
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v54;
      v55 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v55, OS_LOG_TYPE_ERROR, "CCLogTap::tapLoopImpl() entry:%u failed to get pipe interface \n", buf, 8u);
LABEL_66:
    if (glog_fd)
    {
      *(_QWORD *)&v65 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v65 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v76 = v65;
      v77 = v65;
      v74 = v65;
      v75 = v65;
      *(_OWORD *)&buf[32] = v65;
      v73 = v65;
      *(_OWORD *)buf = v65;
      *(_OWORD *)&buf[16] = v65;
      memset(&v71, 0, sizeof(v71));
      v70 = 0xAAAAAAAAAAAAAAAALL;
      time(&v70);
      localtime_r(&v70, &v71);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v71);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "CCLogTap::tapLoopImpl() entry:%u failed to get pipe interface \n");
    }
LABEL_78:
    exit(1);
  }
}

uint64_t CCLogTap::processEvent(CCLogTap *this)
{
  unsigned int *v2;
  unsigned int v3;
  int v4;
  int v5;
  uint64_t v6;
  unsigned int v7;
  int v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  NSObject *v12;
  unint64_t v13;
  uint64_t v14;
  int v15;
  unint64_t v16;
  unsigned int v17;
  uint64_t v18;
  NSObject *v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  int v23;
  NSObject *v24;
  uint64_t v25;
  int v26;
  NSObject *v27;
  __int128 v28;
  int v29;
  __int128 v30;
  uint64_t v31;
  std::error_code *v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  size_t v36;
  uint64_t v37;
  int v38;
  NSObject *v39;
  const void *v40;
  int v41;
  __int128 v42;
  int v43;
  __int128 v44;
  int v45;
  int v46;
  unint64_t v47;
  const void *v48;
  size_t v49;
  int v50;
  _QWORD *v51;
  __int16 v52;
  size_t v53;
  unint64_t v54;
  BOOL v55;
  _QWORD *v56;
  size_t v57;
  _QWORD *v58;
  uint64_t v59;
  NSObject *v60;
  __int128 v61;
  uint64_t v62;
  CFIndex Length;
  CFIndex v64;
  char *v65;
  const __CFString *v66;
  CFIndex v67;
  void *v68;
  _QWORD *v69;
  uint64_t v70;
  NSObject *v71;
  __int128 v72;
  int v73;
  unsigned int v74;
  int v75;
  __int128 v76;
  uint64_t v77;
  NSObject *v78;
  __int128 v79;
  int v80;
  __int128 v81;
  uint64_t v82;
  uint64_t v84;
  int v85;
  NSObject *v86;
  uint64_t v87;
  int v88;
  NSObject *v89;
  __int128 v90;
  __int128 v91;
  size_t v92;
  uint64_t v93;
  uint64_t v94;
  int v95;
  NSObject *v96;
  uint64_t v97;
  int v98;
  NSObject *v99;
  uint64_t v100;
  int v101;
  NSObject *v102;
  int v103;
  int v104;
  __int128 v105;
  uint64_t v106;
  NSObject *v107;
  uint64_t v108;
  int v109;
  NSObject *v110;
  int v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  uint64_t v116;
  int v117;
  int v118;
  int v119;
  size_t v120;
  uint64_t v121;
  const void *v122;
  size_t v123;
  int v124;
  int v125;
  int v126;
  int v127;
  unsigned int v128;
  time_t v129;
  time_t v130[2];
  __int128 v131;
  int v132;
  tm v133;
  _BYTE buf[64];
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  uint64_t v139;

  v139 = *MEMORY[0x1E0C80C00];
  if (!*((_QWORD *)this + 4))
  {
    v10 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
        goto LABEL_132;
      v11 = *((_DWORD *)this + 4);
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "IOReturn CCLogTap::processEvent()";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v11;
      v12 = v10;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        goto LABEL_132;
      v80 = *((_DWORD *)this + 4);
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "IOReturn CCLogTap::processEvent()";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v80;
      v12 = MEMORY[0x1E0C81028];
    }
    _os_log_impl(&dword_1DB697000, v12, OS_LOG_TYPE_DEFAULT, "%s - no fFile entry:%u", buf, 0x12u);
LABEL_132:
    if (glog_fd)
    {
      *(_QWORD *)&v81 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v81 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v137 = v81;
      v138 = v81;
      v135 = v81;
      v136 = v81;
      *(_OWORD *)&buf[32] = v81;
      *(_OWORD *)&buf[48] = v81;
      *(_OWORD *)&buf[16] = v81;
      *(_OWORD *)buf = v81;
      memset(&v133, 0, sizeof(v133));
      v130[0] = 0xAAAAAAAAAAAAAAAALL;
      time(v130);
      localtime_r(v130, &v133);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v133);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "%s - no fFile entry:%u", "IOReturn CCLogTap::processEvent()", *((_DWORD *)this + 4));
    }
    return 0;
  }
  v2 = (unsigned int *)*((_QWORD *)this + 25);
  v2[2] = 1;
  __dmb(0xBu);
  v3 = v2[1];
  if (v3 == *v2)
  {
    v4 = 0;
    v126 = 0;
    v127 = 0;
    v124 = 0;
    v125 = 0;
    goto LABEL_4;
  }
  v126 = 0;
  v127 = 0;
  v124 = 0;
  v125 = 0;
  v4 = 0;
  while (1)
  {
    if (*((_BYTE *)this + 56) || *((_BYTE *)this + 96))
      goto LABEL_4;
    v128 = *v2;
    v132 = 0;
    *(_OWORD *)v130 = 0u;
    v131 = 0u;
    __dmb(0xBu);
    v13 = *((_QWORD *)this + 24);
    if (v13 < v128)
    {
      v84 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        {
          v85 = *((_DWORD *)this + 4);
          *(_DWORD *)buf = 136315906;
          *(_QWORD *)&buf[4] = "processEvent";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v128;
          *(_WORD *)&buf[18] = 2048;
          *(_QWORD *)&buf[20] = v13;
          *(_WORD *)&buf[28] = 1024;
          *(_DWORD *)&buf[30] = v85;
          v86 = v84;
LABEL_159:
          _os_log_error_impl(&dword_1DB697000, v86, OS_LOG_TYPE_ERROR, "%s Ring offset out of range: %u > %llu entry:%u\n", buf, 0x22u);
        }
      }
      else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v103 = *((_DWORD *)this + 4);
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = "processEvent";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v128;
        *(_WORD *)&buf[18] = 2048;
        *(_QWORD *)&buf[20] = v13;
        *(_WORD *)&buf[28] = 1024;
        *(_DWORD *)&buf[30] = v103;
        v86 = MEMORY[0x1E0C81028];
        goto LABEL_159;
      }
      if (glog_fd)
      {
        *(_QWORD *)&v90 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v90 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v137 = v90;
        v138 = v90;
        v135 = v90;
        v136 = v90;
        *(_OWORD *)&buf[32] = v90;
        *(_OWORD *)&buf[48] = v90;
        *(_OWORD *)&buf[16] = v90;
        *(_OWORD *)buf = v90;
        memset(&v133, 0, sizeof(v133));
        v129 = 0xAAAAAAAAAAAAAAAALL;
        time(&v129);
        localtime_r(&v129, &v133);
        strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v133);
        dprintf(glog_fd, "%s ", buf);
        dprintf(glog_fd, "%s Ring offset out of range: %u > %llu entry:%u\n", "processEvent", v128, *((_QWORD *)this + 24), *((_DWORD *)this + 4));
      }
      return 3758097090;
    }
    v14 = *((_QWORD *)this + 23) + v128;
    if ((v14 & 3) != 0)
    {
      v87 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
          goto LABEL_147;
        v88 = *((_DWORD *)this + 4);
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = "processEvent";
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = 4;
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = v128;
        *(_WORD *)&buf[28] = 1024;
        *(_DWORD *)&buf[30] = v88;
        v89 = v87;
      }
      else
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_147;
        v104 = *((_DWORD *)this + 4);
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = "processEvent";
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = 4;
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = v128;
        *(_WORD *)&buf[28] = 1024;
        *(_DWORD *)&buf[30] = v104;
        v89 = MEMORY[0x1E0C81028];
      }
      _os_log_error_impl(&dword_1DB697000, v89, OS_LOG_TYPE_ERROR, "%s Read Ptr is not multiple of %lu (%d) entry:%u \n", buf, 0x22u);
LABEL_147:
      v82 = 3758097086;
      if (glog_fd)
      {
        *(_QWORD *)&v91 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v91 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v137 = v91;
        v138 = v91;
        v135 = v91;
        v136 = v91;
        *(_OWORD *)&buf[32] = v91;
        *(_OWORD *)&buf[48] = v91;
        *(_OWORD *)&buf[16] = v91;
        *(_OWORD *)buf = v91;
        memset(&v133, 0, sizeof(v133));
        v129 = 0xAAAAAAAAAAAAAAAALL;
        time(&v129);
        localtime_r(&v129, &v133);
        strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v133);
        dprintf(glog_fd, "%s ", buf);
        dprintf(glog_fd, "%s Read Ptr is not multiple of %lu (%d) entry:%u \n", "processEvent", 4, v128, *((_DWORD *)this + 4));
      }
      return v82;
    }
    v15 = *(_DWORD *)v14;
    if (*(_DWORD *)v14 == 80 || v13 - v128 <= 0x23)
    {
      v16 = (v128 + 4) % v13;
      ++v4;
      goto LABEL_21;
    }
    v20 = *(_OWORD *)v14;
    v21 = *(_OWORD *)(v14 + 16);
    v132 = *(_DWORD *)(v14 + 32);
    *(_OWORD *)v130 = v20;
    v131 = v21;
    if (v128 != *v2 || v15 != LODWORD(v130[0]))
    {
      v25 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        {
          v26 = *((_DWORD *)this + 4);
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "processEvent";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v26;
          v27 = v25;
          goto LABEL_115;
        }
      }
      else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v73 = *((_DWORD *)this + 4);
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "processEvent";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v73;
        v27 = MEMORY[0x1E0C81028];
LABEL_115:
        _os_log_error_impl(&dword_1DB697000, v27, OS_LOG_TYPE_ERROR, "%s Read pointer moved while copying metadata. Retrying entry:%u\n", buf, 0x12u);
      }
      if (glog_fd)
      {
        *(_QWORD *)&v30 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v30 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v137 = v30;
        v138 = v30;
        v135 = v30;
        v136 = v30;
        *(_OWORD *)&buf[32] = v30;
        *(_OWORD *)&buf[48] = v30;
        *(_OWORD *)&buf[16] = v30;
        *(_OWORD *)buf = v30;
        memset(&v133, 0, sizeof(v133));
        v129 = 0xAAAAAAAAAAAAAAAALL;
        time(&v129);
        localtime_r(&v129, &v133);
        strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v133);
        dprintf(glog_fd, "%s ", buf);
        dprintf(glog_fd, "%s Read pointer moved while copying metadata. Retrying entry:%u\n", "processEvent", *((_DWORD *)this + 4));
      }
      goto LABEL_57;
    }
    if (LODWORD(v130[0]) == 69)
    {
      v22 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
        {
          v23 = *((_DWORD *)this + 4);
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "IOReturn CCLogTap::processEvent()";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v23;
          v24 = v22;
          goto LABEL_53;
        }
      }
      else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v41 = *((_DWORD *)this + 4);
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "IOReturn CCLogTap::processEvent()";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v41;
        v24 = MEMORY[0x1E0C81028];
LABEL_53:
        _os_log_impl(&dword_1DB697000, v24, OS_LOG_TYPE_DEFAULT, "%s - STATE IS EMPTY. CONTINUE entry:%u", buf, 0x12u);
      }
      if (glog_fd)
      {
        *(_QWORD *)&v42 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v42 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v137 = v42;
        v138 = v42;
        v135 = v42;
        v136 = v42;
        *(_OWORD *)&buf[32] = v42;
        *(_OWORD *)&buf[48] = v42;
        *(_OWORD *)&buf[16] = v42;
        *(_OWORD *)buf = v42;
        memset(&v133, 0, sizeof(v133));
        v129 = 0xAAAAAAAAAAAAAAAALL;
        time(&v129);
        localtime_r(&v129, &v133);
        strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v133);
        dprintf(glog_fd, "%s ", buf);
        dprintf(glog_fd, "%s - STATE IS EMPTY. CONTINUE entry:%u", "IOReturn CCLogTap::processEvent()", *((_DWORD *)this + 4));
      }
      ++v127;
      goto LABEL_57;
    }
    if (LODWORD(v130[0]) == 82)
    {
      v97 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
        {
          v98 = *((_DWORD *)this + 4);
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "IOReturn CCLogTap::processEvent()";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v98;
          v99 = v97;
          goto LABEL_173;
        }
      }
      else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v111 = *((_DWORD *)this + 4);
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "IOReturn CCLogTap::processEvent()";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v111;
        v99 = MEMORY[0x1E0C81028];
LABEL_173:
        _os_log_impl(&dword_1DB697000, v99, OS_LOG_TYPE_DEFAULT, "%s - STATE IS RESERVED. BREAK entry:%u", buf, 0x12u);
      }
      if (glog_fd)
      {
        *(_QWORD *)&v112 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v112 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v137 = v112;
        v138 = v112;
        v135 = v112;
        v136 = v112;
        *(_OWORD *)&buf[32] = v112;
        *(_OWORD *)&buf[48] = v112;
        *(_OWORD *)&buf[16] = v112;
        *(_OWORD *)buf = v112;
        memset(&v133, 0, sizeof(v133));
        v129 = 0xAAAAAAAAAAAAAAAALL;
        time(&v129);
        localtime_r(&v129, &v133);
        strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v133);
        dprintf(glog_fd, "%s ", buf);
        dprintf(glog_fd, "%s - STATE IS RESERVED. BREAK entry:%u", "IOReturn CCLogTap::processEvent()", *((_DWORD *)this + 4));
      }
      v5 = 1;
      goto LABEL_5;
    }
    v31 = isSeedAndiOS();
    if ((_DWORD)v31 && (deviceUnlockedSinceBoot(v31, v32) & 1) == 0)
    {
      v108 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        {
          v109 = *((_DWORD *)this + 4);
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v109;
          v110 = v108;
          goto LABEL_193;
        }
      }
      else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v119 = *((_DWORD *)this + 4);
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v119;
        v110 = MEMORY[0x1E0C81028];
LABEL_193:
        _os_log_error_impl(&dword_1DB697000, v110, OS_LOG_TYPE_ERROR, "seed build (or boot-arg) and device hasn't been unlocked since boot. Won't process event and continue when next event is posted entry:%u\n", buf, 8u);
      }
      if (glog_fd)
      {
        *(_QWORD *)&v115 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v115 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v137 = v115;
        v138 = v115;
        v135 = v115;
        v136 = v115;
        *(_OWORD *)&buf[32] = v115;
        *(_OWORD *)&buf[48] = v115;
        *(_OWORD *)&buf[16] = v115;
        *(_OWORD *)buf = v115;
        memset(&v133, 0, sizeof(v133));
        v129 = 0xAAAAAAAAAAAAAAAALL;
        time(&v129);
        localtime_r(&v129, &v133);
        strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v133);
        dprintf(glog_fd, "%s ", buf);
        dprintf(glog_fd, "seed build (or boot-arg) and device hasn't been unlocked since boot. Won't process event and continue when next event is posted entry:%u\n", *((_DWORD *)this + 4));
      }
      goto LABEL_4;
    }
    v34 = *((_QWORD *)this + 23);
    v33 = *((_QWORD *)this + 24);
    v35 = (v128 + 36) % v33;
    v36 = WORD4(v131);
    if (v35 + WORD4(v131) <= v33)
    {
      v123 = 0;
      v40 = 0;
      goto LABEL_67;
    }
    v37 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      {
        v38 = *((_DWORD *)this + 4);
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "IOReturn CCLogTap::processEvent()";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v38;
        v39 = v37;
LABEL_63:
        _os_log_impl(&dword_1DB697000, v39, OS_LOG_TYPE_DEFAULT, "%s - localLogMetadata.payloadLength + logPayloadOffset IS BEYOND RINGSIZE. ADJUST entry:%u", buf, 0x12u);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v43 = *((_DWORD *)this + 4);
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "IOReturn CCLogTap::processEvent()";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v43;
      v39 = MEMORY[0x1E0C81028];
      goto LABEL_63;
    }
    if (glog_fd)
    {
      *(_QWORD *)&v44 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v44 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v137 = v44;
      v138 = v44;
      v135 = v44;
      v136 = v44;
      *(_OWORD *)&buf[32] = v44;
      *(_OWORD *)&buf[48] = v44;
      *(_OWORD *)&buf[16] = v44;
      *(_OWORD *)buf = v44;
      memset(&v133, 0, sizeof(v133));
      v129 = 0xAAAAAAAAAAAAAAAALL;
      time(&v129);
      localtime_r(&v129, &v133);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v133);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "%s - localLogMetadata.payloadLength + logPayloadOffset IS BEYOND RINGSIZE. ADJUST entry:%u", "IOReturn CCLogTap::processEvent()", *((_DWORD *)this + 4));
    }
    v36 = (*((_DWORD *)this + 48) - v35);
    v123 = WORD4(v131) - v36;
    v40 = (const void *)*((_QWORD *)this + 23);
LABEL_67:
    if (!*((_BYTE *)this + 344))
    {
      *((_BYTE *)this + 344) = 1;
      goto LABEL_72;
    }
    v45 = HIWORD(v130[0]);
    if (*((unsigned __int16 *)this + 171) == HIWORD(v130[0]))
    {
      v106 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v45;
          v107 = v106;
          goto LABEL_191;
        }
      }
      else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v45;
        v107 = MEMORY[0x1E0C81028];
LABEL_191:
        _os_log_error_impl(&dword_1DB697000, v107, OS_LOG_TYPE_ERROR, "previous and current sequence numbers are same %u\n", buf, 8u);
      }
      if (glog_fd)
      {
        *(_QWORD *)&v114 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v114 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v137 = v114;
        v138 = v114;
        v135 = v114;
        v136 = v114;
        *(_OWORD *)&buf[32] = v114;
        *(_OWORD *)&buf[48] = v114;
        *(_OWORD *)&buf[16] = v114;
        *(_OWORD *)buf = v114;
        memset(&v133, 0, sizeof(v133));
        v129 = 0xAAAAAAAAAAAAAAAALL;
        time(&v129);
        localtime_r(&v129, &v133);
        strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v133);
        dprintf(glog_fd, "%s ", buf);
        dprintf(glog_fd, "previous and current sequence numbers are same %u\n", HIWORD(v130[0]));
      }
      goto LABEL_4;
    }
    v46 = *((unsigned __int16 *)this + 170);
    if (v46 != HIWORD(v130[0]))
    {
      v121 = v34;
      v47 = v35;
      v48 = v40;
      v49 = v36;
      v50 = snprintf((char *)this + 212, 0x80uLL, "Dropped Log message expected sequence number = %u, Received %u\n", v46, HIWORD(v130[0]));
      (*(void (**)(_QWORD, time_t *, char *, _QWORD, _QWORD))(**((_QWORD **)this + 4) + 72))(*((_QWORD *)this + 4), v130, (char *)this + 212, v50, 0);
      v36 = v49;
      v40 = v48;
      v35 = v47;
      v34 = v121;
    }
LABEL_72:
    v51 = (_QWORD *)(v34 + v35);
    v52 = HIWORD(v130[0]);
    *((_WORD *)this + 171) = HIWORD(v130[0]);
    *((_WORD *)this + 170) = v52 + 1;
    if (LODWORD(v130[0]) != 87)
      goto LABEL_84;
    v54 = *((_QWORD *)this + 23);
    v53 = *((_QWORD *)this + 24);
    v55 = (unint64_t)v51 < v53 + v54 && (unint64_t)v51 >= v54;
    if (!v55 || v40 && ((unint64_t)v40 < v54 || (unint64_t)v40 >= v53 + v54) || v36 >= v53 || v123 >= v53)
      break;
    v56 = v51;
    v57 = v36;
    (*(void (**)(_QWORD, time_t *))(**((_QWORD **)this + 4) + 64))(*((_QWORD *)this + 4), v130);
    ++v124;
    v36 = v57;
    v51 = v56;
LABEL_84:
    if (LODWORD(v130[0]) != 67)
      goto LABEL_102;
    v58 = v51;
    v120 = v36;
    v122 = v40;
    v59 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v60 = v59;
LABEL_90:
        _os_log_impl(&dword_1DB697000, v60, OS_LOG_TYPE_DEFAULT, "Received Capture Event\n", buf, 2u);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v60 = MEMORY[0x1E0C81028];
      goto LABEL_90;
    }
    if (glog_fd)
    {
      *(_QWORD *)&v61 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v61 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v137 = v61;
      v138 = v61;
      v135 = v61;
      v136 = v61;
      *(_OWORD *)&buf[32] = v61;
      *(_OWORD *)&buf[48] = v61;
      *(_OWORD *)&buf[16] = v61;
      *(_OWORD *)buf = v61;
      memset(&v133, 0, sizeof(v133));
      v129 = 0xAAAAAAAAAAAAAAAALL;
      time(&v129);
      localtime_r(&v129, &v133);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v133);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "Received Capture Event\n");
    }
    if (*((_QWORD *)this + 10))
    {
      *(_DWORD *)buf = 0;
      if (!IORegistryEntryGetParentEntry(*((_DWORD *)this + 4), "IOService", (io_registry_entry_t *)buf))
      {
        v62 = operator new();
        *(_DWORD *)(v62 + 512) = *(_DWORD *)buf;
        *(_OWORD *)(v62 + 520) = 0u;
        Length = CFStringGetLength(*((CFStringRef *)this + 11));
        if (Length)
        {
          v64 = CFStringGetLength(*((CFStringRef *)this + 11));
          v65 = (char *)malloc_type_malloc(v64 + 1, 0x279CDF1BuLL);
          v66 = (const __CFString *)*((_QWORD *)this + 11);
          v67 = CFStringGetLength(v66);
          CFStringGetCString(v66, v65, v67 + 1, 0);
          Length = (CFIndex)v65;
        }
        v68 = (void *)Length;
        fillCaptureDescriptionStringFromMetaData(Length, (char *)v62, v58, v120, v122, v123);
        if (!CCIOReportDumpQueue::enqueue(*((_QWORD *)this + 10), v62))
        {
          IOObjectRelease(*(io_object_t *)buf);
          MEMORY[0x1DF0B22E4](v62, 0x1020C404FABDE88);
        }
        if (v68)
          free(v68);
      }
    }
    strcpy(buf, "CAPTURE");
    v69 = (_QWORD *)((char *)this + 32);
    (*(void (**)(_QWORD, time_t *, _BYTE *, uint64_t, uint64_t))(**((_QWORD **)this + 4) + 72))(*((_QWORD *)this + 4), v130, buf, 7, 1);
    (*(void (**)(_QWORD, time_t *, _QWORD *, size_t, const void *, size_t))(*(_QWORD *)*v69 + 80))(*v69, v130, v58, v120, v122, v123);
    (*(void (**)(_QWORD, time_t *, _BYTE *, uint64_t, uint64_t))(*(_QWORD *)*v69 + 72))(*v69, v130, buf, 7, 1);
    ++v125;
LABEL_102:
    if (LODWORD(v130[0]) != 83)
      goto LABEL_112;
    v70 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v71 = v70;
LABEL_108:
        _os_log_impl(&dword_1DB697000, v71, OS_LOG_TYPE_DEFAULT, "Received Skip Event\n", buf, 2u);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v71 = MEMORY[0x1E0C81028];
      goto LABEL_108;
    }
    if (glog_fd)
    {
      *(_QWORD *)&v72 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v72 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v137 = v72;
      v138 = v72;
      v135 = v72;
      v136 = v72;
      *(_OWORD *)&buf[32] = v72;
      *(_OWORD *)&buf[48] = v72;
      *(_OWORD *)&buf[16] = v72;
      *(_OWORD *)buf = v72;
      memset(&v133, 0, sizeof(v133));
      v129 = 0xAAAAAAAAAAAAAAAALL;
      time(&v129);
      localtime_r(&v129, &v133);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v133);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "Received Skip Event\n");
    }
    ++v126;
LABEL_112:
    v16 = (unint64_t)(v128 + WORD4(v131) + BYTE10(v131) + 36) % *((_QWORD *)this + 24);
    if ((v16 & 3) != 0)
    {
      v100 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
          goto LABEL_178;
        v101 = *((_DWORD *)this + 4);
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v101;
        v102 = v100;
      }
      else
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_178;
        v118 = *((_DWORD *)this + 4);
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v118;
        v102 = MEMORY[0x1E0C81028];
      }
      _os_log_error_impl(&dword_1DB697000, v102, OS_LOG_TYPE_ERROR, "Created a bad offset, don't save it! entry:%u", buf, 8u);
LABEL_178:
      if (glog_fd)
      {
        *(_QWORD *)&v113 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v113 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v137 = v113;
        v138 = v113;
        v135 = v113;
        v136 = v113;
        *(_OWORD *)&buf[32] = v113;
        *(_OWORD *)&buf[48] = v113;
        *(_OWORD *)&buf[16] = v113;
        *(_OWORD *)buf = v113;
        memset(&v133, 0, sizeof(v133));
        v129 = 0xAAAAAAAAAAAAAAAALL;
        time(&v129);
        localtime_r(&v129, &v133);
        strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v133);
        dprintf(glog_fd, "%s ", buf);
        dprintf(glog_fd, "Created a bad offset, don't save it! entry:%u", *((_DWORD *)this + 4));
      }
      goto LABEL_4;
    }
LABEL_21:
    while (1)
    {
      v17 = __ldxr(v2);
      if (v17 != v128)
        break;
      if (!__stxr(v16, v2))
      {
        v3 = v2[1];
        goto LABEL_57;
      }
    }
    __clrex();
    v18 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v19 = v18;
LABEL_60:
        _os_log_error_impl(&dword_1DB697000, v19, OS_LOG_TYPE_ERROR, "Couldn't update read ptr.\n", buf, 2u);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v19 = MEMORY[0x1E0C81028];
      goto LABEL_60;
    }
    if (glog_fd)
    {
      *(_QWORD *)&v28 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v28 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v137 = v28;
      v138 = v28;
      v135 = v28;
      v136 = v28;
      *(_OWORD *)&buf[32] = v28;
      *(_OWORD *)&buf[48] = v28;
      *(_OWORD *)&buf[16] = v28;
      *(_OWORD *)buf = v28;
      memset(&v133, 0, sizeof(v133));
      v129 = 0xAAAAAAAAAAAAAAAALL;
      time(&v129);
      localtime_r(&v129, &v133);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v133);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "Couldn't update read ptr.\n");
    }
    v29 = snprintf((char *)this + 212, 0x80uLL, "Couldn't update read ptr. Cannot guarantee integrity of message %d\n", HIWORD(v130[0]));
    (*(void (**)(_QWORD, time_t *, char *, _QWORD, _QWORD))(**((_QWORD **)this + 4) + 72))(*((_QWORD *)this + 4), v130, (char *)this + 212, v29, 0);
LABEL_57:
    if (v3 == *v2)
      goto LABEL_4;
  }
  v92 = v36;
  v93 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
    {
      v94 = *((_QWORD *)this + 25);
      v95 = *((_DWORD *)this + 4);
      *(_DWORD *)buf = 134219264;
      *(_QWORD *)&buf[4] = v94;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v54;
      *(_WORD *)&buf[22] = 2048;
      *(_QWORD *)&buf[24] = v53;
      *(_WORD *)&buf[32] = 2048;
      *(_QWORD *)&buf[34] = v92;
      *(_WORD *)&buf[42] = 2048;
      *(_QWORD *)&buf[44] = v123;
      *(_WORD *)&buf[52] = 1024;
      *(_DWORD *)&buf[54] = v95;
      v96 = v93;
      goto LABEL_187;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v116 = *((_QWORD *)this + 25);
    v117 = *((_DWORD *)this + 4);
    *(_DWORD *)buf = 134219264;
    *(_QWORD *)&buf[4] = v116;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v54;
    *(_WORD *)&buf[22] = 2048;
    *(_QWORD *)&buf[24] = v53;
    *(_WORD *)&buf[32] = 2048;
    *(_QWORD *)&buf[34] = v92;
    *(_WORD *)&buf[42] = 2048;
    *(_QWORD *)&buf[44] = v123;
    *(_WORD *)&buf[52] = 1024;
    *(_DWORD *)&buf[54] = v117;
    v96 = MEMORY[0x1E0C81028];
LABEL_187:
    _os_log_error_impl(&dword_1DB697000, v96, OS_LOG_TYPE_ERROR, "Unexpected log parameters ring state3(0x%llx), ring buffer(0x%llx), ring size(%llu), logSize(%lu), logContinueSize(%lu) entry:%u\n", buf, 0x3Au);
  }
  if (glog_fd)
  {
    *(_QWORD *)&v105 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v105 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v137 = v105;
    v138 = v105;
    v135 = v105;
    v136 = v105;
    *(_OWORD *)&buf[32] = v105;
    *(_OWORD *)&buf[48] = v105;
    *(_OWORD *)&buf[16] = v105;
    *(_OWORD *)buf = v105;
    memset(&v133, 0, sizeof(v133));
    v129 = 0xAAAAAAAAAAAAAAAALL;
    time(&v129);
    localtime_r(&v129, &v133);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v133);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "Unexpected log parameters ring state3(0x%llx), ring buffer(0x%llx), ring size(%llu), logSize(%lu), logContinueSize(%lu) entry:%u\n", *((_QWORD *)this + 25), *((_QWORD *)this + 23), *((_QWORD *)this + 24), v92, v123, *((_DWORD *)this + 4));
  }
LABEL_4:
  v5 = 0;
LABEL_5:
  if (*((_BYTE *)this + 96))
    *((_WORD *)this + 48) = 256;
  v2[2] = 0;
  v6 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *v2;
      v8 = *((_DWORD *)this + 4);
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&buf[4] = v7;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v8;
      v9 = v6;
      goto LABEL_118;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v74 = *v2;
    v75 = *((_DWORD *)this + 4);
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&buf[4] = v74;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = v75;
    v9 = MEMORY[0x1E0C81028];
LABEL_118:
    _os_log_impl(&dword_1DB697000, v9, OS_LOG_TYPE_DEFAULT, "CCLogTap::pipeEvent EXIT readOffset : %d entry:%u\n", buf, 0xEu);
  }
  if (glog_fd)
  {
    *(_QWORD *)&v76 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v76 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v137 = v76;
    v138 = v76;
    v135 = v76;
    v136 = v76;
    *(_OWORD *)&buf[32] = v76;
    *(_OWORD *)&buf[48] = v76;
    *(_OWORD *)&buf[16] = v76;
    *(_OWORD *)buf = v76;
    memset(&v133, 0, sizeof(v133));
    v130[0] = 0xAAAAAAAAAAAAAAAALL;
    time(v130);
    localtime_r(v130, &v133);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v133);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "CCLogTap::pipeEvent EXIT readOffset : %d entry:%u\n", *v2, *((_DWORD *)this + 4));
  }
  v77 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67110400;
      *(_DWORD *)&buf[4] = v127;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v5;
      *(_WORD *)&buf[14] = 1024;
      *(_DWORD *)&buf[16] = v124;
      *(_WORD *)&buf[20] = 1024;
      *(_DWORD *)&buf[22] = v4;
      *(_WORD *)&buf[26] = 1024;
      *(_DWORD *)&buf[28] = v125;
      *(_WORD *)&buf[32] = 1024;
      *(_DWORD *)&buf[34] = v126;
      v78 = v77;
      goto LABEL_126;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67110400;
    *(_DWORD *)&buf[4] = v127;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = v5;
    *(_WORD *)&buf[14] = 1024;
    *(_DWORD *)&buf[16] = v124;
    *(_WORD *)&buf[20] = 1024;
    *(_DWORD *)&buf[22] = v4;
    *(_WORD *)&buf[26] = 1024;
    *(_DWORD *)&buf[28] = v125;
    *(_WORD *)&buf[32] = 1024;
    *(_DWORD *)&buf[34] = v126;
    v78 = MEMORY[0x1E0C81028];
LABEL_126:
    _os_log_impl(&dword_1DB697000, v78, OS_LOG_TYPE_DEFAULT, "CCLogTap::pipeEvent Event Count - Empty (%d) Reserved (%d) Written (%d) Padding (%d) Capture (%d) Skip (%d)\n", buf, 0x26u);
  }
  if (glog_fd)
  {
    *(_QWORD *)&v79 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v79 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v137 = v79;
    v138 = v79;
    v135 = v79;
    v136 = v79;
    *(_OWORD *)&buf[32] = v79;
    *(_OWORD *)&buf[48] = v79;
    *(_OWORD *)&buf[16] = v79;
    *(_OWORD *)buf = v79;
    memset(&v133, 0, sizeof(v133));
    v130[0] = 0xAAAAAAAAAAAAAAAALL;
    time(v130);
    localtime_r(v130, &v133);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v133);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "CCLogTap::pipeEvent Event Count - Empty (%d) Reserved (%d) Written (%d) Padding (%d) Capture (%d) Skip (%d)\n", v127, v5, v124, v4, v125, v126);
  }
  return 0;
}

void fillCaptureDescriptionStringFromMetaData(uint64_t a1, char *a2, _QWORD *a3, size_t a4, const void *a5, size_t a6)
{
  char *v12;
  tm v13;
  time_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a5)
  {
    v12 = (char *)malloc_type_malloc(a6 + a4, 0x199AA8B2uLL);
    memcpy(v12, a3, a4);
    memcpy(&v12[a4], a5, a6);
    a3 = v12;
  }
  else
  {
    v12 = 0;
  }
  v14 = *a3;
  memset(&v13, 0, sizeof(v13));
  localtime_r(&v14, &v13);
  if (a1)
    snprintf(a2, 0x200uLL, "%s/[%04d-%02d-%02d_%02d,%02d,%02d.%06llu]=%s", a1, (v13.tm_year + 1900), (v13.tm_mon + 1));
  else
    snprintf(a2, 0x200uLL, "[%04d-%02d-%02d_%02d,%02d,%02d.%06llu]=%s", (v13.tm_year + 1900), (v13.tm_mon + 1), v13.tm_mday);
  if (v12)
    free(v12);
}

uint64_t _logTapInterestCallback_kext(uint64_t result, int a2, void **a3)
{
  if (!shutDownPending)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 144))(result);
  return result;
}

uint64_t _logTapInterestCallback_dext(uint64_t result, int a2, void **a3)
{
  if (!shutDownPending)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 144))(result);
  return result;
}

char *CCLogTap::withRegistryEntry(CCLogTap *this)
{
  char *v2;
  uint64_t v3;
  NSObject *v4;
  __int128 v5;
  time_t v7;
  tm v8;
  uint8_t buf[16];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (char *)malloc_type_malloc(0x168uLL, 0xEE9A6C17uLL);
  *(_OWORD *)(v2 + 24) = 0u;
  *(_OWORD *)(v2 + 40) = 0u;
  *(_OWORD *)(v2 + 56) = 0u;
  *(_OWORD *)(v2 + 72) = 0u;
  *(_OWORD *)(v2 + 88) = 0u;
  *(_OWORD *)(v2 + 104) = 0u;
  *(_OWORD *)(v2 + 120) = 0u;
  *(_OWORD *)(v2 + 136) = 0u;
  *(_OWORD *)(v2 + 152) = 0u;
  *(_OWORD *)(v2 + 168) = 0u;
  *(_OWORD *)(v2 + 184) = 0u;
  *(_OWORD *)(v2 + 200) = 0u;
  *(_OWORD *)(v2 + 216) = 0u;
  *(_OWORD *)(v2 + 232) = 0u;
  *(_OWORD *)(v2 + 8) = 0u;
  *(_OWORD *)(v2 + 248) = 0u;
  *(_OWORD *)(v2 + 264) = 0u;
  *(_OWORD *)(v2 + 280) = 0u;
  *(_OWORD *)(v2 + 296) = 0u;
  *(_OWORD *)(v2 + 312) = 0u;
  *(_OWORD *)(v2 + 328) = 0u;
  *(_OWORD *)(v2 + 344) = 0u;
  *((_DWORD *)v2 + 2) = 1;
  *(_QWORD *)v2 = off_1EA31F9F0;
  if (CCLogTap::initWithRegistryEntry((CFAbsoluteTime *)v2, this))
    return v2;
  v3 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v4 = v3;
LABEL_11:
      _os_log_error_impl(&dword_1DB697000, v4, OS_LOG_TYPE_ERROR, "CCLogTap::withRegistryEntry failed\n", buf, 2u);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v4 = MEMORY[0x1E0C81028];
    goto LABEL_11;
  }
  if (glog_fd)
  {
    *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v15 = v5;
    v16 = v5;
    v13 = v5;
    v14 = v5;
    v11 = v5;
    v12 = v5;
    *(_OWORD *)buf = v5;
    v10 = v5;
    memset(&v8, 0, sizeof(v8));
    v7 = 0xAAAAAAAAAAAAAAAALL;
    time(&v7);
    localtime_r(&v7, &v8);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v8);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCLogTap::withRegistryEntry failed\n");
  }
  (*(void (**)(char *))(*(_QWORD *)v2 + 48))(v2);
  return 0;
}

uint64_t CCLogTap::freeResources(uint64_t this)
{
  *(_BYTE *)(this + 56) = 1;
  return this;
}

mach_port_t *CCLogTap::updateLogFlags(uint64_t a1, const void *a2)
{
  uint64_t v4;
  NSObject *v5;
  __int128 v6;
  mach_port_t *result;
  time_t v8;
  tm v9;
  uint8_t buf[16];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v5 = v4;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v5 = MEMORY[0x1E0C81028];
  }
  _os_log_impl(&dword_1DB697000, v5, OS_LOG_TYPE_DEFAULT, "CCLogTap::updateLogFlags\n", buf, 2u);
LABEL_7:
  if (glog_fd)
  {
    *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v16 = v6;
    v17 = v6;
    v14 = v6;
    v15 = v6;
    v12 = v6;
    v13 = v6;
    *(_OWORD *)buf = v6;
    v11 = v6;
    memset(&v9, 0, sizeof(v9));
    v8 = 0xAAAAAAAAAAAAAAAALL;
    time(&v8);
    localtime_r(&v8, &v9);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v9);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCLogTap::updateLogFlags\n");
  }
  result = *(mach_port_t **)(a1 + 64);
  if (result)
  {
    if (result)
      return (mach_port_t *)IOConnectCallMethod(result[22], 0xDu, 0, 0, a2, 0x204uLL, 0, 0, 0, 0);
  }
  return result;
}

mach_port_t *CCLogTap::updateConsoleLogFlags(uint64_t a1, const void *a2)
{
  uint64_t v4;
  const char *CStringPtr;
  const char *v6;
  int v7;
  NSObject *v8;
  const char *v9;
  const char *v10;
  int v11;
  __int128 v12;
  int v13;
  const char *v14;
  const char *v15;
  mach_port_t *result;
  time_t v17;
  tm v18;
  _BYTE buf[32];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    CStringPtr = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 40), 0);
    v6 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 48), 0);
    v7 = *(_DWORD *)(a1 + 16);
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = CStringPtr;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = v7;
    v8 = v4;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    v9 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 40), 0);
    v10 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 48), 0);
    v11 = *(_DWORD *)(a1 + 16);
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = v10;
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = v11;
    v8 = MEMORY[0x1E0C81028];
  }
  _os_log_impl(&dword_1DB697000, v8, OS_LOG_TYPE_DEFAULT, "CCLogTap::updateConsoleLogFlags Owner:%s Name:%s entry:%u\n", buf, 0x1Cu);
LABEL_7:
  if (glog_fd)
  {
    *(_QWORD *)&v12 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v24 = v12;
    v25 = v12;
    v22 = v12;
    v23 = v12;
    v20 = v12;
    v21 = v12;
    *(_OWORD *)buf = v12;
    *(_OWORD *)&buf[16] = v12;
    memset(&v18, 0, sizeof(v18));
    v17 = 0xAAAAAAAAAAAAAAAALL;
    time(&v17);
    localtime_r(&v17, &v18);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v18);
    dprintf(glog_fd, "%s ", buf);
    v13 = glog_fd;
    v14 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 40), 0);
    v15 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 48), 0);
    dprintf(v13, "CCLogTap::updateConsoleLogFlags Owner:%s Name:%s entry:%u\n", v14, v15, *(_DWORD *)(a1 + 16));
  }
  result = *(mach_port_t **)(a1 + 64);
  if (result)
  {
    if (result)
      return (mach_port_t *)IOConnectCallMethod(result[22], 0xEu, 0, 0, a2, 0x204uLL, 0, 0, 0, 0);
  }
  return result;
}

mach_port_t *CCLogTap::setLogFlags(uint64_t a1, const void *a2)
{
  uint64_t v4;
  const char *CStringPtr;
  const char *v6;
  int v7;
  NSObject *v8;
  const char *v9;
  const char *v10;
  int v11;
  __int128 v12;
  int v13;
  const char *v14;
  const char *v15;
  mach_port_t *result;
  time_t v17;
  tm v18;
  _BYTE buf[32];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    CStringPtr = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 40), 0);
    v6 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 48), 0);
    v7 = *(_DWORD *)(a1 + 16);
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = CStringPtr;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = v7;
    v8 = v4;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    v9 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 40), 0);
    v10 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 48), 0);
    v11 = *(_DWORD *)(a1 + 16);
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = v10;
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = v11;
    v8 = MEMORY[0x1E0C81028];
  }
  _os_log_impl(&dword_1DB697000, v8, OS_LOG_TYPE_DEFAULT, "CCLogTap::setLogFlags Owner:%s Name:%s entry:%u\n", buf, 0x1Cu);
LABEL_7:
  if (glog_fd)
  {
    *(_QWORD *)&v12 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v24 = v12;
    v25 = v12;
    v22 = v12;
    v23 = v12;
    v20 = v12;
    v21 = v12;
    *(_OWORD *)buf = v12;
    *(_OWORD *)&buf[16] = v12;
    memset(&v18, 0, sizeof(v18));
    v17 = 0xAAAAAAAAAAAAAAAALL;
    time(&v17);
    localtime_r(&v17, &v18);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v18);
    dprintf(glog_fd, "%s ", buf);
    v13 = glog_fd;
    v14 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 40), 0);
    v15 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 48), 0);
    dprintf(v13, "CCLogTap::setLogFlags Owner:%s Name:%s entry:%u\n", v14, v15, *(_DWORD *)(a1 + 16));
  }
  result = *(mach_port_t **)(a1 + 64);
  if (result)
  {
    if (result)
      return (mach_port_t *)IOConnectCallMethod(result[22], 4u, 0, 0, a2, 0x108uLL, 0, 0, 0, 0);
  }
  return result;
}

mach_port_t *CCLogTap::setLogLevel(uint64_t a1, const void *a2)
{
  uint64_t v4;
  const char *CStringPtr;
  const char *v6;
  int v7;
  NSObject *v8;
  const char *v9;
  const char *v10;
  int v11;
  __int128 v12;
  int v13;
  const char *v14;
  const char *v15;
  mach_port_t *result;
  time_t v17;
  tm v18;
  _BYTE buf[32];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    CStringPtr = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 40), 0);
    v6 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 48), 0);
    v7 = *(_DWORD *)(a1 + 16);
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = CStringPtr;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = v7;
    v8 = v4;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    v9 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 40), 0);
    v10 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 48), 0);
    v11 = *(_DWORD *)(a1 + 16);
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = v10;
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = v11;
    v8 = MEMORY[0x1E0C81028];
  }
  _os_log_impl(&dword_1DB697000, v8, OS_LOG_TYPE_DEFAULT, "CCLogTap::setLogLevel Owner:%s Name:%s entry:%u\n", buf, 0x1Cu);
LABEL_7:
  if (glog_fd)
  {
    *(_QWORD *)&v12 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v24 = v12;
    v25 = v12;
    v22 = v12;
    v23 = v12;
    v20 = v12;
    v21 = v12;
    *(_OWORD *)buf = v12;
    *(_OWORD *)&buf[16] = v12;
    memset(&v18, 0, sizeof(v18));
    v17 = 0xAAAAAAAAAAAAAAAALL;
    time(&v17);
    localtime_r(&v17, &v18);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v18);
    dprintf(glog_fd, "%s ", buf);
    v13 = glog_fd;
    v14 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 40), 0);
    v15 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 48), 0);
    dprintf(v13, "CCLogTap::setLogLevel Owner:%s Name:%s entry:%u\n", v14, v15, *(_DWORD *)(a1 + 16));
  }
  result = *(mach_port_t **)(a1 + 64);
  if (result)
  {
    if (result)
      return (mach_port_t *)IOConnectCallMethod(result[22], 5u, 0, 0, a2, 0x104uLL, 0, 0, 0, 0);
  }
  return result;
}

mach_port_t *CCLogTap::setConsoleLogFlags(uint64_t a1, const void *a2)
{
  uint64_t v4;
  const char *CStringPtr;
  const char *v6;
  int v7;
  NSObject *v8;
  const char *v9;
  const char *v10;
  int v11;
  __int128 v12;
  int v13;
  const char *v14;
  const char *v15;
  mach_port_t *result;
  time_t v17;
  tm v18;
  _BYTE buf[32];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    CStringPtr = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 40), 0);
    v6 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 48), 0);
    v7 = *(_DWORD *)(a1 + 16);
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = CStringPtr;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = v7;
    v8 = v4;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    v9 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 40), 0);
    v10 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 48), 0);
    v11 = *(_DWORD *)(a1 + 16);
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = v10;
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = v11;
    v8 = MEMORY[0x1E0C81028];
  }
  _os_log_impl(&dword_1DB697000, v8, OS_LOG_TYPE_DEFAULT, "CCLogTap::setConsoleLogFlags Owner:%s Name:%s entry:%u\n", buf, 0x1Cu);
LABEL_7:
  if (glog_fd)
  {
    *(_QWORD *)&v12 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v24 = v12;
    v25 = v12;
    v22 = v12;
    v23 = v12;
    v20 = v12;
    v21 = v12;
    *(_OWORD *)buf = v12;
    *(_OWORD *)&buf[16] = v12;
    memset(&v18, 0, sizeof(v18));
    v17 = 0xAAAAAAAAAAAAAAAALL;
    time(&v17);
    localtime_r(&v17, &v18);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v18);
    dprintf(glog_fd, "%s ", buf);
    v13 = glog_fd;
    v14 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 40), 0);
    v15 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 48), 0);
    dprintf(v13, "CCLogTap::setConsoleLogFlags Owner:%s Name:%s entry:%u\n", v14, v15, *(_DWORD *)(a1 + 16));
  }
  result = *(mach_port_t **)(a1 + 64);
  if (result)
  {
    if (result)
      return (mach_port_t *)IOConnectCallMethod(result[22], 6u, 0, 0, a2, 0x108uLL, 0, 0, 0, 0);
  }
  return result;
}

mach_port_t *CCLogTap::setConsoleLogLevel(uint64_t a1, const void *a2)
{
  uint64_t v4;
  const char *CStringPtr;
  const char *v6;
  int v7;
  NSObject *v8;
  const char *v9;
  const char *v10;
  int v11;
  __int128 v12;
  int v13;
  const char *v14;
  const char *v15;
  mach_port_t *result;
  time_t v17;
  tm v18;
  _BYTE buf[32];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    CStringPtr = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 40), 0);
    v6 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 48), 0);
    v7 = *(_DWORD *)(a1 + 16);
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = CStringPtr;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = v7;
    v8 = v4;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    v9 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 40), 0);
    v10 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 48), 0);
    v11 = *(_DWORD *)(a1 + 16);
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = v10;
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = v11;
    v8 = MEMORY[0x1E0C81028];
  }
  _os_log_impl(&dword_1DB697000, v8, OS_LOG_TYPE_DEFAULT, "CCLogTap::setConsoleLogLevel Owner:%s Name:%s entry:%u\n", buf, 0x1Cu);
LABEL_7:
  if (glog_fd)
  {
    *(_QWORD *)&v12 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v24 = v12;
    v25 = v12;
    v22 = v12;
    v23 = v12;
    v20 = v12;
    v21 = v12;
    *(_OWORD *)buf = v12;
    *(_OWORD *)&buf[16] = v12;
    memset(&v18, 0, sizeof(v18));
    v17 = 0xAAAAAAAAAAAAAAAALL;
    time(&v17);
    localtime_r(&v17, &v18);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v18);
    dprintf(glog_fd, "%s ", buf);
    v13 = glog_fd;
    v14 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 40), 0);
    v15 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 48), 0);
    dprintf(v13, "CCLogTap::setConsoleLogLevel Owner:%s Name:%s entry:%u\n", v14, v15, *(_DWORD *)(a1 + 16));
  }
  result = *(mach_port_t **)(a1 + 64);
  if (result)
  {
    if (result)
      return (mach_port_t *)IOConnectCallMethod(result[22], 7u, 0, 0, a2, 0x104uLL, 0, 0, 0, 0);
  }
  return result;
}

mach_port_t *CCLogTap::setNotifyTimeout(uint64_t a1, const void *a2)
{
  uint64_t v4;
  NSObject *v5;
  __int128 v6;
  mach_port_t *result;
  time_t v8;
  tm v9;
  uint8_t buf[16];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v5 = v4;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v5 = MEMORY[0x1E0C81028];
  }
  _os_log_impl(&dword_1DB697000, v5, OS_LOG_TYPE_DEFAULT, "CCLogTap::setNotifyTimeout\n", buf, 2u);
LABEL_7:
  if (glog_fd)
  {
    *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v16 = v6;
    v17 = v6;
    v14 = v6;
    v15 = v6;
    v12 = v6;
    v13 = v6;
    *(_OWORD *)buf = v6;
    v11 = v6;
    memset(&v9, 0, sizeof(v9));
    v8 = 0xAAAAAAAAAAAAAAAALL;
    time(&v8);
    localtime_r(&v8, &v9);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v9);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCLogTap::setNotifyTimeout\n");
  }
  result = *(mach_port_t **)(a1 + 64);
  if (result)
  {
    if (result)
      return (mach_port_t *)IOConnectCallMethod(result[22], 9u, 0, 0, a2, 4uLL, 0, 0, 0, 0);
  }
  return result;
}

mach_port_t *CCLogTap::setWatermarkLevel(uint64_t a1, const void *a2)
{
  uint64_t v4;
  NSObject *v5;
  __int128 v6;
  mach_port_t *result;
  time_t v8;
  tm v9;
  uint8_t buf[16];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v5 = v4;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v5 = MEMORY[0x1E0C81028];
  }
  _os_log_impl(&dword_1DB697000, v5, OS_LOG_TYPE_DEFAULT, "CCLogTap::setWatermarkLevel\n", buf, 2u);
LABEL_7:
  if (glog_fd)
  {
    *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v16 = v6;
    v17 = v6;
    v14 = v6;
    v15 = v6;
    v12 = v6;
    v13 = v6;
    *(_OWORD *)buf = v6;
    v11 = v6;
    memset(&v9, 0, sizeof(v9));
    v8 = 0xAAAAAAAAAAAAAAAALL;
    time(&v8);
    localtime_r(&v8, &v9);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v9);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCLogTap::setWatermarkLevel\n");
  }
  result = *(mach_port_t **)(a1 + 64);
  if (result)
  {
    if (result)
      return (mach_port_t *)IOConnectCallMethod(result[22], 0xAu, 0, 0, a2, 4uLL, 0, 0, 0, 0);
  }
  return result;
}

uint64_t CCLogTap::setPolicy(uint64_t a1, const void *a2)
{
  uint64_t v4;
  const char *CStringPtr;
  const char *v6;
  int v7;
  NSObject *v8;
  const char *v9;
  const char *v10;
  int v11;
  __int128 v12;
  int v13;
  const char *v14;
  const char *v15;
  _DWORD *v16;
  time_t v18;
  tm v19;
  _BYTE buf[32];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    CStringPtr = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 40), 0);
    v6 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 48), 0);
    v7 = *(_DWORD *)(a1 + 16);
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = CStringPtr;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = v7;
    v8 = v4;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    v9 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 40), 0);
    v10 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 48), 0);
    v11 = *(_DWORD *)(a1 + 16);
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = v10;
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&buf[24] = v11;
    v8 = MEMORY[0x1E0C81028];
  }
  _os_log_impl(&dword_1DB697000, v8, OS_LOG_TYPE_DEFAULT, "CCLogTap::setPolicy, Owner:%s Name:%s entry:%u\n", buf, 0x1Cu);
LABEL_7:
  if (glog_fd)
  {
    *(_QWORD *)&v12 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v25 = v12;
    v26 = v12;
    v23 = v12;
    v24 = v12;
    v21 = v12;
    v22 = v12;
    *(_OWORD *)buf = v12;
    *(_OWORD *)&buf[16] = v12;
    memset(&v19, 0, sizeof(v19));
    v18 = 0xAAAAAAAAAAAAAAAALL;
    time(&v18);
    localtime_r(&v18, &v19);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v19);
    dprintf(glog_fd, "%s ", buf);
    v13 = glog_fd;
    v14 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 40), 0);
    v15 = CFStringGetCStringPtr(*(CFStringRef *)(a1 + 48), 0);
    dprintf(v13, "CCLogTap::setPolicy, Owner:%s Name:%s entry:%u\n", v14, v15, *(_DWORD *)(a1 + 16));
  }
  return IOConnectCallMethod(v16[22], 0xBu, 0, 0, a2, 4uLL, 0, 0, 0, 0);
}

uint64_t CCLogTap::configureLogOptions(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  NSObject *v5;
  __int128 v6;
  uint64_t result;
  time_t v8;
  tm v9;
  uint8_t buf[16];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v5 = v4;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v5 = MEMORY[0x1E0C81028];
  }
  _os_log_impl(&dword_1DB697000, v5, OS_LOG_TYPE_DEFAULT, "CCLogTap::configureLogOptions\n", buf, 2u);
LABEL_7:
  if (glog_fd)
  {
    *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v16 = v6;
    v17 = v6;
    v14 = v6;
    v15 = v6;
    v12 = v6;
    v13 = v6;
    *(_OWORD *)buf = v6;
    v11 = v6;
    memset(&v9, 0, sizeof(v9));
    v8 = 0xAAAAAAAAAAAAAAAALL;
    time(&v8);
    localtime_r(&v8, &v9);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v9);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCLogTap::configureLogOptions\n");
  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)result + 104))(result, a2);
  return result;
}

void CCObject::~CCObject(void *this)
{
  if (this)
    free(this);
}

uint64_t CCObject::init(CCObject *this)
{
  return 1;
}

uint64_t CCObject::ccfree(uint64_t this)
{
  if (this)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)this + 8))(this);
  return this;
}

uint64_t CCObject::getRetainCount(CCObject *this)
{
  return *((unsigned __int16 *)this + 4);
}

void CCObject::CCObject(CCObject *this)
{
  *(_QWORD *)this = off_1EA31FAB0;
  *((_DWORD *)this + 2) = 1;
}

{
  *(_QWORD *)this = off_1EA31FAB0;
  *((_DWORD *)this + 2) = 1;
}

void CCObject::operator delete(void *a1)
{
  if (a1)
    free(a1);
}

void CCObject::operator new(CCObject *this)
{
  void *v2;

  v2 = malloc_type_malloc((size_t)this, 0xEE9A6C17uLL);
  bzero(v2, (size_t)this);
}

uint64_t CCPipeInterface::waitForEvent(CCPipeInterface *this, void (*a2)(void *, int, void **, unsigned int), void *a3)
{
  __int128 v6;
  const __CFAllocator *v7;
  const __CFNumber *CFProperty;
  const __CFString *v9;
  const __CFString *v10;
  CFIndex Length;
  char *v12;
  CFIndex v13;
  uint64_t v14;
  NSObject *v15;
  __int128 v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  int v20;
  NSObject *v21;
  IONotificationPort *v22;
  mach_port_t v23;
  mach_port_t MachPort;
  uint64_t v25;
  uint64_t v26;
  int v27;
  int v28;
  NSObject *v29;
  uint64_t v30;
  NSObject *v31;
  int v32;
  __int128 v33;
  __int128 v34;
  int v35;
  int v36;
  __int128 v37;
  uint64_t v38;
  int v39;
  NSObject *v40;
  int v41;
  __int128 v42;
  _QWORD handler[7];
  time_t v45;
  tm v46;
  int valuePtr;
  _BYTE buf[32];
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  char __dst[24];
  uint64_t v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint64_t reference[2];
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v73 = v6;
  v74 = v6;
  *(_OWORD *)reference = v6;
  v72 = v6;
  v67 = xmmword_1DB6CDC16;
  v68 = unk_1DB6CDC26;
  v69 = xmmword_1DB6CDC36;
  v70 = unk_1DB6CDC46;
  v63 = xmmword_1DB6CDBD6;
  v64 = unk_1DB6CDBE6;
  v65 = xmmword_1DB6CDBF6;
  v66 = unk_1DB6CDC06;
  v59 = xmmword_1DB6CDB96;
  v60 = unk_1DB6CDBA6;
  v61 = xmmword_1DB6CDBB6;
  v62 = unk_1DB6CDBC6;
  strcpy(__dst, "com.apple.corecaptured_");
  v56 = unk_1DB6CDB6E;
  v57 = xmmword_1DB6CDB76;
  v58 = unk_1DB6CDB86;
  v7 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(*((_DWORD *)this + 21), CFSTR("LogPolicy"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  valuePtr = -1431655766;
  CFNumberGetValue(CFProperty, kCFNumberSInt32Type, &valuePtr);
  if (CFProperty)
    CFRelease(CFProperty);
  if (valuePtr == 1)
  {
    v9 = (const __CFString *)IORegistryEntryCreateCFProperty(*((_DWORD *)this + 21), CFSTR("Name"), v7, 0);
    if (v9)
    {
      v10 = v9;
      Length = CFStringGetLength(v9);
      v12 = (char *)malloc_type_malloc(Length + 1, 0x5EB8DA85uLL);
      if (v12)
      {
        v13 = CFStringGetLength(v10);
        if (CFStringGetCString(v10, v12, v13 + 1, 0))
        {
          strlcat(__dst, v12, 0x100uLL);
          *((_QWORD *)this + 17) = dispatch_queue_create(__dst, 0);
        }
      }
      CFRelease(v10);
      free(v12);
      if (!*((_QWORD *)this + 17))
      {
        v14 = coreCaptureOsLog;
        if (coreCaptureOsLog)
        {
          if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
            goto LABEL_13;
          *(_WORD *)buf = 0;
          v15 = v14;
        }
        else
        {
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            goto LABEL_13;
          *(_WORD *)buf = 0;
          v15 = MEMORY[0x1E0C81028];
        }
        _os_log_error_impl(&dword_1DB697000, v15, OS_LOG_TYPE_ERROR, "CCPipeInterface::waitForEvent failed to create a serial dispatch queue for continuous pipe\n", buf, 2u);
LABEL_13:
        if (glog_fd)
        {
          *(_QWORD *)&v16 = 0xAAAAAAAAAAAAAAAALL;
          *((_QWORD *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
          v53 = v16;
          v54 = v16;
          v51 = v16;
          v52 = v16;
          v49 = v16;
          v50 = v16;
          *(_OWORD *)buf = v16;
          *(_OWORD *)&buf[16] = v16;
          memset(&v46, 0, sizeof(v46));
          v45 = 0xAAAAAAAAAAAAAAAALL;
          time(&v45);
          localtime_r(&v45, &v46);
          strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v46);
          dprintf(glog_fd, "%s ", buf);
          dprintf(glog_fd, "CCPipeInterface::waitForEvent failed to create a serial dispatch queue for continuous pipe\n");
        }
      }
    }
  }
  if (*((_QWORD *)this + 17))
    v17 = *((_QWORD *)this + 17);
  else
    v17 = _gQueuePrivate;
  if (!*((_BYTE *)this + 96))
  {
    v22 = (IONotificationPort *)*((_QWORD *)this + 15);
    if (!v22)
      return 3758097084;
    IONotificationPortSetDispatchQueue(v22, v17);
    reference[1] = (uint64_t)a2;
    *(_QWORD *)&v72 = a3;
    v23 = *((_DWORD *)this + 22);
    MachPort = IONotificationPortGetMachPort(*((IONotificationPortRef *)this + 15));
    v25 = IOConnectCallAsyncStructMethod(v23, 0, MachPort, reference, 3u, 0, 0, 0, 0);
    if (!(_DWORD)v25)
    {
LABEL_49:
      pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
      if (!*(_BYTE *)(*((_QWORD *)this + 13) + 56))
      {
LABEL_58:
        pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 16));
        return v25;
      }
      v38 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
          goto LABEL_56;
        v39 = *((_DWORD *)this + 21);
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = "waitForEvent";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 227;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = v25;
        *(_WORD *)&buf[24] = 1024;
        *(_DWORD *)&buf[26] = v39;
        v40 = v38;
      }
      else
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          goto LABEL_56;
        v41 = *((_DWORD *)this + 21);
        *(_DWORD *)buf = 136315906;
        *(_QWORD *)&buf[4] = "waitForEvent";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 227;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = v25;
        *(_WORD *)&buf[24] = 1024;
        *(_DWORD *)&buf[26] = v41;
        v40 = MEMORY[0x1E0C81028];
      }
      _os_log_impl(&dword_1DB697000, v40, OS_LOG_TYPE_DEFAULT, "CCPipeInterface::%s:%d rcvd terminate msg:0x%x entry:%u", buf, 0x1Eu);
LABEL_56:
      if (glog_fd)
      {
        *(_QWORD *)&v42 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v42 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v53 = v42;
        v54 = v42;
        v51 = v42;
        v52 = v42;
        v49 = v42;
        v50 = v42;
        *(_OWORD *)buf = v42;
        *(_OWORD *)&buf[16] = v42;
        memset(&v46, 0, sizeof(v46));
        v45 = 0xAAAAAAAAAAAAAAAALL;
        time(&v45);
        localtime_r(&v45, &v46);
        strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v46);
        dprintf(glog_fd, "%s ", buf);
        dprintf(glog_fd, "CCPipeInterface::%s:%d rcvd terminate msg:0x%x entry:%u", "waitForEvent", 227, v25, *((_DWORD *)this + 21));
      }
      goto LABEL_58;
    }
    v26 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
        goto LABEL_47;
      v27 = *((unsigned __int8 *)this + 96);
      v28 = *((_DWORD *)this + 21);
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = "waitForEvent";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 222;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v27;
      *(_WORD *)&buf[24] = 1024;
      *(_DWORD *)&buf[26] = v28;
      *(_WORD *)&buf[30] = 1024;
      LODWORD(v49) = v25;
      v29 = v26;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        goto LABEL_47;
      v35 = *((unsigned __int8 *)this + 96);
      v36 = *((_DWORD *)this + 21);
      *(_DWORD *)buf = 136316162;
      *(_QWORD *)&buf[4] = "waitForEvent";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 222;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v35;
      *(_WORD *)&buf[24] = 1024;
      *(_DWORD *)&buf[26] = v36;
      *(_WORD *)&buf[30] = 1024;
      LODWORD(v49) = v25;
      v29 = MEMORY[0x1E0C81028];
    }
    _os_log_impl(&dword_1DB697000, v29, OS_LOG_TYPE_DEFAULT, "IOConnectCallAsyncStructMethod FAILED CCPipeInterface::%s::%d fNotificationPortIsSet:%d entry:%u kr[0x%08x]", buf, 0x24u);
LABEL_47:
    if (glog_fd)
    {
      *(_QWORD *)&v37 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v37 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v53 = v37;
      v54 = v37;
      v51 = v37;
      v52 = v37;
      v49 = v37;
      v50 = v37;
      *(_OWORD *)buf = v37;
      *(_OWORD *)&buf[16] = v37;
      memset(&v46, 0, sizeof(v46));
      v45 = 0xAAAAAAAAAAAAAAAALL;
      time(&v45);
      localtime_r(&v45, &v46);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v46);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "IOConnectCallAsyncStructMethod FAILED CCPipeInterface::%s::%d fNotificationPortIsSet:%d entry:%u kr[0x%08x]", "waitForEvent", 222, *((unsigned __int8 *)this + 96), *((_DWORD *)this + 21), v25);
    }
    goto LABEL_49;
  }
  v18 = dispatch_source_create(MEMORY[0x1E0C80D98], *((unsigned int *)this + 23), 0, v17);
  *((_QWORD *)this + 16) = v18;
  if (v18)
  {
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 0x40000000;
    handler[2] = ___ZN15CCPipeInterface12waitForEventEPFvPviPS0_jES0__block_invoke;
    handler[3] = &__block_descriptor_tmp_21;
    handler[4] = this;
    handler[5] = a2;
    handler[6] = a3;
    dispatch_source_set_event_handler(v18, handler);
    dispatch_activate(*((dispatch_object_t *)this + 16));
    if (!*(_BYTE *)(*((_QWORD *)this + 13) + 56))
      return 0;
    v19 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
        goto LABEL_36;
      v20 = *((_DWORD *)this + 21);
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "waitForEvent";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 260;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v20;
      v21 = v19;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        goto LABEL_36;
      v32 = *((_DWORD *)this + 21);
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "waitForEvent";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 260;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = v32;
      v21 = MEMORY[0x1E0C81028];
    }
    _os_log_impl(&dword_1DB697000, v21, OS_LOG_TYPE_DEFAULT, "CCPipeInterface::%s:%d rcvd terminate signal entry:%u", buf, 0x18u);
LABEL_36:
    if (glog_fd)
    {
      *(_QWORD *)&v33 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v33 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v53 = v33;
      v54 = v33;
      v51 = v33;
      v52 = v33;
      v49 = v33;
      v50 = v33;
      *(_OWORD *)buf = v33;
      *(_OWORD *)&buf[16] = v33;
      memset(&v46, 0, sizeof(v46));
      v45 = 0xAAAAAAAAAAAAAAAALL;
      time(&v45);
      localtime_r(&v45, &v46);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v46);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "CCPipeInterface::%s:%d rcvd terminate signal entry:%u", "waitForEvent", 260, *((_DWORD *)this + 21));
    }
    return 0;
  }
  v30 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_42;
    *(_WORD *)buf = 0;
    v31 = v30;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_42;
    *(_WORD *)buf = 0;
    v31 = MEMORY[0x1E0C81028];
  }
  _os_log_impl(&dword_1DB697000, v31, OS_LOG_TYPE_DEFAULT, "CCPipeInterface::dispatch_source_create failed", buf, 2u);
LABEL_42:
  v25 = 3758097084;
  if (glog_fd)
  {
    *(_QWORD *)&v34 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v34 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v53 = v34;
    v54 = v34;
    v51 = v34;
    v52 = v34;
    v49 = v34;
    v50 = v34;
    *(_OWORD *)buf = v34;
    *(_OWORD *)&buf[16] = v34;
    memset(&v46, 0, sizeof(v46));
    v45 = 0xAAAAAAAAAAAAAAAALL;
    time(&v45);
    localtime_r(&v45, &v46);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v46);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "CCPipeInterface::dispatch_source_create failed");
  }
  return v25;
}

uint64_t CCPipeInterface::wakeupTapLoopInternal(CCPipeInterface *this)
{
  mach_port_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  NSObject *v6;
  int v7;
  __int128 v8;
  time_t v10;
  tm v11;
  mach_msg_header_t msg;
  unint64_t v13;
  _BYTE buf[32];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!*((_BYTE *)this + 96))
    return 0;
  v2 = *((_DWORD *)this + 23);
  if (!v2)
    return 0;
  *(_QWORD *)&msg.msgh_voucher_port = 0;
  v13 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&msg.msgh_bits = 0x2000000013;
  msg.msgh_remote_port = v2;
  msg.msgh_local_port = 0;
  v3 = mach_msg(&msg, 1, 0x20u, 0, 0, 0, 0);
  v4 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_10;
    v5 = *((_DWORD *)this + 21);
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "wakeupTapLoopInternal";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 284;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = v3;
    *(_WORD *)&buf[24] = 1024;
    *(_DWORD *)&buf[26] = v5;
    v6 = v4;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_10;
    v7 = *((_DWORD *)this + 21);
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "wakeupTapLoopInternal";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 284;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = v3;
    *(_WORD *)&buf[24] = 1024;
    *(_DWORD *)&buf[26] = v7;
    v6 = MEMORY[0x1E0C81028];
  }
  _os_log_impl(&dword_1DB697000, v6, OS_LOG_TYPE_DEFAULT, "CCPipeInterface::%s:%d mach_msg SEND_MSG kr:%u entry:%u", buf, 0x1Eu);
LABEL_10:
  if (glog_fd)
  {
    *(_QWORD *)&v8 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v19 = v8;
    v20 = v8;
    v17 = v8;
    v18 = v8;
    v15 = v8;
    v16 = v8;
    *(_OWORD *)buf = v8;
    *(_OWORD *)&buf[16] = v8;
    memset(&v11, 0, sizeof(v11));
    v10 = 0xAAAAAAAAAAAAAAAALL;
    time(&v10);
    localtime_r(&v10, &v11);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v11);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "CCPipeInterface::%s:%d mach_msg SEND_MSG kr:%u entry:%u", "wakeupTapLoopInternal", 284, v3, *((_DWORD *)this + 21));
  }
  return v3;
}

uint64_t CCPipeInterface::setNotificationPort(CCPipeInterface *this)
{
  ipc_space_t *v2;
  kern_return_t v3;
  kern_return_t inserted;
  kern_return_t attributes;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  NSObject *v10;
  int v11;
  int v12;
  __int128 v13;
  kern_return_t v15;
  uint64_t v16;
  NSObject *v17;
  kern_return_t v18;
  uint64_t v19;
  NSObject *v20;
  kern_return_t v21;
  uint64_t v22;
  NSObject *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  time_t v27;
  tm v28;
  mach_msg_type_number_t port_info_outCnt;
  integer_t port_info_out;
  mach_port_name_t name;
  _BYTE buf[32];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  port_info_out = -1431655766;
  name = 0;
  port_info_outCnt = -1431655766;
  v2 = (ipc_space_t *)MEMORY[0x1E0C83DA0];
  v3 = mach_port_allocate(*MEMORY[0x1E0C83DA0], 1u, &name);
  if (!v3)
  {
    inserted = mach_port_insert_right(*v2, name, name, 0x14u);
    if (!inserted)
    {
      port_info_outCnt = 1;
      attributes = mach_port_get_attributes(*v2, name, 1, &port_info_out, &port_info_outCnt);
      if (!attributes)
      {
        port_info_out = 10;
        MEMORY[0x1DF0B2554](*v2, name, 1, &port_info_out, 1);
        v6 = 0;
        if (MEMORY[0x1DF0B2134](*((unsigned int *)this + 22), 0, name, 0))
        {
          *((_QWORD *)this + 15) = IONotificationPortCreate(*MEMORY[0x1E0CBBAA8]);
        }
        else
        {
          *((_BYTE *)this + 96) = 1;
          *((_DWORD *)this + 23) = name;
        }
        goto LABEL_7;
      }
      v21 = attributes;
      v22 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
          goto LABEL_34;
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v21;
        v23 = v22;
      }
      else
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_34;
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v21;
        v23 = MEMORY[0x1E0C81028];
      }
      _os_log_error_impl(&dword_1DB697000, v23, OS_LOG_TYPE_ERROR, "CCPipeInterface::setNotificationPort(), mach_port_get_attributes failed kr[0x%08x]\n", buf, 8u);
LABEL_34:
      v6 = 3758097084;
      if (glog_fd)
      {
        *(_QWORD *)&v26 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v26 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v37 = v26;
        v38 = v26;
        v35 = v26;
        v36 = v26;
        v34 = v26;
        *(_OWORD *)&buf[16] = v26;
        v33 = v26;
        *(_OWORD *)buf = v26;
        memset(&v28, 0, sizeof(v28));
        v27 = 0xAAAAAAAAAAAAAAAALL;
        time(&v27);
        localtime_r(&v27, &v28);
        strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v28);
        dprintf(glog_fd, "%s ", buf);
        dprintf(glog_fd, "CCPipeInterface::setNotificationPort(), mach_port_get_attributes failed kr[0x%08x]\n");
      }
      goto LABEL_7;
    }
    v18 = inserted;
    v19 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_31;
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v18;
      v20 = v19;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_31;
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v18;
      v20 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v20, OS_LOG_TYPE_ERROR, "CCPipeInterface::setNotificationPort(), mach_port_insert_right failed kr[0x%08x]\n", buf, 8u);
LABEL_31:
    v6 = 3758097103;
    if (glog_fd)
    {
      *(_QWORD *)&v25 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v25 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v37 = v25;
      v38 = v25;
      v35 = v25;
      v36 = v25;
      v34 = v25;
      *(_OWORD *)&buf[16] = v25;
      v33 = v25;
      *(_OWORD *)buf = v25;
      memset(&v28, 0, sizeof(v28));
      v27 = 0xAAAAAAAAAAAAAAAALL;
      time(&v27);
      localtime_r(&v27, &v28);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v28);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "CCPipeInterface::setNotificationPort(), mach_port_insert_right failed kr[0x%08x]\n");
    }
    goto LABEL_7;
  }
  v15 = v3;
  v16 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v15;
      v17 = v16;
LABEL_37:
      _os_log_error_impl(&dword_1DB697000, v17, OS_LOG_TYPE_ERROR, "CCPipeInterface::setNotificationPort(), mach_port_allocate failed kr[0x%08x]\n", buf, 8u);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v15;
    v17 = MEMORY[0x1E0C81028];
    goto LABEL_37;
  }
  if (glog_fd)
  {
    *(_QWORD *)&v24 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v37 = v24;
    v38 = v24;
    v35 = v24;
    v36 = v24;
    v34 = v24;
    *(_OWORD *)&buf[16] = v24;
    v33 = v24;
    *(_OWORD *)buf = v24;
    memset(&v28, 0, sizeof(v28));
    v27 = 0xAAAAAAAAAAAAAAAALL;
    time(&v27);
    localtime_r(&v27, &v28);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v28);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "CCPipeInterface::setNotificationPort(), mach_port_allocate failed kr[0x%08x]\n", v15);
  }
  v6 = 3758097085;
LABEL_7:
  v7 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_13;
    v8 = *((unsigned __int8 *)this + 96);
    v9 = *((_DWORD *)this + 21);
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = "setNotificationPort";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 328;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = v8;
    *(_WORD *)&buf[24] = 1024;
    *(_DWORD *)&buf[26] = v6;
    *(_WORD *)&buf[30] = 1024;
    LODWORD(v33) = v9;
    v10 = v7;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_13;
    v11 = *((unsigned __int8 *)this + 96);
    v12 = *((_DWORD *)this + 21);
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = "setNotificationPort";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 328;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = v11;
    *(_WORD *)&buf[24] = 1024;
    *(_DWORD *)&buf[26] = v6;
    *(_WORD *)&buf[30] = 1024;
    LODWORD(v33) = v12;
    v10 = MEMORY[0x1E0C81028];
  }
  _os_log_impl(&dword_1DB697000, v10, OS_LOG_TYPE_DEFAULT, "CCPipeInterface::%s::%d fNotificationPortIsSet:%d rc:%d entry:%u", buf, 0x24u);
LABEL_13:
  if (glog_fd)
  {
    *(_QWORD *)&v13 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v37 = v13;
    v38 = v13;
    v35 = v13;
    v36 = v13;
    v34 = v13;
    *(_OWORD *)&buf[16] = v13;
    v33 = v13;
    *(_OWORD *)buf = v13;
    memset(&v28, 0, sizeof(v28));
    v27 = 0xAAAAAAAAAAAAAAAALL;
    time(&v27);
    localtime_r(&v27, &v28);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v28);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "CCPipeInterface::%s::%d fNotificationPortIsSet:%d rc:%d entry:%u", "setNotificationPort", 328, *((unsigned __int8 *)this + 96), v6, *((_DWORD *)this + 21));
  }
  return v6;
}

uint64_t CCPipeInterface::isNotificationPortSet(CCPipeInterface *this)
{
  return *((unsigned __int8 *)this + 96);
}

uint64_t CCPipeInterface::initWithRegistryEntry(CCPipeInterface *this, io_registry_entry_t a2, CCTap *a3)
{
  int v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  io_service_t v10;
  task_port_t v11;
  uint32_t v12;
  kern_return_t v13;
  uint64_t v14;
  int v15;
  int v16;
  NSObject *v17;
  __int128 v18;
  int v20;
  int v21;
  __int128 v22;
  kern_return_t v23;
  const __CFAllocator *v24;
  const __CFString *CFProperty;
  const __CFString *v26;
  const char *CStringPtr;
  const char *v28;
  NSObject *v29;
  __int128 v30;
  int v31;
  const char *v32;
  const char *v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  time_t v37;
  tm v38;
  _BYTE buf[32];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  *((_DWORD *)this + 20) = 0;
  *((_DWORD *)this + 21) = a2;
  v6 = pthread_mutex_init((pthread_mutex_t *)((char *)this + 16), 0);
  if (v6)
  {
    v7 = v6;
    v8 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_10;
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v7;
      v9 = v8;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_10;
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v7;
      v9 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v9, OS_LOG_TYPE_ERROR, "ERROR INIT MUTEX: %d\n", buf, 8u);
LABEL_10:
    if (glog_fd)
    {
      *(_QWORD *)&v18 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v44 = v18;
      v45 = v18;
      v42 = v18;
      v43 = v18;
      v40 = v18;
      v41 = v18;
      *(_OWORD *)buf = v18;
      *(_OWORD *)&buf[16] = v18;
      memset(&v38, 0, sizeof(v38));
      v37 = 0xAAAAAAAAAAAAAAAALL;
      time(&v37);
      localtime_r(&v37, &v38);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v38);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "ERROR INIT MUTEX: %d\n", v7);
    }
    return 0;
  }
  *((_DWORD *)this + 22) = 0;
  *((_QWORD *)this + 13) = a3;
  v10 = *((_DWORD *)this + 21);
  v11 = *MEMORY[0x1E0C83DA0];
  v12 = (*(uint64_t (**)(CCPipeInterface *))(*(_QWORD *)this + 112))(this);
  v13 = IOServiceOpen(v10, v11, v12, (io_connect_t *)this + 22);
  if (v13)
  {
LABEL_23:
    v23 = v13;
    v24 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty(a2, CFSTR("Owner"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
    v26 = (const __CFString *)IORegistryEntryCreateCFProperty(a2, CFSTR("Name"), v24, 0);
    if (coreCaptureOsLog)
    {
      v36 = coreCaptureOsLog;
      if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
      {
        CStringPtr = CFStringGetCStringPtr(CFProperty, 0);
        v28 = CFStringGetCStringPtr(v26, 0);
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = CStringPtr;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = v28;
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = v23;
        v29 = v36;
LABEL_35:
        _os_log_error_impl(&dword_1DB697000, v29, OS_LOG_TYPE_ERROR, "CCPipeInterface::initWithRegistryEntry [pipeOwner: %s, pipeName: %s] Failed to initialize returned %x\n", buf, 0x1Cu);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v34 = CFStringGetCStringPtr(CFProperty, 0);
      v35 = CFStringGetCStringPtr(v26, 0);
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = v34;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = v35;
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = v23;
      v29 = MEMORY[0x1E0C81028];
      goto LABEL_35;
    }
    if (glog_fd)
    {
      *(_QWORD *)&v30 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v30 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v44 = v30;
      v45 = v30;
      v42 = v30;
      v43 = v30;
      v40 = v30;
      v41 = v30;
      *(_OWORD *)buf = v30;
      *(_OWORD *)&buf[16] = v30;
      memset(&v38, 0, sizeof(v38));
      v37 = 0xAAAAAAAAAAAAAAAALL;
      time(&v37);
      localtime_r(&v37, &v38);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v38);
      dprintf(glog_fd, "%s ", buf);
      v31 = glog_fd;
      v32 = CFStringGetCStringPtr(CFProperty, 0);
      v33 = CFStringGetCStringPtr(v26, 0);
      dprintf(v31, "CCPipeInterface::initWithRegistryEntry [pipeOwner: %s, pipeName: %s] Failed to initialize returned %x\n", v32, v33, v23);
    }
    if (v26)
      CFRelease(v26);
    if (CFProperty)
      CFRelease(CFProperty);
    CCPipeInterface::freeResources(this);
    return 0;
  }
  *((_DWORD *)this + 20) = 1;
  v14 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_16;
    v15 = *((_DWORD *)this + 21);
    v16 = *((_DWORD *)this + 22);
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&buf[4] = v15;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = v16;
    v17 = v14;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_16;
    v20 = *((_DWORD *)this + 21);
    v21 = *((_DWORD *)this + 22);
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&buf[4] = v20;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = v21;
    v17 = MEMORY[0x1E0C81028];
  }
  _os_log_impl(&dword_1DB697000, v17, OS_LOG_TYPE_DEFAULT, "CCPipeInterface::initWithRegistryEntry entry:%u fConnectRef(%u)\n", buf, 0xEu);
LABEL_16:
  if (glog_fd)
  {
    *(_QWORD *)&v22 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v22 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v44 = v22;
    v45 = v22;
    v42 = v22;
    v43 = v22;
    v40 = v22;
    v41 = v22;
    *(_OWORD *)buf = v22;
    *(_OWORD *)&buf[16] = v22;
    memset(&v38, 0, sizeof(v38));
    v37 = 0xAAAAAAAAAAAAAAAALL;
    time(&v37);
    localtime_r(&v37, &v38);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v38);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "CCPipeInterface::initWithRegistryEntry entry:%u fConnectRef(%u)\n", *((_DWORD *)this + 21), *((_DWORD *)this + 22));
  }
  v13 = (*(uint64_t (**)(CCPipeInterface *))(*(_QWORD *)this + 104))(this);
  if (v13)
    goto LABEL_23;
  *((_DWORD *)this + 20) = 2;
  return 1;
}

uint64_t CCPipeInterface::openUserClient(CCPipeInterface *this)
{
  return 0;
}

uint64_t CCPipeInterface::getUserClientID(CCPipeInterface *this)
{
  return 0;
}

uint64_t CCPipeInterface::freeResources(CCPipeInterface *this)
{
  NSObject *v2;
  IONotificationPort *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  int v8;
  NSObject *v9;
  int v10;
  int v11;
  __int128 v12;
  IONotificationPort *v13;
  NSObject *v14;
  time_t v16;
  tm v17;
  uint8_t buf[16];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = *((_QWORD *)this + 16);
  if (v2)
    dispatch_source_cancel(v2);
  v3 = (IONotificationPort *)*((_QWORD *)this + 15);
  if (v3)
    IONotificationPortSetDispatchQueue(v3, 0);
  v4 = *((_QWORD *)this + 17);
  if (v4)
  {
    v5 = &__block_literal_global;
  }
  else
  {
    v4 = _gQueuePrivate;
    v5 = &__block_literal_global_13;
  }
  dispatch_sync(v4, v5);
  if (*((int *)this + 20) >= 1)
  {
    v6 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      {
        v7 = *((_DWORD *)this + 21);
        v8 = *((_DWORD *)this + 22);
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)&buf[4] = v7;
        *(_WORD *)&buf[8] = 1024;
        *(_DWORD *)&buf[10] = v8;
        v9 = v6;
LABEL_14:
        _os_log_impl(&dword_1DB697000, v9, OS_LOG_TYPE_DEFAULT, "CCPipeInterface::IOServiceClose entry:%u fConnectRef(%d)\n", buf, 0xEu);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v10 = *((_DWORD *)this + 21);
      v11 = *((_DWORD *)this + 22);
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&buf[4] = v10;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = v11;
      v9 = MEMORY[0x1E0C81028];
      goto LABEL_14;
    }
    if (glog_fd)
    {
      *(_QWORD *)&v12 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v24 = v12;
      v25 = v12;
      v22 = v12;
      v23 = v12;
      v20 = v12;
      v21 = v12;
      *(_OWORD *)buf = v12;
      v19 = v12;
      memset(&v17, 0, sizeof(v17));
      v16 = 0xAAAAAAAAAAAAAAAALL;
      time(&v16);
      localtime_r(&v16, &v17);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v17);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "CCPipeInterface::IOServiceClose entry:%u fConnectRef(%d)\n", *((_DWORD *)this + 21), *((_DWORD *)this + 22));
    }
    IOServiceClose(*((_DWORD *)this + 22));
    *((_DWORD *)this + 20) = 0;
  }
  v13 = (IONotificationPort *)*((_QWORD *)this + 15);
  if (v13)
    IONotificationPortDestroy(v13);
  v14 = *((_QWORD *)this + 17);
  if (v14)
  {
    dispatch_release(v14);
    *((_QWORD *)this + 17) = 0;
  }
  return pthread_mutex_destroy((pthread_mutex_t *)((char *)this + 16));
}

uint64_t ___ZN15CCPipeInterface12waitForEventEPFvPviPS0_jES0__block_invoke(uint64_t result)
{
  uint64_t v1;
  __int128 v2;
  mach_port_name_t v3;
  uint64_t v4;
  uint64_t v5;
  _OWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(result + 32);
  *(_QWORD *)&v2 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v6[0] = v2;
  v6[1] = v2;
  v3 = *(_DWORD *)(v1 + 92);
  if (v3)
  {
    if (!*(_BYTE *)(*(_QWORD *)(v1 + 104) + 56))
    {
      v4 = result;
      v5 = mach_msg((mach_msg_header_t *)v6, 2, 0, 0x20u, v3, 0, 0);
      return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, _QWORD))(v4 + 40))(*(_QWORD *)(v4 + 48), v5, 0, 0);
    }
  }
  return result;
}

void CCPipeInterface::CCPipeInterface(CCPipeInterface *this)
{
  *((_DWORD *)this + 2) = 1;
  *(_QWORD *)this = off_1EA31FAF8;
}

CCPipeInterface *CCPipeInterface::withRegistryEntry(CCPipeInterface *this, CCTap *a2, CCTap *a3)
{
  const __CFNumber *CFProperty;
  CCTap *v6;
  int v7;
  CCPipeInterface *v8;
  CCPipeInterface *v9;
  uint64_t v11;
  NSObject *v12;
  __int128 v13;
  time_t v14;
  tm v15;
  char valuePtr;
  uint8_t buf[16];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty((io_registry_entry_t)this, CFSTR("PipeType"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  valuePtr = -86;
  CFNumberGetValue(CFProperty, kCFNumberSInt8Type, &valuePtr);
  v7 = valuePtr;
  if (valuePtr)
  {
    if (valuePtr == 1)
    {
      v8 = CCDataPipeInterface::withRegistryEntry(this, a2, v6);
      goto LABEL_5;
    }
    v11 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_12;
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v7;
      v12 = v11;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_12;
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v7;
      v12 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v12, OS_LOG_TYPE_ERROR, "CCPipeInterface::withRegistryEntry Unsupported pipe type(%d) \n", buf, 8u);
LABEL_12:
    if (glog_fd)
    {
      *(_QWORD *)&v13 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v23 = v13;
      v24 = v13;
      v21 = v13;
      v22 = v13;
      v19 = v13;
      v20 = v13;
      *(_OWORD *)buf = v13;
      v18 = v13;
      memset(&v15, 0, sizeof(v15));
      v14 = 0xAAAAAAAAAAAAAAAALL;
      time(&v14);
      localtime_r(&v14, &v15);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v15);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "CCPipeInterface::withRegistryEntry Unsupported pipe type(%d) \n", valuePtr);
    }
    v9 = 0;
    if (CFProperty)
      goto LABEL_6;
    return v9;
  }
  v8 = CCLogPipeInterface::withRegistryEntry(this, a2, v6);
LABEL_5:
  v9 = v8;
  if (CFProperty)
LABEL_6:
    CFRelease(CFProperty);
  return v9;
}

void CCPipeMonitor::~CCPipeMonitor(void *this)
{
  if (this)
    free(this);
}

void CCPipeMonitor::serviceTerminated(CFDictionaryRef *this, io_registry_entry_t entry)
{
  const __CFAllocator *v4;
  const __CFString *CFProperty;
  const __CFString *v6;
  const __CFString *v7;
  uint64_t v8;
  const __CFString *v9;
  NSObject *v10;
  __int128 v11;
  int v12;
  const char *CStringPtr;
  const char *v14;
  pthread_mutex_t *v15;
  const void *Value;
  uint64_t v17;
  const void *v18;
  NSObject *v19;
  const char *v20;
  const char *v21;
  NSObject *v22;
  __int128 v23;
  const char *v24;
  const char *v25;
  __int128 v26;
  int v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  NSObject *v33;
  NSObject *v34;
  __int128 v35;
  int v36;
  int v37;
  __int128 v38;
  __int128 v39;
  time_t v40;
  tm v41;
  _BYTE buf[48];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  if (entry)
  {
    v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty(entry, CFSTR("Owner"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
    if (CFProperty)
    {
      v6 = CFProperty;
      v7 = (const __CFString *)IORegistryEntryCreateCFProperty(entry, CFSTR("Name"), v4, 0);
      v8 = coreCaptureOsLog;
      if (v7)
      {
        v9 = v7;
        if (coreCaptureOsLog)
        {
          if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
            goto LABEL_10;
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)&buf[4] = "serviceTerminated";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 340;
          *(_WORD *)&buf[18] = 2080;
          *(_QWORD *)&buf[20] = CFStringGetCStringPtr(v6, 0);
          *(_WORD *)&buf[28] = 2080;
          *(_QWORD *)&buf[30] = CFStringGetCStringPtr(v9, 0);
          *(_WORD *)&buf[38] = 1024;
          *(_DWORD *)&buf[40] = entry;
          v10 = v8;
        }
        else
        {
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            goto LABEL_10;
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)&buf[4] = "serviceTerminated";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 340;
          *(_WORD *)&buf[18] = 2080;
          *(_QWORD *)&buf[20] = CFStringGetCStringPtr(v6, 0);
          *(_WORD *)&buf[28] = 2080;
          *(_QWORD *)&buf[30] = CFStringGetCStringPtr(v9, 0);
          *(_WORD *)&buf[38] = 1024;
          *(_DWORD *)&buf[40] = entry;
          v10 = MEMORY[0x1E0C81028];
        }
        _os_log_impl(&dword_1DB697000, v10, OS_LOG_TYPE_DEFAULT, "%s:%d Owner:%s Name:%s entry:%u", buf, 0x2Cu);
LABEL_10:
        if (glog_fd)
        {
          *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
          *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
          v46 = v11;
          v47 = v11;
          v44 = v11;
          v45 = v11;
          *(_OWORD *)&buf[32] = v11;
          v43 = v11;
          *(_OWORD *)buf = v11;
          *(_OWORD *)&buf[16] = v11;
          memset(&v41, 0, sizeof(v41));
          v40 = 0xAAAAAAAAAAAAAAAALL;
          time(&v40);
          localtime_r(&v40, &v41);
          strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v41);
          dprintf(glog_fd, "%s ", buf);
          v12 = glog_fd;
          CStringPtr = CFStringGetCStringPtr(v6, 0);
          v14 = CFStringGetCStringPtr(v9, 0);
          dprintf(v12, "%s:%d Owner:%s Name:%s entry:%u", "serviceTerminated", 340, CStringPtr, v14, entry);
        }
        v15 = (pthread_mutex_t *)(this + 18);
        pthread_mutex_lock((pthread_mutex_t *)(this + 18));
        Value = CFDictionaryGetValue(this[7], (const void *)entry);
        v17 = coreCaptureOsLog;
        if (Value)
        {
          v18 = Value;
          if (coreCaptureOsLog)
          {
            if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315650;
              *(_QWORD *)&buf[4] = "serviceTerminated";
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = 350;
              *(_WORD *)&buf[18] = 1024;
              *(_DWORD *)&buf[20] = entry;
              v19 = v17;
LABEL_21:
              _os_log_impl(&dword_1DB697000, v19, OS_LOG_TYPE_DEFAULT, "CCPipeMonitor::%s:%d Release Tap for entry:%u", buf, 0x18u);
            }
          }
          else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            *(_QWORD *)&buf[4] = "serviceTerminated";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 350;
            *(_WORD *)&buf[18] = 1024;
            *(_DWORD *)&buf[20] = entry;
            v19 = MEMORY[0x1E0C81028];
            goto LABEL_21;
          }
          if (glog_fd)
          {
            *(_QWORD *)&v23 = 0xAAAAAAAAAAAAAAAALL;
            *((_QWORD *)&v23 + 1) = 0xAAAAAAAAAAAAAAAALL;
            v46 = v23;
            v47 = v23;
            v44 = v23;
            v45 = v23;
            *(_OWORD *)&buf[32] = v23;
            v43 = v23;
            *(_OWORD *)buf = v23;
            *(_OWORD *)&buf[16] = v23;
            memset(&v41, 0, sizeof(v41));
            v40 = 0xAAAAAAAAAAAAAAAALL;
            time(&v40);
            localtime_r(&v40, &v41);
            strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v41);
            dprintf(glog_fd, "%s ", buf);
            dprintf(glog_fd, "CCPipeMonitor::%s:%d Release Tap for entry:%u", "serviceTerminated", 350, entry);
          }
          CFDictionaryRemoveValue(this[7], (const void *)entry);
          (*(void (**)(const void *))(*(_QWORD *)v18 + 48))(v18);
LABEL_30:
          pthread_mutex_unlock(v15);
          CFRelease(v9);
LABEL_31:
          CFRelease(v6);
          return;
        }
        if (coreCaptureOsLog)
        {
          if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
            goto LABEL_28;
          v20 = CFStringGetCStringPtr(v6, 0);
          v21 = CFStringGetCStringPtr(v9, 0);
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)&buf[4] = "serviceTerminated";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 355;
          *(_WORD *)&buf[18] = 2080;
          *(_QWORD *)&buf[20] = v20;
          *(_WORD *)&buf[28] = 2080;
          *(_QWORD *)&buf[30] = v21;
          *(_WORD *)&buf[38] = 1024;
          *(_DWORD *)&buf[40] = entry;
          v22 = v17;
        }
        else
        {
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            goto LABEL_28;
          v24 = CFStringGetCStringPtr(v6, 0);
          v25 = CFStringGetCStringPtr(v9, 0);
          *(_DWORD *)buf = 136316162;
          *(_QWORD *)&buf[4] = "serviceTerminated";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 355;
          *(_WORD *)&buf[18] = 2080;
          *(_QWORD *)&buf[20] = v24;
          *(_WORD *)&buf[28] = 2080;
          *(_QWORD *)&buf[30] = v25;
          *(_WORD *)&buf[38] = 1024;
          *(_DWORD *)&buf[40] = entry;
          v22 = MEMORY[0x1E0C81028];
        }
        _os_log_impl(&dword_1DB697000, v22, OS_LOG_TYPE_DEFAULT, "CCPipeMonitor::%s:%d Tap corresponding to terminated Pipe not found Owner:%s Name:%s entry:%u", buf, 0x2Cu);
LABEL_28:
        if (glog_fd)
        {
          *(_QWORD *)&v26 = 0xAAAAAAAAAAAAAAAALL;
          *((_QWORD *)&v26 + 1) = 0xAAAAAAAAAAAAAAAALL;
          v46 = v26;
          v47 = v26;
          v44 = v26;
          v45 = v26;
          *(_OWORD *)&buf[32] = v26;
          v43 = v26;
          *(_OWORD *)buf = v26;
          *(_OWORD *)&buf[16] = v26;
          memset(&v41, 0, sizeof(v41));
          v40 = 0xAAAAAAAAAAAAAAAALL;
          time(&v40);
          localtime_r(&v40, &v41);
          strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v41);
          dprintf(glog_fd, "%s ", buf);
          v27 = glog_fd;
          v28 = CFStringGetCStringPtr(v6, 0);
          v29 = CFStringGetCStringPtr(v9, 0);
          dprintf(v27, "CCPipeMonitor::%s:%d Tap corresponding to terminated Pipe not found Owner:%s Name:%s entry:%u", "serviceTerminated", 355, v28, v29, entry);
        }
        goto LABEL_30;
      }
      if (coreCaptureOsLog)
      {
        if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
          goto LABEL_50;
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "serviceTerminated";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 337;
        v34 = v8;
      }
      else
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_50;
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "serviceTerminated";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 337;
        v34 = MEMORY[0x1E0C81028];
      }
      _os_log_error_impl(&dword_1DB697000, v34, OS_LOG_TYPE_ERROR, "Invalid argument @'%s':%06u", buf, 0x12u);
LABEL_50:
      if (glog_fd)
      {
        *(_QWORD *)&v39 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v39 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v46 = v39;
        v47 = v39;
        v44 = v39;
        v45 = v39;
        *(_OWORD *)&buf[32] = v39;
        v43 = v39;
        *(_OWORD *)buf = v39;
        *(_OWORD *)&buf[16] = v39;
        memset(&v41, 0, sizeof(v41));
        v40 = 0xAAAAAAAAAAAAAAAALL;
        time(&v40);
        localtime_r(&v40, &v41);
        strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v41);
        dprintf(glog_fd, "%s ", buf);
        dprintf(glog_fd, "Invalid argument @'%s':%06u", "serviceTerminated", 337);
      }
      goto LABEL_31;
    }
    v32 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_46;
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "serviceTerminated";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 334;
      v33 = v32;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_46;
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "serviceTerminated";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 334;
      v33 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v33, OS_LOG_TYPE_ERROR, "Invalid argument @'%s':%06u", buf, 0x12u);
LABEL_46:
    if (glog_fd)
    {
      *(_QWORD *)&v38 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v38 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v46 = v38;
      v47 = v38;
      v44 = v38;
      v45 = v38;
      *(_OWORD *)&buf[32] = v38;
      v43 = v38;
      *(_OWORD *)buf = v38;
      *(_OWORD *)&buf[16] = v38;
      memset(&v41, 0, sizeof(v41));
      v40 = 0xAAAAAAAAAAAAAAAALL;
      time(&v40);
      localtime_r(&v40, &v41);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v41);
      dprintf(glog_fd, "%s ", buf);
      v36 = glog_fd;
      v37 = 334;
      goto LABEL_48;
    }
    return;
  }
  v30 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
      goto LABEL_43;
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "serviceTerminated";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 331;
    v31 = v30;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_43;
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "serviceTerminated";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 331;
    v31 = MEMORY[0x1E0C81028];
  }
  _os_log_error_impl(&dword_1DB697000, v31, OS_LOG_TYPE_ERROR, "Invalid argument @'%s':%06u", buf, 0x12u);
LABEL_43:
  if (glog_fd)
  {
    *(_QWORD *)&v35 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v35 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v46 = v35;
    v47 = v35;
    v44 = v35;
    v45 = v35;
    *(_OWORD *)&buf[32] = v35;
    v43 = v35;
    *(_OWORD *)buf = v35;
    *(_OWORD *)&buf[16] = v35;
    memset(&v41, 0, sizeof(v41));
    v40 = 0xAAAAAAAAAAAAAAAALL;
    time(&v40);
    localtime_r(&v40, &v41);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v41);
    dprintf(glog_fd, "%s ", buf);
    v36 = glog_fd;
    v37 = 331;
LABEL_48:
    dprintf(v36, "Invalid argument @'%s':%06u", "serviceTerminated", v37);
  }
}

uint64_t CCPipeMonitor::initWithDictionary(CCPipeMonitor *this, CFTypeRef cf)
{
  __int128 v4;
  CCIOReportDumpQueue *Mutable;
  CCIOReportDumpQueue *Instance;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v19;
  time_t v20;
  tm v21;
  uint8_t buf[16];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (!coreCaptureOsLog)
  {
    coreCaptureOsLog = (uint64_t)os_log_create("com.apple.corecaptured", "corecapture");
    if (!coreCaptureOsLog)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1DB697000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "CCPipeMonitor::CCPipeMonitor Failed to create OS LOG.\n", buf, 2u);
      }
      if (glog_fd)
      {
        *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v28 = v4;
        v29 = v4;
        v26 = v4;
        v27 = v4;
        v24 = v4;
        v25 = v4;
        *(_OWORD *)buf = v4;
        v23 = v4;
        memset(&v21, 0, sizeof(v21));
        v20 = 0xAAAAAAAAAAAAAAAALL;
        time(&v20);
        localtime_r(&v20, &v21);
        strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v21);
        dprintf(glog_fd, "%s ", (const char *)buf);
        dprintf(glog_fd, "CCPipeMonitor::CCPipeMonitor Failed to create OS LOG.\n");
      }
    }
  }
  *((_QWORD *)this + 9) = 0;
  CCServiceMonitor::initWithDictionary(this, cf);
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, 0);
  *((_QWORD *)this + 7) = Mutable;
  if (!Mutable)
  {
    v9 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_FAULT))
        goto LABEL_24;
      *(_WORD *)buf = 0;
      v10 = v9;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
        goto LABEL_24;
      *(_WORD *)buf = 0;
      v10 = MEMORY[0x1E0C81028];
    }
    _os_log_fault_impl(&dword_1DB697000, v10, OS_LOG_TYPE_FAULT, "CCPipeMonitor::CCPipeMonitor Failed to create pipe dictionary.\n", buf, 2u);
LABEL_24:
    if (glog_fd)
    {
      *(_QWORD *)&v15 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v15 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v28 = v15;
      v29 = v15;
      v26 = v15;
      v27 = v15;
      v24 = v15;
      v25 = v15;
      *(_OWORD *)buf = v15;
      v23 = v15;
      memset(&v21, 0, sizeof(v21));
      v20 = 0xAAAAAAAAAAAAAAAALL;
      time(&v20);
      localtime_r(&v20, &v21);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v21);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "CCPipeMonitor::CCPipeMonitor Failed to create pipe dictionary.\n");
    }
    return 0;
  }
  Instance = CCIOReportDumpQueue::createInstance(Mutable);
  *((_QWORD *)this + 8) = Instance;
  if (!Instance)
  {
    v11 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_FAULT))
        goto LABEL_30;
      *(_WORD *)buf = 0;
      v12 = v11;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
        goto LABEL_30;
      *(_WORD *)buf = 0;
      v12 = MEMORY[0x1E0C81028];
    }
    _os_log_fault_impl(&dword_1DB697000, v12, OS_LOG_TYPE_FAULT, "CCPipeMonitor::CCPipeMonitor Failed to CCIOReportDumpProcessor.\n", buf, 2u);
LABEL_30:
    if (glog_fd)
    {
      *(_QWORD *)&v17 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v17 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v28 = v17;
      v29 = v17;
      v26 = v17;
      v27 = v17;
      v24 = v17;
      v25 = v17;
      *(_OWORD *)buf = v17;
      v23 = v17;
      memset(&v21, 0, sizeof(v21));
      v20 = 0xAAAAAAAAAAAAAAAALL;
      time(&v20);
      localtime_r(&v20, &v21);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v21);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "CCPipeMonitor::CCPipeMonitor Failed to CCIOReportDumpProcessor.\n");
    }
    return 0;
  }
  if (!pthread_mutex_init((pthread_mutex_t *)((char *)this + 80), 0))
  {
    if (!pthread_mutex_init((pthread_mutex_t *)((char *)this + 144), 0))
    {
      CCServiceMonitor::scanServices((uint64_t)this);
      return 1;
    }
    v13 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_34;
      *(_WORD *)buf = 0;
      v14 = v13;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_34;
      *(_WORD *)buf = 0;
      v14 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v14, OS_LOG_TYPE_ERROR, "CCPipeMonitor::CCPipeMonitor Failed to initialize fMutex\n", buf, 2u);
LABEL_34:
    if (glog_fd)
    {
      *(_QWORD *)&v19 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v28 = v19;
      v29 = v19;
      v26 = v19;
      v27 = v19;
      v24 = v19;
      v25 = v19;
      *(_OWORD *)buf = v19;
      v23 = v19;
      memset(&v21, 0, sizeof(v21));
      v20 = 0xAAAAAAAAAAAAAAAALL;
      time(&v20);
      localtime_r(&v20, &v21);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v21);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "CCPipeMonitor::CCPipeMonitor Failed to initialize fMutex\n");
    }
    return 0;
  }
  v7 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
      goto LABEL_27;
    *(_WORD *)buf = 0;
    v8 = v7;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_27;
    *(_WORD *)buf = 0;
    v8 = MEMORY[0x1E0C81028];
  }
  _os_log_error_impl(&dword_1DB697000, v8, OS_LOG_TYPE_ERROR, "CCPipeMonitor::CCPipeMonitor Failed to initialize mutex\n", buf, 2u);
LABEL_27:
  if (glog_fd)
  {
    *(_QWORD *)&v16 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v28 = v16;
    v29 = v16;
    v26 = v16;
    v27 = v16;
    v24 = v16;
    v25 = v16;
    *(_OWORD *)buf = v16;
    v23 = v16;
    memset(&v21, 0, sizeof(v21));
    v20 = 0xAAAAAAAAAAAAAAAALL;
    time(&v20);
    localtime_r(&v20, &v21);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v21);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCPipeMonitor::CCPipeMonitor Failed to initialize mutex\n");
  }
  return 0;
}

uint64_t CCPipeMonitor::stopPipeMonitor(CCPipeMonitor *this)
{
  pthread_mutex_t *v2;
  CFIndex Count;
  CFIndex v4;
  size_t v5;
  const void **v6;
  const void **v7;
  const void **v8;
  const void **v9;
  uint64_t i;

  if (!*((_QWORD *)this + 7))
    return 1;
  v2 = (pthread_mutex_t *)((char *)this + 144);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 144));
  Count = CFDictionaryGetCount(*((CFDictionaryRef *)this + 7));
  if (!Count)
  {
    pthread_mutex_unlock(v2);
    return 1;
  }
  v4 = Count;
  v5 = 8 * Count;
  v6 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
  if (v6)
  {
    v7 = v6;
    v8 = (const void **)malloc_type_malloc(v5, 0x80040B8603338uLL);
    if (v8)
    {
      v9 = v8;
      CFDictionaryGetKeysAndValues(*((CFDictionaryRef *)this + 7), v7, v8);
      for (i = 0; i != v4; ++i)
        (*(void (**)(const void *))(*(_QWORD *)v9[i] + 48))(v9[i]);
      pthread_mutex_unlock(v2);
      free(v7);
      free(v9);
      return 1;
    }
    free(v7);
  }
  pthread_mutex_unlock(v2);
  return 0;
}

CCPipeMonitor *CCPipeMonitor::withDictionary(CCPipeMonitor *this, __CFDictionary *a2)
{
  CCPipeMonitor *v3;

  v3 = (CCPipeMonitor *)malloc_type_malloc(0xD0uLL, 0xEE9A6C17uLL);
  *(_OWORD *)((char *)v3 + 12) = 0u;
  *(_OWORD *)((char *)v3 + 28) = 0u;
  *(_OWORD *)((char *)v3 + 44) = 0u;
  *(_OWORD *)((char *)v3 + 60) = 0u;
  *(_OWORD *)((char *)v3 + 76) = 0u;
  *(_OWORD *)((char *)v3 + 92) = 0u;
  *(_OWORD *)((char *)v3 + 108) = 0u;
  *(_OWORD *)((char *)v3 + 124) = 0u;
  *(_OWORD *)((char *)v3 + 140) = 0u;
  *(_OWORD *)((char *)v3 + 156) = 0u;
  *(_OWORD *)((char *)v3 + 172) = 0u;
  *(_OWORD *)((char *)v3 + 188) = 0u;
  *((_DWORD *)v3 + 51) = 0;
  *((_DWORD *)v3 + 2) = 1;
  *(_QWORD *)v3 = off_1EA31FC38;
  if ((CCPipeMonitor::initWithDictionary(v3, this) & 1) == 0)
  {
    (*(void (**)(CCPipeMonitor *))(*(_QWORD *)v3 + 48))(v3);
    return 0;
  }
  return v3;
}

uint64_t CCPipeMonitor::startPipeMonitor(CCPipeMonitor *this)
{
  return 1;
}

uint64_t CCPipeMonitor::isActive(CFDictionaryRef *this, double a2)
{
  pthread_mutex_t *v5;
  CFIndex Count;
  uint64_t v7;
  size_t v8;
  const void **v9;
  const void **v10;
  const void **v11;
  const void **v12;
  uint64_t i;
  char v14;
  const void **v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  time_t v25;
  tm v26;
  uint8_t buf[16];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  CCPipeMonitor::cleanCaptureDirectories(this);
  if (*((_BYTE *)this + 12))
    return 1;
  v5 = (pthread_mutex_t *)(this + 18);
  pthread_mutex_lock((pthread_mutex_t *)(this + 18));
  Count = CFDictionaryGetCount(this[7]);
  if (!Count)
  {
    v16 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
        goto LABEL_27;
      *(_WORD *)buf = 0;
      v17 = v16;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        goto LABEL_27;
      *(_WORD *)buf = 0;
      v17 = MEMORY[0x1E0C81028];
    }
    _os_log_impl(&dword_1DB697000, v17, OS_LOG_TYPE_DEFAULT, "CCPipeMonitor::isActive:no tap found", buf, 2u);
LABEL_27:
    if (glog_fd)
    {
      *(_QWORD *)&v22 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v22 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v33 = v22;
      v34 = v22;
      v31 = v22;
      v32 = v22;
      v29 = v22;
      v30 = v22;
      *(_OWORD *)buf = v22;
      v28 = v22;
      memset(&v26, 0, sizeof(v26));
      v25 = 0xAAAAAAAAAAAAAAAALL;
      time(&v25);
      localtime_r(&v25, &v26);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v26);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "CCPipeMonitor::isActive:no tap found");
    }
    goto LABEL_32;
  }
  v7 = Count;
  v8 = 8 * Count;
  v9 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
  if (!v9)
  {
    v18 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_30;
      *(_WORD *)buf = 0;
      v19 = v18;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_30;
      *(_WORD *)buf = 0;
      v19 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v19, OS_LOG_TYPE_ERROR, "isActive:Failed to malloc memory for keyArray", buf, 2u);
LABEL_30:
    if (glog_fd)
    {
      *(_QWORD *)&v23 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v23 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v33 = v23;
      v34 = v23;
      v31 = v23;
      v32 = v23;
      v29 = v23;
      v30 = v23;
      *(_OWORD *)buf = v23;
      v28 = v23;
      memset(&v26, 0, sizeof(v26));
      v25 = 0xAAAAAAAAAAAAAAAALL;
      time(&v25);
      localtime_r(&v25, &v26);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v26);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "isActive:Failed to malloc memory for keyArray");
    }
LABEL_32:
    pthread_mutex_unlock((pthread_mutex_t *)(this + 18));
    goto LABEL_14;
  }
  v10 = v9;
  v11 = (const void **)malloc_type_malloc(v8, 0x80040B8603338uLL);
  if (!v11)
  {
    v20 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v21 = v20;
LABEL_40:
        _os_log_error_impl(&dword_1DB697000, v21, OS_LOG_TYPE_ERROR, "isActive:Failed to malloc memory for valueArray", buf, 2u);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v21 = MEMORY[0x1E0C81028];
      goto LABEL_40;
    }
    if (glog_fd)
    {
      *(_QWORD *)&v24 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v33 = v24;
      v34 = v24;
      v31 = v24;
      v32 = v24;
      v29 = v24;
      v30 = v24;
      *(_OWORD *)buf = v24;
      v28 = v24;
      memset(&v26, 0, sizeof(v26));
      v25 = 0xAAAAAAAAAAAAAAAALL;
      time(&v25);
      localtime_r(&v25, &v26);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v26);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "isActive:Failed to malloc memory for valueArray");
    }
    pthread_mutex_unlock((pthread_mutex_t *)(this + 18));
    v15 = v10;
    goto LABEL_13;
  }
  v12 = v11;
  CFDictionaryGetKeysAndValues(this[7], v10, v11);
  if (v7 < 1)
  {
    pthread_mutex_unlock((pthread_mutex_t *)(this + 18));
    free(v10);
    v15 = v12;
LABEL_13:
    free(v15);
    goto LABEL_14;
  }
  for (i = 0; i < v7; ++i)
  {
    v14 = (*(uint64_t (**)(const void *, double))(*(_QWORD *)v12[i] + 64))(v12[i], a2);
    if ((v14 & 1) != 0)
      break;
  }
  pthread_mutex_unlock(v5);
  free(v10);
  free(v12);
  if ((v14 & 1) != 0)
    return 1;
LABEL_14:
  lowPriorityActivities();
  return 0;
}

void CCPipeMonitor::forEachTapWithOwnerAndPipe(CFDictionaryRef *this, const __CFString *a2, const __CFString *a3, void (*a4)(CCTap *, void *), void *a5)
{
  pthread_mutex_t *v8;
  CFIndex Count;
  CFIndex v10;
  size_t v11;
  const void **v12;
  const void **v13;
  const void **v14;
  const void **v15;
  uint64_t v16;
  NSObject *v17;
  __int128 v18;
  int v19;
  const char *CStringPtr;
  const char *v21;
  uint64_t i;
  CFStringRef *v23;
  uint64_t v24;
  const char *v25;
  const char *v26;
  NSObject *v27;
  const char *v28;
  const char *v29;
  __int128 v30;
  int v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  pthread_mutex_t *v35;
  const char *v36;
  const char *v37;
  NSObject *v38;
  __int128 v39;
  int v40;
  const char *v41;
  const char *v42;
  const void **v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  NSObject *v47;
  uint64_t v48;
  NSObject *v49;
  uint64_t v50;
  NSObject *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  pthread_mutex_t *v55;
  time_t v58;
  tm v59;
  _BYTE buf[32];
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v8 = (pthread_mutex_t *)(this + 18);
  pthread_mutex_lock((pthread_mutex_t *)(this + 18));
  Count = CFDictionaryGetCount(this[7]);
  if (!Count)
  {
    v46 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
        goto LABEL_47;
      *(_WORD *)buf = 0;
      v47 = v46;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        goto LABEL_47;
      *(_WORD *)buf = 0;
      v47 = MEMORY[0x1E0C81028];
    }
    _os_log_impl(&dword_1DB697000, v47, OS_LOG_TYPE_DEFAULT, "forEachTapWithOwnerAndPipe:no tap found", buf, 2u);
LABEL_47:
    if (glog_fd)
    {
      *(_QWORD *)&v52 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v52 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v65 = v52;
      v66 = v52;
      v63 = v52;
      v64 = v52;
      v61 = v52;
      v62 = v52;
      *(_OWORD *)buf = v52;
      *(_OWORD *)&buf[16] = v52;
      memset(&v59, 0, sizeof(v59));
      v58 = 0xAAAAAAAAAAAAAAAALL;
      time(&v58);
      localtime_r(&v58, &v59);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v59);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "forEachTapWithOwnerAndPipe:no tap found");
    }
    goto LABEL_52;
  }
  v10 = Count;
  v11 = 8 * Count;
  v12 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
  if (!v12)
  {
    v48 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_50;
      *(_WORD *)buf = 0;
      v49 = v48;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_50;
      *(_WORD *)buf = 0;
      v49 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v49, OS_LOG_TYPE_ERROR, "forEachTapWithOwnerAndPipe:Failed to malloc memory for keyArray", buf, 2u);
LABEL_50:
    if (glog_fd)
    {
      *(_QWORD *)&v53 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v53 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v65 = v53;
      v66 = v53;
      v63 = v53;
      v64 = v53;
      v61 = v53;
      v62 = v53;
      *(_OWORD *)buf = v53;
      *(_OWORD *)&buf[16] = v53;
      memset(&v59, 0, sizeof(v59));
      v58 = 0xAAAAAAAAAAAAAAAALL;
      time(&v58);
      localtime_r(&v58, &v59);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v59);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "forEachTapWithOwnerAndPipe:Failed to malloc memory for keyArray");
    }
LABEL_52:
    pthread_mutex_unlock(v8);
    return;
  }
  v13 = v12;
  v14 = (const void **)malloc_type_malloc(v11, 0x80040B8603338uLL);
  if (!v14)
  {
    v50 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v51 = v50;
LABEL_60:
        _os_log_error_impl(&dword_1DB697000, v51, OS_LOG_TYPE_ERROR, "forEachTapWithOwnerAndPipe:Failed to malloc memory for valueArray", buf, 2u);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v51 = MEMORY[0x1E0C81028];
      goto LABEL_60;
    }
    if (glog_fd)
    {
      *(_QWORD *)&v54 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v54 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v65 = v54;
      v66 = v54;
      v63 = v54;
      v64 = v54;
      v61 = v54;
      v62 = v54;
      *(_OWORD *)buf = v54;
      *(_OWORD *)&buf[16] = v54;
      memset(&v59, 0, sizeof(v59));
      v58 = 0xAAAAAAAAAAAAAAAALL;
      time(&v58);
      localtime_r(&v58, &v59);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v59);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "forEachTapWithOwnerAndPipe:Failed to malloc memory for valueArray");
    }
    pthread_mutex_unlock(v8);
    v43 = v13;
    goto LABEL_29;
  }
  v15 = v14;
  CFDictionaryGetKeysAndValues(this[7], v13, v14);
  v16 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "forEachTapWithOwnerAndPipe";
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = CFStringGetCStringPtr(a2, 0);
      *(_WORD *)&buf[22] = 2080;
      *(_QWORD *)&buf[24] = CFStringGetCStringPtr(a3, 0);
      v17 = v16;
LABEL_32:
      _os_log_error_impl(&dword_1DB697000, v17, OS_LOG_TYPE_ERROR, "%s Tap Find Tap with Owner:%s Name:%s\n", buf, 0x20u);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "forEachTapWithOwnerAndPipe";
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = CFStringGetCStringPtr(a2, 0);
    *(_WORD *)&buf[22] = 2080;
    *(_QWORD *)&buf[24] = CFStringGetCStringPtr(a3, 0);
    v17 = MEMORY[0x1E0C81028];
    goto LABEL_32;
  }
  v55 = v8;
  if (glog_fd)
  {
    *(_QWORD *)&v18 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v65 = v18;
    v66 = v18;
    v63 = v18;
    v64 = v18;
    v61 = v18;
    v62 = v18;
    *(_OWORD *)buf = v18;
    *(_OWORD *)&buf[16] = v18;
    memset(&v59, 0, sizeof(v59));
    v58 = 0xAAAAAAAAAAAAAAAALL;
    time(&v58);
    localtime_r(&v58, &v59);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v59);
    dprintf(glog_fd, "%s ", buf);
    v19 = glog_fd;
    CStringPtr = CFStringGetCStringPtr(a2, 0);
    v21 = CFStringGetCStringPtr(a3, 0);
    dprintf(v19, "%s Tap Find Tap with Owner:%s Name:%s\n", "forEachTapWithOwnerAndPipe", CStringPtr, v21);
  }
  for (i = 0; i != v10; ++i)
  {
    v23 = (CFStringRef *)v15[i];
    if (!CCTap::findWithOwnerAndPipe(v23, a2, a3))
      continue;
    v24 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      {
        v25 = CFStringGetCStringPtr(a2, 0);
        v26 = CFStringGetCStringPtr(a3, 0);
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "forEachTapWithOwnerAndPipe";
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = v25;
        *(_WORD *)&buf[22] = 2080;
        *(_QWORD *)&buf[24] = v26;
        v27 = v24;
LABEL_17:
        _os_log_impl(&dword_1DB697000, v27, OS_LOG_TYPE_DEFAULT, "%s Tap Found tap with Owner:%s Name:%s\n", buf, 0x20u);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v28 = CFStringGetCStringPtr(a2, 0);
      v29 = CFStringGetCStringPtr(a3, 0);
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "forEachTapWithOwnerAndPipe";
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = v28;
      *(_WORD *)&buf[22] = 2080;
      *(_QWORD *)&buf[24] = v29;
      v27 = MEMORY[0x1E0C81028];
      goto LABEL_17;
    }
    if (glog_fd)
    {
      *(_QWORD *)&v30 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v30 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v65 = v30;
      v66 = v30;
      v63 = v30;
      v64 = v30;
      v61 = v30;
      v62 = v30;
      *(_OWORD *)buf = v30;
      *(_OWORD *)&buf[16] = v30;
      memset(&v59, 0, sizeof(v59));
      v58 = 0xAAAAAAAAAAAAAAAALL;
      time(&v58);
      localtime_r(&v58, &v59);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v59);
      dprintf(glog_fd, "%s ", buf);
      v31 = glog_fd;
      v32 = CFStringGetCStringPtr(a2, 0);
      v33 = CFStringGetCStringPtr(a3, 0);
      dprintf(v31, "%s Tap Found tap with Owner:%s Name:%s\n", "forEachTapWithOwnerAndPipe", v32, v33);
    }
    a4((CCTap *)v23, a5);
  }
  v34 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    v35 = v55;
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
    {
      v36 = CFStringGetCStringPtr(a2, 0);
      v37 = CFStringGetCStringPtr(a3, 0);
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "forEachTapWithOwnerAndPipe";
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = v36;
      *(_WORD *)&buf[22] = 2080;
      *(_QWORD *)&buf[24] = v37;
      v38 = v34;
      goto LABEL_34;
    }
  }
  else
  {
    v35 = v55;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v44 = CFStringGetCStringPtr(a2, 0);
      v45 = CFStringGetCStringPtr(a3, 0);
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "forEachTapWithOwnerAndPipe";
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = v44;
      *(_WORD *)&buf[22] = 2080;
      *(_QWORD *)&buf[24] = v45;
      v38 = MEMORY[0x1E0C81028];
LABEL_34:
      _os_log_error_impl(&dword_1DB697000, v38, OS_LOG_TYPE_ERROR, "%s CANNOT FIND tap with Owner:%s Name:%s\n", buf, 0x20u);
    }
  }
  if (glog_fd)
  {
    *(_QWORD *)&v39 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v39 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v65 = v39;
    v66 = v39;
    v63 = v39;
    v64 = v39;
    v61 = v39;
    v62 = v39;
    *(_OWORD *)buf = v39;
    *(_OWORD *)&buf[16] = v39;
    memset(&v59, 0, sizeof(v59));
    v58 = 0xAAAAAAAAAAAAAAAALL;
    time(&v58);
    localtime_r(&v58, &v59);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v59);
    dprintf(glog_fd, "%s ", buf);
    v40 = glog_fd;
    v41 = CFStringGetCStringPtr(a2, 0);
    v42 = CFStringGetCStringPtr(a3, 0);
    dprintf(v40, "%s CANNOT FIND tap with Owner:%s Name:%s\n", "forEachTapWithOwnerAndPipe", v41, v42);
  }
  pthread_mutex_unlock(v35);
  free(v13);
  v43 = v15;
LABEL_29:
  free(v43);
}

void CCPipeMonitor::forEachTapWithDirectory(CFDictionaryRef *this, const __CFString *a2, void (*a3)(CCTap *, void *), void *a4)
{
  pthread_mutex_t *v8;
  CFIndex Count;
  CFIndex v10;
  size_t v11;
  const void **v12;
  const void **v13;
  const void **v14;
  const void **v15;
  uint64_t i;
  CCTap *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  time_t v27;
  tm v28;
  uint8_t buf[16];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = (pthread_mutex_t *)(this + 18);
  pthread_mutex_lock((pthread_mutex_t *)(this + 18));
  Count = CFDictionaryGetCount(this[7]);
  if (!Count)
  {
    v18 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
        goto LABEL_21;
      *(_WORD *)buf = 0;
      v19 = v18;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        goto LABEL_21;
      *(_WORD *)buf = 0;
      v19 = MEMORY[0x1E0C81028];
    }
    _os_log_impl(&dword_1DB697000, v19, OS_LOG_TYPE_DEFAULT, "forEachTapWithDirectory:no tap found", buf, 2u);
LABEL_21:
    if (glog_fd)
    {
      *(_QWORD *)&v24 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v35 = v24;
      v36 = v24;
      v33 = v24;
      v34 = v24;
      v31 = v24;
      v32 = v24;
      *(_OWORD *)buf = v24;
      v30 = v24;
      memset(&v28, 0, sizeof(v28));
      v27 = 0xAAAAAAAAAAAAAAAALL;
      time(&v27);
      localtime_r(&v27, &v28);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v28);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "forEachTapWithDirectory:no tap found");
    }
    goto LABEL_26;
  }
  v10 = Count;
  v11 = 8 * Count;
  v12 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
  if (!v12)
  {
    v20 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_24;
      *(_WORD *)buf = 0;
      v21 = v20;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_24;
      *(_WORD *)buf = 0;
      v21 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v21, OS_LOG_TYPE_ERROR, "forEachTapWithDirectory:Failed to malloc memory for keyArray", buf, 2u);
LABEL_24:
    if (glog_fd)
    {
      *(_QWORD *)&v25 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v25 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v35 = v25;
      v36 = v25;
      v33 = v25;
      v34 = v25;
      v31 = v25;
      v32 = v25;
      *(_OWORD *)buf = v25;
      v30 = v25;
      memset(&v28, 0, sizeof(v28));
      v27 = 0xAAAAAAAAAAAAAAAALL;
      time(&v27);
      localtime_r(&v27, &v28);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v28);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "forEachTapWithDirectory:Failed to malloc memory for keyArray");
    }
LABEL_26:
    pthread_mutex_unlock(v8);
    return;
  }
  v13 = v12;
  v14 = (const void **)malloc_type_malloc(v11, 0x80040B8603338uLL);
  if (v14)
  {
    v15 = v14;
    CFDictionaryGetKeysAndValues(this[7], v13, v14);
    for (i = 0; i != v10; ++i)
    {
      v17 = (CCTap *)v15[i];
      if (CCTap::findWithDirectory((CFStringRef *)v17, a2))
        a3(v17, a4);
    }
    pthread_mutex_unlock(v8);
    free(v13);
    free(v15);
    return;
  }
  v22 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v23 = v22;
LABEL_35:
      _os_log_error_impl(&dword_1DB697000, v23, OS_LOG_TYPE_ERROR, "forEachTapWithDirectory:Failed to malloc memory for valueArray", buf, 2u);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v23 = MEMORY[0x1E0C81028];
    goto LABEL_35;
  }
  if (glog_fd)
  {
    *(_QWORD *)&v26 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v26 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v35 = v26;
    v36 = v26;
    v33 = v26;
    v34 = v26;
    v31 = v26;
    v32 = v26;
    *(_OWORD *)buf = v26;
    v30 = v26;
    memset(&v28, 0, sizeof(v28));
    v27 = 0xAAAAAAAAAAAAAAAALL;
    time(&v27);
    localtime_r(&v27, &v28);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v28);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "forEachTapWithDirectory:Failed to malloc memory for valueArray");
  }
  pthread_mutex_unlock(v8);
  free(v13);
}

CFStringRef *CCPipeMonitor::findTapWithOwnerAndPipe(CFDictionaryRef *this, const __CFString *a2, const __CFString *a3)
{
  pthread_mutex_t *v6;
  CFIndex Count;
  CFIndex v8;
  size_t v9;
  void *v10;
  void *v11;
  const void **v12;
  const void **v13;
  uint64_t v14;
  CFStringRef *v15;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  time_t v26;
  tm v27;
  uint8_t buf[16];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = (pthread_mutex_t *)(this + 18);
  pthread_mutex_lock((pthread_mutex_t *)(this + 18));
  Count = CFDictionaryGetCount(this[7]);
  if (!Count)
  {
    v17 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
        goto LABEL_22;
      *(_WORD *)buf = 0;
      v18 = v17;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        goto LABEL_22;
      *(_WORD *)buf = 0;
      v18 = MEMORY[0x1E0C81028];
    }
    _os_log_impl(&dword_1DB697000, v18, OS_LOG_TYPE_DEFAULT, "findTapWithOwnerAndPipe:no tap found", buf, 2u);
LABEL_22:
    if (glog_fd)
    {
      *(_QWORD *)&v23 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v23 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v34 = v23;
      v35 = v23;
      v32 = v23;
      v33 = v23;
      v30 = v23;
      v31 = v23;
      *(_OWORD *)buf = v23;
      v29 = v23;
      memset(&v27, 0, sizeof(v27));
      v26 = 0xAAAAAAAAAAAAAAAALL;
      time(&v26);
      localtime_r(&v26, &v27);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v27);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "findTapWithOwnerAndPipe:no tap found");
    }
    goto LABEL_27;
  }
  v8 = Count;
  v9 = 8 * Count;
  v10 = malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
  if (!v10)
  {
    v19 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_25;
      *(_WORD *)buf = 0;
      v20 = v19;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_25;
      *(_WORD *)buf = 0;
      v20 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v20, OS_LOG_TYPE_ERROR, "findTapWithOwnerAndPipe:Failed to malloc memory for keyArray", buf, 2u);
LABEL_25:
    if (glog_fd)
    {
      *(_QWORD *)&v24 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v34 = v24;
      v35 = v24;
      v32 = v24;
      v33 = v24;
      v30 = v24;
      v31 = v24;
      *(_OWORD *)buf = v24;
      v29 = v24;
      memset(&v27, 0, sizeof(v27));
      v26 = 0xAAAAAAAAAAAAAAAALL;
      time(&v26);
      localtime_r(&v26, &v27);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v27);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "findTapWithOwnerAndPipe:Failed to malloc memory for keyArray");
    }
LABEL_27:
    pthread_mutex_unlock(v6);
    return 0;
  }
  v11 = v10;
  v12 = (const void **)malloc_type_malloc(v9, 0x80040B8603338uLL);
  if (!v12)
  {
    v21 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v22 = v21;
LABEL_36:
        _os_log_error_impl(&dword_1DB697000, v22, OS_LOG_TYPE_ERROR, "findTapWithOwnerAndPipe:Failed to malloc memory for valueArray", buf, 2u);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v22 = MEMORY[0x1E0C81028];
      goto LABEL_36;
    }
    if (glog_fd)
    {
      *(_QWORD *)&v25 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v25 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v34 = v25;
      v35 = v25;
      v32 = v25;
      v33 = v25;
      v30 = v25;
      v31 = v25;
      *(_OWORD *)buf = v25;
      v29 = v25;
      memset(&v27, 0, sizeof(v27));
      v26 = 0xAAAAAAAAAAAAAAAALL;
      time(&v26);
      localtime_r(&v26, &v27);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v27);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "findTapWithOwnerAndPipe:Failed to malloc memory for valueArray");
    }
    pthread_mutex_unlock(v6);
    free(v11);
    return 0;
  }
  v13 = v12;
  CFDictionaryGetKeysAndValues(this[7], (const void **)v11, v12);
  v14 = 0;
  while (1)
  {
    v15 = (CFStringRef *)v13[v14];
    if ((CCTap::findWithOwnerAndPipe(v15, a2, a3) & 1) != 0)
      break;
    if (v8 == ++v14)
    {
      v15 = 0;
      break;
    }
  }
  pthread_mutex_unlock(v6);
  free(v11);
  free(v13);
  return v15;
}

void CCPipeMonitor::profileLoaded(CFDictionaryRef *this)
{
  pthread_mutex_t *v2;
  CFIndex Count;
  CFIndex v4;
  size_t v5;
  const void **v6;
  const void **v7;
  const void **v8;
  const void **v9;
  uint64_t i;
  const void *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  time_t v21;
  tm v22;
  uint8_t buf[16];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v2 = (pthread_mutex_t *)(this + 18);
  pthread_mutex_lock((pthread_mutex_t *)(this + 18));
  Count = CFDictionaryGetCount(this[7]);
  if (!Count)
  {
    v12 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
        goto LABEL_21;
      *(_WORD *)buf = 0;
      v13 = v12;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        goto LABEL_21;
      *(_WORD *)buf = 0;
      v13 = MEMORY[0x1E0C81028];
    }
    _os_log_impl(&dword_1DB697000, v13, OS_LOG_TYPE_DEFAULT, "profileLoaded:no tap found", buf, 2u);
LABEL_21:
    if (glog_fd)
    {
      *(_QWORD *)&v18 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v29 = v18;
      v30 = v18;
      v27 = v18;
      v28 = v18;
      v25 = v18;
      v26 = v18;
      *(_OWORD *)buf = v18;
      v24 = v18;
      memset(&v22, 0, sizeof(v22));
      v21 = 0xAAAAAAAAAAAAAAAALL;
      time(&v21);
      localtime_r(&v21, &v22);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v22);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "profileLoaded:no tap found");
    }
    goto LABEL_26;
  }
  v4 = Count;
  v5 = 8 * Count;
  v6 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
  if (!v6)
  {
    v14 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_24;
      *(_WORD *)buf = 0;
      v15 = v14;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_24;
      *(_WORD *)buf = 0;
      v15 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v15, OS_LOG_TYPE_ERROR, "profileLoaded:Failed to malloc memory for keyArray", buf, 2u);
LABEL_24:
    if (glog_fd)
    {
      *(_QWORD *)&v19 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v29 = v19;
      v30 = v19;
      v27 = v19;
      v28 = v19;
      v25 = v19;
      v26 = v19;
      *(_OWORD *)buf = v19;
      v24 = v19;
      memset(&v22, 0, sizeof(v22));
      v21 = 0xAAAAAAAAAAAAAAAALL;
      time(&v21);
      localtime_r(&v21, &v22);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v22);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "profileLoaded:Failed to malloc memory for keyArray");
    }
LABEL_26:
    pthread_mutex_unlock(v2);
    return;
  }
  v7 = v6;
  v8 = (const void **)malloc_type_malloc(v5, 0x80040B8603338uLL);
  if (v8)
  {
    v9 = v8;
    CFDictionaryGetKeysAndValues(this[7], v7, v8);
    for (i = 0; i != v4; ++i)
    {
      v11 = v9[i];
      if (v11)
        (*(void (**)(const void *))(*(_QWORD *)v11 + 72))(v11);
    }
    pthread_mutex_unlock(v2);
    free(v7);
    free(v9);
    return;
  }
  v16 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v17 = v16;
LABEL_35:
      _os_log_error_impl(&dword_1DB697000, v17, OS_LOG_TYPE_ERROR, "profileLoaded:Failed to malloc memory for valueArray", buf, 2u);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v17 = MEMORY[0x1E0C81028];
    goto LABEL_35;
  }
  if (glog_fd)
  {
    *(_QWORD *)&v20 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v29 = v20;
    v30 = v20;
    v27 = v20;
    v28 = v20;
    v25 = v20;
    v26 = v20;
    *(_OWORD *)buf = v20;
    v24 = v20;
    memset(&v22, 0, sizeof(v22));
    v21 = 0xAAAAAAAAAAAAAAAALL;
    time(&v21);
    localtime_r(&v21, &v22);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v22);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "profileLoaded:Failed to malloc memory for valueArray");
  }
  pthread_mutex_unlock(v2);
  free(v7);
}

void CCPipeMonitor::profileRemoved(CFDictionaryRef *this)
{
  pthread_mutex_t *v2;
  CFIndex Count;
  CFIndex v4;
  size_t v5;
  const void **v6;
  const void **v7;
  const void **v8;
  const void **v9;
  uint64_t i;
  const void *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  time_t v21;
  tm v22;
  uint8_t buf[16];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v2 = (pthread_mutex_t *)(this + 18);
  pthread_mutex_lock((pthread_mutex_t *)(this + 18));
  Count = CFDictionaryGetCount(this[7]);
  if (!Count)
  {
    v12 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
        goto LABEL_21;
      *(_WORD *)buf = 0;
      v13 = v12;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        goto LABEL_21;
      *(_WORD *)buf = 0;
      v13 = MEMORY[0x1E0C81028];
    }
    _os_log_impl(&dword_1DB697000, v13, OS_LOG_TYPE_DEFAULT, "profileRemoved:no tap found", buf, 2u);
LABEL_21:
    if (glog_fd)
    {
      *(_QWORD *)&v18 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v29 = v18;
      v30 = v18;
      v27 = v18;
      v28 = v18;
      v25 = v18;
      v26 = v18;
      *(_OWORD *)buf = v18;
      v24 = v18;
      memset(&v22, 0, sizeof(v22));
      v21 = 0xAAAAAAAAAAAAAAAALL;
      time(&v21);
      localtime_r(&v21, &v22);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v22);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "profileRemoved:no tap found");
    }
    goto LABEL_26;
  }
  v4 = Count;
  v5 = 8 * Count;
  v6 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
  if (!v6)
  {
    v14 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_24;
      *(_WORD *)buf = 0;
      v15 = v14;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_24;
      *(_WORD *)buf = 0;
      v15 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v15, OS_LOG_TYPE_ERROR, "profileRemoved:Failed to malloc memory for keyArray", buf, 2u);
LABEL_24:
    if (glog_fd)
    {
      *(_QWORD *)&v19 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v29 = v19;
      v30 = v19;
      v27 = v19;
      v28 = v19;
      v25 = v19;
      v26 = v19;
      *(_OWORD *)buf = v19;
      v24 = v19;
      memset(&v22, 0, sizeof(v22));
      v21 = 0xAAAAAAAAAAAAAAAALL;
      time(&v21);
      localtime_r(&v21, &v22);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v22);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "profileRemoved:Failed to malloc memory for keyArray");
    }
LABEL_26:
    pthread_mutex_unlock(v2);
    return;
  }
  v7 = v6;
  v8 = (const void **)malloc_type_malloc(v5, 0x80040B8603338uLL);
  if (v8)
  {
    v9 = v8;
    CFDictionaryGetKeysAndValues(this[7], v7, v8);
    for (i = 0; i != v4; ++i)
    {
      v11 = v9[i];
      if (v11)
        (*(void (**)(const void *))(*(_QWORD *)v11 + 80))(v11);
    }
    pthread_mutex_unlock(v2);
    free(v7);
    free(v9);
    return;
  }
  v16 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v17 = v16;
LABEL_35:
      _os_log_error_impl(&dword_1DB697000, v17, OS_LOG_TYPE_ERROR, "profileRemoved:Failed to malloc memory for valueArray", buf, 2u);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v17 = MEMORY[0x1E0C81028];
    goto LABEL_35;
  }
  if (glog_fd)
  {
    *(_QWORD *)&v20 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v29 = v20;
    v30 = v20;
    v27 = v20;
    v28 = v20;
    v25 = v20;
    v26 = v20;
    *(_OWORD *)buf = v20;
    v24 = v20;
    memset(&v22, 0, sizeof(v22));
    v21 = 0xAAAAAAAAAAAAAAAALL;
    time(&v21);
    localtime_r(&v21, &v22);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v22);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "profileRemoved:Failed to malloc memory for valueArray");
  }
  pthread_mutex_unlock(v2);
  free(v7);
}

uint64_t CCPipeMonitor::setProfileMonitor(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(a1 + 72) = a2;
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a2 + 40))(a2);
}

uint64_t CCPipeMonitor::releaseProfileMonitor(CCPipeMonitor *this)
{
  uint64_t result;

  result = *((_QWORD *)this + 9);
  if (result)
  {
    result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 48))(result);
    *((_QWORD *)this + 9) = 0;
  }
  return result;
}

void CCPipeMonitor::quiesceAllTaps(CFDictionaryRef *this)
{
  pthread_mutex_t *v2;
  CFIndex Count;
  uint64_t v4;
  size_t v5;
  const void **v6;
  const void **v7;
  const void **v8;
  const void **v9;
  uint64_t i;
  uint64_t v11;
  int v12;
  const void *v13;
  uint64_t v14;
  NSObject *v15;
  __int128 v16;
  const void **v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  time_t v27;
  tm v28;
  uint8_t buf[16];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v2 = (pthread_mutex_t *)(this + 18);
  pthread_mutex_lock((pthread_mutex_t *)(this + 18));
  Count = CFDictionaryGetCount(this[7]);
  if (!Count)
  {
    v18 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
        goto LABEL_36;
      *(_WORD *)buf = 0;
      v19 = v18;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        goto LABEL_36;
      *(_WORD *)buf = 0;
      v19 = MEMORY[0x1E0C81028];
    }
    _os_log_impl(&dword_1DB697000, v19, OS_LOG_TYPE_DEFAULT, "quiesceAllTaps:no tap found", buf, 2u);
LABEL_36:
    if (glog_fd)
    {
      *(_QWORD *)&v24 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v35 = v24;
      v36 = v24;
      v33 = v24;
      v34 = v24;
      v31 = v24;
      v32 = v24;
      *(_OWORD *)buf = v24;
      v30 = v24;
      memset(&v28, 0, sizeof(v28));
      v27 = 0xAAAAAAAAAAAAAAAALL;
      time(&v27);
      localtime_r(&v27, &v28);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v28);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "quiesceAllTaps:no tap found");
    }
    goto LABEL_41;
  }
  v4 = Count;
  v5 = 8 * Count;
  v6 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
  if (!v6)
  {
    v20 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_39;
      *(_WORD *)buf = 0;
      v21 = v20;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_39;
      *(_WORD *)buf = 0;
      v21 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v21, OS_LOG_TYPE_ERROR, "quiesceAllTaps:Failed to malloc memory for keyArray", buf, 2u);
LABEL_39:
    if (glog_fd)
    {
      *(_QWORD *)&v25 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v25 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v35 = v25;
      v36 = v25;
      v33 = v25;
      v34 = v25;
      v31 = v25;
      v32 = v25;
      *(_OWORD *)buf = v25;
      v30 = v25;
      memset(&v28, 0, sizeof(v28));
      v27 = 0xAAAAAAAAAAAAAAAALL;
      time(&v27);
      localtime_r(&v27, &v28);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v28);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "quiesceAllTaps:Failed to malloc memory for keyArray");
    }
LABEL_41:
    pthread_mutex_unlock(v2);
    return;
  }
  v7 = v6;
  v8 = (const void **)malloc_type_malloc(v5, 0x80040B8603338uLL);
  if (!v8)
  {
    v22 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v23 = v22;
LABEL_49:
        _os_log_error_impl(&dword_1DB697000, v23, OS_LOG_TYPE_ERROR, "quiesceAllTaps:Failed to malloc memory for valueArray", buf, 2u);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v23 = MEMORY[0x1E0C81028];
      goto LABEL_49;
    }
    if (glog_fd)
    {
      *(_QWORD *)&v26 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v26 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v35 = v26;
      v36 = v26;
      v33 = v26;
      v34 = v26;
      v31 = v26;
      v32 = v26;
      *(_OWORD *)buf = v26;
      v30 = v26;
      memset(&v28, 0, sizeof(v28));
      v27 = 0xAAAAAAAAAAAAAAAALL;
      time(&v27);
      localtime_r(&v27, &v28);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v28);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "quiesceAllTaps:Failed to malloc memory for valueArray");
    }
    pthread_mutex_unlock(v2);
    v17 = v7;
    goto LABEL_20;
  }
  v9 = v8;
  CFDictionaryGetKeysAndValues(this[7], v7, v8);
  if (v4 >= 1)
  {
    for (i = 0; i != v4; ++i)
      (*(void (**)(const void *))(*(_QWORD *)v9[i] + 104))(v9[i]);
    v11 = 0;
    v12 = 100;
    while (1)
    {
      v13 = v9[v11];
      if (((*(uint64_t (**)(const void *))(*(_QWORD *)v13 + 112))(v13) & 1) == 0)
        break;
LABEL_11:
      if (++v11 == v4)
        goto LABEL_19;
    }
    while (--v12)
    {
      usleep(0x186A0u);
      if ((*(unsigned int (**)(const void *))(*(_QWORD *)v13 + 112))(v13))
        goto LABEL_11;
    }
    v14 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_17;
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v11 + 1;
      v15 = v14;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_17;
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v11 + 1;
      v15 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v15, OS_LOG_TYPE_ERROR, "CCDaemon::Not all taps got quiesced, tap %ld was not ready", buf, 0xCu);
LABEL_17:
    if (glog_fd)
    {
      *(_QWORD *)&v16 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v35 = v16;
      v36 = v16;
      v33 = v16;
      v34 = v16;
      v31 = v16;
      v32 = v16;
      *(_OWORD *)buf = v16;
      v30 = v16;
      memset(&v28, 0, sizeof(v28));
      v27 = 0xAAAAAAAAAAAAAAAALL;
      time(&v27);
      localtime_r(&v27, &v28);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v28);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "CCDaemon::Not all taps got quiesced, tap %ld was not ready", v11 + 1);
    }
  }
LABEL_19:
  pthread_mutex_unlock(v2);
  free(v7);
  v17 = v9;
LABEL_20:
  free(v17);
}

void CCPipeMonitor::resumeAllTapsFromQuiesced(CFDictionaryRef *this)
{
  pthread_mutex_t *v2;
  CFIndex Count;
  uint64_t v4;
  size_t v5;
  const void **v6;
  const void **v7;
  const void **v8;
  const void **v9;
  const void **v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  time_t v21;
  tm v22;
  uint8_t buf[16];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v2 = (pthread_mutex_t *)(this + 18);
  pthread_mutex_lock((pthread_mutex_t *)(this + 18));
  Count = CFDictionaryGetCount(this[7]);
  if (!Count)
  {
    v12 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
        goto LABEL_20;
      *(_WORD *)buf = 0;
      v13 = v12;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        goto LABEL_20;
      *(_WORD *)buf = 0;
      v13 = MEMORY[0x1E0C81028];
    }
    _os_log_impl(&dword_1DB697000, v13, OS_LOG_TYPE_DEFAULT, "resumeAllTapsFromQuiesced:no tap found", buf, 2u);
LABEL_20:
    if (glog_fd)
    {
      *(_QWORD *)&v18 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v29 = v18;
      v30 = v18;
      v27 = v18;
      v28 = v18;
      v25 = v18;
      v26 = v18;
      *(_OWORD *)buf = v18;
      v24 = v18;
      memset(&v22, 0, sizeof(v22));
      v21 = 0xAAAAAAAAAAAAAAAALL;
      time(&v21);
      localtime_r(&v21, &v22);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v22);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "resumeAllTapsFromQuiesced:no tap found");
    }
    goto LABEL_25;
  }
  v4 = Count;
  v5 = 8 * Count;
  v6 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
  if (!v6)
  {
    v14 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_23;
      *(_WORD *)buf = 0;
      v15 = v14;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_23;
      *(_WORD *)buf = 0;
      v15 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v15, OS_LOG_TYPE_ERROR, "resumeAllTapsFromQuiesced:Failed to malloc memory for keyArray", buf, 2u);
LABEL_23:
    if (glog_fd)
    {
      *(_QWORD *)&v19 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v29 = v19;
      v30 = v19;
      v27 = v19;
      v28 = v19;
      v25 = v19;
      v26 = v19;
      *(_OWORD *)buf = v19;
      v24 = v19;
      memset(&v22, 0, sizeof(v22));
      v21 = 0xAAAAAAAAAAAAAAAALL;
      time(&v21);
      localtime_r(&v21, &v22);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v22);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "resumeAllTapsFromQuiesced:Failed to malloc memory for keyArray");
    }
LABEL_25:
    pthread_mutex_unlock(v2);
    return;
  }
  v7 = v6;
  v8 = (const void **)malloc_type_malloc(v5, 0x80040B8603338uLL);
  if (v8)
  {
    v9 = v8;
    CFDictionaryGetKeysAndValues(this[7], v7, v8);
    if (v4 >= 1)
    {
      v10 = v9;
      do
      {
        v11 = (uint64_t)*v10++;
        (*(void (**)(uint64_t))(*(_QWORD *)v11 + 120))(v11);
        --v4;
      }
      while (v4);
    }
    pthread_mutex_unlock(v2);
    free(v7);
    free(v9);
    return;
  }
  v16 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v17 = v16;
LABEL_33:
      _os_log_error_impl(&dword_1DB697000, v17, OS_LOG_TYPE_ERROR, "resumeAllTapsFromQuiesced:Failed to malloc memory for valueArray", buf, 2u);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v17 = MEMORY[0x1E0C81028];
    goto LABEL_33;
  }
  if (glog_fd)
  {
    *(_QWORD *)&v20 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v29 = v20;
    v30 = v20;
    v27 = v20;
    v28 = v20;
    v25 = v20;
    v26 = v20;
    *(_OWORD *)buf = v20;
    v24 = v20;
    memset(&v22, 0, sizeof(v22));
    v21 = 0xAAAAAAAAAAAAAAAALL;
    time(&v21);
    localtime_r(&v21, &v22);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v22);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "resumeAllTapsFromQuiesced:Failed to malloc memory for valueArray");
  }
  pthread_mutex_unlock(v2);
  free(v7);
}

uint64_t CCSubmitLogToCrashTracer(const char *a1)
{
  const __CFAllocator *v2;
  const __CFUUID *v3;
  __CFString *v4;
  __CFString *v5;
  const char *v6;
  uint64_t (*v7)(const __CFString *, _QWORD);
  void *v8;
  void *v9;
  uint64_t (*v10)(const __CFString *, _QWORD);
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t (*v14)(const __CFString *, _QWORD);
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  const void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  uint64_t v28;
  void *v30;
  const char *v31;

  if (!a1 || !funcAddr(a1))
    return 0;
  v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v3 = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  v4 = (__CFString *)CFUUIDCreateString(v2, v3);
  v5 = v4;
  CFRelease(v3);
  v6 = (const char *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), a1);
  v7 = (uint64_t (*)(const __CFString *, _QWORD))__MGCopyAnswer(__CFString const*,__CFDictionary const*)::_dl_mgcopyanswer;
  v31 = v6;
  if (__MGCopyAnswer(__CFString const*,__CFDictionary const*)::_dl_mgcopyanswer
    || (v8 = funcAddr(v6),
        v7 = (uint64_t (*)(const __CFString *, _QWORD))v8,
        (__MGCopyAnswer(__CFString const*,__CFDictionary const*)::_dl_mgcopyanswer = v8) != 0))
  {
    v8 = (void *)v7(CFSTR("InverseDeviceID"), 0);
    v9 = v8;
    v10 = (uint64_t (*)(const __CFString *, _QWORD))__MGCopyAnswer(__CFString const*,__CFDictionary const*)::_dl_mgcopyanswer;
    if (__MGCopyAnswer(__CFString const*,__CFDictionary const*)::_dl_mgcopyanswer)
      goto LABEL_11;
  }
  else
  {
    v9 = 0;
  }
  v12 = funcAddr((const char *)v8);
  __MGCopyAnswer(__CFString const*,__CFDictionary const*)::_dl_mgcopyanswer = v12;
  if (v12)
  {
    v10 = (uint64_t (*)(const __CFString *, _QWORD))v12;
LABEL_11:
    v12 = (void *)v10(CFSTR("ProductType"), 0);
    v13 = v12;
    v14 = (uint64_t (*)(const __CFString *, _QWORD))__MGCopyAnswer(__CFString const*,__CFDictionary const*)::_dl_mgcopyanswer;
    if (__MGCopyAnswer(__CFString const*,__CFDictionary const*)::_dl_mgcopyanswer)
      goto LABEL_16;
    goto LABEL_14;
  }
  v13 = 0;
LABEL_14:
  v15 = funcAddr((const char *)v12);
  __MGCopyAnswer(__CFString const*,__CFDictionary const*)::_dl_mgcopyanswer = v15;
  if (!v15)
  {
    v30 = v9;
    v16 = 0;
    goto LABEL_17;
  }
  v14 = (uint64_t (*)(const __CFString *, _QWORD))v15;
LABEL_16:
  v30 = v9;
  v16 = v14(CFSTR("UniqueDeviceID"), 0);
LABEL_17:
  v17 = (void *)objc_opt_new();
  v18 = objc_msgSend(v17, "descriptionWithCalendarFormat:", CFSTR("%Y-%m-%d %H:%M:%S.%F %z"));
  v19 = (void *)MEMORY[0x1E0CB3940];
  v20 = (const void *)_CFCopySystemVersionDictionary();
  v21 = (id)CFMakeCollectable(v20);
  v22 = objc_msgSend(v21, "objectForKeyedSubscript:", *MEMORY[0x1E0C9ABB0]);
  v23 = objc_msgSend(v21, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AB98]);
  v24 = objc_msgSend(v21, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AB90]);
  v25 = CFSTR("???");
  if (v23)
    v26 = (const __CFString *)v23;
  else
    v26 = CFSTR("???");
  if (v22)
    v27 = (const __CFString *)v22;
  else
    v27 = CFSTR("???");
  if (v24)
    v25 = (const __CFString *)v24;
  v28 = objc_msgSend(v19, "stringWithFormat:", CFSTR("\nIncident Identifier:     %@\nCrashReporter Key:       %@\nHardware Model:          %@\nProcess:                 WiFi Firmware\nPath:                    NA\nIdentifier:              WiFi Firmware Trap\nVersion:                 NA\nCode Type:               ARM-32\nRole                     NA\nParent Process:          NA\nCoalition:               NA\n\n\nDate/Time:               %@\nLauch Time:              NA\nOS Version:              %@\nBaseband Version:        NA\nUDID:                    %@\nReport Version:          NA\n"), v4, v30, v13, v18, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@ (%@)"), v26, v27, v25), v16);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\n%@\n"), v28, v31);
  v11 = OSAWriteLogForSubmission();

  return v11;
}

void *funcAddr(const char *a1)
{
  void *result;
  char *v2;
  timespec v3;
  const char *v4;
  char v5[1024];
  stat v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  result = (void *)__loadMobileGestalt(void)::image;
  if (!__loadMobileGestalt(void)::image)
  {
    v2 = getenv("DYLD_IMAGE_SUFFIX");
    v3.tv_sec = 0xAAAAAAAAAAAAAAAALL;
    v3.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
    *(timespec *)&v6.st_blksize = v3;
    *(timespec *)v6.st_qspare = v3;
    v6.st_birthtimespec = v3;
    *(timespec *)&v6.st_size = v3;
    v6.st_mtimespec = v3;
    v6.st_ctimespec = v3;
    *(timespec *)&v6.st_uid = v3;
    v6.st_atimespec = v3;
    *(timespec *)&v6.st_dev = v3;
    memset(&v5[32], 170, 0x3E0uLL);
    if (!v2)
    {
      v4 = "/usr/lib/libMobileGestalt.dylib";
      goto LABEL_8;
    }
    strcpy(v5, "/usr/lib/libMobileGestalt.dylib");
    if (strlcat(v5, v2, 0x400uLL) >= 0x400)
      return 0;
    if ((stat(v5, &v6) & 0x80000000) == 0)
    {
      v4 = v5;
LABEL_8:
      result = dlopen(v4, 6);
      __loadMobileGestalt(void)::image = (uint64_t)result;
      if (!result)
        return result;
      return dlsym(result, "MGCopyAnswer");
    }
    result = (void *)__loadMobileGestalt(void)::image;
    if (!__loadMobileGestalt(void)::image)
      return result;
  }
  return dlsym(result, "MGCopyAnswer");
}

uint64_t ___Z24CCSubmitLogToCrashTracerPKci_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;

  v4 = objc_msgSend(*(id *)(a1 + 32), "UTF8String");
  return objc_msgSend(a2, "writeData:", objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v4, objc_msgSend(*(id *)(a1 + 40), "length") + *(int *)(a1 + 48)));
}

uint64_t CCSubmitBinaryToCrashTracer(uint64_t result)
{
  if (result)
    return OSAWriteLogForSubmission();
  return result;
}

uint64_t ___Z27CCSubmitBinaryToCrashTracerPKci_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "writeData:", objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", *(_QWORD *)(a1 + 32), *(int *)(a1 + 40)));
}

uint64_t getMaxPreservedCaptures(void)
{
  uint64_t v0;
  const __CFString *v1;
  const __CFString *v2;
  const __CFString *v3;
  const __CFString *v4;
  CFTypeID v5;
  CFIndex Length;
  char *v7;
  CFIndex v8;
  uint64_t v9;
  CFTypeID v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v0 = 50;
  v12[0] = 50;
  v1 = CFStringCreateWithCString(0, "com.apple.corecaptured", 0x8000100u);
  v2 = CFStringCreateWithCString(0, "max_preserved_captures", 0);
  v3 = (const __CFString *)CFPreferencesCopyAppValue(v2, v1);
  v4 = v3;
  if (v3)
  {
    v5 = CFGetTypeID(v3);
    if (v5 != CFStringGetTypeID())
    {
      v10 = CFGetTypeID(v4);
      if (v10 != CFNumberGetTypeID() || !CFNumberGetValue((CFNumberRef)v4, kCFNumberSInt64Type, v12))
      {
        v0 = 50;
        goto LABEL_16;
      }
      v9 = v12[0];
      goto LABEL_12;
    }
    Length = CFStringGetLength(v4);
    v7 = (char *)malloc_type_malloc(Length + 1, 0x2E636F62uLL);
    v8 = CFStringGetLength(v4);
    CFStringGetCString(v4, v7, v8 + 1, 0);
    v9 = strtoll(v7, 0, 10);
    if (!v9)
    {
      if (*__error() != 22 && *__error() != 34)
      {
        v9 = 0;
        if (!v7)
        {
LABEL_12:
          if (v9)
            v0 = v9;
          else
            v0 = 0x7FFFFFFFFFFFFFFFLL;
          goto LABEL_16;
        }
LABEL_8:
        free(v7);
        goto LABEL_12;
      }
      v9 = 50;
      v12[0] = 50;
    }
    if (!v7)
      goto LABEL_12;
    goto LABEL_8;
  }
LABEL_16:
  v12[0] = v0;
  if (v1)
    CFRelease(v1);
  if (v2)
    CFRelease(v2);
  if (v4)
    CFRelease(v4);
  return v12[0];
}

CFComparisonResult sortByDirectoryName(CFComparisonResult result, __CFString **a2)
{
  uint64_t v3;
  int v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  __CFString *v8;
  char v9;

  if (result >= 2)
  {
    v3 = 0;
    v4 = 0;
    v5 = 0;
    v6 = result - 1;
    do
    {
      while (1)
      {
        v7 = (v4 + 1);
        result = CFStringCompare(a2[v3], a2[v7], 0);
        if (result != kCFCompareGreaterThan)
          break;
        v8 = a2[v3];
        a2[v3] = a2[v7];
        a2[v7] = v8;
        if (v6 <= v7)
          v3 = 0;
        else
          v3 = (v4 + 1);
        if (v6 > v7)
          ++v4;
        else
          v4 = 0;
        v5 = v6 > v7;
      }
      v9 = (v6 > v7) | v5;
      if (v6 <= v7)
        v3 = 0;
      else
        v3 = (v4 + 1);
      if (v6 <= v7)
        v4 = 0;
      else
        ++v4;
      v5 &= v6 > v7;
    }
    while ((v9 & 1) != 0);
  }
  return result;
}

void cleanCaptureDirectory(const __CFString *a1)
{
  CFIndex Length;
  char *v3;
  CFIndex v4;
  DIR *v5;
  int64_t v6;
  dirent *v7;
  uint64_t MaxPreservedCaptures;
  uint64_t v9;
  __CFString **v10;
  CFIndex v11;
  char *v12;
  CFIndex v13;
  DIR *v14;
  int64_t v15;
  BOOL v16;
  const __CFAllocator *v17;
  dirent *v18;
  const char *d_name;
  __CFString *MutableCopy;
  uint64_t v21;
  NSObject *v22;
  __int128 v23;
  uint64_t v24;
  NSObject *v25;
  __int128 v26;
  __CFString **v27;
  __CFString *v28;
  CFTypeRef *v29;
  time_t v30;
  tm v31;
  _BYTE buf[32];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  Length = CFStringGetLength(a1);
  v3 = (char *)malloc_type_malloc(Length + 1, 0x1C588E77uLL);
  v4 = CFStringGetLength(a1);
  CFStringGetCString(a1, v3, v4 + 1, 0);
  v5 = opendir(v3);
  if (v3)
    free(v3);
  v6 = 0;
  if (v5)
  {
    while (1)
    {
      v7 = readdir(v5);
      if (!v7)
        break;
      if (v7->d_name[0] != 46)
        ++v6;
    }
    closedir(v5);
  }
  MaxPreservedCaptures = getMaxPreservedCaptures();
  if (!v6)
    return;
  v9 = v6 - MaxPreservedCaptures;
  if (v6 < MaxPreservedCaptures)
    return;
  v10 = (__CFString **)malloc_type_calloc(v6, 8uLL, 0x2004093837F09uLL);
  v11 = CFStringGetLength(a1);
  v12 = (char *)malloc_type_malloc(v11 + 1, 0xEC36869CuLL);
  v13 = CFStringGetLength(a1);
  CFStringGetCString(a1, v12, v13 + 1, 0);
  v14 = opendir(v12);
  if (v12)
    free(v12);
  v15 = 0;
  if (v14)
  {
    v16 = v6 > 0;
    v17 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    while (1)
    {
      v18 = readdir(v14);
      if (v18 == 0 || !v16)
        break;
      if (v18->d_name[0] != 46)
      {
        d_name = v18->d_name;
        MutableCopy = CFStringCreateMutableCopy(v17, 512, a1);
        CFStringAppendCString(MutableCopy, "/", 0);
        CFStringAppendCString(MutableCopy, d_name, 0);
        v10[v15++] = MutableCopy;
        v16 = v15 < v6;
      }
    }
    closedir(v14);
  }
  v21 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_25;
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v15;
    v22 = v21;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_25;
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v15;
    v22 = MEMORY[0x1E0C81028];
  }
  _os_log_impl(&dword_1DB697000, v22, OS_LOG_TYPE_DEFAULT, "numberOfDirArrayEntries: %lld, readIndex %lld\n", buf, 0x16u);
LABEL_25:
  if (glog_fd)
  {
    *(_QWORD *)&v23 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v23 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v37 = v23;
    v38 = v23;
    v35 = v23;
    v36 = v23;
    v33 = v23;
    v34 = v23;
    *(_OWORD *)buf = v23;
    *(_OWORD *)&buf[16] = v23;
    memset(&v31, 0, sizeof(v31));
    v30 = 0xAAAAAAAAAAAAAAAALL;
    time(&v30);
    localtime_r(&v30, &v31);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v31);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "numberOfDirArrayEntries: %lld, readIndex %lld\n", v6, v15);
  }
  if (v6 != v15)
  {
    v24 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
        goto LABEL_35;
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = v6;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v15;
      v25 = v24;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        goto LABEL_35;
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = v6;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v15;
      v25 = MEMORY[0x1E0C81028];
    }
    _os_log_impl(&dword_1DB697000, v25, OS_LOG_TYPE_DEFAULT, "Incorrect number [numberOfDirArrayEntries: %lld, readIndex %lld] of directory entries. Skip sorting.\n", buf, 0x16u);
LABEL_35:
    if (glog_fd)
    {
      *(_QWORD *)&v26 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v26 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v37 = v26;
      v38 = v26;
      v35 = v26;
      v36 = v26;
      v33 = v26;
      v34 = v26;
      *(_OWORD *)buf = v26;
      *(_OWORD *)&buf[16] = v26;
      memset(&v31, 0, sizeof(v31));
      v30 = 0xAAAAAAAAAAAAAAAALL;
      time(&v30);
      localtime_r(&v30, &v31);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v31);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "Incorrect number [numberOfDirArrayEntries: %lld, readIndex %lld] of directory entries. Skip sorting.\n", v6, v15);
    }
    goto LABEL_37;
  }
  sortByDirectoryName((CFComparisonResult)v6, v10);
LABEL_37:
  if (v9 >= 1)
  {
    v27 = v10;
    do
    {
      v28 = *v27++;
      deleteDirectory(v28);
      --v9;
    }
    while (v9);
  }
  if (v15)
  {
    v29 = (CFTypeRef *)v10;
    do
    {
      if (*v29)
        CFRelease(*v29);
      *v29++ = 0;
      --v15;
    }
    while (v15);
  }
  else if (!v10)
  {
    return;
  }
  free(v10);
}

void pruneDirectoryOnOSUpgrade(void)
{
  const __CFString *v0;
  const __CFString *v1;
  const __CFString *v2;
  const __CFString *v3;
  BOOL v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  CFTypeID v9;
  CFIndex Length;
  _BOOL4 v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  __int128 v16;
  uint64_t v17;
  NSObject *v18;
  __int128 v19;
  __int128 v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  const __CFAllocator *v24;
  char v25;
  char v26;
  __CFString *Mutable;
  const char *v28;
  uint64_t v29;
  NSObject *v30;
  __int128 v31;
  const __CFString *v32;
  const __CFString *v33;
  CFStringRef v34;
  uint64_t v35;
  NSObject *v36;
  __int128 v37;
  time_t v38;
  tm v39;
  time_t v40[2];
  _BYTE buf[32];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _OWORD buffer[2];
  _OWORD __s1[2];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  memset(__s1, 0, sizeof(__s1));
  memset(buffer, 0, sizeof(buffer));
  v0 = CFStringCreateWithCString(0, "com.apple.corecaptured", 0x8000100u);
  v1 = CFStringCreateWithCString(0, "prune_dir_os_upgrade_ctl", 0);
  v2 = (const __CFString *)CFPreferencesCopyAppValue(v1, v0);
  v3 = v2;
  if (v2)
  {
    v4 = CFStringCompare(v2, CFSTR("disable"), 0) != kCFCompareEqualTo;
    if (!v0)
      goto LABEL_4;
    goto LABEL_3;
  }
  v4 = 1;
  if (v0)
LABEL_3:
    CFRelease(v0);
LABEL_4:
  if (v1)
    CFRelease(v1);
  if (v3)
    CFRelease(v3);
  if (!v4)
  {
    v12 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
        goto LABEL_25;
      *(_WORD *)buf = 0;
      v13 = v12;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        goto LABEL_25;
      *(_WORD *)buf = 0;
      v13 = MEMORY[0x1E0C81028];
    }
    _os_log_impl(&dword_1DB697000, v13, OS_LOG_TYPE_DEFAULT, "pruneDirectoryOnOSUpgrade: activity disabled\n", buf, 2u);
LABEL_25:
    if (glog_fd)
    {
      *(_QWORD *)&v16 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v46 = v16;
      v47 = v16;
      v44 = v16;
      v45 = v16;
      v43 = v16;
      *(_OWORD *)&buf[16] = v16;
      v42 = v16;
      *(_OWORD *)buf = v16;
      memset(&v39, 0, sizeof(v39));
      v40[0] = 0xAAAAAAAAAAAAAAAALL;
      time(v40);
      localtime_r(v40, &v39);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v39);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "pruneDirectoryOnOSUpgrade: activity disabled\n");
    }
    return;
  }
  if (!getOsVersion((char *)__s1))
  {
    v14 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_39;
      *(_WORD *)buf = 0;
      v15 = v14;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_39;
      *(_WORD *)buf = 0;
      v15 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v15, OS_LOG_TYPE_ERROR, "pruneDirectoryOnOSUpgrade: activity enabled; failed to get osversion\n",
      buf,
      2u);
LABEL_39:
    if (glog_fd)
    {
      *(_QWORD *)&v19 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v46 = v19;
      v47 = v19;
      v44 = v19;
      v45 = v19;
      v43 = v19;
      *(_OWORD *)&buf[16] = v19;
      v42 = v19;
      *(_OWORD *)buf = v19;
      memset(&v39, 0, sizeof(v39));
      v40[0] = 0xAAAAAAAAAAAAAAAALL;
      time(v40);
      localtime_r(v40, &v39);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v39);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "pruneDirectoryOnOSUpgrade: activity enabled; failed to get osversion\n");
    }
    return;
  }
  v5 = CFStringCreateWithCString(0, "com.apple.corecaptured", 0x8000100u);
  v6 = CFStringCreateWithCString(0, "prune_dir_os_upgrade_snapshot", 0);
  v7 = (const __CFString *)CFPreferencesCopyAppValue(v6, v5);
  v8 = v7;
  if (!v7 || (v9 = CFGetTypeID(v7), v9 != CFStringGetTypeID()))
  {
    v11 = 0;
    if (!v5)
      goto LABEL_29;
    goto LABEL_28;
  }
  Length = CFStringGetLength(v8);
  v11 = CFStringGetCString(v8, (char *)buffer, Length + 1, 0) != 0;
  if (v5)
LABEL_28:
    CFRelease(v5);
LABEL_29:
  if (v6)
    CFRelease(v6);
  if (v8)
    CFRelease(v8);
  if (!v11 || strcmp((const char *)__s1, (const char *)buffer) >= 1)
  {
    v17 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = buffer;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = __s1;
        v18 = v17;
LABEL_43:
        _os_log_impl(&dword_1DB697000, v18, OS_LOG_TYPE_DEFAULT, "pruneDirectoryOnOSUpgrade: activity enabled; upgraded from %s to %s\n",
          buf,
          0x16u);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = buffer;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = __s1;
      v18 = MEMORY[0x1E0C81028];
      goto LABEL_43;
    }
    if (glog_fd)
    {
      *(_QWORD *)&v20 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v46 = v20;
      v47 = v20;
      v44 = v20;
      v45 = v20;
      v43 = v20;
      *(_OWORD *)&buf[16] = v20;
      v42 = v20;
      *(_OWORD *)buf = v20;
      memset(&v39, 0, sizeof(v39));
      v40[0] = 0xAAAAAAAAAAAAAAAALL;
      time(v40);
      localtime_r(v40, &v39);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v39);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "pruneDirectoryOnOSUpgrade: activity enabled; upgraded from %s to %s\n",
        (const char *)buffer,
        (const char *)__s1);
    }
    if ((isSeedAndiOS() & (CCProfileMonitor::fProfileLoaded == 0)) != 0)
      v21 = "/Library/Logs/CoreCapture";
    else
      v21 = "/Library/Logs/CrashReporter/CoreCapture";
    v40[0] = (time_t)v21;
    v22 = 0;
    if ((isSeedAndiOS() & (CCProfileMonitor::fProfileLoaded == 0)) != 0)
      v23 = "/Library/Logs/CrashReporter/CoreCapture";
    else
      v23 = "/Library/Logs/CoreCapture";
    v40[1] = (time_t)v23;
    v24 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v25 = 1;
    while (1)
    {
      v26 = v25;
      Mutable = CFStringCreateMutable(v24, 512);
      v28 = (const char *)v40[v22];
      CFStringAppendCString(Mutable, v28, 0);
      v29 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)&buf[4] = v28;
          v30 = v29;
LABEL_58:
          _os_log_impl(&dword_1DB697000, v30, OS_LOG_TYPE_DEFAULT, "pruneDirectoryOnOSUpgrade %s\n", buf, 0xCu);
        }
      }
      else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = v28;
        v30 = MEMORY[0x1E0C81028];
        goto LABEL_58;
      }
      if (glog_fd)
      {
        *(_QWORD *)&v31 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v31 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v46 = v31;
        v47 = v31;
        v44 = v31;
        v45 = v31;
        v43 = v31;
        *(_OWORD *)&buf[16] = v31;
        v42 = v31;
        *(_OWORD *)buf = v31;
        memset(&v39, 0, sizeof(v39));
        v38 = 0xAAAAAAAAAAAAAAAALL;
        time(&v38);
        localtime_r(&v38, &v39);
        strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v39);
        dprintf(glog_fd, "%s ", buf);
        dprintf(glog_fd, "pruneDirectoryOnOSUpgrade %s\n", v28);
      }
      deleteDirectory(Mutable);
      if (Mutable)
        CFRelease(Mutable);
      v25 = 0;
      v22 = 1;
      if ((v26 & 1) == 0)
        goto LABEL_64;
    }
  }
  v35 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = buffer;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = __s1;
      v36 = v35;
LABEL_76:
      _os_log_impl(&dword_1DB697000, v36, OS_LOG_TYPE_DEFAULT, "pruneDirectoryOnOSUpgrade: activity enabled; snapshot %s, osversion %s\n",
        buf,
        0x16u);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = buffer;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = __s1;
    v36 = MEMORY[0x1E0C81028];
    goto LABEL_76;
  }
  if (glog_fd)
  {
    *(_QWORD *)&v37 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v37 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v46 = v37;
    v47 = v37;
    v44 = v37;
    v45 = v37;
    v43 = v37;
    *(_OWORD *)&buf[16] = v37;
    v42 = v37;
    *(_OWORD *)buf = v37;
    memset(&v39, 0, sizeof(v39));
    v40[0] = 0xAAAAAAAAAAAAAAAALL;
    time(v40);
    localtime_r(v40, &v39);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v39);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "pruneDirectoryOnOSUpgrade: activity enabled; snapshot %s, osversion %s\n",
      (const char *)buffer,
      (const char *)__s1);
  }
LABEL_64:
  v32 = CFStringCreateWithCString(0, "com.apple.corecaptured", 0x8000100u);
  v33 = CFStringCreateWithCString(0, "prune_dir_os_upgrade_snapshot", 0);
  v34 = CFStringCreateWithCString(0, (const char *)__s1, 0);
  CFPreferencesSetAppValue(v33, v34, v32);
  CFPreferencesAppSynchronize(v32);
  if (v32)
    CFRelease(v32);
  if (v33)
    CFRelease(v33);
  if (v34)
    CFRelease(v34);
}

const char *getSaveLocation(void)
{
  if ((isSeedAndiOS() & (CCProfileMonitor::fProfileLoaded == 0)) != 0)
    return "/Library/Logs/CoreCapture";
  else
    return "/Library/Logs/CrashReporter/CoreCapture";
}

const char *getPossibleSaveLocation(void)
{
  if ((isSeedAndiOS() & (CCProfileMonitor::fProfileLoaded == 0)) != 0)
    return "/Library/Logs/CrashReporter/CoreCapture";
  else
    return "/Library/Logs/CoreCapture";
}

void lowPriorityActivities(void)
{
  time_t v0;
  uint64_t v1;
  const __CFString *v2;
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  CFTypeID v6;
  CFIndex Length;
  char *v8;
  CFIndex v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  __int128 v13;
  uint64_t v14;
  NSObject *v15;
  __int128 v16;
  const char *v17;
  const char *v18;
  time_t v19;
  tm v20;
  uint8_t buf[16];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v0 = time(0);
  if (isSeedAndiOS())
    v1 = 1;
  else
    v1 = 7;
  v2 = CFStringCreateWithCString(0, "com.apple.corecaptured", 0x8000100u);
  v3 = CFStringCreateWithCString(0, "prune_dir_days", 0);
  v4 = (const __CFString *)CFPreferencesCopyAppValue(v3, v2);
  v5 = v4;
  if (v4)
  {
    v6 = CFGetTypeID(v4);
    if (v6 == CFStringGetTypeID())
    {
      Length = CFStringGetLength(v5);
      v8 = (char *)malloc_type_malloc(Length + 1, 0xB3C15625uLL);
      v9 = CFStringGetLength(v5);
      CFStringGetCString(v5, v8, v9 + 1, 0);
      v10 = strtol(v8, 0, 10);
      if (v8)
        free(v8);
      if (*__error() != 22)
        goto LABEL_16;
      v11 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          v12 = v11;
LABEL_41:
          _os_log_error_impl(&dword_1DB697000, v12, OS_LOG_TYPE_ERROR, "pruneDirectoryNDaysRead strtol EINVAL\n", buf, 2u);
        }
      }
      else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v12 = MEMORY[0x1E0C81028];
        goto LABEL_41;
      }
      if (glog_fd)
      {
        *(_QWORD *)&v13 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v27 = v13;
        v28 = v13;
        v25 = v13;
        v26 = v13;
        v23 = v13;
        v24 = v13;
        *(_OWORD *)buf = v13;
        v22 = v13;
        memset(&v20, 0, sizeof(v20));
        v19 = 0xAAAAAAAAAAAAAAAALL;
        time(&v19);
        localtime_r(&v19, &v20);
        strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v20);
        dprintf(glog_fd, "%s ", (const char *)buf);
        dprintf(glog_fd, "pruneDirectoryNDaysRead strtol EINVAL\n");
      }
      v10 = 7;
LABEL_16:
      v1 = v10 & ~(v10 >> 63);
    }
  }
  if (v2)
    CFRelease(v2);
  if (v3)
    CFRelease(v3);
  if (v5)
    CFRelease(v5);
  v14 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_29;
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v1;
    v15 = v14;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_29;
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v1;
    v15 = MEMORY[0x1E0C81028];
  }
  _os_log_impl(&dword_1DB697000, v15, OS_LOG_TYPE_DEFAULT, "pruneDirectoryNDaysRead cap %ld\n", buf, 0xCu);
LABEL_29:
  if (glog_fd)
  {
    *(_QWORD *)&v16 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v27 = v16;
    v28 = v16;
    v25 = v16;
    v26 = v16;
    v23 = v16;
    v24 = v16;
    *(_OWORD *)buf = v16;
    v22 = v16;
    memset(&v20, 0, sizeof(v20));
    v19 = 0xAAAAAAAAAAAAAAAALL;
    time(&v19);
    localtime_r(&v19, &v20);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v20);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "pruneDirectoryNDaysRead cap %ld\n", v1);
  }
  if (v1)
  {
    if ((isSeedAndiOS() & (CCProfileMonitor::fProfileLoaded == 0)) != 0)
      v17 = "/Library/Logs/CoreCapture";
    else
      v17 = "/Library/Logs/CrashReporter/CoreCapture";
    pruneDirectoryNDaysDo(v17, 1, v0, v1);
    if ((isSeedAndiOS() & (CCProfileMonitor::fProfileLoaded == 0)) != 0)
      v18 = "/Library/Logs/CrashReporter/CoreCapture";
    else
      v18 = "/Library/Logs/CoreCapture";
    pruneDirectoryNDaysDo(v18, 1, v0, v1);
  }
}

void writeMetadataFiles(const __CFString *a1, const char *a2, time_t a3, uint64_t a4)
{
  char *v8;
  char *v9;
  const char *v10;
  CFIndex Length;
  char *v12;
  CFIndex v13;
  uint64_t v14;
  NSObject *v15;
  char *v16;
  timespec v17;
  uint64_t i;
  const __CFAllocator *v19;
  __CFDictionary *Mutable;
  CFNumberRef v21;
  CFNumberRef v22;
  tm *v23;
  char *v24;
  const char *v25;
  char *v26;
  CFStringRef v27;
  const __CFString *v28;
  const __CFURL *v29;
  __CFReadStream *v30;
  __CFReadStream *v31;
  const __CFDictionary *v32;
  const void *Value;
  const void *v34;
  CFTypeID v35;
  const __CFUUID *v36;
  CFStringRef v37;
  const __CFString *v38;
  CFMutableStringRef MutableCopy;
  __int128 v40;
  uint64_t v41;
  int *v42;
  char *v43;
  NSObject *v44;
  uint64_t v45;
  NSObject *v46;
  timespec v47;
  __int128 v48;
  timespec v49;
  int v50;
  int *v51;
  char *v52;
  __int128 v53;
  __CFDictionary *v54;
  CFStringRef v55;
  CFStringRef v56;
  const __CFString *v57;
  CFMutableStringRef v58;
  int *v59;
  char *v60;
  time_t v61;
  tm v62;
  time_t v63;
  size_t v64;
  tm valuePtr;
  _BYTE v66[64];
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  stat v71;
  time_t v72[2];

  v72[1] = *MEMORY[0x1E0C80C00];
  v8 = (char *)malloc_type_malloc(0x200uLL, 0x83E60817uLL);
  if (!v8)
  {
    v14 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_62;
      LOWORD(v71.st_dev) = 0;
      v15 = v14;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_62;
      LOWORD(v71.st_dev) = 0;
      v15 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v15, OS_LOG_TYPE_ERROR, "CCFile::writeMetadataFiles failed malloc\n", (uint8_t *)&v71, 2u);
LABEL_62:
    if (glog_fd)
    {
      v47.tv_sec = 0xAAAAAAAAAAAAAAAALL;
      v47.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
      *(timespec *)&v71.st_size = v47;
      *(timespec *)&v71.st_blksize = v47;
      v71.st_ctimespec = v47;
      v71.st_birthtimespec = v47;
      v71.st_atimespec = v47;
      v71.st_mtimespec = v47;
      *(timespec *)&v71.st_dev = v47;
      *(timespec *)&v71.st_uid = v47;
      memset(v66, 0, 56);
      *(_QWORD *)&valuePtr.tm_sec = 0xAAAAAAAAAAAAAAAALL;
      time((time_t *)&valuePtr.tm_sec);
      localtime_r((const time_t *)&valuePtr.tm_sec, (tm *)v66);
      strftime((char *)&v71, 0x80uLL, "%b %d %H:%M:%S", (const tm *)v66);
      dprintf(glog_fd, "%s ", (const char *)&v71);
      dprintf(glog_fd, "CCFile::writeMetadataFiles failed malloc\n");
    }
    return;
  }
  v9 = v8;
  memset(&v62, 0, sizeof(v62));
  v61 = a3;
  localtime_r(&v61, &v62);
  if ((isSeedAndiOS() & (CCProfileMonitor::fProfileLoaded == 0)) != 0)
    v10 = "/Library/Logs/CoreCapture";
  else
    v10 = "/Library/Logs/CrashReporter/CoreCapture";
  if (CFStringGetLength(a1))
  {
    Length = CFStringGetLength(a1);
    v12 = (char *)malloc_type_malloc(Length + 1, 0x6D3BC9F3uLL);
    v13 = CFStringGetLength(a1);
    CFStringGetCString(a1, v12, v13 + 1, 0);
    snprintf(v9, 0x200uLL, "%s/%s/[%04d-%02d-%02d_%02d,%02d,%02d.%06llu]=%s/%s", v10, v12, v62.tm_year + 1900, v62.tm_mon + 1, v62.tm_mday, v62.tm_hour, v62.tm_min, v62.tm_sec, a4, a2, "Metadata");
    if (v12)
      free(v12);
  }
  else
  {
    snprintf(v9, 0x200uLL, "%s/[%04d-%02d-%02d_%02d,%02d,%02d.%06llu]=%s/%s", v10, v62.tm_year + 1900, v62.tm_mon + 1, v62.tm_mday, v62.tm_hour, v62.tm_min, v62.tm_sec, a4, a2, "Metadata");
  }
  v16 = strdup(v9);
  v17.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v17.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v71.st_blksize = v17;
  *(timespec *)v71.st_qspare = v17;
  v71.st_birthtimespec = v17;
  *(timespec *)&v71.st_size = v17;
  v71.st_mtimespec = v17;
  v71.st_ctimespec = v17;
  *(timespec *)&v71.st_uid = v17;
  v71.st_atimespec = v17;
  *(timespec *)&v71.st_dev = v17;
  for (i = *v16 == 47; v16[i] != 47; ++i)
  {
    if (!v16[i])
    {
      free(v16);
      if (mkdir(v9, 0x1EDu))
        goto LABEL_81;
      *(_QWORD *)&valuePtr.tm_sec = a3;
      *(_QWORD *)&valuePtr.tm_hour = a4;
      v19 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      v21 = CFNumberCreate(v19, kCFNumberSInt64Type, &valuePtr);
      CFDictionarySetValue(Mutable, CFSTR("Time secs"), v21);
      if (v21)
        CFRelease(v21);
      v22 = CFNumberCreate(v19, kCFNumberSInt64Type, &valuePtr.tm_hour);
      CFDictionarySetValue(Mutable, CFSTR("Time usecs"), v22);
      if (v22)
        CFRelease(v22);
      memset(&v71, 0, 80);
      memset(v66, 0, 56);
      v23 = localtime_r((const time_t *)&valuePtr.tm_sec, (tm *)v66);
      v24 = asctime(v23);
      if (v24)
      {
        v25 = v24;
        v26 = strchr(v24, 10);
        if (v26)
          *v26 = 0;
        strlcpy((char *)&v71, v25, 0x50uLL);
      }
      v27 = CFStringCreateWithCString(0, (const char *)&v71, 0);
      CFDictionarySetValue(Mutable, CFSTR("Time localtime"), v27);
      if (v27)
        CFRelease(v27);
      v28 = CFStringCreateWithCString(0, "/System/Library/Extensions/corecapture.kext/Contents/version.plist", 0);
      v29 = CFURLCreateWithFileSystemPath(v19, v28, kCFURLPOSIXPathStyle, 0);
      v30 = CFReadStreamCreateWithFile(v19, v29);
      if (v30)
      {
        v31 = v30;
        v32 = CFReadStreamOpen(v30)
            ? (const __CFDictionary *)CFPropertyListCreateWithStream(v19, v31, 0, 2uLL, 0, 0)
            : 0;
        CFReadStreamClose(v31);
        CFRelease(v31);
        if (v32)
        {
          Value = CFDictionaryGetValue(v32, CFSTR("SourceVersion"));
          if (Value)
          {
            v34 = Value;
            v35 = CFGetTypeID(Value);
            if (v35 == CFStringGetTypeID())
              CFDictionarySetValue(Mutable, CFSTR("SourceVersion"), v34);
          }
          CFRelease(v32);
        }
      }
      if (v29)
        CFRelease(v29);
      if (v28)
        CFRelease(v28);
      v36 = CFUUIDCreate(0);
      v37 = CFUUIDCreateString(0, v36);
      CFDictionarySetValue(Mutable, CFSTR("UUID"), v37);
      if (v37)
        CFRelease(v37);
      if (v36)
        CFRelease(v36);
      v38 = CFStringCreateWithCString(0, v9, 0);
      MutableCopy = CFStringCreateMutableCopy(v19, 512, v38);
      CFStringAppendCString(MutableCopy, "/", 0);
      CFStringAppendCString(MutableCopy, "capture.plist", 0);
      writeMetadataFile(Mutable, MutableCopy);
      if (Mutable)
        CFRelease(Mutable);
      if (v38)
        CFRelease(v38);
      if (MutableCopy)
        CFRelease(MutableCopy);
      *(_QWORD *)&valuePtr.tm_isdst = 0xAAAAAAAAAAAAAAAALL;
      *(_QWORD *)&v40 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v40 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)&valuePtr.tm_sec = v40;
      *(_OWORD *)&valuePtr.tm_mon = v40;
      v72[0] = 0x200000006;
      v64 = 40;
      if (!sysctl((int *)v72, 2u, &valuePtr, &v64, 0, 0))
        goto LABEL_71;
      v41 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
          goto LABEL_69;
        v42 = __error();
        v43 = strerror(*v42);
        v71.st_dev = 136315138;
        *(_QWORD *)&v71.st_mode = v43;
        v44 = v41;
      }
      else
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_69;
        v59 = __error();
        v60 = strerror(*v59);
        v71.st_dev = 136315138;
        *(_QWORD *)&v71.st_mode = v60;
        v44 = MEMORY[0x1E0C81028];
      }
      _os_log_error_impl(&dword_1DB697000, v44, OS_LOG_TYPE_ERROR, "getHwModel %s\n", (uint8_t *)&v71, 0xCu);
LABEL_69:
      if (glog_fd)
      {
        v49.tv_sec = 0xAAAAAAAAAAAAAAAALL;
        v49.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
        *(timespec *)&v71.st_size = v49;
        *(timespec *)&v71.st_blksize = v49;
        v71.st_ctimespec = v49;
        v71.st_birthtimespec = v49;
        v71.st_atimespec = v49;
        v71.st_mtimespec = v49;
        *(timespec *)&v71.st_dev = v49;
        *(timespec *)&v71.st_uid = v49;
        memset(v66, 0, 56);
        v63 = 0xAAAAAAAAAAAAAAAALL;
        time(&v63);
        localtime_r(&v63, (tm *)v66);
        strftime((char *)&v71, 0x80uLL, "%b %d %H:%M:%S", (const tm *)v66);
        dprintf(glog_fd, "%s ", (const char *)&v71);
        v50 = glog_fd;
        v51 = __error();
        v52 = strerror(*v51);
        dprintf(v50, "getHwModel %s\n", v52);
      }
LABEL_71:
      *(_QWORD *)&v53 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v53 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)&v71.st_dev = v53;
      *(_OWORD *)&v71.st_uid = v53;
      getOsVersion((char *)&v71);
      v54 = CFDictionaryCreateMutable(v19, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      v55 = CFStringCreateWithCString(0, (const char *)&valuePtr, 0);
      CFDictionarySetValue(v54, CFSTR("hw.model"), v55);
      if (v55)
        CFRelease(v55);
      v56 = CFStringCreateWithCString(0, (const char *)&v71, 0);
      CFDictionarySetValue(v54, CFSTR("osversion"), v56);
      if (v56)
        CFRelease(v56);
      v57 = CFStringCreateWithCString(0, v9, 0);
      v58 = CFStringCreateMutableCopy(v19, 512, v57);
      CFStringAppendCString(v58, "/", 0);
      CFStringAppendCString(v58, "system.plist", 0);
      writeMetadataFile(v54, v58);
      if (v54)
        CFRelease(v54);
      if (v57)
        CFRelease(v57);
      if (v58)
        CFRelease(v58);
      goto LABEL_81;
    }
LABEL_20:
    ;
  }
  v16[i] = 0;
  if (stat(v16, &v71))
  {
    mkdir(v16, 0x1EDu);
LABEL_19:
    v16[i] = 47;
    goto LABEL_20;
  }
  if ((v71.st_mode & 0xF000) == 0x4000)
    goto LABEL_19;
  v45 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v66 = 136315394;
      *(_QWORD *)&v66[4] = v9;
      *(_WORD *)&v66[12] = 2080;
      *(_QWORD *)&v66[14] = v16;
      v46 = v45;
      goto LABEL_86;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v66 = 136315394;
    *(_QWORD *)&v66[4] = v9;
    *(_WORD *)&v66[12] = 2080;
    *(_QWORD *)&v66[14] = v16;
    v46 = MEMORY[0x1E0C81028];
LABEL_86:
    _os_log_error_impl(&dword_1DB697000, v46, OS_LOG_TYPE_ERROR, "CCFile::mkpath fails to create path '%s' as '%s' is not a directory\n", v66, 0x16u);
  }
  if (glog_fd)
  {
    *(_QWORD *)&v48 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v48 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v69 = v48;
    v70 = v48;
    v67 = v48;
    v68 = v48;
    *(_OWORD *)&v66[32] = v48;
    *(_OWORD *)&v66[48] = v48;
    *(_OWORD *)v66 = v48;
    *(_OWORD *)&v66[16] = v48;
    memset(&valuePtr, 0, sizeof(valuePtr));
    v72[0] = 0xAAAAAAAAAAAAAAAALL;
    time(v72);
    localtime_r(v72, &valuePtr);
    strftime(v66, 0x80uLL, "%b %d %H:%M:%S", &valuePtr);
    dprintf(glog_fd, "%s ", v66);
    dprintf(glog_fd, "CCFile::mkpath fails to create path '%s' as '%s' is not a directory\n", v9, v16);
  }
  free(v16);
LABEL_81:
  free(v9);
}

void writeMetadataFile(const __CFDictionary *a1, CFStringRef theString)
{
  const __CFAllocator *v4;
  const __CFURL *v5;
  __CFWriteStream *v6;
  __CFWriteStream *v7;

  if (ifSeedCreateClassCProtectedFileAtCFStringPath(theString))
  {
    v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v5 = CFURLCreateWithFileSystemPath((CFAllocatorRef)*MEMORY[0x1E0C9AE00], theString, kCFURLPOSIXPathStyle, 0);
    v6 = CFWriteStreamCreateWithFile(v4, v5);
    v7 = v6;
    if (v6 && CFWriteStreamOpen(v6))
      CFPropertyListWrite(a1, v7, kCFPropertyListXMLFormat_v1_0, 0, 0);
    if (v5)
      CFRelease(v5);
    if (v7)
    {
      CFWriteStreamClose(v7);
      CFRelease(v7);
    }
  }
}

const __CFString *ifSeedCreateClassCProtectedFileAtCFStringPath(CFStringRef theString)
{
  const __CFString *ClassCProtectedFile;
  CFIndex Length;
  std::__fs::filesystem::path *v3;
  CFIndex v4;

  ClassCProtectedFile = theString;
  if (theString)
  {
    Length = CFStringGetLength(theString);
    v3 = (std::__fs::filesystem::path *)malloc_type_malloc(Length + 1, 0x6B1CED1CuLL);
    v4 = CFStringGetLength(ClassCProtectedFile);
    if (!CFStringGetCString(ClassCProtectedFile, (char *)v3, v4 + 1, 0))
    {
      ClassCProtectedFile = 0;
      if (!v3)
        return ClassCProtectedFile;
      goto LABEL_4;
    }
    ClassCProtectedFile = (const __CFString *)ifSeedCreateClassCProtectedFile(v3);
    if (v3)
LABEL_4:
      free(v3);
  }
  return ClassCProtectedFile;
}

uint64_t ifSeedCreateClassCProtectedFile(const std::__fs::filesystem::path *a1)
{
  uint64_t v2;
  std::error_code *v3;
  std::error_code *v4;
  int v5;
  uint64_t result;
  int v7;

  v2 = isSeedAndiOS();
  if (!(_DWORD)v2)
    return 1;
  v5 = deviceUnlockedSinceBoot(v2, v3);
  result = 0;
  if (a1 && v5)
  {
    remove(a1, v4);
    v7 = open_dprotected_np((const char *)a1, 1538, 3, 0, 420);
    if (v7 < 1)
      return 0;
    close(v7);
    return 1;
  }
  return result;
}

uint64_t deviceUnlockedSinceBoot(uint64_t a1, std::error_code *a2)
{
  int v3;
  int v4;
  std::error_code *v5;

  if ((deviceUnlockedSinceBoot(void)::deviceUnlockedOnce & 1) != 0)
    return 1;
  remove((const std::__fs::filesystem::path *)"/tmp/cc.locktest", a2);
  v3 = open_dprotected_np("/tmp/cc.locktest", 1538, 3, 0, 420);
  if (v3 < 1)
    return 0;
  v4 = v3;
  if (write(v3, "/tmp/cc.locktest", 0x11uLL) == 17)
    deviceUnlockedSinceBoot(void)::deviceUnlockedOnce = 1;
  close(v4);
  remove((const std::__fs::filesystem::path *)"/tmp/cc.locktest", v5);
  return deviceUnlockedSinceBoot(void)::deviceUnlockedOnce;
}

uint64_t validCFObjectReference(const char *a1, CFTypeRef cf, uint64_t a3)
{
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  __int128 v11;
  __int128 v12;
  int v13;
  time_t v14;
  tm v15;
  _BYTE buf[32];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (!cf)
  {
    v7 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_11;
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = a1;
      v8 = v7;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_11;
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = a1;
      v8 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v8, OS_LOG_TYPE_ERROR, "%s NULL value.\n", buf, 0xCu);
LABEL_11:
    if (glog_fd)
    {
      *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v21 = v11;
      v22 = v11;
      v19 = v11;
      v20 = v11;
      v17 = v11;
      v18 = v11;
      *(_OWORD *)buf = v11;
      *(_OWORD *)&buf[16] = v11;
      memset(&v15, 0, sizeof(v15));
      v14 = 0xAAAAAAAAAAAAAAAALL;
      time(&v14);
      localtime_r(&v14, &v15);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v15);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "%s NULL value.\n");
    }
    return 0;
  }
  if (CFGetTypeID(cf) == a3)
    return 1;
  v9 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = a1;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = a3;
    *(_WORD *)&buf[22] = 2048;
    *(_QWORD *)&buf[24] = CFGetTypeID(cf);
    v10 = v9;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = a1;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = a3;
    *(_WORD *)&buf[22] = 2048;
    *(_QWORD *)&buf[24] = CFGetTypeID(cf);
    v10 = MEMORY[0x1E0C81028];
  }
  _os_log_error_impl(&dword_1DB697000, v10, OS_LOG_TYPE_ERROR, "%s Unexpected CF object type ID. Expected (%lu), have (%lu) \n", buf, 0x20u);
LABEL_14:
  if (glog_fd)
  {
    *(_QWORD *)&v12 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v21 = v12;
    v22 = v12;
    v19 = v12;
    v20 = v12;
    v17 = v12;
    v18 = v12;
    *(_OWORD *)buf = v12;
    *(_OWORD *)&buf[16] = v12;
    memset(&v15, 0, sizeof(v15));
    v14 = 0xAAAAAAAAAAAAAAAALL;
    time(&v14);
    localtime_r(&v14, &v15);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v15);
    dprintf(glog_fd, "%s ", buf);
    v13 = glog_fd;
    CFGetTypeID(cf);
    dprintf(v13, "%s Unexpected CF object type ID. Expected (%lu), have (%lu) \n");
  }
  return 0;
}

void addSystemInformationToDict(__CFDictionary *a1, uint64_t a2)
{
  __CFDictionary *Mutable;
  __CFDictionary *v5;
  __int128 v6;
  size_t v7;
  unsigned int v8;
  _QWORD v9[2];
  char v10[16];
  __int128 v11;
  char v12[16];
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (Mutable)
  {
    v5 = Mutable;
    v8 = -1431655766;
    *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)v12 = v6;
    v13 = v6;
    *(_OWORD *)v10 = v6;
    v11 = v6;
    v9[1] = 0xAAAAAAAAAAAAAAAALL;
    add_ull_to_dict("mach-absolute-time", a2, Mutable);
    v9[0] = 0x1700000006;
    v7 = 4;
    if (!sysctl((int *)v9, 2u, &v8, &v7, 0, 0))
      add_ull_to_dict("tick-frequency", v8, v5);
    v9[0] = 0x4100000001;
    v7 = 32;
    if (!sysctl((int *)v9, 2u, v12, &v7, 0, 0))
    {
      HIBYTE(v13) = 0;
      add_cstr_to_dict("os-version", v12, v5);
    }
    v9[0] = 0x200000006;
    v7 = 32;
    if (!sysctl((int *)v9, 2u, v10, &v7, 0, 0))
    {
      HIBYTE(v11) = 0;
      add_cstr_to_dict("hw-model", v10, v5);
    }
    if ((gBootArgsParsed & 1) == 0)
    {
      v7 = 256;
      if (!sysctlbyname("kern.bootargs", gBootArgs, &v7, 0, 0))
        byte_1F02F7671 = 0;
    }
    add_cstr_to_dict("boot-args", gBootArgs, v5);
    add_cftype_to_dict("DeviceInfo", v5, a1);
    CFRelease(v5);
  }
}

void add_ull_to_dict(const char *a1, uint64_t a2, __CFDictionary *a3)
{
  CFNumberRef v5;
  CFNumberRef v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v7[0] = a2;
  v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberLongLongType, v7);
  if (v5)
  {
    v6 = v5;
    add_cftype_to_dict(a1, v5, a3);
    CFRelease(v6);
  }
}

void add_cstr_to_dict(const char *a1, char *a2, __CFDictionary *a3)
{
  CFStringRef v5;
  CFStringRef v6;

  v5 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a2, 0);
  if (v5)
  {
    v6 = v5;
    add_cftype_to_dict(a1, v5, a3);
    CFRelease(v6);
  }
}

void add_cftype_to_dict(const char *cStr, const void *a2, __CFDictionary *a3)
{
  CFStringRef v5;
  CFStringRef v6;

  v5 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], cStr, 0);
  if (v5)
  {
    v6 = v5;
    CFDictionaryAddValue(a3, v5, a2);
    CFRelease(v6);
  }
}

uint64_t CCIOReporterFormatter::writeFileFooter(CCIOReporterFormatter *this)
{
  return (*(uint64_t (**)(CCIOReporterFormatter *, const char *, uint64_t))(*(_QWORD *)this + 112))(this, "</array>\n</plist>\n", 18);
}

CFIndex CCIOReporterFormatter::writeLog(CCIOReporterFormatter *a1, uint64_t a2, const UInt8 *a3, size_t a4, const void *a5, size_t a6)
{
  const UInt8 *v6;
  size_t v9;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  NSObject *v19;
  __int128 v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  NSObject *v24;
  __int128 v25;
  uint64_t v26;
  NSObject *v27;
  char *v28;
  __int128 v29;
  CFIndex v30;
  const __CFAllocator *v32;
  const __CFNumber *v33;
  const __CFNumber *v34;
  const __CFData *v35;
  const __CFData *v36;
  const __CFDictionary *ChannelsForStreamAndSubscription;
  const __CFDictionary *SamplesRaw;
  __CFDictionary *v39;
  CFIndex Count;
  __CFError *v41;
  CFStringRef v42;
  const __CFData *Data;
  const __CFData *v44;
  CFIndex Length;
  const UInt8 *BytePtr;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  uint64_t v50;
  NSObject *v51;
  uint64_t v52;
  NSObject *v53;
  __int128 v54;
  __int128 v55;
  __CFDictionary *v56;
  const __CFString *v57;
  const __CFString *v58;
  uint64_t v59;
  NSObject *v60;
  __int128 v61;
  uint64_t v62;
  NSObject *v63;
  __int128 v64;
  uint64_t v65;
  NSObject *v66;
  __int128 v67;
  __int128 v68;
  uint64_t v69;
  time_t v70;
  tm v71;
  CFErrorRef err;
  int valuePtr;
  _BYTE v74[64];
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _BYTE buffer[32];
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  if (!a2 || (v6 = a3) == 0)
  {
    v14 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_11;
      *(_WORD *)buffer = 0;
      v15 = v14;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_11;
      *(_WORD *)buffer = 0;
      v15 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v15, OS_LOG_TYPE_ERROR, "CCIOReporterFormatter::writeLog Unexpected log data \n", buffer, 2u);
LABEL_11:
    if (glog_fd)
    {
      *(_QWORD *)&v16 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v84 = v16;
      v85 = v16;
      v82 = v16;
      v83 = v16;
      v80 = v16;
      v81 = v16;
      *(_OWORD *)buffer = v16;
      *(_OWORD *)&buffer[16] = v16;
      memset(v74, 0, 56);
      *(_QWORD *)&v71.tm_sec = 0xAAAAAAAAAAAAAAAALL;
      time((time_t *)&v71.tm_sec);
      localtime_r((const time_t *)&v71.tm_sec, (tm *)v74);
      strftime(buffer, 0x80uLL, "%b %d %H:%M:%S", (const tm *)v74);
      dprintf(glog_fd, "%s ", buffer);
      dprintf(glog_fd, "CCIOReporterFormatter::writeLog Unexpected log data \n");
    }
    return 0;
  }
  v9 = a4;
  if (a4)
    goto LABEL_16;
  v12 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_DWORD *)buffer = 134217984;
    *(_QWORD *)&buffer[4] = 0;
    v13 = v12;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_DWORD *)buffer = 134217984;
    *(_QWORD *)&buffer[4] = 0;
    v13 = MEMORY[0x1E0C81028];
  }
  _os_log_error_impl(&dword_1DB697000, v13, OS_LOG_TYPE_ERROR, "CCIOReporterFormatter::writeLog  Inconsistent data (1) length=%lu\n", buffer, 0xCu);
LABEL_14:
  if (glog_fd)
  {
    *(_QWORD *)&v17 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v17 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v84 = v17;
    v85 = v17;
    v82 = v17;
    v83 = v17;
    v80 = v17;
    v81 = v17;
    *(_OWORD *)buffer = v17;
    *(_OWORD *)&buffer[16] = v17;
    memset(v74, 0, 56);
    *(_QWORD *)&v71.tm_sec = 0xAAAAAAAAAAAAAAAALL;
    time((time_t *)&v71.tm_sec);
    localtime_r((const time_t *)&v71.tm_sec, (tm *)v74);
    strftime(buffer, 0x80uLL, "%b %d %H:%M:%S", (const tm *)v74);
    dprintf(glog_fd, "%s ", buffer);
    dprintf(glog_fd, "CCIOReporterFormatter::writeLog  Inconsistent data (1) length=%lu\n", 0);
  }
LABEL_16:
  if (!a5 || a6)
    goto LABEL_24;
  v18 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
      goto LABEL_22;
    *(_DWORD *)buffer = 134217984;
    *(_QWORD *)&buffer[4] = 0;
    v19 = v18;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_22;
    *(_DWORD *)buffer = 134217984;
    *(_QWORD *)&buffer[4] = 0;
    v19 = MEMORY[0x1E0C81028];
  }
  _os_log_error_impl(&dword_1DB697000, v19, OS_LOG_TYPE_ERROR, "CCIOReporterFormatter::writeLog  Inconsistent data (2) lengthContinue=%lu\n", buffer, 0xCu);
LABEL_22:
  if (glog_fd)
  {
    *(_QWORD *)&v20 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v84 = v20;
    v85 = v20;
    v82 = v20;
    v83 = v20;
    v80 = v20;
    v81 = v20;
    *(_OWORD *)buffer = v20;
    *(_OWORD *)&buffer[16] = v20;
    memset(v74, 0, 56);
    *(_QWORD *)&v71.tm_sec = 0xAAAAAAAAAAAAAAAALL;
    time((time_t *)&v71.tm_sec);
    localtime_r((const time_t *)&v71.tm_sec, (tm *)v74);
    strftime(buffer, 0x80uLL, "%b %d %H:%M:%S", (const tm *)v74);
    dprintf(glog_fd, "%s ", buffer);
    dprintf(glog_fd, "CCIOReporterFormatter::writeLog  Inconsistent data (2) lengthContinue=%lu\n", 0);
  }
LABEL_24:
  v21 = *(unsigned __int16 *)(a2 + 24);
  v22 = a6 + v9;
  if (a6 + v9 == v21)
    goto LABEL_31;
  v23 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
      goto LABEL_29;
    *(_DWORD *)buffer = 67109632;
    *(_DWORD *)&buffer[4] = v21;
    *(_WORD *)&buffer[8] = 2048;
    *(_QWORD *)&buffer[10] = v9;
    *(_WORD *)&buffer[18] = 2048;
    *(_QWORD *)&buffer[20] = a6;
    v24 = v23;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_29;
    *(_DWORD *)buffer = 67109632;
    *(_DWORD *)&buffer[4] = v21;
    *(_WORD *)&buffer[8] = 2048;
    *(_QWORD *)&buffer[10] = v9;
    *(_WORD *)&buffer[18] = 2048;
    *(_QWORD *)&buffer[20] = a6;
    v24 = MEMORY[0x1E0C81028];
  }
  _os_log_error_impl(&dword_1DB697000, v24, OS_LOG_TYPE_ERROR, "CCIOReporterFormatter::writeLog  Inconsistent data (3) payloadLength=%d, length=%lu, lengthContinue=%lu\n", buffer, 0x1Cu);
LABEL_29:
  if (glog_fd)
  {
    *(_QWORD *)&v25 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v25 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v84 = v25;
    v85 = v25;
    v82 = v25;
    v83 = v25;
    v80 = v25;
    v81 = v25;
    *(_OWORD *)buffer = v25;
    *(_OWORD *)&buffer[16] = v25;
    memset(v74, 0, 56);
    *(_QWORD *)&v71.tm_sec = 0xAAAAAAAAAAAAAAAALL;
    time((time_t *)&v71.tm_sec);
    localtime_r((const time_t *)&v71.tm_sec, (tm *)v74);
    strftime(buffer, 0x80uLL, "%b %d %H:%M:%S", (const tm *)v74);
    dprintf(glog_fd, "%s ", buffer);
    dprintf(glog_fd, "CCIOReporterFormatter::writeLog  Inconsistent data (3) payloadLength=%d, length=%lu, lengthContinue=%lu\n", *(unsigned __int16 *)(a2 + 24), v9, a6);
  }
LABEL_31:
  if (v22 <= 3)
  {
    v26 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_38;
      *(_DWORD *)buffer = 134217984;
      *(_QWORD *)&buffer[4] = v22;
      v27 = v26;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_38;
      *(_DWORD *)buffer = 134217984;
      *(_QWORD *)&buffer[4] = v22;
      v27 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v27, OS_LOG_TYPE_ERROR, "CCIOReporterFormatter::writeLog  Insufficient length=%lu to hold IOReporterHeader_t\n", buffer, 0xCu);
LABEL_38:
    if (glog_fd)
    {
      *(_QWORD *)&v29 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v29 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v84 = v29;
      v85 = v29;
      v82 = v29;
      v83 = v29;
      v80 = v29;
      v81 = v29;
      *(_OWORD *)buffer = v29;
      *(_OWORD *)&buffer[16] = v29;
      memset(v74, 0, 56);
      *(_QWORD *)&v71.tm_sec = 0xAAAAAAAAAAAAAAAALL;
      time((time_t *)&v71.tm_sec);
      localtime_r((const time_t *)&v71.tm_sec, (tm *)v74);
      strftime(buffer, 0x80uLL, "%b %d %H:%M:%S", (const tm *)v74);
      dprintf(glog_fd, "%s ", buffer);
      dprintf(glog_fd, "CCIOReporterFormatter::writeLog  Insufficient length=%lu to hold IOReporterHeader_t\n");
    }
    return 0;
  }
  if (a5)
  {
    v28 = (char *)malloc_type_malloc(a6 + v9, 0x26870536uLL);
    memcpy(v28, v6, v9);
    memcpy(&v28[v9], a5, a6);
    v9 += a6;
    v6 = (const UInt8 *)v28;
  }
  else
  {
    v28 = 0;
  }
  v32 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v33 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberSInt32Type, v6);
  valuePtr = *(unsigned __int8 *)(a2 + 35);
  v34 = CFNumberCreate(v32, kCFNumberSInt32Type, &valuePtr);
  v35 = CFDataCreateWithBytesNoCopy(0, v6 + 4, v9 - 4, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
  v36 = v35;
  err = 0;
  if (!v35 || !CFDataGetLength(v35))
  {
    v50 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_65;
      *(_WORD *)buffer = 0;
      v51 = v50;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_65;
      *(_WORD *)buffer = 0;
      v51 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v51, OS_LOG_TYPE_ERROR, "CCIOReporterFormatter::writeLog  Can't copy rawData\n", buffer, 2u);
LABEL_65:
    if (glog_fd)
    {
      *(_QWORD *)&v54 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v54 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v84 = v54;
      v85 = v54;
      v82 = v54;
      v83 = v54;
      v80 = v54;
      v81 = v54;
      *(_OWORD *)buffer = v54;
      *(_OWORD *)&buffer[16] = v54;
      memset(v74, 0, 56);
      *(_QWORD *)&v71.tm_sec = 0xAAAAAAAAAAAAAAAALL;
      time((time_t *)&v71.tm_sec);
      localtime_r((const time_t *)&v71.tm_sec, (tm *)v74);
      strftime(buffer, 0x80uLL, "%b %d %H:%M:%S", (const tm *)v74);
      dprintf(glog_fd, "%s ", buffer);
      dprintf(glog_fd, "CCIOReporterFormatter::writeLog  Can't copy rawData\n");
    }
    goto LABEL_70;
  }
  ChannelsForStreamAndSubscription = CCIOReporterFormatter::getChannelsForStreamAndSubscription(a1, v34, v33);
  if (!ChannelsForStreamAndSubscription || !CFDictionaryGetCount(ChannelsForStreamAndSubscription))
  {
    v52 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_68;
      *(_WORD *)buffer = 0;
      v53 = v52;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_68;
      *(_WORD *)buffer = 0;
      v53 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v53, OS_LOG_TYPE_ERROR, "CCIOReporterFormatter::writeLog  Didn't find channels\n", buffer, 2u);
LABEL_68:
    if (glog_fd)
    {
      *(_QWORD *)&v55 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v55 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v84 = v55;
      v85 = v55;
      v82 = v55;
      v83 = v55;
      v80 = v55;
      v81 = v55;
      *(_OWORD *)buffer = v55;
      *(_OWORD *)&buffer[16] = v55;
      memset(v74, 0, 56);
      *(_QWORD *)&v71.tm_sec = 0xAAAAAAAAAAAAAAAALL;
      time((time_t *)&v71.tm_sec);
      localtime_r((const time_t *)&v71.tm_sec, (tm *)v74);
      strftime(buffer, 0x80uLL, "%b %d %H:%M:%S", (const tm *)v74);
      dprintf(glog_fd, "%s ", buffer);
      dprintf(glog_fd, "CCIOReporterFormatter::writeLog  Didn't find channels\n");
    }
LABEL_70:
    v56 = 0;
    v44 = 0;
    v39 = 0;
    goto LABEL_71;
  }
  SamplesRaw = (const __CFDictionary *)IOReportCreateSamplesRaw();
  v39 = SamplesRaw;
  if (SamplesRaw)
  {
    Count = CFDictionaryGetCount(SamplesRaw);
    v41 = err;
    if (Count && !err)
    {
      addSystemInformationToDict(v39, *(_QWORD *)(a2 + 28) & 0xFFFFFFFFFFFFFFLL);
      v42 = CCIOReporterFormatter::writeTimeString((uint64_t)a1, a2);
      if (v42)
        CFDictionarySetValue(v39, CFSTR("Time"), v42);
      Data = CFPropertyListCreateData(0, v39, kCFPropertyListXMLFormat_v1_0, 0, 0);
      v44 = Data;
      if (Data)
      {
        if (CFDataGetBytePtr(Data))
        {
          Length = CFDataGetLength(v44);
          BytePtr = CFDataGetBytePtr(v44);
          v30 = Length - 173;
          ++*((_DWORD *)a1 + 46);
          v47 = (*(uint64_t (**)(CCIOReporterFormatter *, const UInt8 *, CFIndex))(*(_QWORD *)a1 + 112))(a1, BytePtr + 164, v30);
          if (v47 != v30)
          {
            v69 = v47;
            v48 = coreCaptureOsLog;
            if (coreCaptureOsLog)
            {
              if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buffer = 134218240;
                *(_QWORD *)&buffer[4] = v30;
                *(_WORD *)&buffer[12] = 2048;
                *(_QWORD *)&buffer[14] = v69;
                v49 = v48;
LABEL_141:
                _os_log_error_impl(&dword_1DB697000, v49, OS_LOG_TYPE_ERROR, "CCIOReporterFormatter::writeLog Failed to write(1) dsize=%lu, tempLength=%lu\n", buffer, 0x16u);
              }
            }
            else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buffer = 134218240;
              *(_QWORD *)&buffer[4] = v30;
              *(_WORD *)&buffer[12] = 2048;
              *(_QWORD *)&buffer[14] = v69;
              v49 = MEMORY[0x1E0C81028];
              goto LABEL_141;
            }
            if (glog_fd)
            {
              *(_QWORD *)&v68 = 0xAAAAAAAAAAAAAAAALL;
              *((_QWORD *)&v68 + 1) = 0xAAAAAAAAAAAAAAAALL;
              v84 = v68;
              v85 = v68;
              v82 = v68;
              v83 = v68;
              v80 = v68;
              v81 = v68;
              *(_OWORD *)buffer = v68;
              *(_OWORD *)&buffer[16] = v68;
              memset(v74, 0, 56);
              *(_QWORD *)&v71.tm_sec = 0xAAAAAAAAAAAAAAAALL;
              time((time_t *)&v71.tm_sec);
              localtime_r((const time_t *)&v71.tm_sec, (tm *)v74);
              strftime(buffer, 0x80uLL, "%b %d %H:%M:%S", (const tm *)v74);
              dprintf(glog_fd, "%s ", buffer);
              dprintf(glog_fd, "CCIOReporterFormatter::writeLog Failed to write(1) dsize=%lu, tempLength=%lu\n", v30, v69);
            }
            v56 = v39;
            v30 = v69;
LABEL_125:
            v39 = 0;
            if (!v28)
              goto LABEL_73;
            goto LABEL_72;
          }
LABEL_124:
          v56 = v39;
          goto LABEL_125;
        }
LABEL_117:
        v65 = coreCaptureOsLog;
        if (coreCaptureOsLog)
        {
          if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buffer = 0;
            v66 = v65;
LABEL_137:
            _os_log_error_impl(&dword_1DB697000, v66, OS_LOG_TYPE_ERROR, "CFDataGetBytePtr() failed", buffer, 2u);
          }
        }
        else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buffer = 0;
          v66 = MEMORY[0x1E0C81028];
          goto LABEL_137;
        }
        if (glog_fd)
        {
          *(_QWORD *)&v67 = 0xAAAAAAAAAAAAAAAALL;
          *((_QWORD *)&v67 + 1) = 0xAAAAAAAAAAAAAAAALL;
          v84 = v67;
          v85 = v67;
          v82 = v67;
          v83 = v67;
          v80 = v67;
          v81 = v67;
          *(_OWORD *)buffer = v67;
          *(_OWORD *)&buffer[16] = v67;
          memset(v74, 0, 56);
          *(_QWORD *)&v71.tm_sec = 0xAAAAAAAAAAAAAAAALL;
          time((time_t *)&v71.tm_sec);
          localtime_r((const time_t *)&v71.tm_sec, (tm *)v74);
          strftime(buffer, 0x80uLL, "%b %d %H:%M:%S", (const tm *)v74);
          dprintf(glog_fd, "%s ", buffer);
          dprintf(glog_fd, "CFDataGetBytePtr() failed");
        }
        v30 = 0;
        goto LABEL_124;
      }
      v62 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
          goto LABEL_115;
        *(_WORD *)buffer = 0;
        v63 = v62;
      }
      else
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_115;
        *(_WORD *)buffer = 0;
        v63 = MEMORY[0x1E0C81028];
      }
      _os_log_error_impl(&dword_1DB697000, v63, OS_LOG_TYPE_ERROR, "CFPropertyListCreateData() failed", buffer, 2u);
LABEL_115:
      if (glog_fd)
      {
        *(_QWORD *)&v64 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v64 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v84 = v64;
        v85 = v64;
        v82 = v64;
        v83 = v64;
        v80 = v64;
        v81 = v64;
        *(_OWORD *)buffer = v64;
        *(_OWORD *)&buffer[16] = v64;
        memset(v74, 0, 56);
        *(_QWORD *)&v71.tm_sec = 0xAAAAAAAAAAAAAAAALL;
        time((time_t *)&v71.tm_sec);
        localtime_r((const time_t *)&v71.tm_sec, (tm *)v74);
        strftime(buffer, 0x80uLL, "%b %d %H:%M:%S", (const tm *)v74);
        dprintf(glog_fd, "%s ", buffer);
        dprintf(glog_fd, "CFPropertyListCreateData() failed");
      }
      goto LABEL_117;
    }
  }
  else
  {
    v41 = err;
  }
  v90 = xmmword_1DB6CDDC0;
  v91 = unk_1DB6CDDD0;
  v92 = xmmword_1DB6CDDE0;
  v93 = unk_1DB6CDDF0;
  v86 = xmmword_1DB6CDD80;
  v87 = unk_1DB6CDD90;
  v88 = xmmword_1DB6CDDA0;
  v89 = unk_1DB6CDDB0;
  v82 = xmmword_1DB6CDD40;
  v83 = unk_1DB6CDD50;
  v84 = xmmword_1DB6CDD60;
  v85 = unk_1DB6CDD70;
  *(_OWORD *)buffer = *(_OWORD *)"<unknown>";
  *(_OWORD *)&buffer[16] = *(_OWORD *)&algn_1DB6CDD0A[6];
  v80 = xmmword_1DB6CDD20;
  v81 = unk_1DB6CDD30;
  if (v41)
  {
    v57 = CFErrorCopyFailureReason(v41);
    if (v57)
    {
      v58 = v57;
      CFStringGetCString(v57, buffer, 256, 0x8000100u);
      CFRelease(v58);
    }
    CFRelease(err);
  }
  v59 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v74 = 0;
      v60 = v59;
LABEL_135:
      _os_log_error_impl(&dword_1DB697000, v60, OS_LOG_TYPE_ERROR, "IOReportCreateSamplesRaw() returned 0 sized dictionary", v74, 2u);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v74 = 0;
    v60 = MEMORY[0x1E0C81028];
    goto LABEL_135;
  }
  if (glog_fd)
  {
    *(_QWORD *)&v61 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v61 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v77 = v61;
    v78 = v61;
    v75 = v61;
    v76 = v61;
    *(_OWORD *)&v74[48] = v61;
    *(_OWORD *)&v74[16] = v61;
    *(_OWORD *)&v74[32] = v61;
    *(_OWORD *)v74 = v61;
    memset(&v71, 0, sizeof(v71));
    v70 = 0xAAAAAAAAAAAAAAAALL;
    time(&v70);
    localtime_r(&v70, &v71);
    strftime(v74, 0x80uLL, "%b %d %H:%M:%S", &v71);
    dprintf(glog_fd, "%s ", v74);
    dprintf(glog_fd, "IOReportCreateSamplesRaw() returned 0 sized dictionary");
  }
  v56 = 0;
  v44 = 0;
LABEL_71:
  v42 = 0;
  v30 = 0;
  if (v28)
LABEL_72:
    free(v28);
LABEL_73:
  if (v36)
    CFRelease(v36);
  if (v42)
    CFRelease(v42);
  if (v56)
    CFRelease(v56);
  if (v44)
    CFRelease(v44);
  if (v39)
    CFRelease(v39);
  if (v34)
    CFRelease(v34);
  if (v33)
    CFRelease(v33);
  return v30;
}

uint64_t CCIOReporterFormatter::writeCommentEntry()
{
  return 0;
}

const char *CCIOReporterFormatter::getFormatterFileExtension(CCIOReporterFormatter *this)
{
  return "xml";
}

uint64_t CCIOReporterFormatter::initWithRegistryEntry(CCIOReporterFormatter *this, io_object_t object)
{
  *((_DWORD *)this + 8) = object;
  IOObjectRetain(object);
  *((_DWORD *)this + 3) = object;
  return 1;
}

const __CFArray *CCIOReporterFormatter::getChannelsForStreamAndSubscription(CCIOReporterFormatter *this, const __CFNumber *a2, const __CFNumber *a3)
{
  const __CFArray *result;
  CFIndex i;
  const __CFDictionary *v7;
  CFTypeID v8;
  const __CFNumber *Value;
  const __CFNumber *v10;
  CFTypeID v11;
  const __CFArray *v12;
  const __CFArray *v13;
  CFTypeID v14;
  CCIOReporterFormatter *TypeID;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  NSObject *v23;
  __int128 v24;
  time_t v26;
  tm v27;
  uint8_t buf[16];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  result = (const __CFArray *)*((_QWORD *)this + 6);
  if (result)
  {
    for (i = 0; ; ++i)
    {
      if (i >= CFArrayGetCount(result))
        return 0;
      result = (const __CFArray *)CFArrayGetValueAtIndex(*((CFArrayRef *)this + 6), i);
      if (!result)
        return result;
      v7 = result;
      v8 = CFGetTypeID(result);
      if (v8 != CFDictionaryGetTypeID())
        return 0;
      Value = (const __CFNumber *)CFDictionaryGetValue(v7, CFSTR("Id"));
      if (!Value)
        break;
      v10 = Value;
      v11 = CFGetTypeID(Value);
      if (v11 != CFNumberGetTypeID())
      {
        v18 = coreCaptureOsLog;
        if (coreCaptureOsLog)
        {
          if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            *(_QWORD *)&buf[4] = "Id";
            v19 = v18;
            goto LABEL_26;
          }
        }
        else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          *(_QWORD *)&buf[4] = "Id";
          v19 = MEMORY[0x1E0C81028];
LABEL_26:
          _os_log_impl(&dword_1DB697000, v19, OS_LOG_TYPE_DEFAULT, "CCIOReporterFormatter::getChannelsForStreamAndSubscription  key %s has wrong type in dictionary\n", buf, 0xCu);
        }
        if (glog_fd)
        {
          *(_QWORD *)&v21 = 0xAAAAAAAAAAAAAAAALL;
          *((_QWORD *)&v21 + 1) = 0xAAAAAAAAAAAAAAAALL;
          v34 = v21;
          v35 = v21;
          v32 = v21;
          v33 = v21;
          v30 = v21;
          v31 = v21;
          *(_OWORD *)buf = v21;
          v29 = v21;
          memset(&v27, 0, sizeof(v27));
          v26 = 0xAAAAAAAAAAAAAAAALL;
          time(&v26);
          localtime_r(&v26, &v27);
          strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v27);
          dprintf(glog_fd, "%s ", (const char *)buf);
          dprintf(glog_fd, "CCIOReporterFormatter::getChannelsForStreamAndSubscription  key %s has wrong type in dictionary\n");
        }
        goto LABEL_29;
      }
      if (CFNumberCompare(v10, a2, 0) == kCFCompareEqualTo)
      {
        v12 = (const __CFArray *)CFDictionaryGetValue(v7, CFSTR("CCIOReportStream"));
        if (!v12
          || (v13 = v12,
              v14 = CFGetTypeID(v12),
              TypeID = (CCIOReporterFormatter *)CFArrayGetTypeID(),
              (CCIOReporterFormatter *)v14 != TypeID))
        {
          v22 = coreCaptureOsLog;
          if (coreCaptureOsLog)
          {
            if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              *(_QWORD *)&buf[4] = "CCIOReportStream";
              v23 = v22;
              goto LABEL_35;
            }
          }
          else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            *(_QWORD *)&buf[4] = "CCIOReportStream";
            v23 = MEMORY[0x1E0C81028];
LABEL_35:
            _os_log_impl(&dword_1DB697000, v23, OS_LOG_TYPE_DEFAULT, "CCIOReporterFormatter::getChannelsForStreamAndSubscription  Couldnt find %s\n", buf, 0xCu);
          }
          if (glog_fd)
          {
            *(_QWORD *)&v24 = 0xAAAAAAAAAAAAAAAALL;
            *((_QWORD *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
            v34 = v24;
            v35 = v24;
            v32 = v24;
            v33 = v24;
            v30 = v24;
            v31 = v24;
            *(_OWORD *)buf = v24;
            v29 = v24;
            memset(&v27, 0, sizeof(v27));
            v26 = 0xAAAAAAAAAAAAAAAALL;
            time(&v26);
            localtime_r(&v26, &v27);
            strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v27);
            dprintf(glog_fd, "%s ", (const char *)buf);
            dprintf(glog_fd, "CCIOReporterFormatter::getChannelsForStreamAndSubscription  Couldnt find %s\n", "CCIOReportStream");
          }
          return 0;
        }
        result = (const __CFArray *)CCIOReporterFormatter::getChannelsForSubscription(TypeID, v13, a3);
        if (result)
          return result;
      }
LABEL_29:
      result = (const __CFArray *)*((_QWORD *)this + 6);
    }
    v16 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
        goto LABEL_22;
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "Id";
      v17 = v16;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        goto LABEL_22;
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "Id";
      v17 = MEMORY[0x1E0C81028];
    }
    _os_log_impl(&dword_1DB697000, v17, OS_LOG_TYPE_DEFAULT, "CCIOReporterFormatter::getChannelsForStreamAndSubscription  no key %s in dictionary\n", buf, 0xCu);
LABEL_22:
    if (glog_fd)
    {
      *(_QWORD *)&v20 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v34 = v20;
      v35 = v20;
      v32 = v20;
      v33 = v20;
      v30 = v20;
      v31 = v20;
      *(_OWORD *)buf = v20;
      v29 = v20;
      memset(&v27, 0, sizeof(v27));
      v26 = 0xAAAAAAAAAAAAAAAALL;
      time(&v26);
      localtime_r(&v26, &v27);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v27);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "CCIOReporterFormatter::getChannelsForStreamAndSubscription  no key %s in dictionary\n");
    }
    goto LABEL_29;
  }
  return result;
}

CFStringRef CCIOReporterFormatter::writeTimeString(uint64_t a1, uint64_t a2)
{
  char *v4;
  tm v6;
  time_t v7;
  char v8[16];
  char v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v7 = *(_QWORD *)(a2 + 8);
  memset(v9, 170, 20);
  memset(&v6, 0, sizeof(v6));
  localtime_r(&v7, &v6);
  strftime(v9, 0x14uLL, "%b %d %H:%M:%S", &v6);
  memset(v8, 170, sizeof(v8));
  strftime(v8, 0x10uLL, "%z", &v6);
  v4 = (char *)(a1 + 56);
  if (snprintf(v4, 0x80uLL, "%s.%06llu %s", v9, *(_QWORD *)(a2 + 16), v8))
    return CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v4, 0x8000100u);
  else
    return 0;
}

const void *CCIOReporterFormatter::getChannelsForSubscription(CCIOReporterFormatter *this, CFArrayRef theArray, const __CFNumber *a3)
{
  CFIndex v5;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v7;
  CFTypeID v8;
  const __CFNumber *Value;
  const __CFNumber *v10;
  CFTypeID v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  const void *v16;
  const void *v17;
  CFTypeID v18;
  uint64_t v19;
  NSObject *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  NSObject *v25;
  __int128 v26;
  time_t v28;
  tm v29;
  _BYTE buf[32];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;

  v5 = 0;
  v37 = *MEMORY[0x1E0C80C00];
  while (1)
  {
    if (v5 >= CFArrayGetCount(theArray))
      goto LABEL_29;
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(theArray, v5);
    if (!ValueAtIndex || (v7 = ValueAtIndex, v8 = CFGetTypeID(ValueAtIndex), v8 != CFDictionaryGetTypeID()))
    {
      v12 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
          goto LABEL_21;
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v5;
        v13 = v12;
      }
      else
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_21;
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v5;
        v13 = MEMORY[0x1E0C81028];
      }
      _os_log_error_impl(&dword_1DB697000, v13, OS_LOG_TYPE_ERROR, "CCIOReporterFormatter::getChannelsForSubscription  didnt find or wrong type in array at i %ld\n", buf, 0xCu);
LABEL_21:
      if (glog_fd)
      {
        *(_QWORD *)&v21 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v21 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v35 = v21;
        v36 = v21;
        v33 = v21;
        v34 = v21;
        v31 = v21;
        v32 = v21;
        *(_OWORD *)buf = v21;
        *(_OWORD *)&buf[16] = v21;
        memset(&v29, 0, sizeof(v29));
        v28 = 0xAAAAAAAAAAAAAAAALL;
        time(&v28);
        localtime_r(&v28, &v29);
        strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v29);
        dprintf(glog_fd, "%s ", buf);
        dprintf(glog_fd, "CCIOReporterFormatter::getChannelsForSubscription  didnt find or wrong type in array at i %ld\n");
      }
      goto LABEL_29;
    }
    Value = (const __CFNumber *)CFDictionaryGetValue(v7, CFSTR("CCIOReportInterestSubscriptionIDx"));
    if (!Value)
      break;
    v10 = Value;
    v11 = CFGetTypeID(Value);
    if (v11 != CFNumberGetTypeID())
      break;
    if (CFNumberCompare(v10, a3, 0) == kCFCompareEqualTo)
    {
      v16 = CFDictionaryGetValue(v7, CFSTR("CCIOReportInterests"));
      if (v16)
      {
        v17 = v16;
        v18 = CFGetTypeID(v16);
        if (v18 == CFDictionaryGetTypeID())
          return v17;
      }
      v19 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
          goto LABEL_27;
        *(_DWORD *)buf = 134218242;
        *(_QWORD *)&buf[4] = v5;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "CCIOReportInterests";
        v20 = v19;
      }
      else
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_27;
        *(_DWORD *)buf = 134218242;
        *(_QWORD *)&buf[4] = v5;
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "CCIOReportInterests";
        v20 = MEMORY[0x1E0C81028];
      }
      _os_log_error_impl(&dword_1DB697000, v20, OS_LOG_TYPE_ERROR, "CCIOReporterFormatter::getChannelsForSubscription  didnt find or wrong type in dict at i %ld for %s\n", buf, 0x16u);
LABEL_27:
      if (glog_fd)
      {
        *(_QWORD *)&v23 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v23 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v35 = v23;
        v36 = v23;
        v33 = v23;
        v34 = v23;
        v31 = v23;
        v32 = v23;
        *(_OWORD *)buf = v23;
        *(_OWORD *)&buf[16] = v23;
        memset(&v29, 0, sizeof(v29));
        v28 = 0xAAAAAAAAAAAAAAAALL;
        time(&v28);
        localtime_r(&v28, &v29);
        strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v29);
        dprintf(glog_fd, "%s ", buf);
        dprintf(glog_fd, "CCIOReporterFormatter::getChannelsForSubscription  didnt find or wrong type in dict at i %ld for %s\n");
      }
      goto LABEL_29;
    }
    ++v5;
  }
  v14 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "CCIOReportInterestSubscriptionIDx";
      v15 = v14;
      goto LABEL_42;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "CCIOReportInterestSubscriptionIDx";
    v15 = MEMORY[0x1E0C81028];
LABEL_42:
    _os_log_error_impl(&dword_1DB697000, v15, OS_LOG_TYPE_ERROR, "CCIOReporterFormatter::getChannelsForSubscription  didnt find %s\n", buf, 0xCu);
  }
  if (glog_fd)
  {
    *(_QWORD *)&v22 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v22 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v35 = v22;
    v36 = v22;
    v33 = v22;
    v34 = v22;
    v31 = v22;
    v32 = v22;
    *(_OWORD *)buf = v22;
    *(_OWORD *)&buf[16] = v22;
    memset(&v29, 0, sizeof(v29));
    v28 = 0xAAAAAAAAAAAAAAAALL;
    time(&v28);
    localtime_r(&v28, &v29);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v29);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "CCIOReporterFormatter::getChannelsForSubscription  didnt find %s\n");
  }
LABEL_29:
  v24 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v25 = v24;
      goto LABEL_38;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v25 = MEMORY[0x1E0C81028];
LABEL_38:
    _os_log_error_impl(&dword_1DB697000, v25, OS_LOG_TYPE_ERROR, "CCIOReporterFormatter::getChannelsForSubscription  didn't find matching subscription\n", buf, 2u);
  }
  if (glog_fd)
  {
    *(_QWORD *)&v26 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v26 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v35 = v26;
    v36 = v26;
    v33 = v26;
    v34 = v26;
    v31 = v26;
    v32 = v26;
    *(_OWORD *)buf = v26;
    *(_OWORD *)&buf[16] = v26;
    memset(&v29, 0, sizeof(v29));
    v28 = 0xAAAAAAAAAAAAAAAALL;
    time(&v28);
    localtime_r(&v28, &v29);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v29);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "CCIOReporterFormatter::getChannelsForSubscription  didn't find matching subscription\n");
  }
  return 0;
}

uint64_t CCIOReporterFormatter::addRegistryChildToChannelDictionary(CFMutableArrayRef *this, uint64_t entry)
{
  const __CFAllocator *v4;
  const __CFDictionary *CFProperty;
  CFTypeRef v6;
  __int128 v7;
  const __CFArray *Value;
  const __CFArray *v9;
  CFTypeID v10;
  CFTypeID TypeID;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  __int128 v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  int v23;
  CFIndex Count;
  __CFDictionary *Mutable;
  __CFDictionary *v26;
  __int128 v27;
  uint64_t v28;
  NSObject *v29;
  __int128 v30;
  uint64_t v32;
  uint64_t v33;
  time_t v34;
  tm v35;
  _BYTE buf[32];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _OWORD v43[8];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  CFProperty = (const __CFDictionary *)IORegistryEntryCreateCFProperty(entry, CFSTR("CCIOReportRkey"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  v6 = IORegistryEntryCreateCFProperty(entry, CFSTR("Id"), v4, 0);
  *(_QWORD *)&v7 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v43[6] = v7;
  v43[7] = v7;
  v43[4] = v7;
  v43[5] = v7;
  v43[2] = v7;
  v43[3] = v7;
  v43[0] = v7;
  v43[1] = v7;
  if (CFProperty)
  {
    Value = (const __CFArray *)CFDictionaryGetValue(CFProperty, CFSTR("CCIOReportStream"));
    if (Value)
    {
      v9 = Value;
      v10 = CFGetTypeID(Value);
      TypeID = CFArrayGetTypeID();
      v12 = coreCaptureOsLog;
      if (v10 == TypeID)
      {
        if (coreCaptureOsLog)
        {
          if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
            goto LABEL_29;
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)&buf[4] = "CCIOReporterFormatter";
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "addRegistryChildToChannelDictionary";
          *(_WORD *)&buf[22] = 2048;
          *(_QWORD *)&buf[24] = CFArrayGetCount(v9);
          v13 = v12;
        }
        else
        {
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            goto LABEL_29;
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)&buf[4] = "CCIOReporterFormatter";
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "addRegistryChildToChannelDictionary";
          *(_WORD *)&buf[22] = 2048;
          *(_QWORD *)&buf[24] = CFArrayGetCount(v9);
          v13 = MEMORY[0x1E0C81028];
        }
        _os_log_impl(&dword_1DB697000, v13, OS_LOG_TYPE_DEFAULT, "%s::%s streams %ld\n", buf, 0x20u);
LABEL_29:
        if (glog_fd)
        {
          *(_QWORD *)&v22 = 0xAAAAAAAAAAAAAAAALL;
          *((_QWORD *)&v22 + 1) = 0xAAAAAAAAAAAAAAAALL;
          v41 = v22;
          v42 = v22;
          v39 = v22;
          v40 = v22;
          v37 = v22;
          v38 = v22;
          *(_OWORD *)buf = v22;
          *(_OWORD *)&buf[16] = v22;
          memset(&v35, 0, sizeof(v35));
          v34 = 0xAAAAAAAAAAAAAAAALL;
          time(&v34);
          localtime_r(&v34, &v35);
          strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v35);
          dprintf(glog_fd, "%s ", buf);
          v23 = glog_fd;
          Count = CFArrayGetCount(v9);
          dprintf(v23, "%s::%s streams %ld\n", "CCIOReporterFormatter", "addRegistryChildToChannelDictionary", Count);
        }
        Mutable = CFDictionaryCreateMutable(v4, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
        if (Mutable)
        {
          v26 = Mutable;
          CFDictionarySetValue(Mutable, CFSTR("Id"), v6);
          CFDictionarySetValue(v26, CFSTR("CCIOReportStream"), v9);
          CFArrayAppendValue(this[5], v26);
          if (v6)
            CFRelease(v6);
          v20 = 1;
          v6 = CFProperty;
          CFProperty = v26;
          goto LABEL_45;
        }
        v28 = coreCaptureOsLog;
        if (coreCaptureOsLog)
        {
          if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
            goto LABEL_42;
          *(_WORD *)buf = 0;
          v29 = v28;
        }
        else
        {
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            goto LABEL_42;
          *(_WORD *)buf = 0;
          v29 = MEMORY[0x1E0C81028];
        }
        _os_log_error_impl(&dword_1DB697000, v29, OS_LOG_TYPE_ERROR, "CCIOReporterFormatter::addRegistryChildToChannelDictionary  Cant create channelStreamDictionary\n", buf, 2u);
LABEL_42:
        if (glog_fd)
        {
          *(_QWORD *)&v30 = 0xAAAAAAAAAAAAAAAALL;
          *((_QWORD *)&v30 + 1) = 0xAAAAAAAAAAAAAAAALL;
          v41 = v30;
          v42 = v30;
          v39 = v30;
          v40 = v30;
          v37 = v30;
          v38 = v30;
          *(_OWORD *)buf = v30;
          *(_OWORD *)&buf[16] = v30;
          memset(&v35, 0, sizeof(v35));
          v34 = 0xAAAAAAAAAAAAAAAALL;
          time(&v34);
          localtime_r(&v34, &v35);
          strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v35);
          dprintf(glog_fd, "%s ", buf);
          dprintf(glog_fd, "CCIOReporterFormatter::addRegistryChildToChannelDictionary  Cant create channelStreamDictionary\n", v33);
        }
        goto LABEL_44;
      }
      if (coreCaptureOsLog)
      {
        if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
          goto LABEL_36;
        *(_WORD *)buf = 0;
        v18 = v12;
      }
      else
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_36;
        *(_WORD *)buf = 0;
        v18 = MEMORY[0x1E0C81028];
      }
      _os_log_error_impl(&dword_1DB697000, v18, OS_LOG_TYPE_ERROR, "CCIOReporterFormatter::addRegistryChildToChannelDictionary  not array\n", buf, 2u);
LABEL_36:
      if (glog_fd)
      {
        *(_QWORD *)&v27 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v27 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v41 = v27;
        v42 = v27;
        v39 = v27;
        v40 = v27;
        v37 = v27;
        v38 = v27;
        *(_OWORD *)buf = v27;
        *(_OWORD *)&buf[16] = v27;
        memset(&v35, 0, sizeof(v35));
        v34 = 0xAAAAAAAAAAAAAAAALL;
        time(&v34);
        localtime_r(&v34, &v35);
        strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v35);
        dprintf(glog_fd, "%s ", buf);
        dprintf(glog_fd, "CCIOReporterFormatter::addRegistryChildToChannelDictionary  not array\n", v32);
      }
      goto LABEL_44;
    }
    v16 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_24;
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "CCIOReportStream";
      v17 = v16;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_24;
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "CCIOReportStream";
      v17 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v17, OS_LOG_TYPE_ERROR, "CCIOReporterFormatter::addRegistryChildToChannelDictionary  dictionary doesn't contain %s\n", buf, 0xCu);
LABEL_24:
    if (glog_fd)
    {
      *(_QWORD *)&v21 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v21 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v41 = v21;
      v42 = v21;
      v39 = v21;
      v40 = v21;
      v37 = v21;
      v38 = v21;
      *(_OWORD *)buf = v21;
      *(_OWORD *)&buf[16] = v21;
      memset(&v35, 0, sizeof(v35));
      v34 = 0xAAAAAAAAAAAAAAAALL;
      time(&v34);
      localtime_r(&v34, &v35);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v35);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "CCIOReporterFormatter::addRegistryChildToChannelDictionary  dictionary doesn't contain %s\n");
    }
LABEL_44:
    v20 = 0;
    if (!v6)
    {
LABEL_46:
      CFRelease(CFProperty);
      return v20;
    }
LABEL_45:
    CFRelease(v6);
    goto LABEL_46;
  }
  MEMORY[0x1DF0B21DC](entry, v43);
  v14 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_19;
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "CCIOReportRkey";
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = v43;
    v15 = v14;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_19;
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "CCIOReportRkey";
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = v43;
    v15 = MEMORY[0x1E0C81028];
  }
  _os_log_impl(&dword_1DB697000, v15, OS_LOG_TYPE_DEFAULT, "CCIOReporterFormatter::addRegistryChildToChannelDictionary  no %s found in %s\n", buf, 0x16u);
LABEL_19:
  if (glog_fd)
  {
    *(_QWORD *)&v19 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v41 = v19;
    v42 = v19;
    v39 = v19;
    v40 = v19;
    v37 = v19;
    v38 = v19;
    *(_OWORD *)buf = v19;
    *(_OWORD *)&buf[16] = v19;
    memset(&v35, 0, sizeof(v35));
    v34 = 0xAAAAAAAAAAAAAAAALL;
    time(&v34);
    localtime_r(&v34, &v35);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v35);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "CCIOReporterFormatter::addRegistryChildToChannelDictionary  no %s found in %s\n", "CCIOReportRkey", (const char *)v43);
  }
  v20 = 0;
  CFProperty = (const __CFDictionary *)v6;
  if (v6)
    goto LABEL_46;
  return v20;
}

uint64_t CCIOReporterFormatter::shapeIOReportLibraryFriendlyDictionary(CFArrayRef *this)
{
  CFIndex v2;
  const __CFAllocator *v3;
  const __CFString *v4;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v6;
  CFTypeID v7;
  const __CFString *v8;
  const __CFNumber *Value;
  const __CFNumber *v10;
  CFTypeID v11;
  const __CFArray *v12;
  const __CFArray *v13;
  CFTypeID v14;
  CFIndex i;
  const __CFDictionary *v16;
  const __CFDictionary *v17;
  CFTypeID v18;
  const __CFNumber *v19;
  const __CFNumber *v20;
  CFTypeID v21;
  __CFDictionary *Aggregate;
  __CFDictionary *v23;
  __CFDictionary *Mutable;
  __CFDictionary *v25;
  __CFDictionary *v26;
  __CFDictionary *v27;
  const __CFNumber *v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  NSObject *v43;
  uint64_t v44;
  NSObject *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;
  NSObject *v50;
  __int128 v51;
  uint64_t v52;
  NSObject *v53;
  __int128 v54;
  __int128 v56;
  __int128 v57;
  uint64_t v58;
  NSObject *v59;
  __int128 v60;
  CFMutableArrayRef theArray;
  time_t v62;
  tm v63;
  _BYTE buf[32];
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint64_t v71;

  v2 = 0;
  v71 = *MEMORY[0x1E0C80C00];
  v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v4 = CFSTR("Id");
  while (2)
  {
    if (v2 >= CFArrayGetCount(this[5]))
      return 0;
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(this[5], v2);
    if (!ValueAtIndex || (v6 = ValueAtIndex, v7 = CFGetTypeID(ValueAtIndex), v7 != CFDictionaryGetTypeID()))
    {
      v42 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
          goto LABEL_72;
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "CCIOReporterFormatter";
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "shapeIOReportLibraryFriendlyDictionary";
        *(_WORD *)&buf[22] = 2048;
        *(_QWORD *)&buf[24] = v2;
        v43 = v42;
      }
      else
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_72;
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "CCIOReporterFormatter";
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "shapeIOReportLibraryFriendlyDictionary";
        *(_WORD *)&buf[22] = 2048;
        *(_QWORD *)&buf[24] = v2;
        v43 = MEMORY[0x1E0C81028];
      }
      _os_log_error_impl(&dword_1DB697000, v43, OS_LOG_TYPE_ERROR, "%s::%s channelStreamArray at i %ld not valid\n", buf, 0x20u);
LABEL_72:
      if (glog_fd)
      {
        *(_QWORD *)&v54 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v54 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v69 = v54;
        v70 = v54;
        v67 = v54;
        v68 = v54;
        v65 = v54;
        v66 = v54;
        *(_OWORD *)buf = v54;
        *(_OWORD *)&buf[16] = v54;
        memset(&v63, 0, sizeof(v63));
        v62 = 0xAAAAAAAAAAAAAAAALL;
        time(&v62);
        localtime_r(&v62, &v63);
        strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v63);
        dprintf(glog_fd, "%s ", buf);
        dprintf(glog_fd, "%s::%s channelStreamArray at i %ld not valid\n", "CCIOReporterFormatter", "shapeIOReportLibraryFriendlyDictionary", v2);
      }
      return 0;
    }
    v8 = v4;
    Value = (const __CFNumber *)CFDictionaryGetValue(v6, v4);
    if (!Value)
      return 0;
    v10 = Value;
    v11 = CFGetTypeID(Value);
    if (v11 != CFNumberGetTypeID())
      return 0;
    v12 = (const __CFArray *)CFDictionaryGetValue(v6, CFSTR("CCIOReportStream"));
    if (v12)
    {
      v13 = v12;
      v14 = CFGetTypeID(v12);
      if (v14 == CFArrayGetTypeID())
      {
        theArray = CFArrayCreateMutable(v3, 1, MEMORY[0x1E0C9B378]);
        if (theArray)
        {
          for (i = 0; i < CFArrayGetCount(v13); ++i)
          {
            v16 = (const __CFDictionary *)CFArrayGetValueAtIndex(v13, i);
            if (!v16 || (v17 = v16, v18 = CFGetTypeID(v16), v18 != CFDictionaryGetTypeID()))
            {
              v29 = coreCaptureOsLog;
              if (coreCaptureOsLog)
              {
                if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315650;
                  *(_QWORD *)&buf[4] = "CCIOReporterFormatter";
                  *(_WORD *)&buf[12] = 2080;
                  *(_QWORD *)&buf[14] = "shapeIOReportLibraryFriendlyDictionary";
                  *(_WORD *)&buf[22] = 2048;
                  *(_QWORD *)&buf[24] = i;
                  v30 = v29;
                  goto LABEL_85;
                }
              }
              else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315650;
                *(_QWORD *)&buf[4] = "CCIOReporterFormatter";
                *(_WORD *)&buf[12] = 2080;
                *(_QWORD *)&buf[14] = "shapeIOReportLibraryFriendlyDictionary";
                *(_WORD *)&buf[22] = 2048;
                *(_QWORD *)&buf[24] = i;
                v30 = MEMORY[0x1E0C81028];
LABEL_85:
                _os_log_error_impl(&dword_1DB697000, v30, OS_LOG_TYPE_ERROR, "%s::%s didn't find or wrong type in array at i %ld\n", buf, 0x20u);
              }
              v39 = 3758097136;
              if (glog_fd)
              {
                *(_QWORD *)&v40 = 0xAAAAAAAAAAAAAAAALL;
                *((_QWORD *)&v40 + 1) = 0xAAAAAAAAAAAAAAAALL;
                v69 = v40;
                v70 = v40;
                v67 = v40;
                v68 = v40;
                v65 = v40;
                v66 = v40;
                *(_OWORD *)buf = v40;
                *(_OWORD *)&buf[16] = v40;
                memset(&v63, 0, sizeof(v63));
                v62 = 0xAAAAAAAAAAAAAAAALL;
                time(&v62);
                localtime_r(&v62, &v63);
                strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v63);
                dprintf(glog_fd, "%s ", buf);
                dprintf(glog_fd, "%s::%s didn't find or wrong type in array at i %ld\n");
              }
LABEL_61:
              CFRelease(theArray);
              v49 = coreCaptureOsLog;
              if (coreCaptureOsLog)
              {
                if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315394;
                  *(_QWORD *)&buf[4] = "CCIOReporterFormatter";
                  *(_WORD *)&buf[12] = 2080;
                  *(_QWORD *)&buf[14] = "shapeIOReportLibraryFriendlyDictionary";
                  v50 = v49;
                  goto LABEL_80;
                }
              }
              else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                *(_QWORD *)&buf[4] = "CCIOReporterFormatter";
                *(_WORD *)&buf[12] = 2080;
                *(_QWORD *)&buf[14] = "shapeIOReportLibraryFriendlyDictionary";
                v50 = MEMORY[0x1E0C81028];
LABEL_80:
                _os_log_error_impl(&dword_1DB697000, v50, OS_LOG_TYPE_ERROR, "%s::%s failed to store description\n", buf, 0x16u);
              }
              if (glog_fd)
              {
                *(_QWORD *)&v51 = 0xAAAAAAAAAAAAAAAALL;
                *((_QWORD *)&v51 + 1) = 0xAAAAAAAAAAAAAAAALL;
                v69 = v51;
                v70 = v51;
                v67 = v51;
                v68 = v51;
                v65 = v51;
                v66 = v51;
                *(_OWORD *)buf = v51;
                *(_OWORD *)&buf[16] = v51;
                memset(&v63, 0, sizeof(v63));
                v62 = 0xAAAAAAAAAAAAAAAALL;
                time(&v62);
                localtime_r(&v62, &v63);
                strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v63);
                dprintf(glog_fd, "%s ", buf);
                dprintf(glog_fd, "%s::%s failed to store description\n");
              }
              return v39;
            }
            v19 = (const __CFNumber *)CFDictionaryGetValue(v17, CFSTR("CCIOReportInterestSubscriptionIDx"));
            if (!v19 || (v20 = v19, v21 = CFGetTypeID(v19), v21 != CFNumberGetTypeID()))
            {
              v31 = coreCaptureOsLog;
              if (coreCaptureOsLog)
              {
                if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315906;
                  *(_QWORD *)&buf[4] = "CCIOReporterFormatter";
                  *(_WORD *)&buf[12] = 2080;
                  *(_QWORD *)&buf[14] = "shapeIOReportLibraryFriendlyDictionary";
                  *(_WORD *)&buf[22] = 2080;
                  *(_QWORD *)&buf[24] = "CCIOReportInterestSubscriptionIDx";
                  LOWORD(v65) = 2048;
                  *(_QWORD *)((char *)&v65 + 2) = i;
                  v32 = v31;
                  goto LABEL_87;
                }
              }
              else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315906;
                *(_QWORD *)&buf[4] = "CCIOReporterFormatter";
                *(_WORD *)&buf[12] = 2080;
                *(_QWORD *)&buf[14] = "shapeIOReportLibraryFriendlyDictionary";
                *(_WORD *)&buf[22] = 2080;
                *(_QWORD *)&buf[24] = "CCIOReportInterestSubscriptionIDx";
                LOWORD(v65) = 2048;
                *(_QWORD *)((char *)&v65 + 2) = i;
                v32 = MEMORY[0x1E0C81028];
LABEL_87:
                _os_log_error_impl(&dword_1DB697000, v32, OS_LOG_TYPE_ERROR, "%s::%s didn't find %s or wrong type in array at i %ld\n", buf, 0x2Au);
              }
              v39 = 3758097136;
              if (glog_fd)
              {
                *(_QWORD *)&v41 = 0xAAAAAAAAAAAAAAAALL;
                *((_QWORD *)&v41 + 1) = 0xAAAAAAAAAAAAAAAALL;
                v69 = v41;
                v70 = v41;
                v67 = v41;
                v68 = v41;
                v65 = v41;
                v66 = v41;
                *(_OWORD *)buf = v41;
                *(_OWORD *)&buf[16] = v41;
                memset(&v63, 0, sizeof(v63));
                v62 = 0xAAAAAAAAAAAAAAAALL;
                time(&v62);
                localtime_r(&v62, &v63);
                strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v63);
                dprintf(glog_fd, "%s ", buf);
                dprintf(glog_fd, "%s::%s didn't find %s or wrong type in array at i %ld\n");
              }
              goto LABEL_61;
            }
            Aggregate = (__CFDictionary *)IOReportCreateAggregate();
            if (!Aggregate)
            {
              v33 = coreCaptureOsLog;
              if (coreCaptureOsLog)
              {
                if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315394;
                  *(_QWORD *)&buf[4] = "shapeIOReportLibraryFriendlyDictionary";
                  *(_WORD *)&buf[12] = 1024;
                  *(_DWORD *)&buf[14] = 331;
                  v34 = v33;
                  goto LABEL_92;
                }
              }
              else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                *(_QWORD *)&buf[4] = "shapeIOReportLibraryFriendlyDictionary";
                *(_WORD *)&buf[12] = 1024;
                *(_DWORD *)&buf[14] = 331;
                v34 = MEMORY[0x1E0C81028];
LABEL_92:
                _os_log_error_impl(&dword_1DB697000, v34, OS_LOG_TYPE_ERROR, "%s@%d: bail - !legend\n", buf, 0x12u);
              }
              v39 = 3758097086;
              if (glog_fd)
              {
                *(_QWORD *)&v46 = 0xAAAAAAAAAAAAAAAALL;
                *((_QWORD *)&v46 + 1) = 0xAAAAAAAAAAAAAAAALL;
                v69 = v46;
                v70 = v46;
                v67 = v46;
                v68 = v46;
                v65 = v46;
                v66 = v46;
                *(_OWORD *)buf = v46;
                *(_OWORD *)&buf[16] = v46;
                memset(&v63, 0, sizeof(v63));
                v62 = 0xAAAAAAAAAAAAAAAALL;
                time(&v62);
                localtime_r(&v62, &v63);
                strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v63);
                dprintf(glog_fd, "%s ", buf);
                dprintf(glog_fd, "%s@%d: bail - !legend\n");
              }
              goto LABEL_61;
            }
            v23 = Aggregate;
            if (CCIOReporterFormatter::storeChannelDescriptionFromStreamAndSubscription(this, Aggregate, v10, v20))
            {
              v35 = coreCaptureOsLog;
              if (coreCaptureOsLog)
              {
                if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315394;
                  *(_QWORD *)&buf[4] = "CCIOReporterFormatter";
                  *(_WORD *)&buf[12] = 2080;
                  *(_QWORD *)&buf[14] = "shapeIOReportLibraryFriendlyDictionary";
                  v36 = v35;
                  goto LABEL_94;
                }
              }
              else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                *(_QWORD *)&buf[4] = "CCIOReporterFormatter";
                *(_WORD *)&buf[12] = 2080;
                *(_QWORD *)&buf[14] = "shapeIOReportLibraryFriendlyDictionary";
                v36 = MEMORY[0x1E0C81028];
LABEL_94:
                _os_log_error_impl(&dword_1DB697000, v36, OS_LOG_TYPE_ERROR, "%s::%s Failed to create IOReporter library friendly channel list\n", buf, 0x16u);
              }
              if (glog_fd)
              {
                *(_QWORD *)&v47 = 0xAAAAAAAAAAAAAAAALL;
                *((_QWORD *)&v47 + 1) = 0xAAAAAAAAAAAAAAAALL;
                v69 = v47;
                v70 = v47;
                v67 = v47;
                v68 = v47;
                v65 = v47;
                v66 = v47;
                *(_OWORD *)buf = v47;
                *(_OWORD *)&buf[16] = v47;
                memset(&v63, 0, sizeof(v63));
                v62 = 0xAAAAAAAAAAAAAAAALL;
                time(&v62);
                localtime_r(&v62, &v63);
                strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v63);
                dprintf(glog_fd, "%s ", buf);
                dprintf(glog_fd, "%s::%s Failed to create IOReporter library friendly channel list\n", "CCIOReporterFormatter", "shapeIOReportLibraryFriendlyDictionary");
              }
              CFRelease(v23);
              v39 = 3758097084;
              goto LABEL_61;
            }
            Mutable = CFDictionaryCreateMutable(v3, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
            if (!Mutable)
            {
              v37 = coreCaptureOsLog;
              if (coreCaptureOsLog)
              {
                if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315394;
                  *(_QWORD *)&buf[4] = "CCIOReporterFormatter";
                  *(_WORD *)&buf[12] = 2080;
                  *(_QWORD *)&buf[14] = "shapeIOReportLibraryFriendlyDictionary";
                  v38 = v37;
                  goto LABEL_96;
                }
              }
              else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                *(_QWORD *)&buf[4] = "CCIOReporterFormatter";
                *(_WORD *)&buf[12] = 2080;
                *(_QWORD *)&buf[14] = "shapeIOReportLibraryFriendlyDictionary";
                v38 = MEMORY[0x1E0C81028];
LABEL_96:
                _os_log_error_impl(&dword_1DB697000, v38, OS_LOG_TYPE_ERROR, "%s::%s Can't create subscriptionLegendDictionary\n", buf, 0x16u);
              }
              if (glog_fd)
              {
                *(_QWORD *)&v48 = 0xAAAAAAAAAAAAAAAALL;
                *((_QWORD *)&v48 + 1) = 0xAAAAAAAAAAAAAAAALL;
                v69 = v48;
                v70 = v48;
                v67 = v48;
                v68 = v48;
                v65 = v48;
                v66 = v48;
                *(_OWORD *)buf = v48;
                *(_OWORD *)&buf[16] = v48;
                memset(&v63, 0, sizeof(v63));
                v62 = 0xAAAAAAAAAAAAAAAALL;
                time(&v62);
                localtime_r(&v62, &v63);
                strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v63);
                dprintf(glog_fd, "%s ", buf);
                dprintf(glog_fd, "%s::%s Can't create subscriptionLegendDictionary\n", "CCIOReporterFormatter", "shapeIOReportLibraryFriendlyDictionary");
              }
              CFRelease(v23);
              v39 = 3758097085;
              goto LABEL_61;
            }
            v25 = Mutable;
            CFDictionarySetValue(Mutable, CFSTR("CCIOReportInterestSubscriptionIDx"), v20);
            CFDictionarySetValue(v25, CFSTR("CCIOReportInterests"), v23);
            CFRelease(v23);
            CFArrayAppendValue(theArray, v25);
            CFRelease(v25);
          }
          v26 = CFDictionaryCreateMutable(v3, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
          if (v26)
          {
            v27 = v26;
            v28 = v10;
            v4 = v8;
            CFDictionarySetValue(v26, v8, v28);
            CFDictionarySetValue(v27, CFSTR("CCIOReportStream"), theArray);
            CFRelease(theArray);
            CFArrayAppendValue(this[6], v27);
            CFRelease(v27);
            v2 = i + 1;
            continue;
          }
          v58 = coreCaptureOsLog;
          if (coreCaptureOsLog)
          {
            if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              *(_QWORD *)&buf[4] = "CCIOReporterFormatter";
              *(_WORD *)&buf[12] = 2080;
              *(_QWORD *)&buf[14] = "shapeIOReportLibraryFriendlyDictionary";
              v59 = v58;
LABEL_108:
              _os_log_error_impl(&dword_1DB697000, v59, OS_LOG_TYPE_ERROR, "%s::%s Can't create channelStreamDictionary\n", buf, 0x16u);
            }
          }
          else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            *(_QWORD *)&buf[4] = "CCIOReporterFormatter";
            *(_WORD *)&buf[12] = 2080;
            *(_QWORD *)&buf[14] = "shapeIOReportLibraryFriendlyDictionary";
            v59 = MEMORY[0x1E0C81028];
            goto LABEL_108;
          }
          if (glog_fd)
          {
            *(_QWORD *)&v60 = 0xAAAAAAAAAAAAAAAALL;
            *((_QWORD *)&v60 + 1) = 0xAAAAAAAAAAAAAAAALL;
            v69 = v60;
            v70 = v60;
            v67 = v60;
            v68 = v60;
            v65 = v60;
            v66 = v60;
            *(_OWORD *)buf = v60;
            *(_OWORD *)&buf[16] = v60;
            memset(&v63, 0, sizeof(v63));
            v62 = 0xAAAAAAAAAAAAAAAALL;
            time(&v62);
            localtime_r(&v62, &v63);
            strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v63);
            dprintf(glog_fd, "%s ", buf);
            dprintf(glog_fd, "%s::%s Can't create channelStreamDictionary\n", "CCIOReporterFormatter", "shapeIOReportLibraryFriendlyDictionary");
          }
          CFRelease(theArray);
          return 3758097085;
        }
        v52 = coreCaptureOsLog;
        if (coreCaptureOsLog)
        {
          if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
            goto LABEL_82;
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "CCIOReporterFormatter";
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "shapeIOReportLibraryFriendlyDictionary";
          v53 = v52;
        }
        else
        {
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            goto LABEL_82;
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "CCIOReporterFormatter";
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "shapeIOReportLibraryFriendlyDictionary";
          v53 = MEMORY[0x1E0C81028];
        }
        _os_log_error_impl(&dword_1DB697000, v53, OS_LOG_TYPE_ERROR, "%s::%s !subscriptionLegendDictionaryArray\n", buf, 0x16u);
LABEL_82:
        v39 = 3758097084;
        if (glog_fd)
        {
          *(_QWORD *)&v57 = 0xAAAAAAAAAAAAAAAALL;
          *((_QWORD *)&v57 + 1) = 0xAAAAAAAAAAAAAAAALL;
          v69 = v57;
          v70 = v57;
          v67 = v57;
          v68 = v57;
          v65 = v57;
          v66 = v57;
          *(_OWORD *)buf = v57;
          *(_OWORD *)&buf[16] = v57;
          memset(&v63, 0, sizeof(v63));
          v62 = 0xAAAAAAAAAAAAAAAALL;
          time(&v62);
          localtime_r(&v62, &v63);
          strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v63);
          dprintf(glog_fd, "%s ", buf);
          dprintf(glog_fd, "%s::%s !subscriptionLegendDictionaryArray\n");
        }
        return v39;
      }
    }
    break;
  }
  v44 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
      goto LABEL_77;
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "CCIOReporterFormatter";
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "shapeIOReportLibraryFriendlyDictionary";
    *(_WORD *)&buf[22] = 2080;
    *(_QWORD *)&buf[24] = "CCIOReportStream";
    v45 = v44;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_77;
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "CCIOReporterFormatter";
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "shapeIOReportLibraryFriendlyDictionary";
    *(_WORD *)&buf[22] = 2080;
    *(_QWORD *)&buf[24] = "CCIOReportStream";
    v45 = MEMORY[0x1E0C81028];
  }
  _os_log_error_impl(&dword_1DB697000, v45, OS_LOG_TYPE_ERROR, "%s::%s didn't find %s\n", buf, 0x20u);
LABEL_77:
  v39 = 3758097136;
  if (glog_fd)
  {
    *(_QWORD *)&v56 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v56 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v69 = v56;
    v70 = v56;
    v67 = v56;
    v68 = v56;
    v65 = v56;
    v66 = v56;
    *(_OWORD *)buf = v56;
    *(_OWORD *)&buf[16] = v56;
    memset(&v63, 0, sizeof(v63));
    v62 = 0xAAAAAAAAAAAAAAAALL;
    time(&v62);
    localtime_r(&v62, &v63);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v63);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "%s::%s didn't find %s\n");
  }
  return v39;
}

uint64_t CCIOReporterFormatter::storeChannelDescriptionFromStreamAndSubscription(CFArrayRef *this, __CFDictionary *a2, const __CFNumber *a3, const __CFNumber *a4)
{
  CFIndex v5;
  uint64_t v6;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v8;
  CFTypeID v9;
  const __CFNumber *Value;
  const __CFNumber *v11;
  CFTypeID v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  time_t v26;
  tm v27;
  _BYTE buf[32];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;

  v5 = 0;
  v6 = 0;
  v35 = *MEMORY[0x1E0C80C00];
  while (v5 < CFArrayGetCount(this[5]))
  {
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(this[5], v5);
    if (!ValueAtIndex)
      break;
    v8 = ValueAtIndex;
    v9 = CFGetTypeID(ValueAtIndex);
    if (v9 != CFDictionaryGetTypeID())
      break;
    Value = (const __CFNumber *)CFDictionaryGetValue(v8, CFSTR("Id"));
    if (!Value)
    {
      v15 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)&buf[4] = "CCIOReporterFormatter";
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "storeChannelDescriptionFromStreamAndSubscription";
          *(_WORD *)&buf[22] = 2080;
          *(_QWORD *)&buf[24] = "Id";
          v16 = v15;
          goto LABEL_19;
        }
      }
      else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "CCIOReporterFormatter";
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "storeChannelDescriptionFromStreamAndSubscription";
        *(_WORD *)&buf[22] = 2080;
        *(_QWORD *)&buf[24] = "Id";
        v16 = MEMORY[0x1E0C81028];
LABEL_19:
        _os_log_impl(&dword_1DB697000, v16, OS_LOG_TYPE_DEFAULT, "%s::%s no key %s in dictionary\n", buf, 0x20u);
      }
      if (glog_fd)
      {
        *(_QWORD *)&v19 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v33 = v19;
        v34 = v19;
        v31 = v19;
        v32 = v19;
        v29 = v19;
        v30 = v19;
        *(_OWORD *)buf = v19;
        *(_OWORD *)&buf[16] = v19;
        memset(&v27, 0, sizeof(v27));
        v26 = 0xAAAAAAAAAAAAAAAALL;
        time(&v26);
        localtime_r(&v26, &v27);
        strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v27);
        dprintf(glog_fd, "%s ", buf);
        dprintf(glog_fd, "%s::%s no key %s in dictionary\n");
      }
      goto LABEL_34;
    }
    v11 = Value;
    v12 = CFGetTypeID(Value);
    if (v12 != CFNumberGetTypeID())
    {
      v17 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          *(_QWORD *)&buf[4] = "CCIOReporterFormatter";
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "storeChannelDescriptionFromStreamAndSubscription";
          *(_WORD *)&buf[22] = 2080;
          *(_QWORD *)&buf[24] = "Id";
          v18 = v17;
          goto LABEL_26;
        }
      }
      else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "CCIOReporterFormatter";
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "storeChannelDescriptionFromStreamAndSubscription";
        *(_WORD *)&buf[22] = 2080;
        *(_QWORD *)&buf[24] = "Id";
        v18 = MEMORY[0x1E0C81028];
LABEL_26:
        _os_log_impl(&dword_1DB697000, v18, OS_LOG_TYPE_DEFAULT, "%s::%s key %s has wrong type in dictionary\n", buf, 0x20u);
      }
      if (glog_fd)
      {
        *(_QWORD *)&v20 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v33 = v20;
        v34 = v20;
        v31 = v20;
        v32 = v20;
        v29 = v20;
        v30 = v20;
        *(_OWORD *)buf = v20;
        *(_OWORD *)&buf[16] = v20;
        memset(&v27, 0, sizeof(v27));
        v26 = 0xAAAAAAAAAAAAAAAALL;
        time(&v26);
        localtime_r(&v26, &v27);
        strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v27);
        dprintf(glog_fd, "%s ", buf);
        dprintf(glog_fd, "%s::%s key %s has wrong type in dictionary\n");
      }
      goto LABEL_34;
    }
    if (CFNumberCompare(v11, a3, 0))
    {
      v13 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "CCIOReporterFormatter";
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "storeChannelDescriptionFromStreamAndSubscription";
          v14 = v13;
          goto LABEL_31;
        }
      }
      else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = "CCIOReporterFormatter";
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "storeChannelDescriptionFromStreamAndSubscription";
        v14 = MEMORY[0x1E0C81028];
LABEL_31:
        _os_log_impl(&dword_1DB697000, v14, OS_LOG_TYPE_DEFAULT, "%s::%s not a matching Stream id\n", buf, 0x16u);
      }
      if (glog_fd)
      {
        *(_QWORD *)&v21 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v21 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v33 = v21;
        v34 = v21;
        v31 = v21;
        v32 = v21;
        v29 = v21;
        v30 = v21;
        *(_OWORD *)buf = v21;
        *(_OWORD *)&buf[16] = v21;
        memset(&v27, 0, sizeof(v27));
        v26 = 0xAAAAAAAAAAAAAAAALL;
        time(&v26);
        localtime_r(&v26, &v27);
        strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v27);
        dprintf(glog_fd, "%s ", buf);
        dprintf(glog_fd, "%s::%s not a matching Stream id\n");
      }
      goto LABEL_34;
    }
    v6 = CCIOReporterFormatter::storeChannelDescriptionFromSubscription(0, a2, v8, a4);
    if (!(_DWORD)v6)
      return v6;
LABEL_34:
    ++v5;
  }
  return v6;
}

uint64_t CCIOReporterFormatter::storeChannelDescriptionFromSubscription(CCIOReporterFormatter *this, __CFDictionary *a2, CFDictionaryRef theDict, const __CFNumber *a4)
{
  const __CFArray *Value;
  const __CFArray *v7;
  CFTypeID v8;
  CFIndex v9;
  uint64_t v10;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v12;
  CFTypeID v13;
  const __CFNumber *v14;
  const __CFNumber *v15;
  CFTypeID v16;
  const __CFArray *v17;
  const __CFArray *v18;
  CFTypeID v19;
  CFIndex v20;
  const __CFDictionary *v21;
  const __CFDictionary *v22;
  CFTypeID v23;
  CCIOReporterFormatter *TypeID;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  NSObject *v29;
  uint64_t v30;
  unint64_t v31;
  NSObject *v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  NSObject *v36;
  __int128 v37;
  uint64_t v38;
  unint64_t v39;
  NSObject *v40;
  __int128 v41;
  uint64_t v42;
  NSObject *v43;
  __int128 v44;
  uint64_t v46;
  NSObject *v47;
  uint64_t v48;
  NSObject *v49;
  __int128 v50;
  __int128 v51;
  time_t v52;
  tm v53;
  _BYTE buf[32];
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  Value = (const __CFArray *)CFDictionaryGetValue(theDict, CFSTR("CCIOReportStream"));
  if (!Value || (v7 = Value, v8 = CFGetTypeID(Value), v8 != CFArrayGetTypeID()))
  {
    v35 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_40;
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "CCIOReporterFormatter";
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "storeChannelDescriptionFromSubscription";
      *(_WORD *)&buf[22] = 2080;
      *(_QWORD *)&buf[24] = "CCIOReportStream";
      v36 = v35;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_40;
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "CCIOReporterFormatter";
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "storeChannelDescriptionFromSubscription";
      *(_WORD *)&buf[22] = 2080;
      *(_QWORD *)&buf[24] = "CCIOReportStream";
      v36 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v36, OS_LOG_TYPE_ERROR, "%s::%s didn't find %s\n", buf, 0x20u);
LABEL_40:
    v10 = 3758097136;
    if (glog_fd)
    {
      *(_QWORD *)&v37 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v37 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v59 = v37;
      v60 = v37;
      v57 = v37;
      v58 = v37;
      v55 = v37;
      v56 = v37;
      *(_OWORD *)buf = v37;
      *(_OWORD *)&buf[16] = v37;
      memset(&v53, 0, sizeof(v53));
      v52 = 0xAAAAAAAAAAAAAAAALL;
      time(&v52);
      localtime_r(&v52, &v53);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v53);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "%s::%s didn't find %s\n", "CCIOReporterFormatter", "storeChannelDescriptionFromSubscription", "CCIOReportStream");
    }
    return v10;
  }
  v9 = 0;
  v10 = 3758097136;
  while (1)
  {
    if (v9 >= CFArrayGetCount(v7))
    {
      v39 = 0x1F02F7000;
      if ((_DWORD)v10 == -536870160)
        goto LABEL_50;
      return v10;
    }
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v7, v9);
    if (!ValueAtIndex)
      break;
    v12 = ValueAtIndex;
    v13 = CFGetTypeID(ValueAtIndex);
    if (v13 != CFDictionaryGetTypeID())
      break;
    v14 = (const __CFNumber *)CFDictionaryGetValue(v12, CFSTR("CCIOReportInterestSubscriptionIDx"));
    if (v14)
    {
      v15 = v14;
      v16 = CFGetTypeID(v14);
      if (v16 == CFNumberGetTypeID() && CFNumberCompare(v15, a4, 0) == kCFCompareEqualTo)
      {
        v17 = (const __CFArray *)CFDictionaryGetValue(v12, CFSTR("CCIOReportInterests"));
        if (v17)
        {
          v18 = v17;
          v19 = CFGetTypeID(v17);
          if (v19 == CFArrayGetTypeID())
          {
            if (CFArrayGetCount(v18))
            {
              v20 = 0;
              while (1)
              {
                if (CFArrayGetCount(v18) <= v20)
                  goto LABEL_31;
                v21 = (const __CFDictionary *)CFArrayGetValueAtIndex(v18, v20);
                if (!v21)
                  break;
                v22 = v21;
                v23 = CFGetTypeID(v21);
                TypeID = (CCIOReporterFormatter *)CFDictionaryGetTypeID();
                if ((CCIOReporterFormatter *)v23 != TypeID)
                  break;
                v25 = CCIOReporterFormatter::storeChannelDescriptionFromDriverGroup(TypeID, a2, v22);
                v10 = 0;
                ++v20;
                if ((_DWORD)v25)
                {
                  v26 = v25;
                  v27 = coreCaptureOsLog;
                  if (coreCaptureOsLog)
                  {
                    v28 = 0x1F02F7000;
                    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 136315394;
                      *(_QWORD *)&buf[4] = "CCIOReporterFormatter";
                      *(_WORD *)&buf[12] = 2080;
                      *(_QWORD *)&buf[14] = "storeChannelDescriptionFromSubscription";
                      v29 = v27;
                      goto LABEL_35;
                    }
                  }
                  else
                  {
                    v28 = 0x1F02F7000uLL;
                    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 136315394;
                      *(_QWORD *)&buf[4] = "CCIOReporterFormatter";
                      *(_WORD *)&buf[12] = 2080;
                      *(_QWORD *)&buf[14] = "storeChannelDescriptionFromSubscription";
                      v29 = MEMORY[0x1E0C81028];
LABEL_35:
                      _os_log_error_impl(&dword_1DB697000, v29, OS_LOG_TYPE_ERROR, "%s::%s failed to store Channel Description\n", buf, 0x16u);
                    }
                  }
                  if (*(_DWORD *)(v28 + 1688))
                  {
                    *(_QWORD *)&v34 = 0xAAAAAAAAAAAAAAAALL;
                    *((_QWORD *)&v34 + 1) = 0xAAAAAAAAAAAAAAAALL;
                    v59 = v34;
                    v60 = v34;
                    v57 = v34;
                    v58 = v34;
                    v55 = v34;
                    v56 = v34;
                    *(_OWORD *)buf = v34;
                    *(_OWORD *)&buf[16] = v34;
                    memset(&v53, 0, sizeof(v53));
                    v52 = 0xAAAAAAAAAAAAAAAALL;
                    time(&v52);
                    localtime_r(&v52, &v53);
                    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v53);
                    dprintf(*(_DWORD *)(v28 + 1688), "%s ", buf);
                    dprintf(*(_DWORD *)(v28 + 1688), "%s::%s failed to store Channel Description\n");
                  }
LABEL_30:
                  v10 = v26;
                  goto LABEL_31;
                }
              }
              v30 = coreCaptureOsLog;
              if (coreCaptureOsLog)
              {
                v31 = 0x1F02F7000;
                if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315394;
                  *(_QWORD *)&buf[4] = "CCIOReporterFormatter";
                  *(_WORD *)&buf[12] = 2080;
                  *(_QWORD *)&buf[14] = "storeChannelDescriptionFromSubscription";
                  v32 = v30;
                  goto LABEL_33;
                }
              }
              else
              {
                v31 = 0x1F02F7000uLL;
                if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315394;
                  *(_QWORD *)&buf[4] = "CCIOReporterFormatter";
                  *(_WORD *)&buf[12] = 2080;
                  *(_QWORD *)&buf[14] = "storeChannelDescriptionFromSubscription";
                  v32 = MEMORY[0x1E0C81028];
LABEL_33:
                  _os_log_error_impl(&dword_1DB697000, v32, OS_LOG_TYPE_ERROR, "%s::%s didn't find or not a dict in array\n", buf, 0x16u);
                }
              }
              v10 = 3758097136;
              if (!*(_DWORD *)(v31 + 1688))
                goto LABEL_31;
              *(_QWORD *)&v33 = 0xAAAAAAAAAAAAAAAALL;
              *((_QWORD *)&v33 + 1) = 0xAAAAAAAAAAAAAAAALL;
              v59 = v33;
              v60 = v33;
              v57 = v33;
              v58 = v33;
              v55 = v33;
              v56 = v33;
              *(_OWORD *)buf = v33;
              *(_OWORD *)&buf[16] = v33;
              memset(&v53, 0, sizeof(v53));
              v52 = 0xAAAAAAAAAAAAAAAALL;
              time(&v52);
              localtime_r(&v52, &v53);
              strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v53);
              dprintf(glog_fd, "%s ", buf);
              v26 = 3758097136;
              dprintf(glog_fd, "%s::%s didn't find or not a dict in array\n");
              goto LABEL_30;
            }
            v48 = coreCaptureOsLog;
            if (coreCaptureOsLog)
            {
              v39 = 0x1F02F7000;
              if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                *(_QWORD *)&buf[4] = "CCIOReporterFormatter";
                *(_WORD *)&buf[12] = 2080;
                *(_QWORD *)&buf[14] = "storeChannelDescriptionFromSubscription";
                v49 = v48;
                goto LABEL_79;
              }
            }
            else
            {
              v39 = 0x1F02F7000uLL;
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315394;
                *(_QWORD *)&buf[4] = "CCIOReporterFormatter";
                *(_WORD *)&buf[12] = 2080;
                *(_QWORD *)&buf[14] = "storeChannelDescriptionFromSubscription";
                v49 = MEMORY[0x1E0C81028];
LABEL_79:
                _os_log_error_impl(&dword_1DB697000, v49, OS_LOG_TYPE_ERROR, "%s::%s empty array\n", buf, 0x16u);
              }
            }
            if (*(_DWORD *)(v39 + 1688))
            {
              *(_QWORD *)&v51 = 0xAAAAAAAAAAAAAAAALL;
              *((_QWORD *)&v51 + 1) = 0xAAAAAAAAAAAAAAAALL;
              v59 = v51;
              v60 = v51;
              v57 = v51;
              v58 = v51;
              v55 = v51;
              v56 = v51;
              *(_OWORD *)buf = v51;
              *(_OWORD *)&buf[16] = v51;
              memset(&v53, 0, sizeof(v53));
              v52 = 0xAAAAAAAAAAAAAAAALL;
              time(&v52);
              localtime_r(&v52, &v53);
              strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v53);
              dprintf(*(_DWORD *)(v39 + 1688), "%s ", buf);
              dprintf(*(_DWORD *)(v39 + 1688), "%s::%s empty array\n");
            }
            goto LABEL_50;
          }
        }
        v46 = coreCaptureOsLog;
        v39 = 0x1F02F7000uLL;
        if (coreCaptureOsLog)
        {
          if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315906;
            *(_QWORD *)&buf[4] = "CCIOReporterFormatter";
            *(_WORD *)&buf[12] = 2080;
            *(_QWORD *)&buf[14] = "storeChannelDescriptionFromSubscription";
            *(_WORD *)&buf[22] = 2048;
            *(_QWORD *)&buf[24] = v9;
            LOWORD(v55) = 2080;
            *(_QWORD *)((char *)&v55 + 2) = "CCIOReportInterests";
            v47 = v46;
            goto LABEL_77;
          }
        }
        else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315906;
          *(_QWORD *)&buf[4] = "CCIOReporterFormatter";
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = "storeChannelDescriptionFromSubscription";
          *(_WORD *)&buf[22] = 2048;
          *(_QWORD *)&buf[24] = v9;
          LOWORD(v55) = 2080;
          *(_QWORD *)((char *)&v55 + 2) = "CCIOReportInterests";
          v47 = MEMORY[0x1E0C81028];
LABEL_77:
          _os_log_error_impl(&dword_1DB697000, v47, OS_LOG_TYPE_ERROR, "%s::%s  didn't find or wrong type in dict at i %ld for %s\n", buf, 0x2Au);
        }
        if (glog_fd)
        {
          *(_QWORD *)&v50 = 0xAAAAAAAAAAAAAAAALL;
          *((_QWORD *)&v50 + 1) = 0xAAAAAAAAAAAAAAAALL;
          v59 = v50;
          v60 = v50;
          v57 = v50;
          v58 = v50;
          v55 = v50;
          v56 = v50;
          *(_OWORD *)buf = v50;
          *(_OWORD *)&buf[16] = v50;
          memset(&v53, 0, sizeof(v53));
          v52 = 0xAAAAAAAAAAAAAAAALL;
          time(&v52);
          localtime_r(&v52, &v53);
          strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v53);
          dprintf(glog_fd, "%s ", buf);
          dprintf(glog_fd, "%s::%s  didn't find or wrong type in dict at i %ld for %s\n");
        }
        goto LABEL_50;
      }
    }
LABEL_31:
    ++v9;
  }
  v38 = coreCaptureOsLog;
  v39 = 0x1F02F7000uLL;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "CCIOReporterFormatter";
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "storeChannelDescriptionFromSubscription";
      *(_WORD *)&buf[22] = 2048;
      *(_QWORD *)&buf[24] = v9;
      v40 = v38;
      goto LABEL_72;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "CCIOReporterFormatter";
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "storeChannelDescriptionFromSubscription";
    *(_WORD *)&buf[22] = 2048;
    *(_QWORD *)&buf[24] = v9;
    v40 = MEMORY[0x1E0C81028];
LABEL_72:
    _os_log_error_impl(&dword_1DB697000, v40, OS_LOG_TYPE_ERROR, "%s::%s didn't find or wrong type in array at i %ld\n", buf, 0x20u);
  }
  if (glog_fd)
  {
    *(_QWORD *)&v41 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v41 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v59 = v41;
    v60 = v41;
    v57 = v41;
    v58 = v41;
    v55 = v41;
    v56 = v41;
    *(_OWORD *)buf = v41;
    *(_OWORD *)&buf[16] = v41;
    memset(&v53, 0, sizeof(v53));
    v52 = 0xAAAAAAAAAAAAAAAALL;
    time(&v52);
    localtime_r(&v52, &v53);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v53);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "%s::%s didn't find or wrong type in array at i %ld\n");
  }
LABEL_50:
  v42 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "CCIOReporterFormatter";
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "storeChannelDescriptionFromSubscription";
      v43 = v42;
      goto LABEL_70;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "CCIOReporterFormatter";
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "storeChannelDescriptionFromSubscription";
    v43 = MEMORY[0x1E0C81028];
LABEL_70:
    _os_log_error_impl(&dword_1DB697000, v43, OS_LOG_TYPE_ERROR, "%s::%s didn't find matching subscription\n", buf, 0x16u);
  }
  if (*(_DWORD *)(v39 + 1688))
  {
    *(_QWORD *)&v44 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v44 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v59 = v44;
    v60 = v44;
    v57 = v44;
    v58 = v44;
    v55 = v44;
    v56 = v44;
    *(_OWORD *)buf = v44;
    *(_OWORD *)&buf[16] = v44;
    memset(&v53, 0, sizeof(v53));
    v52 = 0xAAAAAAAAAAAAAAAALL;
    time(&v52);
    localtime_r(&v52, &v53);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v53);
    dprintf(*(_DWORD *)(v39 + 1688), "%s ", buf);
    dprintf(*(_DWORD *)(v39 + 1688), "%s::%s didn't find matching subscription\n", "CCIOReporterFormatter", "storeChannelDescriptionFromSubscription");
  }
  return 3758097136;
}

uint64_t CCIOReporterFormatter::storeChannelDescriptionFromDriverGroup(CCIOReporterFormatter *this, __CFDictionary *a2, CFDictionaryRef theDict)
{
  uint64_t v4;
  const void *Value;
  const void *v6;
  CFTypeID v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  __int128 v13;
  __int128 v14;
  int v15;
  const void *v16;
  const void *v17;
  CFTypeID v18;
  uint64_t v19;
  CFTypeID TypeID;
  CFTypeID v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  __int128 v25;
  __int128 v26;
  int v27;
  const __CFNumber *v28;
  const __CFNumber *v29;
  CFTypeID v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  CFTypeID v36;
  CFTypeID v37;
  NSObject *v38;
  __int128 v39;
  __int128 v40;
  int v41;
  __int128 v42;
  const __CFString *v43;
  CFStringRef v44;
  CFTypeID v45;
  const __CFDictionary *v46;
  uint64_t MatchingService;
  __int128 v48;
  uint64_t v49;
  CFTypeID v50;
  CFTypeID v51;
  NSObject *v52;
  uint64_t v53;
  NSObject *v54;
  __int128 v55;
  int v56;
  __int128 v57;
  const void *v58;
  const void *v59;
  CFTypeID v60;
  uint64_t v61;
  CFTypeID v62;
  CFTypeID v63;
  NSObject *v64;
  __int128 v65;
  int v66;
  CFTypeID v67;
  CFTypeID v68;
  const __CFArray *v69;
  const __CFArray *v70;
  CFTypeID v71;
  CFIndex v72;
  const __CFArray *ValueAtIndex;
  const __CFArray *v74;
  CFTypeID v75;
  const void *v76;
  const void *v77;
  const __CFNumber *v78;
  const __CFNumber *v79;
  CFTypeID v80;
  const __CFNumber *v81;
  const __CFNumber *v82;
  CFTypeID v83;
  const void *v84;
  const void *v85;
  CFTypeID v86;
  const void *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  NSObject *v93;
  uint64_t v94;
  CFTypeID v95;
  CFTypeID v96;
  NSObject *v97;
  __int128 v98;
  __int128 v99;
  int v100;
  uint64_t v102;
  NSObject *v103;
  __int128 v104;
  CFTypeID v105;
  CFTypeID v106;
  CFTypeID v107;
  CFTypeID v108;
  CFTypeID v109;
  CFTypeID v110;
  CFTypeID v111;
  CFTypeID v112;
  CFTypeID v113;
  CFTypeID v114;
  const __CFString *v115;
  time_t v117;
  tm v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t valuePtr;
  _BYTE cStr[32];
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  uint64_t v129;

  v129 = *MEMORY[0x1E0C80C00];
  v120 = 0;
  valuePtr = 0;
  v4 = 3758097136;
  v119 = 0;
  Value = CFDictionaryGetValue(theDict, CFSTR("IOReportGroupName"));
  if (!Value)
  {
    v9 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_11;
      *(_DWORD *)cStr = 136315138;
      *(_QWORD *)&cStr[4] = "IOReportGroupName";
      v10 = v9;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_11;
      *(_DWORD *)cStr = 136315138;
      *(_QWORD *)&cStr[4] = "IOReportGroupName";
      v10 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v10, OS_LOG_TYPE_ERROR, "CCIOReporterFormatter::storeChannelDescriptionFromDriverGroup %s expected \n", cStr, 0xCu);
LABEL_11:
    if (glog_fd)
    {
      *(_QWORD *)&v13 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v127 = v13;
      v128 = v13;
      v125 = v13;
      v126 = v13;
      v124 = v13;
      *(_OWORD *)&cStr[16] = v13;
      v123 = v13;
      *(_OWORD *)cStr = v13;
      memset(&v118, 0, sizeof(v118));
      v117 = 0xAAAAAAAAAAAAAAAALL;
      time(&v117);
      localtime_r(&v117, &v118);
      strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", &v118);
      dprintf(glog_fd, "%s ", cStr);
      dprintf(glog_fd, "CCIOReporterFormatter::storeChannelDescriptionFromDriverGroup %s expected \n");
    }
    goto LABEL_16;
  }
  v6 = Value;
  v7 = CFGetTypeID(Value);
  if (v7 == CFStringGetTypeID())
  {
    v8 = 0;
    goto LABEL_17;
  }
  v11 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_DWORD *)cStr = 136315906;
    *(_QWORD *)&cStr[4] = "IOReportGroupName";
    *(_WORD *)&cStr[12] = 2080;
    *(_QWORD *)&cStr[14] = " NOT";
    *(_WORD *)&cStr[22] = 2048;
    *(_QWORD *)&cStr[24] = CFStringGetTypeID();
    LOWORD(v123) = 2048;
    *(_QWORD *)((char *)&v123 + 2) = CFGetTypeID(v6);
    v12 = v11;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_DWORD *)cStr = 136315906;
    *(_QWORD *)&cStr[4] = "IOReportGroupName";
    *(_WORD *)&cStr[12] = 2080;
    *(_QWORD *)&cStr[14] = " NOT";
    *(_WORD *)&cStr[22] = 2048;
    *(_QWORD *)&cStr[24] = CFStringGetTypeID();
    LOWORD(v123) = 2048;
    *(_QWORD *)((char *)&v123 + 2) = CFGetTypeID(v6);
    v12 = MEMORY[0x1E0C81028];
  }
  _os_log_error_impl(&dword_1DB697000, v12, OS_LOG_TYPE_ERROR, "CCIOReporterFormatter::storeChannelDescriptionFromDriverGroup %s expected obj is%s NULL, with type %ld, but has type %ld\n", cStr, 0x2Au);
LABEL_14:
  if (glog_fd)
  {
    *(_QWORD *)&v14 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v127 = v14;
    v128 = v14;
    v125 = v14;
    v126 = v14;
    v124 = v14;
    *(_OWORD *)&cStr[16] = v14;
    v123 = v14;
    *(_OWORD *)cStr = v14;
    memset(&v118, 0, sizeof(v118));
    v117 = 0xAAAAAAAAAAAAAAAALL;
    time(&v117);
    localtime_r(&v117, &v118);
    strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", &v118);
    dprintf(glog_fd, "%s ", cStr);
    v15 = glog_fd;
    CFStringGetTypeID();
    CFGetTypeID(v6);
    dprintf(v15, "CCIOReporterFormatter::storeChannelDescriptionFromDriverGroup %s expected obj is%s NULL, with type %ld, but has type %ld\n");
  }
LABEL_16:
  v6 = 0;
  v8 = 3758097136;
LABEL_17:
  v16 = CFDictionaryGetValue(theDict, CFSTR("IOReportSubGroupName"));
  if (!v16)
  {
    v23 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_26;
      *(_DWORD *)cStr = 136315138;
      *(_QWORD *)&cStr[4] = "IOReportSubGroupName";
      v24 = v23;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_26;
      *(_DWORD *)cStr = 136315138;
      *(_QWORD *)&cStr[4] = "IOReportSubGroupName";
      v24 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v24, OS_LOG_TYPE_ERROR, "CCIOReporterFormatter::storeChannelDescriptionFromDriverGroup %s expected \n", cStr, 0xCu);
LABEL_26:
    if (glog_fd)
    {
      *(_QWORD *)&v25 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v25 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v127 = v25;
      v128 = v25;
      v125 = v25;
      v126 = v25;
      v124 = v25;
      *(_OWORD *)&cStr[16] = v25;
      v123 = v25;
      *(_OWORD *)cStr = v25;
      memset(&v118, 0, sizeof(v118));
      v117 = 0xAAAAAAAAAAAAAAAALL;
      time(&v117);
      localtime_r(&v117, &v118);
      strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", &v118);
      dprintf(glog_fd, "%s ", cStr);
      dprintf(glog_fd, "CCIOReporterFormatter::storeChannelDescriptionFromDriverGroup %s expected \n");
    }
    goto LABEL_31;
  }
  v17 = v16;
  v18 = CFGetTypeID(v16);
  if (v18 == CFStringGetTypeID())
    goto LABEL_32;
  v19 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
      goto LABEL_29;
    TypeID = CFStringGetTypeID();
    v21 = CFGetTypeID(v17);
    *(_DWORD *)cStr = 136315906;
    *(_QWORD *)&cStr[4] = "IOReportSubGroupName";
    *(_WORD *)&cStr[12] = 2080;
    *(_QWORD *)&cStr[14] = " NOT";
    *(_WORD *)&cStr[22] = 2048;
    *(_QWORD *)&cStr[24] = TypeID;
    LOWORD(v123) = 2048;
    *(_QWORD *)((char *)&v123 + 2) = v21;
    v22 = v19;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_29;
    v105 = CFStringGetTypeID();
    v106 = CFGetTypeID(v17);
    *(_DWORD *)cStr = 136315906;
    *(_QWORD *)&cStr[4] = "IOReportSubGroupName";
    *(_WORD *)&cStr[12] = 2080;
    *(_QWORD *)&cStr[14] = " NOT";
    *(_WORD *)&cStr[22] = 2048;
    *(_QWORD *)&cStr[24] = v105;
    LOWORD(v123) = 2048;
    *(_QWORD *)((char *)&v123 + 2) = v106;
    v22 = MEMORY[0x1E0C81028];
  }
  _os_log_error_impl(&dword_1DB697000, v22, OS_LOG_TYPE_ERROR, "CCIOReporterFormatter::storeChannelDescriptionFromDriverGroup %s expected obj is%s NULL, with type %ld, but has type %ld\n", cStr, 0x2Au);
LABEL_29:
  if (glog_fd)
  {
    *(_QWORD *)&v26 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v26 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v127 = v26;
    v128 = v26;
    v125 = v26;
    v126 = v26;
    v124 = v26;
    *(_OWORD *)&cStr[16] = v26;
    v123 = v26;
    *(_OWORD *)cStr = v26;
    memset(&v118, 0, sizeof(v118));
    v117 = 0xAAAAAAAAAAAAAAAALL;
    time(&v117);
    localtime_r(&v117, &v118);
    strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", &v118);
    dprintf(glog_fd, "%s ", cStr);
    v27 = glog_fd;
    CFStringGetTypeID();
    CFGetTypeID(v17);
    dprintf(v27, "CCIOReporterFormatter::storeChannelDescriptionFromDriverGroup %s expected obj is%s NULL, with type %ld, but has type %ld\n");
  }
LABEL_31:
  v17 = 0;
  v8 = 3758097136;
LABEL_32:
  v28 = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("DriverID"));
  if (v28)
  {
    v29 = v28;
    v30 = CFGetTypeID(v28);
    if (v30 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v29, kCFNumberLongLongType, &valuePtr);
      if (valuePtr)
        goto LABEL_54;
      v31 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)cStr = 0;
          v32 = v31;
LABEL_156:
          _os_log_error_impl(&dword_1DB697000, v32, OS_LOG_TYPE_ERROR, "CCIOReporterFormatter::storeChannelDescriptionFromDriverGroup kIOReportDriverIDKey invalid value \n", cStr, 2u);
        }
      }
      else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)cStr = 0;
        v32 = MEMORY[0x1E0C81028];
        goto LABEL_156;
      }
      if (glog_fd)
      {
        *(_QWORD *)&v42 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v42 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v127 = v42;
        v128 = v42;
        v125 = v42;
        v126 = v42;
        v124 = v42;
        *(_OWORD *)&cStr[16] = v42;
        v123 = v42;
        *(_OWORD *)cStr = v42;
        memset(&v118, 0, sizeof(v118));
        v117 = 0xAAAAAAAAAAAAAAAALL;
        time(&v117);
        localtime_r(&v117, &v118);
        strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", &v118);
        dprintf(glog_fd, "%s ", cStr);
        dprintf(glog_fd, "CCIOReporterFormatter::storeChannelDescriptionFromDriverGroup kIOReportDriverIDKey invalid value \n");
      }
      v8 = 3758096385;
      goto LABEL_54;
    }
    v35 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_48;
      v36 = CFNumberGetTypeID();
      v37 = CFGetTypeID(v29);
      *(_DWORD *)cStr = 136315650;
      *(_QWORD *)&cStr[4] = " NOT";
      *(_WORD *)&cStr[12] = 2048;
      *(_QWORD *)&cStr[14] = v36;
      *(_WORD *)&cStr[22] = 2048;
      *(_QWORD *)&cStr[24] = v37;
      v38 = v35;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_48;
      v107 = CFNumberGetTypeID();
      v108 = CFGetTypeID(v29);
      *(_DWORD *)cStr = 136315650;
      *(_QWORD *)&cStr[4] = " NOT";
      *(_WORD *)&cStr[12] = 2048;
      *(_QWORD *)&cStr[14] = v107;
      *(_WORD *)&cStr[22] = 2048;
      *(_QWORD *)&cStr[24] = v108;
      v38 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v38, OS_LOG_TYPE_ERROR, "CCIOReporterFormatter::storeChannelDescriptionFromDriverGroup kIOReportDriverIDKey expected obj is%s NULL, with type %ld, but has type %ld\n", cStr, 0x20u);
LABEL_48:
    v8 = 3758097136;
    if (glog_fd)
    {
      *(_QWORD *)&v40 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v40 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v127 = v40;
      v128 = v40;
      v125 = v40;
      v126 = v40;
      v124 = v40;
      *(_OWORD *)&cStr[16] = v40;
      v123 = v40;
      *(_OWORD *)cStr = v40;
      memset(&v118, 0, sizeof(v118));
      v117 = 0xAAAAAAAAAAAAAAAALL;
      time(&v117);
      localtime_r(&v117, &v118);
      strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", &v118);
      dprintf(glog_fd, "%s ", cStr);
      v41 = glog_fd;
      CFNumberGetTypeID();
      CFGetTypeID(v29);
      dprintf(v41, "CCIOReporterFormatter::storeChannelDescriptionFromDriverGroup kIOReportDriverIDKey expected obj is%s NULL, with type %ld, but has type %ld\n");
    }
    goto LABEL_54;
  }
  v33 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
      goto LABEL_45;
    *(_WORD *)cStr = 0;
    v34 = v33;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_45;
    *(_WORD *)cStr = 0;
    v34 = MEMORY[0x1E0C81028];
  }
  _os_log_error_impl(&dword_1DB697000, v34, OS_LOG_TYPE_ERROR, "CCIOReporterFormatter::storeChannelDescriptionFromDriverGroup kIOReportDriverIDKey expected \n", cStr, 2u);
LABEL_45:
  v8 = 3758097136;
  if (glog_fd)
  {
    *(_QWORD *)&v39 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v39 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v127 = v39;
    v128 = v39;
    v125 = v39;
    v126 = v39;
    v124 = v39;
    *(_OWORD *)&cStr[16] = v39;
    v123 = v39;
    *(_OWORD *)cStr = v39;
    memset(&v118, 0, sizeof(v118));
    v117 = 0xAAAAAAAAAAAAAAAALL;
    time(&v117);
    localtime_r(&v117, &v118);
    strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", &v118);
    dprintf(glog_fd, "%s ", cStr);
    dprintf(glog_fd, "CCIOReporterFormatter::storeChannelDescriptionFromDriverGroup kIOReportDriverIDKey expected \n");
  }
LABEL_54:
  v43 = (const __CFString *)CFDictionaryGetValue(theDict, CFSTR("DriverName"));
  if (!v43)
  {
    v46 = IORegistryEntryIDMatching(valuePtr);
    if (v46)
    {
      MatchingService = IOServiceGetMatchingService(*MEMORY[0x1E0CBBAA8], v46);
      if ((_DWORD)MatchingService)
      {
        *(_QWORD *)&v48 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v48 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v127 = v48;
        v128 = v48;
        v125 = v48;
        v126 = v48;
        v124 = v48;
        *(_OWORD *)&cStr[16] = v48;
        v123 = v48;
        *(_OWORD *)cStr = v48;
        MEMORY[0x1DF0B21DC](MatchingService, cStr);
        v44 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], cStr, 0);
        goto LABEL_73;
      }
    }
    v53 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_70;
      *(_WORD *)cStr = 0;
      v54 = v53;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_70;
      *(_WORD *)cStr = 0;
      v54 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v54, OS_LOG_TYPE_ERROR, "CCIOReporterFormatter::storeChannelDescriptionFromDriverGroup kIOReportDriverNameKey expected, couldn't resolve device \n", cStr, 2u);
LABEL_70:
    if (glog_fd)
    {
      *(_QWORD *)&v57 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v57 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v127 = v57;
      v128 = v57;
      v125 = v57;
      v126 = v57;
      v124 = v57;
      *(_OWORD *)&cStr[16] = v57;
      v123 = v57;
      *(_OWORD *)cStr = v57;
      memset(&v118, 0, sizeof(v118));
      v117 = 0xAAAAAAAAAAAAAAAALL;
      time(&v117);
      localtime_r(&v117, &v118);
      strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", &v118);
      dprintf(glog_fd, "%s ", cStr);
      dprintf(glog_fd, "CCIOReporterFormatter::storeChannelDescriptionFromDriverGroup kIOReportDriverNameKey expected, couldn't resolve device \n");
    }
    goto LABEL_72;
  }
  v44 = v43;
  v45 = CFGetTypeID(v43);
  if (v45 != CFStringGetTypeID())
  {
    v49 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_67;
      v50 = CFStringGetTypeID();
      v51 = CFGetTypeID(v44);
      *(_DWORD *)cStr = 136315650;
      *(_QWORD *)&cStr[4] = " NOT";
      *(_WORD *)&cStr[12] = 2048;
      *(_QWORD *)&cStr[14] = v50;
      *(_WORD *)&cStr[22] = 2048;
      *(_QWORD *)&cStr[24] = v51;
      v52 = v49;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_67;
      v109 = CFStringGetTypeID();
      v110 = CFGetTypeID(v44);
      *(_DWORD *)cStr = 136315650;
      *(_QWORD *)&cStr[4] = " NOT";
      *(_WORD *)&cStr[12] = 2048;
      *(_QWORD *)&cStr[14] = v109;
      *(_WORD *)&cStr[22] = 2048;
      *(_QWORD *)&cStr[24] = v110;
      v52 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v52, OS_LOG_TYPE_ERROR, "CCIOReporterFormatter::storeChannelDescriptionFromDriverGroup kIOReportDriverNameKey expected obj is%s NULL, with type %ld, but has type %ld\n", cStr, 0x20u);
LABEL_67:
    if (glog_fd)
    {
      *(_QWORD *)&v55 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v55 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v127 = v55;
      v128 = v55;
      v125 = v55;
      v126 = v55;
      v124 = v55;
      *(_OWORD *)&cStr[16] = v55;
      v123 = v55;
      *(_OWORD *)cStr = v55;
      memset(&v118, 0, sizeof(v118));
      v117 = 0xAAAAAAAAAAAAAAAALL;
      time(&v117);
      localtime_r(&v117, &v118);
      strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", &v118);
      dprintf(glog_fd, "%s ", cStr);
      v56 = glog_fd;
      CFStringGetTypeID();
      CFGetTypeID(v44);
      dprintf(v56, "CCIOReporterFormatter::storeChannelDescriptionFromDriverGroup kIOReportDriverNameKey expected obj is%s NULL, with type %ld, but has type %ld\n");
    }
LABEL_72:
    v44 = 0;
    v8 = 3758097136;
    goto LABEL_73;
  }
  CFRetain(v44);
LABEL_73:
  v58 = CFDictionaryGetValue(theDict, CFSTR("IOReportChannelInfo"));
  v59 = v58;
  if (!v58)
    goto LABEL_81;
  v60 = CFGetTypeID(v58);
  if (v60 == CFDictionaryGetTypeID())
    goto LABEL_81;
  v61 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
      goto LABEL_79;
    v62 = CFDictionaryGetTypeID();
    v63 = CFGetTypeID(v59);
    *(_DWORD *)cStr = 136315906;
    *(_QWORD *)&cStr[4] = "IOReportChannelInfo";
    *(_WORD *)&cStr[12] = 2080;
    *(_QWORD *)&cStr[14] = " NOT";
    *(_WORD *)&cStr[22] = 2048;
    *(_QWORD *)&cStr[24] = v62;
    LOWORD(v123) = 2048;
    *(_QWORD *)((char *)&v123 + 2) = v63;
    v64 = v61;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_79;
    v111 = CFDictionaryGetTypeID();
    v112 = CFGetTypeID(v59);
    *(_DWORD *)cStr = 136315906;
    *(_QWORD *)&cStr[4] = "IOReportChannelInfo";
    *(_WORD *)&cStr[12] = 2080;
    *(_QWORD *)&cStr[14] = " NOT";
    *(_WORD *)&cStr[22] = 2048;
    *(_QWORD *)&cStr[24] = v111;
    LOWORD(v123) = 2048;
    *(_QWORD *)((char *)&v123 + 2) = v112;
    v64 = MEMORY[0x1E0C81028];
  }
  _os_log_error_impl(&dword_1DB697000, v64, OS_LOG_TYPE_ERROR, "CCIOReporterFormatter::storeChannelDescriptionFromDriverGroup %s expected obj is%s NULL, with type %ld, but has type %ld\n", cStr, 0x2Au);
LABEL_79:
  if (glog_fd)
  {
    *(_QWORD *)&v65 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v65 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v127 = v65;
    v128 = v65;
    v125 = v65;
    v126 = v65;
    v124 = v65;
    *(_OWORD *)&cStr[16] = v65;
    v123 = v65;
    *(_OWORD *)cStr = v65;
    memset(&v118, 0, sizeof(v118));
    v117 = 0xAAAAAAAAAAAAAAAALL;
    time(&v117);
    localtime_r(&v117, &v118);
    strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", &v118);
    dprintf(glog_fd, "%s ", cStr);
    v66 = glog_fd;
    v67 = CFDictionaryGetTypeID();
    v68 = CFGetTypeID(v59);
    dprintf(v66, "CCIOReporterFormatter::storeChannelDescriptionFromDriverGroup %s expected obj is%s NULL, with type %ld, but has type %ld\n", "IOReportChannelInfo", " NOT", v67, v68);
  }
LABEL_81:
  v69 = (const __CFArray *)CFDictionaryGetValue(theDict, CFSTR("IOReportChannels"));
  if (v69)
  {
    v70 = v69;
    v71 = CFGetTypeID(v69);
    if (v71 == CFArrayGetTypeID())
    {
      v72 = 0;
      v115 = v44;
      while (1)
      {
        if (CFArrayGetCount(v70) <= v72)
        {
          v4 = v8;
          goto LABEL_121;
        }
        ValueAtIndex = (const __CFArray *)CFArrayGetValueAtIndex(v70, v72);
        if (!ValueAtIndex
          || (v74 = ValueAtIndex, v75 = CFGetTypeID(ValueAtIndex), v75 != CFArrayGetTypeID())
          || CFArrayGetCount(v74) < 2)
        {
          v4 = 3758097136;
          goto LABEL_121;
        }
        v76 = v17;
        v77 = v6;
        v78 = (const __CFNumber *)CFArrayGetValueAtIndex(v74, 0);
        if (v78)
        {
          v79 = v78;
          v80 = CFGetTypeID(v78);
          if (v80 == CFNumberGetTypeID())
            CFNumberGetValue(v79, kCFNumberSInt64Type, &v120);
        }
        v81 = (const __CFNumber *)CFArrayGetValueAtIndex(v74, 1);
        if (v81)
        {
          v82 = v81;
          v83 = CFGetTypeID(v81);
          if (v83 == CFNumberGetTypeID())
            CFNumberGetValue(v82, kCFNumberSInt64Type, &v119);
        }
        v84 = CFArrayGetValueAtIndex(v74, 2);
        if (v84)
        {
          v85 = v84;
          v86 = CFGetTypeID(v84);
          v87 = v86 == CFStringGetTypeID() ? v85 : 0;
        }
        else
        {
          v87 = 0;
        }
        v88 = v120;
        v89 = valuePtr;
        v90 = v119;
        if (!a2 || (_DWORD)v8 || !valuePtr || !v115 || !v120 || !v119 || !v87)
          break;
        v44 = v115;
        v6 = v77;
        v17 = v76;
        v91 = IOReportAddChannelDescription();
        if ((_DWORD)v91)
        {
          v4 = v91;
          goto LABEL_122;
        }
        v8 = 0;
        v119 = 0;
        v120 = 0;
        ++v72;
      }
      v102 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        v4 = 3758097136;
        if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
          goto LABEL_130;
        *(_DWORD *)cStr = 67110400;
        *(_DWORD *)&cStr[4] = a2 != 0;
        *(_WORD *)&cStr[8] = 1024;
        *(_DWORD *)&cStr[10] = v89 != 0;
        *(_WORD *)&cStr[14] = 1024;
        *(_DWORD *)&cStr[16] = v115 != 0;
        *(_WORD *)&cStr[20] = 1024;
        *(_DWORD *)&cStr[22] = v88 != 0;
        *(_WORD *)&cStr[26] = 1024;
        *(_DWORD *)&cStr[28] = v90 != 0;
        LOWORD(v123) = 1024;
        *(_DWORD *)((char *)&v123 + 2) = v87 != 0;
        v103 = v102;
      }
      else
      {
        v4 = 3758097136;
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_130;
        *(_DWORD *)cStr = 67110400;
        *(_DWORD *)&cStr[4] = a2 != 0;
        *(_WORD *)&cStr[8] = 1024;
        *(_DWORD *)&cStr[10] = v89 != 0;
        *(_WORD *)&cStr[14] = 1024;
        *(_DWORD *)&cStr[16] = v115 != 0;
        *(_WORD *)&cStr[20] = 1024;
        *(_DWORD *)&cStr[22] = v88 != 0;
        *(_WORD *)&cStr[26] = 1024;
        *(_DWORD *)&cStr[28] = v90 != 0;
        LOWORD(v123) = 1024;
        *(_DWORD *)((char *)&v123 + 2) = v87 != 0;
        v103 = MEMORY[0x1E0C81028];
      }
      _os_log_error_impl(&dword_1DB697000, v103, OS_LOG_TYPE_ERROR, "CCIOReporterFormatter::storeChannelDescriptionFromDriverGroup failed to find required objects legend %d && providerID %d && providerName %d && channelID %d && channelType %d && channelName %d\n", cStr, 0x26u);
LABEL_130:
      if (glog_fd)
      {
        *(_QWORD *)&v104 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v104 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v127 = v104;
        v128 = v104;
        v44 = v115;
        v125 = v104;
        v126 = v104;
        v124 = v104;
        *(_OWORD *)&cStr[16] = v104;
        v123 = v104;
        *(_OWORD *)cStr = v104;
        memset(&v118, 0, sizeof(v118));
        v117 = 0xAAAAAAAAAAAAAAAALL;
        time(&v117);
        localtime_r(&v117, &v118);
        strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", &v118);
        dprintf(glog_fd, "%s ", cStr);
        dprintf(glog_fd, "CCIOReporterFormatter::storeChannelDescriptionFromDriverGroup failed to find required objects legend %d && providerID %d && providerName %d && channelID %d && channelType %d && channelName %d\n");
      }
      else
      {
        v44 = v115;
      }
      goto LABEL_121;
    }
    v94 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_119;
      v95 = CFArrayGetTypeID();
      v96 = CFGetTypeID(v70);
      *(_DWORD *)cStr = 136315906;
      *(_QWORD *)&cStr[4] = "IOReportChannels";
      *(_WORD *)&cStr[12] = 2080;
      *(_QWORD *)&cStr[14] = " NOT";
      *(_WORD *)&cStr[22] = 2048;
      *(_QWORD *)&cStr[24] = v95;
      LOWORD(v123) = 2048;
      *(_QWORD *)((char *)&v123 + 2) = v96;
      v97 = v94;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_119;
      v113 = CFArrayGetTypeID();
      v114 = CFGetTypeID(v70);
      *(_DWORD *)cStr = 136315906;
      *(_QWORD *)&cStr[4] = "IOReportChannels";
      *(_WORD *)&cStr[12] = 2080;
      *(_QWORD *)&cStr[14] = " NOT";
      *(_WORD *)&cStr[22] = 2048;
      *(_QWORD *)&cStr[24] = v113;
      LOWORD(v123) = 2048;
      *(_QWORD *)((char *)&v123 + 2) = v114;
      v97 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v97, OS_LOG_TYPE_ERROR, "CCIOReporterFormatter::storeChannelDescriptionFromDriverGroup %s expected obj is%s NULL, with type %ld, but has type %ld\n", cStr, 0x2Au);
LABEL_119:
    if (glog_fd)
    {
      *(_QWORD *)&v99 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v99 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v127 = v99;
      v128 = v99;
      v125 = v99;
      v126 = v99;
      v124 = v99;
      *(_OWORD *)&cStr[16] = v99;
      v123 = v99;
      *(_OWORD *)cStr = v99;
      memset(&v118, 0, sizeof(v118));
      v117 = 0xAAAAAAAAAAAAAAAALL;
      time(&v117);
      localtime_r(&v117, &v118);
      strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", &v118);
      dprintf(glog_fd, "%s ", cStr);
      v100 = glog_fd;
      CFArrayGetTypeID();
      CFGetTypeID(v70);
      dprintf(v100, "CCIOReporterFormatter::storeChannelDescriptionFromDriverGroup %s expected obj is%s NULL, with type %ld, but has type %ld\n");
    }
    goto LABEL_121;
  }
  v92 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
      goto LABEL_116;
    *(_DWORD *)cStr = 136315138;
    *(_QWORD *)&cStr[4] = "IOReportChannels";
    v93 = v92;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_116;
    *(_DWORD *)cStr = 136315138;
    *(_QWORD *)&cStr[4] = "IOReportChannels";
    v93 = MEMORY[0x1E0C81028];
  }
  _os_log_error_impl(&dword_1DB697000, v93, OS_LOG_TYPE_ERROR, "CCIOReporterFormatter::storeChannelDescriptionFromDriverGroup %s expected \n", cStr, 0xCu);
LABEL_116:
  if (glog_fd)
  {
    *(_QWORD *)&v98 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v98 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v127 = v98;
    v128 = v98;
    v125 = v98;
    v126 = v98;
    v124 = v98;
    *(_OWORD *)&cStr[16] = v98;
    v123 = v98;
    *(_OWORD *)cStr = v98;
    memset(&v118, 0, sizeof(v118));
    v117 = 0xAAAAAAAAAAAAAAAALL;
    time(&v117);
    localtime_r(&v117, &v118);
    strftime(cStr, 0x80uLL, "%b %d %H:%M:%S", &v118);
    dprintf(glog_fd, "%s ", cStr);
    dprintf(glog_fd, "CCIOReporterFormatter::storeChannelDescriptionFromDriverGroup %s expected \n");
  }
LABEL_121:
  if (v44)
LABEL_122:
    CFRelease(v44);
  return v4;
}

char *CCIOReporterFormatter::withRegistryEntry(CCIOReporterFormatter *this)
{
  io_object_t v1;
  char *v2;

  v1 = this;
  v2 = (char *)malloc_type_malloc(0xC0uLL, 0xEE9A6C17uLL);
  *(_OWORD *)(v2 + 8) = 0u;
  *(_OWORD *)(v2 + 24) = 0u;
  *(_OWORD *)(v2 + 40) = 0u;
  *(_OWORD *)(v2 + 56) = 0u;
  *(_OWORD *)(v2 + 72) = 0u;
  *(_OWORD *)(v2 + 88) = 0u;
  *(_OWORD *)(v2 + 104) = 0u;
  *(_OWORD *)(v2 + 120) = 0u;
  *(_OWORD *)(v2 + 136) = 0u;
  *(_OWORD *)(v2 + 152) = 0u;
  *(_OWORD *)(v2 + 168) = 0u;
  *((_QWORD *)v2 + 23) = 0;
  *((_DWORD *)v2 + 2) = 1;
  *(_QWORD *)v2 = off_1EA31FD00;
  *((_DWORD *)v2 + 8) = v1;
  IOObjectRetain(v1);
  *((_DWORD *)v2 + 3) = v1;
  return v2;
}

uint64_t CCIOReporterFormatter::writeLogPayload(CCIOReporterFormatter *this, const char *a2)
{
  return (*(uint64_t (**)(CCIOReporterFormatter *, const char *))(*(_QWORD *)this + 112))(this, a2);
}

void CCProfileMonitor::~CCProfileMonitor(void *this)
{
  if (this)
    free(this);
}

void CCProfileMonitor::setStreamEventHandler(CCProfileMonitor *this)
{
  CFNotificationCenterRef DarwinNotifyCenter;
  uint64_t v3;
  __CFNotificationCenter *v4;
  NSObject *v5;
  NSObject *v6;
  __int128 v7;
  NSObject *global_queue;
  uint64_t v9;
  NSObject *v10;
  __int128 v11;
  __int128 v12;
  time_t v13;
  tm v14;
  uint8_t buf[16];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  v3 = coreCaptureOsLog;
  if (DarwinNotifyCenter)
  {
    v4 = DarwinNotifyCenter;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
        goto LABEL_11;
      *(_WORD *)buf = 0;
      v5 = v3;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        goto LABEL_11;
      *(_WORD *)buf = 0;
      v5 = MEMORY[0x1E0C81028];
    }
    _os_log_impl(&dword_1DB697000, v5, OS_LOG_TYPE_DEFAULT, "CCProfileMonitor::setStreamEventHandler \n", buf, 2u);
LABEL_11:
    if (glog_fd)
    {
      *(_QWORD *)&v7 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v21 = v7;
      v22 = v7;
      v19 = v7;
      v20 = v7;
      v17 = v7;
      v18 = v7;
      *(_OWORD *)buf = v7;
      v16 = v7;
      memset(&v14, 0, sizeof(v14));
      v13 = 0xAAAAAAAAAAAAAAAALL;
      time(&v13);
      localtime_r(&v13, &v14);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v14);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "CCProfileMonitor::setStreamEventHandler \n");
    }
    CFNotificationCenterAddObserver(v4, this, 0, CFSTR("CCDaemonProfile Changed"), CFSTR("CCDaemonProfile Changed"), CFNotificationSuspensionBehaviorDeliverImmediately);
    global_queue = dispatch_get_global_queue(0, 0);
    xpc_set_event_stream_handler("com.apple.notifyd.matching", global_queue, &__block_literal_global_1195);
    v9 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
        goto LABEL_19;
      *(_WORD *)buf = 0;
      v10 = v9;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        goto LABEL_19;
      *(_WORD *)buf = 0;
      v10 = MEMORY[0x1E0C81028];
    }
    _os_log_impl(&dword_1DB697000, v10, OS_LOG_TYPE_DEFAULT, "CCProfileMonitor::setStreamEventHandler Registered for notification callback.\n", buf, 2u);
LABEL_19:
    if (glog_fd)
    {
      *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v21 = v11;
      v22 = v11;
      v19 = v11;
      v20 = v11;
      v17 = v11;
      v18 = v11;
      *(_OWORD *)buf = v11;
      v16 = v11;
      memset(&v14, 0, sizeof(v14));
      v13 = 0xAAAAAAAAAAAAAAAALL;
      time(&v13);
      localtime_r(&v13, &v14);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v14);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "CCProfileMonitor::setStreamEventHandler Registered for notification callback.\n");
    }
    return;
  }
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_24;
    *(_WORD *)buf = 0;
    v6 = v3;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_24;
    *(_WORD *)buf = 0;
    v6 = MEMORY[0x1E0C81028];
  }
  _os_log_impl(&dword_1DB697000, v6, OS_LOG_TYPE_DEFAULT, "CCProfileMonitor::setStreamEventHandler Unable to get notification center for configuration reader.", buf, 2u);
LABEL_24:
  if (glog_fd)
  {
    *(_QWORD *)&v12 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v21 = v12;
    v22 = v12;
    v19 = v12;
    v20 = v12;
    v17 = v12;
    v18 = v12;
    *(_OWORD *)buf = v12;
    v16 = v12;
    memset(&v14, 0, sizeof(v14));
    v13 = 0xAAAAAAAAAAAAAAAALL;
    time(&v13);
    localtime_r(&v13, &v14);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v14);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCProfileMonitor::setStreamEventHandler Unable to get notification center for configuration reader.");
  }
}

BOOL CCProfileMonitor::initializeProfilePort(CCProfileMonitor *this)
{
  int *v2;
  NSObject *global_queue;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  v2 = (int *)((char *)this + 80);
  global_queue = dispatch_get_global_queue(0, 0);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 0x40000000;
  v5[2] = ___ZN16CCProfileMonitor21initializeProfilePortEv_block_invoke;
  v5[3] = &__block_descriptor_tmp_9;
  v5[4] = this;
  return notify_register_dispatch("com.apple.ManagedConfiguration.profileListChanged", v2, global_queue, v5) == 0;
}

void CCProfileMonitor::freeResources(CCProfileMonitor *this)
{
  uint64_t v2;
  NSObject *v3;
  __int128 v4;
  int v5;
  uint64_t v6;
  const void *v7;
  uint64_t v8;
  NSObject *v9;
  __int128 v10;
  time_t v11;
  tm v12;
  uint8_t buf[16];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v3 = v2;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v3 = MEMORY[0x1E0C81028];
  }
  _os_log_impl(&dword_1DB697000, v3, OS_LOG_TYPE_DEFAULT, "CCProfileMonitor::freeResources Entered\n", buf, 2u);
LABEL_7:
  if (glog_fd)
  {
    *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v19 = v4;
    v20 = v4;
    v17 = v4;
    v18 = v4;
    v15 = v4;
    v16 = v4;
    *(_OWORD *)buf = v4;
    v14 = v4;
    memset(&v12, 0, sizeof(v12));
    v11 = 0xAAAAAAAAAAAAAAAALL;
    time(&v11);
    localtime_r(&v11, &v12);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v12);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCProfileMonitor::freeResources Entered\n");
  }
  if (!pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16)))
  {
    CCProfileMonitor::fProfileLoaded = 0;
    v5 = *((_DWORD *)this + 20);
    if (v5)
    {
      notify_cancel(v5);
      *((_DWORD *)this + 20) = 0;
    }
    v6 = *((_QWORD *)this + 11);
    if (v6)
    {
      (*(void (**)(uint64_t))(*(_QWORD *)v6 + 48))(v6);
      *((_QWORD *)this + 11) = 0;
    }
    v7 = (const void *)*((_QWORD *)this + 14);
    if (v7)
    {
      CFRelease(v7);
      *((_QWORD *)this + 14) = 0;
    }
    pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 16));
    pthread_mutex_destroy((pthread_mutex_t *)((char *)this + 16));
    v8 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
        goto LABEL_22;
      *(_WORD *)buf = 0;
      v9 = v8;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        goto LABEL_22;
      *(_WORD *)buf = 0;
      v9 = MEMORY[0x1E0C81028];
    }
    _os_log_impl(&dword_1DB697000, v9, OS_LOG_TYPE_DEFAULT, "CCProfileMonitor::freeResources done\n", buf, 2u);
LABEL_22:
    if (glog_fd)
    {
      *(_QWORD *)&v10 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v19 = v10;
      v20 = v10;
      v17 = v10;
      v18 = v10;
      v15 = v10;
      v16 = v10;
      *(_OWORD *)buf = v10;
      v14 = v10;
      memset(&v12, 0, sizeof(v12));
      v11 = 0xAAAAAAAAAAAAAAAALL;
      time(&v11);
      localtime_r(&v11, &v12);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v12);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "CCProfileMonitor::freeResources done\n");
    }
  }
}

void ___ZN16CCProfileMonitor17initWithConfigureEP11CCConfigure_block_invoke(uint64_t a1)
{
  CCProfileMonitor::profileCallback(*(CCProfileMonitor **)(a1 + 32), 1);
}

void CCProfileMonitor::applyConfiguration(CCProfileMonitor *this, const __CFString *a2, const __CFString *a3)
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v6;
  const void **v9;
  const void **v10;
  uint64_t v11;
  uint64_t v12;
  const void *v13;
  __int128 v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  __int128 v19;
  __int128 v20;
  time_t v21;
  tm v22;
  _BYTE buf[48];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (shutDownPending)
  {
    v3 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
        goto LABEL_17;
      *(_WORD *)buf = 0;
      v4 = v3;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        goto LABEL_17;
      *(_WORD *)buf = 0;
      v4 = MEMORY[0x1E0C81028];
    }
    _os_log_impl(&dword_1DB697000, v4, OS_LOG_TYPE_DEFAULT, "CCProfileMonitor::applyConfiguration  shutdown pending\n", buf, 2u);
LABEL_17:
    if (glog_fd)
    {
      *(_QWORD *)&v14 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v27 = v14;
      v28 = v14;
      v25 = v14;
      v26 = v14;
      *(_OWORD *)&buf[32] = v14;
      v24 = v14;
      *(_OWORD *)buf = v14;
      *(_OWORD *)&buf[16] = v14;
      memset(&v22, 0, sizeof(v22));
      v21 = 0xAAAAAAAAAAAAAAAALL;
      time(&v21);
      localtime_r(&v21, &v22);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v22);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "CCProfileMonitor::applyConfiguration  shutdown pending\n");
    }
    return;
  }
  if (*((_QWORD *)this + 14))
  {
    v6 = *((_QWORD *)this + 12);
    if (v6)
    {
      v9 = (const void **)malloc_type_malloc(8 * v6, 0x80040B8603338uLL);
      v10 = (const void **)malloc_type_malloc(8 * *((_QWORD *)this + 12), 0x80040B8603338uLL);
      CFDictionaryGetKeysAndValues(*((CFDictionaryRef *)this + 14), v9, v10);
      if (*((uint64_t *)this + 12) >= 1)
      {
        v11 = 0;
        do
        {
          v12 = *((_QWORD *)this + 11);
          v13 = v10[v11];
          *(_QWORD *)&v26 = 0xAAAAAAAAAAAAAA01;
          memset(&buf[8], 0, 32);
          *(_QWORD *)buf = v12;
          *(_QWORD *)&buf[40] = a2;
          v24 = (unint64_t)a3;
          v25 = 0uLL;
          CCConfigure::applyConfiguration(v12, v13, buf);
          ++v11;
        }
        while (*((_QWORD *)this + 12) > v11);
      }
      if (v9)
        free(v9);
      if (v10)
        free(v10);
      return;
    }
    v17 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
        goto LABEL_34;
      *(_WORD *)buf = 0;
      v18 = v17;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        goto LABEL_34;
      *(_WORD *)buf = 0;
      v18 = MEMORY[0x1E0C81028];
    }
    _os_log_impl(&dword_1DB697000, v18, OS_LOG_TYPE_DEFAULT, "CCProfileMonitor::applyConfiguration profile is already removed or not installed", buf, 2u);
LABEL_34:
    if (glog_fd)
    {
      *(_QWORD *)&v20 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v27 = v20;
      v28 = v20;
      v25 = v20;
      v26 = v20;
      *(_OWORD *)&buf[32] = v20;
      v24 = v20;
      *(_OWORD *)buf = v20;
      *(_OWORD *)&buf[16] = v20;
      memset(&v22, 0, sizeof(v22));
      v21 = 0xAAAAAAAAAAAAAAAALL;
      time(&v21);
      localtime_r(&v21, &v22);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v22);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "CCProfileMonitor::applyConfiguration profile is already removed or not installed");
    }
    return;
  }
  v15 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_29;
    *(_WORD *)buf = 0;
    v16 = v15;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_29;
    *(_WORD *)buf = 0;
    v16 = MEMORY[0x1E0C81028];
  }
  _os_log_impl(&dword_1DB697000, v16, OS_LOG_TYPE_DEFAULT, "CCProfileMonitor::applyConfiguration profile is already removed", buf, 2u);
LABEL_29:
  if (glog_fd)
  {
    *(_QWORD *)&v19 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v27 = v19;
    v28 = v19;
    v25 = v19;
    v26 = v19;
    *(_OWORD *)&buf[32] = v19;
    v24 = v19;
    *(_OWORD *)buf = v19;
    *(_OWORD *)&buf[16] = v19;
    memset(&v22, 0, sizeof(v22));
    v21 = 0xAAAAAAAAAAAAAAAALL;
    time(&v21);
    localtime_r(&v21, &v22);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v22);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "CCProfileMonitor::applyConfiguration profile is already removed");
  }
}

void CCProfileMonitor::profileRemoved(CCProfileMonitor *this)
{
  uint64_t v2;
  NSObject *v3;
  __int128 v4;
  const void *v5;
  uint64_t v6;
  NSObject *v7;
  __int128 v8;
  time_t v9;
  tm v10;
  uint8_t buf[16];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = CCProfileMonitor::fProfileLoaded;
    v3 = v2;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = CCProfileMonitor::fProfileLoaded;
    v3 = MEMORY[0x1E0C81028];
  }
  _os_log_impl(&dword_1DB697000, v3, OS_LOG_TYPE_DEFAULT, "CCProfileMonitor::profileRemoved Entered %d\n", buf, 8u);
LABEL_7:
  if (glog_fd)
  {
    *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v17 = v4;
    v18 = v4;
    v15 = v4;
    v16 = v4;
    v13 = v4;
    v14 = v4;
    *(_OWORD *)buf = v4;
    v12 = v4;
    memset(&v10, 0, sizeof(v10));
    v9 = 0xAAAAAAAAAAAAAAAALL;
    time(&v9);
    localtime_r(&v9, &v10);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v10);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCProfileMonitor::profileRemoved Entered %d\n", CCProfileMonitor::fProfileLoaded);
  }
  CCPipeMonitor::profileRemoved(*(CFDictionaryRef **)(*((_QWORD *)this + 11) + 16));
  CCProfileMonitor::fProfileLoaded = 0;
  *((_BYTE *)this + 105) = 1;
  *((_QWORD *)this + 12) = 0;
  v5 = (const void *)*((_QWORD *)this + 14);
  if (v5)
  {
    CFRelease(v5);
    *((_QWORD *)this + 14) = 0;
  }
  v6 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_17;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = CCProfileMonitor::fProfileLoaded;
    v7 = v6;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_17;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = CCProfileMonitor::fProfileLoaded;
    v7 = MEMORY[0x1E0C81028];
  }
  _os_log_impl(&dword_1DB697000, v7, OS_LOG_TYPE_DEFAULT, "CCProfileMonitor::profileRemoved Exited :%d\n", buf, 8u);
LABEL_17:
  if (glog_fd)
  {
    *(_QWORD *)&v8 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v17 = v8;
    v18 = v8;
    v15 = v8;
    v16 = v8;
    v13 = v8;
    v14 = v8;
    *(_OWORD *)buf = v8;
    v12 = v8;
    memset(&v10, 0, sizeof(v10));
    v9 = 0xAAAAAAAAAAAAAAAALL;
    time(&v9);
    localtime_r(&v9, &v10);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v10);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCProfileMonitor::profileRemoved Exited :%d\n", CCProfileMonitor::fProfileLoaded);
  }
}

void ___ZN16CCProfileMonitor21initializeProfilePortEv_block_invoke(uint64_t a1, int a2)
{
  CCProfileMonitor *v3;

  v3 = *(CCProfileMonitor **)(a1 + 32);
  CFPreferencesFlushCaches();
  CCProfileMonitor::profileCallback(v3, a2);
}

void CCProfileMonitor::CCProfileMonitor(CCProfileMonitor *this)
{
  *((_DWORD *)this + 2) = 1;
  *(_QWORD *)this = off_1EA31FDA0;
  *((_BYTE *)this + 105) = 0;
  *((_QWORD *)this + 14) = 0;
}

{
  *((_DWORD *)this + 2) = 1;
  *(_QWORD *)this = off_1EA31FDA0;
  *((_BYTE *)this + 105) = 0;
  *((_QWORD *)this + 14) = 0;
}

char *CCProfileMonitor::withConfigure(CCProfileMonitor *this, CCConfigure *a2)
{
  char *v3;
  uint64_t v4;
  NSObject *v5;
  __int128 v6;
  time_t v8;
  tm v9;
  uint8_t buf[16];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (char *)malloc_type_malloc(0x78uLL, 0xEE9A6C17uLL);
  *(_OWORD *)(v3 + 12) = 0u;
  *(_OWORD *)(v3 + 28) = 0u;
  *(_OWORD *)(v3 + 44) = 0u;
  *(_OWORD *)(v3 + 60) = 0u;
  *(_OWORD *)(v3 + 76) = 0u;
  *(_OWORD *)(v3 + 92) = 0u;
  *((_DWORD *)v3 + 27) = 0;
  *((_DWORD *)v3 + 2) = 1;
  *(_QWORD *)v3 = off_1EA31FDA0;
  *((_QWORD *)v3 + 14) = 0;
  if (CCProfileMonitor::initWithConfigure((CCProfileMonitor *)v3, this))
    return v3;
  v4 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v5 = v4;
LABEL_11:
      _os_log_error_impl(&dword_1DB697000, v5, OS_LOG_TYPE_ERROR, "CCProfileMonitor::withPipeMonitor Failed to create CCProlieMonitor\n", buf, 2u);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v5 = MEMORY[0x1E0C81028];
    goto LABEL_11;
  }
  if (glog_fd)
  {
    *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v16 = v6;
    v17 = v6;
    v14 = v6;
    v15 = v6;
    v12 = v6;
    v13 = v6;
    *(_OWORD *)buf = v6;
    v11 = v6;
    memset(&v9, 0, sizeof(v9));
    v8 = 0xAAAAAAAAAAAAAAAALL;
    time(&v8);
    localtime_r(&v8, &v9);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v9);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCProfileMonitor::withPipeMonitor Failed to create CCProlieMonitor\n");
  }
  (*(void (**)(char *))(*(_QWORD *)v3 + 48))(v3);
  return 0;
}

uint64_t CCProfileMonitor::applyProfile(uint64_t this, const __CFString *a2, const __CFString *a3)
{
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  __int128 v8;
  int v9;
  const char *CStringPtr;
  const char *v11;
  time_t v12;
  tm v13;
  _BYTE buf[32];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!CCProfileMonitor::fProfileLoaded)
    return this;
  v5 = this;
  v6 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = CFStringGetCStringPtr(a2, 0);
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = CFStringGetCStringPtr(a3, 0);
      v7 = v6;
LABEL_7:
      _os_log_impl(&dword_1DB697000, v7, OS_LOG_TYPE_DEFAULT, "CCProfileMonitor::applyProfile owner:%s, pipe:%s\n", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = CFStringGetCStringPtr(a2, 0);
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = CFStringGetCStringPtr(a3, 0);
    v7 = MEMORY[0x1E0C81028];
    goto LABEL_7;
  }
  if (glog_fd)
  {
    *(_QWORD *)&v8 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v19 = v8;
    v20 = v8;
    v17 = v8;
    v18 = v8;
    v15 = v8;
    v16 = v8;
    *(_OWORD *)buf = v8;
    *(_OWORD *)&buf[16] = v8;
    memset(&v13, 0, sizeof(v13));
    v12 = 0xAAAAAAAAAAAAAAAALL;
    time(&v12);
    localtime_r(&v12, &v13);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v13);
    dprintf(glog_fd, "%s ", buf);
    v9 = glog_fd;
    CStringPtr = CFStringGetCStringPtr(a2, 0);
    v11 = CFStringGetCStringPtr(a3, 0);
    dprintf(v9, "CCProfileMonitor::applyProfile owner:%s, pipe:%s\n", CStringPtr, v11);
  }
  this = pthread_mutex_lock((pthread_mutex_t *)(v5 + 16));
  if (!(_DWORD)this)
  {
    CCProfileMonitor::applyConfiguration((CCProfileMonitor *)v5, a2, a3);
    return pthread_mutex_unlock((pthread_mutex_t *)(v5 + 16));
  }
  return this;
}

void CCRawFormatter::~CCRawFormatter(void *this)
{
  if (this)
    free(this);
}

uint64_t CCRawFormatter::writeLog(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9;

  if (!a3)
  {
    v9 = 0;
    if (!a5)
      return v9;
    goto LABEL_3;
  }
  v9 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)a1 + 112))(a1, a3, a4);
  if (a5)
LABEL_3:
    v9 += (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)a1 + 112))(a1, a5, a6);
  return v9;
}

const char *CCRawFormatter::getFormatterFileExtension(CCRawFormatter *this)
{
  return "bin";
}

uint64_t CCRawFormatter::initWithRegistryEntry(CCRawFormatter *this, io_object_t object)
{
  IOObjectRetain(object);
  *((_DWORD *)this + 3) = object;
  return 1;
}

_QWORD *CCRawFormatter::withRegistryEntry(CCRawFormatter *this)
{
  io_object_t v1;
  _QWORD *v2;

  v1 = this;
  v2 = malloc_type_malloc(0x20uLL, 0xEE9A6C17uLL);
  v2[2] = 0;
  v2[3] = 0;
  *v2 = off_1EA31FE88;
  v2[1] = 0;
  *((_DWORD *)v2 + 2) = 1;
  IOObjectRetain(v1);
  *((_DWORD *)v2 + 3) = v1;
  return v2;
}

void CCServiceMonitor::ccfree(CCServiceMonitor *this)
{
  CCServiceMonitor::freeresources(this);
  if (this)
    (*(void (**)(CCServiceMonitor *))(*(_QWORD *)this + 8))(this);
}

uint64_t CCServiceMonitor::servicesStopListening(CCServiceMonitor *this)
{
  io_object_t v2;
  uint64_t result;

  v2 = *((_DWORD *)this + 8);
  if (v2)
  {
    IOObjectRelease(v2);
    *((_DWORD *)this + 8) = 0;
  }
  result = *((unsigned int *)this + 9);
  if ((_DWORD)result)
  {
    result = IOObjectRelease(result);
    *((_DWORD *)this + 9) = 0;
  }
  return result;
}

uint64_t CCServiceMonitor::initWithDictionary(CCServiceMonitor *this, CFTypeRef cf)
{
  mach_port_t *v3;
  IONotificationPort **v4;
  io_iterator_t *v5;
  IONotificationPort *v6;
  uint64_t result;

  *((_DWORD *)this + 4) = 0;
  v3 = (mach_port_t *)((char *)this + 16);
  *((_QWORD *)this + 3) = 0;
  v4 = (IONotificationPort **)((char *)this + 24);
  *((_QWORD *)this + 4) = 0;
  v5 = (io_iterator_t *)((char *)this + 32);
  *((_BYTE *)this + 40) = 0;
  *((_QWORD *)this + 6) = cf;
  *((_BYTE *)this + 12) = 0;
  CFRetain(cf);
  if (MEMORY[0x1DF0B2164](0, v3)
    || (v6 = IONotificationPortCreate(*v3), (*v4 = v6) == 0)
    || (IONotificationPortSetDispatchQueue(v6, MEMORY[0x1E0C80D38]),
        CFRetain(*((CFTypeRef *)this + 6)),
        IOServiceAddMatchingNotification(*((IONotificationPortRef *)this + 3), "IOServicePublish", *((CFDictionaryRef *)this + 6), (IOServiceMatchingCallback)CCServiceMonitor::servicePublishCallback, this, v5))|| (CFRetain(*((CFTypeRef *)this + 6)), IOServiceAddMatchingNotification(*((IONotificationPortRef *)this + 3), "IOServiceTerminate", *((CFDictionaryRef *)this + 6), (IOServiceMatchingCallback)CCServiceMonitor::serviceTerminateCallback, this, v3 + 5)))
  {
    CCServiceMonitor::freeresources(this);
    return 0;
  }
  else
  {
    result = 1;
    *((_BYTE *)this + 40) = 1;
  }
  return result;
}

void CCServiceMonitor::freeresources(CCServiceMonitor *this)
{
  io_object_t v2;
  io_object_t v3;
  mach_port_name_t v4;
  const void *v5;

  v2 = *((_DWORD *)this + 8);
  if (v2)
  {
    IOObjectRelease(v2);
    *((_DWORD *)this + 8) = 0;
  }
  v3 = *((_DWORD *)this + 9);
  if (v3)
  {
    IOObjectRelease(v3);
    *((_DWORD *)this + 9) = 0;
  }
  v4 = *((_DWORD *)this + 4);
  if (v4)
  {
    mach_port_deallocate(*MEMORY[0x1E0C83DA0], v4);
    *((_DWORD *)this + 4) = 0;
  }
  v5 = (const void *)*((_QWORD *)this + 6);
  if (v5)
  {
    CFRelease(v5);
    *((_QWORD *)this + 6) = 0;
  }
}

void CCServiceMonitor::CCServiceMonitor(CCServiceMonitor *this)
{
  *((_DWORD *)this + 2) = 1;
  *(_QWORD *)this = off_1EA31FF28;
}

uint64_t CCServiceMonitor::scanServices(uint64_t this)
{
  uint64_t v1;
  uint64_t v2;
  CFIndex v3;
  NSObject *v4;
  CFIndex v5;
  __int128 v6;
  int v7;
  CFIndex v8;
  uint64_t v9;
  CFIndex v10;
  NSObject *v11;
  CFIndex v12;
  __int128 v13;
  int v14;
  CFIndex v15;
  time_t v16;
  tm v17;
  io_iterator_t existing;
  uint8_t buf[16];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (*(_DWORD *)(this + 16))
  {
    v1 = this;
    if (*(_BYTE *)(this + 40))
    {
      *(_BYTE *)(this + 40) = 0;
      CCServiceMonitor::servicesPublished(this, *(_DWORD *)(this + 32));
      return CCServiceMonitor::servicesTerminated(v1, *(_DWORD *)(v1 + 36));
    }
    existing = 0;
    v2 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
        goto LABEL_10;
      v3 = CFGetRetainCount(*(CFTypeRef *)(v1 + 48));
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v3;
      v4 = v2;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        goto LABEL_10;
      v5 = CFGetRetainCount(*(CFTypeRef *)(v1 + 48));
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v5;
      v4 = MEMORY[0x1E0C81028];
    }
    _os_log_impl(&dword_1DB697000, v4, OS_LOG_TYPE_DEFAULT, "CCServiceMonitor::scanServices fMatching Dictionary Retain count(1) is %ld\n", buf, 0xCu);
LABEL_10:
    if (glog_fd)
    {
      *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v25 = v6;
      v26 = v6;
      v23 = v6;
      v24 = v6;
      v21 = v6;
      v22 = v6;
      *(_OWORD *)buf = v6;
      v20 = v6;
      memset(&v17, 0, sizeof(v17));
      v16 = 0xAAAAAAAAAAAAAAAALL;
      time(&v16);
      localtime_r(&v16, &v17);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v17);
      dprintf(glog_fd, "%s ", (const char *)buf);
      v7 = glog_fd;
      v8 = CFGetRetainCount(*(CFTypeRef *)(v1 + 48));
      dprintf(v7, "CCServiceMonitor::scanServices fMatching Dictionary Retain count(1) is %ld\n", v8);
    }
    if (IOServiceGetMatchingServices(*(_DWORD *)(v1 + 16), *(CFDictionaryRef *)(v1 + 48), &existing))
      goto LABEL_22;
    v9 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      {
        v10 = CFGetRetainCount(*(CFTypeRef *)(v1 + 48));
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v10;
        v11 = v9;
LABEL_18:
        _os_log_impl(&dword_1DB697000, v11, OS_LOG_TYPE_DEFAULT, "CCServiceMonitor::scanServices fMatching Dictionary Retain count(2) is %ld\n", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v12 = CFGetRetainCount(*(CFTypeRef *)(v1 + 48));
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v12;
      v11 = MEMORY[0x1E0C81028];
      goto LABEL_18;
    }
    if (glog_fd)
    {
      *(_QWORD *)&v13 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v25 = v13;
      v26 = v13;
      v23 = v13;
      v24 = v13;
      v21 = v13;
      v22 = v13;
      *(_OWORD *)buf = v13;
      v20 = v13;
      memset(&v17, 0, sizeof(v17));
      v16 = 0xAAAAAAAAAAAAAAAALL;
      time(&v16);
      localtime_r(&v16, &v17);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v17);
      dprintf(glog_fd, "%s ", (const char *)buf);
      v14 = glog_fd;
      v15 = CFGetRetainCount(*(CFTypeRef *)(v1 + 48));
      dprintf(v14, "CCServiceMonitor::scanServices fMatching Dictionary Retain count(2) is %ld\n", v15);
    }
    CCServiceMonitor::servicesPublished(v1, existing);
LABEL_22:
    this = existing;
    if (existing)
      return IOObjectRelease(existing);
  }
  return this;
}

uint64_t CCTap::getTapType(CCTap *this)
{
  return *((unsigned int *)this + 18);
}

uint64_t CCTap::profileLoaded(CCTap *this)
{
  return 3758097095;
}

uint64_t CCTap::profileRemoved(CCTap *this)
{
  return 3758097095;
}

uint64_t CCTap::capture()
{
  return 0;
}

uint64_t CCTap::prepareQuiescing(CCTap *this)
{
  uint64_t result;

  *((_BYTE *)this + 96) = 1;
  result = *((_QWORD *)this + 8);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 80))(result);
  return result;
}

uint64_t CCTap::isQuiesced(CCTap *this)
{
  return *((unsigned __int8 *)this + 97);
}

uint64_t CCTap::resumeFromQuiesced(uint64_t this)
{
  if (*(_BYTE *)(this + 97) || *(_BYTE *)(this + 96))
  {
    *(_BYTE *)(this + 97) = 0;
    this = *(_QWORD *)(this + 64);
    if (this)
      return (*(uint64_t (**)(uint64_t))(*(_QWORD *)this + 80))(this);
  }
  return this;
}

uint64_t CCTap::freeResources(CCTap *this)
{
  uint64_t v2;
  int v3;
  NSObject *v4;
  int v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const void *v11;
  const void *v12;
  const void *v13;
  uint64_t result;
  time_t v15;
  tm v16;
  _BYTE buf[32];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    v3 = *((_DWORD *)this + 4);
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "freeResources";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 139;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = v3;
    v4 = v2;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    v5 = *((_DWORD *)this + 4);
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "freeResources";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 139;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = v5;
    v4 = MEMORY[0x1E0C81028];
  }
  _os_log_impl(&dword_1DB697000, v4, OS_LOG_TYPE_DEFAULT, "CCTap::%s:%d entry:%u", buf, 0x18u);
LABEL_7:
  if (glog_fd)
  {
    *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v22 = v6;
    v23 = v6;
    v20 = v6;
    v21 = v6;
    v18 = v6;
    v19 = v6;
    *(_OWORD *)buf = v6;
    *(_OWORD *)&buf[16] = v6;
    memset(&v16, 0, sizeof(v16));
    v15 = 0xAAAAAAAAAAAAAAAALL;
    time(&v15);
    localtime_r(&v15, &v16);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v16);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "CCTap::%s:%d entry:%u", "freeResources", 139, *((_DWORD *)this + 4));
  }
  v7 = *((_QWORD *)this + 8);
  if (v7)
  {
    pthread_mutex_lock((pthread_mutex_t *)(v7 + 16));
    *((_BYTE *)this + 56) = 1;
    pthread_mutex_unlock((pthread_mutex_t *)(*((_QWORD *)this + 8) + 16));
    v8 = *((_QWORD *)this + 8);
    if (v8)
    {
      (*(void (**)(uint64_t))(*(_QWORD *)v8 + 48))(v8);
      *((_QWORD *)this + 8) = 0;
    }
  }
  else
  {
    *((_BYTE *)this + 56) = 1;
  }
  v9 = *((_QWORD *)this + 10);
  if (v9)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)v9 + 48))(v9);
    *((_QWORD *)this + 10) = 0;
  }
  v10 = *((_QWORD *)this + 4);
  if (v10)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)v10 + 88))(v10);
    (*(void (**)(_QWORD))(**((_QWORD **)this + 4) + 48))(*((_QWORD *)this + 4));
    *((_QWORD *)this + 4) = 0;
  }
  CCTap::freeDirPathArray(this);
  v11 = (const void *)*((_QWORD *)this + 5);
  if (v11)
  {
    CFRelease(v11);
    *((_QWORD *)this + 5) = 0;
  }
  v12 = (const void *)*((_QWORD *)this + 6);
  if (v12)
  {
    CFRelease(v12);
    *((_QWORD *)this + 6) = 0;
  }
  v13 = (const void *)*((_QWORD *)this + 11);
  if (v13)
  {
    CFRelease(v13);
    *((_QWORD *)this + 11) = 0;
  }
  result = *((unsigned int *)this + 4);
  if ((_DWORD)result)
  {
    result = IOObjectRelease(result);
    *((_DWORD *)this + 4) = 0;
  }
  return result;
}

void CCTap::freeDirPathArray(CCTap *this)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  const void *v7;

  v2 = (void *)*((_QWORD *)this + 13);
  if (v2)
  {
    v3 = *((_QWORD *)this + 14);
    if (v3 < 1)
      goto LABEL_9;
    v4 = 0;
    v5 = 1;
    do
    {
      v6 = *((_QWORD *)this + 13);
      v7 = *(const void **)(v6 + 8 * v4);
      if (v7)
      {
        CFRelease(v7);
        v3 = *((_QWORD *)this + 14);
        *(_QWORD *)(*((_QWORD *)this + 13) + 8 * v4) = 0;
        v6 = *((_QWORD *)this + 13);
      }
      *(_QWORD *)(v6 + 8 * v4) = 0;
      v4 = v5;
    }
    while (v3 > v5++);
    v2 = (void *)*((_QWORD *)this + 13);
    if (v2)
    {
LABEL_9:
      free(v2);
      *((_QWORD *)this + 13) = 0;
    }
    *((_QWORD *)this + 14) = 0;
  }
}

void CCTap::CCTap(CCTap *this)
{
  *((_DWORD *)this + 2) = 1;
  *(_QWORD *)this = off_1EA31FFA8;
}

void *CCTap::withRegistryEntry(CCTap *this)
{
  const __CFAllocator *v2;
  const __CFNumber *CFProperty;
  const __CFString *v4;
  const __CFString *v5;
  int v6;
  uint64_t v7;
  const char *v8;
  const char *CStringPtr;
  const char *v10;
  NSObject *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  __int128 v15;
  int v16;
  const char *v17;
  const char *v18;
  const char *v19;
  int v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  __int128 v25;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  NSObject *v32;
  NSObject *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  time_t v38;
  tm v39;
  char valuePtr;
  _BYTE buf[64];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty((io_registry_entry_t)this, CFSTR("PipeType"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  valuePtr = -86;
  v4 = (const __CFString *)IORegistryEntryCreateCFProperty((io_registry_entry_t)this, CFSTR("Owner"), v2, 0);
  v5 = (const __CFString *)IORegistryEntryCreateCFProperty((io_registry_entry_t)this, CFSTR("Name"), v2, 0);
  CFNumberGetValue(CFProperty, kCFNumberSInt8Type, &valuePtr);
  if (v5)
  {
    if (v4)
    {
      if (CFProperty)
      {
        v6 = valuePtr;
        v7 = coreCaptureOsLog;
        if (valuePtr < 2)
        {
          if (coreCaptureOsLog)
          {
            if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
              goto LABEL_17;
            if (v6 == 1)
              v8 = "CCDataTap";
            else
              v8 = "CCLogTap";
            CStringPtr = CFStringGetCStringPtr(v4, 0);
            v10 = CFStringGetCStringPtr(v5, 0);
            *(_DWORD *)buf = 136316418;
            *(_QWORD *)&buf[4] = "withRegistryEntry";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 59;
            *(_WORD *)&buf[18] = 2080;
            *(_QWORD *)&buf[20] = v8;
            *(_WORD *)&buf[28] = 1024;
            *(_DWORD *)&buf[30] = (_DWORD)this;
            *(_WORD *)&buf[34] = 2080;
            *(_QWORD *)&buf[36] = CStringPtr;
            *(_WORD *)&buf[44] = 2080;
            *(_QWORD *)&buf[46] = v10;
            v11 = v7;
          }
          else
          {
            if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
              goto LABEL_17;
            if (v6 == 1)
              v12 = "CCDataTap";
            else
              v12 = "CCLogTap";
            v13 = CFStringGetCStringPtr(v4, 0);
            v14 = CFStringGetCStringPtr(v5, 0);
            *(_DWORD *)buf = 136316418;
            *(_QWORD *)&buf[4] = "withRegistryEntry";
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = 59;
            *(_WORD *)&buf[18] = 2080;
            *(_QWORD *)&buf[20] = v12;
            *(_WORD *)&buf[28] = 1024;
            *(_DWORD *)&buf[30] = (_DWORD)this;
            *(_WORD *)&buf[34] = 2080;
            *(_QWORD *)&buf[36] = v13;
            *(_WORD *)&buf[44] = 2080;
            *(_QWORD *)&buf[46] = v14;
            v11 = MEMORY[0x1E0C81028];
          }
          _os_log_impl(&dword_1DB697000, v11, OS_LOG_TYPE_DEFAULT, "%s:%d %s::withRegistryEntry entry:%u Owner:%s Name:%s", buf, 0x36u);
LABEL_17:
          if (glog_fd)
          {
            *(_QWORD *)&v15 = 0xAAAAAAAAAAAAAAAALL;
            *((_QWORD *)&v15 + 1) = 0xAAAAAAAAAAAAAAAALL;
            v44 = v15;
            v45 = v15;
            v42 = v15;
            v43 = v15;
            *(_OWORD *)&buf[32] = v15;
            *(_OWORD *)&buf[48] = v15;
            *(_OWORD *)buf = v15;
            *(_OWORD *)&buf[16] = v15;
            memset(&v39, 0, sizeof(v39));
            v38 = 0xAAAAAAAAAAAAAAAALL;
            time(&v38);
            localtime_r(&v38, &v39);
            strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v39);
            dprintf(glog_fd, "%s ", buf);
            v16 = glog_fd;
            if (valuePtr == 1)
              v17 = "CCDataTap";
            else
              v17 = "CCLogTap";
            v18 = CFStringGetCStringPtr(v4, 0);
            v19 = CFStringGetCStringPtr(v5, 0);
            dprintf(v16, "%s:%d %s::withRegistryEntry entry:%u Owner:%s Name:%s", "withRegistryEntry", 59, v17, (_DWORD)this, v18, v19);
          }
          v20 = valuePtr;
          if (!valuePtr)
          {
            v21 = CCLogTap::withRegistryEntry(this);
            goto LABEL_26;
          }
          if (valuePtr == 1)
          {
            v21 = CCDataTap::withRegistryEntry(this);
LABEL_26:
            v22 = v21;
LABEL_34:
            CFRelease(v4);
LABEL_35:
            CFRelease(v5);
            goto LABEL_36;
          }
          v23 = coreCaptureOsLog;
          if (coreCaptureOsLog)
          {
            if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
              goto LABEL_31;
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = v20;
            v24 = v23;
          }
          else
          {
            if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              goto LABEL_31;
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = v20;
            v24 = MEMORY[0x1E0C81028];
          }
          _os_log_error_impl(&dword_1DB697000, v24, OS_LOG_TYPE_ERROR, "CCPipe::withOwnerNameCapacity Unsupported pipe type(%d)\n", buf, 8u);
LABEL_31:
          if (glog_fd)
          {
            *(_QWORD *)&v25 = 0xAAAAAAAAAAAAAAAALL;
            *((_QWORD *)&v25 + 1) = 0xAAAAAAAAAAAAAAAALL;
            v44 = v25;
            v45 = v25;
            v42 = v25;
            v43 = v25;
            *(_OWORD *)&buf[32] = v25;
            *(_OWORD *)&buf[48] = v25;
            *(_OWORD *)buf = v25;
            *(_OWORD *)&buf[16] = v25;
            memset(&v39, 0, sizeof(v39));
            v38 = 0xAAAAAAAAAAAAAAAALL;
            time(&v38);
            localtime_r(&v38, &v39);
            strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v39);
            dprintf(glog_fd, "%s ", buf);
            dprintf(glog_fd, "CCPipe::withOwnerNameCapacity Unsupported pipe type(%d)\n");
          }
LABEL_33:
          v22 = 0;
          goto LABEL_34;
        }
        if (coreCaptureOsLog)
        {
          if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
            goto LABEL_66;
          *(_DWORD *)buf = 136315906;
          *(_QWORD *)&buf[4] = "withRegistryEntry";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 56;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = (_DWORD)this;
          *(_WORD *)&buf[24] = 1024;
          *(_DWORD *)&buf[26] = v6;
          v33 = v7;
        }
        else
        {
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            goto LABEL_66;
          *(_DWORD *)buf = 136315906;
          *(_QWORD *)&buf[4] = "withRegistryEntry";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 56;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = (_DWORD)this;
          *(_WORD *)&buf[24] = 1024;
          *(_DWORD *)&buf[26] = v6;
          v33 = MEMORY[0x1E0C81028];
        }
        _os_log_error_impl(&dword_1DB697000, v33, OS_LOG_TYPE_ERROR, "%s:%d CCPipe::withOwnerNameCapacity Registry entry:%u Unsupported pipe type(%d)\n", buf, 0x1Eu);
LABEL_66:
        if (glog_fd)
        {
          *(_QWORD *)&v37 = 0xAAAAAAAAAAAAAAAALL;
          *((_QWORD *)&v37 + 1) = 0xAAAAAAAAAAAAAAAALL;
          v44 = v37;
          v45 = v37;
          v42 = v37;
          v43 = v37;
          *(_OWORD *)&buf[32] = v37;
          *(_OWORD *)&buf[48] = v37;
          *(_OWORD *)buf = v37;
          *(_OWORD *)&buf[16] = v37;
          memset(&v39, 0, sizeof(v39));
          v38 = 0xAAAAAAAAAAAAAAAALL;
          time(&v38);
          localtime_r(&v38, &v39);
          strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v39);
          dprintf(glog_fd, "%s ", buf);
          dprintf(glog_fd, "%s:%d CCPipe::withOwnerNameCapacity Registry entry:%u Unsupported pipe type(%d)\n");
        }
        goto LABEL_33;
      }
      v31 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
          goto LABEL_63;
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "withRegistryEntry";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 52;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = (_DWORD)this;
        v32 = v31;
      }
      else
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_63;
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "withRegistryEntry";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 52;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = (_DWORD)this;
        v32 = MEMORY[0x1E0C81028];
      }
      _os_log_error_impl(&dword_1DB697000, v32, OS_LOG_TYPE_ERROR, "%s:%d CCTap::withRegistryEntry Registry entry:%u not found\n", buf, 0x18u);
LABEL_63:
      if (glog_fd)
      {
        *(_QWORD *)&v36 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v36 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v44 = v36;
        v45 = v36;
        v42 = v36;
        v43 = v36;
        *(_OWORD *)&buf[32] = v36;
        *(_OWORD *)&buf[48] = v36;
        *(_OWORD *)buf = v36;
        *(_OWORD *)&buf[16] = v36;
        memset(&v39, 0, sizeof(v39));
        v38 = 0xAAAAAAAAAAAAAAAALL;
        time(&v38);
        localtime_r(&v38, &v39);
        strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v39);
        dprintf(glog_fd, "%s ", buf);
        dprintf(glog_fd, "%s:%d CCTap::withRegistryEntry Registry entry:%u not found\n");
      }
      goto LABEL_33;
    }
    v29 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        *(_QWORD *)&buf[4] = "withRegistryEntry";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 51;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = (_DWORD)this;
        v30 = v29;
LABEL_71:
        _os_log_error_impl(&dword_1DB697000, v30, OS_LOG_TYPE_ERROR, "%s:%d CCTap::withRegistryEntry Registry entry:%u not found\n", buf, 0x18u);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "withRegistryEntry";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 51;
      *(_WORD *)&buf[18] = 1024;
      *(_DWORD *)&buf[20] = (_DWORD)this;
      v30 = MEMORY[0x1E0C81028];
      goto LABEL_71;
    }
    if (glog_fd)
    {
      *(_QWORD *)&v35 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v35 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v44 = v35;
      v45 = v35;
      v42 = v35;
      v43 = v35;
      *(_OWORD *)&buf[32] = v35;
      *(_OWORD *)&buf[48] = v35;
      *(_OWORD *)buf = v35;
      *(_OWORD *)&buf[16] = v35;
      memset(&v39, 0, sizeof(v39));
      v38 = 0xAAAAAAAAAAAAAAAALL;
      time(&v38);
      localtime_r(&v38, &v39);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v39);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "%s:%d CCTap::withRegistryEntry Registry entry:%u not found\n", "withRegistryEntry", 51, (_DWORD)this);
    }
    v22 = 0;
    goto LABEL_35;
  }
  v27 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
      goto LABEL_54;
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "withRegistryEntry";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 50;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = (_DWORD)this;
    v28 = v27;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_54;
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "withRegistryEntry";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 50;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = (_DWORD)this;
    v28 = MEMORY[0x1E0C81028];
  }
  _os_log_error_impl(&dword_1DB697000, v28, OS_LOG_TYPE_ERROR, "%s:%d CCTap::withRegistryEntry Registry entry:%u not found\n", buf, 0x18u);
LABEL_54:
  if (glog_fd)
  {
    *(_QWORD *)&v34 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v34 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v44 = v34;
    v45 = v34;
    v42 = v34;
    v43 = v34;
    *(_OWORD *)&buf[32] = v34;
    *(_OWORD *)&buf[48] = v34;
    *(_OWORD *)buf = v34;
    *(_OWORD *)&buf[16] = v34;
    memset(&v39, 0, sizeof(v39));
    v38 = 0xAAAAAAAAAAAAAAAALL;
    time(&v38);
    localtime_r(&v38, &v39);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v39);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "%s:%d CCTap::withRegistryEntry Registry entry:%u not found\n", "withRegistryEntry", 50, (_DWORD)this);
  }
  v22 = 0;
  v5 = v4;
  if (v4)
    goto LABEL_35;
LABEL_36:
  if (CFProperty)
    CFRelease(CFProperty);
  return v22;
}

uint64_t CCTap::setIOReportDumpQueue(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 80) = a2;
  if (a2)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a2 + 40))(a2);
  return result;
}

uint64_t CCTap::findWithOwnerAndPipe(CFStringRef *this, const __CFString *a2, const __CFString *a3)
{
  _BOOL4 v6;
  _BOOL4 v7;

  if (CFStringCompare(this[5], a2, 0))
    v6 = CFStringCompare(CFSTR("*"), a2, 0) == kCFCompareEqualTo;
  else
    v6 = 1;
  if (CFStringCompare(this[6], a3, 0))
    v7 = CFStringCompare(CFSTR("*"), a3, 0) == kCFCompareEqualTo;
  else
    v7 = 1;
  return v6 & v7;
}

BOOL CCTap::findWithDirectory(CFStringRef *this, const __CFString *a2)
{
  return CFStringCompare(this[11], a2, 0) == kCFCompareEqualTo
      || CFStringCompare(CFSTR("*"), a2, 0) == kCFCompareEqualTo;
}

const void *NSJSONSerializationCreateDataWithJSONObject(const void *a1, int a2, void *a3)
{
  const void *v3;

  v3 = (const void *)objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", a1, a2 | 1u, 0);
  CFRetain(v3);
  return v3;
}

uint64_t CCTextFormatter::ccfree(CCTextFormatter *this)
{
  const void *v2;
  io_object_t v3;

  v2 = (const void *)*((_QWORD *)this + 22);
  if (v2)
  {
    CFRelease(v2);
    *((_QWORD *)this + 22) = 0;
  }
  CCTextFormatter::freeStreamTable(this);
  v3 = *((_DWORD *)this + 3);
  if (v3)
  {
    IOObjectRelease(v3);
    *((_DWORD *)this + 3) = 0;
  }
  return (*(uint64_t (**)(CCTextFormatter *))(*(_QWORD *)this + 8))(this);
}

uint64_t CCTextFormatter::writeLog(char *a1, time_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (a2)
    v11 = CCTextFormatter::writeLogHeader(a1, a2);
  else
    v11 = 0;
  v12 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)a1 + 112))(a1, a3, a4) + v11;
  if (a5)
  {
    v12 += (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)a1 + 112))(a1, a5, a6);
    v13 = a6 + a5;
  }
  else
  {
    v13 = a4 + a3;
  }
  if (*(_BYTE *)(v13 - 1) != 10)
    v12 += (*(uint64_t (**)(char *, const char *, uint64_t))(*(_QWORD *)a1 + 112))(a1, "\n", 1);
  return v12;
}

uint64_t CCTextFormatter::initWithRegistryEntry(CCTextFormatter *this, io_registry_entry_t entry)
{
  *((_QWORD *)this + 22) = IORegistryEntryCreateCFProperty(entry, CFSTR("LogIdentifier"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  *((_QWORD *)this + 20) = 0;
  *((_DWORD *)this + 42) = 0;
  IOObjectRetain(entry);
  *((_DWORD *)this + 3) = entry;
  return 1;
}

uint64_t CCTextFormatter::writeLogHeader(char *a1, time_t *a2)
{
  unint64_t v4;
  int v5;
  uint64_t v6;
  tm v8;
  time_t v9;
  char buffer[16];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  char v26[16];
  char v27[24];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v9 = a2[1];
  memset(v27, 170, 20);
  memset(&v8, 0, sizeof(v8));
  localtime_r(&v9, &v8);
  strftime(v27, 0x14uLL, "%b %d %H:%M:%S", &v8);
  memset(v26, 170, sizeof(v26));
  strftime(v26, 0x10uLL, "%z", &v8);
  v4 = *(time_t *)((char *)a2 + 28);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  *(_OWORD *)buffer = 0u;
  v11 = 0u;
  CCTextFormatter::getLogIdentifier((CCTextFormatter *)a1, HIBYTE(v4), buffer);
  if ((v4 & 0xFFFFFFFFFFFFFFLL) != 0)
    v5 = snprintf(a1 + 32, 0x80uLL, "%s.%06llu %s %06llu.%06llu %s<%c>[%u] ", v27, a2[2], v26);
  else
    v5 = snprintf(a1 + 32, 0x80uLL, "%s.%06llu %s %s<%c>[%u] ", v27);
  v6 = v5;
  (*(void (**)(char *, char *, _QWORD))(*(_QWORD *)a1 + 112))(a1, a1 + 32, v5);
  return v6;
}

uint64_t CCTextFormatter::getLogIdentifier(CCTextFormatter *this, int a2, char *buffer)
{
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 *v8;
  const __CFString *v9;

  v6 = *((_QWORD *)this + 20);
  if ((v6 || (CCTextFormatter::buildLogIdentTable((CFStringRef *)this), (v6 = *((_QWORD *)this + 20)) != 0))
    && (v7 = *((unsigned int *)this + 42), (_DWORD)v7))
  {
    v8 = (unsigned __int8 *)(v6 + 8);
    while (1)
    {
      if (*v8 == a2)
      {
        v9 = (const __CFString *)*((_QWORD *)v8 - 1);
        if (v9)
          break;
      }
      v8 += 16;
      if (!--v7)
        goto LABEL_8;
    }
  }
  else
  {
LABEL_8:
    v9 = (const __CFString *)*((_QWORD *)this + 22);
  }
  return CFStringGetCString(v9, buffer, 256, 0);
}

BOOL CCTextFormatter::buildLogIdentTable(CFStringRef *this)
{
  int v2;
  const __CFAllocator *v3;
  io_registry_entry_t v4;
  CFTypeRef CFProperty;
  size_t v6;
  const __CFString *v7;
  const __CFString *v8;
  __int128 v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  __int128 v14;
  __int128 v15;
  unsigned int v16;
  io_registry_entry_t v17;
  io_registry_entry_t v18;
  const __CFNumber *v19;
  const __CFNumber *v20;
  uint64_t v21;
  const __CFString *v22;
  const __CFString *v23;
  __int128 v24;
  uint64_t v25;
  NSObject *v26;
  __int128 v27;
  const __CFString *v29;
  int valuePtr;
  time_t v31;
  tm v32;
  io_iterator_t iterator;
  _BYTE v34[64];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 buffer;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  iterator = -1431655766;
  CCTextFormatter::freeStreamTable((CCTextFormatter *)this);
  MEMORY[0x1DF0B21D0](*((unsigned int *)this + 3), "IOService", &iterator);
  v2 = 0;
  v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  while (1)
  {
    v4 = IOIteratorNext(iterator);
    if (!v4)
      break;
    CFProperty = IORegistryEntryCreateCFProperty(v4, CFSTR("Name"), v3, 0);
    if (CFProperty)
    {
      ++v2;
      CFRelease(CFProperty);
    }
  }
  IOObjectRelease(iterator);
  v6 = (v2 + 1);
  *((_DWORD *)this + 42) = v6;
  v7 = (const __CFString *)malloc_type_calloc(v6, 0x10uLL, 0x1060040E5A1EACFuLL);
  v8 = v7;
  this[20] = v7;
  if (v7)
  {
    v29 = v7;
    LOBYTE(v7->info) = 0;
    *(_QWORD *)&v9 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v53 = v9;
    v54 = v9;
    v51 = v9;
    v52 = v9;
    v49 = v9;
    v50 = v9;
    v47 = v9;
    v48 = v9;
    v45 = v9;
    v46 = v9;
    v43 = v9;
    v44 = v9;
    v41 = v9;
    v42 = v9;
    buffer = v9;
    v40 = v9;
    if (CFStringGetCString(this[22], (char *)&buffer, 256, 0))
    {
      this[20]->isa = (void *)CFStringCreateWithCString(v3, (const char *)&buffer, 0);
LABEL_20:
      MEMORY[0x1DF0B21D0](*((unsigned int *)this + 3), "IOService", &iterator);
      v16 = 1;
      while (1)
      {
        do
        {
          v17 = IOIteratorNext(iterator);
          if (!v17)
          {
LABEL_37:
            IOObjectRelease(iterator);
            v8 = v29;
            return v8 != 0;
          }
          v18 = v17;
          v19 = (const __CFNumber *)IORegistryEntryCreateCFProperty(v17, CFSTR("Id"), v3, 0);
          valuePtr = 0;
        }
        while (!v19);
        v20 = v19;
        CFNumberGetValue(v19, kCFNumberSInt32Type, &valuePtr);
        v21 = (uint64_t)this[20] + 16 * v16;
        *(_BYTE *)(v21 + 8) = valuePtr;
        *(_QWORD *)v21 = 0;
        v22 = (const __CFString *)IORegistryEntryCreateCFProperty(v18, CFSTR("LogIdentifier"), v3, 0);
        if (v22)
          break;
LABEL_33:
        CFRelease(v20);
        if (++v16 >= *((_DWORD *)this + 42))
          goto LABEL_37;
      }
      v23 = v22;
      *(_QWORD *)&v24 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v53 = v24;
      v54 = v24;
      v51 = v24;
      v52 = v24;
      v49 = v24;
      v50 = v24;
      v47 = v24;
      v48 = v24;
      v45 = v24;
      v46 = v24;
      v43 = v24;
      v44 = v24;
      v41 = v24;
      v42 = v24;
      buffer = v24;
      v40 = v24;
      if (CFStringGetCString(v22, (char *)&buffer, 256, 0))
      {
        *((_QWORD *)&this[20]->isa + 2 * v16) = CFStringCreateWithCString(v3, (const char *)&buffer, 0);
LABEL_32:
        CFRelease(v23);
        goto LABEL_33;
      }
      v25 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
          goto LABEL_30;
        *(_WORD *)v34 = 0;
        v26 = v25;
      }
      else
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_30;
        *(_WORD *)v34 = 0;
        v26 = MEMORY[0x1E0C81028];
      }
      _os_log_error_impl(&dword_1DB697000, v26, OS_LOG_TYPE_ERROR, "CCTextFormatter::buildLogIdentTable -- alloc failed\n", v34, 2u);
LABEL_30:
      if (glog_fd)
      {
        *(_QWORD *)&v27 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v27 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v37 = v27;
        v38 = v27;
        v35 = v27;
        v36 = v27;
        *(_OWORD *)&v34[32] = v27;
        *(_OWORD *)&v34[48] = v27;
        *(_OWORD *)v34 = v27;
        *(_OWORD *)&v34[16] = v27;
        memset(&v32, 0, sizeof(v32));
        v31 = 0xAAAAAAAAAAAAAAAALL;
        time(&v31);
        localtime_r(&v31, &v32);
        strftime(v34, 0x80uLL, "%b %d %H:%M:%S", &v32);
        dprintf(glog_fd, "%s ", v34);
        dprintf(glog_fd, "CCTextFormatter::buildLogIdentTable -- alloc failed\n");
      }
      goto LABEL_32;
    }
    v12 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_18;
      *(_WORD *)v34 = 0;
      v13 = v12;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_18;
      *(_WORD *)v34 = 0;
      v13 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v13, OS_LOG_TYPE_ERROR, "CCTextFormatter::buildLogIdentTable -- alloc failed\n", v34, 2u);
LABEL_18:
    if (glog_fd)
    {
      *(_QWORD *)&v15 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v15 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v37 = v15;
      v38 = v15;
      v35 = v15;
      v36 = v15;
      *(_OWORD *)&v34[32] = v15;
      *(_OWORD *)&v34[48] = v15;
      *(_OWORD *)v34 = v15;
      *(_OWORD *)&v34[16] = v15;
      memset(&v32, 0, sizeof(v32));
      v31 = 0xAAAAAAAAAAAAAAAALL;
      time(&v31);
      localtime_r(&v31, &v32);
      strftime(v34, 0x80uLL, "%b %d %H:%M:%S", &v32);
      dprintf(glog_fd, "%s ", v34);
      dprintf(glog_fd, "CCTextFormatter::buildLogIdentTable -- alloc failed\n");
    }
    goto LABEL_20;
  }
  v10 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    LOWORD(buffer) = 0;
    v11 = v10;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_15;
    LOWORD(buffer) = 0;
    v11 = MEMORY[0x1E0C81028];
  }
  _os_log_error_impl(&dword_1DB697000, v11, OS_LOG_TYPE_ERROR, "CCTextFormatter::buildLogIdentTable -- alloc failed\n", (uint8_t *)&buffer, 2u);
LABEL_15:
  if (glog_fd)
  {
    *(_QWORD *)&v14 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v45 = v14;
    v46 = v14;
    v43 = v14;
    v44 = v14;
    v41 = v14;
    v42 = v14;
    buffer = v14;
    v40 = v14;
    memset(v34, 0, 56);
    *(_QWORD *)&v32.tm_sec = 0xAAAAAAAAAAAAAAAALL;
    time((time_t *)&v32.tm_sec);
    localtime_r((const time_t *)&v32.tm_sec, (tm *)v34);
    strftime((char *)&buffer, 0x80uLL, "%b %d %H:%M:%S", (const tm *)v34);
    dprintf(glog_fd, "%s ", (const char *)&buffer);
    dprintf(glog_fd, "CCTextFormatter::buildLogIdentTable -- alloc failed\n");
  }
  return v8 != 0;
}

void CCTextFormatter::freeStreamTable(CCTextFormatter *this)
{
  char *v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t i;

  v2 = (char *)*((_QWORD *)this + 20);
  if (v2)
  {
    v3 = *((unsigned int *)this + 42);
    if ((_DWORD)v3)
    {
      v4 = 0;
      for (i = 0; i < v3; ++i)
      {
        if (*(_QWORD *)&v2[v4])
        {
          CFRelease(*(CFTypeRef *)&v2[v4]);
          v2 = (char *)*((_QWORD *)this + 20);
          *(_QWORD *)&v2[v4] = 0;
          v3 = *((unsigned int *)this + 42);
        }
        *(_QWORD *)&v2[v4] = 0;
        v4 += 16;
      }
    }
    free(v2);
    *((_QWORD *)this + 20) = 0;
  }
}

char *CCTextFormatter::withRegistryEntry(CCTextFormatter *this)
{
  io_registry_entry_t v1;
  char *v2;

  v1 = this;
  v2 = (char *)malloc_type_malloc(0xB8uLL, 0xEE9A6C17uLL);
  *(_OWORD *)(v2 + 8) = 0u;
  *(_OWORD *)(v2 + 24) = 0u;
  *(_OWORD *)(v2 + 40) = 0u;
  *(_OWORD *)(v2 + 56) = 0u;
  *(_OWORD *)(v2 + 72) = 0u;
  *(_OWORD *)(v2 + 88) = 0u;
  *(_OWORD *)(v2 + 104) = 0u;
  *(_OWORD *)(v2 + 120) = 0u;
  *(_OWORD *)(v2 + 136) = 0u;
  *(_OWORD *)(v2 + 152) = 0u;
  *(_OWORD *)(v2 + 168) = 0u;
  *((_DWORD *)v2 + 2) = 1;
  *(_QWORD *)v2 = off_1EA320060;
  *((_QWORD *)v2 + 22) = IORegistryEntryCreateCFProperty(v1, CFSTR("LogIdentifier"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  *((_QWORD *)v2 + 20) = 0;
  *((_DWORD *)v2 + 42) = 0;
  IOObjectRetain(v1);
  *((_DWORD *)v2 + 3) = v1;
  return v2;
}

uint64_t CCTextFormatter::writeLogPayload(CCTextFormatter *this, const char *a2)
{
  return (*(uint64_t (**)(CCTextFormatter *, const char *))(*(_QWORD *)this + 112))(this, a2);
}

unint64_t CCTextFormatter::getLogLevelShortName(uint64_t a1, unsigned int a2)
{
  unint64_t v2;

  v2 = 0x5344494E57434145uLL >> (8 * a2);
  if (a2 >= 8)
    LOBYTE(v2) = 45;
  return v2 & 0x7F;
}

void CCIOReportDumpQueue::~CCIOReportDumpQueue(void *this)
{
  if (this)
    free(this);
}

uint64_t CCIOReportDumpQueue::stopProcessorThread(CCIOReportDumpQueue *this)
{
  pthread_mutex_t *v2;

  v2 = (pthread_mutex_t *)((char *)this + 40);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 40));
  *((_BYTE *)this + 12) = 1;
  pthread_cond_signal((pthread_cond_t *)((char *)this + 104));
  pthread_mutex_unlock(v2);
  return pthread_join(*((pthread_t *)this + 4), 0);
}

uint64_t CCIOReportDumpQueue::dequeue(CCIOReportDumpQueue *this)
{
  pthread_mutex_t *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = (pthread_mutex_t *)((char *)this + 40);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 40));
  v3 = *((_QWORD *)this + 2);
  if (v3)
  {
    v4 = *(_QWORD *)(v3 + 520);
    *((_QWORD *)this + 2) = v4;
    if (v4)
      v5 = (_QWORD *)(v4 + 528);
    else
      v5 = (_QWORD *)((char *)this + 24);
    *v5 = 0;
  }
  pthread_mutex_unlock(v2);
  return v3;
}

void CCIOReportDumpQueue::CCIOReportDumpQueue(CCIOReportDumpQueue *this)
{
  *((_DWORD *)this + 2) = 1;
  *(_QWORD *)this = off_1EA320100;
}

{
  *((_DWORD *)this + 2) = 1;
  *(_QWORD *)this = off_1EA320100;
}

CCIOReportDumpQueue *CCIOReportDumpQueue::createInstance(CCIOReportDumpQueue *this)
{
  CCIOReportDumpQueue *v1;

  v1 = (CCIOReportDumpQueue *)malloc_type_malloc(0x98uLL, 0xEE9A6C17uLL);
  *(_OWORD *)((char *)v1 + 12) = 0u;
  *(_OWORD *)((char *)v1 + 28) = 0u;
  *(_OWORD *)((char *)v1 + 44) = 0u;
  *(_OWORD *)((char *)v1 + 60) = 0u;
  *(_OWORD *)((char *)v1 + 76) = 0u;
  *(_OWORD *)((char *)v1 + 92) = 0u;
  *(_OWORD *)((char *)v1 + 108) = 0u;
  *(_OWORD *)((char *)v1 + 124) = 0u;
  *(_OWORD *)((char *)v1 + 136) = 0u;
  *((_DWORD *)v1 + 2) = 1;
  *(_QWORD *)v1 = off_1EA320100;
  if (CCIOReportDumpQueue::initInstance(v1))
  {
    (*(void (**)(CCIOReportDumpQueue *))(*(_QWORD *)v1 + 48))(v1);
    return 0;
  }
  return v1;
}

uint64_t CCIOReportDumpQueue::initInstance(CCIOReportDumpQueue *this)
{
  int v2;
  int v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  int v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  time_t v14;
  tm v15;
  uint8_t buf[16];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = pthread_mutex_init((pthread_mutex_t *)((char *)this + 40), 0);
  if (v2)
  {
    v3 = v2;
    v4 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_10;
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v3;
      v5 = v4;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_10;
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v3;
      v5 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v5, OS_LOG_TYPE_ERROR, "ERROR INIT MUTEX: %d\n", buf, 8u);
LABEL_10:
    v10 = 3758097084;
    if (glog_fd)
    {
      *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v22 = v11;
      v23 = v11;
      v20 = v11;
      v21 = v11;
      v18 = v11;
      v19 = v11;
      *(_OWORD *)buf = v11;
      v17 = v11;
      memset(&v15, 0, sizeof(v15));
      v14 = 0xAAAAAAAAAAAAAAAALL;
      time(&v14);
      localtime_r(&v14, &v15);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v15);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "ERROR INIT MUTEX: %d\n");
    }
    return v10;
  }
  v6 = pthread_cond_init((pthread_cond_t *)((char *)this + 104), 0);
  if (!v6)
  {
    pthread_create((pthread_t *)this + 4, 0, (void *(__cdecl *)(void *))CCIOReportDumpQueue::processorThread, this);
    return 0;
  }
  v7 = v6;
  v8 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v7;
    v9 = v8;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v7;
    v9 = MEMORY[0x1E0C81028];
  }
  _os_log_error_impl(&dword_1DB697000, v9, OS_LOG_TYPE_ERROR, "ERROR INIT COND: %d\n", buf, 8u);
LABEL_14:
  v10 = 3758097084;
  if (glog_fd)
  {
    *(_QWORD *)&v12 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v22 = v12;
    v23 = v12;
    v20 = v12;
    v21 = v12;
    v18 = v12;
    v19 = v12;
    *(_OWORD *)buf = v12;
    v17 = v12;
    memset(&v15, 0, sizeof(v15));
    v14 = 0xAAAAAAAAAAAAAAAALL;
    time(&v14);
    localtime_r(&v14, &v15);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v15);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "ERROR INIT COND: %d\n");
  }
  return v10;
}

void CCIOReportDumpQueue::processorThread(CCIOReportDumpQueue *this, void *a2)
{
  pthread_setname_np("com.apple.corecaptured.CCIOReportDumpQueue");
  CCIOReportDumpQueue::_processorThread(this);
}

BOOL CCIOReportDumpQueue::enqueue(uint64_t a1, uint64_t a2)
{
  _BOOL8 v2;
  pthread_mutex_t *v5;
  uint64_t v6;

  if (*(_BYTE *)(a1 + 12))
    return 0;
  v5 = (pthread_mutex_t *)(a1 + 40);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 40));
  v2 = *(_BYTE *)(a1 + 12) == 0;
  if (!*(_BYTE *)(a1 + 12))
  {
    v6 = *(_QWORD *)(a1 + 16);
    if (v6)
    {
      *(_QWORD *)(a2 + 520) = 0;
      v6 = *(_QWORD *)(a1 + 24);
      *(_QWORD *)(v6 + 520) = a2;
      *(_QWORD *)(a1 + 24) = a2;
    }
    else
    {
      *(_QWORD *)(a1 + 16) = a2;
      *(_QWORD *)(a1 + 24) = a2;
      *(_QWORD *)(a2 + 520) = 0;
    }
    *(_QWORD *)(a2 + 528) = v6;
    pthread_cond_signal((pthread_cond_t *)(a1 + 104));
  }
  pthread_mutex_unlock(v5);
  return v2;
}

uint64_t ___ZN19CCIOReportDumpQueue16_processorThreadEv_block_invoke(uint64_t a1)
{
  return CCIOReportDumpQueue::signalToSave(*(CCIOReportDumpQueue **)(a1 + 32));
}

void CCIOReportDumpQueue::doSaveChannels(CCIOReportDumpQueue *this, const __CFString *a2, __CFDictionary *a3)
{
  uint64_t v4;
  NSObject *v5;
  __int128 v6;
  int v7;
  const char *CStringPtr;
  uint64_t Subscription;
  const void *v10;
  uint64_t Samples;
  __CFDictionary *v12;
  uint64_t v13;
  CFURLRef v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  const __CFString *v19;
  const __CFString *v20;
  uint64_t v21;
  NSObject *v22;
  const __CFString *v23;
  const __CFString *v24;
  uint64_t v25;
  NSObject *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  const __CFData *Data;
  const __CFData *v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  NSObject *v36;
  __int128 v37;
  __int128 v38;
  time_t v39;
  tm v40;
  CFTypeRef cf;
  CFErrorRef err;
  _BYTE v43[64];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE buf[32];
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  cf = 0;
  err = 0;
  v4 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "doSaveChannels";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 341;
    *(_WORD *)&buf[18] = 2080;
    *(_QWORD *)&buf[20] = CFStringGetCStringPtr(a2, 0);
    v5 = v4;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "doSaveChannels";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 341;
    *(_WORD *)&buf[18] = 2080;
    *(_QWORD *)&buf[20] = CFStringGetCStringPtr(a2, 0);
    v5 = MEMORY[0x1E0C81028];
  }
  _os_log_impl(&dword_1DB697000, v5, OS_LOG_TYPE_DEFAULT, "%s@%d: Will write to: %s\n", buf, 0x1Cu);
LABEL_7:
  if (glog_fd)
  {
    *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v53 = v6;
    v54 = v6;
    v51 = v6;
    v52 = v6;
    v49 = v6;
    v50 = v6;
    *(_OWORD *)buf = v6;
    *(_OWORD *)&buf[16] = v6;
    memset(v43, 0, 56);
    *(_QWORD *)&v40.tm_sec = 0xAAAAAAAAAAAAAAAALL;
    time((time_t *)&v40.tm_sec);
    localtime_r((const time_t *)&v40.tm_sec, (tm *)v43);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", (const tm *)v43);
    dprintf(glog_fd, "%s ", buf);
    v7 = glog_fd;
    CStringPtr = CFStringGetCStringPtr(a2, 0);
    dprintf(v7, "%s@%d: Will write to: %s\n", "doSaveChannels", 341, CStringPtr);
  }
  if (!IOReportGetChannelCount())
  {
    v17 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
        goto LABEL_37;
      *(_WORD *)buf = 0;
      v18 = v17;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        goto LABEL_37;
      *(_WORD *)buf = 0;
      v18 = MEMORY[0x1E0C81028];
    }
    _os_log_impl(&dword_1DB697000, v18, OS_LOG_TYPE_DEFAULT, "No channels found\n", buf, 2u);
LABEL_37:
    if (glog_fd)
    {
      *(_QWORD *)&v27 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v27 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v53 = v27;
      v54 = v27;
      v51 = v27;
      v52 = v27;
      v49 = v27;
      v50 = v27;
      *(_OWORD *)buf = v27;
      *(_OWORD *)&buf[16] = v27;
      memset(v43, 0, 56);
      *(_QWORD *)&v40.tm_sec = 0xAAAAAAAAAAAAAAAALL;
      time((time_t *)&v40.tm_sec);
      localtime_r((const time_t *)&v40.tm_sec, (tm *)v43);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", (const tm *)v43);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "No channels found\n");
    }
    goto LABEL_42;
  }
  Subscription = IOReportCreateSubscription();
  if (!Subscription)
  {
    v59 = xmmword_1DB6CDDC0;
    v60 = unk_1DB6CDDD0;
    v61 = xmmword_1DB6CDDE0;
    v62 = unk_1DB6CDDF0;
    v55 = xmmword_1DB6CDD80;
    v56 = unk_1DB6CDD90;
    v57 = xmmword_1DB6CDDA0;
    v58 = unk_1DB6CDDB0;
    v51 = xmmword_1DB6CDD40;
    v52 = unk_1DB6CDD50;
    v53 = xmmword_1DB6CDD60;
    v54 = unk_1DB6CDD70;
    *(_OWORD *)buf = *(_OWORD *)"<unknown>";
    *(_OWORD *)&buf[16] = *(_OWORD *)&algn_1DB6CDD0A[6];
    v49 = xmmword_1DB6CDD20;
    v50 = unk_1DB6CDD30;
    if (err)
    {
      v19 = CFErrorCopyFailureReason(err);
      if (v19)
      {
        v20 = v19;
        CFStringGetCString(v19, buf, 256, 0x8000100u);
        CFRelease(v20);
      }
      CFRelease(err);
    }
    v21 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_40;
      *(_DWORD *)v43 = 136315650;
      *(_QWORD *)&v43[4] = "doSaveChannels";
      *(_WORD *)&v43[12] = 1024;
      *(_DWORD *)&v43[14] = 360;
      *(_WORD *)&v43[18] = 2080;
      *(_QWORD *)&v43[20] = buf;
      v22 = v21;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_40;
      *(_DWORD *)v43 = 136315650;
      *(_QWORD *)&v43[4] = "doSaveChannels";
      *(_WORD *)&v43[12] = 1024;
      *(_DWORD *)&v43[14] = 360;
      *(_WORD *)&v43[18] = 2080;
      *(_QWORD *)&v43[20] = buf;
      v22 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v22, OS_LOG_TYPE_ERROR, "%s@%d: Unable to create subscribtion: %s\n", v43, 0x1Cu);
LABEL_40:
    if (glog_fd)
    {
      *(_QWORD *)&v28 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v28 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v46 = v28;
      v47 = v28;
      v44 = v28;
      v45 = v28;
      *(_OWORD *)&v43[48] = v28;
      *(_OWORD *)&v43[16] = v28;
      *(_OWORD *)&v43[32] = v28;
      *(_OWORD *)v43 = v28;
      memset(&v40, 0, sizeof(v40));
      v39 = 0xAAAAAAAAAAAAAAAALL;
      time(&v39);
      localtime_r(&v39, &v40);
      strftime(v43, 0x80uLL, "%b %d %H:%M:%S", &v40);
      dprintf(glog_fd, "%s ", v43);
      dprintf(glog_fd, "%s@%d: Unable to create subscribtion: %s\n");
    }
LABEL_42:
    v10 = 0;
    goto LABEL_67;
  }
  v10 = (const void *)Subscription;
  Samples = IOReportCreateSamples();
  if (Samples)
  {
    v12 = (__CFDictionary *)Samples;
    v13 = mach_absolute_time();
    addSystemInformationToDict(v12, v13);
    if (!ifSeedCreateClassCProtectedFileAtCFStringPath(a2))
    {
LABEL_66:
      CFRelease(v12);
      goto LABEL_67;
    }
    v14 = CFURLCreateWithFileSystemPath((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a2, kCFURLPOSIXPathStyle, 0);
    if (v14)
    {
LABEL_49:
      Data = CFPropertyListCreateData(0, v12, kCFPropertyListXMLFormat_v1_0, 0, 0);
      if (Data)
      {
        v32 = Data;
        LODWORD(v39) = -1431655766;
        if (CFURLWriteDataAndPropertiesToResource(v14, Data, 0, (SInt32 *)&v39))
        {
LABEL_63:
          CFRelease(v32);
LABEL_64:
          if (v14)
            CFRelease(v14);
          goto LABEL_66;
        }
        v33 = coreCaptureOsLog;
        if (coreCaptureOsLog)
        {
          if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
            goto LABEL_61;
          *(_WORD *)buf = 0;
          v34 = v33;
        }
        else
        {
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            goto LABEL_61;
          *(_WORD *)buf = 0;
          v34 = MEMORY[0x1E0C81028];
        }
        _os_log_error_impl(&dword_1DB697000, v34, OS_LOG_TYPE_ERROR, "Error creating plist...\n", buf, 2u);
LABEL_61:
        if (glog_fd)
        {
          *(_QWORD *)&v38 = 0xAAAAAAAAAAAAAAAALL;
          *((_QWORD *)&v38 + 1) = 0xAAAAAAAAAAAAAAAALL;
          v53 = v38;
          v54 = v38;
          v51 = v38;
          v52 = v38;
          v49 = v38;
          v50 = v38;
          *(_OWORD *)buf = v38;
          *(_OWORD *)&buf[16] = v38;
          memset(v43, 0, 56);
          *(_QWORD *)&v40.tm_sec = 0xAAAAAAAAAAAAAAAALL;
          time((time_t *)&v40.tm_sec);
          localtime_r((const time_t *)&v40.tm_sec, (tm *)v43);
          strftime(buf, 0x80uLL, "%b %d %H:%M:%S", (const tm *)v43);
          dprintf(glog_fd, "%s ", buf);
          dprintf(glog_fd, "Error creating plist...\n");
        }
        goto LABEL_63;
      }
      v35 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
          goto LABEL_58;
        *(_WORD *)buf = 0;
        v36 = v35;
      }
      else
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          goto LABEL_58;
        *(_WORD *)buf = 0;
        v36 = MEMORY[0x1E0C81028];
      }
      _os_log_error_impl(&dword_1DB697000, v36, OS_LOG_TYPE_ERROR, "ERROR: cannot build the XML data\n", buf, 2u);
LABEL_58:
      if (glog_fd)
      {
        *(_QWORD *)&v37 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v37 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v53 = v37;
        v54 = v37;
        v51 = v37;
        v52 = v37;
        v49 = v37;
        v50 = v37;
        *(_OWORD *)buf = v37;
        *(_OWORD *)&buf[16] = v37;
        memset(v43, 0, 56);
        *(_QWORD *)&v40.tm_sec = 0xAAAAAAAAAAAAAAAALL;
        time((time_t *)&v40.tm_sec);
        localtime_r((const time_t *)&v40.tm_sec, (tm *)v43);
        strftime(buf, 0x80uLL, "%b %d %H:%M:%S", (const tm *)v43);
        dprintf(glog_fd, "%s ", buf);
        dprintf(glog_fd, "ERROR: cannot build the XML data\n");
      }
      goto LABEL_64;
    }
    v15 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_47;
      *(_WORD *)buf = 0;
      v16 = v15;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_47;
      *(_WORD *)buf = 0;
      v16 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v16, OS_LOG_TYPE_ERROR, "ERROR: FileURL not created\n", buf, 2u);
LABEL_47:
    if (glog_fd)
    {
      *(_QWORD *)&v30 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v30 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v53 = v30;
      v54 = v30;
      v51 = v30;
      v52 = v30;
      v49 = v30;
      v50 = v30;
      *(_OWORD *)buf = v30;
      *(_OWORD *)&buf[16] = v30;
      memset(v43, 0, 56);
      *(_QWORD *)&v40.tm_sec = 0xAAAAAAAAAAAAAAAALL;
      time((time_t *)&v40.tm_sec);
      localtime_r((const time_t *)&v40.tm_sec, (tm *)v43);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", (const tm *)v43);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "ERROR: FileURL not created\n");
    }
    goto LABEL_49;
  }
  v59 = xmmword_1DB6CDDC0;
  v60 = unk_1DB6CDDD0;
  v61 = xmmword_1DB6CDDE0;
  v62 = unk_1DB6CDDF0;
  v55 = xmmword_1DB6CDD80;
  v56 = unk_1DB6CDD90;
  v57 = xmmword_1DB6CDDA0;
  v58 = unk_1DB6CDDB0;
  v51 = xmmword_1DB6CDD40;
  v52 = unk_1DB6CDD50;
  v53 = xmmword_1DB6CDD60;
  v54 = unk_1DB6CDD70;
  *(_OWORD *)buf = *(_OWORD *)"<unknown>";
  *(_OWORD *)&buf[16] = *(_OWORD *)&algn_1DB6CDD0A[6];
  v49 = xmmword_1DB6CDD20;
  v50 = unk_1DB6CDD30;
  if (err)
  {
    v23 = CFErrorCopyFailureReason(err);
    if (v23)
    {
      v24 = v23;
      CFStringGetCString(v23, buf, 256, 0x8000100u);
      CFRelease(v24);
    }
    CFRelease(err);
  }
  v25 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
      goto LABEL_44;
    *(_DWORD *)v43 = 136315650;
    *(_QWORD *)&v43[4] = "doSaveChannels";
    *(_WORD *)&v43[12] = 1024;
    *(_DWORD *)&v43[14] = 376;
    *(_WORD *)&v43[18] = 2080;
    *(_QWORD *)&v43[20] = buf;
    v26 = v25;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_44;
    *(_DWORD *)v43 = 136315650;
    *(_QWORD *)&v43[4] = "doSaveChannels";
    *(_WORD *)&v43[12] = 1024;
    *(_DWORD *)&v43[14] = 376;
    *(_WORD *)&v43[18] = 2080;
    *(_QWORD *)&v43[20] = buf;
    v26 = MEMORY[0x1E0C81028];
  }
  _os_log_error_impl(&dword_1DB697000, v26, OS_LOG_TYPE_ERROR, "%s@%d: Unable to create samples: %s\n", v43, 0x1Cu);
LABEL_44:
  if (glog_fd)
  {
    *(_QWORD *)&v29 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v29 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v46 = v29;
    v47 = v29;
    v44 = v29;
    v45 = v29;
    *(_OWORD *)&v43[48] = v29;
    *(_OWORD *)&v43[16] = v29;
    *(_OWORD *)&v43[32] = v29;
    *(_OWORD *)v43 = v29;
    memset(&v40, 0, sizeof(v40));
    v39 = 0xAAAAAAAAAAAAAAAALL;
    time(&v39);
    localtime_r(&v39, &v40);
    strftime(v43, 0x80uLL, "%b %d %H:%M:%S", &v40);
    dprintf(glog_fd, "%s ", v43);
    dprintf(glog_fd, "%s@%d: Unable to create samples: %s\n", "doSaveChannels", 376, buf);
  }
LABEL_67:
  if (cf)
  {
    CFRelease(cf);
    cf = 0;
  }
  if (v10)
    CFRelease(v10);
}

uint64_t CCIOReportDumpQueue::signalToSave(CCIOReportDumpQueue *this)
{
  pthread_mutex_t *v2;

  v2 = (pthread_mutex_t *)((char *)this + 40);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 40));
  *((_BYTE *)this + 13) = 1;
  pthread_cond_signal((pthread_cond_t *)((char *)this + 104));
  return pthread_mutex_unlock(v2);
}

uint64_t CCIOReportDumpQueue::startProcessorThread(pthread_t *this)
{
  return pthread_create(this + 4, 0, (void *(__cdecl *)(void *))CCIOReportDumpQueue::processorThread, this);
}

uint64_t CCPcapngFormatter::writeLog(CCPcapngFormatter *this, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  __int128 v16;
  __int128 v18;
  uint64_t v19;
  NSObject *v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  __int128 v35;
  time_t v36;
  tm v37;
  _BYTE buf[32];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  if (a2 && a3)
  {
    if (a4)
      goto LABEL_17;
    v12 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_15;
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = 0;
      v13 = v12;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_15;
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = 0;
      v13 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v13, OS_LOG_TYPE_ERROR, "CCPcapngFormatter::writeLog  Inconsistent data (1) length=%lu\n", buf, 0xCu);
LABEL_15:
    if (glog_fd)
    {
      *(_QWORD *)&v18 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v43 = v18;
      v44 = v18;
      v41 = v18;
      v42 = v18;
      v39 = v18;
      v40 = v18;
      *(_OWORD *)buf = v18;
      *(_OWORD *)&buf[16] = v18;
      memset(&v37, 0, sizeof(v37));
      v36 = 0xAAAAAAAAAAAAAAAALL;
      time(&v36);
      localtime_r(&v36, &v37);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v37);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "CCPcapngFormatter::writeLog  Inconsistent data (1) length=%lu\n", 0);
    }
LABEL_17:
    if (!a5 || a6)
      goto LABEL_25;
    v19 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_23;
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = 0;
      v20 = v19;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_23;
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = 0;
      v20 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v20, OS_LOG_TYPE_ERROR, "CCPcapngFormatter::writeLog  Inconsistent data (2) lengthContinue=%lu\n", buf, 0xCu);
LABEL_23:
    if (glog_fd)
    {
      *(_QWORD *)&v21 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v21 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v43 = v21;
      v44 = v21;
      v41 = v21;
      v42 = v21;
      v39 = v21;
      v40 = v21;
      *(_OWORD *)buf = v21;
      *(_OWORD *)&buf[16] = v21;
      memset(&v37, 0, sizeof(v37));
      v36 = 0xAAAAAAAAAAAAAAAALL;
      time(&v36);
      localtime_r(&v36, &v37);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v37);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "CCPcapngFormatter::writeLog  Inconsistent data (2) lengthContinue=%lu\n", 0);
    }
LABEL_25:
    v22 = *(unsigned __int16 *)(a2 + 24);
    if (a6 + a4 == v22)
      goto LABEL_32;
    v23 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_30;
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)&buf[4] = v22;
      *(_WORD *)&buf[8] = 2048;
      *(_QWORD *)&buf[10] = a4;
      *(_WORD *)&buf[18] = 2048;
      *(_QWORD *)&buf[20] = a6;
      v24 = v23;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_30;
      *(_DWORD *)buf = 67109632;
      *(_DWORD *)&buf[4] = v22;
      *(_WORD *)&buf[8] = 2048;
      *(_QWORD *)&buf[10] = a4;
      *(_WORD *)&buf[18] = 2048;
      *(_QWORD *)&buf[20] = a6;
      v24 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v24, OS_LOG_TYPE_ERROR, "CCPcapngFormatter::writeLog  Inconsistent data (3) payloadLength=%d, length=%lu, lengthContinue=%lu\n", buf, 0x1Cu);
LABEL_30:
    if (glog_fd)
    {
      *(_QWORD *)&v25 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v25 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v43 = v25;
      v44 = v25;
      v41 = v25;
      v42 = v25;
      v39 = v25;
      v40 = v25;
      *(_OWORD *)buf = v25;
      *(_OWORD *)&buf[16] = v25;
      memset(&v37, 0, sizeof(v37));
      v36 = 0xAAAAAAAAAAAAAAAALL;
      time(&v36);
      localtime_r(&v36, &v37);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v37);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "CCPcapngFormatter::writeLog  Inconsistent data (3) payloadLength=%d, length=%lu, lengthContinue=%lu\n", *(unsigned __int16 *)(a2 + 24), a4, a6);
    }
LABEL_32:
    v26 = CCPcapngFormatter::writeLogHeader(this, a2);
    v27 = (*(uint64_t (**)(CCPcapngFormatter *, uint64_t, uint64_t))(*(_QWORD *)this + 112))(this, a3, a4);
    if (v27 == a4)
      goto LABEL_39;
    v28 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_37;
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = a4;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v27;
      v29 = v28;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_37;
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = a4;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v27;
      v29 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v29, OS_LOG_TYPE_ERROR, "CCPcapngFormatter::writeLog Failed to write(1) Length=%lu, tempLength=%lu\n", buf, 0x16u);
LABEL_37:
    if (glog_fd)
    {
      *(_QWORD *)&v30 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v30 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v43 = v30;
      v44 = v30;
      v41 = v30;
      v42 = v30;
      v39 = v30;
      v40 = v30;
      *(_OWORD *)buf = v30;
      *(_OWORD *)&buf[16] = v30;
      memset(&v37, 0, sizeof(v37));
      v36 = 0xAAAAAAAAAAAAAAAALL;
      time(&v36);
      localtime_r(&v36, &v37);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v37);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "CCPcapngFormatter::writeLog Failed to write(1) Length=%lu, tempLength=%lu\n", a4, v27);
    }
LABEL_39:
    v31 = v27 + v26;
    if (!a5)
      return CCPcapngFormatter::writeLogFooter((uint64_t)this, a2) + v31;
    v32 = (*(uint64_t (**)(CCPcapngFormatter *, uint64_t, uint64_t))(*(_QWORD *)this + 112))(this, a5, a6);
    if (v32 == a6)
    {
LABEL_47:
      v31 += v32;
      return CCPcapngFormatter::writeLogFooter((uint64_t)this, a2) + v31;
    }
    v33 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_45;
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = a6;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v32;
      v34 = v33;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_45;
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = a6;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v32;
      v34 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v34, OS_LOG_TYPE_ERROR, "CCPcapngFormatter::writeLog Failed to write(2) Length=%lu, tempLength=%lu\n", buf, 0x16u);
LABEL_45:
    if (glog_fd)
    {
      *(_QWORD *)&v35 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v35 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v43 = v35;
      v44 = v35;
      v41 = v35;
      v42 = v35;
      v39 = v35;
      v40 = v35;
      *(_OWORD *)buf = v35;
      *(_OWORD *)&buf[16] = v35;
      memset(&v37, 0, sizeof(v37));
      v36 = 0xAAAAAAAAAAAAAAAALL;
      time(&v36);
      localtime_r(&v36, &v37);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v37);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "CCPcapngFormatter::writeLog Failed to write(2) Length=%lu, tempLength=%lu\n", a6, v32);
    }
    goto LABEL_47;
  }
  v14 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v15 = v14;
LABEL_51:
      _os_log_error_impl(&dword_1DB697000, v15, OS_LOG_TYPE_ERROR, "CCPcapngFormatter::writeLog Unexpected log data \n", buf, 2u);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v15 = MEMORY[0x1E0C81028];
    goto LABEL_51;
  }
  if (glog_fd)
  {
    *(_QWORD *)&v16 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v43 = v16;
    v44 = v16;
    v41 = v16;
    v42 = v16;
    v39 = v16;
    v40 = v16;
    *(_OWORD *)buf = v16;
    *(_OWORD *)&buf[16] = v16;
    memset(&v37, 0, sizeof(v37));
    v36 = 0xAAAAAAAAAAAAAAAALL;
    time(&v36);
    localtime_r(&v36, &v37);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v37);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "CCPcapngFormatter::writeLog Unexpected log data \n");
  }
  return 0;
}

uint64_t CCPcapngFormatter::writeCommentEntry(uint64_t a1, _OWORD *a2, const void *a3, size_t a4)
{
  size_t v8;
  char *v9;
  char *v10;
  unsigned __int16 v11;
  uint64_t v12;
  _BYTE v14[28];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v8 = -(int)a4 & 3;
  v9 = (char *)malloc_type_malloc(a4 + v8 + 12, 0xCDA304C8uLL);
  if (!v9)
    return 0;
  v10 = v9;
  *(_DWORD *)v9 = -1364283730;
  *((_WORD *)v9 + 2) = 1;
  *((_WORD *)v9 + 3) = a4;
  memcpy(v9 + 8, a3, a4);
  v11 = a4 + 8;
  bzero(&v10[v11], v8);
  *(_WORD *)&v10[(unsigned __int16)(v11 + v8)] = 0;
  *(_WORD *)&v10[(unsigned __int16)(v11 + v8 + 2)] = 0;
  *(_OWORD *)&v14[12] = *(_OWORD *)((char *)a2 + 12);
  *(_OWORD *)v14 = *a2;
  v15 = 0x4000400000000;
  *(_WORD *)&v14[24] = v11 + v8 + 4;
  v14[26] = 0;
  v12 = (*(uint64_t (**)(uint64_t, _BYTE *, char *, _QWORD, _QWORD, _QWORD))(*(_QWORD *)a1 + 72))(a1, v14, v10, *(unsigned __int16 *)&v14[24], 0, 0);
  free(v10);
  return v12;
}

const char *CCPcapngFormatter::getFormatterFileExtension(CCPcapngFormatter *this)
{
  return "pcapng";
}

uint64_t CCPcapngFormatter::initWithRegistryEntry(CCPcapngFormatter *this, io_object_t object)
{
  *((_DWORD *)this + 8) = 0;
  *((_QWORD *)this + 5) = 0;
  *((_QWORD *)this + 7) = 0;
  IOObjectRetain(object);
  *((_DWORD *)this + 3) = object;
  return 1;
}

uint64_t CCPcapngFormatter::writeLogHeader(CCPcapngFormatter *this, uint64_t a2)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  uint64_t v14;
  const __CFData *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  __int128 v20;
  uint64_t v21;
  const __CFData *v22;
  CFIndex Length;
  const UInt8 *BytePtr;
  uint64_t v25;
  uint64_t v26;
  int *v27;
  char *v28;
  NSObject *v29;
  __int128 v30;
  int v31;
  int *v32;
  char *v33;
  int *v35;
  char *v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  NSObject *v40;
  __int128 v41;
  __int128 v42;
  time_t v43;
  tm v44;
  time_t v45;
  int v46;
  int v47;
  int v48;
  int v49;
  int v50;
  _BYTE buf[32];
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  if (!a2)
  {
    v37 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_48;
      *(_WORD *)buf = 0;
      v38 = v37;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_48;
      *(_WORD *)buf = 0;
      v38 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v38, OS_LOG_TYPE_ERROR, "CCPcapngFormatter::writeLogHeader logMetaData is NULL\n", buf, 2u);
LABEL_48:
    if (glog_fd)
    {
      *(_QWORD *)&v41 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v41 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v56 = v41;
      v57 = v41;
      v54 = v41;
      v55 = v41;
      v52 = v41;
      v53 = v41;
      *(_OWORD *)buf = v41;
      *(_OWORD *)&buf[16] = v41;
      memset(&v44, 0, sizeof(v44));
      v45 = 0xAAAAAAAAAAAAAAAALL;
      time(&v45);
      localtime_r(&v45, &v44);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v44);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "CCPcapngFormatter::writeLogHeader logMetaData is NULL\n");
    }
    return 0;
  }
  if (!*((_QWORD *)this + 6))
  {
    v39 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_51;
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "writeLogHeader";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 264;
      v40 = v39;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_51;
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "writeLogHeader";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 264;
      v40 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v40, OS_LOG_TYPE_ERROR, "Invalid argument @'%s':%06u", buf, 0x12u);
LABEL_51:
    if (glog_fd)
    {
      *(_QWORD *)&v42 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v42 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v56 = v42;
      v57 = v42;
      v54 = v42;
      v55 = v42;
      v52 = v42;
      v53 = v42;
      *(_OWORD *)buf = v42;
      *(_OWORD *)&buf[16] = v42;
      memset(&v44, 0, sizeof(v44));
      v45 = 0xAAAAAAAAAAAAAAAALL;
      time(&v45);
      localtime_r(&v45, &v44);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v44);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "Invalid argument @'%s':%06u");
    }
    return 0;
  }
  v4 = *(_DWORD *)(a2 + 28);
  v5 = *((_QWORD *)this + 7);
  if (v5)
  {
    v6 = *((unsigned int *)this + 8);
    if ((_DWORD)v6)
    {
      v7 = 0;
      while (*(_DWORD *)(v5 + 4 * v7) != v4)
      {
        if (v6 == ++v7)
          goto LABEL_8;
      }
      goto LABEL_16;
    }
  }
LABEL_8:
  if (!CCPcapngFormatter::searchStreamIdInRegistry(this, v4))
  {
    LODWORD(v7) = 0;
LABEL_16:
    v9 = 0;
    goto LABEL_17;
  }
  v8 = (*(uint64_t (**)(CCPcapngFormatter *))(*(_QWORD *)this + 64))(this);
  v9 = (*(uint64_t (**)(CCPcapngFormatter *))(*(_QWORD *)this + 56))(this) + v8;
  v10 = *((_QWORD *)this + 7);
  if (v10 && (v11 = *((unsigned int *)this + 8), (_DWORD)v11))
  {
    v7 = 0;
    while (*(_DWORD *)(v10 + 4 * v7) != *(_DWORD *)(a2 + 28))
    {
      if (v11 == ++v7)
        goto LABEL_14;
    }
  }
  else
  {
LABEL_14:
    LODWORD(v7) = 0;
  }
LABEL_17:
  v12 = *(unsigned __int16 *)(a2 + 24) + *(unsigned __int8 *)(a2 + 26) + 32;
  v13 = *(unsigned __int16 *)(a2 + 32);
  v14 = v7;
  v15 = *(const __CFData **)(*((_QWORD *)this + 6) + 8 * v7);
  if (v15)
  {
    v12 += CFDataGetLength(v15);
    v13 += CFDataGetLength(*(CFDataRef *)(*((_QWORD *)this + 6) + 8 * v7));
  }
  v16 = *(_QWORD *)(a2 + 16) + 1000000 * *(_QWORD *)(a2 + 8);
  LODWORD(v45) = 6;
  HIDWORD(v45) = v12;
  v46 = v7;
  v47 = HIDWORD(v16);
  v48 = v16;
  v49 = v13;
  v50 = *(unsigned __int16 *)(a2 + 34);
  v17 = (*(uint64_t (**)(CCPcapngFormatter *, time_t *, uint64_t))(*(_QWORD *)this + 112))(this, &v45, 28);
  if (v17 != 28)
  {
    v18 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_24;
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v17;
      v19 = v18;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_24;
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v17;
      v19 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v19, OS_LOG_TYPE_ERROR, "CCPcapngFormatter::writeLogHeader Failed to write. %ld\n", buf, 0xCu);
LABEL_24:
    if (glog_fd)
    {
      *(_QWORD *)&v20 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v56 = v20;
      v57 = v20;
      v54 = v20;
      v55 = v20;
      v52 = v20;
      v53 = v20;
      *(_OWORD *)buf = v20;
      *(_OWORD *)&buf[16] = v20;
      memset(&v44, 0, sizeof(v44));
      v43 = 0xAAAAAAAAAAAAAAAALL;
      time(&v43);
      localtime_r(&v43, &v44);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v44);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "CCPcapngFormatter::writeLogHeader Failed to write. %ld\n", v17);
    }
  }
  v21 = v17 + v9;
  v22 = *(const __CFData **)(*((_QWORD *)this + 6) + 8 * v14);
  if (v22)
  {
    Length = CFDataGetLength(v22);
    BytePtr = CFDataGetBytePtr(*(CFDataRef *)(*((_QWORD *)this + 6) + 8 * v14));
    v25 = (*(uint64_t (**)(CCPcapngFormatter *, const UInt8 *, _QWORD))(*(_QWORD *)this + 112))(this, BytePtr, (unsigned __int16)Length);
    if (v25 == Length)
    {
LABEL_34:
      v21 += v25;
      return v21;
    }
    v26 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_32;
      v27 = __error();
      v28 = strerror(*v27);
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = v25;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = v28;
      v29 = v26;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_32;
      v35 = __error();
      v36 = strerror(*v35);
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = v25;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = v36;
      v29 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v29, OS_LOG_TYPE_ERROR, "CCPcapngFormatter::writeLogHeader fStreamHeaderArray failed to write length %ld. %s\n", buf, 0x16u);
LABEL_32:
    if (glog_fd)
    {
      *(_QWORD *)&v30 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v30 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v56 = v30;
      v57 = v30;
      v54 = v30;
      v55 = v30;
      v52 = v30;
      v53 = v30;
      *(_OWORD *)buf = v30;
      *(_OWORD *)&buf[16] = v30;
      memset(&v44, 0, sizeof(v44));
      v43 = 0xAAAAAAAAAAAAAAAALL;
      time(&v43);
      localtime_r(&v43, &v44);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v44);
      dprintf(glog_fd, "%s ", buf);
      v31 = glog_fd;
      v32 = __error();
      v33 = strerror(*v32);
      dprintf(v31, "CCPcapngFormatter::writeLogHeader fStreamHeaderArray failed to write length %ld. %s\n", v25, v33);
    }
    goto LABEL_34;
  }
  return v21;
}

uint64_t CCPcapngFormatter::writeLogFooter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  int v9;
  const __CFData *v10;
  uint64_t v11;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  __int128 v17;
  __int128 v18;
  time_t v19;
  tm v20;
  _BYTE buf[32];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (!a2)
  {
    v13 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_21;
      *(_WORD *)buf = 0;
      v14 = v13;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_21;
      *(_WORD *)buf = 0;
      v14 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v14, OS_LOG_TYPE_ERROR, "CCPcapngFormatter::writeLogFooter logMetaData is NULL\n", buf, 2u);
LABEL_21:
    if (glog_fd)
    {
      *(_QWORD *)&v17 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v17 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v26 = v17;
      v27 = v17;
      v24 = v17;
      v25 = v17;
      v22 = v17;
      v23 = v17;
      *(_OWORD *)buf = v17;
      *(_OWORD *)&buf[16] = v17;
      memset(&v20, 0, sizeof(v20));
      v19 = 0xAAAAAAAAAAAAAAAALL;
      time(&v19);
      localtime_r(&v19, &v20);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v20);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "CCPcapngFormatter::writeLogFooter logMetaData is NULL\n");
    }
    return 0;
  }
  v3 = *(_QWORD *)(a1 + 48);
  if (!v3)
  {
    v15 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_24;
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "writeLogFooter";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 352;
      v16 = v15;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_24;
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "writeLogFooter";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 352;
      v16 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v16, OS_LOG_TYPE_ERROR, "Invalid argument @'%s':%06u", buf, 0x12u);
LABEL_24:
    if (glog_fd)
    {
      *(_QWORD *)&v18 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v26 = v18;
      v27 = v18;
      v24 = v18;
      v25 = v18;
      v22 = v18;
      v23 = v18;
      *(_OWORD *)buf = v18;
      *(_OWORD *)&buf[16] = v18;
      memset(&v20, 0, sizeof(v20));
      v19 = 0xAAAAAAAAAAAAAAAALL;
      time(&v19);
      localtime_r(&v19, &v20);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v20);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "Invalid argument @'%s':%06u");
    }
    return 0;
  }
  v5 = *(_QWORD *)(a1 + 56);
  if (v5)
  {
    v6 = *(unsigned int *)(a1 + 32);
    if ((_DWORD)v6)
    {
      v7 = 0;
      while (*(_DWORD *)(v5 + 4 * v7) != *(_DWORD *)(a2 + 28))
      {
        if (v6 == ++v7)
          goto LABEL_8;
      }
      v5 = v7;
    }
    else
    {
LABEL_8:
      v5 = 0;
    }
  }
  *(_DWORD *)buf = 0;
  v8 = *(unsigned __int8 *)(a2 + 26);
  v9 = *(unsigned __int16 *)(a2 + 24) + v8 + 32;
  v20.tm_sec = v9;
  v10 = *(const __CFData **)(v3 + 8 * v5);
  if (v10)
  {
    v20.tm_sec = v9 + CFDataGetLength(v10);
    v8 = *(unsigned __int8 *)(a2 + 26);
  }
  v11 = (*(uint64_t (**)(uint64_t, _BYTE *, _QWORD))(*(_QWORD *)a1 + 112))(a1, buf, v8);
  return (*(uint64_t (**)(uint64_t, tm *, uint64_t))(*(_QWORD *)a1 + 112))(a1, &v20, 4) + v11;
}

BOOL CCPcapngFormatter::searchStreamIdInRegistry(CCPcapngFormatter *this, int a2)
{
  const __CFAllocator *v3;
  io_registry_entry_t v4;
  io_registry_entry_t v5;
  const __CFNumber *CFProperty;
  const __CFNumber *v7;
  int v9;
  io_iterator_t iterator;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  iterator = -1431655766;
  MEMORY[0x1DF0B21D0](*((unsigned int *)this + 3), "IOService", &iterator);
  v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  while (1)
  {
    v4 = IOIteratorNext(iterator);
    v5 = v4;
    if (!v4)
      break;
    CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(v4, CFSTR("Id"), v3, 0);
    if (CFProperty)
    {
      v7 = CFProperty;
      v9 = -1431655766;
      CFNumberGetValue(CFProperty, kCFNumberSInt32Type, &v9);
      if (v9 == a2)
      {
        CFRelease(v7);
        break;
      }
      CFRelease(v7);
    }
  }
  IOObjectRelease(iterator);
  return v5 != 0;
}

uint64_t CCPcapngFormatter::buildStreamToInterfaceTable(CCPcapngFormatter *this)
{
  CCPcapngFormatter *v1;
  const __CFAllocator *v2;
  CFTypeRef CFProperty;
  int v4;
  io_registry_entry_t v5;
  const __CFString *v6;
  const __CFString *v7;
  uint64_t v8;
  const char *CStringPtr;
  NSObject *v10;
  const char *v11;
  __int128 v12;
  int v13;
  const char *v14;
  uint64_t v15;
  NSObject *v16;
  __int128 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  uint64_t v23;
  NSObject *v24;
  __int128 v25;
  io_registry_entry_t v26;
  io_registry_entry_t v27;
  const __CFString *v28;
  uint64_t v29;
  NSObject *v30;
  __int128 v31;
  const __CFString *v32;
  const __CFNumber *v33;
  const __CFNumber *v34;
  uint64_t v35;
  NSObject *v36;
  __int128 v37;
  unint64_t v38;
  __int128 v39;
  CFStringRef v40;
  unint64_t v41;
  uint64_t v42;
  NSObject *v43;
  __int128 v44;
  const __CFData *v45;
  const __CFData *v46;
  uint64_t v47;
  NSObject *v48;
  __int128 v49;
  const __CFNumber *v50;
  const __CFNumber *v51;
  uint64_t result;
  uint64_t v53;
  NSObject *v54;
  uint64_t v55;
  NSObject *v56;
  uint64_t v57;
  NSObject *v58;
  uint64_t v59;
  NSObject *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  void *v65;
  void *v66;
  void *v67;
  const __CFNumber *v68;
  CCPcapngFormatter *v69;
  unint64_t v70;
  int valuePtr;
  time_t v72;
  tm v73;
  io_iterator_t iterator;
  _BYTE v75[64];
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 buf;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  uint64_t v96;

  v1 = this;
  v96 = *MEMORY[0x1E0C80C00];
  CCPcapngFormatter::freeInterfaceTables(this);
  iterator = -1431655766;
  MEMORY[0x1DF0B21D0](*((unsigned int *)v1 + 3), "IOService", &iterator);
  v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  CFProperty = IORegistryEntryCreateCFProperty(*((_DWORD *)v1 + 3), CFSTR("Name"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  if (CFProperty)
    CFRelease(CFProperty);
  v4 = 0;
  v69 = v1;
  while (1)
  {
    v5 = IOIteratorNext(iterator);
    if (!v5)
      break;
    v6 = (const __CFString *)IORegistryEntryCreateCFProperty(v5, CFSTR("Name"), v2, 0);
    if (v6)
    {
      v7 = v6;
      v8 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
          goto LABEL_12;
        CStringPtr = CFStringGetCStringPtr(v7, 0);
        LODWORD(buf) = 136315138;
        *(_QWORD *)((char *)&buf + 4) = CStringPtr;
        v10 = v8;
      }
      else
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          goto LABEL_12;
        v11 = CFStringGetCStringPtr(v7, 0);
        LODWORD(buf) = 136315138;
        *(_QWORD *)((char *)&buf + 4) = v11;
        v10 = MEMORY[0x1E0C81028];
      }
      _os_log_impl(&dword_1DB697000, v10, OS_LOG_TYPE_DEFAULT, "Stream Name is %s\n", (uint8_t *)&buf, 0xCu);
LABEL_12:
      if (glog_fd)
      {
        *(_QWORD *)&v12 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v86 = v12;
        v87 = v12;
        v84 = v12;
        v85 = v12;
        v82 = v12;
        v83 = v12;
        buf = v12;
        v81 = v12;
        memset(v75, 0, 56);
        *(_QWORD *)&v73.tm_sec = 0xAAAAAAAAAAAAAAAALL;
        time((time_t *)&v73.tm_sec);
        localtime_r((const time_t *)&v73.tm_sec, (tm *)v75);
        strftime((char *)&buf, 0x80uLL, "%b %d %H:%M:%S", (const tm *)v75);
        dprintf(glog_fd, "%s ", (const char *)&buf);
        v13 = glog_fd;
        v14 = CFStringGetCStringPtr(v7, 0);
        dprintf(v13, "Stream Name is %s\n", v14);
      }
      ++v4;
      CFRelease(v7);
      v1 = v69;
    }
  }
  *((_DWORD *)v1 + 8) = v4 + 1;
  v15 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 67109120;
      DWORD1(buf) = v4;
      v16 = v15;
      goto LABEL_20;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109120;
    DWORD1(buf) = v4;
    v16 = MEMORY[0x1E0C81028];
LABEL_20:
    _os_log_impl(&dword_1DB697000, v16, OS_LOG_TYPE_DEFAULT, "CCPcapngFormatter::buildStreamToInterfaceTable numberofStreams : %d\n", (uint8_t *)&buf, 8u);
  }
  if (glog_fd)
  {
    *(_QWORD *)&v17 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v17 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v86 = v17;
    v87 = v17;
    v84 = v17;
    v85 = v17;
    v82 = v17;
    v83 = v17;
    buf = v17;
    v81 = v17;
    memset(v75, 0, 56);
    *(_QWORD *)&v73.tm_sec = 0xAAAAAAAAAAAAAAAALL;
    time((time_t *)&v73.tm_sec);
    localtime_r((const time_t *)&v73.tm_sec, (tm *)v75);
    strftime((char *)&buf, 0x80uLL, "%b %d %H:%M:%S", (const tm *)v75);
    dprintf(glog_fd, "%s ", (const char *)&buf);
    dprintf(glog_fd, "CCPcapngFormatter::buildStreamToInterfaceTable numberofStreams : %d\n", *((_DWORD *)v1 + 8) - 1);
  }
  v18 = malloc_type_calloc(*((unsigned int *)v1 + 8), 8uLL, 0x2004093837F09uLL);
  *((_QWORD *)v1 + 5) = v18;
  if (!v18)
  {
    v53 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_101;
      LOWORD(buf) = 0;
      v54 = v53;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_101;
      LOWORD(buf) = 0;
      v54 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v54, OS_LOG_TYPE_ERROR, "CCPcapngFormatter::buildStreamToInterfaceTable Failed to allocate stream name memory\n", (uint8_t *)&buf, 2u);
LABEL_101:
    if (glog_fd)
    {
      *(_QWORD *)&v61 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v61 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v86 = v61;
      v87 = v61;
      v84 = v61;
      v85 = v61;
      v82 = v61;
      v83 = v61;
      buf = v61;
      v81 = v61;
      memset(v75, 0, 56);
      *(_QWORD *)&v73.tm_sec = 0xAAAAAAAAAAAAAAAALL;
      time((time_t *)&v73.tm_sec);
      localtime_r((const time_t *)&v73.tm_sec, (tm *)v75);
      strftime((char *)&buf, 0x80uLL, "%b %d %H:%M:%S", (const tm *)v75);
      dprintf(glog_fd, "%s ", (const char *)&buf);
      dprintf(glog_fd, "CCPcapngFormatter::buildStreamToInterfaceTable Failed to allocate stream name memory\n");
    }
    goto LABEL_112;
  }
  v19 = malloc_type_calloc(*((unsigned int *)v1 + 8), 4uLL, 0x100004052888210uLL);
  *((_QWORD *)v1 + 7) = v19;
  if (!v19)
  {
    v55 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_104;
      LOWORD(buf) = 0;
      v56 = v55;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_104;
      LOWORD(buf) = 0;
      v56 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v56, OS_LOG_TYPE_ERROR, "CCPcapngFormatter::buildStreamToInterfaceTable Failed to allocate Interface ID memory\n", (uint8_t *)&buf, 2u);
LABEL_104:
    if (glog_fd)
    {
      *(_QWORD *)&v62 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v62 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v86 = v62;
      v87 = v62;
      v84 = v62;
      v85 = v62;
      v82 = v62;
      v83 = v62;
      buf = v62;
      v81 = v62;
      memset(v75, 0, 56);
      *(_QWORD *)&v73.tm_sec = 0xAAAAAAAAAAAAAAAALL;
      time((time_t *)&v73.tm_sec);
      localtime_r((const time_t *)&v73.tm_sec, (tm *)v75);
      strftime((char *)&buf, 0x80uLL, "%b %d %H:%M:%S", (const tm *)v75);
      dprintf(glog_fd, "%s ", (const char *)&buf);
      dprintf(glog_fd, "CCPcapngFormatter::buildStreamToInterfaceTable Failed to allocate Interface ID memory\n");
    }
    goto LABEL_112;
  }
  v20 = malloc_type_calloc(*((unsigned int *)v1 + 8), 8uLL, 0x6004044C4A2DFuLL);
  *((_QWORD *)v1 + 6) = v20;
  if (!v20)
  {
    v57 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_107;
      LOWORD(buf) = 0;
      v58 = v57;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_107;
      LOWORD(buf) = 0;
      v58 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v58, OS_LOG_TYPE_ERROR, "CCPcapngFormatter::buildStreamToInterfaceTable Failed to allocate stream header memory\n", (uint8_t *)&buf, 2u);
LABEL_107:
    if (glog_fd)
    {
      *(_QWORD *)&v63 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v63 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v86 = v63;
      v87 = v63;
      v84 = v63;
      v85 = v63;
      v82 = v63;
      v83 = v63;
      buf = v63;
      v81 = v63;
      memset(v75, 0, 56);
      *(_QWORD *)&v73.tm_sec = 0xAAAAAAAAAAAAAAAALL;
      time((time_t *)&v73.tm_sec);
      localtime_r((const time_t *)&v73.tm_sec, (tm *)v75);
      strftime((char *)&buf, 0x80uLL, "%b %d %H:%M:%S", (const tm *)v75);
      dprintf(glog_fd, "%s ", (const char *)&buf);
      dprintf(glog_fd, "CCPcapngFormatter::buildStreamToInterfaceTable Failed to allocate stream header memory\n");
    }
    goto LABEL_112;
  }
  v21 = malloc_type_calloc(*((unsigned int *)v1 + 8), 2uLL, 0x1000040BDFB0063uLL);
  *((_QWORD *)v1 + 8) = v21;
  if (v21)
  {
    **((_DWORD **)v1 + 7) = 0;
    *(_QWORD *)&v22 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v22 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v94 = v22;
    v95 = v22;
    v92 = v22;
    v93 = v22;
    v90 = v22;
    v91 = v22;
    v88 = v22;
    v89 = v22;
    v86 = v22;
    v87 = v22;
    v84 = v22;
    v85 = v22;
    v82 = v22;
    v83 = v22;
    buf = v22;
    v81 = v22;
    if (CFStringGetCString(CFSTR("unknown"), (char *)&buf, 256, 0))
    {
      **((_QWORD **)v1 + 5) = CFStringCreateWithCString(v2, (const char *)&buf, 0);
      goto LABEL_35;
    }
    v23 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v75 = 0;
        v24 = v23;
        goto LABEL_87;
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v75 = 0;
      v24 = MEMORY[0x1E0C81028];
LABEL_87:
      _os_log_error_impl(&dword_1DB697000, v24, OS_LOG_TYPE_ERROR, "CCPcapngFormatter::buildStreamToInterfaceTable Failed to allocate log identifier memory\n", v75, 2u);
    }
    if (glog_fd)
    {
      *(_QWORD *)&v25 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v25 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v78 = v25;
      v79 = v25;
      v76 = v25;
      v77 = v25;
      *(_OWORD *)&v75[32] = v25;
      *(_OWORD *)&v75[48] = v25;
      *(_OWORD *)v75 = v25;
      *(_OWORD *)&v75[16] = v25;
      memset(&v73, 0, sizeof(v73));
      v72 = 0xAAAAAAAAAAAAAAAALL;
      time(&v72);
      localtime_r(&v72, &v73);
      strftime(v75, 0x80uLL, "%b %d %H:%M:%S", &v73);
      dprintf(glog_fd, "%s ", v75);
      dprintf(glog_fd, "CCPcapngFormatter::buildStreamToInterfaceTable Failed to allocate log identifier memory\n");
    }
LABEL_35:
    **((_QWORD **)v1 + 6) = 0;
    IOObjectRelease(iterator);
    MEMORY[0x1DF0B21D0](*((unsigned int *)v1 + 3), "IOService", &iterator);
    v70 = 1;
    while (2)
    {
      while (2)
      {
        v26 = IOIteratorNext(iterator);
        if (!v26)
        {
          IOObjectRelease(iterator);
          return 1;
        }
        v27 = v26;
        v28 = (const __CFString *)IORegistryEntryCreateCFProperty(v26, CFSTR("Name"), v2, 0);
        if (!v28)
        {
          v29 = coreCaptureOsLog;
          if (coreCaptureOsLog)
          {
            if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
            {
              LOWORD(buf) = 0;
              v30 = v29;
              goto LABEL_47;
            }
          }
          else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            LOWORD(buf) = 0;
            v30 = MEMORY[0x1E0C81028];
LABEL_47:
            _os_log_error_impl(&dword_1DB697000, v30, OS_LOG_TYPE_ERROR, "CCPcapngFormatter::buildStreamToInterfaceTable MISSING STREAM NAME\n", (uint8_t *)&buf, 2u);
          }
          if (glog_fd)
          {
            *(_QWORD *)&v31 = 0xAAAAAAAAAAAAAAAALL;
            *((_QWORD *)&v31 + 1) = 0xAAAAAAAAAAAAAAAALL;
            v86 = v31;
            v87 = v31;
            v84 = v31;
            v85 = v31;
            v82 = v31;
            v83 = v31;
            buf = v31;
            v81 = v31;
            memset(v75, 0, 56);
            *(_QWORD *)&v73.tm_sec = 0xAAAAAAAAAAAAAAAALL;
            time((time_t *)&v73.tm_sec);
            localtime_r((const time_t *)&v73.tm_sec, (tm *)v75);
            strftime((char *)&buf, 0x80uLL, "%b %d %H:%M:%S", (const tm *)v75);
            dprintf(glog_fd, "%s ", (const char *)&buf);
            dprintf(glog_fd, "CCPcapngFormatter::buildStreamToInterfaceTable MISSING STREAM NAME\n");
          }
          continue;
        }
        break;
      }
      v32 = v28;
      v33 = (const __CFNumber *)IORegistryEntryCreateCFProperty(v27, CFSTR("Id"), v2, 0);
      v34 = v33;
      valuePtr = 0;
      if (v33)
      {
        CFNumberGetValue(v33, kCFNumberSInt32Type, &valuePtr);
        goto LABEL_54;
      }
      v35 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        {
          LOWORD(buf) = 0;
          v36 = v35;
          goto LABEL_79;
        }
      }
      else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        v36 = MEMORY[0x1E0C81028];
LABEL_79:
        _os_log_error_impl(&dword_1DB697000, v36, OS_LOG_TYPE_ERROR, "CCPcapngFormatter:: failed to get stream id\n", (uint8_t *)&buf, 2u);
      }
      v1 = v69;
      if (glog_fd)
      {
        *(_QWORD *)&v37 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v37 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v86 = v37;
        v87 = v37;
        v84 = v37;
        v85 = v37;
        v82 = v37;
        v83 = v37;
        buf = v37;
        v81 = v37;
        memset(v75, 0, 56);
        *(_QWORD *)&v73.tm_sec = 0xAAAAAAAAAAAAAAAALL;
        time((time_t *)&v73.tm_sec);
        localtime_r((const time_t *)&v73.tm_sec, (tm *)v75);
        strftime((char *)&buf, 0x80uLL, "%b %d %H:%M:%S", (const tm *)v75);
        dprintf(glog_fd, "%s ", (const char *)&buf);
        dprintf(glog_fd, "CCPcapngFormatter:: failed to get stream id\n");
      }
LABEL_54:
      v38 = v70;
      if (v70 < *((unsigned int *)v1 + 8))
      {
        *(_QWORD *)&v39 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v39 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v94 = v39;
        v95 = v39;
        v92 = v39;
        v93 = v39;
        v90 = v39;
        v91 = v39;
        v88 = v39;
        v89 = v39;
        v86 = v39;
        v87 = v39;
        v84 = v39;
        v85 = v39;
        v82 = v39;
        v83 = v39;
        buf = v39;
        v81 = v39;
        if (CFStringGetCString(v32, (char *)&buf, 256, 0))
        {
          v40 = CFStringCreateWithCString(v2, (const char *)&buf, 0);
          v41 = v70;
          *(_QWORD *)(*((_QWORD *)v1 + 5) + 8 * v70) = v40;
          goto LABEL_63;
        }
        v42 = coreCaptureOsLog;
        if (coreCaptureOsLog)
        {
          if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v75 = 0;
            v43 = v42;
            goto LABEL_83;
          }
        }
        else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v75 = 0;
          v43 = MEMORY[0x1E0C81028];
LABEL_83:
          _os_log_error_impl(&dword_1DB697000, v43, OS_LOG_TYPE_ERROR, "CCPcapngFormatter::buildStreamToInterfaceTable Failed to allocate log identifier memory\n", v75, 2u);
        }
        v1 = v69;
        v41 = v70;
        if (glog_fd)
        {
          *(_QWORD *)&v44 = 0xAAAAAAAAAAAAAAAALL;
          *((_QWORD *)&v44 + 1) = 0xAAAAAAAAAAAAAAAALL;
          v78 = v44;
          v79 = v44;
          v76 = v44;
          v77 = v44;
          *(_OWORD *)&v75[32] = v44;
          *(_OWORD *)&v75[48] = v44;
          *(_OWORD *)v75 = v44;
          *(_OWORD *)&v75[16] = v44;
          memset(&v73, 0, sizeof(v73));
          v72 = 0xAAAAAAAAAAAAAAAALL;
          time(&v72);
          localtime_r(&v72, &v73);
          strftime(v75, 0x80uLL, "%b %d %H:%M:%S", &v73);
          dprintf(glog_fd, "%s ", v75);
          dprintf(glog_fd, "CCPcapngFormatter::buildStreamToInterfaceTable Failed to allocate log identifier memory\n");
          v41 = v70;
        }
LABEL_63:
        *(_DWORD *)(*((_QWORD *)v1 + 7) + 4 * v41) = valuePtr;
        v45 = (const __CFData *)IORegistryEntryCreateCFProperty(v27, CFSTR("StreamHeader"), v2, 0);
        v46 = v45;
        v68 = v34;
        if (v45 && (CFDataGetLength(v45) & 7) != 0)
        {
          v47 = coreCaptureOsLog;
          if (coreCaptureOsLog)
          {
            if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)v75 = 0;
              v48 = v47;
              goto LABEL_81;
            }
          }
          else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v75 = 0;
            v48 = MEMORY[0x1E0C81028];
LABEL_81:
            _os_log_error_impl(&dword_1DB697000, v48, OS_LOG_TYPE_ERROR, "CCPcapngFormatter::buildStreamToInterfaceTable: stream specific header not aligned to 64 bits. Dropping.", v75, 2u);
          }
          if (glog_fd)
          {
            *(_QWORD *)&v49 = 0xAAAAAAAAAAAAAAAALL;
            *((_QWORD *)&v49 + 1) = 0xAAAAAAAAAAAAAAAALL;
            v78 = v49;
            v79 = v49;
            v76 = v49;
            v77 = v49;
            *(_OWORD *)&v75[32] = v49;
            *(_OWORD *)&v75[48] = v49;
            *(_OWORD *)v75 = v49;
            *(_OWORD *)&v75[16] = v49;
            memset(&v73, 0, sizeof(v73));
            v72 = 0xAAAAAAAAAAAAAAAALL;
            time(&v72);
            localtime_r(&v72, &v73);
            strftime(v75, 0x80uLL, "%b %d %H:%M:%S", &v73);
            dprintf(glog_fd, "%s ", v75);
            dprintf(glog_fd, "CCPcapngFormatter::buildStreamToInterfaceTable: stream specific header not aligned to 64 bits. Dropping.");
          }
          CFRelease(v46);
          v46 = 0;
        }
        *(_QWORD *)(*((_QWORD *)v69 + 6) + 8 * v70) = v46;
        v1 = v69;
        v50 = (const __CFNumber *)IORegistryEntryCreateCFProperty(v27, CFSTR("MiscInfo"), v2, 0);
        if (v50)
        {
          v51 = v50;
          CFNumberGetValue(v50, kCFNumberSInt32Type, v75);
          *(_WORD *)(*((_QWORD *)v69 + 8) + 2 * v70) = *(_WORD *)v75;
          CFRelease(v51);
        }
        v38 = v70 + 1;
        v34 = v68;
      }
      v70 = v38;
      if (v34)
        CFRelease(v34);
      CFRelease(v32);
      continue;
    }
  }
  v59 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      v60 = v59;
      goto LABEL_127;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf) = 0;
    v60 = MEMORY[0x1E0C81028];
LABEL_127:
    _os_log_error_impl(&dword_1DB697000, v60, OS_LOG_TYPE_ERROR, "CCPcapngFormatter::buildStreamToInterfaceTable Failed to allocate dlt memory\n", (uint8_t *)&buf, 2u);
  }
  if (glog_fd)
  {
    *(_QWORD *)&v64 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v64 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v86 = v64;
    v87 = v64;
    v84 = v64;
    v85 = v64;
    v82 = v64;
    v83 = v64;
    buf = v64;
    v81 = v64;
    memset(v75, 0, 56);
    *(_QWORD *)&v73.tm_sec = 0xAAAAAAAAAAAAAAAALL;
    time((time_t *)&v73.tm_sec);
    localtime_r((const time_t *)&v73.tm_sec, (tm *)v75);
    strftime((char *)&buf, 0x80uLL, "%b %d %H:%M:%S", (const tm *)v75);
    dprintf(glog_fd, "%s ", (const char *)&buf);
    dprintf(glog_fd, "CCPcapngFormatter::buildStreamToInterfaceTable Failed to allocate dlt memory\n");
  }
LABEL_112:
  v65 = (void *)*((_QWORD *)v1 + 5);
  if (v65)
  {
    free(v65);
    *((_QWORD *)v1 + 5) = 0;
  }
  v66 = (void *)*((_QWORD *)v1 + 7);
  if (v66)
  {
    free(v66);
    *((_QWORD *)v1 + 7) = 0;
  }
  v67 = (void *)*((_QWORD *)v1 + 6);
  if (v67)
  {
    free(v67);
    *((_QWORD *)v1 + 6) = 0;
  }
  result = *((_QWORD *)v1 + 8);
  if (result)
  {
    free((void *)result);
    result = 0;
    *((_QWORD *)v1 + 8) = 0;
  }
  return result;
}

void CCPcapngFormatter::freeInterfaceTables(CCPcapngFormatter *this)
{
  void *v2;
  void *v3;
  unint64_t v4;
  unint64_t i;
  const void *v6;
  void *v7;

  CCPcapngFormatter::freeStreamNameArray(this);
  v2 = (void *)*((_QWORD *)this + 7);
  if (v2)
  {
    free(v2);
    *((_QWORD *)this + 7) = 0;
  }
  v3 = (void *)*((_QWORD *)this + 6);
  if (v3)
  {
    v4 = *((unsigned int *)this + 8);
    if (!(_DWORD)v4)
      goto LABEL_10;
    for (i = 0; i < v4; ++i)
    {
      v6 = *(const void **)(*((_QWORD *)this + 6) + 8 * i);
      if (v6)
      {
        CFRelease(v6);
        *(_QWORD *)(*((_QWORD *)this + 6) + 8 * i) = 0;
        v4 = *((unsigned int *)this + 8);
      }
    }
    v3 = (void *)*((_QWORD *)this + 6);
    if (v3)
    {
LABEL_10:
      free(v3);
      *((_QWORD *)this + 6) = 0;
    }
  }
  v7 = (void *)*((_QWORD *)this + 8);
  if (v7)
  {
    free(v7);
    *((_QWORD *)this + 8) = 0;
  }
}

void CCPcapngFormatter::freeStreamNameArray(CCPcapngFormatter *this)
{
  void *v2;
  unint64_t v3;
  unint64_t i;
  uint64_t v5;
  const void *v6;

  v2 = (void *)*((_QWORD *)this + 5);
  if (v2)
  {
    v3 = *((unsigned int *)this + 8);
    if (!(_DWORD)v3)
      goto LABEL_8;
    for (i = 0; i < v3; *(_QWORD *)(v5 + 8 * i++) = 0)
    {
      v5 = *((_QWORD *)this + 5);
      v6 = *(const void **)(v5 + 8 * i);
      if (v6)
      {
        CFRelease(v6);
        *(_QWORD *)(*((_QWORD *)this + 5) + 8 * i) = 0;
        v5 = *((_QWORD *)this + 5);
        v3 = *((unsigned int *)this + 8);
      }
    }
    v2 = (void *)*((_QWORD *)this + 5);
    if (v2)
    {
LABEL_8:
      free(v2);
      *((_QWORD *)this + 5) = 0;
    }
  }
}

char *CCPcapngFormatter::withRegistryEntry(CCPcapngFormatter *this)
{
  io_object_t v1;
  char *v2;

  v1 = this;
  v2 = (char *)malloc_type_malloc(0x48uLL, 0xEE9A6C17uLL);
  *(_OWORD *)(v2 + 8) = 0u;
  *(_OWORD *)(v2 + 40) = 0u;
  *(_OWORD *)(v2 + 24) = 0u;
  *(_OWORD *)(v2 + 56) = 0u;
  *((_DWORD *)v2 + 2) = 1;
  *(_QWORD *)v2 = off_1EA320180;
  *((_QWORD *)v2 + 5) = 0;
  IOObjectRetain(v1);
  *((_DWORD *)v2 + 3) = v1;
  return v2;
}

uint64_t CCPcapngFormatter::writeLogPayload(CCPcapngFormatter *this, const char *a2)
{
  return (*(uint64_t (**)(CCPcapngFormatter *, const char *))(*(_QWORD *)this + 112))(this, a2);
}

uint64_t CCPcapngFormatter::streamId2InterfaceId(CCPcapngFormatter *this, int a2, unsigned int *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *a3 = 0;
  v3 = *((_QWORD *)this + 7);
  if (!v3)
    return 0;
  v4 = *((unsigned int *)this + 8);
  if (!(_DWORD)v4)
    return 0;
  v5 = 0;
  while (*(_DWORD *)(v3 + 4 * v5) != a2)
  {
    if (v4 == ++v5)
      return 0;
  }
  *a3 = v5;
  return 1;
}

uint64_t CCXPCService::ccfree(CCXPCService *this)
{
  uint64_t result;

  result = CCXPCService::freeResources(this);
  if (this)
    return (*(uint64_t (**)(CCXPCService *))(*(_QWORD *)this + 8))(this);
  return result;
}

uint64_t CCXPCService::startXPCService(CCXPCService *this)
{
  NSObject *v2;
  _xpc_connection_s *mach_service;
  uint64_t v4;
  NSObject *v5;
  __int128 v6;
  time_t v8;
  tm v9;
  _QWORD handler[5];
  uint8_t buf[16];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = dispatch_queue_create("com.apple.corecaptured", 0);
  *((_QWORD *)this + 5) = v2;
  mach_service = xpc_connection_create_mach_service("com.apple.corecaptured", v2, 1uLL);
  *((_QWORD *)this + 4) = mach_service;
  if (mach_service)
  {
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 0x40000000;
    handler[2] = ___ZN12CCXPCService15startXPCServiceEv_block_invoke;
    handler[3] = &__block_descriptor_tmp_21_1501;
    handler[4] = this;
    xpc_connection_set_event_handler(mach_service, handler);
    xpc_connection_resume(*((xpc_connection_t *)this + 4));
    return 1;
  }
  v4 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    *(_WORD *)buf = 0;
    v5 = v4;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    *(_WORD *)buf = 0;
    v5 = MEMORY[0x1E0C81028];
  }
  _os_log_impl(&dword_1DB697000, v5, OS_LOG_TYPE_DEFAULT, "CCXPCService::startXPCService() Failed to start XPC service \n", buf, 2u);
LABEL_9:
  if (glog_fd)
  {
    *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v17 = v6;
    v18 = v6;
    v15 = v6;
    v16 = v6;
    v13 = v6;
    v14 = v6;
    *(_OWORD *)buf = v6;
    v12 = v6;
    memset(&v9, 0, sizeof(v9));
    v8 = 0xAAAAAAAAAAAAAAAALL;
    time(&v8);
    localtime_r(&v8, &v9);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v9);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCXPCService::startXPCService() Failed to start XPC service \n");
  }
  return 1;
}

void CCXPCService::handleConnectionEvent(dispatch_queue_t *this, void *a2)
{
  uint64_t v4;
  const _xpc_type_s *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  const char *string;
  uint64_t v11;
  NSObject *v12;
  __int128 v13;
  int v14;
  __int128 v15;
  __int128 v16;
  _QWORD handler[6];
  time_t v18;
  tm v19;
  uint8_t buf[16];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (shutDownPending)
    return;
  v4 = MEMORY[0x1DF0B289C](a2);
  if (v4 != MEMORY[0x1E0C812E0])
  {
    v5 = (const _xpc_type_s *)v4;
    if (v4 != MEMORY[0x1E0C81310])
    {
      v6 = coreCaptureOsLog;
      if (coreCaptureOsLog)
      {
        if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
          goto LABEL_17;
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = _StringForXPCType(v5);
        v7 = v6;
      }
      else
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          goto LABEL_17;
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = _StringForXPCType(v5);
        v7 = MEMORY[0x1E0C81028];
      }
      _os_log_impl(&dword_1DB697000, v7, OS_LOG_TYPE_DEFAULT, "Unexpected event type %s\n", buf, 0xCu);
LABEL_17:
      if (glog_fd)
      {
        *(_QWORD *)&v13 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v26 = v13;
        v27 = v13;
        v24 = v13;
        v25 = v13;
        v22 = v13;
        v23 = v13;
        v21 = v13;
        *(_OWORD *)buf = v13;
        memset(&v19, 0, sizeof(v19));
        v18 = 0xAAAAAAAAAAAAAAAALL;
        time(&v18);
        localtime_r(&v18, &v19);
        strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v19);
        dprintf(glog_fd, "%s ", (const char *)buf);
        v14 = glog_fd;
        _StringForXPCType(v5);
        dprintf(v14, "Unexpected event type %s\n");
      }
      return;
    }
    string = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x1E0C81270]);
    v11 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
        goto LABEL_28;
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = string;
      v12 = v11;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        goto LABEL_28;
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = string;
      v12 = MEMORY[0x1E0C81028];
    }
    _os_log_impl(&dword_1DB697000, v12, OS_LOG_TYPE_DEFAULT, "Got an XPC error: %s\n", buf, 0xCu);
LABEL_28:
    if (glog_fd)
    {
      *(_QWORD *)&v16 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v26 = v16;
      v27 = v16;
      v24 = v16;
      v25 = v16;
      v22 = v16;
      v23 = v16;
      v21 = v16;
      *(_OWORD *)buf = v16;
      memset(&v19, 0, sizeof(v19));
      v18 = 0xAAAAAAAAAAAAAAAALL;
      time(&v18);
      localtime_r(&v18, &v19);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v19);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "Got an XPC error: %s\n");
    }
    return;
  }
  v8 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v9 = v8;
LABEL_21:
      _os_log_impl(&dword_1DB697000, v9, OS_LOG_TYPE_DEFAULT, "Received a connection event\n", buf, 2u);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v9 = MEMORY[0x1E0C81028];
    goto LABEL_21;
  }
  if (glog_fd)
  {
    *(_QWORD *)&v15 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v15 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v26 = v15;
    v27 = v15;
    v24 = v15;
    v25 = v15;
    v22 = v15;
    v23 = v15;
    v21 = v15;
    *(_OWORD *)buf = v15;
    memset(&v19, 0, sizeof(v19));
    v18 = 0xAAAAAAAAAAAAAAAALL;
    time(&v18);
    localtime_r(&v18, &v19);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v19);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "Received a connection event\n");
  }
  xpc_retain(a2);
  xpc_connection_set_target_queue((xpc_connection_t)a2, this[5]);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 0x40000000;
  handler[2] = ___ZN12CCXPCService21handleConnectionEventEPv_block_invoke;
  handler[3] = &__block_descriptor_tmp_17;
  handler[4] = this;
  handler[5] = a2;
  xpc_connection_set_event_handler((xpc_connection_t)a2, handler);
  xpc_connection_resume((xpc_connection_t)a2);
}

void ___ZN12CCXPCService21handleConnectionEventEPv_block_invoke(uint64_t a1, void *a2)
{
  CCXPCService::handleIncomingMessage(*(CCXPCService **)(a1 + 32), *(_xpc_connection_s **)(a1 + 40), a2);
}

const char *_StringForXPCType(const _xpc_type_s *a1)
{
  if (a1 == (const _xpc_type_s *)MEMORY[0x1E0C812E0])
    return "XPC_TYPE_CONNECTION";
  if (a1 == (const _xpc_type_s *)MEMORY[0x1E0C81350])
    return "XPC_TYPE_NULL";
  if (a1 == (const _xpc_type_s *)MEMORY[0x1E0C812D0])
    return "XPC_TYPE_BOOL";
  if (a1 == (const _xpc_type_s *)MEMORY[0x1E0C81328])
    return "XPC_TYPE_INT64";
  if (a1 == (const _xpc_type_s *)MEMORY[0x1E0C81398])
    return "XPC_TYPE_UINT64";
  if (a1 == (const _xpc_type_s *)MEMORY[0x1E0C81300])
    return "XPC_TYPE_DOUBLE";
  if (a1 == (const _xpc_type_s *)MEMORY[0x1E0C812F0])
    return "XPC_TYPE_DATE";
  if (a1 == (const _xpc_type_s *)MEMORY[0x1E0C812E8])
    return "XPC_TYPE_DATA";
  if (a1 == (const _xpc_type_s *)MEMORY[0x1E0C81390])
    return "XPC_TYPE_STRING";
  if (a1 == (const _xpc_type_s *)MEMORY[0x1E0C813A0])
    return "XPC_TYPE_UUID";
  if (a1 == (const _xpc_type_s *)MEMORY[0x1E0C81318])
    return "XPC_TYPE_FD";
  if (a1 == (const _xpc_type_s *)MEMORY[0x1E0C81388])
    return "XPC_TYPE_SHMEM";
  if (a1 == (const _xpc_type_s *)MEMORY[0x1E0C812C8])
    return "XPC_TYPE_ARRAY";
  if (a1 == (const _xpc_type_s *)MEMORY[0x1E0C812F8])
    return "XPC_TYPE_DICTIONARY";
  if (a1 == (const _xpc_type_s *)MEMORY[0x1E0C81310])
    return "XPC_TYPE_ERROR";
  return "Unknown type";
}

void CCXPCService::handleIncomingMessage(CCXPCService *this, _xpc_connection_s *a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  __int128 v9;
  int v10;
  _BOOL4 v11;
  _BOOL4 v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  __int128 v19;
  const __CFAllocator *v20;
  __SecTask *v21;
  __SecTask *v22;
  CFTypeRef v23;
  CFTypeID TypeID;
  int v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  NSObject *v31;
  __int128 v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  NSObject *v37;
  __int128 v38;
  NSObject *v39;
  __int128 v40;
  unint64_t v41;
  __int128 v42;
  xpc_connection_t remote_connection;
  _xpc_connection_s *v44;
  const char *string;
  NSObject *v46;
  const char *v47;
  NSObject *v48;
  NSObject *v49;
  __int128 v50;
  size_t v51;
  const __CFData *v52;
  CFPropertyListRef v53;
  const void *v54;
  CFTypeID v55;
  CFIndex Count;
  NSObject *v57;
  NSObject *v58;
  __int128 v59;
  const void **v60;
  uint64_t v61;
  const void *v62;
  CFTypeID v63;
  const void *v64;
  CFTypeID v65;
  CFIndex Length;
  char *v67;
  const __CFString *v68;
  CFIndex v69;
  uint64_t v70;
  NSObject *v71;
  __int128 v72;
  __int128 v73;
  uint64_t v74;
  const void *v75;
  xpc_object_t reply;
  __int128 v77;
  const __CFData *v78;
  CFIndex v79;
  const void **v80;
  time_t v81;
  tm v82;
  CFErrorRef error;
  audit_token_t token;
  _BYTE buf[80];
  __int128 v86;
  __int128 v87;
  __int128 v88;
  audit_token_t v89;
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v6 = coreCaptureOsLog;
  v7 = MEMORY[0x1E0C81310];
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)&buf[4] = MEMORY[0x1DF0B289C](a3) == MEMORY[0x1E0C812E0];
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = MEMORY[0x1DF0B289C](a3) == v7;
    *(_WORD *)&buf[14] = 1024;
    *(_DWORD *)&buf[16] = MEMORY[0x1DF0B289C](a3) == MEMORY[0x1E0C812F8];
    v8 = v6;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)&buf[4] = MEMORY[0x1DF0B289C](a3) == MEMORY[0x1E0C812E0];
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = MEMORY[0x1DF0B289C](a3) == v7;
    *(_WORD *)&buf[14] = 1024;
    *(_DWORD *)&buf[16] = MEMORY[0x1DF0B289C](a3) == MEMORY[0x1E0C812F8];
    v8 = MEMORY[0x1E0C81028];
  }
  _os_log_impl(&dword_1DB697000, v8, OS_LOG_TYPE_DEFAULT, "CCXPCService::handleIncomingMessage: incoming, incomingConnection, XPC_TYPE_CONNECTION, %d, XPC_TYPE_ERROR, %d, XPC_TYPE_DICTIONARY, %d\n", buf, 0x14u);
LABEL_7:
  if (glog_fd)
  {
    *(_QWORD *)&v9 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v87 = v9;
    v88 = v9;
    *(_OWORD *)&buf[64] = v9;
    v86 = v9;
    *(_OWORD *)&buf[32] = v9;
    *(_OWORD *)&buf[48] = v9;
    *(_OWORD *)buf = v9;
    *(_OWORD *)&buf[16] = v9;
    memset(&v82, 0, sizeof(v82));
    *(_QWORD *)v89.val = 0xAAAAAAAAAAAAAAAALL;
    time((time_t *)&v89);
    localtime_r((const time_t *)&v89, &v82);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v82);
    dprintf(glog_fd, "%s ", buf);
    v10 = glog_fd;
    v11 = MEMORY[0x1DF0B289C](a3) == MEMORY[0x1E0C812E0];
    v12 = MEMORY[0x1DF0B289C](a3) == v7;
    v13 = MEMORY[0x1DF0B289C](a3);
    dprintf(v10, "CCXPCService::handleIncomingMessage: incoming, incomingConnection, XPC_TYPE_CONNECTION, %d, XPC_TYPE_ERROR, %d, XPC_TYPE_DICTIONARY, %d\n", v11, v12, v13 == MEMORY[0x1E0C812F8]);
  }
  if (MEMORY[0x1DF0B289C](a3) == v7)
  {
    v17 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v18 = v17;
LABEL_34:
        _os_log_impl(&dword_1DB697000, v18, OS_LOG_TYPE_DEFAULT, "CCXPCService::handleIncomingMessage release, incomingConnection\n", buf, 2u);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v18 = MEMORY[0x1E0C81028];
      goto LABEL_34;
    }
    if (glog_fd)
    {
      *(_QWORD *)&v32 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v32 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v87 = v32;
      v88 = v32;
      *(_OWORD *)&buf[64] = v32;
      v86 = v32;
      *(_OWORD *)&buf[32] = v32;
      *(_OWORD *)&buf[48] = v32;
      *(_OWORD *)buf = v32;
      *(_OWORD *)&buf[16] = v32;
      memset(&v82, 0, sizeof(v82));
      *(_QWORD *)v89.val = 0xAAAAAAAAAAAAAAAALL;
      time((time_t *)&v89);
      localtime_r((const time_t *)&v89, &v82);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v82);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "CCXPCService::handleIncomingMessage release, incomingConnection\n");
    }
    v33 = &__block_literal_global_1537;
    goto LABEL_54;
  }
  *(_QWORD *)&v14 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)v89.val = v14;
  *(_OWORD *)&v89.val[4] = v14;
  xpc_connection_get_audit_token();
  error = 0;
  v15 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&buf[4] = v89.val[0];
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = v89.val[7];
    v16 = v15;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&buf[4] = v89.val[0];
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = v89.val[7];
    v16 = MEMORY[0x1E0C81028];
  }
  _os_log_error_impl(&dword_1DB697000, v16, OS_LOG_TYPE_ERROR, "Token is [0]: 0x%x... [7]:%x \n", buf, 0xEu);
LABEL_17:
  if (glog_fd)
  {
    *(_QWORD *)&v19 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v87 = v19;
    v88 = v19;
    *(_OWORD *)&buf[64] = v19;
    v86 = v19;
    *(_OWORD *)&buf[32] = v19;
    *(_OWORD *)&buf[48] = v19;
    *(_OWORD *)buf = v19;
    *(_OWORD *)&buf[16] = v19;
    memset(&v82, 0, sizeof(v82));
    v81 = 0xAAAAAAAAAAAAAAAALL;
    time(&v81);
    localtime_r(&v81, &v82);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v82);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "Token is [0]: 0x%x... [7]:%x \n", v89.val[0], v89.val[7]);
  }
  v20 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  token = v89;
  v21 = SecTaskCreateWithAuditToken(v20, &token);
  if (!v21)
  {
    v28 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_39;
      *(_WORD *)buf = 0;
      v29 = v28;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_39;
      *(_WORD *)buf = 0;
      v29 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v29, OS_LOG_TYPE_ERROR, "Entitlement query did not succeed \n", buf, 2u);
LABEL_39:
    if (glog_fd)
    {
      *(_QWORD *)&v34 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v34 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v87 = v34;
      v88 = v34;
      *(_OWORD *)&buf[64] = v34;
      v86 = v34;
      *(_OWORD *)&buf[32] = v34;
      *(_OWORD *)&buf[48] = v34;
      *(_OWORD *)buf = v34;
      *(_OWORD *)&buf[16] = v34;
      memset(&v82, 0, sizeof(v82));
      v81 = 0xAAAAAAAAAAAAAAAALL;
      time(&v81);
      localtime_r(&v81, &v82);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v82);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "Entitlement query did not succeed \n");
    }
    goto LABEL_53;
  }
  v22 = v21;
  v23 = SecTaskCopyValueForEntitlement(v21, CFSTR("com.apple.corecapture.manager-access"), &error);
  if (!v23)
  {
    v30 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_42;
      *(_WORD *)buf = 0;
      v31 = v30;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_42;
      *(_WORD *)buf = 0;
      v31 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v31, OS_LOG_TYPE_ERROR, "Entitlement is NULL \n", buf, 2u);
LABEL_42:
    if (glog_fd)
    {
      *(_QWORD *)&v35 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v35 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v87 = v35;
      v88 = v35;
      *(_OWORD *)&buf[64] = v35;
      v86 = v35;
      *(_OWORD *)&buf[32] = v35;
      *(_OWORD *)&buf[48] = v35;
      *(_OWORD *)buf = v35;
      *(_OWORD *)&buf[16] = v35;
      memset(&v82, 0, sizeof(v82));
      v81 = 0xAAAAAAAAAAAAAAAALL;
      time(&v81);
      localtime_r(&v81, &v82);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v82);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "Entitlement is NULL \n");
    }
LABEL_44:
    v36 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_48;
      *(_WORD *)buf = 0;
      v37 = v36;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_48;
      *(_WORD *)buf = 0;
      v37 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v37, OS_LOG_TYPE_ERROR, "Entitlement couldnt be found \n", buf, 2u);
LABEL_48:
    if (glog_fd)
    {
      *(_QWORD *)&v38 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v38 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v87 = v38;
      v88 = v38;
      *(_OWORD *)&buf[64] = v38;
      v86 = v38;
      *(_OWORD *)&buf[32] = v38;
      *(_OWORD *)&buf[48] = v38;
      *(_OWORD *)buf = v38;
      *(_OWORD *)&buf[16] = v38;
      memset(&v82, 0, sizeof(v82));
      v81 = 0xAAAAAAAAAAAAAAAALL;
      time(&v81);
      localtime_r(&v81, &v82);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v82);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "Entitlement couldnt be found \n");
    }
    if (!v23)
      goto LABEL_52;
    goto LABEL_51;
  }
  TypeID = CFBooleanGetTypeID();
  if (TypeID != CFGetTypeID(v23))
    goto LABEL_44;
  v25 = CFEqual(v23, (CFTypeRef)*MEMORY[0x1E0C9AE50]);
  v26 = coreCaptureOsLog;
  if (!v25)
  {
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_66;
      *(_WORD *)buf = 0;
      v39 = v26;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_66;
      *(_WORD *)buf = 0;
      v39 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v39, OS_LOG_TYPE_ERROR, "Entitlement exists, but check failed. \n", buf, 2u);
LABEL_66:
    if (glog_fd)
    {
      *(_QWORD *)&v42 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v42 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v87 = v42;
      v88 = v42;
      *(_OWORD *)&buf[64] = v42;
      v86 = v42;
      *(_OWORD *)&buf[32] = v42;
      *(_OWORD *)&buf[48] = v42;
      *(_OWORD *)buf = v42;
      *(_OWORD *)&buf[16] = v42;
      memset(&v82, 0, sizeof(v82));
      v81 = 0xAAAAAAAAAAAAAAAALL;
      time(&v81);
      localtime_r(&v81, &v82);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v82);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "Entitlement exists, but check failed. \n");
LABEL_68:
      CFRelease(v23);
      CFRelease(v22);
      v41 = 0x1F02F7000uLL;
      if (v25)
        goto LABEL_69;
      goto LABEL_53;
    }
LABEL_51:
    CFRelease(v23);
LABEL_52:
    CFRelease(v22);
LABEL_53:
    v33 = &__block_literal_global_7;
LABEL_54:
    xpc_connection_set_event_handler(a2, v33);
    xpc_connection_cancel(a2);
    xpc_release(a2);
    return;
  }
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_62;
    *(_WORD *)buf = 0;
    v27 = v26;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_62;
    *(_WORD *)buf = 0;
    v27 = MEMORY[0x1E0C81028];
  }
  _os_log_impl(&dword_1DB697000, v27, OS_LOG_TYPE_DEFAULT, "Entitlement exists, and check is successful\n", buf, 2u);
LABEL_62:
  if (glog_fd)
  {
    *(_QWORD *)&v40 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v40 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v87 = v40;
    v88 = v40;
    *(_OWORD *)&buf[64] = v40;
    v86 = v40;
    *(_OWORD *)&buf[32] = v40;
    *(_OWORD *)&buf[48] = v40;
    *(_OWORD *)buf = v40;
    *(_OWORD *)&buf[16] = v40;
    memset(&v82, 0, sizeof(v82));
    v81 = 0xAAAAAAAAAAAAAAAALL;
    time(&v81);
    localtime_r(&v81, &v82);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v82);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "Entitlement exists, and check is successful\n");
    goto LABEL_68;
  }
  CFRelease(v23);
  CFRelease(v22);
  v41 = 0x1F02F7000;
LABEL_69:
  if (shutDownPending)
    goto LABEL_72;
  *((_BYTE *)this + 48) = 1;
  if (pthread_mutex_lock((pthread_mutex_t *)((char *)this + 56)))
    goto LABEL_72;
  if (MEMORY[0x1DF0B289C](a3) != MEMORY[0x1E0C812F8])
    goto LABEL_72;
  remote_connection = xpc_dictionary_get_remote_connection(a3);
  if (!remote_connection)
    goto LABEL_72;
  v44 = remote_connection;
  string = xpc_dictionary_get_string(a3, "CCConfig");
  v46 = *(NSObject **)(v41 + 1680);
  if (!string)
  {
    if (v46)
    {
      if (!os_log_type_enabled(*(os_log_t *)(v41 + 1680), OS_LOG_TYPE_ERROR))
        goto LABEL_125;
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "CCConfig";
      v49 = v46;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_125;
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "CCConfig";
      v49 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v49, OS_LOG_TYPE_ERROR, "CCXPCService::handleIncomingMessage No %s is received\n", buf, 0xCu);
LABEL_125:
    if (glog_fd)
    {
      *(_QWORD *)&v77 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v77 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v87 = v77;
      v88 = v77;
      *(_OWORD *)&buf[64] = v77;
      v86 = v77;
      *(_OWORD *)&buf[32] = v77;
      *(_OWORD *)&buf[48] = v77;
      *(_OWORD *)buf = v77;
      *(_OWORD *)&buf[16] = v77;
      memset(&v82, 0, sizeof(v82));
      *(_QWORD *)v89.val = 0xAAAAAAAAAAAAAAAALL;
      time((time_t *)&v89);
      localtime_r((const time_t *)&v89, &v82);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v82);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "CCXPCService::handleIncomingMessage No %s is received\n", "CCConfig");
    }
    goto LABEL_72;
  }
  v47 = string;
  if (v46)
  {
    if (!os_log_type_enabled(*(os_log_t *)(v41 + 1680), OS_LOG_TYPE_DEFAULT))
      goto LABEL_94;
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = v47;
    v48 = v46;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_94;
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = v47;
    v48 = MEMORY[0x1E0C81028];
  }
  _os_log_impl(&dword_1DB697000, v48, OS_LOG_TYPE_DEFAULT, "CCConfig is %s\n", buf, 0xCu);
LABEL_94:
  if (glog_fd)
  {
    *(_QWORD *)&v50 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v50 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v87 = v50;
    v88 = v50;
    *(_OWORD *)&buf[64] = v50;
    v86 = v50;
    *(_OWORD *)&buf[32] = v50;
    *(_OWORD *)&buf[48] = v50;
    *(_OWORD *)buf = v50;
    *(_OWORD *)&buf[16] = v50;
    memset(&v82, 0, sizeof(v82));
    *(_QWORD *)v89.val = 0xAAAAAAAAAAAAAAAALL;
    time((time_t *)&v89);
    localtime_r((const time_t *)&v89, &v82);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v82);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "CCConfig is %s\n", v47);
  }
  v51 = strlen(v47);
  v52 = CFDataCreate(v20, (const UInt8 *)v47, v51);
  *(_QWORD *)v89.val = 100;
  v53 = CFPropertyListCreateWithData(v20, v52, 0, (CFPropertyListFormat *)&v89, 0);
  v54 = v53;
  if (!v53)
    goto LABEL_129;
  if (!CFPropertyListIsValid(v53, kCFPropertyListXMLFormat_v1_0))
    goto LABEL_129;
  v55 = CFGetTypeID(v54);
  if (v55 != CFDictionaryGetTypeID())
    goto LABEL_129;
  Count = CFDictionaryGetCount((CFDictionaryRef)v54);
  v57 = *(NSObject **)(v41 + 1680);
  if (v57)
  {
    if (os_log_type_enabled(*(os_log_t *)(v41 + 1680), OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = Count;
      v58 = v57;
LABEL_104:
      _os_log_impl(&dword_1DB697000, v58, OS_LOG_TYPE_DEFAULT, "CCXPCService::handleIncomingMessage keycount : %ld\n", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = Count;
    v58 = MEMORY[0x1E0C81028];
    goto LABEL_104;
  }
  if (glog_fd)
  {
    *(_QWORD *)&v59 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v59 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v87 = v59;
    v88 = v59;
    *(_OWORD *)&buf[64] = v59;
    v86 = v59;
    *(_OWORD *)&buf[32] = v59;
    *(_OWORD *)&buf[48] = v59;
    *(_OWORD *)buf = v59;
    *(_OWORD *)&buf[16] = v59;
    memset(&v82, 0, sizeof(v82));
    *(_QWORD *)token.val = 0xAAAAAAAAAAAAAAAALL;
    time((time_t *)&token);
    localtime_r((const time_t *)&token, &v82);
    strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v82);
    dprintf(glog_fd, "%s ", buf);
    dprintf(glog_fd, "CCXPCService::handleIncomingMessage keycount : %ld\n", Count);
  }
  if (!Count)
    goto LABEL_129;
  v78 = v52;
  v79 = Count;
  v60 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
  v80 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
  CFDictionaryGetKeysAndValues((CFDictionaryRef)v54, v60, v80);
  v61 = 0;
  while (1)
  {
    v62 = v60[v61];
    v63 = CFStringGetTypeID();
    if (!validCFObjectReference("CCXPCService::handleIncomingMessage", v62, v63))
      break;
    v64 = v80[v61];
    v65 = CFDictionaryGetTypeID();
    if ((validCFObjectReference("CCXPCService::handleIncomingMessage", v64, v65) & 1) == 0)
      goto LABEL_123;
    Length = CFStringGetLength((CFStringRef)v60[v61]);
    v67 = (char *)malloc_type_malloc(Length + 1, 0x580F798EuLL);
    v68 = (const __CFString *)v60[v61];
    v69 = CFStringGetLength(v68);
    CFStringGetCString(v68, v67, v69 + 1, 0);
    v70 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = v67;
        v71 = v70;
LABEL_116:
        _os_log_impl(&dword_1DB697000, v71, OS_LOG_TYPE_DEFAULT, "CCXPCService::handleIncomingMessage Key is %s\n", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = v67;
      v71 = MEMORY[0x1E0C81028];
      goto LABEL_116;
    }
    v72 = 0uLL;
    if (glog_fd)
    {
      *(_QWORD *)&v73 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v73 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v87 = v73;
      v88 = v73;
      *(_OWORD *)&buf[64] = v73;
      v86 = v73;
      *(_OWORD *)&buf[32] = v73;
      *(_OWORD *)&buf[48] = v73;
      *(_OWORD *)buf = v73;
      *(_OWORD *)&buf[16] = v73;
      memset(&v82, 0, sizeof(v82));
      *(_QWORD *)token.val = 0xAAAAAAAAAAAAAAAALL;
      time((time_t *)&token);
      localtime_r((const time_t *)&token, &v82);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v82);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "CCXPCService::handleIncomingMessage Key is %s\n", v67);
      v72 = 0uLL;
    }
    v74 = *((_QWORD *)this + 2);
    v75 = v80[v61];
    *(_QWORD *)&v86 = 0xAAAAAAAAAAAAAA01;
    *(_QWORD *)buf = v74;
    *(_OWORD *)&buf[8] = v72;
    *(_OWORD *)&buf[24] = v72;
    *(_OWORD *)&buf[40] = v72;
    *(_OWORD *)&buf[56] = v72;
    *(_QWORD *)&buf[72] = 0;
    CCConfigure::applyConfiguration(v74, v75, buf);
    if (v67)
      free(v67);
    if (v79 == ++v61)
    {
      reply = xpc_dictionary_create_reply(a3);
      xpc_dictionary_set_string(reply, "rc", "rc.ok");
      xpc_connection_send_message(v44, reply);
      xpc_release(reply);
LABEL_123:
      v52 = v78;
      free(v60);
      goto LABEL_128;
    }
  }
  free(v60);
  v52 = v78;
  if (!v80)
    goto LABEL_129;
LABEL_128:
  free(v80);
LABEL_129:
  if (v52)
    CFRelease(v52);
  if (v54)
    CFRelease(v54);
LABEL_72:
  *((_BYTE *)this + 48) = 0;
  pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 56));
}

uint64_t CCXPCService::freeResources(CCXPCService *this)
{
  pthread_mutex_t *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  _xpc_connection_s *v6;
  NSObject *v7;

  v2 = (pthread_mutex_t *)((char *)this + 56);
  result = pthread_mutex_lock((pthread_mutex_t *)((char *)this + 56));
  if (!(_DWORD)result)
  {
    v4 = *((_QWORD *)this + 2);
    if (v4)
    {
      (*(void (**)(uint64_t))(*(_QWORD *)v4 + 48))(v4);
      *((_QWORD *)this + 2) = 0;
    }
    v5 = *((_QWORD *)this + 3);
    if (v5)
    {
      (*(void (**)(uint64_t))(*(_QWORD *)v5 + 48))(v5);
      *((_QWORD *)this + 3) = 0;
    }
    v6 = (_xpc_connection_s *)*((_QWORD *)this + 4);
    if (v6)
    {
      xpc_connection_cancel(v6);
      xpc_release(*((xpc_object_t *)this + 4));
    }
    *((_QWORD *)this + 4) = 0;
    v7 = *((_QWORD *)this + 5);
    if (v7)
      dispatch_release(v7);
    *((_QWORD *)this + 5) = 0;
    pthread_mutex_unlock(v2);
    return pthread_mutex_destroy(v2);
  }
  return result;
}

void CCXPCService::CCXPCService(CCXPCService *this)
{
  *((_DWORD *)this + 2) = 1;
  *(_QWORD *)this = off_1EA320238;
}

{
  *((_DWORD *)this + 2) = 1;
  *(_QWORD *)this = off_1EA320238;
}

char *CCXPCService::withConfigureAndPipeMonitor(CCXPCService *this, CCConfigure *a2, CCPipeMonitor *a3)
{
  char *v5;

  v5 = (char *)malloc_type_malloc(0x78uLL, 0xEE9A6C17uLL);
  *(_OWORD *)(v5 + 12) = 0u;
  *(_OWORD *)(v5 + 28) = 0u;
  *(_OWORD *)(v5 + 44) = 0u;
  *(_OWORD *)(v5 + 60) = 0u;
  *(_OWORD *)(v5 + 76) = 0u;
  *(_OWORD *)(v5 + 92) = 0u;
  *(_OWORD *)(v5 + 104) = 0u;
  *((_DWORD *)v5 + 2) = 1;
  *(_QWORD *)v5 = off_1EA320238;
  CCXPCService::initWithConfigureAndPipeMonitor((CCXPCService *)v5, this, a2);
  return v5;
}

void CCLogFile::~CCLogFile(void *this)
{
  if (this)
    free(this);
}

uint64_t CCLogFile::openFile(CCLogFile *this, const char *a2)
{
  const __CFString *v3;
  CFIndex Length;
  char *v5;
  const __CFString *v6;
  CFIndex v7;
  int v8;
  uint64_t v9;

  if (!*((_DWORD *)this + 28))
    return CCLogFile::addFile(this);
  v3 = *(const __CFString **)(*((_QWORD *)this + 17) + 8 * *((unsigned int *)this + 36));
  if (v3)
  {
    Length = CFStringGetLength(v3);
    v5 = (char *)malloc_type_malloc(Length + 1, 0xF824E4E7uLL);
    v6 = *(const __CFString **)(*((_QWORD *)this + 17) + 8 * *((unsigned int *)this + 36));
    v7 = CFStringGetLength(v6);
    CFStringGetCString(v6, v5, v7 + 1, 0);
    v8 = open(v5, 10);
    *((_DWORD *)this + 9) = v8;
    v9 = v8 != -1;
    if (v8 != -1)
      (*(void (**)(CCLogFile *, _QWORD))(*(_QWORD *)this + 168))(this, *((unsigned int *)this + 29));
    if (v5)
      free(v5);
  }
  else
  {
    v9 = CCLogFile::addFile(this);
  }
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 160));
  *((_DWORD *)this + 36) = 0;
  pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 160));
  return v9;
}

uint64_t CCLogFile::writeLog(uint64_t a1)
{
  (*(void (**)(_QWORD))(**(_QWORD **)(a1 + 16) + 72))(*(_QWORD *)(a1 + 16));
  if (*(_BYTE *)(a1 + 1248))
    return CCLogFile::addFile((CCLogFile *)a1);
  else
    return 1;
}

uint64_t CCLogFile::writeCommentEntry(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  if (a5 && (*(_BYTE *)(a1 + 124) & 2) != 0)
    return 1;
  (*(void (**)(_QWORD))(**(_QWORD **)(a1 + 16) + 80))(*(_QWORD *)(a1 + 16));
  if (!*(_BYTE *)(a1 + 1248))
    return 1;
  else
    return CCLogFile::addFile((CCLogFile *)a1);
}

uint64_t CCLogFile::configureLogOptions(uint64_t a1, const char *a2)
{
  uint64_t v4;
  NSObject *v5;
  __int128 v6;
  uint64_t v7;
  int v8;
  int v9;
  int v10;
  NSObject *v11;
  int v12;
  int v13;
  int v14;
  __int128 v15;
  char *v16;
  char *v17;
  char *v18;
  int v19;
  int v20;
  uint64_t v21;
  int v22;
  int v23;
  NSObject *v24;
  int v25;
  int v26;
  __int128 v27;
  time_t v29;
  time_t v30;
  tm v31;
  uint8_t buf[16];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = a2;
    v5 = v4;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = a2;
    v5 = MEMORY[0x1E0C81028];
  }
  _os_log_impl(&dword_1DB697000, v5, OS_LOG_TYPE_DEFAULT, "CCLogFile::configureLogOptions Configuration is %s\n", buf, 0xCu);
LABEL_7:
  if (glog_fd)
  {
    *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v38 = v6;
    v39 = v6;
    v36 = v6;
    v37 = v6;
    v34 = v6;
    v35 = v6;
    *(_OWORD *)buf = v6;
    v33 = v6;
    memset(&v31, 0, sizeof(v31));
    v30 = 0xAAAAAAAAAAAAAAAALL;
    time(&v30);
    localtime_r(&v30, &v31);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v31);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCLogFile::configureLogOptions Configuration is %s\n", a2);
  }
  v7 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    v8 = *(_DWORD *)(a1 + 112);
    v9 = *(_DWORD *)(a1 + 116);
    v10 = *(_DWORD *)(a1 + 120);
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)&buf[4] = v8;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = v9;
    *(_WORD *)&buf[14] = 1024;
    LODWORD(v33) = v10;
    v11 = v7;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_15;
    v12 = *(_DWORD *)(a1 + 112);
    v13 = *(_DWORD *)(a1 + 116);
    v14 = *(_DWORD *)(a1 + 120);
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)&buf[4] = v12;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = v13;
    *(_WORD *)&buf[14] = 1024;
    LODWORD(v33) = v14;
    v11 = MEMORY[0x1E0C81028];
  }
  _os_log_impl(&dword_1DB697000, v11, OS_LOG_TYPE_DEFAULT, "CCLogFile::configureLogOptions Current Log Type:%d, File Size=%u, Max Number Of Files:%u\n", buf, 0x14u);
LABEL_15:
  if (glog_fd)
  {
    *(_QWORD *)&v15 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v15 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v38 = v15;
    v39 = v15;
    v36 = v15;
    v37 = v15;
    v34 = v15;
    v35 = v15;
    *(_OWORD *)buf = v15;
    v33 = v15;
    memset(&v31, 0, sizeof(v31));
    v30 = 0xAAAAAAAAAAAAAAAALL;
    time(&v30);
    localtime_r(&v30, &v31);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v31);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCLogFile::configureLogOptions Current Log Type:%d, File Size=%u, Max Number Of Files:%u\n", *(_DWORD *)(a1 + 112), *(_DWORD *)(a1 + 116), *(_DWORD *)(a1 + 120));
  }
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 160));
  v30 = 0;
  strlcpy((char *)(a1 + 224), a2, 0x400uLL);
  v16 = strtok_r((char *)(a1 + 224), ",", (char **)&v30);
  if (!strcmp(v16, "S"))
  {
    *(_QWORD *)(a1 + 112) = 0xFFFFFFFF00000001;
    v19 = 1;
  }
  else
  {
    *(_DWORD *)(a1 + 112) = 0;
    v17 = strtok_r(0, ",", (char **)&v30);
    if (v17)
      *(_DWORD *)(a1 + 116) = strtol(v17, 0, 0) << 10;
    v18 = strtok_r(0, ",", (char **)&v30);
    if (v18)
      v19 = strtol(v18, 0, 0);
    else
      v19 = *(_DWORD *)(a1 + 120);
  }
  v20 = v19 + 1;
  *(_DWORD *)(a1 + 120) = v19 + 1;
  v21 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_30;
    v22 = *(_DWORD *)(a1 + 112);
    v23 = *(_DWORD *)(a1 + 116);
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)&buf[4] = v22;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = v23;
    *(_WORD *)&buf[14] = 1024;
    LODWORD(v33) = v20;
    v24 = v21;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_30;
    v25 = *(_DWORD *)(a1 + 112);
    v26 = *(_DWORD *)(a1 + 116);
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)&buf[4] = v25;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = v26;
    *(_WORD *)&buf[14] = 1024;
    LODWORD(v33) = v20;
    v24 = MEMORY[0x1E0C81028];
  }
  _os_log_impl(&dword_1DB697000, v24, OS_LOG_TYPE_DEFAULT, "CCLogFile::configureLogOptions Configured Log Type:%d, File Size=%u, Max Number Of Files:%u\n", buf, 0x14u);
LABEL_30:
  if (glog_fd)
  {
    *(_QWORD *)&v27 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v27 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v38 = v27;
    v39 = v27;
    v36 = v27;
    v37 = v27;
    v34 = v27;
    v35 = v27;
    *(_OWORD *)buf = v27;
    v33 = v27;
    memset(&v31, 0, sizeof(v31));
    v29 = 0xAAAAAAAAAAAAAAAALL;
    time(&v29);
    localtime_r(&v29, &v31);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v31);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCLogFile::configureLogOptions Configured Log Type:%d, File Size=%u, Max Number Of Files:%u\n", *(_DWORD *)(a1 + 112), *(_DWORD *)(a1 + 116), *(_DWORD *)(a1 + 120));
  }
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 160));
  CCLogFile::buildFileTables((CFStringRef *)a1);
  return 0;
}

void CCLogFile::cleanupCapturedFiles(CCLogFile *this)
{
  CFIndex Length;
  char *v3;
  const __CFString *v4;
  CFIndex v5;
  uint64_t v6;
  int v7;
  NSObject *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const __CFString *v12;
  uint64_t v13;
  CCLogFile *v14;
  const char *CStringPtr;
  NSObject *v16;
  const char *v17;
  __int128 v18;
  int v19;
  const char *v20;
  uint64_t v21;
  _QWORD *v22;
  int v23;
  __int128 v24;
  time_t v25;
  tm v26;
  _BYTE buf[32];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (*((_DWORD *)this + 28) == 1)
  {
    Length = CFStringGetLength(*(CFStringRef *)(*((_QWORD *)this + 17) + 8 * *((unsigned int *)this + 36)));
    v3 = (char *)malloc_type_malloc(Length + 1, 0xBA03DE5DuLL);
    v4 = *(const __CFString **)(*((_QWORD *)this + 17) + 8 * *((unsigned int *)this + 36));
    v5 = CFStringGetLength(v4);
    CFStringGetCString(v4, v3, v5 + 1, 0);
    v6 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      {
        v7 = *((_DWORD *)this + 28);
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&buf[4] = v7;
        *(_WORD *)&buf[8] = 2080;
        *(_QWORD *)&buf[10] = v3;
        v8 = v6;
LABEL_26:
        _os_log_impl(&dword_1DB697000, v8, OS_LOG_TYPE_DEFAULT, "CCLogFile::cleanupCapturedFiles log type is %d, current file is %s\n", buf, 0x12u);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v23 = *((_DWORD *)this + 28);
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&buf[4] = v23;
      *(_WORD *)&buf[8] = 2080;
      *(_QWORD *)&buf[10] = v3;
      v8 = MEMORY[0x1E0C81028];
      goto LABEL_26;
    }
    if (glog_fd)
    {
      *(_QWORD *)&v24 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v32 = v24;
      v33 = v24;
      v30 = v24;
      v31 = v24;
      v28 = v24;
      v29 = v24;
      *(_OWORD *)buf = v24;
      *(_OWORD *)&buf[16] = v24;
      memset(&v26, 0, sizeof(v26));
      v25 = 0xAAAAAAAAAAAAAAAALL;
      time(&v25);
      localtime_r(&v25, &v26);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v26);
      dprintf(glog_fd, "%s ", buf);
      dprintf(glog_fd, "CCLogFile::cleanupCapturedFiles log type is %d, current file is %s\n", *((_DWORD *)this + 28), v3);
    }
    if (v3)
      free(v3);
    return;
  }
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 160));
  v9 = *((unsigned int *)this + 30);
  if ((_DWORD)v9)
  {
    v10 = 0;
    while (1)
    {
      if (v10 != *((_DWORD *)this + 36))
      {
        v11 = *((_QWORD *)this + 17);
        if (v11)
        {
          v12 = *(const __CFString **)(v11 + 8 * v10);
          if (v12)
            break;
        }
      }
LABEL_19:
      if (++v10 >= v9)
        goto LABEL_20;
    }
    v13 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      v14 = (CCLogFile *)os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT);
      if ((_DWORD)v14)
      {
        CStringPtr = CFStringGetCStringPtr(v12, 0);
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&buf[4] = v10;
        *(_WORD *)&buf[8] = 2080;
        *(_QWORD *)&buf[10] = CStringPtr;
        v16 = v13;
LABEL_15:
        _os_log_impl(&dword_1DB697000, v16, OS_LOG_TYPE_DEFAULT, "CCLogFile::cleanupCapturedFiles() deleting file[%u]: %s\n", buf, 0x12u);
      }
    }
    else
    {
      v14 = (CCLogFile *)os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
      if ((_DWORD)v14)
      {
        v17 = CFStringGetCStringPtr(v12, 0);
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&buf[4] = v10;
        *(_WORD *)&buf[8] = 2080;
        *(_QWORD *)&buf[10] = v17;
        v16 = MEMORY[0x1E0C81028];
        goto LABEL_15;
      }
    }
    if (glog_fd)
    {
      *(_QWORD *)&v18 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v32 = v18;
      v33 = v18;
      v30 = v18;
      v31 = v18;
      v28 = v18;
      v29 = v18;
      *(_OWORD *)buf = v18;
      *(_OWORD *)&buf[16] = v18;
      memset(&v26, 0, sizeof(v26));
      v25 = 0xAAAAAAAAAAAAAAAALL;
      time(&v25);
      localtime_r(&v25, &v26);
      strftime(buf, 0x80uLL, "%b %d %H:%M:%S", &v26);
      dprintf(glog_fd, "%s ", buf);
      v19 = glog_fd;
      v20 = CFStringGetCStringPtr(*(CFStringRef *)(*((_QWORD *)this + 17) + 8 * v10), 0);
      v14 = (CCLogFile *)dprintf(v19, "CCLogFile::cleanupCapturedFiles() deleting file[%u]: %s\n", v10, v20);
    }
    CCLogFile::deleteFile(v14, *(__CFString **)(*((_QWORD *)this + 17) + 8 * v10));
    *(_QWORD *)(*((_QWORD *)this + 17) + 8 * v10) = 0;
    v9 = *((unsigned int *)this + 30);
    goto LABEL_19;
  }
LABEL_20:
  v21 = *((unsigned int *)this + 36);
  if ((_DWORD)v21)
  {
    v22 = (_QWORD *)*((_QWORD *)this + 17);
    if (v22)
    {
      *v22 = v22[v21];
      *(_QWORD *)(*((_QWORD *)this + 17) + 8 * v21) = 0;
      *((_DWORD *)this + 36) = 0;
    }
  }
  pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 160));
}

void CCLogFile::freeFilePathArray(CCLogFile *this)
{
  CCLogFile *v2;
  unint64_t v3;

  v2 = (CCLogFile *)*((_QWORD *)this + 17);
  if (v2)
  {
    if (!*((_DWORD *)this + 32))
      goto LABEL_6;
    v3 = 0;
    do
    {
      CCLogFile::deleteFile(v2, *(__CFString **)(*((_QWORD *)this + 17) + 8 * v3));
      *(_QWORD *)(*((_QWORD *)this + 17) + 8 * v3++) = 0;
    }
    while (v3 < *((unsigned int *)this + 32));
    v2 = (CCLogFile *)*((_QWORD *)this + 17);
    if (v2)
    {
LABEL_6:
      free(v2);
      *((_QWORD *)this + 17) = 0;
    }
  }
}

const __CFString *CCLogFile::sortByFileName(const __CFString *this, int a2)
{
  unsigned int v2;
  const __CFString *v3;
  unsigned int v4;
  char v5;
  uint64_t info;
  uint64_t v7;
  const __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;

  v2 = a2 - 1;
  if (a2 != 1)
  {
    v3 = this;
    v4 = 0;
    v5 = 0;
    do
    {
      while (1)
      {
        info = v3[4].info;
        this = *(const __CFString **)(info + 8 * v4);
        v7 = v4 + 1;
        if (!this)
          break;
        v8 = *(const __CFString **)(info + 8 * v7);
        if (!v8)
          break;
        this = (const __CFString *)CFStringCompare(this, v8, 0);
        if (this != (const __CFString *)1)
          break;
        v9 = v3[4].info;
        v10 = *(_QWORD *)(v9 + 8 * v4);
        *(_QWORD *)(v9 + 8 * v4) = *(_QWORD *)(v9 + 8 * v7);
        *(_QWORD *)(v3[4].info + 8 * v7) = v10;
        v5 = v7 < v2;
        if (v7 >= v2)
          v4 = 0;
        else
          ++v4;
      }
      v11 = (v7 < v2) | v5;
      if (v7 >= v2)
        v4 = 0;
      else
        ++v4;
      v5 &= v7 < v2;
    }
    while ((v11 & 1) != 0);
  }
  return this;
}

CCLogFile *CCLogFile::withRegistryEntry(CCLogFile *this)
{
  uint64_t v2;
  NSObject *v3;
  __int128 v4;
  const __CFNumber *CFProperty;
  int v6;
  uint64_t v7;
  NSObject *v8;
  CCLogFile *v9;
  __int128 v10;
  char valuePtr;
  time_t v13;
  tm v14;
  uint8_t buf[16];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = coreCaptureOsLog;
  if (coreCaptureOsLog)
  {
    if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v3 = v2;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v3 = MEMORY[0x1E0C81028];
  }
  _os_log_impl(&dword_1DB697000, v3, OS_LOG_TYPE_DEFAULT, "CCLogFile::withRegistryEntry()\n", buf, 2u);
LABEL_7:
  if (glog_fd)
  {
    *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v21 = v4;
    v22 = v4;
    v19 = v4;
    v20 = v4;
    v17 = v4;
    v18 = v4;
    *(_OWORD *)buf = v4;
    v16 = v4;
    memset(&v14, 0, sizeof(v14));
    v13 = 0xAAAAAAAAAAAAAAAALL;
    time(&v13);
    localtime_r(&v13, &v14);
    strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v14);
    dprintf(glog_fd, "%s ", (const char *)buf);
    dprintf(glog_fd, "CCLogFile::withRegistryEntry()\n");
  }
  CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty((io_registry_entry_t)this, CFSTR("LogType"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  valuePtr = -86;
  CFNumberGetValue(CFProperty, kCFNumberSInt8Type, &valuePtr);
  if (CFProperty)
    CFRelease(CFProperty);
  v6 = valuePtr;
  if (valuePtr >= 2)
  {
    v7 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled((os_log_t)coreCaptureOsLog, OS_LOG_TYPE_ERROR))
        goto LABEL_18;
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v6;
      v8 = v7;
    }
    else
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_18;
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v6;
      v8 = MEMORY[0x1E0C81028];
    }
    _os_log_error_impl(&dword_1DB697000, v8, OS_LOG_TYPE_ERROR, "CCLogFile::withRegistryEntry() Invalid log type %d\n", buf, 8u);
LABEL_18:
    if (glog_fd)
    {
      *(_QWORD *)&v10 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v21 = v10;
      v22 = v10;
      v19 = v10;
      v20 = v10;
      v17 = v10;
      v18 = v10;
      *(_OWORD *)buf = v10;
      v16 = v10;
      memset(&v14, 0, sizeof(v14));
      v13 = 0xAAAAAAAAAAAAAAAALL;
      time(&v13);
      localtime_r(&v13, &v14);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v14);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "CCLogFile::withRegistryEntry() Invalid log type %d\n", valuePtr);
    }
    return 0;
  }
  v9 = (CCLogFile *)malloc_type_malloc(0x500uLL, 0xEE9A6C17uLL);
  bzero((char *)v9 + 8, 0x4F8uLL);
  *((_DWORD *)v9 + 2) = 1;
  *(_QWORD *)v9 = off_1EA320370;
  if ((CCLogFile::initWithRegistryEntry(v9, this) & 1) == 0)
  {
    (*(void (**)(CCLogFile *))(*(_QWORD *)v9 + 48))(v9);
    return 0;
  }
  return v9;
}

BOOL CCLogFile::lock(CCLogFile *this)
{
  return pthread_mutex_lock((pthread_mutex_t *)((char *)this + 160)) == 0;
}

BOOL CCLogFile::unlock(CCLogFile *this)
{
  return pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 160)) == 0;
}

BOOL CCLogFile::locked(CCLogFile *this)
{
  pthread_mutex_t *v1;
  int v2;

  v1 = (pthread_mutex_t *)((char *)this + 160);
  v2 = pthread_mutex_trylock((pthread_mutex_t *)((char *)this + 160));
  if (!v2)
    pthread_mutex_unlock(v1);
  return v2 == 0;
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1E0C97D90]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1E0C983A0](allocator, bytes, length);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x1E0C983C8](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1E0C98418]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98500](theDict, key, value);
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
  MEMORY[0x1E0C98508](theDict, applier, context);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x1E0C98518](theDict, key);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98538](allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98558](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1E0C98570](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
  MEMORY[0x1E0C985A0](theDict, keys, values);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1E0C985A8]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x1E0C985E8](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFStringRef CFErrorCopyFailureReason(CFErrorRef err)
{
  return (CFStringRef)MEMORY[0x1E0C98638](err);
}

CFIndex CFGetRetainCount(CFTypeRef cf)
{
  return MEMORY[0x1E0C98720](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFTypeRef CFMakeCollectable(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98858](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

CFComparisonResult CFNumberCompare(CFNumberRef number, CFNumberRef otherNumber, void *context)
{
  return MEMORY[0x1E0C98910](number, otherNumber, context);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1E0C98928](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

uint64_t CFPreferencesFlushCaches()
{
  return MEMORY[0x1E0C98A68]();
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x1E0C98A80](key, value, applicationID);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1E0C98AA0](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98AD0](allocator, data, options, format, error);
}

CFPropertyListRef CFPropertyListCreateWithStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98AE0](allocator, stream, streamLength, options, format, error);
}

Boolean CFPropertyListIsValid(CFPropertyListRef plist, CFPropertyListFormat format)
{
  return MEMORY[0x1E0C98AF0](plist, format);
}

CFIndex CFPropertyListWrite(CFPropertyListRef propertyList, CFWriteStreamRef stream, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return MEMORY[0x1E0C98AF8](propertyList, stream, format, options, error);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
  MEMORY[0x1E0C98B10](stream);
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFReadStreamRef)MEMORY[0x1E0C98B48](alloc, fileURL);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x1E0C98B80](stream);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x1E0C98D70](theSet, value);
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x1E0C98D80](theSet, value);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x1E0C98D98](allocator, capacity, callBacks);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x1E0C98ED8](theString, appendedString);
}

void CFStringAppendCString(CFMutableStringRef theString, const char *cStr, CFStringEncoding encoding)
{
  MEMORY[0x1E0C98EE0](theString, cStr, *(_QWORD *)&encoding);
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  MEMORY[0x1E0C98EF0](theString, formatOptions, format);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F90](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F98](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98FD0](alloc, cStr, *(_QWORD *)&encoding);
}

CFIndex CFStringFindAndReplace(CFMutableStringRef theString, CFStringRef stringToFind, CFStringRef replacementString, CFRange rangeToSearch, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C99058](theString, stringToFind, replacementString, rangeToSearch.location, rangeToSearch.length, compareOptions);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99098](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1E0C990A0](theString, *(_QWORD *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

Boolean CFURLCreateDataAndPropertiesFromResource(CFAllocatorRef alloc, CFURLRef url, CFDataRef *resourceData, CFDictionaryRef *properties, CFArrayRef desiredProperties, SInt32 *errorCode)
{
  return MEMORY[0x1E0C993B0](alloc, url, resourceData, properties, desiredProperties, errorCode);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1E0C99420](allocator, filePath, pathStyle, isDirectory);
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x1E0C99448](allocator, URLString, baseURL);
}

Boolean CFURLWriteDataAndPropertiesToResource(CFURLRef url, CFDataRef dataToWrite, CFDictionaryRef propertiesToWrite, SInt32 *errorCode)
{
  return MEMORY[0x1E0C99508](url, dataToWrite, propertiesToWrite, errorCode);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x1E0C99518](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x1E0C99538](alloc, uuid);
}

void CFWriteStreamClose(CFWriteStreamRef stream)
{
  MEMORY[0x1E0C99600](stream);
}

CFWriteStreamRef CFWriteStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return (CFWriteStreamRef)MEMORY[0x1E0C99630](alloc, fileURL);
}

Boolean CFWriteStreamOpen(CFWriteStreamRef stream)
{
  return MEMORY[0x1E0C99650](stream);
}

IOReturn IOAllowPowerChange(io_connect_t kernelPort, intptr_t notificationID)
{
  return MEMORY[0x1E0CBAD20](*(_QWORD *)&kernelPort, notificationID);
}

CFTypeRef IOCFUnserialize(const char *buffer, CFAllocatorRef allocator, CFOptionFlags options, CFStringRef *errorString)
{
  return (CFTypeRef)MEMORY[0x1E0CBAD38](buffer, allocator, options, errorString);
}

kern_return_t IOConnectCallAsyncStructMethod(mach_port_t connection, uint32_t selector, mach_port_t wake_port, uint64_t *reference, uint32_t referenceCnt, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x1E0CBAD78](*(_QWORD *)&connection, *(_QWORD *)&selector, *(_QWORD *)&wake_port, reference, *(_QWORD *)&referenceCnt, inputStruct, inputStructCnt, outputStruct);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x1E0CBAD80](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x1E0CBAD88](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, output, outputCnt);
}

kern_return_t IOConnectMapMemory(io_connect_t connect, uint32_t memoryType, task_port_t intoTask, mach_vm_address_t *atAddress, mach_vm_size_t *ofSize, IOOptionBits options)
{
  return MEMORY[0x1E0CBAD98](*(_QWORD *)&connect, *(_QWORD *)&memoryType, *(_QWORD *)&intoTask, atAddress, ofSize, *(_QWORD *)&options);
}

kern_return_t IOConnectSetNotificationPort(io_connect_t connect, uint32_t type, mach_port_t port, uintptr_t reference)
{
  return MEMORY[0x1E0CBADC0](*(_QWORD *)&connect, *(_QWORD *)&type, *(_QWORD *)&port, reference);
}

kern_return_t IOConnectUnmapMemory(io_connect_t connect, uint32_t memoryType, task_port_t fromTask, mach_vm_address_t atAddress)
{
  return MEMORY[0x1E0CBADF0](*(_QWORD *)&connect, *(_QWORD *)&memoryType, *(_QWORD *)&fromTask, atAddress);
}

IOReturn IODeregisterForSystemPower(io_object_t *notifier)
{
  return MEMORY[0x1E0CBAE38](notifier);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x1E0CBB668](*(_QWORD *)&iterator);
}

kern_return_t IOMainPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return MEMORY[0x1E0CBB680](*(_QWORD *)&bootstrapPort, mainPort);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x1E0CBB698](*(_QWORD *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
  MEMORY[0x1E0CBB6A0](notify);
}

mach_port_t IONotificationPortGetMachPort(IONotificationPortRef notify)
{
  return MEMORY[0x1E0CBB6A8](notify);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
  MEMORY[0x1E0CBB6B8](notify, queue);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1E0CBB6F0](*(_QWORD *)&object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return MEMORY[0x1E0CBB6F8](*(_QWORD *)&object);
}

io_connect_t IORegisterForSystemPower(void *refcon, IONotificationPortRef *thePortRef, IOServiceInterestCallback callback, io_object_t *notifier)
{
  return MEMORY[0x1E0CBB8D8](refcon, thePortRef, callback, notifier);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1E0CBB900](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

kern_return_t IORegistryEntryGetChildIterator(io_registry_entry_t entry, const io_name_t plane, io_iterator_t *iterator)
{
  return MEMORY[0x1E0CBB920](*(_QWORD *)&entry, plane, iterator);
}

kern_return_t IORegistryEntryGetName(io_registry_entry_t entry, io_name_t name)
{
  return MEMORY[0x1E0CBB938](*(_QWORD *)&entry, name);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return MEMORY[0x1E0CBB958](*(_QWORD *)&entry, plane, parent);
}

CFMutableDictionaryRef IORegistryEntryIDMatching(uint64_t entryID)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0CBB990](entryID);
}

uint64_t IOReportAddChannelDescription()
{
  return MEMORY[0x1E0DE0278]();
}

uint64_t IOReportCopyChannelsForDriver()
{
  return MEMORY[0x1E0DE02C0]();
}

uint64_t IOReportCreateAggregate()
{
  return MEMORY[0x1E0DE02F0]();
}

uint64_t IOReportCreateSamples()
{
  return MEMORY[0x1E0DE02F8]();
}

uint64_t IOReportCreateSamplesRaw()
{
  return MEMORY[0x1E0DE0308]();
}

uint64_t IOReportCreateSubscription()
{
  return MEMORY[0x1E0DE0310]();
}

uint64_t IOReportGetChannelCount()
{
  return MEMORY[0x1E0DE0318]();
}

uint64_t IOReportMergeChannels()
{
  return MEMORY[0x1E0DE0340]();
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return MEMORY[0x1E0CBB9C8](notifyPort, notificationType, matching, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x1E0CBB9D0](*(_QWORD *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x1E0CBB9E0](*(_QWORD *)&mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x1E0CBB9F0](*(_QWORD *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0CBBA08](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x1E0CBBA10](*(_QWORD *)&service, *(_QWORD *)&owningTask, *(_QWORD *)&type, connect);
}

uint64_t OSAWriteLogForSubmission()
{
  return MEMORY[0x1E0D1BD28]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1E0CD65F0](task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x1E0CD6620](allocator, token);
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x1E0C9A0D0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t operator delete()
{
  return off_1EA31EDB0();
}

uint64_t operator new()
{
  return off_1EA31EDB8();
}

void *__dynamic_cast(const void *lpsrc, const struct __class_type_info *lpstype, const struct __class_type_info *lpdtype, ptrdiff_t s2d)
{
  return (void *)MEMORY[0x1E0DE50E0](lpsrc, lpstype, lpdtype, s2d);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

char *__cdecl asctime(const tm *a1)
{
  return (char *)MEMORY[0x1E0C81590](a1);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x1E0C82698](a1);
}

int creat(const char *a1, mode_t a2)
{
  return MEMORY[0x1E0C82B60](a1, a2);
}

double difftime(time_t a1, time_t a2)
{
  double result;

  MEMORY[0x1E0C82B98](a1, a2);
  return result;
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x1E0C82BC0](object);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x1E0C82E98](object);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

int dprintf(int a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83068](*(_QWORD *)&a1, a2);
}

void exit(int a1)
{
  MEMORY[0x1E0C83278](*(_QWORD *)&a1);
}

int fclose(FILE *a1)
{
  return MEMORY[0x1E0C832F8](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1E0C83460](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C834A0](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fsync(int a1)
{
  return MEMORY[0x1E0C83578](*(_QWORD *)&a1);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1E0C83590](*(_QWORD *)&a1, a2);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1E0C83660](a1);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1E0C83820](a1, a2);
}

int gzclose(gzFile file)
{
  return MEMORY[0x1E0DE9310](file);
}

const char *__cdecl gzerror(gzFile file, int *errnum)
{
  return (const char *)MEMORY[0x1E0DE9338](file, errnum);
}

int gzflush(gzFile file, int flush)
{
  return MEMORY[0x1E0DE9340](file, *(_QWORD *)&flush);
}

gzFile gzopen(const char *a1, const char *a2)
{
  return (gzFile)MEMORY[0x1E0DE9358](a1, a2);
}

int gzwrite(gzFile file, voidpc buf, unsigned int len)
{
  return MEMORY[0x1E0DE9390](file, buf, *(_QWORD *)&len);
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1E0C83BB0](a1, a2);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1E0C83C38](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C83C40](a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1E0C83CB0](msg, *(_QWORD *)&option, *(_QWORD *)&send_size, *(_QWORD *)&rcv_size, *(_QWORD *)&rcv_name, *(_QWORD *)&timeout, *(_QWORD *)&notify);
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return MEMORY[0x1E0C83CE0](*(_QWORD *)&task, *(_QWORD *)&right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1E0C83CF8](*(_QWORD *)&task, *(_QWORD *)&name);
}

kern_return_t mach_port_get_attributes(ipc_space_read_t task, mach_port_name_t name, mach_port_flavor_t flavor, mach_port_info_t port_info_out, mach_msg_type_number_t *port_info_outCnt)
{
  return MEMORY[0x1E0C83D20](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&flavor, port_info_out, port_info_outCnt);
}

kern_return_t mach_port_insert_right(ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return MEMORY[0x1E0C83D48](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&poly, *(_QWORD *)&polyPoly);
}

kern_return_t mach_port_set_attributes(ipc_space_t task, mach_port_name_t name, mach_port_flavor_t flavor, mach_port_info_t port_info, mach_msg_type_number_t port_infoCnt)
{
  return MEMORY[0x1E0C83D78](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&flavor, port_info, *(_QWORD *)&port_infoCnt);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1E0C84160](a1, a2);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1E0C841D8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int msync(void *a1, size_t a2, int a3)
{
  return MEMORY[0x1E0C84210](a1, a2, *(_QWORD *)&a3);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1E0C84220](a1, a2);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x1E0C84488](a1, *(_QWORD *)&a2, *(_QWORD *)&a3, *(_QWORD *)&a4);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x1E0C844C0](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return MEMORY[0x1E0C84D20](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x1E0C84D28](a1, a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return MEMORY[0x1E0C84D30](a1);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x1E0C84D48](a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x1E0C84D50](a1, a2, a3, a4);
}

void pthread_exit(void *a1)
{
  MEMORY[0x1E0C84D88](a1);
}

int pthread_join(pthread_t a1, void **a2)
{
  return MEMORY[0x1E0C84DD8](a1, a2);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E18](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1E0C84E20](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_trylock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E30](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

int pthread_mutexattr_destroy(pthread_mutexattr_t *a1)
{
  return MEMORY[0x1E0C84E40](a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return MEMORY[0x1E0C84E48](a1);
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  return MEMORY[0x1E0C84E60](a1, *(_QWORD *)&a2);
}

int pthread_setname_np(const char *a1)
{
  return MEMORY[0x1E0C84F08](a1);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x1E0C85008](a1);
}

BOOL remove(const std::__fs::filesystem::path *__p, std::error_code *__ec)
{
  return MEMORY[0x1E0C850B8](__p, __ec);
}

int rmdir(const char *a1)
{
  return MEMORY[0x1E0C85138](a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C85518](__s, *(_QWORD *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C85540](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x1E0C85558](a1, a2, a3, a4);
}

size_t strlcat(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1E0C85568](__dst, __source, __size);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1E0C85570](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

char *__cdecl strnstr(const char *__big, const char *__little, size_t __len)
{
  return (char *)MEMORY[0x1E0C855C8](__big, __little, __len);
}

char *__cdecl strtok_r(char *__str, const char *__sep, char **__lasts)
{
  return (char *)MEMORY[0x1E0C85650](__str, __sep, __lasts);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85658](__str, __endptr, *(_QWORD *)&__base);
}

uint64_t strtoll(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85678](__str, __endptr, *(_QWORD *)&__base);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1E0C85798](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C857A0](a1, a2, a3, a4, a5);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1E0C85950](a1);
}

int unlink(const char *a1)
{
  return MEMORY[0x1E0C859B8](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1E0C859E0](*(_QWORD *)&a1);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1E0C85D40](*(_QWORD *)&__fd, __buf, __nbyte);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F68](connection);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FB0](name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x1E0C85FD0]();
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x1E0C86018](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x1E0C86030](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x1E0C86080](connection, handler);
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
  MEMORY[0x1E0C860C8](connection, targetq);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1E0C86228](original);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x1E0C862B0](xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C862E0](xdict, key);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C86390](xdict, key, string);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x1E0C86658](object);
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1E0C86660](object);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
  MEMORY[0x1E0C866E8](stream, targetq, handler);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1E0C86758](xstring);
}

