@implementation FPTask

- (FPTask)init
{
  FPTask *v2;
  FPTask *v3;
  NSFileHandle *standardOutput;
  NSFileHandle *standardError;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FPTask;
  v2 = -[FPTask init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    standardOutput = v2->_standardOutput;
    v2->_standardOutput = 0;

    standardError = v3->_standardError;
    v3->_standardError = 0;

  }
  return v3;
}

+ (id)taskWithRedirectedOutputAndCommand:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;

  v4 = (objc_class *)MEMORY[0x1E0CB3940];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithFormat:arguments:", v5, &v11);

  objc_msgSend(a1, "taskWithCommandWithArguments:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleWithStandardError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setStandardError:", v8);

  objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleWithStandardOutput");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setStandardOutput:", v9);

  return v7;
}

+ (id)taskWithCommand:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;

  v4 = (objc_class *)MEMORY[0x1E0CB3940];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithFormat:arguments:", v5, &v9);

  objc_msgSend(a1, "taskWithCommandWithArguments:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)taskWithCommandWithArguments:(id)a3
{
  id v3;
  FPTask *v4;

  v3 = a3;
  v4 = objc_alloc_init(FPTask);
  -[FPTask setCommandWithArguments:](v4, "setCommandWithArguments:", v3);

  return v4;
}

+ (id)taskWithArguments:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v5, "setArgv:", v4);

  return v5;
}

+ (id)sanitizeStringForFilename:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;

  v3 = a3;
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR(":"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\"), CFSTR("'"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("’"), CFSTR("'"));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (!-[__CFString length](v8, "length"))
    {

      v8 = CFSTR("empty-string");
    }
  }
  else
  {
    v8 = CFSTR("nil");
  }
  return v8;
}

- (void)setCommand:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  uint64_t v7;

  v4 = (objc_class *)MEMORY[0x1E0CB3940];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithFormat:arguments:", v5, &v7);

  -[FPTask setCommandWithArguments:](self, "setCommandWithArguments:", v6);
}

- (void)setCommandWithArguments:(id)a3
{
  void *v4;
  unint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;

  v19 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v19, "length"))
    goto LABEL_22;
  v5 = 0;
  v6 = 0;
  v7 = 0;
  v8 = 0;
  v9 = -1;
  v10 = 1;
  do
  {
    v11 = objc_msgSend(v19, "characterAtIndex:", v5);
    if (v11 != 39 || (v7 & 1) != 0)
    {
      if ((v11 != 34) | v8 & 1)
      {
        v13 = v11 != 32;
        v12 = v19;
        if (((v13 | v8 | v7) & 1) != 0)
          goto LABEL_18;
      }
      else
      {
        v12 = v19;
        if ((v7 & 1) == 0)
        {
          v8 = 0;
          v7 = 1;
          goto LABEL_17;
        }
      }
    }
    else
    {
      v12 = v19;
      if ((v8 & 1) == 0)
      {
        v7 = 0;
        v8 = 1;
LABEL_17:
        v9 = v5;
LABEL_18:
        v17 = v10;
        goto LABEL_19;
      }
    }
    if (v10 != 1)
    {
      objc_msgSend(v12, "substringWithRange:", v6, v10 - 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v9 != -1)
      {
        objc_msgSend(v14, "stringByReplacingCharactersInRange:withString:", v9 - v6, 1, &stru_1E4450B40);
        v16 = objc_claimAutoreleasedReturnValue();

        v15 = (void *)v16;
      }
      objc_msgSend(v4, "addObject:", v15);

      v12 = v19;
    }
    v7 = 0;
    v8 = 0;
    v17 = 0;
    v6 += v10;
    v9 = -1;
LABEL_19:
    v10 = v17 + 1;
    ++v5;
  }
  while (v5 < objc_msgSend(v12, "length"));
  if (v17)
  {
    objc_msgSend(v19, "substringWithRange:", v6, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v18);

  }
