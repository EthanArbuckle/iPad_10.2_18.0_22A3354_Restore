@implementation DIDiskArb

+ (id)diskArbWithError:(id *)a3
{
  DIDiskArbEmulation *v3;

  v3 = -[DIDiskArb initWithError:]([DIDiskArb alloc], "initWithError:", 0);
  if (!v3)
    v3 = objc_alloc_init(DIDiskArbEmulation);
  return v3;
}

- (DIDiskArb)initWithError:(id *)a3
{
  DIDiskArb *v4;
  DIDiskArb *v5;
  __DASession *daSession;
  __CFRunLoop *Current;
  DIDiskArb *v8;
  DIDiskArb *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)DIDiskArb;
  v4 = -[DIDiskArb init](&v11, sel_init);
  v5 = v4;
  if (!v4)
    goto LABEL_5;
  if (!MEMORY[0x24BE2D060])
  {
    daSession = v4->_daSession;
    if (daSession)
      goto LABEL_4;
LABEL_7:
    +[DIError nilWithEnumValue:verboseInfo:error:](DIError, "nilWithEnumValue:verboseInfo:error:", 156, CFSTR("Failed DA init"), a3);
    v8 = (DIDiskArb *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  daSession = DASessionCreate(0);
  v5->_daSession = daSession;
  if (!daSession)
    goto LABEL_7;
LABEL_4:
  Current = CFRunLoopGetCurrent();
  DASessionScheduleWithRunLoop(daSession, Current, (CFStringRef)*MEMORY[0x24BDBD5A0]);
LABEL_5:
  v8 = v5;
LABEL_8:
  v9 = v8;

  return v9;
}

- (void)stop
{
  DIDiskArb *v2;
  __DASession *daSession;
  __CFRunLoop *Current;
  DIDiskArb *obj;

  obj = self;
  objc_sync_enter(obj);
  v2 = obj;
  daSession = obj->_daSession;
  if (daSession)
  {
    if (obj->_inputMountedOnURL || obj->_shadowMountedOnURLs)
    {
      MEMORY[0x2199A84C0](obj->_daSession, _diskDisappearedCallback);
      daSession = obj->_daSession;
    }
    Current = CFRunLoopGetCurrent();
    DASessionUnscheduleFromRunLoop(daSession, Current, (CFStringRef)*MEMORY[0x24BDBD5A0]);
    CFRelease(obj->_daSession);
    v2 = obj;
    obj->_daSession = 0;
  }
  objc_sync_exit(v2);

}

- (void)onDiskDisappearedWithDisk:(__DADisk *)a3
{
  CFDictionaryRef v5;
  void *v6;
  int v7;
  NSObject *v8;
  char *v9;
  int v10;
  NSObject *v11;
  char *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  int v19;
  NSObject *v20;
  void *v21;
  char *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  int v32;
  NSObject *v33;
  void *v34;
  char *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  uint8_t *v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  uint8_t v46[128];
  uint8_t buf[4];
  int v48;
  __int16 v49;
  const char *v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  if (-[DIDiskArb daSession](self, "daSession"))
  {
    v5 = DADiskCopyDescription(a3);
    -[__CFDictionary objectForKey:](v5, "objectForKey:", *MEMORY[0x24BE2D080]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (DIDebugLogsEnabled())
    {
      v7 = *__error();
      if (DIForwardLogs())
      {
        v45 = 0;
        getDIOSLog();
        v8 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
        *(_DWORD *)buf = 68158210;
        v48 = 39;
        v49 = 2080;
        v50 = "-[DIDiskArb onDiskDisappearedWithDisk:]";
        v51 = 2114;
        v52 = v6;
        LODWORD(v40) = 28;
        v39 = buf;
        v9 = (char *)_os_log_send_and_compose_impl();

        if (v9)
        {
          fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v9);
          free(v9);
        }
      }
      else
      {
        getDIOSLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 68158210;
          v48 = 39;
          v49 = 2080;
          v50 = "-[DIDiskArb onDiskDisappearedWithDisk:]";
          v51 = 2114;
          v52 = v6;
          _os_log_impl(&dword_212EB0000, v14, OS_LOG_TYPE_DEBUG, "%.*s: Reached with diskURL=%{public}@", buf, 0x1Cu);
        }

      }
      *__error() = v7;
    }
    if (v6)
    {
      -[DIDiskArb inputMountedOnURL](self, "inputMountedOnURL");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v16 = (void *)v15;
        -[DIDiskArb inputMountedOnURL](self, "inputMountedOnURL");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v6, "isEqual:", v17);

        if (v18)
        {
          v19 = *__error();
          if (DIForwardLogs())
          {
            v45 = 0;
            getDIOSLog();
            v20 = objc_claimAutoreleasedReturnValue();
            os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
            objc_msgSend(v6, "path", v39, v40);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 68158211;
            v48 = 39;
            v49 = 2080;
            v50 = "-[DIDiskArb onDiskDisappearedWithDisk:]";
            v51 = 2113;
            v52 = v21;
            LODWORD(v40) = 28;
            v39 = buf;
            v22 = (char *)_os_log_send_and_compose_impl();

            if (v22)
            {
              fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v22);
              free(v22);
            }
          }
          else
          {
            getDIOSLog();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v6, "path");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 68158211;
              v48 = 39;
              v49 = 2080;
              v50 = "-[DIDiskArb onDiskDisappearedWithDisk:]";
              v51 = 2113;
              v52 = v24;
              _os_log_impl(&dword_212EB0000, v23, OS_LOG_TYPE_ERROR, "%.*s: Mount point %{private}@ disappeared", buf, 0x1Cu);

            }
          }
          *__error() = v19;
          -[DIDiskArb delegate](self, "delegate");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "onDisappearedMountPoint");

        }
      }
      -[DIDiskArb shadowMountedOnURLs](self, "shadowMountedOnURLs", v39, v40);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        v43 = 0u;
        v44 = 0u;
        v41 = 0u;
        v42 = 0u;
        -[DIDiskArb shadowMountedOnURLs](self, "shadowMountedOnURLs");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
        if (v28)
        {
          v29 = v28;
          v30 = *(_QWORD *)v42;
          while (2)
          {
            for (i = 0; i != v29; ++i)
            {
              if (*(_QWORD *)v42 != v30)
                objc_enumerationMutation(v27);
              if (objc_msgSend(v6, "isEqual:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i)))
              {
                v32 = *__error();
                if (DIForwardLogs())
                {
                  v45 = 0;
                  getDIOSLog();
                  v33 = objc_claimAutoreleasedReturnValue();
                  os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);
                  objc_msgSend(v6, "path");
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 68158211;
                  v48 = 39;
                  v49 = 2080;
                  v50 = "-[DIDiskArb onDiskDisappearedWithDisk:]";
                  v51 = 2113;
                  v52 = v34;
                  v35 = (char *)_os_log_send_and_compose_impl();

                  if (v35)
                  {
                    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v35);
                    free(v35);
                  }
                }
                else
                {
                  getDIOSLog();
                  v36 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
                  {
                    objc_msgSend(v6, "path");
                    v37 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 68158211;
                    v48 = 39;
                    v49 = 2080;
                    v50 = "-[DIDiskArb onDiskDisappearedWithDisk:]";
                    v51 = 2113;
                    v52 = v37;
                    _os_log_impl(&dword_212EB0000, v36, OS_LOG_TYPE_ERROR, "%.*s: Mount point %{private}@ disappeared (shadow's mount point)", buf, 0x1Cu);

                  }
                }
                *__error() = v32;
                -[DIDiskArb delegate](self, "delegate");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v38, "onDisappearedMountPoint");

                goto LABEL_44;
              }
            }
            v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
            if (v29)
              continue;
            break;
          }
        }
