@implementation ADUserNotifier

- (ADUserNotifier)init
{
  ADUserNotifier *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *notificationQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ADUserNotifier;
  v2 = -[ADUserNotifier init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.AppleDepth.userNotificationQueue", v3);
    notificationQueue = v2->_notificationQueue;
    v2->_notificationQueue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (void)showUserNotificationWithTitle:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  NSObject *notificationQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  notificationQueue = self->_notificationQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__ADUserNotifier_showUserNotificationWithTitle_message___block_invoke;
  block[3] = &unk_24C4217A0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(notificationQueue, block);

}

- (void)triggerApplicationWithNotificationTitle:(id)a3 notificationMessage:(id)a4 acceptButtonText:(id)a5 rejectButtonText:(id)a6 applicationURL:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *notificationQueue;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v30 = v12;
    v31 = 2112;
    v32 = v16;
    _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Triggering notification with title: %@; Application URL: %@",
      buf,
      0x16u);
  }
  notificationQueue = self->_notificationQueue;
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __127__ADUserNotifier_triggerApplicationWithNotificationTitle_notificationMessage_acceptButtonText_rejectButtonText_applicationURL___block_invoke;
  v23[3] = &unk_24C4217F0;
  v23[4] = self;
  v24 = v12;
  v25 = v13;
  v26 = v15;
  v27 = v14;
  v28 = v16;
  v18 = v16;
  v19 = v14;
  v20 = v15;
  v21 = v13;
  v22 = v12;
  dispatch_async(notificationQueue, v23);

}

- (void)triggerTapToRadarWithNotificationTitle:(id)a3 notificationMessage:(id)a4 radarTitle:(id)a5 radarComponent:(unint64_t)a6
{
  id v10;
  void *v11;
  id v12;

  v12 = a3;
  v10 = a4;
  -[ADUserNotifier buildTapToRadarURLWithRadarTitle:radarComponent:](self, "buildTapToRadarURLWithRadarTitle:radarComponent:", a5, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ADUserNotifier triggerApplicationWithNotificationTitle:notificationMessage:acceptButtonText:rejectButtonText:applicationURL:](self, "triggerApplicationWithNotificationTitle:notificationMessage:acceptButtonText:rejectButtonText:applicationURL:", v12, v10, CFSTR("File a radar"), CFSTR("Cancel"), v11);

}

- (BOOL)createNotificationWithTitle:(id)a3 message:(id)a4 defaultButton:(id)a5 alternateButton:(id)a6 responseBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  BOOL v17;
  NSObject *v18;
  const char *v19;
  const __CFAllocator *v20;
  __CFDictionary *Mutable;
  __CFUserNotification *v22;
  __CFRunLoopSource *RunLoopSource;
  void *v24;
  id v25;
  void *v26;
  __CFRunLoop *Main;
  SInt32 error;
  uint8_t buf[4];
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (+[ADDeviceConfiguration isInternalBuild](ADDeviceConfiguration, "isInternalBuild"))
  {
    if (self->_notification)
    {
      v17 = 0;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v31 = v12;
        v18 = MEMORY[0x24BDACB70];
        v19 = "Another notification is currently active, canceling notification with title: %@";
LABEL_8:
        _os_log_impl(&dword_20B62B000, v18, OS_LOG_TYPE_DEFAULT, v19, buf, 0xCu);
LABEL_24:
        v17 = 0;
      }
    }
    else
    {
      v20 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDBD6D8], v12);
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDBD6E0], v13);
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDBD6F8], v14);
      if (v15)
        CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDBD6F0], v15);
      error = 0;
      v22 = CFUserNotificationCreate(v20, 0.0, 0, &error, Mutable);
      self->_notification = v22;
      if (!v22)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v31) = error;
          _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to create a user notification with error %i", buf, 8u);
        }
        goto LABEL_24;
      }
      RunLoopSource = CFUserNotificationCreateRunLoopSource(v20, v22, (CFUserNotificationCallBack)userNotificationCallback, 0);
      self->_source = RunLoopSource;
      if (!RunLoopSource)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to create user notifier run loop source", buf, 2u);
        }
        goto LABEL_24;
      }
      objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", self->_notification);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (ADUserNotificationAlertResultBlockMap(void)::onceToken != -1)
        dispatch_once(&ADUserNotificationAlertResultBlockMap(void)::onceToken, &__block_literal_global);
      v25 = (id)ADUserNotificationAlertResultBlockMap(void)::s_map;
      v26 = (void *)MEMORY[0x20BD36900](v16);
      objc_msgSend(v25, "setObject:forKey:", v26, v24);

      Main = CFRunLoopGetMain();
      CFRunLoopAddSource(Main, self->_source, (CFRunLoopMode)*MEMORY[0x24BDBD598]);
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v31 = v12;
        _os_log_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Notification has been triggered with title: %@", buf, 0xCu);
      }
      CFRelease(Mutable);

      v17 = 1;
    }
  }
  else
  {
    if (!ADDebugUtilsADVerboseLogsEnabled)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v31 = v12;
        _os_log_debug_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "Customer build, canceling notification with title: %@", buf, 0xCu);
      }
      goto LABEL_24;
    }
    v17 = 0;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v12;
      v18 = MEMORY[0x24BDACB70];
      v19 = "Customer build, canceling notification with title: %@";
      goto LABEL_8;
    }
  }

  return v17;
}

