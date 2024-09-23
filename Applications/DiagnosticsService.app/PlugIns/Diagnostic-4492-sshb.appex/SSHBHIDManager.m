@implementation SSHBHIDManager

- (SSHBHIDManager)init
{
  SSHBHIDManager *v2;
  SSHBHIDDeviceManager *v3;
  SSHBHIDDeviceManager *deviceManager;
  __IOHIDManager *hidManager;
  __CFRunLoop *Current;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SSHBHIDManager;
  v2 = -[SSHBHIDManager init](&v8, "init");
  if (v2)
  {
    v2->_hidManager = IOHIDManagerCreate(kCFAllocatorDefault, 0);
    v3 = objc_alloc_init(SSHBHIDDeviceManager);
    deviceManager = v2->_deviceManager;
    v2->_deviceManager = v3;

    v2->_buffer = (char *)malloc_type_malloc(0x200uLL, 0x100004077774924uLL);
    IOHIDManagerOpen(v2->_hidManager, 0);
    IOHIDManagerSetDeviceMatching(v2->_hidManager, 0);
    IOHIDManagerRegisterDeviceMatchingCallback(v2->_hidManager, (IOHIDDeviceCallback)deviceConnectedCallback, v2);
    IOHIDManagerRegisterDeviceRemovalCallback(v2->_hidManager, (IOHIDDeviceCallback)deviceRemovedCallback, v2);
    hidManager = v2->_hidManager;
    Current = CFRunLoopGetCurrent();
    IOHIDManagerScheduleWithRunLoop(hidManager, Current, kCFRunLoopDefaultMode);
    -[SSHBHIDManager cacheDevices](v2, "cacheDevices");
  }
  return v2;
}

- (void)cacheDevices
{
  CFSetRef v3;
  const __CFSet *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v3 = IOHIDManagerCopyDevices(self->_hidManager);
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = v3;
  v5 = -[__CFSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[SSHBHIDManager deviceConnected:](self, "deviceConnected:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8), (_QWORD)v9);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = -[__CFSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)deviceConnected:(__IOHIDDevice *)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  SSHBHIDUsage *v9;
  _QWORD v10[5];

  v5 = objc_msgSend((id)IOHIDDeviceGetProperty(a3, CFSTR("PrimaryUsage")), "unsignedIntValue");
  v9 = -[SSHBHIDUsage initWithPrimaryUsage:primaryUsagePage:]([SSHBHIDUsage alloc], "initWithPrimaryUsage:primaryUsagePage:", v5, objc_msgSend((id)IOHIDDeviceGetProperty(a3, CFSTR("PrimaryUsagePage")), "unsignedIntValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SSHBHIDManager deviceManager](self, "deviceManager"));
  objc_msgSend(v6, "addDevice:forUsage:", a3, v9);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SSHBHIDManager deviceManager](self, "deviceManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "subscribersFromUsage:", v9));

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100002978;
  v10[3] = &unk_10000C278;
  v10[4] = a3;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v10);
  IOHIDDeviceRegisterInputReportCallback(a3, (uint8_t *)-[SSHBHIDManager buffer](self, "buffer"), 512, (IOHIDReportCallback)sub_1000029C4, self);

}

- (void)deviceDisconnected:(__IOHIDDevice *)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  SSHBHIDUsage *v9;
  _QWORD v10[5];

  v5 = objc_msgSend((id)IOHIDDeviceGetProperty(a3, CFSTR("PrimaryUsage")), "unsignedIntValue");
  v9 = -[SSHBHIDUsage initWithPrimaryUsage:primaryUsagePage:]([SSHBHIDUsage alloc], "initWithPrimaryUsage:primaryUsagePage:", v5, objc_msgSend((id)IOHIDDeviceGetProperty(a3, CFSTR("PrimaryUsagePage")), "unsignedIntValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SSHBHIDManager deviceManager](self, "deviceManager"));
  objc_msgSend(v6, "removeDevice:", a3);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SSHBHIDManager deviceManager](self, "deviceManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "subscribersFromUsage:", v9));

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100002AFC;
  v10[3] = &unk_10000C278;
  v10[4] = a3;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v10);
  IOHIDDeviceRegisterInputReportCallback(a3, (uint8_t *)-[SSHBHIDManager buffer](self, "buffer"), 512, 0, self);

}

- (void)registerDevice:(id)a3 forNotificationsFromDeviceWithUsage:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[SSHBHIDManager deviceManager](self, "deviceManager"));
  objc_msgSend(v8, "addSubscriber:forUsage:", v7, v6);

}

- (void)unregisterDevice:(id)a3 forNotificationsFromDeviceWithUsage:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[SSHBHIDManager deviceManager](self, "deviceManager"));
  objc_msgSend(v8, "removeSubscriber:forUsage:", v7, v6);

}

- (void)dealloc
{
  char *buffer;
  __IOHIDManager *v4;
  __CFRunLoop *Current;
  objc_super v6;

  buffer = self->_buffer;
  if (buffer)
  {
    free(buffer);
    self->_buffer = 0;
  }
  v4 = -[SSHBHIDManager hidManager](self, "hidManager");
  Current = CFRunLoopGetCurrent();
  IOHIDManagerUnscheduleFromRunLoop(v4, Current, kCFRunLoopDefaultMode);
  IOHIDManagerClose(-[SSHBHIDManager hidManager](self, "hidManager"), 0);
  v6.receiver = self;
  v6.super_class = (Class)SSHBHIDManager;
  -[SSHBHIDManager dealloc](&v6, "dealloc");
}

