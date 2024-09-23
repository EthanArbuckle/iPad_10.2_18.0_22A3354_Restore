@implementation COConditionTask

- (COConditionTask)initWithCommand:(id)a3 arguments:(id)a4
{
  id v7;
  id v8;
  COConditionTask *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  NSString *stdoutFname;
  id v16;
  void *v17;
  uint64_t v18;
  NSString *stderrFname;
  id v20;
  void *v21;
  uint64_t v22;
  NSString *stdinFname;
  uint64_t v24;
  uint64_t v25;
  NSFileHandle *stdinFileHandle;
  uint64_t v27;
  uint64_t v28;
  NSFileHandle *stdoutFileHandle;
  uint64_t v30;
  uint64_t v31;
  NSFileHandle *stderrFileHandle;
  dispatch_semaphore_t v33;
  OS_dispatch_semaphore *termination_sem;
  dispatch_queue_t v35;
  OS_dispatch_queue *taskQueue;
  uint64_t v37;
  NSMutableArray *taskFileHandleArray;
  COConditionTask *v39;
  objc_super v41;

  v7 = a3;
  v8 = a4;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    -[COConditionTask initWithCommand:arguments:].cold.1((uint64_t)v7, v8);
  v41.receiver = self;
  v41.super_class = (Class)COConditionTask;
  v9 = -[COConditionTask init](&v41, sel_init);
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_alloc(MEMORY[0x24BDD17C8]);
    objc_msgSend(v7, "lastPathComponent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "initWithFormat:", CFSTR("/tmp/%@.%@.stdout.txt"), v13, v11);
    stdoutFname = v9->_stdoutFname;
    v9->_stdoutFname = (NSString *)v14;

    v16 = objc_alloc(MEMORY[0x24BDD17C8]);
    objc_msgSend(v7, "lastPathComponent");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "initWithFormat:", CFSTR("/tmp/%@.%@.stderr.txt"), v17, v11);
    stderrFname = v9->_stderrFname;
    v9->_stderrFname = (NSString *)v18;

    v20 = objc_alloc(MEMORY[0x24BDD17C8]);
    objc_msgSend(v7, "lastPathComponent");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "initWithFormat:", CFSTR("/tmp/%@.%@.stdin.txt"), v21, v11);
    stdinFname = v9->_stdinFname;
    v9->_stdinFname = (NSString *)v22;

    v24 = open(-[NSString fileSystemRepresentation](v9->_stdinFname, "fileSystemRepresentation"), 514, 438);
    if ((_DWORD)v24 != -1)
    {
      v25 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1578]), "initWithFileDescriptor:", v24);
      stdinFileHandle = v9->_stdinFileHandle;
      v9->_stdinFileHandle = (NSFileHandle *)v25;

    }
    v27 = open(-[NSString fileSystemRepresentation](v9->_stdoutFname, "fileSystemRepresentation"), 514, 438);
    if ((_DWORD)v27 != -1)
    {
      v28 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1578]), "initWithFileDescriptor:", v27);
      stdoutFileHandle = v9->_stdoutFileHandle;
      v9->_stdoutFileHandle = (NSFileHandle *)v28;

    }
    v30 = open(-[NSString fileSystemRepresentation](v9->_stderrFname, "fileSystemRepresentation"), 514, 438);
    if ((_DWORD)v30 != -1)
    {
      v31 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1578]), "initWithFileDescriptor:", v30);
      stderrFileHandle = v9->_stderrFileHandle;
      v9->_stderrFileHandle = (NSFileHandle *)v31;

    }
    if (!v9->_stdinFileHandle || !v9->_stdoutFileHandle || !v8 || !v7 || !v9->_stderrFileHandle)
    {

      v39 = 0;
      goto LABEL_18;
    }
    v9->_processIdentifier = -1;
    objc_storeStrong((id *)&v9->_launchPath, a3);
    objc_storeStrong((id *)&v9->_arguments, a4);
    v33 = dispatch_semaphore_create(0);
    termination_sem = v9->_termination_sem;
    v9->_termination_sem = (OS_dispatch_semaphore *)v33;

    v35 = dispatch_queue_create("com.apple.ConditionInducer.common", 0);
    taskQueue = v9->_taskQueue;
    v9->_taskQueue = (OS_dispatch_queue *)v35;

    v37 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v9->_stdinFileHandle, v9->_stdoutFileHandle, v9->_stderrFileHandle, 0);
    taskFileHandleArray = v9->_taskFileHandleArray;
    v9->_taskFileHandleArray = (NSMutableArray *)v37;

  }
  v39 = v9;
