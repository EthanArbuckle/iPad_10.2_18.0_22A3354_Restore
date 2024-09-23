@implementation NSConcreteTask

- (int64_t)qualityOfService
{
  os_unfair_lock_s *p_lock;
  char qos;
  int64_t v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  qos = self->_qos;
  if (!qos)
    qos = -1;
  v5 = qos;
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (void)setQualityOfService:(int64_t)a3
{
  unint64_t v3;
  os_unfair_lock_s *p_lock;

  v3 = atomic_load(&self->__exitRunningInfo);
  if ((v3 & 0x100000000) == 0)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    if ((unint64_t)(a3 + 1) > 0x22 || ((1 << (a3 + 1)) & 0x404040401) == 0)
      LOBYTE(a3) = -1;
    self->_qos = a3;
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)setSpawnedProcessDisclaimed:(BOOL)a3
{
  atomic_store(a3, (unsigned __int8 *)&self->_isSpawnedProcessDisclaimed);
}

- (BOOL)isSpawnedProcessDisclaimed
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_isSpawnedProcessDisclaimed);
  return v2 & 1;
}

- (id)terminationHandler
{
  os_unfair_lock_s *p_lock;
  id v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_terminationHandler;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)_setTerminationHandler:(id)a3
{
  os_unfair_lock_s *p_lock;
  id terminationHandler;
  unint64_t *p_exitRunningInfo;
  unint64_t v8;
  id v9;
  unint64_t v10;
  qos_class_t v11;
  NSObject *global_queue;
  _QWORD block[7];

  block[6] = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  terminationHandler = self->_terminationHandler;
  if (terminationHandler != a3)
  {

    self->_terminationHandler = (id)objc_msgSend(a3, "copy");
  }
  p_exitRunningInfo = &self->__exitRunningInfo;
  v8 = atomic_load(&self->__exitRunningInfo);
  if ((v8 & 0x300000000) == 0x100000000)
  {
    v9 = self->_terminationHandler;
    if (v9)
    {
      do
        v10 = __ldaxr(p_exitRunningInfo);
      while (__stlxr(v10 | 0x800000000, p_exitRunningInfo));
      v11 = qos_class_main();
      global_queue = dispatch_get_global_queue(v11, 2uLL);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __41__NSConcreteTask__setTerminationHandler___block_invoke;
      block[3] = &unk_1E0F4E060;
      block[4] = self;
      block[5] = v9;
      dispatch_async(global_queue, block);
    }
  }
  os_unfair_lock_unlock(p_lock);
}

uint64_t __41__NSConcreteTask__setTerminationHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (int)terminationStatus
{
  unint64_t v2;
  int v3;
  int v4;
  NSString *v7;

  v2 = atomic_load(&self->__exitRunningInfo);
  if ((v2 & 0x100000000) == 0)
  {
    v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: task not launched"), _NSMethodExceptionProem((objc_class *)self, a2));
    goto LABEL_13;
  }
  if ((v2 & 0x200000000) != 0)
  {
    v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: task still running"), _NSMethodExceptionProem((objc_class *)self, a2));
LABEL_13:
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v7, 0));
  }
  v3 = v2 & 0x7F;
  v4 = BYTE1(v2);
  if (v3)
    v4 = 0;
  if (v3 == 127 || v3 == 0)
    return v4;
  else
    return v3;
}

- (int64_t)_platformExitInformation
{
  unint64_t v2;
  NSString *v4;

  v2 = atomic_load(&self->__exitRunningInfo);
  if ((v2 & 0x100000000) == 0)
  {
    v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: task not launched"), _NSMethodExceptionProem((objc_class *)self, a2));
    goto LABEL_6;
  }
  if ((v2 & 0x200000000) != 0)
  {
    v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: task still running"), _NSMethodExceptionProem((objc_class *)self, a2));
LABEL_6:
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v4, 0));
  }
  return v2;
}

- (int64_t)terminationReason
{
  unint64_t v2;
  int v3;
  int64_t v4;
  NSString *v6;

  v2 = atomic_load(&self->__exitRunningInfo);
  if ((v2 & 0x100000000) == 0)
  {
    v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: task not launched"), _NSMethodExceptionProem((objc_class *)self, a2));
    goto LABEL_10;
  }
  if ((v2 & 0x200000000) != 0)
  {
    v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: task still running"), _NSMethodExceptionProem((objc_class *)self, a2));
LABEL_10:
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v6, 0));
  }
  v3 = v2 & 0x7F;
  v4 = 1;
  if (v3)
    v4 = 2;
  if (v3 == 127)
    return 0;
  else
    return v4;
}

- (BOOL)isRunning
{
  unint64_t v2;

  v2 = atomic_load(&self->__exitRunningInfo);
  return (~v2 & 0x300000000) == 0;
}

- (void)launch
{
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *dictionary;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  dictionary = self->_dictionary;
  os_unfair_lock_unlock(p_lock);
  -[NSConcreteTask launchWithDictionary:error:](self, "launchWithDictionary:error:", dictionary, 0);
}

