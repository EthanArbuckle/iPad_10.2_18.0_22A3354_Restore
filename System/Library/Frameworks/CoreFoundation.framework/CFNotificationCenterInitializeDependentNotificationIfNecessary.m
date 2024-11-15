@implementation CFNotificationCenterInitializeDependentNotificationIfNecessary

void ___CFNotificationCenterInitializeDependentNotificationIfNecessary_block_invoke(uint64_t a1)
{
  uint64_t *v1;
  void (*v2)(void);
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  const __CFString *v7;
  int v8;
  __CFNotificationCenter *DistributedCenter;
  const char *CStringPtr;
  NSObject *v11;
  uint64_t v12;
  _QWORD handler[6];
  char v14;
  _DWORD v15[2];
  int out_token;
  _DWORD v17[2];
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  const __CFString *v21;
  char buffer[1024];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v1 = *(uint64_t **)(a1 + 32);
  v2 = (void (*)(void))v1[2];
  if (v2)
  {
    v2();
    v1 = *(uint64_t **)(a1 + 32);
  }
  if (*((_BYTE *)v1 + 40))
  {
    v4 = 0;
    v5 = 0;
    do
    {
      v6 = v1[6] + v4;
      v7 = *(const __CFString **)v6;
      v8 = *(char *)(v6 + 8);
      v17[0] = *(_DWORD *)(v6 + 9);
      *(_DWORD *)((char *)v17 + 3) = *(_DWORD *)(v6 + 12);
      switch(v8)
      {
        case 0:
          if (CFNotificationCenterGetLocalCenter_static_init != -1)
            dispatch_once(&CFNotificationCenterGetLocalCenter_static_init, &__block_literal_global_7);
          DistributedCenter = (__CFNotificationCenter *)__taskCenter;
          goto LABEL_11;
        case 1:
          DistributedCenter = CFNotificationCenterGetDistributedCenter();
          goto LABEL_11;
        case 2:
          DistributedCenter = CFNotificationCenterGetDarwinNotifyCenter();
LABEL_11:
          CFNotificationCenterAddObserver(DistributedCenter, (const void *)0x7B, (CFNotificationCallback)v1[3], v7, 0, (CFNotificationSuspensionBehavior)v1[4]);
          break;
        case 3:
          out_token = 0;
          CStringPtr = CFStringGetCStringPtr(v7, 0x8000100u);
          if (CStringPtr || (CStringPtr = buffer, CFStringGetCString(v7, buffer, 1024, 0x8000100u)))
          {
            handler[0] = MEMORY[0x1E0C809B0];
            handler[1] = 3221225472;
            handler[2] = ___registerSubNotifications_block_invoke;
            handler[3] = &__block_descriptor_56_e8_v12__0i8l;
            handler[4] = v1;
            handler[5] = v7;
            v14 = v8;
            v15[0] = v17[0];
            *(_DWORD *)((char *)v15 + 3) = *(_DWORD *)((char *)v17 + 3);
            notify_register_dispatch(CStringPtr, &out_token, MEMORY[0x1E0C80D38], handler);
          }
          else
          {
            v11 = _CFOSLog();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              v12 = *v1;
              *(_DWORD *)buf = 138543618;
              v19 = v12;
              v20 = 2114;
              v21 = v7;
              _os_log_error_impl(&dword_182A8C000, v11, OS_LOG_TYPE_ERROR, "Failed to register dependent notification %{public}@ -> %{public}@", buf, 0x16u);
            }
          }
          break;
        default:
          break;
      }
      ++v5;
      v4 += 16;
    }
    while (v5 < *((unsigned __int8 *)v1 + 40));
  }
}

@end