LABEL_18:

  return v39;
}

- (void)waitForExitInformation:(int)a3
{
  unsigned int v5;
  void *v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  _BOOL4 v10;
  rusage v11;
  int v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0;
  memset(&v11, 0, sizeof(v11));
  while (wait4(a3, &v12, 4, &v11) == -1 && *__error() == 4)
    ;
  v5 = v12;
  if ((v12 & 0x7F) == 0x7F)
  {
    v10 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO);
    if (v5 >> 8 == 19)
    {
      if (v10)
      {
        -[COConditionTask launchPath](self, "launchPath", *(_OWORD *)&v11.ru_utime, *(_OWORD *)&v11.ru_stime, *(_OWORD *)&v11.ru_maxrss, *(_OWORD *)&v11.ru_idrss, *(_OWORD *)&v11.ru_minflt, *(_OWORD *)&v11.ru_nswap, *(_OWORD *)&v11.ru_oublock, *(_OWORD *)&v11.ru_msgrcv, *(_OWORD *)&v11.ru_nvcsw);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "lastPathComponent");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v14 = v7;
        v15 = 1024;
        v16 = v12;
        v8 = MEMORY[0x24BDACB70];
        v9 = "Unknown state of child process '%@' with wstatus %04x";
        goto LABEL_15;
      }
    }
    else if (v10)
    {
      -[COConditionTask launchPath](self, "launchPath", *(_OWORD *)&v11.ru_utime, *(_OWORD *)&v11.ru_stime, *(_OWORD *)&v11.ru_maxrss, *(_OWORD *)&v11.ru_idrss, *(_OWORD *)&v11.ru_minflt, *(_OWORD *)&v11.ru_nswap, *(_OWORD *)&v11.ru_oublock, *(_OWORD *)&v11.ru_msgrcv, *(_OWORD *)&v11.ru_nvcsw);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v14 = v7;
      v15 = 1024;
      v16 = v12 >> 8;
      v8 = MEMORY[0x24BDACB70];
      v9 = "Child process '%@' stopped (but did not terminate) due to signal %d";
      goto LABEL_15;
    }
  }
  else if ((v12 & 0x7F) != 0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      -[COConditionTask launchPath](self, "launchPath", *(_OWORD *)&v11.ru_utime, *(_OWORD *)&v11.ru_stime, *(_OWORD *)&v11.ru_maxrss, *(_OWORD *)&v11.ru_idrss, *(_OWORD *)&v11.ru_minflt, *(_OWORD *)&v11.ru_nswap, *(_OWORD *)&v11.ru_oublock, *(_OWORD *)&v11.ru_msgrcv, *(_OWORD *)&v11.ru_nvcsw);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v14 = v7;
      v15 = 1024;
      v16 = v12 & 0x7F;
      v8 = MEMORY[0x24BDACB70];
      v9 = "Child process '%@' terminated due to signal %d";
      goto LABEL_15;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    -[COConditionTask launchPath](self, "launchPath", *(_OWORD *)&v11.ru_utime, *(_OWORD *)&v11.ru_stime, *(_OWORD *)&v11.ru_maxrss, *(_OWORD *)&v11.ru_idrss, *(_OWORD *)&v11.ru_minflt, *(_OWORD *)&v11.ru_nswap, *(_OWORD *)&v11.ru_oublock, *(_OWORD *)&v11.ru_msgrcv, *(_OWORD *)&v11.ru_nvcsw);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastPathComponent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v14 = v7;
    v15 = 1024;
    v16 = BYTE1(v12);
    v8 = MEMORY[0x24BDACB70];
    v9 = "Child process '%@' exited with status %d";
LABEL_15:
    _os_log_impl(&dword_21F8CF000, v8, OS_LOG_TYPE_INFO, v9, buf, 0x12u);

  }
  -[COConditionTask setRunning:](self, "setRunning:", 0, *(_OWORD *)&v11.ru_utime, *(_OWORD *)&v11.ru_stime, *(_OWORD *)&v11.ru_maxrss, *(_OWORD *)&v11.ru_idrss, *(_OWORD *)&v11.ru_minflt, *(_OWORD *)&v11.ru_nswap, *(_OWORD *)&v11.ru_oublock, *(_OWORD *)&v11.ru_msgrcv, *(_OWORD *)&v11.ru_nvcsw);
  -[COConditionTask setEndStatus:](self, "setEndStatus:", BYTE1(v12));
}