LABEL_44:

      }
    }

  }
  else
  {
    v10 = *__error();
    if (DIForwardLogs())
    {
      v45 = 0;
      getDIOSLog();
      v11 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      *(_DWORD *)buf = 68157954;
      v48 = 39;
      v49 = 2080;
      v50 = "-[DIDiskArb onDiskDisappearedWithDisk:]";
      v12 = (char *)_os_log_send_and_compose_impl();

      if (v12)
      {
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v12);
        free(v12);
      }
    }
    else
    {
      getDIOSLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68157954;
        v48 = 39;
        v49 = 2080;
        v50 = "-[DIDiskArb onDiskDisappearedWithDisk:]";
        _os_log_impl(&dword_212EB0000, v13, OS_LOG_TYPE_DEFAULT, "%.*s: Ignoring, during shutdown", buf, 0x12u);
      }

    }
    *__error() = v10;
  }
}

- (BOOL)waitForDAIdleWithError:(id *)a3
{
  int v4;
  NSObject *v5;
  char *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  NSObject *v12;
  char *v13;
  NSObject *v14;
  uint8_t *v16;
  uint64_t v17;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = *__error();
  if (DIForwardLogs())
  {
    getDIOSLog();
    v5 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68157954;
    v19 = 36;
    v20 = 2080;
    v21 = "-[DIDiskArb waitForDAIdleWithError:]";
    LODWORD(v17) = 18;
    v16 = buf;
    v6 = (char *)_os_log_send_and_compose_impl();

    if (v6)
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v6);
      free(v6);
    }
  }
  else
  {
    getDIOSLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68157954;
      v19 = 36;
      v20 = 2080;
      v21 = "-[DIDiskArb waitForDAIdleWithError:]";
      _os_log_impl(&dword_212EB0000, v7, OS_LOG_TYPE_DEFAULT, "%.*s: Waiting for disk arbitration idle", buf, 0x12u);
    }

  }
  *__error() = v4;
  -[DIDiskArb setCallbackReached:](self, "setCallbackReached:", 0);
  -[DIDiskArb daSession](self, "daSession");
  DARegisterIdleCallback();
  objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[DIDiskArb callbackReached](self, "callbackReached"))
  {
    v9 = *MEMORY[0x24BDBCA90];
    do
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 1.0, v16, v17);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "runMode:beforeDate:", v9, v10);

    }
    while (!-[DIDiskArb callbackReached](self, "callbackReached"));
  }
  MEMORY[0x2199A84C0](-[DIDiskArb daSession](self, "daSession", v16), _idleCallback, self);
  v11 = *__error();
  if (DIForwardLogs())
  {
    getDIOSLog();
    v12 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68157954;
    v19 = 36;
    v20 = 2080;
    v21 = "-[DIDiskArb waitForDAIdleWithError:]";
    v13 = (char *)_os_log_send_and_compose_impl();

    if (v13)
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v13);
      free(v13);
    }
  }
  else
  {
    getDIOSLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68157954;
      v19 = 36;
      v20 = 2080;
      v21 = "-[DIDiskArb waitForDAIdleWithError:]";
      _os_log_impl(&dword_212EB0000, v14, OS_LOG_TYPE_DEFAULT, "%.*s: Disk arbitration idle callback received", buf, 0x12u);
    }

  }
  *__error() = v11;

  return 1;
}

