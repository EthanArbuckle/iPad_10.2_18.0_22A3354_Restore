@implementation BRTask

- (BRTask)init
{
  BRTask *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BRTask;
  result = -[BRTask init](&v3, sel_init);
  if (result)
  {
    result->_redirectStdoutToFileDescriptor = -1;
    result->_redirectStderrToFileDescriptor = -1;
  }
  return result;
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
  BRTask *v4;

  v3 = a3;
  v4 = objc_alloc_init(BRTask);
  -[BRTask setCommandWithArguments:](v4, "setCommandWithArguments:", v3);

  return v4;
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

  -[BRTask setCommandWithArguments:](self, "setCommandWithArguments:", v6);
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
        objc_msgSend(v14, "stringByReplacingCharactersInRange:withString:", v9 - v6, 1, &stru_1E3DA8AC8);
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
  -[BRTask setArgv:](self, "setArgv:", v4);

}

- (int)exec
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  int v7;
  void *v8;
  char **v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  id v14;
  void *v15;
  unint64_t v16;
  void *v17;
  posix_spawn_file_actions_t *v18;
  int v19;
  char *v20;
  NSObject *v21;
  int *v22;
  char *v23;
  const char *v24;
  char *v25;
  char **v26;
  char *v27;
  char *v28;
  NSObject *v29;
  int *v30;
  char *v31;
  void *v33;
  uint64_t v34;
  id v35;
  int *v36;
  char *v37;
  void *v38;
  uint64_t v39;
  id v40;
  int *v41;
  char *v42;
  int v43;
  int *v44;
  char *v45;
  int v46;
  void *v47;
  id v48;
  const char *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  char *v53;
  char *v54;
  void (__cdecl *v55)(int);
  void (__cdecl *v56)(int);
  NSObject *v57;
  dispatch_source_t v58;
  NSObject *v59;
  _QWORD *v60;
  void *v61;
  void *v62;
  dispatch_block_t v63;
  char *v64;
  NSObject *v65;
  _QWORD v66[5];
  pid_t v67;
  pid_t v68;
  uint8_t buf[4];
  char *v70;
  __int16 v71;
  char *v72;
  __int16 v73;
  void *v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  -[BRTask argv](self, "argv");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "count"))
    -[BRTask exec].cold.1();

  if ((os_variant_has_internal_content() & 1) == 0)
  {
    -[BRTask argv](self, "argv");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndex:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containsString:", CFSTR("/usr/local/"));

    if ((v6 & 1) != 0)
      return -1;
  }
  -[BRTask argv](self, "argv");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (char **)malloc_type_malloc(8 * objc_msgSend(v8, "count") + 8, 0x10040436913F5uLL);

  -[BRTask argv](self, "argv");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    v12 = 0;
    do
    {
      -[BRTask argv](self, "argv");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndex:", v12);
      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v9[v12] = strdup((const char *)objc_msgSend(v14, "fileSystemRepresentation"));

      ++v12;
      -[BRTask argv](self, "argv");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count");

    }
    while (v12 < v16);
  }
  -[BRTask argv](self, "argv");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v9[objc_msgSend(v17, "count")] = 0;

  v18 = (posix_spawn_file_actions_t *)malloc_type_malloc(8uLL, 0x80040B8603338uLL);
  v19 = posix_spawn_file_actions_init(v18);
  if (!v19)
  {
    -[BRTask redirectStdoutToFileAtPath](self, "redirectStdoutToFileAtPath");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "length");

    if (v34)
    {
      -[BRTask redirectStdoutToFileAtPath](self, "redirectStdoutToFileAtPath");
      v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v7 = posix_spawn_file_actions_addopen(v18, 1, (const char *)objc_msgSend(v35, "fileSystemRepresentation"), 521, 0x1B6u);

      if (v7)
      {
        brc_bread_crumbs((uint64_t)"-[BRTask exec]", 191);
        v20 = (char *)objc_claimAutoreleasedReturnValue();
        brc_default_log(1);
        v21 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          goto LABEL_12;
        v36 = __error();
        v37 = strerror(*v36);
        *(_DWORD *)buf = 136315394;
        v70 = v37;
        v71 = 2112;
        v72 = v20;
        v24 = "[WARNING] Unable to redirect stdin (%s).%@";
        goto LABEL_11;
      }
    }
    -[BRTask redirectStderrToFileAtPath](self, "redirectStderrToFileAtPath");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "length");

    if (v39)
    {
      -[BRTask redirectStderrToFileAtPath](self, "redirectStderrToFileAtPath");
      v40 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v7 = posix_spawn_file_actions_addopen(v18, 2, (const char *)objc_msgSend(v40, "fileSystemRepresentation"), 521, 0x1B6u);

      if (v7)
      {
        brc_bread_crumbs((uint64_t)"-[BRTask exec]", 197);
        v20 = (char *)objc_claimAutoreleasedReturnValue();
        brc_default_log(1);
        v21 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          goto LABEL_12;
        v41 = __error();
        v42 = strerror(*v41);
        *(_DWORD *)buf = 136315394;
        v70 = v42;
        v71 = 2112;
        v72 = v20;
        v24 = "[WARNING] Unable to redirect stderr (%s).%@";
        goto LABEL_11;
      }
    }
    if (-[BRTask redirectStdoutToFileDescriptor](self, "redirectStdoutToFileDescriptor") == -1
      || (v43 = posix_spawn_file_actions_adddup2(v18, -[BRTask redirectStdoutToFileDescriptor](self, "redirectStdoutToFileDescriptor"), 1)) == 0)
    {
      if (-[BRTask redirectStderrToFileDescriptor](self, "redirectStderrToFileDescriptor") == -1
        || (v46 = posix_spawn_file_actions_adddup2(v18, -[BRTask redirectStderrToFileDescriptor](self, "redirectStderrToFileDescriptor"), 2)) == 0)
      {
        v68 = 0;
        -[BRTask argv](self, "argv");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "objectAtIndex:", 0);
        v48 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v49 = (const char *)objc_msgSend(v48, "fileSystemRepresentation");
        v7 = posix_spawnp(&v68, v49, v18, 0, v9, (char *const *)*MEMORY[0x1E0C831D0]);

        if (v7)
        {
          brc_bread_crumbs((uint64_t)"-[BRTask exec]", 261);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log(1);
          v51 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
          {
            -[BRTask argv](self, "argv");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "componentsJoinedByString:", CFSTR(", "));
            v53 = (char *)objc_claimAutoreleasedReturnValue();
            v54 = strerror(v7);
            *(_DWORD *)buf = 138412802;
            v70 = v53;
            v71 = 2080;
            v72 = v54;
            v73 = 2112;
            v74 = v50;
            _os_log_impl(&dword_19CBF0000, v51, OS_LOG_TYPE_DEFAULT, "[WARNING] Unable to spawn a new process (argv: [%@], error: %s).%@", buf, 0x20u);

          }
          self->_waitStatus = 0;
        }
        else
        {
          v55 = signal(2, (void (__cdecl *)(int))1);
          if (v55 == (void (__cdecl *)(int))-1)
          {
            brc_bread_crumbs((uint64_t)"-[BRTask exec]", 223);
            v64 = (char *)objc_claimAutoreleasedReturnValue();
            brc_default_log(1);
            v65 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v70 = v64;
              _os_log_impl(&dword_19CBF0000, v65, OS_LOG_TYPE_DEFAULT, "[WARNING] Unable to retrieve handler for SIGINT.%@", buf, 0xCu);
            }

            waitpid(v68, &self->_waitStatus, 0);
          }
          else
          {
            v56 = v55;
            dispatch_get_global_queue(0, 0);
            v57 = objc_claimAutoreleasedReturnValue();
            v58 = dispatch_source_create(MEMORY[0x1E0C80DC0], 2uLL, 0, v57);

            v66[0] = MEMORY[0x1E0C809B0];
            v66[1] = 3221225472;
            v66[2] = __14__BRTask_exec__block_invoke;
            v66[3] = &unk_1E3DA6DD0;
            v67 = v68;
            v66[4] = self;
            v59 = v58;
            v60 = v66;
            v61 = v60;
            v62 = v60;
            if (brc_block_remember_persona)
            {
              brc_block_remember_persona(v60);
              v62 = (void *)objc_claimAutoreleasedReturnValue();

            }
            v63 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v62);
            dispatch_source_set_event_handler(v59, v63);

            dispatch_resume(v59);
            waitpid(v68, &self->_waitStatus, 0);
            signal(2, v56);
            dispatch_source_cancel(v59);

          }
        }
        goto LABEL_13;
      }
      v7 = v46;
      brc_bread_crumbs((uint64_t)"-[BRTask exec]", 209);
      v20 = (char *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v21 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        goto LABEL_12;
    }
    else
    {
      v7 = v43;
      brc_bread_crumbs((uint64_t)"-[BRTask exec]", 203);
      v20 = (char *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v21 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        goto LABEL_12;
    }
    v44 = __error();
    v45 = strerror(*v44);
    *(_DWORD *)buf = 136315394;
    v70 = v45;
    v71 = 2112;
    v72 = v20;
    v24 = "[WARNING] Unable to perform spawn action (%s).%@";
    goto LABEL_11;
  }
  v7 = v19;
  brc_bread_crumbs((uint64_t)"-[BRTask exec]", 186);
  v20 = (char *)objc_claimAutoreleasedReturnValue();
  brc_default_log(1);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = __error();
    v23 = strerror(*v22);
    *(_DWORD *)buf = 136315394;
    v70 = v23;
    v71 = 2112;
    v72 = v20;
    v24 = "[WARNING] Unable to initialize the file actions properly (%s).%@";
