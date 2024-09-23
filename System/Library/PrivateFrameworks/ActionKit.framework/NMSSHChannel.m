@implementation NMSSHChannel

- (NMSSHChannel)initWithSession:(id)a3
{
  id v4;
  NMSSHChannel *v5;
  NMSSHChannel *v6;
  void *v7;
  char isKindOfClass;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NMSSHChannel;
  v5 = -[NMSSHChannel init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    -[NMSSHChannel setSession:](v5, "setSession:", v4);
    -[NMSSHChannel setBufferSize:](v6, "setBufferSize:", 0x4000);
    -[NMSSHChannel setRequestPty:](v6, "setRequestPty:", 0);
    -[NMSSHChannel setPtyTerminalType:](v6, "setPtyTerminalType:", 0);
    -[NMSSHChannel setType:](v6, "setType:", 0);
    -[NMSSHChannel session](v6, "session");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
      objc_exception_throw(CFSTR("You have to provide a valid NMSSHSession!"));
  }

  return v6;
}

- (BOOL)openChannel:(id *)a3
{
  NMSSHChannel *v4;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NMSSHChannel *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  char isKindOfClass;
  id v19;
  id v20;
  int v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  NMSSHChannel *v26;
  void *v27;
  id v28;
  int v29;
  const void *v30;
  NMSSHChannel *v31;
  uint64_t v32;
  const char *v33;
  unsigned int v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id *v48;
  const void *v49;
  uint64_t v50;
  id obj;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint64_t v56;
  void *v57;
  _BYTE v58[128];
  uint64_t v59;
  _QWORD v60[3];

  v4 = self;
  v60[1] = *MEMORY[0x24BDAC8D0];
  if (-[NMSSHChannel channel](self, "channel"))
    return 1;
  -[NMSSHChannel session](v4, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  libssh2_session_set_blocking(objc_msgSend(v6, "rawSession"), 1);

  -[NMSSHChannel session](v4, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = libssh2_channel_open_ex(objc_msgSend(v7, "rawSession"), "session", 7u, 0x200000u, 0x8000u, 0, 0);

  if (v8)
  {
    -[NMSSHChannel setChannel:](v4, "setChannel:", v8);
    -[NMSSHChannel environmentVariables](v4, "environmentVariables");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v48 = a3;
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      -[NMSSHChannel environmentVariables](v4, "environmentVariables");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
      v11 = v4;
      if (v10)
      {
        v12 = v10;
        v13 = *(_QWORD *)v53;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v53 != v13)
              objc_enumerationMutation(obj);
            v15 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              -[NMSSHChannel environmentVariables](v11, "environmentVariables");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "objectForKey:", v15);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              isKindOfClass = objc_opt_isKindOfClass();

              if ((isKindOfClass & 1) != 0)
              {
                v50 = -[NMSSHChannel channel](v11, "channel");
                v19 = objc_retainAutorelease(v15);
                v49 = (const void *)objc_msgSend(v19, "UTF8String");
                v20 = objc_retainAutorelease(v19);
                v21 = strlen((const char *)objc_msgSend(v20, "UTF8String"));
                -[NMSSHChannel environmentVariables](v11, "environmentVariables");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "objectForKey:", v20);
                v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                v24 = v13;
                v25 = objc_msgSend(v23, "UTF8String");
                -[NMSSHChannel environmentVariables](v11, "environmentVariables");
                v26 = v11;
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "objectForKey:", v20);
                v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                v29 = strlen((const char *)objc_msgSend(v28, "UTF8String"));
                v30 = (const void *)v25;
                v13 = v24;
                libssh2_channel_setenv_ex(v50, v49, v21, v30, v29);

                v11 = v26;
              }
            }
          }
          v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
        }
        while (v12);
      }

      a3 = v48;
      v4 = v11;
    }
    if (!-[NMSSHChannel requestPty](v4, "requestPty"))
      return 1;
    v31 = v4;
    v32 = -[NMSSHChannel channel](v4, "channel");
    v33 = -[NMSSHChannel ptyTerminalName](v31, "ptyTerminalName");
    v34 = strlen(-[NMSSHChannel ptyTerminalName](v31, "ptyTerminalName"));
    if (!libssh2_channel_request_pty_ex(v32, v33, v34, 0, 0, 80, 24, 0, 0))
      return 1;
    if (a3)
    {
      v56 = *MEMORY[0x24BDD0FC8];
      v35 = (void *)MEMORY[0x24BDD17C8];
      v36 = -[NMSSHChannel ptyTerminalName](v31, "ptyTerminalName");
      -[NMSSHChannel session](v31, "session");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "lastError");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "localizedDescription");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "stringWithFormat:", CFSTR("Error requesting %s pty: %@"), v36, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = v40;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("NMSSH"), 2, v41);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error requesting pseudo terminal"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "logError:", v43);

    -[NMSSHChannel closeChannel](v31, "closeChannel");
  }
  else
  {
    +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unable to open a session"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "logError:", v45);

    if (a3)
    {
      v46 = (void *)MEMORY[0x24BDD1540];
      v59 = *MEMORY[0x24BDD0FC8];
      v60[0] = CFSTR("Channel allocation error");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v60, &v59, 1);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "errorWithDomain:code:userInfo:", CFSTR("NMSSH"), 4, v47);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  return 0;
}