- (void)addDisappearedCallbackWithMountPoint:(id)a3 shadowMountPoints:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  int v11;
  NSObject *v12;
  void *v13;
  char *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  int v23;
  NSObject *v24;
  void *v25;
  char *v26;
  NSObject *v27;
  void *v28;
  uint8_t *v29;
  uint8_t *v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  id v34;
  DIDiskArb *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  uint8_t v42[128];
  uint8_t buf[4];
  int v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    -[DIDiskArb setInputMountedOnURL:](self, "setInputMountedOnURL:", v8);
    v34 = v9;
    -[DIDiskArb setShadowMountedOnURLs:](self, "setShadowMountedOnURLs:", v9);
    v33 = v10;
    -[DIDiskArb setDelegate:](self, "setDelegate:", v10);
    v11 = *__error();
    if (DIForwardLogs())
    {
      v41 = 0;
      getDIOSLog();
      v12 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      objc_msgSend(v8, "path");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 68158211;
      v44 = 77;
      v45 = 2080;
      v46 = "-[DIDiskArb addDisappearedCallbackWithMountPoint:shadowMountPoints:delegate:]";
      v47 = 2113;
      v48 = v13;
      LODWORD(v31) = 28;
      v29 = buf;
      v14 = (char *)_os_log_send_and_compose_impl();

      if (v14)
      {
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v14);
        free(v14);
      }
    }
    else
    {
      getDIOSLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v8, "path");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 68158211;
        v44 = 77;
        v45 = 2080;
        v46 = "-[DIDiskArb addDisappearedCallbackWithMountPoint:shadowMountPoints:delegate:]";
        v47 = 2113;
        v48 = v16;
        _os_log_impl(&dword_212EB0000, v15, OS_LOG_TYPE_DEFAULT, "%.*s: Registering DiskDisappearedCallback for %{private}@", buf, 0x1Cu);

      }
    }
    v36 = v8;
    *__error() = v11;
  }
  else
  {
    if (!objc_msgSend(v9, "count"))
      goto LABEL_25;
    v36 = 0;
    -[DIDiskArb setInputMountedOnURL:](self, "setInputMountedOnURL:", 0);
    v34 = v9;
    -[DIDiskArb setShadowMountedOnURLs:](self, "setShadowMountedOnURLs:", v9);
    v33 = v10;
    -[DIDiskArb setDelegate:](self, "setDelegate:", v10);
  }
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v35 = self;
  -[DIDiskArb shadowMountedOnURLs](self, "shadowMountedOnURLs", v29, v31);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v38 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        v23 = *__error();
        if (DIForwardLogs())
        {
          v41 = 0;
          getDIOSLog();
          v24 = objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
          objc_msgSend(v22, "path", v30, v32);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 68158211;
          v44 = 77;
          v45 = 2080;
          v46 = "-[DIDiskArb addDisappearedCallbackWithMountPoint:shadowMountPoints:delegate:]";
          v47 = 2113;
          v48 = v25;
          LODWORD(v32) = 28;
          v30 = buf;
          v26 = (char *)_os_log_send_and_compose_impl();

          if (v26)
          {
            fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v26);
            free(v26);
          }
        }
        else
        {
          getDIOSLog();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v22, "path");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 68158211;
            v44 = 77;
            v45 = 2080;
            v46 = "-[DIDiskArb addDisappearedCallbackWithMountPoint:shadowMountPoints:delegate:]";
            v47 = 2113;
            v48 = v28;
            _os_log_impl(&dword_212EB0000, v27, OS_LOG_TYPE_DEFAULT, "%.*s: Registering DiskDisappearedCallback for %{private}@ (shadow's mount point)", buf, 0x1Cu);

          }
        }
        *__error() = v23;
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v19);
  }

  DARegisterDiskDisappearedCallback(-[DIDiskArb daSession](v35, "daSession"), 0, (DADiskDisappearedCallback)_diskDisappearedCallback, v35);
  v8 = v36;
  v10 = v33;
  v9 = v34;