LABEL_22:
  -[FPTask setArgv:](self, "setArgv:", v4);

}

- (int)_prepareRedirections:(void *)a3
{
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v11;
  char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[FPTask standardOutput](self, "standardOutput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[FPTask standardOutput](self, "standardOutput");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v7) = posix_spawn_file_actions_adddup2(a3, objc_msgSend(v6, "fileDescriptor"), 1);

    if ((_DWORD)v7)
    {
      fp_current_or_default_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        goto LABEL_8;
      goto LABEL_9;
    }
  }
  -[FPTask standardError](self, "standardError");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[FPTask standardError](self, "standardError");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v7) = posix_spawn_file_actions_adddup2(a3, objc_msgSend(v9, "fileDescriptor"), 2);

    if ((_DWORD)v7)
    {
      fp_current_or_default_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
LABEL_8:
        v11 = 136315138;
        v12 = strerror((int)v7);
        _os_log_impl(&dword_1A0A34000, v8, OS_LOG_TYPE_DEFAULT, "[WARNING] Unable to perform spawn action (%s).", (uint8_t *)&v11, 0xCu);
      }
LABEL_9:

    }
  }
  return (int)v7;
}

- (int)execAsync
{
  void *v3;
  void *v4;
  char **v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  id v10;
  void *v11;
  unint64_t v12;
  void *v13;
  int v14;
  int v15;
  NSObject *v16;
  char *v17;
  const char *v18;
  int v19;
  int v20;
  char *v21;
  int v22;
  int v23;
  int v24;
  NSObject *v25;
  char *v26;
  void *v28;
  id v29;
  const char *v30;
  int v31;
  void *v32;
  char *v33;
  char *v34;
  posix_spawn_file_actions_t v35;
  pid_t v36;
  uint8_t buf[4];
  char *v38;
  __int16 v39;
  char *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  -[FPTask argv](self, "argv");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "count"))
    -[FPTask execAsync].cold.1();

  -[FPTask argv](self, "argv");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (char **)malloc_type_malloc(8 * objc_msgSend(v4, "count") + 8, 0x50040EE9192B6uLL);

  -[FPTask argv](self, "argv");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v8 = 0;
    do
    {
      -[FPTask argv](self, "argv");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndex:", v8);
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v5[v8] = (char *)objc_msgSend(v10, "fileSystemRepresentation");

      ++v8;
      -[FPTask argv](self, "argv");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");

    }
    while (v8 < v12);
  }
  v36 = 0;
  -[FPTask argv](self, "argv");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v5[objc_msgSend(v13, "count")] = 0;

  v35 = 0;
  v14 = posix_spawn_file_actions_init(&v35);
  if (v14)
  {
    v15 = v14;
    fp_current_or_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = strerror(v15);
      *(_DWORD *)buf = 136315138;
      v38 = v17;
      v18 = "[WARNING] Unable to initialize the file actions properly (%s).";
LABEL_11:
      _os_log_impl(&dword_1A0A34000, v16, OS_LOG_TYPE_DEFAULT, v18, buf, 0xCu);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  v19 = -[FPTask _prepareRedirections:](self, "_prepareRedirections:", &v35);
  if (v19)
  {
    v20 = v19;
    fp_current_or_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v21 = strerror(v20);
      *(_DWORD *)buf = 136315138;
      v38 = v21;
      v18 = "[WARNING] Unable to setup redirections properly (%s).";
      goto LABEL_11;
    }
LABEL_12:

    v22 = 0;
    goto LABEL_13;
  }
  -[FPTask argv](self, "argv");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectAtIndex:", 0);
  v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v30 = (const char *)objc_msgSend(v29, "fileSystemRepresentation");
  v31 = posix_spawnp(&v36, v30, &v35, 0, v5, (char *const *)*MEMORY[0x1E0C831D0]);

  if (v31)
  {
    fp_current_or_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      -[FPTask argv](self, "argv");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "componentsJoinedByString:", CFSTR(", "));
      v33 = (char *)objc_claimAutoreleasedReturnValue();
      v34 = strerror(v31);
      *(_DWORD *)buf = 138412546;
      v38 = v33;
      v39 = 2080;
      v40 = v34;
      _os_log_impl(&dword_1A0A34000, v16, OS_LOG_TYPE_DEFAULT, "[WARNING] Unable to spawn a new process (argv: [%@], error: %s).", buf, 0x16u);

    }
    goto LABEL_12;
  }
  v22 = 1;
