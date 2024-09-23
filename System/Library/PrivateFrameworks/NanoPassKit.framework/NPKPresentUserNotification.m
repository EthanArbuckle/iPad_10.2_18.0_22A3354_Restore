@implementation NPKPresentUserNotification

void __NPKPresentUserNotification_block_invoke(uint64_t a1)
{
  const void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  CFRunLoopSourceRef RunLoopSource;
  __CFRunLoopSource *v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  __CFRunLoop *Main;
  _QWORD block[4];
  id v14;
  uint8_t buf[16];

  v2 = *(const void **)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    if (v3)
    {
      _NPKNotificationHandlerMap();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
      objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", *(_QWORD *)(a1 + 40));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v5, v6);

      RunLoopSource = CFUserNotificationCreateRunLoopSource(0, *(CFUserNotificationRef *)(a1 + 40), (CFUserNotificationCallBack)_NPKNotificationResponseHandler, 0);
      if (RunLoopSource)
      {
        v8 = RunLoopSource;
        pk_General_log();
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

        if (v10)
        {
          pk_General_log();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_213518000, v11, OS_LOG_TYPE_DEFAULT, "Notice: Adding handler to runloop...", buf, 2u);
          }

        }
        Main = CFRunLoopGetMain();
        CFRunLoopAddSource(Main, v8, (CFRunLoopMode)*MEMORY[0x24BDBD598]);
        CFRelease(v8);
        return;
      }
      v2 = *(const void **)(a1 + 40);
    }
    CFRelease(v2);
    return;
  }
  if (v3)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __NPKPresentUserNotification_block_invoke_196;
    block[3] = &unk_24CFE7B00;
    v14 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

uint64_t __NPKPresentUserNotification_block_invoke_196(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