LABEL_25:

}

- (BOOL)ejectWithBSDName:(id)a3 error:(id *)a4
{
  id v6;
  int v7;
  NSObject *v8;
  char *v9;
  NSObject *v10;
  __DASession *v11;
  id v12;
  __DADisk *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  BOOL v18;
  int v19;
  NSObject *v20;
  char *v21;
  NSObject *v22;
  uint8_t *v24;
  uint64_t v25;
  uint8_t buf[4];
  int v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = *__error();
  if (DIForwardLogs())
  {
    getDIOSLog();
    v8 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68158210;
    v27 = 36;
    v28 = 2080;
    v29 = "-[DIDiskArb ejectWithBSDName:error:]";
    v30 = 2112;
    v31 = v6;
    LODWORD(v25) = 28;
    v24 = buf;
    v9 = (char *)_os_log_send_and_compose_impl();

    if (v9)
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v9);
      free(v9);
    }
  }
  else
  {
    getDIOSLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68158210;
      v27 = 36;
      v28 = 2080;
      v29 = "-[DIDiskArb ejectWithBSDName:error:]";
      v30 = 2112;
      v31 = v6;
      _os_log_impl(&dword_212EB0000, v10, OS_LOG_TYPE_DEFAULT, "%.*s: Ejecting %@", buf, 0x1Cu);
    }

  }
  *__error() = v7;
  v11 = -[DIDiskArb daSession](self, "daSession");
  v12 = objc_retainAutorelease(v6);
  v13 = DADiskCreateFromBSDName(0, v11, (const char *)objc_msgSend(v12, "fileSystemRepresentation"));
  if (v13)
  {
    -[DIDiskArb setCallbackReached:](self, "setCallbackReached:", 0);
    -[DIDiskArb setOperationError:](self, "setOperationError:", 0);
    DADiskEject(v13, 0, (DADiskEjectCallback)_daOperationCallback, self);
    objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[DIDiskArb callbackReached](self, "callbackReached"))
    {
      v15 = *MEMORY[0x24BDBCA90];
      do
      {
        objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 1.0, v24, v25);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "runMode:beforeDate:", v15, v16);

      }
      while (!-[DIDiskArb callbackReached](self, "callbackReached"));
    }
    -[DIDiskArb operationError](self, "operationError", v24);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = v17 == 0;
    if (v17)
    {
      if (a4)
      {
        -[DIDiskArb operationError](self, "operationError");
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v19 = *__error();
      if (DIForwardLogs())
      {
        getDIOSLog();
        v20 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
        *(_DWORD *)buf = 68158210;
        v27 = 36;
        v28 = 2080;
        v29 = "-[DIDiskArb ejectWithBSDName:error:]";
        v30 = 2112;
        v31 = v12;
        v21 = (char *)_os_log_send_and_compose_impl();

        if (v21)
        {
          fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v21);
          free(v21);
        }
      }
      else
      {
        getDIOSLog();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68158210;
          v27 = 36;
          v28 = 2080;
          v29 = "-[DIDiskArb ejectWithBSDName:error:]";
          v30 = 2112;
          v31 = v12;
          _os_log_impl(&dword_212EB0000, v22, OS_LOG_TYPE_DEFAULT, "%.*s: %@ ejected successfully", buf, 0x1Cu);
        }

      }
      *__error() = v19;
    }

  }
  else
  {
    v18 = +[DIError failWithEnumValue:verboseInfo:error:](DIError, "failWithEnumValue:verboseInfo:error:", 156, CFSTR("Failed to create DADisk during eject"), a4);
  }

  return v18;
}