LABEL_13:
  free(v5);
  v23 = posix_spawn_file_actions_destroy(&v35);
  if (v23)
  {
    v24 = v23;
    fp_current_or_default_log();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = strerror(v24);
      *(_DWORD *)buf = 136315138;
      v38 = v26;
      _os_log_impl(&dword_1A0A34000, v25, OS_LOG_TYPE_DEFAULT, "[WARNING] Unable to destroy the file actions properly (%s).", buf, 0xCu);
    }

  }
  if (v22)
    return v36;
  else
    return -1;
}

- (int)exec
{
  void *v3;
  void *v4;
  char **v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  unint64_t v17;
  void *v18;
  int v19;
  int v20;
  NSObject *v21;
  char *v22;
  int v23;
  int v24;
  NSObject *v25;
  char *v26;
  void (__cdecl *v27)(int);
  void *v28;
  id v29;
  const char *v30;
  NSObject *v31;
  void *v32;
  char *v33;
  char *v34;
  NSObject *v35;
  NSObject *v36;
  int *p_waitStatus;
  int v38;
  int v39;
  NSObject *v40;
  char *v41;
  _QWORD v43[5];
  pid_t v44;
  pid_t v45;
  sigset_t v46;
  posix_spawn_file_actions_t v47;
  uint8_t buf[4];
  char *v49;
  __int16 v50;
  char *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  -[FPTask argv](self, "argv");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "count"))
    -[FPTask exec].cold.1();

  -[FPTask argv](self, "argv");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (char **)malloc_type_malloc(8 * objc_msgSend(v4, "count") + 8, 0x50040EE9192B6uLL);

  -[FPTask argv](self, "argv");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v8 = 0;
    do
    {
      -[FPTask argv](self, "argv");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "hasPrefix:", CFSTR("~"));

      -[FPTask argv](self, "argv");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndexedSubscript:", v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v11)
      {
        objc_msgSend(v13, "stringByExpandingTildeInPath");
        v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v5[v8] = (char *)objc_msgSend(v15, "fileSystemRepresentation");

      }
      else
      {
        v5[v8] = (char *)objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
      }

      ++v8;
      -[FPTask argv](self, "argv");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");

    }
    while (v8 < v17);
  }
  -[FPTask argv](self, "argv");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v5[objc_msgSend(v18, "count")] = 0;

  v47 = 0;
  v19 = posix_spawn_file_actions_init(&v47);
  if (v19)
  {
    v20 = v19;
    fp_current_or_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = strerror(v20);
      *(_DWORD *)buf = 136315138;
      v49 = v22;
      _os_log_impl(&dword_1A0A34000, v21, OS_LOG_TYPE_DEFAULT, "[WARNING] Unable to initialize the file actions properly (%s).", buf, 0xCu);
    }

  }
  v23 = -[FPTask _prepareRedirections:](self, "_prepareRedirections:", &v47);
  if (v23)
  {
    v24 = v23;
    fp_current_or_default_log();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v26 = strerror(v24);
      *(_DWORD *)buf = 136315138;
      v49 = v26;
      _os_log_impl(&dword_1A0A34000, v25, OS_LOG_TYPE_DEFAULT, "[WARNING] Unable to setup redirections properly (%s).", buf, 0xCu);
    }

  }
  else
  {
    v45 = 0;
    v27 = signal(20, 0);
    v46 = 2;
    pthread_sigmask(1, &v46, 0);
    -[FPTask argv](self, "argv");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectAtIndex:", 0);
    v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v30 = (const char *)objc_msgSend(v29, "fileSystemRepresentation");
    v24 = posix_spawnp(&v45, v30, &v47, 0, v5, (char *const *)*MEMORY[0x1E0C831D0]);

    if (v24)
    {
      fp_current_or_default_log();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        -[FPTask argv](self, "argv");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "componentsJoinedByString:", CFSTR(", "));
        v33 = (char *)objc_claimAutoreleasedReturnValue();
        v34 = strerror(v24);
        *(_DWORD *)buf = 138412546;
        v49 = v33;
        v50 = 2080;
        v51 = v34;
        _os_log_impl(&dword_1A0A34000, v31, OS_LOG_TYPE_DEFAULT, "[WARNING] Unable to spawn a new process (argv: [%@], error: %s).", buf, 0x16u);

      }
      self->_waitStatus = 0;
    }
    else
    {
      dispatch_get_global_queue(0, 0);
      v35 = objc_claimAutoreleasedReturnValue();
      v36 = dispatch_source_create(MEMORY[0x1E0C80DC0], 2uLL, 0, v35);

      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __14__FPTask_exec__block_invoke;
      v43[3] = &unk_1E444EBE0;
      v44 = v45;
      v43[4] = self;
      dispatch_source_set_event_handler(v36, v43);
      dispatch_resume(v36);
      p_waitStatus = &self->_waitStatus;
      while (waitpid(v45, p_waitStatus, 0) < 0 && *__error() == 4)
        ;
      if ((*p_waitStatus & 0x7F) != 0)
        v24 = 0;
      else
        v24 = BYTE1(*p_waitStatus);
      dispatch_source_cancel(v36);

    }
    pthread_sigmask(2, &v46, 0);
    if (v27 != (void (__cdecl *)(int))-1)
      signal(20, v27);
  }
  free(v5);
  v38 = posix_spawn_file_actions_destroy(&v47);
  if (v38)
  {
    v39 = v38;
    fp_current_or_default_log();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      v41 = strerror(v39);
      *(_DWORD *)buf = 136315138;
      v49 = v41;
      _os_log_impl(&dword_1A0A34000, v40, OS_LOG_TYPE_DEFAULT, "[WARNING] Unable to destroy the file actions properly (%s).", buf, 0xCu);
    }

  }
  return v24;
}