- (BOOL)launchAndReturnError:(id *)a3
{
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *dictionary;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  dictionary = self->_dictionary;
  os_unfair_lock_unlock(p_lock);
  -[NSMutableDictionary setObject:forKeyedSubscript:](dictionary, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("_NSTaskUseErrorsForRuntimeFailures"));
  return -[NSConcreteTask launchWithDictionary:error:](self, "launchWithDictionary:error:", dictionary, a3);
}

- (BOOL)launchWithDictionary:(id)a3 error:(id *)a4
{
  unint64_t v6;
  NSMutableDictionary *dictionary;
  objc_class *v8;
  void *v9;
  NSError *v10;
  BOOL v11;
  void *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  char **v17;
  size_t v18;
  uint64_t i;
  void *v20;
  char v21;
  const char *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  char ***v31;
  void *v32;
  void *v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  int v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  id v45;
  int v46;
  void *v47;
  int v48;
  uint64_t v49;
  void *v50;
  uint64_t j;
  uint64_t v52;
  int v53;
  uint64_t v54;
  id v55;
  __int16 v56;
  uint64_t v57;
  uint64_t v58;
  qos_class_t qos;
  BOOL v60;
  uint64_t v61;
  int v62;
  uint64_t k;
  int v64;
  id v65;
  NSError *v66;
  uint64_t n;
  int v68;
  uint64_t v69;
  uint64_t m;
  int v71;
  unint64_t *v72;
  unint64_t v73;
  uint64_t v74;
  id v75;
  id v76;
  CFRunLoopRef Current;
  __CFRunLoop *v78;
  const __CFAllocator *v79;
  __CFRunLoopSource *v80;
  __CFArray *Mutable;
  uintptr_t pid;
  qos_class_t v83;
  NSObject *global_queue;
  NSObject *v85;
  uint64_t v86;
  void *v88;
  uint64_t v89;
  const __CFString *v90;
  NSString *v91;
  NSString *v92;
  NSString *v93;
  NSString *v94;
  NSString *v95;
  _BYTE v96[4];
  int v97;
  uint64_t v98;
  _BYTE *v99;
  int v100;
  id v101;
  id v102;
  char **v103;
  char *v104;
  _QWORD *v105;
  uint64_t v106;
  id v107;
  os_unfair_lock_t p_lock;
  unint64_t *p_exitRunningInfo;
  int v110;
  id *v111;
  uint64_t v112;
  _QWORD v113[9];
  _QWORD v114[5];
  CFRunLoopSourceContext v115;
  size_t v116;
  sigset_t v117;
  sigset_t v118;
  posix_spawnattr_t v119;
  posix_spawn_file_actions_t v120;
  uint64_t v121;
  int v122;
  _BYTE v123[128];
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  const __CFString *v128;
  void *v129;
  const __CFString *v130;
  void *v131;
  uint64_t v132;
  int v133;
  cpu_type_t v134[8];
  uint64_t v135;
  uint64_t v136;

  v111 = a4;
  v136 = *MEMORY[0x1E0C80C00];
  v133 = 2;
  v132 = 0x100000000;
  v110 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("_NSTaskUseErrorsForRuntimeFailures")), "BOOLValue");
  p_exitRunningInfo = &self->__exitRunningInfo;
  v6 = atomic_load(&self->__exitRunningInfo);
  if ((v6 & 0x100000000) != 0)
  {
    if (v110)
    {
      v11 = 0;
      if (v111)
        *v111 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 3587, 0);
      return v11;
    }
    v88 = (void *)MEMORY[0x1E0C99DA0];
    v89 = *MEMORY[0x1E0C99778];
    v90 = CFSTR("task already launched");
LABEL_201:
    objc_exception_throw((id)objc_msgSend(v88, "exceptionWithName:reason:userInfo:", v89, v90, 0));
  }
  if (!a3)
  {
    v88 = (void *)MEMORY[0x1E0C99DA0];
    v89 = *MEMORY[0x1E0C99778];
    v90 = CFSTR("need a dictionary");
    goto LABEL_201;
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v112 = 16;
  dictionary = self->_dictionary;
  v8 = (objc_class *)a3;
  v107 = a3;
  if (dictionary != a3)
  {
    v8 = (objc_class *)objc_msgSend(v107, "mutableCopyWithZone:", 0);
    *(Class *)((char *)&self->super.super.isa + v112) = v8;
    if (dictionary)
    {

      v8 = *(Class *)((char *)&self->super.super.isa + v112);
    }
  }
  -[objc_class removeObjectForKey:](v8, "removeObjectForKey:", CFSTR("_NSTaskTerminationStatus"));
  objc_msgSend(*(id *)((char *)&self->super.super.isa + v112), "removeObjectForKey:", CFSTR("_NSTaskHasBeenLaunched"));
  v9 = (void *)objc_msgSend((id)objc_msgSend(*(id *)((char *)&self->super.super.isa + v112), "objectForKey:", CFSTR("_NSTaskExecutablePath")), "stringByStandardizingPath");
  if ((objc_msgSend(v9, "getFileSystemRepresentation:maxLength:", v134, 1024) & 1) == 0
    || access((const char *)v134, 1))
  {
    if (!v110)
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("launch path not accessible"), 0));
    if (v9)
    {
      if (v111)
      {
        v130 = CFSTR("NSFilePath");
        v131 = v9;
        v10 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 4, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v131, &v130, 1));
