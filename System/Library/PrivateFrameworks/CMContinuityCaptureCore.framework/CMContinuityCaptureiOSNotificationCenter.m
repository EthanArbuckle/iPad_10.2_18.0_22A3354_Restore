@implementation CMContinuityCaptureiOSNotificationCenter

- (CMContinuityCaptureiOSNotificationCenter)initWithQueue:(id)a3
{
  id v5;
  CMContinuityCaptureiOSNotificationCenter *v6;
  CMContinuityCaptureiOSNotificationCenter *v7;
  CMContinuityCaptureiOSNotificationCenter *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CMContinuityCaptureiOSNotificationCenter;
  v6 = -[CMContinuityCaptureUserNotificationCenter initWithQueue:](&v10, sel_initWithQueue_, v5);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = v7;
  }

  return v7;
}

- (void)scheduleNotification:(int64_t)a3 data:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11[2];
  id location;

  v6 = a4;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __70__CMContinuityCaptureiOSNotificationCenter_scheduleNotification_data___block_invoke;
  v9[3] = &unk_24F06B750;
  objc_copyWeak(v11, &location);
  v11[1] = (id)a3;
  v10 = v6;
  v8 = v6;
  dispatch_async(queue, v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __70__CMContinuityCaptureiOSNotificationCenter_scheduleNotification_data___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_scheduleNotification:data:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (void)_scheduleNotification:(int64_t)a3 data:(id)a4
{
  id v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  CFUserNotificationRef v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  SInt32 error;
  uint8_t buf[4];
  void *v46;
  _QWORD v47[4];
  _QWORD v48[5];

  v48[4] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = -[CMContinuityCaptureiOSNotificationCenter shouldDisplayNotification:](self, "shouldDisplayNotification:", a3);
  v8 = 0;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  if (!v6 || !v7)
    goto LABEL_14;
  objc_msgSend(v6, "objectForKey:", CFSTR("kContinuityCaptureNotificationKeyTitle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v8 = 0;
    v10 = 0;
LABEL_17:
    v11 = 0;
    goto LABEL_14;
  }
  objc_msgSend(v6, "objectForKey:", CFSTR("kContinuityCaptureNotificationKeyBody"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v8 = 0;
    v9 = 0;
    goto LABEL_17;
  }
  objc_msgSend(v6, "objectForKey:", CFSTR("kContinuityCaptureNotificationKeyButtonTitle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kContinuityCaptureNotificationKeyTitle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kContinuityCaptureNotificationKeyTitleArgs"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    CMContinuityCaptureCreateLocalizedString(v12, v13, v14, v15, v16, v17, v18, v19, v41);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kContinuityCaptureNotificationKeyBody"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kContinuityCaptureNotificationKeyBodyArgs"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    CMContinuityCaptureCreateLocalizedString(v20, v21, v22, v23, v24, v25, v26, v27, v42);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kContinuityCaptureNotificationKeyButtonTitle"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kContinuityCaptureNotificationKeyButtonTitle"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    CMContinuityCaptureCreateLocalizedString(v28, v29, v30, v31, v32, v33, v34, v35, v43);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = *MEMORY[0x24BDBD6E0];
    v47[0] = *MEMORY[0x24BDBD6D8];
    v47[1] = v36;
    v48[0] = v8;
    v48[1] = v9;
    v37 = *MEMORY[0x24BDBD6E8];
    v47[2] = *MEMORY[0x24BDBD6F8];
    v47[3] = v37;
    v48[2] = v10;
    v48[3] = MEMORY[0x24BDBD1C8];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v48, v47, 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    CMContinuityCaptureLog(0);
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v46 = v11;
      _os_log_impl(&dword_227C5D000, v38, OS_LOG_TYPE_DEFAULT, "Displaying UI notification: %@", buf, 0xCu);
    }

    error = 0;
    v39 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0.0, 2uLL, &error, (CFDictionaryRef)v11);
    if (v39 && !error)
      goto LABEL_13;
    CMContinuityCaptureLog(0);
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureiOSNotificationCenter _scheduleNotification:data:].cold.1(&error, (uint64_t)v39, v40);

    if (v39)
LABEL_13:
      CFRelease(v39);
  }
  else
  {
    v8 = 0;
    v9 = 0;
    v10 = 0;
  }
LABEL_14:

}

- (BOOL)shouldDisplayNotification:(int64_t)a3
{
  NSObject *v5;
  int v7;
  CMContinuityCaptureiOSNotificationCenter *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (a3 != 12)
  {
    CMContinuityCaptureLog(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138543618;
      v8 = self;
      v9 = 1024;
      v10 = a3;
      _os_log_impl(&dword_227C5D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Unsupported Notification Type for iOS Platform. (Type: %d)", (uint8_t *)&v7, 0x12u);
    }

  }
  return a3 == 12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_scheduleNotification:(os_log_t)log data:.cold.1(int *a1, uint64_t a2, os_log_t log)
{
  int v3;
  _DWORD v4[2];
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4[0] = 67109376;
  v4[1] = v3;
  v5 = 2048;
  v6 = a2;
  _os_log_error_impl(&dword_227C5D000, log, OS_LOG_TYPE_ERROR, "CFUserNotificationCreate gave error %d with notification result %p", (uint8_t *)v4, 0x12u);
}

@end