- (id)getReportForDevice:(__IOHIDDevice *)a3 reportType:(int)a4 reportID:(int64_t)a5 error:(id *)a6 domain:(id)a7 code:(int)a8
{
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  CFIndex pReportLength;
  NSErrorUserInfoKey v31;
  void *v32;
  uint8_t report[512];

  v13 = a7;
  if (a3)
  {
    pReportLength = 512;
    v14 = IOHIDDeviceGetReport(a3, (IOHIDReportType)a4, a5, report, &pReportLength);
    if (!a6 || !(_DWORD)v14)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", report, pReportLength));
      goto LABEL_10;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("HID Report Get failed with return value 0x%x"), v14));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", v15, &stru_10000C338, 0));

    v31 = NSLocalizedDescriptionKey;
    v32 = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1));
    *a6 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v13, a8, v18));

  }
  else
  {
    v19 = DiagnosticLogHandleForCategory(3);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_100006F0C(v20, v21, v22, v23, v24, v25, v26, v27);

  }
  v28 = 0;
LABEL_10:

  return v28;
}

- (BOOL)setReportForDevice:(__IOHIDDevice *)a3 reportType:(int)a4 reportID:(int64_t)a5 buffer:(id)a6 error:(id *)a7 domain:(id)a8 code:(int)a9
{
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  BOOL v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSErrorUserInfoKey v32;
  void *v33;

  v14 = a6;
  v15 = a8;
  if (!a3)
  {
    v23 = DiagnosticLogHandleForCategory(3);
    v19 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_100006F40(v19, v24, v25, v26, v27, v28, v29, v30);
    goto LABEL_7;
  }
  v16 = objc_retainAutorelease(v14);
  v17 = IOHIDDeviceSetReport(a3, (IOHIDReportType)a4, a5, (const uint8_t *)objc_msgSend(v16, "bytes"), (CFIndex)objc_msgSend(v16, "length"));
  v18 = (_DWORD)v17 == 0;
  if (a7 && (_DWORD)v17)
  {
    v19 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("HID Report Set failed with reportID 0x%lx packet %@ with return value 0x%x."), a5, v16, v17));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", v19, &stru_10000C338, 0));

    v32 = NSLocalizedDescriptionKey;
    v33 = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1));
    *a7 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v15, a9, v22));

LABEL_7:
    v18 = 0;
  }

  return v18;
}

- (id)getReportForDevice:(__IOHIDDevice *)a3 reportType:(int)a4 reportID:(int64_t)a5 error:(id *)a6
{
  return -[SSHBHIDManager getReportForDevice:reportType:reportID:error:domain:code:](self, "getReportForDevice:reportType:reportID:error:domain:code:", a3, *(_QWORD *)&a4, a5, a6, CFSTR("com.apple.osdiags.SSHBHIDManager"), 0);
}

- (BOOL)setReportForDevice:(__IOHIDDevice *)a3 reportType:(int)a4 reportID:(int64_t)a5 buffer:(id)a6 error:(id *)a7
{
  uint64_t v8;

  LODWORD(v8) = 1;
  return -[SSHBHIDManager setReportForDevice:reportType:reportID:buffer:error:domain:code:](self, "setReportForDevice:reportType:reportID:buffer:error:domain:code:", a3, *(_QWORD *)&a4, a5, a6, a7, CFSTR("com.apple.osdiags.SSHBHIDManager"), v8);
}

- (void)hidReportCallback:(__IOHIDDevice *)a3 result:(int)a4 type:(int)a5 reportID:(unsigned int)a6 report:(char *)a7 reportLength:(int64_t)a8
{
  id v15;
  void *v16;
  void *v17;
  SSHBHIDUsage *v18;
  _QWORD v19[7];
  int v20;
  int v21;
  unsigned int v22;

  v15 = objc_msgSend((id)IOHIDDeviceGetProperty(a3, CFSTR("PrimaryUsage")), "unsignedIntValue");
  v18 = -[SSHBHIDUsage initWithPrimaryUsage:primaryUsagePage:]([SSHBHIDUsage alloc], "initWithPrimaryUsage:primaryUsagePage:", v15, objc_msgSend((id)IOHIDDeviceGetProperty(a3, CFSTR("PrimaryUsagePage")), "unsignedIntValue"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SSHBHIDManager deviceManager](self, "deviceManager"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "subscribersFromUsage:", v18));

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100003184;
  v19[3] = &unk_10000C298;
  v20 = a4;
  v21 = a5;
  v22 = a6;
  v19[4] = a3;
  v19[5] = a7;
  v19[6] = a8;
  objc_msgSend(v17, "enumerateObjectsUsingBlock:", v19);

}

- (__IOHIDManager)hidManager
{
  return self->_hidManager;
}

- (void)setHidManager:(__IOHIDManager *)a3
{
  self->_hidManager = a3;
}

- (SSHBHIDDeviceManager)deviceManager
{
  return self->_deviceManager;
}

- (void)setDeviceManager:(id)a3
{
  objc_storeStrong((id *)&self->_deviceManager, a3);
}

- (char)buffer
{
  return self->_buffer;
}

- (void)setBuffer:(char *)a3
{
  self->_buffer = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceManager, 0);
}

@end