void __14__FPTask_exec__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  fwrite("\b\b", 2uLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
  kill(*(_DWORD *)(a1 + 40), 9);
  objc_msgSend(*(id *)(a1 + 32), "standardError");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "standardError");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    dprintf(objc_msgSend(v3, "fileDescriptor"), "\n\n === Aborted by user");

  }
}

+ (BOOL)exec:(id)a3 stdoutString:(id *)a4 stderrString:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  pid_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  id v19;
  BOOL v21;
  int v23;
  _QWORD v24[4];
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  _QWORD block[4];
  id v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;

  v7 = a3;
  objc_msgSend(MEMORY[0x1E0CB3860], "pipe");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3860], "pipe");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FPTask taskWithCommandWithArguments:](FPTask, "taskWithCommandWithArguments:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fileHandleForWriting");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setStandardOutput:", v11);

  objc_msgSend(v9, "fileHandleForWriting");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setStandardError:", v12);

  v13 = objc_msgSend(v10, "execAsync");
  objc_msgSend(v8, "fileHandleForWriting");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "closeFile");

  objc_msgSend(v9, "fileHandleForWriting");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "closeFile");

  if (v13 < 0)
  {
    v21 = 0;
  }
  else
  {
    v16 = dispatch_queue_create("queue for reading the task output and error streams concurrently", MEMORY[0x1E0C80D50]);
    v36 = 0;
    v37 = &v36;
    v38 = 0x3032000000;
    v39 = __Block_byref_object_copy__24;
    v40 = __Block_byref_object_dispose__24;
    v41 = 0;
    v17 = MEMORY[0x1E0C809B0];
    if (a4)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __41__FPTask_exec_stdoutString_stderrString___block_invoke;
      block[3] = &unk_1E444B600;
      v35 = &v36;
      v34 = v8;
      dispatch_async(v16, block);

      v17 = MEMORY[0x1E0C809B0];
    }
    v27 = 0;
    v28 = &v27;
    v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__24;
    v31 = __Block_byref_object_dispose__24;
    v32 = 0;
    if (a5)
    {
      v24[0] = v17;
      v24[1] = 3221225472;
      v24[2] = __41__FPTask_exec_stdoutString_stderrString___block_invoke_31;
      v24[3] = &unk_1E444B600;
      v26 = &v27;
      v25 = v9;
      dispatch_async(v16, v24);

    }
    dispatch_barrier_sync(v16, &__block_literal_global_47);
    if (a4)
    {
      v18 = objc_alloc(MEMORY[0x1E0CB3940]);
      *a4 = (id)objc_msgSend(v18, "initWithData:encoding:", v37[5], 4);
    }
    if (a5)
    {
      v19 = objc_alloc(MEMORY[0x1E0CB3940]);
      *a5 = (id)objc_msgSend(v19, "initWithData:encoding:", v28[5], 4);
    }
    v23 = 0;
    v21 = waitpid(v13, &v23, 0) >= 0 && BYTE1(v23) << 8 == 0;
    _Block_object_dispose(&v27, 8);

    _Block_object_dispose(&v36, 8);
  }

  return v21;
}

