@implementation MRUAnalytics

+ (void)sendEvent:(id)a3 withError:(id)a4 payload:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD aBlock[4];
  id v21;
  id v22;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (sendEvent_withError_payload__once != -1)
    dispatch_once(&sendEvent_withError_payload__once, &__block_literal_global_16);
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __44__MRUAnalytics_sendEvent_withError_payload___block_invoke_2;
  aBlock[3] = &unk_1E5819E40;
  v21 = v8;
  v22 = v9;
  v11 = v8;
  v12 = v9;
  v13 = _Block_copy(aBlock);
  v14 = sendEvent_withError_payload____analyticsQueue;
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __44__MRUAnalytics_sendEvent_withError_payload___block_invoke_3;
  v17[3] = &unk_1E58194F0;
  v18 = v7;
  v19 = v13;
  v15 = v7;
  v16 = v13;
  dispatch_async(v14, v17);

}

void __44__MRUAnalytics_sendEvent_withError_payload___block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *v3;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("com.apple.mediacontrols.MRUAnalytics", v0);
  v2 = (void *)sendEvent_withError_payload____analyticsQueue;
  sendEvent_withError_payload____analyticsQueue = (uint64_t)v1;

}

id __44__MRUAnalytics_sendEvent_withError_payload___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "code"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("errorCode"));

    objc_msgSend(*(id *)(a1 + 32), "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("errorDomain"));

  }
  return v3;
}

void __44__MRUAnalytics_sendEvent_withError_payload___block_invoke_3(uint64_t a1)
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
    _MRLogForCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v8 = v4;
      v9 = 2112;
      v10 = v2;
      _os_log_impl(&dword_1AA991000, v3, OS_LOG_TYPE_DEFAULT, "Logging to CoreAnalytics: %@\n%@", buf, 0x16u);
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

id __44__MRUAnalytics_sendEvent_withError_payload___block_invoke_14(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

@end