LABEL_18:
        v11 = 0;
        *v111 = v10;
        goto LABEL_197;
      }
    }
    else if (v111)
    {
      v10 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 4, 0);
      goto LABEL_18;
    }
LABEL_34:
    v11 = 0;
    goto LABEL_197;
  }
  v12 = (void *)objc_msgSend((id)objc_msgSend(*(id *)((char *)&self->super.super.isa + v112), "objectForKey:", CFSTR("_NSTaskDirectoryPath")), "stringByStandardizingPath");
  if (v12
    && !-[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", v12))
  {
    if (!v110)
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("working directory doesn't exist."), 0));
    if (v111)
    {
      v128 = CFSTR("NSFilePath");
      v129 = v12;
      v10 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSCocoaErrorDomain"), 4, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v129, &v128, 1));
      goto LABEL_18;
    }
    goto LABEL_34;
  }
  v13 = (void *)objc_msgSend(*(id *)((char *)&self->super.super.isa + v112), "objectForKey:", CFSTR("_NSTaskArgumentArray"));
  v14 = objc_msgSend(v13, "count");
  if (v14 > 4096)
  {
    v91 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("too many arguments (%ld) -- limit is 4096"), v14);
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v91, 0));
  }
  v104 = (char *)objc_msgSend(v9, "fileSystemRepresentation");
  v99 = v96;
  MEMORY[0x1E0C80A78](v104);
  v17 = (char **)&v96[-((v16 + 31) & 0xFFFFFFFFFFFFFFF0)];
  if (v15 >= 0x200)
    v18 = 512;
  else
    v18 = v15;
  bzero(&v96[-((v16 + 31) & 0xFFFFFFFFFFFFFFF0)], v18);
  *v17 = v104;
  v103 = v17;
  if (v14 < 1)
  {
    v14 = 0;
  }
  else
  {
    for (i = 0; i != v14; ++i)
    {
      v20 = (void *)objc_msgSend(v13, "objectAtIndex:", i);
      v21 = objc_msgSend(v20, "isEqual:", &stru_1E0F56070);
      v22 = "";
      if ((v21 & 1) == 0)
        v22 = (const char *)objc_msgSend(v20, "fileSystemRepresentation");
      v17[i + 1] = (char *)v22;
    }
  }
  v103[v14 + 1] = 0;
  v98 = objc_msgSend(v12, "fileSystemRepresentation");
  v23 = (void *)objc_msgSend(*(id *)((char *)&self->super.super.isa + v112), "objectForKey:", CFSTR("_NSTaskEnvironmentDictionary"));
  v24 = v23;
  if (v23)
  {
    if (objc_msgSend(v23, "count"))
    {
      v25 = objc_msgSend(v24, "count");
      v105 = malloc_type_malloc(8 * v25 + 8, 0x10040436913F5uLL);
      v26 = objc_msgSend(v24, "keyEnumerator");
      if (v25 < 1)
      {
        v30 = 0;
      }
      else
      {
        v27 = (void *)v26;
        v28 = v105;
        v106 = v25;
        do
        {
          v29 = objc_msgSend(v27, "nextObject");
          *v28++ = -[NSString fileSystemRepresentation](+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@=%@"), v29, objc_msgSend(v24, "objectForKey:", v29)), "fileSystemRepresentation");
          --v25;
        }
        while (v25);
        v30 = v106;
      }
      v105[v30] = 0;
      v100 = 1;
    }
    else
    {
      v100 = 0;
      v105 = 0;
    }
  }
  else
  {
    v31 = _NSGetEnviron();
    v100 = 0;
    v105 = *v31;
  }
  v135 = 0;
  memset(v134, 0, sizeof(v134));
  v32 = (void *)objc_msgSend(*(id *)((char *)&self->super.super.isa + v112), "objectForKey:", CFSTR("_NSTaskPreferredArchitectureArray"));
  v33 = v32;
  if (v32
    && (v126 = 0u,
        v127 = 0u,
        v124 = 0u,
        v125 = 0u,
        (v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v124, v123, 16)) != 0))
  {
    v35 = 0;
    v36 = *(_QWORD *)v125;
    while (2)
    {
      v37 = 0;
      v38 = v35;
      v39 = (9 - v35);
      do
      {
        if (*(_QWORD *)v125 != v36)
          objc_enumerationMutation(v33);
        v134[v38 + v37] = objc_msgSend(*(id *)(*((_QWORD *)&v124 + 1) + 8 * v37), "intValue");
        if (v39 == v37)
        {
          v40 = 10;
          goto LABEL_58;
        }
        ++v37;
      }
      while (v34 != v37);
      v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v124, v123, 16);
      v35 = v38 + v37;
      if (v34)
        continue;
      break;
    }
    v40 = v38 + v37;
  }
  else
  {
    v40 = 0;
  }