- (void)closeChannel
{
  void *v3;

  -[NMSSHChannel session](self, "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  libssh2_session_set_blocking(objc_msgSend(v3, "rawSession"), 1);

  if (-[NMSSHChannel channel](self, "channel"))
  {
    if (!libssh2_channel_close((uint64_t)-[NMSSHChannel channel](self, "channel")))
      libssh2_channel_wait_closed((uint64_t)-[NMSSHChannel channel](self, "channel"));
    libssh2_channel_free((uint64_t)-[NMSSHChannel channel](self, "channel"));
    -[NMSSHChannel setType:](self, "setType:", 0);
    -[NMSSHChannel setChannel:](self, "setChannel:", 0);
  }
}

- (BOOL)sendEOF
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = libssh2_channel_send_eof((uint64_t)-[NMSSHChannel channel](self, "channel"));
  +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Sent EOF to host (return code = %i)"), v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logVerbose:", v4);

  return (_DWORD)v2 == 0;
}

- (void)waitEOF
{
  uint64_t v3;
  void *v4;
  id v5;

  if (!libssh2_channel_eof((uint64_t)-[NMSSHChannel channel](self, "channel")))
  {
    v3 = libssh2_channel_wait_eof((uint64_t)-[NMSSHChannel channel](self, "channel"));
    +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Received host acknowledge for EOF (return code = %i)"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "logVerbose:", v4);

  }
}

- (const)ptyTerminalName
{
  int64_t v2;

  v2 = -[NMSSHChannel ptyTerminalType](self, "ptyTerminalType");
  if ((unint64_t)(v2 - 1) > 4)
    return "vanilla";
  else
    return off_24F8B3140[v2 - 1];
}

- (id)execute:(id)a3 error:(id *)a4
{
  return -[NMSSHChannel execute:error:timeout:](self, "execute:error:timeout:", a3, a4, &unk_24F93A400);
}

- (id)execute:(id)a3 error:(id *)a4 timeout:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _LIBSSH2_CHANNEL *v13;
  id v14;
  const void *v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;

  v8 = a3;
  v9 = a5;
  +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Exec command %@"), v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "logInfo:", v11);

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithObject:forKey:", v8, CFSTR("command"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[NMSSHChannel openChannel:](self, "openChannel:", a4))
  {
LABEL_6:
    v25 = 0;
    goto LABEL_7;
  }
  -[NMSSHChannel setLastResponse:](self, "setLastResponse:", 0);
  -[NMSSHChannel setType:](self, "setType:", 1);
  v13 = -[NMSSHChannel channel](self, "channel");
  v14 = objc_retainAutorelease(v8);
  v15 = (const void *)objc_msgSend(v14, "UTF8String");
  v16 = strlen((const char *)objc_msgSend(objc_retainAutorelease(v14), "UTF8String"));
  v17 = libssh2_channel_process_startup((uint64_t)v13, "exec", 4u, v15, v16);
  if ((_DWORD)v17)
  {
    if (a4)
    {
      v18 = v17;
      -[NMSSHChannel session](self, "session");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "lastError");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKey:", v21, *MEMORY[0x24BDD0FC8]);

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%i"), v18);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKey:", v22, *MEMORY[0x24BDD0FD8]);

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("NMSSH"), 0, v12);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error executing command"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "logError:", v24);

    -[NMSSHChannel closeChannel](self, "closeChannel");
    goto LABEL_6;
  }
  -[NMSSHChannel readResponseWithError:timeout:userInfo:](self, "readResponseWithError:timeout:userInfo:", a4, v9, v12);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v27, 4);
  else
    v25 = 0;

LABEL_7:
  return v25;
}