- (BOOL)waitForTaskWithTimeout:(unsigned int)a3
{
  dispatch_time_t v5;
  NSObject *v6;
  intptr_t v7;
  _BOOL4 v8;

  if (-[COConditionTask running](self, "running")
    && (!a3 ? (v5 = -1) : (v5 = dispatch_time(0, 1000000000 * a3)),
        -[COConditionTask termination_sem](self, "termination_sem"),
        v6 = objc_claimAutoreleasedReturnValue(),
        v7 = dispatch_semaphore_wait(v6, v5),
        v6,
        v7))
  {
    v8 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v8)
    {
      -[COConditionTask waitForTaskWithTimeout:].cold.1(self);
      LOBYTE(v8) = 0;
    }
  }
  else
  {
    LOBYTE(v8) = 1;
  }
  return v8;
}

- (BOOL)launchTask:(id *)a3
{
  NSObject *v4;
  NSObject *v5;
  char **v6;
  BOOL v7;
  void *v8;
  void *v9;
  char **v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  int v19;
  _QWORD *v20;
  void *v21;
  const char *v22;
  void *v23;
  void *v24;
  int v25;
  _BOOL8 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _BOOL8 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v47;
  const char *v48;
  char ***v49;
  int v50;
  _BOOL8 v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  pid_t v62;
  NSObject *v63;
  dispatch_source_t v64;
  uint64_t v65;
  char *const *v66;
  _QWORD v67[5];
  pid_t v68;
  _QWORD handler[4];
  NSObject *v70;
  COConditionTask *v71;
  pid_t v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  posix_spawnattr_t v77;
  posix_spawn_file_actions_t v78;
  pid_t v79;
  uint8_t buf[4];
  void *v81;
  __int16 v82;
  void *v83;
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x24BDAC8D0];
  v79 = -1;
  v77 = 0;
  v78 = 0;
  -[COConditionTask taskQueue](self, "taskQueue", a3);
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  if (-[COConditionTask running](self, "running"))
  {
    v5 = 0;
    v6 = 0;
LABEL_3:
    v7 = 1;
    goto LABEL_36;
  }
  -[COConditionTask launchPath](self, "launchPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v26 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v26)
      -[COConditionTask launchTask:].cold.1(v26, v27, v28, v29, v30, v31, v32, v33);
    goto LABEL_24;
  }
  -[COConditionTask arguments](self, "arguments");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (char **)malloc_type_calloc(objc_msgSend(v9, "count") + 2, 8uLL, 0x10040436913F5uLL);

  if (!v10)
  {
    v34 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v34)
      -[COConditionTask launchTask:].cold.2(v34, v35, v36, v37, v38, v39, v40, v41);
LABEL_24:
    v5 = 0;
    v6 = 0;