LABEL_58:
  v41 = (void *)objc_msgSend(*(id *)((char *)&self->super.super.isa + v112), "objectForKey:", CFSTR("_NSTaskInputFileHandle"));
  if (v41)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v42 = (void *)objc_msgSend(v41, "fileHandleForReading");
      v43 = objc_msgSend(v42, "fileDescriptor");
    }
    else
    {
      v43 = objc_msgSend(v41, "fileDescriptor");
      v42 = 0;
    }
    LODWORD(v132) = v43;
  }
  else
  {
    v42 = 0;
    LODWORD(v132) = -1;
  }
  v44 = (void *)objc_msgSend(*(id *)((char *)&self->super.super.isa + v112), "objectForKey:", CFSTR("_NSTaskOutputFileHandle"));
  if (v44)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v45 = (id)objc_msgSend(v44, "fileHandleForWriting");
      v46 = objc_msgSend(v45, "fileDescriptor");
    }
    else
    {
      v46 = objc_msgSend(v44, "fileDescriptor");
      v45 = 0;
    }
  }
  else
  {
    v45 = 0;
    v46 = -1;
  }
  HIDWORD(v132) = v46;
  v47 = (void *)objc_msgSend(*(id *)((char *)&self->super.super.isa + v112), "objectForKey:", CFSTR("_NSTaskDiagnosticFileHandle"));
  if (v47)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v47 = (void *)objc_msgSend(v47, "fileHandleForWriting");
      v48 = objc_msgSend(v47, "fileDescriptor");
    }
    else
    {
      v48 = objc_msgSend(v47, "fileDescriptor");
      v47 = 0;
    }
  }
  else
  {
    v48 = -1;
  }
  v133 = v48;
  v49 = objc_msgSend(*(id *)((char *)&self->super.super.isa + v112), "objectForKey:", CFSTR("_NSTaskLaunchRequirementData"));
  v97 = v40;
  v101 = v42;
  v102 = v47;
  LODWORD(v106) = open("/dev/null", 2, 0);
  v122 = -1;
  v120 = 0;
  v121 = -1;
  posix_spawn_file_actions_init(&v120);
  v50 = (void *)v49;
  for (j = 0; j != 3; ++j)
  {
    v52 = *((unsigned int *)&v132 + j);
    if (j == v52)
    {
      v53 = dup(*((_DWORD *)&v132 + j));
      if (v53 == -1)
      {
        *((_DWORD *)&v132 + j) = -1;
        goto LABEL_82;
      }
      *((_DWORD *)&v121 + j) = v53;
      v54 = posix_spawn_file_actions_adddup2(&v120, v53, j);
      if ((_DWORD)v54)
        goto LABEL_106;
    }
    if ((_DWORD)v52 != -1)
    {
      v54 = posix_spawn_file_actions_adddup2(&v120, v52, j);
      if ((_DWORD)v54)
        goto LABEL_106;
      continue;
    }
LABEL_82:
    v54 = posix_spawn_file_actions_adddup2(&v120, v106, j);
    v52 = 0xFFFFFFFFLL;
    if ((_DWORD)v54)
    {
LABEL_106:
      for (k = 0; k != 12; k += 4)
      {
        v64 = *(_DWORD *)((char *)&v121 + k);
        if (v64 != -1)
          close(v64);
      }
      v65 = v102;
      if (v101)
        objc_msgSend(v101, "closeFile");
      if (v45)
        objc_msgSend(v45, "closeFile");
      if (v65 && v65 != v45)
        objc_msgSend(v65, "closeFile");
      posix_spawn_file_actions_destroy(&v120);
      if ((_DWORD)v106 != -1)
        close(v106);
      if (v100)
        free(v105);
      if (!v110)
      {
        v92 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to set posix_spawn_file_actions for fd %d at index %d with errno %d"), v52, j, v54);
        objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v92, 0));
      }
      if (!v111)
        goto LABEL_196;
      goto LABEL_123;
    }
  }
  v119 = 0;
  posix_spawnattr_init(&v119);
  v55 = v45;
  v118 = 0;
  v117 = -1;
  posix_spawnattr_setsigmask(&v119, &v118);
  posix_spawnattr_setsigdefault(&v119, &v117);
  if (objc_msgSend(*(id *)((char *)&self->super.super.isa + v112), "objectForKey:", CFSTR("_NSTaskNoNewProcessGroup")))
    v56 = 16396;
  else
    v56 = 16398;
  v57 = posix_spawnattr_setflags(&v119, v56);
  v58 = v57;
  qos = self->_qos;
  v60 = qos == QOS_CLASS_BACKGROUND || qos == QOS_CLASS_UTILITY;
  if (v60 && !(_DWORD)v57)
    v58 = posix_spawnattr_set_qos_class_np(&v119, qos);
  if (v97 >= 1 && !(_DWORD)v58)
  {
    v116 = 0;
    v58 = posix_spawnattr_setbinpref_np(&v119, v97, v134, &v116);
  }
  if (v50)
    amfi_launch_constraint_set_spawnattr((uint64_t)&v119, objc_msgSend(v50, "bytes"), objc_msgSend(v50, "length"));
  v61 = 0;
  v62 = -1;
  if (v98 && !(_DWORD)v58)
  {
    v62 = open(".", 0);
    if (__pthread_fchdir() == -1 && v62 != -1)
    {
      close(v62);
      v62 = -1;
    }
    if (__pthread_chdir() == -1)
      v61 = *__error();
    else
      v61 = 0;
  }
  if (!(v61 | v58))
  {
LABEL_150:
    v69 = 11;
    while (1)
    {
      v54 = posix_spawn(&self->_pid, v104, &v120, &v119, v103, (char *const *)v105);
      if ((_DWORD)v54 != 35)
        break;
      if (!--v69)
      {
        __PTHREAD_SPAWN_EAGAIN_OVERLIMIT__();
        v54 = 35;
        break;
      }
      if (nanosleep(&launchWithDictionary_error__spawnSleep, 0))
      {
        v54 = *__error();
        break;
      }
    }
    for (m = 0; m != 12; m += 4)
    {
      v71 = *(_DWORD *)((char *)&v121 + m);
      if (v71 != -1)
        close(v71);
    }
    if (v98)
    {
      __pthread_fchdir();
      if (v62 != -1)
        close(v62);
    }
    if (!(_DWORD)v54)
    {
      v72 = p_exitRunningInfo;
      do
        v73 = __ldaxr(v72);
      while (__stlxr(v73 | 0x300000000, v72));
      v74 = v112;
      v75 = *(Class *)((char *)&self->super.super.isa + v112);
      v76 = v107;
      if (v75 == v107)
      {
        *(Class *)((char *)&self->super.super.isa + v74) = (Class)objc_msgSend(v107, "mutableCopyWithZone:", 0);

        v75 = *(Class *)((char *)&self->super.super.isa + v74);
      }
      objc_msgSend(v75, "setObject:forKey:", CFSTR("YES"), CFSTR("_NSTaskHasBeenLaunched"));
      if (v101)
        objc_msgSend(v101, "closeFile");
      if (v55)
        objc_msgSend(v55, "closeFile");
      if (v102 && v102 != v55)
        objc_msgSend(v102, "closeFile");
      Current = CFRunLoopGetCurrent();
      v78 = (__CFRunLoop *)CFRetain(Current);
      memset(&v115.retain, 0, 64);
      v115.version = 0;
      v115.info = self;
      v79 = (const __CFAllocator *)*MEMORY[0x1E0C9AE30];
      v80 = CFRunLoopSourceCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE30], 0, &v115);
      CFRunLoopAddSource(v78, v80, (CFRunLoopMode)*MEMORY[0x1E0C9B280]);
      Mutable = (__CFArray *)_CFGetTSD();
      if (!Mutable)
      {
        Mutable = CFArrayCreateMutable(v79, 1, 0);
        _CFSetTSD();
      }
      CFArrayAppendValue(Mutable, self);
      pid = self->_pid;
      v83 = qos_class_main();
      global_queue = dispatch_get_global_queue(v83, 2uLL);
      v85 = dispatch_source_create(MEMORY[0x1E0C80DB0], pid, 0x80000000uLL, global_queue);
      v86 = MEMORY[0x1E0C809B0];
      v114[0] = MEMORY[0x1E0C809B0];
      v114[1] = 3221225472;
      v114[2] = __45__NSConcreteTask_launchWithDictionary_error___block_invoke;
      v114[3] = &unk_1E0F4D2D8;
      v114[4] = v85;
      dispatch_source_set_cancel_handler(v85, v114);
      v113[0] = v86;
      v113[1] = 3221225472;
      v113[2] = __45__NSConcreteTask_launchWithDictionary_error___block_invoke_2;
      v113[3] = &unk_1E0F50FE0;
      v113[4] = self;
      v113[5] = self;
      v113[6] = v85;
      v113[7] = v78;
      v113[8] = v80;
      dispatch_source_set_event_handler(v85, v113);
      self->_dsrc = (OS_dispatch_source *)v85;
      dispatch_resume(v85);
      posix_spawnattr_destroy(&v119);
      posix_spawn_file_actions_destroy(&v120);
      close(v106);
      if (v100)
        free(v105);
      v11 = 1;
      goto LABEL_197;
    }
    if (v101)
      objc_msgSend(v101, "closeFile");
    if (v55)
      objc_msgSend(v55, "closeFile");
    if (v102 && v102 != v55)
      objc_msgSend(v102, "closeFile");
    posix_spawnattr_destroy(&v119);
    posix_spawn_file_actions_destroy(&v120);
    if ((_DWORD)v106 != -1)
      close(v106);
    if (v100)
      free(v105);
    if (!v110)
    {
      if ((_DWORD)v54 != 86
        || -[NSString rangeOfString:](-[NSBundle bundleIdentifier](+[NSBundle mainBundle](NSBundle, "mainBundle"), "bundleIdentifier"), "rangeOfString:", CFSTR("com.mackiev.")) != 0x7FFFFFFFFFFFFFFFLL)
      {
        v93 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Couldn't posix_spawn: error %d"), v54);
        objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v93, 0));
      }
      goto LABEL_196;
    }
    if (!v111)
      goto LABEL_196;
