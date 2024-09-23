@implementation DAUserNotificationUtilities

+ (void)showUserNotification:(__CFUserNotification *)a3 groupIdentifier:(id)a4 callbackQueue:(id)a5 sourceRunLoop:(id)a6 completionBlock:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  void (**v17)(_QWORD, _QWORD, _QWORD);
  void *v18;
  CFRunLoopSourceRef RunLoopSource;
  __CFRunLoopSource *v20;
  __CFRunLoop *v21;
  const __CFString *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  NSObject *v27;
  os_log_type_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint8_t buf[4];
  __CFUserNotification *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = (void (**)(_QWORD, _QWORD, _QWORD))v16;
  if (a3)
  {
    if (v16)
      goto LABEL_3;
LABEL_17:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("DAUserNotificationUtilities.m"), 71, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionBlock != nil"));

    if (v15)
      goto LABEL_4;
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("DAUserNotificationUtilities.m"), 70, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("notification != nil"));

  if (!v17)
    goto LABEL_17;
LABEL_3:
  if (v15)
    goto LABEL_4;
LABEL_18:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("DAUserNotificationUtilities.m"), 72, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("runLoop != nil"));

LABEL_4:
  _InfoForNotification((uint64_t)a3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("DAUserNotificationUtilities.m"), 73, CFSTR("Already waiting on this notification %p"), a3);

  }
  RunLoopSource = CFUserNotificationCreateRunLoopSource((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a3, (CFUserNotificationCallBack)_ReceiveNotificationResponseCallback, 0);
  if (RunLoopSource)
  {
    v20 = RunLoopSource;
    v21 = (__CFRunLoop *)objc_msgSend(v15, "getCFRunLoop");
    v22 = CFRunLoopCopyCurrentMode(v21);
    if (!v22)
      v22 = (const __CFString *)CFRetain((CFTypeRef)*MEMORY[0x1E0C9B270]);
    v23 = (void *)objc_opt_new();
    objc_msgSend(v23, "setGroupIdentifier:", v13);
    objc_msgSend(v23, "setHandler:", v17);
    objc_msgSend(v23, "setCallbackQueue:", v14);
    v24 = v23;
    _NotificationHandlerMap();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setObject:forKey:", v24, a3);

    if (v13)
    {
      +[DAPowerAssertionManager sharedPowerAssertionManager](DAPowerAssertionManager, "sharedPowerAssertionManager");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "dropPowerAssertionsForGroupIdentifier:", v13);

    }
    CFRunLoopAddSource(v21, v20, v22);
    CFRelease(v22);
    CFRelease(v20);

  }
  else
  {
    DALoggingwithCategory();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = *(_BYTE *)(MEMORY[0x1E0D03918] + 3);
    if (os_log_type_enabled(v27, v28))
    {
      *(_DWORD *)buf = 138412290;
      v34 = a3;
      _os_log_impl(&dword_1C1CD1000, v27, v28, "Couldn't schedule response for notification %@", buf, 0xCu);
    }

    CFUserNotificationCancel(a3);
    ((void (**)(_QWORD, __CFUserNotification *, uint64_t))v17)[2](v17, a3, 3);
  }

}

@end