LABEL_35:
    v7 = 0;
    goto LABEL_36;
  }
  -[COConditionTask launchPath](self, "launchPath");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v66 = v10;
  *v10 = (char *)objc_msgSend(v11, "fileSystemRepresentation");

  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  -[COConditionTask arguments](self, "arguments");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v73, v84, 16);
  if (v13)
  {
    v14 = v13;
    v15 = 0;
    v16 = *(_QWORD *)v74;
    v17 = v10 + 1;
    do
    {
      v18 = 0;
      v19 = v15;
      v20 = &v17[v15];
      do
      {
        if (*(_QWORD *)v74 != v16)
          objc_enumerationMutation(v12);
        v21 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * v18);
        if (objc_msgSend(v21, "length", v66))
          v22 = (const char *)objc_msgSend(objc_retainAutorelease(v21), "fileSystemRepresentation");
        else
          v22 = "";
        v20[v18++] = v22;
      }
      while (v14 != v18);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v73, v84, 16);
      v15 = v19 + v18;
    }
    while (v14);
  }

  posix_spawn_file_actions_init(&v78);
  if (v78)
  {
    -[COConditionTask taskFileHandleArray](self, "taskFileHandleArray");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = posix_spawn_file_actions_adddup2(&v78, objc_msgSend(v24, "fileDescriptor"), 0);

    if (v25)
    {
      v6 = (char **)v66;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
LABEL_33:
        -[COConditionTask launchTask:].cold.7(v25);
    }
    else
    {
      -[COConditionTask taskFileHandleArray](self, "taskFileHandleArray");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "objectAtIndexedSubscript:", 1);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = posix_spawn_file_actions_adddup2(&v78, objc_msgSend(v43, "fileDescriptor"), 1);

      if (v25)
      {
        v6 = (char **)v66;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          goto LABEL_33;
      }
      else
      {
        -[COConditionTask taskFileHandleArray](self, "taskFileHandleArray");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "objectAtIndexedSubscript:", 2);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = posix_spawn_file_actions_adddup2(&v78, objc_msgSend(v45, "fileDescriptor"), 2);

        v6 = (char **)v66;
        if (!v25)
        {
          v77 = copyPOSIXSpawnAttributes();
          if (v77)
          {
            signal(20, 0);
            -[COConditionTask launchPath](self, "launchPath");
            v47 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v48 = (const char *)objc_msgSend(v47, "fileSystemRepresentation");
            v49 = _NSGetEnviron();
            v50 = posix_spawn(&v79, v48, &v78, &v77, v66, *v49);

            if (v50)
            {
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                -[COConditionTask launchTask:].cold.6(v50);
            }
            else
            {
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
              {
                -[COConditionTask launchPath](self, "launchPath");
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                -[COConditionTask arguments](self, "arguments");
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v60, "componentsJoinedByString:", CFSTR(" "));
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v81 = v59;
                v82 = 2112;
                v83 = v61;
                _os_log_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Spawned %@ with arguments: %@.", buf, 0x16u);

              }
              v62 = v79;
              -[COConditionTask setProcessIdentifier:](self, "setProcessIdentifier:", v79, v66);
              -[COConditionTask setRunning:](self, "setRunning:", 1);
              dispatch_get_global_queue(0, 0);
              v63 = objc_claimAutoreleasedReturnValue();
              v64 = dispatch_source_create(MEMORY[0x24BDAC9F8], v62, 0x80000000uLL, v63);

              if (v64)
              {
                v65 = MEMORY[0x24BDAC760];
                handler[0] = MEMORY[0x24BDAC760];
                handler[1] = 3221225472;
                handler[2] = __30__COConditionTask_launchTask___block_invoke;
                handler[3] = &unk_24E471250;
                v5 = v64;
                v70 = v5;
                v71 = self;
                v72 = v62;
                dispatch_source_set_event_handler(v5, handler);
                v67[0] = v65;
                v67[1] = 3221225472;
                v67[2] = __30__COConditionTask_launchTask___block_invoke_2;
                v67[3] = &unk_24E471278;
                v68 = v62;
                v67[4] = self;
                dispatch_source_set_registration_handler(v5, v67);

                dispatch_resume(v5);
                goto LABEL_3;
              }
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                -[COConditionTask launchTask:].cold.5(v62);
            }
          }
          else
          {
            v51 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
            if (v51)
              -[COConditionTask launchTask:].cold.4(v51, v52, v53, v54, v55, v56, v57, v58);
          }
          goto LABEL_34;
        }
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          goto LABEL_33;
      }
    }
LABEL_34:
    v5 = 0;
    goto LABEL_35;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[COConditionTask launchTask:].cold.3();
  v5 = 0;
  v7 = 0;
  v6 = (char **)v66;
LABEL_36:
  if (v77)
    posix_spawnattr_destroy(&v77);
  if (v78)
    posix_spawn_file_actions_destroy(&v78);
  if (v6)
    free(v6);

  return v7;
}

void __30__COConditionTask_launchTask___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;

  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "waitForExitInformation:", *(unsigned int *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "termination_sem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "termination_sem");
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_semaphore_signal(v3);

  }
}

void __30__COConditionTask_launchTask___block_invoke_2(uint64_t a1)
{
  if (kill(*(_DWORD *)(a1 + 40), 19))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __30__COConditionTask_launchTask___block_invoke_2_cold_1(a1);
  }
}