LABEL_123:
    v66 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSPOSIXErrorDomain"), (int)v54, 0);
LABEL_124:
    v11 = 0;
    *v111 = v66;
    goto LABEL_197;
  }
  for (n = 0; n != 12; n += 4)
  {
    v68 = *(_DWORD *)((char *)&v121 + n);
    if (v68 != -1)
      close(v68);
  }
  if (v101)
    objc_msgSend(v101, "closeFile");
  if (v55)
    objc_msgSend(v55, "closeFile");
  if (v102 && v102 != v55)
    objc_msgSend(v102, "closeFile");
  posix_spawnattr_destroy(&v119);
  posix_spawn_file_actions_destroy(&v120);
  if ((_DWORD)v106 != -1)
    close(v106);
  if (v100)
    free(v105);
  if (!(_DWORD)v58)
  {
    if ((_DWORD)v61)
    {
      if (!v110)
      {
        v95 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to set working directory to %s with error %d"), v98, v61);
        objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v95, 0));
      }
      if (v111)
      {
        v66 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSPOSIXErrorDomain"), (int)v61, 0);
        goto LABEL_124;
      }
      goto LABEL_196;
    }
    goto LABEL_150;
  }
  if (!v110)
  {
    v94 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to setup posix spawn attributes with error %d"), v58);
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v94, 0));
  }
  if (v111)
  {
    v66 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("NSPOSIXErrorDomain"), (int)v58, 0);
    goto LABEL_124;
  }