- (BOOL)unmountWithMountPoint:(id)a3 error:(id *)a4
{
  id v6;
  int v7;
  NSObject *v8;
  char *v9;
  NSObject *v10;
  const __CFURL *v11;
  __DADisk *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  BOOL v17;
  int v18;
  NSObject *v19;
  char *v20;
  NSObject *v21;
  uint8_t *v23;
  uint64_t v24;
  uint8_t buf[4];
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = *__error();
  if (DIForwardLogs())
  {
    getDIOSLog();
    v8 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68158211;
    v26 = 41;
    v27 = 2080;
    v28 = "-[DIDiskArb unmountWithMountPoint:error:]";
    v29 = 2113;
    v30 = v6;
    LODWORD(v24) = 28;
    v23 = buf;
    v9 = (char *)_os_log_send_and_compose_impl();

    if (v9)
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v9);
      free(v9);
    }
  }
  else
  {
    getDIOSLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68158211;
      v26 = 41;
      v27 = 2080;
      v28 = "-[DIDiskArb unmountWithMountPoint:error:]";
      v29 = 2113;
      v30 = v6;
      _os_log_impl(&dword_212EB0000, v10, OS_LOG_TYPE_DEFAULT, "%.*s: Unmounting %{private}@", buf, 0x1Cu);
    }

  }
  *__error() = v7;
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v6);
  v11 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  v12 = DADiskCreateFromVolumePath(0, -[DIDiskArb daSession](self, "daSession"), v11);
  if (v12)
  {
    -[DIDiskArb setCallbackReached:](self, "setCallbackReached:", 0);
    -[DIDiskArb setOperationError:](self, "setOperationError:", 0);
    DADiskUnmount(v12, 0, (DADiskUnmountCallback)_daOperationCallback, self);
    objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[DIDiskArb callbackReached](self, "callbackReached"))
    {
      v14 = *MEMORY[0x24BDBCA90];
      do
      {
        objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 1.0, v23, v24);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "runMode:beforeDate:", v14, v15);

      }
      while (!-[DIDiskArb callbackReached](self, "callbackReached"));
    }
    -[DIDiskArb operationError](self, "operationError", v23);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = v16 == 0;
    if (v16)
    {
      if (a4)
      {
        -[DIDiskArb operationError](self, "operationError");
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v18 = *__error();
      if (DIForwardLogs())
      {
        getDIOSLog();
        v19 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
        *(_DWORD *)buf = 68158211;
        v26 = 41;
        v27 = 2080;
        v28 = "-[DIDiskArb unmountWithMountPoint:error:]";
        v29 = 2113;
        v30 = v6;
        v20 = (char *)_os_log_send_and_compose_impl();

        if (v20)
        {
          fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v20);
          free(v20);
        }
      }
      else
      {
        getDIOSLog();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68158211;
          v26 = 41;
          v27 = 2080;
          v28 = "-[DIDiskArb unmountWithMountPoint:error:]";
          v29 = 2113;
          v30 = v6;
          _os_log_impl(&dword_212EB0000, v21, OS_LOG_TYPE_DEFAULT, "%.*s: %{private}@ unmounted successfully", buf, 0x1Cu);
        }

      }
      *__error() = v18;
    }

  }
  else
  {
    v17 = +[DIError failWithEnumValue:verboseInfo:error:](DIError, "failWithEnumValue:verboseInfo:error:", 156, CFSTR("Failed to create DADisk during unmount"), a4);
  }

  return v17;
}

