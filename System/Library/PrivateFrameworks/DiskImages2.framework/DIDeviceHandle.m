@implementation DIDeviceHandle

- (DIDeviceHandle)initWithRegEntryID:(unint64_t)a3 xpcEndpoint:(id)a4
{
  id v7;
  DIDeviceHandle *v8;
  DIDeviceHandle *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)DIDeviceHandle;
  v8 = -[DIDeviceHandle init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_regEntryID = a3;
    objc_storeStrong((id *)&v8->_xpcEndpoint, a4);
  }

  return v9;
}

- (DIDeviceHandle)initWithRegEntryID:(unint64_t)a3
{
  return -[DIDeviceHandle initWithRegEntryID:xpcEndpoint:](self, "initWithRegEntryID:xpcEndpoint:", a3, 0);
}

- (void)dealloc
{
  void *v3;
  int v4;
  NSObject *v5;
  char *v6;
  NSObject *v7;
  void *v8;
  uint8_t *v9;
  int v10;
  objc_super v11;
  uint64_t v12;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[DIDeviceHandle client2IOhandler](self, "client2IOhandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *__error();
    if (DIForwardLogs())
    {
      v12 = 0;
      getDIOSLog();
      v5 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
      *(_DWORD *)buf = 68157954;
      v14 = 25;
      v15 = 2080;
      v16 = "-[DIDeviceHandle dealloc]";
      v10 = 18;
      v9 = buf;
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
        v14 = 25;
        v15 = 2080;
        v16 = "-[DIDeviceHandle dealloc]";
        _os_log_impl(&dword_212EB0000, v7, OS_LOG_TYPE_DEFAULT, "%.*s: DIDeviceHandle object is deallocating, invalidating connection", buf, 0x12u);
      }

    }
    *__error() = v4;
    -[DIDeviceHandle client2IOhandler](self, "client2IOhandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "closeConnection");

  }
  v11.receiver = self;
  v11.super_class = (Class)DIDeviceHandle;
  -[DIDeviceHandle dealloc](&v11, sel_dealloc, v9, v10);
}

- (BOOL)updateBSDNameWithBlockDevice:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  char *v12;
  BOOL v13;
  NSObject *v14;
  void *v15;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = (void *)objc_msgSend(a3, "copyIOMediaWithError:", a4);
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "BSDName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DIDeviceHandle setBSDName:](self, "setBSDName:", v8);

    -[DIDeviceHandle BSDName](self, "BSDName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = *__error();
      if (DIForwardLogs())
      {
        getDIOSLog();
        v11 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
        -[DIDeviceHandle BSDName](self, "BSDName");
        *(_DWORD *)buf = 68158210;
        v18 = 53;
        v19 = 2080;
        v20 = "-[DIDeviceHandle updateBSDNameWithBlockDevice:error:]";
        v21 = 2114;
        v22 = (id)objc_claimAutoreleasedReturnValue();
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
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          -[DIDeviceHandle BSDName](self, "BSDName");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 68158210;
          v18 = 53;
          v19 = 2080;
          v20 = "-[DIDeviceHandle updateBSDNameWithBlockDevice:error:]";
          v21 = 2114;
          v22 = v15;
          _os_log_impl(&dword_212EB0000, v14, OS_LOG_TYPE_DEFAULT, "%.*s: BSD name: %{public}@", buf, 0x1Cu);

        }
      }
      *__error() = v10;
      v13 = 1;
    }
    else
    {
      v13 = +[DIError failWithEnumValue:verboseInfo:error:](DIError, "failWithEnumValue:verboseInfo:error:", 153, CFSTR("Cannot find BSD name in IO media service"), a4);
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)waitForQuietWithService:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5;
  int v6;
  NSObject *v7;
  char *v8;
  NSObject *v9;
  int v10;
  NSObject *v11;
  char *v12;
  void *v13;
  BOOL v14;
  NSObject *v15;
  mach_timespec_t waitTime;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  waitTime = (mach_timespec_t)30;
  while (1)
  {
    v5 = IOServiceWaitQuiet(a3, &waitTime);
    if ((_DWORD)v5 != -536870186)
      break;
    v6 = *__error();
    if (DIForwardLogs())
    {
      getDIOSLog();
      v7 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
      *(_DWORD *)buf = 68157954;
      v20 = 48;
      v21 = 2080;
      v22 = "-[DIDeviceHandle waitForQuietWithService:error:]";
      v8 = (char *)_os_log_send_and_compose_impl();

      if (v8)
      {
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v8);
        free(v8);
      }
    }
    else
    {
      getDIOSLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68157954;
        v20 = 48;
        v21 = 2080;
        v22 = "-[DIDeviceHandle waitForQuietWithService:error:]";
        _os_log_impl(&dword_212EB0000, v9, OS_LOG_TYPE_ERROR, "%.*s: IOServiceWaitQuiet timeout occurred, retrying.", buf, 0x12u);
      }

    }
    *__error() = v6;
  }
  if ((_DWORD)v5)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("IOServiceWaitQuiet error 0x%x"), v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = +[DIError failWithEnumValue:verboseInfo:error:](DIError, "failWithEnumValue:verboseInfo:error:", 154, v13, a4);

  }
  else
  {
    v10 = *__error();
    if (DIForwardLogs())
    {
      getDIOSLog();
      v11 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      *(_DWORD *)buf = 68157954;
      v20 = 48;
      v21 = 2080;
      v22 = "-[DIDeviceHandle waitForQuietWithService:error:]";
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
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68157954;
        v20 = 48;
        v21 = 2080;
        v22 = "-[DIDeviceHandle waitForQuietWithService:error:]";
        _os_log_impl(&dword_212EB0000, v15, OS_LOG_TYPE_DEFAULT, "%.*s: IOServiceWaitQuiet done", buf, 0x12u);
      }

    }
    *__error() = v10;
    return 1;
  }
  return v14;
}