- (void)dismissNotification
{
  __CFRunLoopSource *source;
  id v4;
  id v5;

  source = self->_source;
  if (source)
  {
    CFRunLoopSourceInvalidate(source);
    CFRelease(self->_source);
    self->_source = 0;
  }
  if (self->_notification)
  {
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (ADUserNotificationAlertResultBlockMap(void)::onceToken != -1)
      dispatch_once(&ADUserNotificationAlertResultBlockMap(void)::onceToken, &__block_literal_global);
    v4 = (id)ADUserNotificationAlertResultBlockMap(void)::s_map;
    objc_msgSend(v4, "removeObjectForKey:", v5);
    CFUserNotificationCancel(self->_notification);
    CFRelease(self->_notification);
    self->_notification = 0;

  }
}

- (void)dealloc
{
  objc_super v3;

  -[ADUserNotifier dismissNotification](self, "dismissNotification");
  v3.receiver = self;
  v3.super_class = (Class)ADUserNotifier;
  -[ADUserNotifier dealloc](&v3, sel_dealloc);
}

- (void)setComponentID:(id)a3 componentName:(id)a4 forQuery:(id)a5
{
  id v7;
  id v8;
  id v9;

  v9 = a3;
  v7 = a4;
  v8 = a5;
  objc_msgSend(v8, "setObject:forKey:", v9, CFSTR("ComponentID"));
  objc_msgSend(v8, "setObject:forKey:", v7, CFSTR("ComponentName"));

}

- (id)buildTapToRadarURLWithRadarTitle:(id)a3 radarComponent:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  unint64_t v29;
  _QWORD v30[3];
  _QWORD v31[5];

  v31[3] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCED8];
  v30[0] = CFSTR("Title");
  v30[1] = CFSTR("Classification");
  v22 = v6;
  v31[0] = v6;
  v31[1] = CFSTR("Other Bug");
  v30[2] = CFSTR("Reproducibility");
  v31[2] = CFSTR("I Didn't Try");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dictionaryWithDictionary:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 >= 4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v29 = a4;
      _os_log_error_impl(&dword_20B62B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "ADUserNotifier: Unknown radar component: %lu", buf, 0xCu);
    }
  }
  else
  {
    -[ADUserNotifier setComponentID:componentName:forQuery:](self, "setComponentID:componentName:forQuery:", off_24C421830[a4], off_24C421850[a4], v9);
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v24 != v13)
          objc_enumerationMutation(v11);
        v15 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        v16 = (void *)MEMORY[0x24BDD1838];
        objc_msgSend(v11, "objectForKeyedSubscript:", v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "queryItemWithName:value:", v15, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v18);

      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v12);
  }

  objc_msgSend(MEMORY[0x24BDD1808], "componentsWithString:", CFSTR("tap-to-radar://new"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setQueryItems:", v10);
  objc_msgSend(v19, "URL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationQueue, 0);
}

void __127__ADUserNotifier_triggerApplicationWithNotificationTitle_notificationMessage_acceptButtonText_rejectButtonText_applicationURL___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 64);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __127__ADUserNotifier_triggerApplicationWithNotificationTitle_notificationMessage_acceptButtonText_rejectButtonText_applicationURL___block_invoke_2;
  v7[3] = &unk_24C4217C8;
  objc_copyWeak(&v9, &location);
  v8 = *(id *)(a1 + 72);
  objc_msgSend(v2, "createNotificationWithTitle:message:defaultButton:alternateButton:responseBlock:", v3, v4, v5, v6, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __127__ADUserNotifier_triggerApplicationWithNotificationTitle_notificationMessage_acceptButtonText_rejectButtonText_applicationURL___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "dismissNotification");

  if (a2 == 1)
  {
    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "openURL:configuration:completionHandler:", *(_QWORD *)(a1 + 32), 0, 0);

  }
}

void __56__ADUserNotifier_showUserNotificationWithTitle_message___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __56__ADUserNotifier_showUserNotificationWithTitle_message___block_invoke_2;
  v5[3] = &unk_24C421778;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v2, "createNotificationWithTitle:message:defaultButton:alternateButton:responseBlock:", v3, v4, CFSTR("OK"), 0, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __56__ADUserNotifier_showUserNotificationWithTitle_message___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dismissNotification");

}

+ (id)defaultUserNotifier
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)+[ADUserNotifier defaultUserNotifier]::defaultUserNotifier;
  if (!+[ADUserNotifier defaultUserNotifier]::defaultUserNotifier)
  {
    v4 = objc_alloc_init((Class)a1);
    v5 = (void *)+[ADUserNotifier defaultUserNotifier]::defaultUserNotifier;
    +[ADUserNotifier defaultUserNotifier]::defaultUserNotifier = (uint64_t)v4;

    v3 = (void *)+[ADUserNotifier defaultUserNotifier]::defaultUserNotifier;
  }
  return v3;
}

@end