LABEL_196:
  v11 = 0;
LABEL_197:
  os_unfair_lock_unlock(p_lock);
  return v11;
}

void __45__NSConcreteTask_launchWithDictionary_error___block_invoke(uint64_t a1)
{
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
}

void __45__NSConcreteTask_launchWithDictionary_error___block_invoke_2(uint64_t a1)
{
  os_unfair_lock_s *v2;
  pid_t v3;
  int v4;
  unint64_t *v5;
  unint64_t v6;
  unint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  qos_class_t v13;
  NSObject *global_queue;
  __CFRunLoop *v15;
  const void *v16;
  _QWORD v17[5];
  _QWORD block[6];
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 8);
  os_unfair_lock_lock(v2);
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32) = 0;
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 48));
  v19 = 0;
  do
    v3 = waitpid(*(_DWORD *)(*(_QWORD *)(a1 + 40) + 48), &v19, 0);
  while (v3 < 0 && *__error() == 4);
  v4 = v19;
  if (v3 < 0)
    v4 = -1;
  v5 = (unint64_t *)(*(_QWORD *)(a1 + 40) + 56);
  do
    v6 = __ldaxr(v5);
  while (__stlxr(v6 | v4, v5));
  v7 = (unint64_t *)(*(_QWORD *)(a1 + 40) + 56);
  do
    v8 = __ldaxr(v7);
  while (__stlxr(v8 & 0xFFFFFFFDFFFFFFFFLL, v7));
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(_QWORD *)(v9 + 24);
  if (v10)
  {
    v11 = (unint64_t *)(v9 + 56);
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 | 0x800000000, v11));
    v13 = qos_class_main();
    global_queue = dispatch_get_global_queue(v13, 2uLL);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__NSConcreteTask_launchWithDictionary_error___block_invoke_3;
    block[3] = &unk_1E0F4E060;
    block[4] = *(_QWORD *)(a1 + 40);
    block[5] = v10;
    dispatch_async(global_queue, block);
  }
  else
  {
    v15 = *(__CFRunLoop **)(a1 + 56);
    v16 = (const void *)*MEMORY[0x1E0C9B270];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __45__NSConcreteTask_launchWithDictionary_error___block_invoke_4;
    v17[3] = &unk_1E0F4D2D8;
    v17[4] = v9;
    CFRunLoopPerformBlock(v15, v16, v17);
  }
  CFRunLoopRemoveSource(*(CFRunLoopRef *)(a1 + 56), *(CFRunLoopSourceRef *)(a1 + 64), (CFRunLoopMode)*MEMORY[0x1E0C9B280]);
  CFRunLoopWakeUp(*(CFRunLoopRef *)(a1 + 56));
  CFRelease(*(CFTypeRef *)(a1 + 56));
  CFRelease(*(CFTypeRef *)(a1 + 64));
  os_unfair_lock_unlock(v2);
}

uint64_t __45__NSConcreteTask_launchWithDictionary_error___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "_setTerminationHandler:", 0);
}

uint64_t __45__NSConcreteTask_launchWithDictionary_error___block_invoke_4(uint64_t result)
{
  unint64_t v1;
  unint64_t *v2;
  unint64_t v3;

  v1 = atomic_load((unint64_t *)(*(_QWORD *)(result + 32) + 56));
  if ((v1 & 0xC00000000) == 0)
  {
    v2 = (unint64_t *)(*(_QWORD *)(result + 32) + 56);
    do
      v3 = __ldaxr(v2);
    while (__stlxr(v3 | 0x400000000, v2));
    return -[NSNotificationCenter postNotificationName:object:userInfo:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("NSTaskDidTerminateNotification"), *(_QWORD *)(result + 32), 0);
  }
  return result;
}

