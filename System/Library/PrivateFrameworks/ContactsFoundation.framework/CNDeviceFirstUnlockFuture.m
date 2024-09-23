@implementation CNDeviceFirstUnlockFuture

+ (id)deviceFirstUnlockFuture
{
  CNPromise *v2;
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  CNPromise *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  int v14;
  _QWORD handler[4];
  CNPromise *v16;
  int out_token;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(CNPromise);
  out_token = -1;
  dispatch_get_global_queue(0, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = +[CNMobileKeyBag firstUnlockNotificationID](CNMobileKeyBag, "firstUnlockNotificationID");
  v5 = MEMORY[0x1E0C809B0];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __52__CNDeviceFirstUnlockFuture_deviceFirstUnlockFuture__block_invoke;
  handler[3] = &unk_1E29B8D40;
  v6 = v2;
  v16 = v6;
  v7 = notify_register_dispatch(v4, &out_token, v3, handler);
  if ((_DWORD)v7)
  {
    v18 = CFSTR("notify_status");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[CNFoundationError errorWithCode:userInfo:](CNFoundationError, "errorWithCode:userInfo:", 10, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNPromise finishWithError:](v6, "finishWithError:", v10);
  }
  else
  {
    -[CNPromise future](v6, "future");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v5;
    v13[1] = 3221225472;
    v13[2] = __52__CNDeviceFirstUnlockFuture_deviceFirstUnlockFuture__block_invoke_2;
    v13[3] = &__block_descriptor_36_e17_v16__0__NSError_8l;
    v14 = out_token;
    objc_msgSend(v10, "addFailureBlock:", v13);
  }

  -[CNPromise future](v6, "future");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t __52__CNDeviceFirstUnlockFuture_deviceFirstUnlockFuture__block_invoke(uint64_t a1, int a2)
{
  void *v3;
  void *v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "finishWithResult:", v4);

  return notify_cancel(a2);
}

uint64_t __52__CNDeviceFirstUnlockFuture_deviceFirstUnlockFuture__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = +[CNFoundationError isCanceledError:](CNFoundationError, "isCanceledError:", a2);
  if ((_DWORD)result)
    return notify_cancel(*(_DWORD *)(a1 + 32));
  return result;
}

@end