- (id)copyDescriptionWithBSDName:(id)a3
{
  id v4;
  __DASession *v5;
  id v6;
  const char *v7;
  __DADisk *v8;
  __DADisk *v9;
  CFDictionaryRef v10;

  v4 = a3;
  v5 = -[DIDiskArb daSession](self, "daSession");
  v6 = objc_retainAutorelease(v4);
  v7 = (const char *)objc_msgSend(v6, "fileSystemRepresentation");

  v8 = DADiskCreateFromBSDName(0, v5, v7);
  v9 = v8;
  if (v8)
    v10 = DADiskCopyDescription(v8);
  else
    v10 = 0;

  return v10;
}

- (DIDisappearedMountPointDelegate)delegate
{
  return (DIDisappearedMountPointDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (__DASession)daSession
{
  return self->_daSession;
}

- (void)setDaSession:(__DASession *)a3
{
  self->_daSession = a3;
}

- (NSURL)inputMountedOnURL
{
  return self->_inputMountedOnURL;
}

- (void)setInputMountedOnURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)shadowMountedOnURLs
{
  return self->_shadowMountedOnURLs;
}

- (void)setShadowMountedOnURLs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)callbackReached
{
  return self->_callbackReached;
}

- (void)setCallbackReached:(BOOL)a3
{
  self->_callbackReached = a3;
}

- (NSError)operationError
{
  return self->_operationError;
}

- (void)setOperationError:(id)a3
{
  objc_storeStrong((id *)&self->_operationError, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationError, 0);
  objc_storeStrong((id *)&self->_shadowMountedOnURLs, 0);
  objc_storeStrong((id *)&self->_inputMountedOnURL, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