- (void)waitUntilExit
{
  const __CFArray *v3;
  const __CFArray *v4;
  BOOL v5;
  __CFRunLoop *Current;
  __CFRunLoopSource *v7;
  const __CFString *v8;
  unint64_t v9;
  _QWORD v10[2];
  BOOL (*v11)(uint64_t);
  void *v12;
  NSConcreteTask *v13;
  BOOL v14;
  CFRunLoopSourceContext context;
  uint64_t v16;
  CFRange v17;

  v16 = *MEMORY[0x1E0C80C00];
  _CFAutoreleasePoolPush();
  v3 = (const __CFArray *)_CFGetTSD();
  if (v3)
  {
    v4 = v3;
    v17.length = CFArrayGetCount(v3);
    v17.location = 0;
    v5 = CFArrayContainsValue(v4, v17, self) != 0;
  }
  else
  {
    v5 = 0;
  }
  memset(&context.retain, 0, 64);
  context.version = 0;
  context.info = self;
  Current = CFRunLoopGetCurrent();
  v7 = CFRunLoopSourceCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE30], 0, &context);
  v8 = (const __CFString *)*MEMORY[0x1E0C9B280];
  CFRunLoopAddSource(Current, v7, (CFRunLoopMode)*MEMORY[0x1E0C9B280]);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v11 = __31__NSConcreteTask_waitUntilExit__block_invoke;
  v12 = &unk_1E0F51008;
  v13 = self;
  v14 = v5;
  v9 = atomic_load(&self->__exitRunningInfo);
  if ((v9 & 0x200000000) != 0 || (v9 & 0x400000000) == 0 && (v9 & 0x800000000) == 0 && v14)
  {
    do
      CFRunLoopRunInMode(v8, 0.0625, 1u);
    while ((((uint64_t (*)(_QWORD *))v11)(v10) & 1) != 0);
  }
  CFRunLoopRemoveSource(Current, v7, v8);
  CFRelease(v7);
  _CFAutoreleasePoolPop();
}

BOOL __31__NSConcreteTask_waitUntilExit__block_invoke(uint64_t a1)
{
  unint64_t v1;

  v1 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 32) + 56));
  if ((v1 & 0x200000000) != 0)
    return 1;
  if ((v1 & 0x400000000) != 0)
    return 0;
  return (v1 & 0x800000000) == 0 && *(_BYTE *)(a1 + 40) != 0;
}

- (void)_withTaskDictionary:(id)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_dictionary)
    self->_dictionary = (NSMutableDictionary *)+[NSTask currentTaskDictionary](NSTask, "currentTaskDictionary");
  (*((void (**)(id))a3 + 2))(a3);
  os_unfair_lock_unlock(p_lock);
}

- (void)setArguments:(id)a3
{
  COPY_SETTER_IMPL((uint64_t)self, a3, (uint64_t)CFSTR("_NSTaskArgumentArray"), (uint64_t)CFSTR("must provide array of arguments"));
}

- (void)setPreferredArchitectures:(id)a3
{
  COPY_SETTER_IMPL((uint64_t)self, a3, (uint64_t)CFSTR("_NSTaskPreferredArchitectureArray"), (uint64_t)CFSTR("must provide array of arguments"));
}

- (void)setLaunchRequirementData:(id)a3
{
  COPY_SETTER_IMPL((uint64_t)self, a3, (uint64_t)CFSTR("_NSTaskLaunchRequirementData"), (uint64_t)CFSTR("must provide a data argument"));
}

- (void)setCurrentDirectoryPath:(id)a3
{
  COPY_SETTER_IMPL((uint64_t)self, a3, (uint64_t)CFSTR("_NSTaskDirectoryPath"), (uint64_t)CFSTR("must provide a directory path"));
}

- (void)setEnvironment:(id)a3
{
  id v3;

  v3 = a3;
  if (!a3)
    v3 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
  COPY_SETTER_IMPL((uint64_t)self, v3, (uint64_t)CFSTR("_NSTaskEnvironmentDictionary"), 0);
}

- (void)setLaunchPath:(id)a3
{
  COPY_SETTER_IMPL((uint64_t)self, a3, (uint64_t)CFSTR("_NSTaskExecutablePath"), (uint64_t)CFSTR("must provide a launch path"));
}

- (id)launchPath
{
  return COPY_GETTER_IMPL((uint64_t)self, (uint64_t)CFSTR("_NSTaskExecutablePath"));
}

- (id)environment
{
  return COPY_GETTER_IMPL((uint64_t)self, (uint64_t)CFSTR("_NSTaskEnvironmentDictionary"));
}

- (id)arguments
{
  return COPY_GETTER_IMPL((uint64_t)self, (uint64_t)CFSTR("_NSTaskArgumentArray"));
}

- (id)preferredArchitectures
{
  return COPY_GETTER_IMPL((uint64_t)self, (uint64_t)CFSTR("_NSTaskPreferredArchitectureArray"));
}

- (id)launchRequirementData
{
  return COPY_GETTER_IMPL((uint64_t)self, (uint64_t)CFSTR("_NSTaskLaunchRequirementData"));
}

- (id)currentDirectoryPath
{
  return COPY_GETTER_IMPL((uint64_t)self, (uint64_t)CFSTR("_NSTaskDirectoryPath"));
}

- (id)standardInput
{
  return GETTER_IMPL((uint64_t)self, (uint64_t)CFSTR("_NSTaskInputFileHandle"));
}

- (id)standardOutput
{
  return GETTER_IMPL((uint64_t)self, (uint64_t)CFSTR("_NSTaskOutputFileHandle"));
}