- (BOOL)waitForDeviceWithError:(id *)a3
{
  id v5;
  void *v6;
  void *v7;
  __CFRunLoop *v8;
  IONotificationPort *v9;
  IONotificationPort *v10;
  __CFRunLoopSource *RunLoopSource;
  __CFRunLoopSource *v12;
  const __CFString *v13;
  const __CFDictionary *v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  const __CFString *v19;
  _QWORD refCon[2];
  io_iterator_t notification;
  BOOL v22;

  v22 = 0;
  notification = 0;
  v5 = +[DIBlockDevice copyUnmatchedDiskImageWithRegEntryID:error:](DIBlockDevice, "copyUnmatchedDiskImageWithRegEntryID:error:", -[DIDeviceHandle regEntryID](self, "regEntryID"), a3);
  v6 = v5;
  if (v5)
  {
    refCon[0] = &v22;
    refCon[1] = objc_msgSend(v5, "ioObj");
    objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (__CFRunLoop *)objc_msgSend(v7, "getCFRunLoop");
    if (!-[DIDeviceHandle waitForQuietWithService:error:](self, "waitForQuietWithService:error:", objc_msgSend(v6, "ioObj"), a3))goto LABEL_16;
    v9 = IONotificationPortCreate(*MEMORY[0x24BDD8B18]);
    if (v9)
    {
      v10 = v9;
      RunLoopSource = IONotificationPortGetRunLoopSource(v9);
      if (RunLoopSource)
      {
        v12 = RunLoopSource;
        v13 = (const __CFString *)*MEMORY[0x24BDBD5A0];
        CFRunLoopAddSource(v8, RunLoopSource, (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
        v14 = IOServiceMatching("IOMedia");
        if (!IOServiceAddMatchingNotification(v10, "IOServiceMatched", v14, (IOServiceMatchingCallback)waitForDevCB, refCon, &notification))
        {
          v19 = v13;
          waitForDevCB((uint64_t)refCon, notification);
          if (!v22)
          {
            v15 = *MEMORY[0x24BDBCA90];
            do
            {
              objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 1.0, v19);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "runMode:beforeDate:", v15, v16);

            }
            while (!v22);
          }
          IOObjectRelease(notification);
          v13 = v19;
        }
        CFRunLoopRemoveSource(v8, v12, v13);
      }
      else
      {
        +[DIError failWithEnumValue:verboseInfo:error:](DIError, "failWithEnumValue:verboseInfo:error:", 153, CFSTR("Failed getting runloop source"), 0);
      }
      IONotificationPortDestroy(v10);
    }
    if (v22)
    {
      v17 = -[DIDeviceHandle updateBSDNameWithBlockDevice:error:](self, "updateBSDNameWithBlockDevice:error:", v6, a3);
      v22 = v17;
    }
    else
    {
LABEL_16:
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DIDeviceHandle)initWithCoder:(id)a3
{
  id v4;
  DIDeviceHandle *v5;
  uint64_t v6;
  NSXPCListenerEndpoint *xpcEndpoint;
  uint64_t v8;
  NSString *BSDName;
  int v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DIDeviceHandle;
  v5 = -[DIDeviceHandle init](&v12, sel_init);
  if (v5)
  {
    v5->_regEntryID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("regEntryID"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("xpcEndpoint"));
    v6 = objc_claimAutoreleasedReturnValue();
    xpcEndpoint = v5->_xpcEndpoint;
    v5->_xpcEndpoint = (NSXPCListenerEndpoint *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BSDname"));
    v8 = objc_claimAutoreleasedReturnValue();
    BSDName = v5->_BSDName;
    v5->_BSDName = (NSString *)v8;

    v10 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("handleRefCount"));
    v5->_handleRefCount = v10;
    if (v10)
    {
      if (v5->_xpcEndpoint)
        -[DIDeviceHandle addToRefCountWithError:](v5, "addToRefCountWithError:", 0);
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "encodeInt64:forKey:", -[DIDeviceHandle regEntryID](self, "regEntryID"), CFSTR("regEntryID"));
  -[DIDeviceHandle xpcEndpoint](self, "xpcEndpoint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("xpcEndpoint"));

  -[DIDeviceHandle BSDName](self, "BSDName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("BSDname"));

  objc_msgSend(v6, "encodeBool:forKey:", -[DIDeviceHandle handleRefCount](self, "handleRefCount"), CFSTR("handleRefCount"));
}

- (BOOL)addToRefCountWithError:(id *)a3
{
  DIClient2IODaemonXPCHandler *v5;
  void *v6;
  DIClient2IODaemonXPCHandler *v7;
  void *v8;
  void *v9;
  char v10;

  -[DIDeviceHandle setHandleRefCount:](self, "setHandleRefCount:", 1);
  v5 = [DIClient2IODaemonXPCHandler alloc];
  -[DIDeviceHandle xpcEndpoint](self, "xpcEndpoint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[DIClient2IODaemonXPCHandler initWithEndpoint:](v5, "initWithEndpoint:", v6);
  -[DIDeviceHandle setClient2IOhandler:](self, "setClient2IOhandler:", v7);

  -[DIDeviceHandle client2IOhandler](self, "client2IOhandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v8, "connectWithError:", a3);

  if (!(_DWORD)v6)
    return 0;
  -[DIDeviceHandle client2IOhandler](self, "client2IOhandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "addToRefCountWithError:", a3);

  return v10;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DIDeviceHandle BSDName](self, "BSDName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DIDeviceHandle xpcEndpoint](self, "xpcEndpoint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CFSTR("managed");
  if (!v7)
    v8 = CFSTR("unmanaged");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@[%@, %@]"), v5, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)BSDName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBSDName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (DIClient2IODaemonXPCHandler)client2IOhandler
{
  return self->_client2IOhandler;
}

- (void)setClient2IOhandler:(id)a3
{
  objc_storeStrong((id *)&self->_client2IOhandler, a3);
}

- (BOOL)handleRefCount
{
  return self->_handleRefCount;
}

- (void)setHandleRefCount:(BOOL)a3
{
  self->_handleRefCount = a3;
}

- (unint64_t)regEntryID
{
  return self->_regEntryID;
}

- (NSXPCListenerEndpoint)xpcEndpoint
{
  return self->_xpcEndpoint;
}

- (void)setXpcEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_xpcEndpoint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcEndpoint, 0);
  objc_storeStrong((id *)&self->_client2IOhandler, 0);
  objc_storeStrong((id *)&self->_BSDName, 0);
}

@end