- (id)readResponseWithError:(id *)a3 timeout:(id)a4 userInfo:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  double Current;
  double v14;
  double v15;
  id v16;
  unint64_t v17;
  char *v18;
  unint64_t v19;
  int64_t v20;
  int exit_status;
  _LIBSSH2_CHANNEL *v22;
  uint64_t v23;
  id v24;
  unint64_t v25;
  uint64_t v26;
  __CFString *v27;
  id *v28;
  id v29;
  void *v30;
  id v31;
  int v32;
  void *v33;
  CFSocketNativeHandle Native;
  void *v35;
  id v36;
  int64_t v37;
  id v38;
  int64_t v39;
  void *v40;
  void *v41;
  void *v43;
  void *v44;
  void *v45;
  id *v46;
  id v47;
  void *v48;
  void *v49;
  uint64_t v50;
  id v51;
  uint64_t *v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  id v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v51 = a5;
  v9 = (void *)objc_msgSend(v51, "mutableCopy");
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v58 = v11;

  -[NMSSHChannel session](self, "session");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  libssh2_session_set_blocking(objc_msgSend(v12, "rawSession"), 0);

  Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend(v8, "doubleValue");
  v15 = Current + v14;
  v16 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
  v55 = *MEMORY[0x24BDD0FC8];
  v53 = *MEMORY[0x24BDD0FD8];
  v54 = v16;
  while (2)
  {
    v17 = -[NMSSHChannel bufferSize](self, "bufferSize");
    v52 = &v50;
    v18 = (char *)&v50 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
    v19 = -[NMSSHChannel bufferSize](self, "bufferSize");
    v56 = (uint64_t)&v50 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
    v57 = v19;
    do
    {
      v20 = libssh2_channel_read_ex((uint64_t)-[NMSSHChannel channel](self, "channel"), 0, (uint64_t)v18, v17);
      if (v20 >= 1)
        objc_msgSend(v16, "appendBytes:length:", v18, v20);
      exit_status = libssh2_channel_get_exit_status((uint64_t)-[NMSSHChannel channel](self, "channel"));
      if (a3 && exit_status)
      {
        v22 = -[NMSSHChannel channel](self, "channel");
        v23 = v56;
        v24 = v8;
        v25 = libssh2_channel_read_ex((uint64_t)v22, 1, v56, v57);
        v26 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", v23, v25, 4);
        if (v26)
          v27 = (__CFString *)v26;
        else
          v27 = CFSTR("An unspecified error occurred");
        v28 = a3;
        v29 = v58;
        objc_msgSend(v58, "setObject:forKey:", v27, v55);
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%zi"), v25);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setObject:forKey:", v30, v53);

        v8 = v24;
        v31 = v29;
        a3 = v28;
        v16 = v54;
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("NMSSH"), 0, v31);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

      }
      v32 = libssh2_channel_eof((uint64_t)-[NMSSHChannel channel](self, "channel"));
      if (!v20 || v32 == 1)
      {
        v36 = v51;
        while (1)
        {
          v37 = libssh2_channel_read_ex((uint64_t)-[NMSSHChannel channel](self, "channel"), 0, (uint64_t)v18, v17);
          if (v37 < 1)
            break;
          objc_msgSend(v16, "appendBytes:length:", v18, v37);
        }
LABEL_29:
        v40 = (void *)objc_msgSend(v16, "copy");
        -[NMSSHChannel setLastResponse:](self, "setLastResponse:", v40);

        -[NMSSHChannel closeChannel](self, "closeChannel");
        -[NMSSHChannel lastResponse](self, "lastResponse");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_30;
      }
      if (objc_msgSend(v8, "longValue") >= 1 && v15 < CFAbsoluteTimeGetCurrent())
      {
        if (a3)
        {
          v38 = v58;
          objc_msgSend(v58, "setObject:forKey:", CFSTR("Connection timed out"), v55);
          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("NMSSH"), 3, v38);
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }
        v36 = v51;
        while (1)
        {
          v39 = libssh2_channel_read_ex((uint64_t)-[NMSSHChannel channel](self, "channel"), 0, (uint64_t)v18, v17);
          if (v39 < 1)
            break;
          objc_msgSend(v16, "appendBytes:length:", v18, v39);
        }
        goto LABEL_29;
      }
    }
    while (v20 > 0);
    if (v20 == -37)
    {
      -[NMSSHChannel session](self, "session");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      Native = CFSocketGetNative((CFSocketRef)objc_msgSend(v33, "socket"));
      -[NMSSHChannel session](self, "session");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      waitsocket(Native, objc_msgSend(v35, "rawSession"));

      continue;
    }
    break;
  }
  if (a3)
  {
    -[NMSSHChannel session](self, "session");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "lastError");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "localizedDescription");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = a3;
    v47 = v58;
    objc_msgSend(v58, "setObject:forKey:", v45, v55);

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("NMSSH"), 1, v47);
    *v46 = (id)objc_claimAutoreleasedReturnValue();
    v16 = v54;
  }
  +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error fetching response from command"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "logError:", v49);

  -[NMSSHChannel closeChannel](self, "closeChannel");
  v41 = 0;
  v36 = v51;