- (id)standardError
{
  return GETTER_IMPL((uint64_t)self, (uint64_t)CFSTR("_NSTaskDiagnosticFileHandle"));
}

- (void)setStandardInput:(id)a3
{
  if (!a3
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    NOCOPY_SETTER_IMPL((uint64_t)self, (uint64_t)a3, (uint64_t)CFSTR("_NSTaskInputFileHandle"));
  }
  else
  {
    qword_1EDC47C18 = (uint64_t)"Standard input can only be an NSFileHandle or NSPipe";
    __break(1u);
  }
}

- (void)setStandardOutput:(id)a3
{
  if (!a3
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    NOCOPY_SETTER_IMPL((uint64_t)self, (uint64_t)a3, (uint64_t)CFSTR("_NSTaskOutputFileHandle"));
  }
  else
  {
    qword_1EDC47C18 = (uint64_t)"Standard output can only be an NSFileHandle or NSPipe";
    __break(1u);
  }
}

- (void)setStandardError:(id)a3
{
  if (!a3
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    NOCOPY_SETTER_IMPL((uint64_t)self, (uint64_t)a3, (uint64_t)CFSTR("_NSTaskDiagnosticFileHandle"));
  }
  else
  {
    qword_1EDC47C18 = (uint64_t)"Standard error can only be an NSFileHandle or NSPipe";
    __break(1u);
  }
}

- (void)setTaskDictionary:(id)a3
{
  unint64_t v3;
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *dictionary;

  v3 = atomic_load(&self->__exitRunningInfo);
  if ((v3 & 0x100000000) != 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("task already launched"), 0));
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  dictionary = self->_dictionary;
  self->_dictionary = (NSMutableDictionary *)objc_msgSend(a3, "mutableCopyWithZone:", 0);
  if (dictionary)

  os_unfair_lock_unlock(p_lock);
}

- (id)taskDictionary
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = 0;
  v6 = &v5;
  v7 = 0x3052000000;
  v8 = __Block_byref_object_copy__15;
  v9 = __Block_byref_object_dispose__15;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __32__NSConcreteTask_taskDictionary__block_invoke;
  v4[3] = &unk_1E0F51030;
  v4[4] = self;
  v4[5] = &v5;
  -[NSConcreteTask _withTaskDictionary:](self, "_withTaskDictionary:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);
  return v2;
}

id __32__NSConcreteTask_taskDictionary__block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3;
  id result;

  v3 = atomic_load((unint64_t *)(*(_QWORD *)(a1 + 32) + 56));
  if ((v3 & 0x100000000) != 0)
    result = (id)objc_msgSend(a2, "mutableCopyWithZone:", 0);
  else
    result = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (BOOL)suspend
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  os_unfair_lock_unlock(p_lock);
  return 0;
}

- (BOOL)resume
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  os_unfair_lock_unlock(p_lock);
  return 0;
}

- (int64_t)suspendCount
{
  os_unfair_lock_s *p_lock;
  int64_t suspendCount;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  suspendCount = self->_suspendCount;
  os_unfair_lock_unlock(p_lock);
  return suspendCount;
}

- (NSConcreteTask)init
{
  NSConcreteTask *result;
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)NSConcreteTask;
  result = -[NSTask init](&v3, sel_init);
  if (result)
  {
    result->_lock._os_unfair_lock_opaque = 0;
    atomic_store(0, (unsigned __int8 *)&result->_isSpawnedProcessDisclaimed);
  }
  return result;
}

- (void)dealloc
{
  id v3;
  id v4;
  id v5;
  NSObject *dsrc;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = -[NSConcreteTask standardInput](self, "standardInput");
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v3, "_closeOnDealloc");
  v4 = -[NSConcreteTask standardOutput](self, "standardOutput");
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v4, "_closeOnDealloc");
  v5 = -[NSConcreteTask standardError](self, "standardError");
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "_closeOnDealloc");

  dsrc = self->_dsrc;
  if (dsrc)
  {
    dispatch_source_cancel(dsrc);
    self->_dsrc = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)NSConcreteTask;
  -[NSConcreteTask dealloc](&v7, sel_dealloc);
}

- (int)processIdentifier
{
  NSConcreteTask *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LODWORD(v2) = v2->_pid;
  os_unfair_lock_unlock(p_lock);
  return (int)v2;
}

- (void)setStartsNewProcessGroup:(BOOL)a3
{
  _QWORD v3[4];
  BOOL v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __43__NSConcreteTask_setStartsNewProcessGroup___block_invoke;
  v3[3] = &__block_descriptor_33_e29_v16__0__NSMutableDictionary_8l;
  v4 = a3;
  -[NSConcreteTask _withTaskDictionary:](self, "_withTaskDictionary:", v3);
}

uint64_t __43__NSConcreteTask_setStartsNewProcessGroup___block_invoke(uint64_t a1, void *a2)
{
  if (*(_BYTE *)(a1 + 32))
    return objc_msgSend(a2, "removeObjectForKey:", CFSTR("_NSTaskNoNewProcessGroup"));
  else
    return objc_msgSend(a2, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1), CFSTR("_NSTaskNoNewProcessGroup"));
}

@end