LABEL_11:
    _os_log_impl(&dword_19CBF0000, v21, OS_LOG_TYPE_DEFAULT, v24, buf, 0x16u);
  }
LABEL_12:

LABEL_13:
  v25 = *v9;
  if (*v9)
  {
    v26 = v9 + 1;
    do
    {
      free(v25);
      v27 = *v26++;
      v25 = v27;
    }
    while (v27);
  }
  free(v9);
  if (posix_spawn_file_actions_destroy(v18))
  {
    brc_bread_crumbs((uint64_t)"-[BRTask exec]", 272);
    v28 = (char *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v30 = __error();
      v31 = strerror(*v30);
      *(_DWORD *)buf = 136315394;
      v70 = v31;
      v71 = 2112;
      v72 = v28;
      _os_log_impl(&dword_19CBF0000, v29, OS_LOG_TYPE_DEFAULT, "[WARNING] Unable to destroy the file actions properly (%s).%@", buf, 0x16u);
    }

  }
  free(v18);
  return v7;
}

void __14__BRTask_exec__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  FILE *v7;
  FILE *v8;
  void *v9;
  id v10;

  fwrite("\b\b", 2uLL, 1uLL, (FILE *)*MEMORY[0x1E0C80C10]);
  kill(*(_DWORD *)(a1 + 40), 9);
  objc_msgSend(*(id *)(a1 + 32), "redirectStderrToFileAtPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {

  }
  else
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "redirectStderrToFileDescriptor");

    if (v3 == -1)
      return;
  }
  objc_msgSend(*(id *)(a1 + 32), "redirectStderrToFileAtPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(void **)(a1 + 32);
  if (!v4)
  {
    if (objc_msgSend(v5, "redirectStderrToFileDescriptor") == 1
      && (objc_msgSend(*(id *)(a1 + 32), "redirectStdoutToFileAtPath"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v9,
          v9))
    {
      objc_msgSend(*(id *)(a1 + 32), "redirectStdoutToFileAtPath");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
        goto LABEL_6;
    }
    else
    {
      v6 = 0;
    }
LABEL_14:

    return;
  }
  objc_msgSend(v5, "redirectStderrToFileAtPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_14;
LABEL_6:
  v10 = objc_retainAutorelease(v6);
  v7 = fopen((const char *)objc_msgSend(v10, "fileSystemRepresentation"), "a+");
  if (v7)
  {
    v8 = v7;
    fwrite("\n\n === Aborted by user", 0x16uLL, 1uLL, v7);
    fclose(v8);
  }

}

- (void)resetRedirect
{
  -[BRTask setRedirectStdoutToFileAtPath:](self, "setRedirectStdoutToFileAtPath:", 0);
  -[BRTask setRedirectStdoutToFileDescriptor:](self, "setRedirectStdoutToFileDescriptor:", 0xFFFFFFFFLL);
  -[BRTask setRedirectStderrToFileAtPath:](self, "setRedirectStderrToFileAtPath:", 0);
  -[BRTask setRedirectStderrToFileDescriptor:](self, "setRedirectStderrToFileDescriptor:", 0xFFFFFFFFLL);
}

- (NSArray)argv
{
  return self->_argv;
}

- (void)setArgv:(id)a3
{
  objc_storeStrong((id *)&self->_argv, a3);
}

- (NSString)redirectStdoutToFileAtPath
{
  return self->_redirectStdoutToFileAtPath;
}

- (void)setRedirectStdoutToFileAtPath:(id)a3
{
  objc_storeStrong((id *)&self->_redirectStdoutToFileAtPath, a3);
}

- (int)redirectStdoutToFileDescriptor
{
  return self->_redirectStdoutToFileDescriptor;
}

- (void)setRedirectStdoutToFileDescriptor:(int)a3
{
  self->_redirectStdoutToFileDescriptor = a3;
}

- (NSString)redirectStderrToFileAtPath
{
  return self->_redirectStderrToFileAtPath;
}

- (void)setRedirectStderrToFileAtPath:(id)a3
{
  objc_storeStrong((id *)&self->_redirectStderrToFileAtPath, a3);
}

- (int)redirectStderrToFileDescriptor
{
  return self->_redirectStderrToFileDescriptor;
}

- (void)setRedirectStderrToFileDescriptor:(int)a3
{
  self->_redirectStderrToFileDescriptor = a3;
}

- (int)waitStatus
{
  return self->_waitStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_redirectStderrToFileAtPath, 0);
  objc_storeStrong((id *)&self->_redirectStdoutToFileAtPath, 0);
  objc_storeStrong((id *)&self->_argv, 0);
}

- (void)exec
{
  __assert_rtn("-[BRTask exec]", "BRTask.m", 163, "self.argv.count > 0");
}

@end