LABEL_30:

  return v41;
}

- (void)executeCommandAsynchronously:(id)a3
{
  void *v4;
  void *v5;
  _LIBSSH2_CHANNEL *v6;
  id v7;
  const void *v8;
  unsigned int v9;
  id v10;

  v10 = a3;
  +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Exec command %@"), v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logInfo:", v5);

  if (-[NMSSHChannel openChannel:](self, "openChannel:", 0))
  {
    libssh2_channel_set_blocking((uint64_t)-[NMSSHChannel channel](self, "channel"), 0);
    v6 = -[NMSSHChannel channel](self, "channel");
    v7 = objc_retainAutorelease(v10);
    v8 = (const void *)objc_msgSend(v7, "UTF8String");
    v9 = strlen((const char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String"));
    libssh2_channel_process_startup((uint64_t)v6, "exec", 4u, v8, v9);
    libssh2_channel_set_blocking((uint64_t)-[NMSSHChannel channel](self, "channel"), 1);
  }

}

- (BOOL)startShell:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uintptr_t Native;
  NSObject *v10;
  dispatch_source_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  int v16;
  CFSocketNativeHandle v17;
  void *v18;
  BOOL v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v30[5];
  _QWORD handler[5];
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x24BDAC8D0];
  +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Starting shell"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logInfo:", v6);

  if (!-[NMSSHChannel openChannel:](self, "openChannel:", a3))
    return 0;
  -[NMSSHChannel session](self, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  libssh2_session_set_blocking(objc_msgSend(v7, "rawSession"), 0);

  -[NMSSHChannel setLastResponse:](self, "setLastResponse:", 0);
  -[NMSSHChannel session](self, "session");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  Native = CFSocketGetNative((CFSocketRef)objc_msgSend(v8, "socket"));
  dispatch_get_global_queue(2, 0);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = dispatch_source_create(MEMORY[0x24BDACA00], Native, 0, v10);
  -[NMSSHChannel setSource:](self, "setSource:", v11);

  -[NMSSHChannel source](self, "source");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __27__NMSSHChannel_startShell___block_invoke;
  handler[3] = &unk_24F8BB638;
  handler[4] = self;
  dispatch_source_set_event_handler(v12, handler);

  -[NMSSHChannel source](self, "source");
  v14 = objc_claimAutoreleasedReturnValue();
  v30[0] = v13;
  v30[1] = 3221225472;
  v30[2] = __27__NMSSHChannel_startShell___block_invoke_2;
  v30[3] = &unk_24F8BB638;
  v30[4] = self;
  dispatch_source_set_cancel_handler(v14, v30);

  -[NMSSHChannel source](self, "source");
  v15 = objc_claimAutoreleasedReturnValue();
  dispatch_resume(v15);
  while (1)
  {

    v16 = libssh2_channel_process_startup((uint64_t)-[NMSSHChannel channel](self, "channel"), "shell", 5u, 0, 0);
    if (v16 != -37)
      break;
    -[NMSSHChannel session](self, "session");
    v15 = objc_claimAutoreleasedReturnValue();
    v17 = CFSocketGetNative((CFSocketRef)-[NSObject socket](v15, "socket"));
    -[NMSSHChannel session](self, "session");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    waitsocket(v17, objc_msgSend(v18, "rawSession"));

  }
  v20 = v16;
  v19 = v16 == 0;
  +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Shell request error"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "logError:", v22);

    if (a3)
    {
      v23 = (void *)MEMORY[0x24BDD1540];
      v32 = *MEMORY[0x24BDD0FC8];
      -[NMSSHChannel session](self, "session");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "lastError");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "localizedDescription");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = v26;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("NMSSH"), 5, v27);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    -[NMSSHChannel closeShell](self, "closeShell");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Shell allocated"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "logVerbose:", v28);

    -[NMSSHChannel setType:](self, "setType:", 2);
  }
  return v19;
}

- (void)closeShell
{
  void *v3;
  NSObject *v4;
  void *v5;

  -[NMSSHChannel source](self, "source");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NMSSHChannel source](self, "source");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v4);

  }
  if (-[NMSSHChannel type](self, "type") == 2)
  {
    -[NMSSHChannel session](self, "session");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    libssh2_session_set_blocking(objc_msgSend(v5, "rawSession"), 1);

    -[NMSSHChannel sendEOF](self, "sendEOF");
  }
  -[NMSSHChannel closeChannel](self, "closeChannel");
}

