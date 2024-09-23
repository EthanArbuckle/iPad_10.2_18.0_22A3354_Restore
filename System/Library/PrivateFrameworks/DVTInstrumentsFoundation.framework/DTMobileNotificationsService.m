@implementation DTMobileNotificationsService

+ (void)registerCapabilities:(id)a3
{
  objc_msgSend(a3, "publishCapability:withVersion:forClass:", CFSTR("com.apple.instruments.server.services.mobilenotifications"), 2, a1);
}

- (void)messageReceived:(id)a3
{
  if (objc_msgSend(a3, "errorStatus") == 2)
  {
    -[DTMobileNotificationsService _setAppStateNotificationsEnabled:](self, "_setAppStateNotificationsEnabled:", 0);
    MEMORY[0x24BEDD108](self, sel__setMemNotificationsEnabled_);
  }
}

- (void)setApplicationStateNotificationsEnabled:(id)a3
{
  -[DTMobileNotificationsService _setAppStateNotificationsEnabled:](self, "_setAppStateNotificationsEnabled:", objc_msgSend(a3, "BOOLValue"));
}

- (void)_setAppStateNotificationsEnabled:(BOOL)a3
{
  void *v4;
  RBSProcessMonitor *appStateMonitor;
  _QWORD v6[5];

  if (self->_applicationStateNotificationsEnabled != a3)
  {
    self->_applicationStateNotificationsEnabled = a3;
    if (a3)
    {
      v6[0] = MEMORY[0x24BDAC760];
      v6[1] = 3221225472;
      v6[2] = sub_222B61B6C;
      v6[3] = &unk_24EB29E48;
      v6[4] = self;
      objc_msgSend(MEMORY[0x24BE80CC8], "monitorWithConfiguration:", v6);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[DTMobileNotificationsService setAppStateMonitor:](self, "setAppStateMonitor:", v4);

    }
    else
    {
      -[RBSProcessMonitor invalidate](self->_appStateMonitor, "invalidate");
      appStateMonitor = self->_appStateMonitor;
      self->_appStateMonitor = 0;

    }
  }
}

- (void)setMemoryNotificationsEnabled:(id)a3
{
  objc_msgSend(a3, "BOOLValue");
  MEMORY[0x24BEDD108](self, sel__setMemNotificationsEnabled_);
}

- (void)postDarwinNotification:(id)a3
{
  id v3;
  id v4;
  uint32_t v5;
  uint32_t v6;
  NSObject *v7;
  const char *v8;
  uint32_t v9;
  int v10;
  id v11;
  __int16 v12;
  uint32_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (qword_25576FB18 != -1)
    dispatch_once(&qword_25576FB18, &unk_24EB27850);
  if ((objc_msgSend((id)qword_25576FB10, "containsObject:", v3) & 1) != 0)
  {
    v4 = objc_retainAutorelease(v3);
    v5 = notify_post((const char *)objc_msgSend(v4, "UTF8String"));
    if (v5)
    {
      v6 = v5;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        v10 = 138412546;
        v11 = v4;
        v12 = 1024;
        v13 = v6;
        v7 = MEMORY[0x24BDACB70];
        v8 = "Failed to post notification %@, status %d";
        v9 = 18;
LABEL_9:
        _os_log_impl(&dword_222B17000, v7, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v10, v9);
      }
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    v10 = 138412290;
    v11 = v3;
    v7 = MEMORY[0x24BDACB70];
    v8 = "Failed to post notification %@";
    v9 = 12;
    goto LABEL_9;
  }

}

- (void)_setMemNotificationsEnabled:(BOOL)a3
{
  NSObject *memoryNotificationSource;
  int v5;
  int v6;
  OS_dispatch_source *v7;
  int *v8;
  int *v9;
  NSObject *v10;
  dispatch_source_t v11;
  uint64_t v12;
  NSObject *v13;
  OS_dispatch_source *v14;
  NSObject *v15;
  _QWORD v16[4];
  int v17;
  _QWORD handler[4];
  NSObject *v19;
  DTMobileNotificationsService *v20;
  int v21;
  uint64_t v22;
  int v23;

  memoryNotificationSource = self->_memoryNotificationSource;
  if (a3)
  {
    if (memoryNotificationSource)
      return;
    v5 = socket(32, 3, 1);
    if (v5 == -1)
    {
      v8 = __error();
      printf("could not open event socket, socket() failed: %d\n", *v8);
    }
    else
    {
      v6 = v5;
      v22 = 0x300000001;
      v23 = 3;
      if (ioctl(v5, 0x800C6502uLL, &v22))
      {
        __error();
        printf("could not establish event filter, ioctl() failed: %d\n");
      }
      else
      {
        LODWORD(v22) = 1;
        if (ioctl(v6, 0x8004667EuLL, &v22))
        {
          v9 = __error();
          printf("could not set non-blocking io, ioctl() failed: %d\n", *v9);
          close(v6);
          v6 = -1;
          if (!fcntl(-1, 2, 0x1000000))
            goto LABEL_15;
        }
        else if (!fcntl(v6, 2, 0x1000000))
        {
LABEL_16:
          dispatch_get_global_queue(0, 0);
          v10 = objc_claimAutoreleasedReturnValue();
          v11 = dispatch_source_create(MEMORY[0x24BDACA00], v6, 0, v10);

          v12 = MEMORY[0x24BDAC760];
          handler[0] = MEMORY[0x24BDAC760];
          handler[1] = 3221225472;
          handler[2] = sub_222B622F8;
          handler[3] = &unk_24EB297D8;
          v21 = v6;
          v13 = v11;
          v19 = v13;
          v20 = self;
          dispatch_source_set_event_handler(v13, handler);
          v16[0] = v12;
          v16[1] = 3221225472;
          v16[2] = sub_222B62424;
          v16[3] = &unk_24EB29760;
          v17 = v6;
          dispatch_source_set_cancel_handler(v13, v16);
          v14 = self->_memoryNotificationSource;
          self->_memoryNotificationSource = (OS_dispatch_source *)v13;
          v15 = v13;

          dispatch_resume((dispatch_object_t)self->_memoryNotificationSource);
          return;
        }
        __error();
        printf("could not set close-on-exec, fcntl() failed: %d\n");
      }
      close(v6);
    }
LABEL_15:
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("DTMobileNotificationServiceException"), CFSTR("Memory monitoring disabled due to error."));
    v6 = -1;
    goto LABEL_16;
  }
  if (memoryNotificationSource)
  {
    dispatch_source_cancel(memoryNotificationSource);
    v7 = self->_memoryNotificationSource;
    self->_memoryNotificationSource = 0;

  }
}

- (void)_memoryNotification:(unsigned int)a3 pid:(int)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  _QWORD v14[5];

  v4 = *(_QWORD *)&a4;
  v14[4] = *MEMORY[0x24BDAC8D0];
  v13[0] = CFSTR("code");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(_QWORD *)&a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v6;
  v13[1] = CFSTR("pid");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v7;
  v13[2] = CFSTR("mach_absolute_time");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", mach_absolute_time());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v8;
  v13[3] = CFSTR("timestamp");
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE2A960], "messageWithSelector:objectArguments:", sel_memoryLevelNotification_, v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[DTXService channel](self, "channel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sendControlAsync:replyHandler:", v11, 0);

}

- (RBSProcessMonitor)appStateMonitor
{
  return self->_appStateMonitor;
}

- (void)setAppStateMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_appStateMonitor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appStateMonitor, 0);
  objc_storeStrong((id *)&self->_memoryNotificationSource, 0);
}

@end