- (void)stopTask
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  useconds_t v7;
  BOOL v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  useconds_t v12;
  BOOL v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  int v17;
  _BOOL4 v18;
  int v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  const char *v26;
  int v27;
  void *v28;
  void *v29;
  int v30;
  _DWORD v31[7];

  *(_QWORD *)&v31[5] = *MEMORY[0x24BDAC8D0];
  -[COConditionTask taskQueue](self, "taskQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (!-[COConditionTask running](self, "running"))
    return;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    -[COConditionTask description](self, "description");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 138412290;
    *(_QWORD *)v31 = v4;
    _os_log_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Stopping task %@", (uint8_t *)&v30, 0xCu);

  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    -[COConditionTask launchPath](self, "launchPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastPathComponent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 138412290;
    *(_QWORD *)v31 = v6;
    _os_log_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "-->\tInterrupting: '%@'", (uint8_t *)&v30, 0xCu);

  }
  -[COConditionTask interrupt](self, "interrupt");
  if (-[COConditionTask slowTimeout](self, "slowTimeout"))
    v7 = 5500000;
  else
    v7 = 500000;
  usleep(v7);
  v8 = -[COConditionTask running](self, "running");
  v9 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO);
  if (!v8)
  {
    if (!v9)
      return;
    -[COConditionTask launchPath](self, "launchPath");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "lastPathComponent");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 138412290;
    *(_QWORD *)v31 = v24;
    v25 = MEMORY[0x24BDACB70];
    v26 = "-->\tInterrupted: '%@'";
    goto LABEL_29;
  }
  if (v9)
  {
    -[COConditionTask launchPath](self, "launchPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lastPathComponent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 138412290;
    *(_QWORD *)v31 = v11;
    _os_log_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "-->\tTerminating: '%@'", (uint8_t *)&v30, 0xCu);

  }
  -[COConditionTask terminate](self, "terminate");
  if (-[COConditionTask slowTimeout](self, "slowTimeout"))
    v12 = 2750000;
  else
    v12 = 250000;
  usleep(v12);
  v13 = -[COConditionTask running](self, "running");
  v14 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO);
  if (!v13)
  {
    if (!v14)
      return;
LABEL_28:
    -[COConditionTask launchPath](self, "launchPath");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "lastPathComponent");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 138412290;
    *(_QWORD *)v31 = v24;
    v25 = MEMORY[0x24BDACB70];
    v26 = "-->\tTerminated: '%@'";
LABEL_29:
    _os_log_impl(&dword_21F8CF000, v25, OS_LOG_TYPE_INFO, v26, (uint8_t *)&v30, 0xCu);

    return;
  }
  if (v14)
  {
    -[COConditionTask launchPath](self, "launchPath");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "lastPathComponent");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 138412290;
    *(_QWORD *)v31 = v16;
    _os_log_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "-->\tTask is taking a while to terminate: '%@'", (uint8_t *)&v30, 0xCu);

  }
  sleep(3u);
  if (!-[COConditionTask running](self, "running"))
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      return;
    goto LABEL_28;
  }
  v17 = -[COConditionTask processIdentifier](self, "processIdentifier");
  v18 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO);
  if (v17 <= 0)
  {
    if (v18)
    {
      v27 = -[COConditionTask processIdentifier](self, "processIdentifier");
      -[COConditionTask launchPath](self, "launchPath");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "lastPathComponent");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 67109378;
      v31[0] = v27;
      LOWORD(v31[1]) = 2112;
      *(_QWORD *)((char *)&v31[1] + 2) = v29;
      _os_log_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "-->\t*** [self.task processIdentifier] returned %d; assuming process is dead: '%@'",
        (uint8_t *)&v30,
        0x12u);

    }
  }
  else
  {
    if (v18)
    {
      v19 = -[COConditionTask processIdentifier](self, "processIdentifier");
      -[COConditionTask launchPath](self, "launchPath");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "lastPathComponent");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 67109378;
      v31[0] = v19;
      LOWORD(v31[1]) = 2112;
      *(_QWORD *)((char *)&v31[1] + 2) = v21;
      _os_log_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "-->\tKilling (pid %d): '%@'", (uint8_t *)&v30, 0x12u);

    }
    -[COConditionTask signalRunningTask:](self, "signalRunningTask:", 9);
    -[COConditionTask termination_sem](self, "termination_sem");
    v22 = objc_claimAutoreleasedReturnValue();
    dispatch_semaphore_signal(v22);

  }
}

