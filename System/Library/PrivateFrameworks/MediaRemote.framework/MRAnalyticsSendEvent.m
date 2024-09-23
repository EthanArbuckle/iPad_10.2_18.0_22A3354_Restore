@implementation MRAnalyticsSendEvent

void __MRAnalyticsSendEvent_block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *v3;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("com.apple.mediaremote.MRAnalytics", v0);
  v2 = (void *)MRAnalyticsSendEvent___analyticsQueue;
  MRAnalyticsSendEvent___analyticsQueue = (uint64_t)v1;

}

id __MRAnalyticsSendEvent_block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _BOOL4 IsInformational;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  __CFString *v10;
  void *v11;
  void *v12;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    IsInformational = MRMediaRemoteErrorIsInformational(v4);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "code"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (IsInformational)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("informationalErrorCode"));
    }
    else
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("errorCode"));

      objc_msgSend(*(id *)(a1 + 32), "domain");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("errorDomain"));

      objc_msgSend(*(id *)(a1 + 32), "domain");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqual:", CFSTR("kMRMediaRemoteFrameworkErrorDomain"));

      if (v9)
      {
        v10 = (__CFString *)MRErrorCopyDescription(*(__CFError **)(a1 + 32));
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("errorDescription"));

      }
      objc_msgSend(*(id *)(a1 + 32), "recursiveUnderlyingError");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v11;
      if (v11)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v11, "code"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("underlyingErrorCode"));

      }
    }

  }
  return v3;
}

void __MRAnalyticsSendEvent_block_invoke_3(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint8_t buf[4];
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (MSVDeviceOSIsInternalInstall())
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    _MRLogForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v8 = v4;
      v9 = 2112;
      v10 = v2;
      _os_log_impl(&dword_193827000, v3, OS_LOG_TYPE_DEFAULT, "Logging to CoreAnalytics: %@\n%@", buf, 0x16u);
    }

    v6 = v2;
    v5 = v2;
    AnalyticsSendEventLazy();

  }
  else
  {
    AnalyticsSendEventLazy();
  }
}

id __MRAnalyticsSendEvent_block_invoke_215(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

@end