- (BOOL)write:(id)a3 error:(id *)a4
{
  return -[NMSSHChannel write:error:timeout:](self, "write:error:timeout:", a3, a4, &unk_24F93A400);
}

- (BOOL)write:(id)a3 error:(id *)a4 timeout:(id)a5
{
  id v8;
  void *v9;

  v8 = a5;
  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[NMSSHChannel writeData:error:timeout:](self, "writeData:error:timeout:", v9, a4, v8);

  return (char)a4;
}

- (BOOL)writeData:(id)a3 error:(id *)a4
{
  return -[NMSSHChannel writeData:error:timeout:](self, "writeData:error:timeout:", a3, a4, &unk_24F93A400);
}

- (BOOL)writeData:(id)a3 error:(id *)a4 timeout:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  double Current;
  double v13;
  void *v14;
  BOOL v15;
  _QWORD v17[5];
  id v18;
  uint64_t *v19;
  double v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v8 = a3;
  v9 = a5;
  if (-[NMSSHChannel openChannel:](self, "openChannel:", a4))
  {
    +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Writing %lu bytes"), objc_msgSend(v8, "length"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "logVerbose:", v11);

    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__14600;
    v25 = __Block_byref_object_dispose__14601;
    v26 = 0;
    Current = CFAbsoluteTimeGetCurrent();
    objc_msgSend(v9, "doubleValue");
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __40__NMSSHChannel_writeData_error_timeout___block_invoke;
    v17[3] = &unk_24F8B3120;
    v17[4] = self;
    v20 = Current + v13;
    v18 = v9;
    v19 = &v21;
    objc_msgSend(v8, "enumerateByteRangesUsingBlock:", v17);
    v14 = (void *)v22[5];
    v15 = v14 == 0;
    if (a4 && v14)
      *a4 = objc_retainAutorelease(v14);

    _Block_object_dispose(&v21, 8);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)requestSizeWidth:(unint64_t)a3 height:(unint64_t)a4
{
  uint64_t v4;
  void *v5;
  void *v6;

  v4 = libssh2_channel_request_pty_size_ex((uint64_t)-[NMSSHChannel channel](self, "channel"), a3, a4, 0, 0);
  if ((_DWORD)v4)
  {
    +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Request size failed with error %i"), v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "logError:", v6);

  }
  return (_DWORD)v4 == 0;
}

- (BOOL)uploadFile:(id)a3 to:(id)a4
{
  return -[NMSSHChannel uploadFile:to:progress:](self, "uploadFile:to:progress:", a3, a4, 0);
}

