@implementation AAUserNotification

+ (id)_defaultParameters
{
  uint64_t v2;
  _QWORD v4[3];
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0DABB98];
  v4[0] = *MEMORY[0x1E0C9B820];
  v4[1] = v2;
  v5[0] = MEMORY[0x1E0C9AAB0];
  v5[1] = MEMORY[0x1E0C9AAA0];
  v4[2] = *MEMORY[0x1E0DABBB0];
  v5[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)showUserNotificationWithTitle:(id)a3 message:(id)a4 cancelButtonTitle:(id)a5 otherButtonTitle:(id)a6 withCompletionBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  +[AAUserNotification _defaultParameters](AAUserNotification, "_defaultParameters");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "mutableCopy");

  if (v18)
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v18, *MEMORY[0x1E0C9B800]);
  if (v12)
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0C9B810]);
  if (v13)
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0C9B830]);
  if (v14)
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0C9B838]);
  objc_msgSend(a1, "_waitForResponseAndReleaseNotification:completion:", CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0.0, 3uLL, 0, (CFDictionaryRef)v17), v15);

}

+ (void)showUserNotificationWithTitle:(id)a3 message:(id)a4 textFieldTitle:(id)a5 cancelButtonTitle:(id)a6 otherButtonTitle:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  +[AAUserNotification _defaultParameters](AAUserNotification, "_defaultParameters");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "mutableCopy");

  if (v21)
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0C9B800]);
  if (v14)
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0C9B810]);
  if (v15)
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0C9B878]);
  if (v16)
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0C9B830]);
  if (v17)
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0C9B838]);
  objc_msgSend(a1, "_waitForResponseAndReleaseNotification:completion:", CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0.0, 3uLL, 0, (CFDictionaryRef)v20), v18);

}

+ (void)showUserNotificationWithTitle:(id)a3 message:(id)a4 secureTextFieldTitle:(id)a5 cancelButtonTitle:(id)a6 otherButtonTitle:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  +[AAUserNotification _defaultParameters](AAUserNotification, "_defaultParameters");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "mutableCopy");

  if (v21)
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0C9B800]);
  if (v14)
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0C9B810]);
  if (v15)
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0C9B878]);
  if (v16)
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0C9B830]);
  if (v17)
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0C9B838]);
  objc_msgSend(a1, "_waitForResponseAndReleaseNotification:completion:", CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0.0, 0x10000uLL, 0, (CFDictionaryRef)v20), v18);

}

+ (void)_waitForResponseAndReleaseNotification:(__CFUserNotification *)a3 completion:(id)a4
{
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  __CFUserNotification *v10;

  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __72__AAUserNotification__waitForResponseAndReleaseNotification_completion___block_invoke;
    v8[3] = &unk_1E416FC00;
    v10 = a3;
    v9 = v6;
    objc_msgSend(a1, "waitForResponseToNotification:completion:", a3, v8);

  }
  else if (a3)
  {
    CFRelease(a3);
  }

}

uint64_t __72__AAUserNotification__waitForResponseAndReleaseNotification_completion___block_invoke(uint64_t a1)
{
  const void *v2;

  v2 = *(const void **)(a1 + 40);
  if (v2)
    CFRelease(v2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)waitForResponseToNotification:(__CFUserNotification *)a3 completion:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  __CFUserNotification *v10;

  v5 = a4;
  v6 = v5;
  if (v5)
  {
    if (a3)
    {
      CFRetain(a3);
      _AANotificationQueue();
      v7 = objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __63__AAUserNotification_waitForResponseToNotification_completion___block_invoke;
      v8[3] = &unk_1E416FC28;
      v10 = a3;
      v9 = v6;
      dispatch_async(v7, v8);

    }
    else
    {
      (*((void (**)(id, _QWORD, uint64_t))v5 + 2))(v5, 0, 3);
    }
  }

}

void __63__AAUserNotification_waitForResponseToNotification_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  CFRunLoopSourceRef RunLoopSource;
  __CFRunLoopSource *v8;
  __CFRunLoop *Main;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
  v4 = (void *)MEMORY[0x1A1AED7A0]();
  _AANotificationHandlerMap();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, v2);

  _AALogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v2;
    _os_log_impl(&dword_19EACA000, v6, OS_LOG_TYPE_DEFAULT, "Waiting for notification for key: %@", (uint8_t *)&v11, 0xCu);
  }

  RunLoopSource = CFUserNotificationCreateRunLoopSource(0, *(CFUserNotificationRef *)(a1 + 40), (CFUserNotificationCallBack)_AACFNotificationCallback, 0);
  if (RunLoopSource)
  {
    v8 = RunLoopSource;
    Main = CFRunLoopGetMain();
    CFRunLoopAddSource(Main, v8, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
    CFRelease(v8);
  }
  else
  {
    _AANotificationHandlerMap();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObjectForKey:", v2);

    CFRelease(*(CFTypeRef *)(a1 + 40));
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

@end