void __41__FPTask_exec_stdoutString_stderrString___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "fileHandleForReading");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v2, "readDataToEndOfFileAndReturnError:", &v8);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v8;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

  if (v4)
  {
    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __41__FPTask_exec_stdoutString_stderrString___block_invoke_cold_1(v4);

  }
}

void __41__FPTask_exec_stdoutString_stderrString___block_invoke_31(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "fileHandleForReading");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v2, "readDataToEndOfFileAndReturnError:", &v8);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v8;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

  if (v4)
  {
    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __41__FPTask_exec_stdoutString_stderrString___block_invoke_31_cold_1(v4);

  }
}

- (void)resetRedirect
{
  -[FPTask setStandardOutput:](self, "setStandardOutput:", 0);
  -[FPTask setStandardError:](self, "setStandardError:", 0);
}

- (NSArray)argv
{
  return self->_argv;
}

- (void)setArgv:(id)a3
{
  objc_storeStrong((id *)&self->_argv, a3);
}

- (NSFileHandle)standardOutput
{
  return self->_standardOutput;
}

- (void)setStandardOutput:(id)a3
{
  objc_storeStrong((id *)&self->_standardOutput, a3);
}

- (NSFileHandle)standardError
{
  return self->_standardError;
}

- (void)setStandardError:(id)a3
{
  objc_storeStrong((id *)&self->_standardError, a3);
}

- (int)waitStatus
{
  return self->_waitStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_standardError, 0);
  objc_storeStrong((id *)&self->_standardOutput, 0);
  objc_storeStrong((id *)&self->_argv, 0);
}

- (void)execAsync
{
  __assert_rtn("-[FPTask execAsync]", "FPTask.m", 195, "self.argv.count > 0");
}

- (void)exec
{
  __assert_rtn("-[FPTask exec]", "FPTask.m", 246, "self.argv.count > 0");
}

void __41__FPTask_exec_stdoutString_stderrString___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "fp_prettyDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11_3(&dword_1A0A34000, v2, v3, "[ERROR] Error while reading stdout: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_6_1();
}

void __41__FPTask_exec_stdoutString_stderrString___block_invoke_31_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "fp_prettyDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_11_3(&dword_1A0A34000, v2, v3, "[ERROR] Error while reading stderr: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_6_1();
}

@end
