@implementation DOCErrorStore

+ (id)augmentedErrorForError:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  int v12;
  const __CFString *v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  int v18;
  NSObject **v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDD1128]);

  if (v6)
  {
    v7 = objc_msgSend(v4, "code");
    if (v7 > 56)
    {
      if (v7 == 57)
      {
        _DocumentManagerBundle();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("POSIX.ENOTCONN.title"), CFSTR("There was a problem connecting to the server."), CFSTR("LocalizableErrors"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        _DocumentManagerBundle();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("POSIX.ENOTCONN.recovery"), CFSTR("Check the server name or IP address, and then try again. If you continue to have problems, contact your system administrator."), CFSTR("LocalizableErrors"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_augmentedErrorForError:localizedDescription:recoverySuggestion:", v4, v22, v24);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_28:
        goto LABEL_29;
      }
      if (v7 == 80)
      {
        _DocumentManagerBundle();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        v10 = CFSTR("POSIX.EAUTH.title");
        v13 = CFSTR("You entered an invalid username or password for the server.");
        goto LABEL_27;
      }
    }
    else if (v7 == 5 || v7 == 9)
    {
      _DocumentManagerBundle();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = CFSTR("POSIX.EBADF.title");
LABEL_9:
      v13 = CFSTR("The operation can’t be completed because an unexpected error occurred.");
LABEL_27:
      objc_msgSend(v8, "localizedStringForKey:value:table:", v10, v13, CFSTR("LocalizableErrors"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_augmentedErrorForError:localizedDescription:recoverySuggestion:", v4, v25, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_28;
    }
  }
  else
  {
    objc_msgSend(v4, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0B88]);

    if (v12)
    {
      if (objc_msgSend(v4, "code") == 4097)
      {
        _DocumentManagerBundle();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        v10 = CFSTR("Cocoa.XPCConnectionInterrupted.title");
        goto LABEL_9;
      }
    }
    else
    {
      objc_msgSend(v4, "domain");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x24BDD1308]);

      if (v15)
      {
        v16 = objc_msgSend(v4, "code");
        if (v16 == -1000)
        {
          _DocumentManagerBundle();
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = v8;
          v10 = CFSTR("URL.BadURL.title");
          v13 = CFSTR("The operation can’t be completed because this URL is not valid.");
          goto LABEL_27;
        }
        if (v16 == -1002)
        {
          _DocumentManagerBundle();
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = v8;
          v10 = CFSTR("URL.UnsupportedURL.title");
          v13 = CFSTR("The operation can’t be completed because this URL is not supported.");
          goto LABEL_27;
        }
      }
      else
      {
        objc_msgSend(v4, "domain");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "isEqualToString:", *MEMORY[0x24BDC81B0]);

        if (v18 && objc_msgSend(v4, "code") == -2001)
        {
          _DocumentManagerBundle();
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = v8;
          v10 = CFSTR("FileProvider.ProviderNotFound.title");
          v13 = CFSTR("The file provider supporting this action is not available anymore");
          goto LABEL_27;
        }
      }
    }
  }
  v19 = (NSObject **)MEMORY[0x24BE2DF90];
  v20 = *MEMORY[0x24BE2DF90];
  if (!*MEMORY[0x24BE2DF90])
  {
    DOCInitLogging();
    v20 = *v19;
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    v27 = 138412290;
    v28 = v4;
    _os_log_impl(&dword_209052000, v20, OS_LOG_TYPE_INFO, "No replacement error found for error: %@", (uint8_t *)&v27, 0xCu);
  }
  v21 = 0;
LABEL_29:

  return v21;
}

+ (id)_augmentedErrorForError:(id)a3 localizedDescription:(id)a4 recoverySuggestion:(id)a5
{
  id v7;
  id v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  _QWORD v32[2];
  _QWORD v33[3];

  v33[2] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = (__CFString *)a5;
  v10 = (void *)MEMORY[0x24BDBCED8];
  v11 = *MEMORY[0x24BDD1398];
  v32[0] = *MEMORY[0x24BDD0FC8];
  v32[1] = v11;
  v33[0] = v8;
  v33[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryWithDictionary:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (DOCIsInternalBuild())
  {
    v14 = &stru_24C0F2058;
    if (v9)
      v15 = v9;
    else
      v15 = &stru_24C0F2058;
    v16 = objc_msgSend(v7, "code");
    objc_msgSend(v7, "userInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v7, "userInfo");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v31, "count"))
      {
        v18 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v7, "userInfo");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringWithFormat:", CFSTR("\n\n%@"), v30);
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v19 = 1;
      }
      else
      {
        v19 = 0;
      }
    }
    else
    {
      v19 = 0;
    }
    objc_msgSend(v7, "domain");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingFormat:](v15, "stringByAppendingFormat:", CFSTR("\n\n[INTERNAL BUILD]\nError %ld%@ (%@)"), v16, v14, v20);
    v21 = objc_claimAutoreleasedReturnValue();

    if (v19)
    {

    }
    if (v17)

    v9 = (__CFString *)v21;
  }
  if (v9)
    objc_msgSend(v13, "setObject:forKey:", v9, *MEMORY[0x24BDD0FF0]);
  objc_msgSend(v7, "localizedRecoveryOptions");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v7, "localizedRecoveryOptions");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v23, *MEMORY[0x24BDD0FE8]);

  }
  objc_msgSend(v7, "recoveryAttempter");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(v7, "recoveryAttempter");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v25, *MEMORY[0x24BDD11D0]);

  }
  v26 = (void *)MEMORY[0x24BDD1540];
  objc_msgSend(v7, "domain");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "errorWithDomain:code:userInfo:", v27, objc_msgSend(v7, "code"), v13);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

@end