- (BOOL)uploadFile:(id)a3 to:(id)a4 progress:(id)a5
{
  id v8;
  id v9;
  unsigned int (**v10)(id, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  FILE *v18;
  FILE *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  size_t v25;
  uint64_t v26;
  size_t v27;
  BOOL v28;
  unint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _BOOL4 v39;
  _QWORD v41[2];
  id v42;
  id v43;
  stat v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (unsigned int (**)(id, _QWORD))a5;
  if (-[NMSSHChannel channel](self, "channel"))
  {
    +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The channel will be closed before continue"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "logWarn:", v12);

    if (-[NMSSHChannel type](self, "type") == 2)
      -[NMSSHChannel closeShell](self, "closeShell");
    else
      -[NMSSHChannel closeChannel](self, "closeChannel");
  }
  objc_msgSend(v8, "stringByExpandingTildeInPath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "hasSuffix:", CFSTR("/")))
  {
    objc_msgSend(v13, "componentsSeparatedByString:", CFSTR("/"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "lastObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByAppendingString:", v15);
    v16 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v16;
  }
  v17 = objc_retainAutorelease(v13);
  v18 = fopen((const char *)objc_msgSend(v17, "UTF8String"), "rb");
  if (!v18)
  {
    +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Can't read local file"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "logError:", v34);

LABEL_19:
    v28 = 0;
    goto LABEL_24;
  }
  v19 = v18;
  -[NMSSHChannel session](self, "session");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  libssh2_session_set_blocking(objc_msgSend(v20, "rawSession"), 1);

  memset(&v44, 0, sizeof(v44));
  stat((const char *)objc_msgSend(objc_retainAutorelease(v17), "UTF8String"), &v44);
  -[NMSSHChannel session](self, "session");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "rawSession");
  v23 = (char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
  v24 = libssh2_scp_send64(v22, v23, v44.st_mode & 0x1A4, v44.st_size, 0, 0);

  if (!v24)
  {
    +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unable to open SCP session"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "logError:", v36);

    fclose(v19);
    goto LABEL_19;
  }
  v42 = v17;
  v43 = v9;
  -[NMSSHChannel setChannel:](self, "setChannel:", v24);
  -[NMSSHChannel setType:](self, "setType:", 3);
  v25 = -[NMSSHChannel bufferSize](self, "bufferSize");
  v41[1] = v41;
  v26 = 0;
LABEL_10:
  v27 = fread((char *)v41 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0), 1uLL, v25, v19);
  v28 = v27 == 0;
  if (v27)
  {
    v29 = v27;
    v30 = (char *)v41 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
    while (1)
    {
      v31 = libssh2_channel_write_ex((uint64_t)-[NMSSHChannel channel](self, "channel"), 0, v30, v29);
      if (v31 < 0)
        break;
      v32 = v31;
      v26 += v31;
      if (v10 && !v10[2](v10, v26))
        goto LABEL_21;
      v30 += v32;
      v29 -= v32;
      if (!v29)
        goto LABEL_10;
    }
    +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed writing file"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "logError:", v38);

    v28 = 0;
    v9 = v43;
  }
  else
  {
LABEL_21:
    fclose(v19);
    v39 = -[NMSSHChannel sendEOF](self, "sendEOF");
    v9 = v43;
    if (v39)
      -[NMSSHChannel waitEOF](self, "waitEOF");
  }
  v17 = v42;
  -[NMSSHChannel closeChannel](self, "closeChannel");
LABEL_24:

  return v28;
}

- (BOOL)downloadFile:(id)a3 to:(id)a4
{
  return -[NMSSHChannel downloadFile:to:progress:](self, "downloadFile:to:progress:", a3, a4, 0);
}

- (BOOL)downloadFile:(id)a3 to:(id)a4 progress:(id)a5
{
  id v8;
  id v9;
  uint64_t (**v10)(id, uint64_t, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;
  unint64_t v30;
  size_t v31;
  char *v32;
  unint64_t v33;
  int64_t v34;
  int64_t v35;
  BOOL v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (uint64_t (**)(id, uint64_t, _QWORD))a5;
  if (-[NMSSHChannel channel](self, "channel"))
  {
    +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("The channel will be closed before continue"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "logWarn:", v12);

    if (-[NMSSHChannel type](self, "type") == 2)
      -[NMSSHChannel closeShell](self, "closeShell");
    else
      -[NMSSHChannel closeChannel](self, "closeChannel");
  }
  objc_msgSend(v9, "stringByExpandingTildeInPath");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "hasSuffix:", CFSTR("/")))
  {
    objc_msgSend(v8, "componentsSeparatedByString:", CFSTR("/"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "lastObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringByAppendingString:", v15);
    v16 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v16;
  }
  -[NMSSHChannel session](self, "session");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  libssh2_session_set_blocking(objc_msgSend(v17, "rawSession"), 1);

  v46 = 0u;
  v47 = 0u;
  v45 = 0u;
  -[NMSSHChannel session](self, "session", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "rawSession");
  v20 = objc_retainAutorelease(v8);
  libssh2_scp_recv(v19, (char *)objc_msgSend(v20, "UTF8String"), (uint64_t)&v44);
  v22 = v21;

  if (!v22)
  {
    +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unable to open SCP session"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "logError:", v38);

    goto LABEL_28;
  }
  -[NMSSHChannel setChannel:](self, "setChannel:", v22);
  -[NMSSHChannel setType:](self, "setType:", 3);
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "fileExistsAtPath:", v13);

  if (v24)
  {
    +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("A file already exists at %@, it will be overwritten"), v13);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "logInfo:", v26);

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "removeItemAtPath:error:", v13, 0);

  }
  v28 = open((const char *)objc_msgSend(objc_retainAutorelease(v13), "UTF8String"), 513, 420);
  if ((uint64_t)v45 < 1)
  {
LABEL_22:
    close(v28);
    -[NMSSHChannel closeChannel](self, "closeChannel");
    v36 = 1;
    goto LABEL_29;
  }
  v29 = 0;
  while (1)
  {
    v30 = -[NMSSHChannel bufferSize](self, "bufferSize");
    v31 = v30;
    v32 = (char *)&v44 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
    v33 = (uint64_t)v45 - v29 >= v30 ? v30 : v45 - v29;
    v34 = libssh2_channel_read_ex((uint64_t)-[NMSSHChannel channel](self, "channel"), 0, (uint64_t)v32, v33);
    v35 = v34;
    if (v34 < 1)
      break;
    if (write(v28, v32, v34) < (unint64_t)v34)
    {
      +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = (void *)MEMORY[0x24BDD17C8];
      v41 = CFSTR("Failed to write to local file");
      goto LABEL_26;
    }
    v29 += v35;
    if (v10 && (v10[2](v10, v29, v45) & 1) == 0)
      goto LABEL_27;
LABEL_21:
    bzero(v32, v31);
    if (v29 >= (uint64_t)v45)
      goto LABEL_22;
  }
  if ((v34 & 0x8000000000000000) == 0)
    goto LABEL_21;
  +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)MEMORY[0x24BDD17C8];
  v41 = CFSTR("Failed to read SCP data");
