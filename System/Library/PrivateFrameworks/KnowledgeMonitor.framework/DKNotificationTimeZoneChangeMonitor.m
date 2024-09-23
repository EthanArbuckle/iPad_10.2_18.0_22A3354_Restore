@implementation DKNotificationTimeZoneChangeMonitor

void __43___DKNotificationTimeZoneChangeMonitor_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.coreduet.monitors", "_DKNotificationTimeZoneChangeMonitor");
  v1 = (void *)log_log_3;
  log_log_3 = (uint64_t)v0;

}

void __48___DKNotificationTimeZoneChangeMonitor_activate__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  double Current;
  double v10;
  double v11;
  void *v12;
  char v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[6];
  uint8_t buf[8];
  uint8_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 146))
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219056000, v2, OS_LOG_TYPE_DEFAULT, "Checking current state of timezone stream", buf, 2u);
    }

    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0CC98]), "initWithStartDate:endDate:maxEvents:lastN:reversed:", 0, 0, 1, 1, 0);
    BiomeLibrary();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "Device");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "TimeZone");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "publisherWithOptions:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    *(_QWORD *)buf = 0;
    v21 = buf;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__5;
    v24 = __Block_byref_object_dispose__5;
    v25 = 0;
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __48___DKNotificationTimeZoneChangeMonitor_activate__block_invoke_2;
    v19[3] = &unk_24DA67560;
    v19[4] = *(_QWORD *)(a1 + 32);
    v19[5] = buf;
    v8 = (id)objc_msgSend(v7, "sinkWithCompletion:receiveInput:", &__block_literal_global_18, v19);
    Current = CFAbsoluteTimeGetCurrent();
    objc_msgSend(*((id *)v21 + 5), "timestamp");
    v11 = v10;
    objc_msgSend(*((id *)v21 + 5), "eventBody");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqual:", *(_QWORD *)(a1 + 40));
    if (Current - v11 <= 604800.0)
      v14 = v13;
    else
      v14 = 0;

    if ((v14 & 1) != 0)
    {
      objc_msgSend(*((id *)v21 + 5), "eventBody");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(a1 + 32);
      v17 = *(void **)(v16 + 160);
      *(_QWORD *)(v16 + 160) = v15;

      objc_msgSend(*((id *)v21 + 5), "timestamp");
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152) = v18;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_updateWithTimeZone:timestamp:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 48));
    }
    _Block_object_dispose(buf, 8);

  }
}

void __48___DKNotificationTimeZoneChangeMonitor_activate__block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  objc_msgSend((id)objc_opt_class(), "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "eventBody");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timestamp");
    v8 = 138412546;
    v9 = v6;
    v10 = 2048;
    v11 = v7;
    _os_log_impl(&dword_219056000, v5, OS_LOG_TYPE_DEFAULT, "Loaded last timezone event %@ at %f", (uint8_t *)&v8, 0x16u);

  }
}

void __48___DKNotificationTimeZoneChangeMonitor_activate__block_invoke_21(uint64_t a1)
{
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 168));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 145) = 1;
}

uint64_t __61___DKNotificationTimeZoneChangeMonitor_enqueueTimeZoneUpdate__block_invoke(uint64_t result)
{
  uint64_t v1;
  double Current;
  uint64_t v3;
  double v4;

  if (!*(_BYTE *)(*(_QWORD *)(result + 32) + 146))
  {
    v1 = result;
    Current = CFAbsoluteTimeGetCurrent();
    v3 = *(_QWORD *)(v1 + 32);
    v4 = *(double *)(v3 + 152);
    result = objc_msgSend(*(id *)(v3 + 160), "isEqual:", *(_QWORD *)(v1 + 40));
    if (!(_DWORD)result || Current - v4 > 604800.0)
      return objc_msgSend(*(id *)(v1 + 32), "_updateWithTimeZone:timestamp:", *(_QWORD *)(v1 + 40), *(double *)(v1 + 48));
  }
  return result;
}

@end