- (id)stdoutFromResults
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  __CFString *v7;
  id v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[COConditionTask stdoutFname](self, "stdoutFname");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v3, "stringWithContentsOfFile:encoding:error:", v4, 4, &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;

  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[COConditionTask stdoutFromResults].cold.1(self);
    v7 = &stru_24E4716F0;
  }
  else
  {
    v7 = v5;
  }

  return v7;
}

- (id)stderrFromResults
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  __CFString *v7;
  id v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[COConditionTask stderrFname](self, "stderrFname");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v3, "stringWithContentsOfFile:encoding:error:", v4, 4, &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;

  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[COConditionTask stderrFromResults].cold.1(self);
    v7 = &stru_24E4716F0;
  }
  else
  {
    v7 = v5;
  }

  return v7;
}

- (BOOL)start
{
  COConditionTask *v2;
  NSObject *v3;
  _QWORD block[7];
  _QWORD v6[5];
  id v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v2 = self;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3032000000;
  v6[3] = __Block_byref_object_copy_;
  v6[4] = __Block_byref_object_dispose_;
  v7 = 0;
  -[COConditionTask taskQueue](self, "taskQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __24__COConditionTask_start__block_invoke;
  block[3] = &unk_24E4712A0;
  block[4] = v2;
  block[5] = &v8;
  block[6] = v6;
  dispatch_sync(v3, block);

  LOBYTE(v2) = *((_BYTE *)v9 + 24);
  _Block_object_dispose(v6, 8);

  _Block_object_dispose(&v8, 8);
  return (char)v2;
}

void __24__COConditionTask_start__block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  id obj;

  v2 = (void *)a1[4];
  v3 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v3 + 40);
  v4 = objc_msgSend(v2, "launchTask:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v4;
}

- (void)stop
{
  NSObject *v3;
  _QWORD block[5];

  -[COConditionTask taskQueue](self, "taskQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __23__COConditionTask_stop__block_invoke;
  block[3] = &unk_24E4712C8;
  block[4] = self;
  dispatch_sync(v3, block);

}

uint64_t __23__COConditionTask_stop__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopTask");
}

- (void)terminate
{
  -[COConditionTask signalRunningTask:](self, "signalRunningTask:", 15);
}

- (void)interrupt
{
  -[COConditionTask signalRunningTask:](self, "signalRunningTask:", 2);
}

- (BOOL)suspend
{
  return -[COConditionTask signalRunningTask:](self, "signalRunningTask:", 17) == 0;
}

- (BOOL)resume
{
  return -[COConditionTask signalRunningTask:](self, "signalRunningTask:", 19) == 0;
}