LABEL_26:
  objc_msgSend(v40, "stringWithFormat:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "logError:", v42);

LABEL_27:
  close(v28);
  -[NMSSHChannel closeChannel](self, "closeChannel");
LABEL_28:
  v36 = 0;
LABEL_29:

  return v36;
}

- (NMSSHSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (unint64_t)bufferSize
{
  return self->_bufferSize;
}

- (void)setBufferSize:(unint64_t)a3
{
  self->_bufferSize = a3;
}

- (NMSSHChannelDelegate)delegate
{
  return (NMSSHChannelDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSData)lastResponse
{
  return self->_lastResponse;
}

- (void)setLastResponse:(id)a3
{
  objc_storeStrong((id *)&self->_lastResponse, a3);
}

- (BOOL)requestPty
{
  return self->_requestPty;
}

- (void)setRequestPty:(BOOL)a3
{
  self->_requestPty = a3;
}

- (int64_t)ptyTerminalType
{
  return self->_ptyTerminalType;
}

- (void)setPtyTerminalType:(int64_t)a3
{
  self->_ptyTerminalType = a3;
}

- (NSDictionary)environmentVariables
{
  return self->_environmentVariables;
}

- (void)setEnvironmentVariables:(id)a3
{
  objc_storeStrong((id *)&self->_environmentVariables, a3);
}

- (_LIBSSH2_CHANNEL)channel
{
  return self->_channel;
}

- (void)setChannel:(_LIBSSH2_CHANNEL *)a3
{
  self->_channel = a3;
}

- (void)setPtyTerminalName:(const char *)a3
{
  self->_ptyTerminalName = a3;
}

- (OS_dispatch_source)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  objc_storeStrong((id *)&self->_source, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_environmentVariables, 0);
  objc_storeStrong((id *)&self->_lastResponse, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_session, 0);
}

void __40__NMSSHChannel_writeData_error_timeout___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, _BYTE *a5)
{
  unint64_t v6;
  uint64_t v9;
  uint64_t v10;
  double v11;
  void *v12;
  CFSocketNativeHandle Native;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x24BDAC8D0];
  if (a4)
  {
    v6 = a4;
    v9 = 0;
    while (1)
    {
      while (1)
      {
        v10 = libssh2_channel_write_ex(objc_msgSend(*(id *)(a1 + 32), "channel"), 0, (const void *)(a2 + v9), v6);
        if (v10 != -37)
          break;
        if (objc_msgSend(*(id *)(a1 + 40), "longValue") >= 1)
        {
          v11 = *(double *)(a1 + 56);
          if (v11 < CFAbsoluteTimeGetCurrent())
          {
            v15 = (void *)MEMORY[0x24BDD1540];
            v32 = *MEMORY[0x24BDD0FC8];
            v33[0] = CFSTR("Connection timed out");
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("NMSSH"), 3, v16);
            v17 = objc_claimAutoreleasedReturnValue();
            v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
            v19 = *(void **)(v18 + 40);
            *(_QWORD *)(v18 + 40) = v17;

            if (!a5)
              return;
            goto LABEL_11;
          }
        }
        objc_msgSend(*(id *)(a1 + 32), "session");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        Native = CFSocketGetNative((CFSocketRef)objc_msgSend(v12, "socket"));
        objc_msgSend(*(id *)(a1 + 32), "session");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        waitsocket(Native, objc_msgSend(v14, "rawSession"));

      }
      if (v10 < 0)
        break;
      v9 += v10;
      v6 -= v10;
      if (!v6)
        return;
    }
    +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error writing"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "logError:", v21);

    v22 = (void *)MEMORY[0x24BDD1540];
    v30 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(*(id *)(a1 + 32), "session");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "lastError");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "localizedDescription");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v25;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("NMSSH"), 6, v26);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v29 = *(void **)(v28 + 40);
    *(_QWORD *)(v28 + 40) = v27;

    if (a5)
