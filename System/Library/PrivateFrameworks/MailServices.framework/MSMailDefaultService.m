@implementation MSMailDefaultService

- (void)setShouldLaunchMobileMail:(BOOL)a3
{
  self->_shouldLaunch = a3;
}

- (MSMailDefaultService)init
{
  MSMailDefaultService *v2;
  MSMailDefaultService *v3;
  MSMailDefaultService *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MSMailDefaultService;
  v2 = -[MSService init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_shouldLaunch = 1;
    v4 = v2;
  }

  return v3;
}

- (id)_createServiceOnQueue:(id)a3
{
  NSObject *v3;
  xpc_connection_t mach_service;

  v3 = a3;
  mach_service = xpc_connection_create_mach_service((const char *)objc_msgSend(CFSTR("com.apple.mobilemail.services.xpc"), "UTF8String"), v3, 0);

  return mach_service;
}

- (BOOL)_launchMobileMailSuspendedError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE2E680], "promise");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x24BE382B8];
  v12[0] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE38508], "sharedService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorOnlyCompletionHandlerAdapter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "openApplication:options:withResult:", *MEMORY[0x24BE666B8], v5, v7);

  objc_msgSend(v4, "future");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resultWithTimeout:error:", a3, 5.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = v9 != 0;

  return (char)a3;
}

- (id)_handleMessageSendFailure:(id)a3 message:(id)a4 messageIndex:(int64_t)a5 context:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  char v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  objc_super v27;
  uint8_t buf[4];
  MSMailDefaultService *v29;
  __int16 v30;
  int64_t v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  if (!a6)
    __assert_rtn("-[MSMailDefaultService _handleMessageSendFailure:message:messageIndex:context:]", "MSMailDefaultService.m", 63, "context && \"we have to have a context passed in\");
  v12 = *a6;
  if (!*a6)
  {
    v12 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    *a6 = v12;
  }
  v13 = v12;
  objc_msgSend(v13, "objectForKey:", CFSTR("launchedMail"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "BOOLValue");

  objc_msgSend(v13, "objectForKey:", CFSTR("elapsedTime"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "doubleValue");
  v18 = v17;

  if (v10 == (id)MEMORY[0x24BDACF38])
  {
    -[MSService stop](self, "stop");
    -[MSService start](self, "start");
  }
  else if (v10 == (id)MEMORY[0x24BDACF30] || v10 == (id)MEMORY[0x24BDACF48])
  {
    objc_msgSend(MEMORY[0x24BDD17F0], "sleepForTimeInterval:", 0.100000001);
  }
  if (!self->_shouldLaunch || !MKBDeviceUnlockedSinceBoot())
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MailServices"), 1, 0);
    v23 = objc_claimAutoreleasedReturnValue();
LABEL_24:
    v25 = (void *)v23;
    goto LABEL_25;
  }
  if ((v15 & 1) == 0)
  {
    if (-[MSMailDefaultService _launchMobileMailSuspendedError:](self, "_launchMobileMailSuspendedError:", 0))
    {
      objc_msgSend(v13, "setObject:forKey:", *MEMORY[0x24BDBD270], CFSTR("launchedMail"));
      MFLogGeneral();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        -[MSService _connection](self, "_connection");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v29 = self;
        v30 = 2048;
        v31 = a5;
        v32 = 2048;
        v33 = v24;
        v34 = 2048;
        v35 = v11;
        _os_log_impl(&dword_20AC30000, v21, OS_LOG_TYPE_INFO, "#MailServices %@ (%lld) : <connection: %p> launched Mail, message <dictionary: %p>", buf, 0x2Au);

      }
      goto LABEL_22;
    }
    goto LABEL_23;
  }
  if (v18 >= 5.0)
  {
LABEL_23:
    v27.receiver = self;
    v27.super_class = (Class)MSMailDefaultService;
    -[MSService _handleMessageSendFailure:message:messageIndex:context:](&v27, sel__handleMessageSendFailure_message_messageIndex_context_, v10, v11, a5, a6);
    v23 = objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }
  if (5.0 - v18 <= 0.5)
    v19 = 5.0 - v18;
  else
    v19 = 0.5;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v18 + v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKey:", v20, CFSTR("elapsedTime"));

  objc_msgSend(MEMORY[0x24BDD17F0], "sleepForTimeInterval:", v19);
  MFLogGeneral();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    -[MSService _connection](self, "_connection");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v29 = self;
    v30 = 2048;
    v31 = a5;
    v32 = 2048;
    v33 = v22;
    v34 = 2048;
    v35 = v11;
    _os_log_impl(&dword_20AC30000, v21, OS_LOG_TYPE_INFO, "#MailServices %@ (%lld) : <connection: %p> delayed send, message <dictionary: %p>", buf, 0x2Au);

  }
LABEL_22:

  v25 = 0;
LABEL_25:

  return v25;
}

- (BOOL)shouldLaunchMobileMail
{
  return self->_shouldLaunch;
}

@end