- (int)signalRunningTask:(int)a3
{
  return killpg(self->_processIdentifier, a3);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[COConditionTask launchPath](self, "launchPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[COConditionTask arguments](self, "arguments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(" "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@ (running with PID: %d)"), v4, v6, -[COConditionTask processIdentifier](self, "processIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int)endStatus
{
  return self->_endStatus;
}

- (void)setEndStatus:(int)a3
{
  self->_endStatus = a3;
}

- (BOOL)running
{
  return self->_running;
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (OS_dispatch_semaphore)termination_sem
{
  return self->_termination_sem;
}

- (void)setTermination_sem:(id)a3
{
  objc_storeStrong((id *)&self->_termination_sem, a3);
}

- (NSString)launchPath
{
  return self->_launchPath;
}

- (void)setLaunchPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)arguments
{
  return self->_arguments;
}

- (void)setArguments:(id)a3
{
  objc_storeStrong((id *)&self->_arguments, a3);
}

- (NSMutableArray)taskFileHandleArray
{
  return self->_taskFileHandleArray;
}

- (void)setTaskFileHandleArray:(id)a3
{
  objc_storeStrong((id *)&self->_taskFileHandleArray, a3);
}

- (NSString)stdoutFname
{
  return self->_stdoutFname;
}

- (void)setStdoutFname:(id)a3
{
  objc_storeStrong((id *)&self->_stdoutFname, a3);
}

- (NSString)stderrFname
{
  return self->_stderrFname;
}

- (void)setStderrFname:(id)a3
{
  objc_storeStrong((id *)&self->_stderrFname, a3);
}

- (NSString)stdinFname
{
  return self->_stdinFname;
}

- (void)setStdinFname:(id)a3
{
  objc_storeStrong((id *)&self->_stdinFname, a3);
}

- (NSFileHandle)stdinFileHandle
{
  return self->_stdinFileHandle;
}

- (void)setStdinFileHandle:(id)a3
{
  objc_storeStrong((id *)&self->_stdinFileHandle, a3);
}

- (NSFileHandle)stdoutFileHandle
{
  return self->_stdoutFileHandle;
}

- (void)setStdoutFileHandle:(id)a3
{
  objc_storeStrong((id *)&self->_stdoutFileHandle, a3);
}

- (NSFileHandle)stderrFileHandle
{
  return self->_stderrFileHandle;
}

- (void)setStderrFileHandle:(id)a3
{
  objc_storeStrong((id *)&self->_stderrFileHandle, a3);
}

- (int)processIdentifier
{
  return self->_processIdentifier;
}

- (void)setProcessIdentifier:(int)a3
{
  self->_processIdentifier = a3;
}

- (double)executionTime
{
  return self->_executionTime;
}

- (void)setExecutionTime:(double)a3
{
  self->_executionTime = a3;
}

- (BOOL)slowTimeout
{
  return self->_slowTimeout;
}

- (void)setSlowTimeout:(BOOL)a3
{
  self->_slowTimeout = a3;
}

- (OS_dispatch_queue)taskQueue
{
  return self->_taskQueue;
}

- (void)setTaskQueue:(id)a3
{
  objc_storeStrong((id *)&self->_taskQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskQueue, 0);
  objc_storeStrong((id *)&self->_stderrFileHandle, 0);
  objc_storeStrong((id *)&self->_stdoutFileHandle, 0);
  objc_storeStrong((id *)&self->_stdinFileHandle, 0);
  objc_storeStrong((id *)&self->_stdinFname, 0);
  objc_storeStrong((id *)&self->_stderrFname, 0);
  objc_storeStrong((id *)&self->_stdoutFname, 0);
  objc_storeStrong((id *)&self->_taskFileHandleArray, 0);
  objc_storeStrong((id *)&self->_arguments, 0);
  objc_storeStrong((id *)&self->_launchPath, 0);
  objc_storeStrong((id *)&self->_termination_sem, 0);
}

- (void)initWithCommand:(uint64_t)a1 arguments:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "componentsJoinedByString:", CFSTR(" "));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412546;
  v5 = a1;
  v6 = 2112;
  v7 = v3;
  _os_log_debug_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "COCondition Task Create: %@, %@", (uint8_t *)&v4, 0x16u);

  OUTLINED_FUNCTION_2();
}

- (void)waitForTaskWithTimeout:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "launchPath");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "lastPathComponent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1(&dword_21F8CF000, MEMORY[0x24BDACB70], v3, "%@ failed to complete within %d seconds.", v4, v5, v6, v7, v8);

}

- (void)launchTask:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_21F8CF000, MEMORY[0x24BDACB70], a3, "Invalid input(s).", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

- (void)launchTask:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_21F8CF000, MEMORY[0x24BDACB70], a3, "Failed to allocate memory.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

- (void)launchTask:.cold.3()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  __error();
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21F8CF000, MEMORY[0x24BDACB70], v1, "posix_spawn_file_actions_init failed: %d (%s)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)launchTask:(uint64_t)a3 .cold.4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_21F8CF000, MEMORY[0x24BDACB70], a3, "Failed to copy POSIX spawn attributes.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

- (void)launchTask:(int)a1 .cold.5(int a1)
{
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_21F8CF000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to create dispatch source for pid %d.", (uint8_t *)v1, 8u);
  OUTLINED_FUNCTION_6();
}

- (void)launchTask:(int)a1 .cold.6(int a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3(a1);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21F8CF000, MEMORY[0x24BDACB70], v1, "posix_spawn failed: %d (%s)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)launchTask:(int)a1 .cold.7(int a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3(a1);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21F8CF000, MEMORY[0x24BDACB70], v1, "posix_spawn_file_actions_adddup2 failed: %d (%s)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __30__COConditionTask_launchTask___block_invoke_2_cold_1(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(a1 + 32), "launchPath");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "lastPathComponent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_21F8CF000, MEMORY[0x24BDACB70], v3, "Error resuming process %@.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)stdoutFromResults
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "stdoutFname");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_21F8CF000, MEMORY[0x24BDACB70], v2, "Failed to read from %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2();
}

- (void)stderrFromResults
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "stderrFname");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_21F8CF000, MEMORY[0x24BDACB70], v2, "Failed to read from %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2();
}

@end