LABEL_11:
      *a5 = 1;
  }
}

void __27__NMSSHChannel_startShell___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  unint64_t v4;
  char *v5;
  int64_t v6;
  int64_t v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  void *v38;
  void *v39;
  char *v40;
  char *v41;
  char *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Data available on the socket!"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logVerbose:", v3);

  v4 = objc_msgSend(*(id *)(a1 + 32), "bufferSize");
  v5 = (char *)&v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!objc_msgSend(*(id *)(a1 + 32), "channel"))
    return;
  v40 = sel_channel_didReadError_;
  v41 = sel_channel_didReadRawError_;
  v42 = sel_channel_didReadData_;
  while (1)
  {
    v6 = libssh2_channel_read_ex(objc_msgSend(*(id *)(a1 + 32), "channel", v40, v41, v42), 0, (uint64_t)v5, v4);
    v7 = libssh2_channel_read_ex(objc_msgSend(*(id *)(a1 + 32), "channel"), 1, (uint64_t)v5, v4);
    v8 = v7;
    if (v6 < 0 && v7 < 0)
      break;
    if (v6 >= 1)
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", v5, v6);
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v9, 4);
      v11 = *(void **)(a1 + 32);
      v12 = (void *)objc_msgSend(v10, "copy");
      objc_msgSend(v11, "setLastResponse:", v12);

      if (v10)
      {
        objc_msgSend(*(id *)(a1 + 32), "delegate");
        v13 = objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = (void *)v13;
          objc_msgSend(*(id *)(a1 + 32), "delegate");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_opt_respondsToSelector();

          if ((v16 & 1) != 0)
          {
            objc_msgSend(*(id *)(a1 + 32), "delegate");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = *(void **)(a1 + 32);
            objc_msgSend(v18, "lastResponse");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "channel:didReadData:", v18, v19);

          }
        }
      }
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v20 = objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        v21 = (void *)v20;
        objc_msgSend(*(id *)(a1 + 32), "delegate");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_opt_respondsToSelector();

        if ((v23 & 1) != 0)
        {
          objc_msgSend(*(id *)(a1 + 32), "delegate");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "channel:didReadRawData:", *(_QWORD *)(a1 + 32), v9);
          goto LABEL_21;
        }
      }
      goto LABEL_22;
    }
    if (v7 >= 1)
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", v5, v7);
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v9, 4);
      if (v10)
      {
        objc_msgSend(*(id *)(a1 + 32), "delegate");
        v25 = objc_claimAutoreleasedReturnValue();
        if (v25)
        {
          v26 = (void *)v25;
          objc_msgSend(*(id *)(a1 + 32), "delegate");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_opt_respondsToSelector();

          if ((v28 & 1) != 0)
          {
            objc_msgSend(*(id *)(a1 + 32), "delegate");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "channel:didReadError:", *(_QWORD *)(a1 + 32), v10);

          }
        }
      }
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v30 = objc_claimAutoreleasedReturnValue();
      if (v30)
      {
        v31 = (void *)v30;
        objc_msgSend(*(id *)(a1 + 32), "delegate");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_opt_respondsToSelector();

        if ((v33 & 1) != 0)
        {
          objc_msgSend(*(id *)(a1 + 32), "delegate");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "channel:didReadRawError:", *(_QWORD *)(a1 + 32), v9);
LABEL_21:

        }
      }
LABEL_22:

      goto LABEL_23;
    }
    if (libssh2_channel_eof(objc_msgSend(*(id *)(a1 + 32), "channel")) == 1)
    {
      +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (void *)MEMORY[0x24BDD17C8];
      v36 = CFSTR("Host EOF received, closing channel...");
LABEL_30:
      objc_msgSend(v35, "stringWithFormat:", v36);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "logVerbose:", v39);

      objc_msgSend(*(id *)(a1 + 32), "closeShell");
      return;
    }
LABEL_23:
    if (!objc_msgSend(*(id *)(a1 + 32), "channel"))
      return;
  }
  +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Return code of response %ld, error %ld"), v6, v8);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "logVerbose:", v38);

  if (v6 == -43 || v8 == -43)
  {
    +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)MEMORY[0x24BDD17C8];
    v36 = CFSTR("Error received, closing channel...");
    goto LABEL_30;
  }
}

void __27__NMSSHChannel_startShell___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  id v8;

  +[NMSSHLogger sharedLogger](NMSSHLogger, "sharedLogger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Shell source cancelled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logVerbose:", v3);

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "channelShellDidClose:", *(_QWORD *)(a1 + 32));

    }
  }
}

@end
