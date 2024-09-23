@implementation ESUserNotificationUtilities

+ (void)showUserNotification:(__CFUserNotification *)a3 groupIdentifier:(id)a4 withCompletionBlock:(id)a5
{
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  void *v12;
  CFRunLoopSourceRef RunLoopSource;
  __CFRunLoopSource *v14;
  __CFRunLoop *Current;
  const __CFString *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  NSObject *v21;
  os_log_type_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint8_t buf[4];
  __CFUserNotification *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = a5;
  v11 = (void (**)(_QWORD, _QWORD, _QWORD))v10;
  if (a3)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ESUserNotificationUtilities.m"), 65, CFSTR("Must have a notification"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ESUserNotificationUtilities.m"), 66, CFSTR("Must have a block here"));

LABEL_3:
  _InfoForNotification((uint64_t)a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ESUserNotificationUtilities.m"), 67, CFSTR("Already waiting on this notification %p"), a3);

  }
  RunLoopSource = CFUserNotificationCreateRunLoopSource((CFAllocatorRef)*MEMORY[0x24BDBD240], a3, (CFUserNotificationCallBack)_ReceiveNotificationResponseCallback, 0);
  if (RunLoopSource)
  {
    v14 = RunLoopSource;
    Current = CFRunLoopGetCurrent();
    v16 = CFRunLoopCopyCurrentMode(Current);
    if (!v16)
      v16 = (const __CFString *)CFRetain((CFTypeRef)*MEMORY[0x24BDBD598]);
    v17 = (void *)objc_opt_new();
    objc_msgSend(v17, "setGroupIdentifier:", v9);
    objc_msgSend(v17, "setHandler:", v11);
    v18 = v17;
    _NotificationHandlerMap();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKey:", v18, a3);

    if (v9)
    {
      objc_msgSend(MEMORY[0x24BE2AAC8], "sharedPowerAssertionManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "dropPowerAssertionsForGroupIdentifier:", v9);

    }
    CFRunLoopAddSource(Current, v14, v16);
    CFRelease(v16);
    CFRelease(v14);

  }
  else
  {
    DALoggingwithCategory();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 3);
    if (os_log_type_enabled(v21, v22))
    {
      *(_DWORD *)buf = 138412290;
      v27 = a3;
      _os_log_impl(&dword_22AC94000, v21, v22, "Couldn't schedule response for notification %@", buf, 0xCu);
    }

    CFUserNotificationCancel(a3);
    ((void (**)(_QWORD, __CFUserNotification *, uint64_t))v11)[2](v11, a3, 3);
  }

}

@end
