@implementation AHFTrackpadController

- (AHFTrackpadController)init
{
  AHFTrackpadController *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  AHFTrackpadController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AHFTrackpadController;
  v2 = -[AHFTrackpadController init](&v7, sel_init);
  if (v2
    && (v3 = dispatch_queue_create("com.apple.hid.AppleHIDFeedback.Trackpad", 0),
        queue = v2->_queue,
        v2->_queue = (OS_dispatch_queue *)v3,
        queue,
        v2->_queue))
  {
    v2->_prevTimestampUs = 0;
    v5 = 0;
    if (-[AHFTrackpadController initializeTrackpadSystem](v2, "initializeTrackpadSystem"))
      v5 = v2;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[AHFTrackpadController trackpadClient](self, "trackpadClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AHFTrackpadController trackpadClient](self, "trackpadClient");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancel");

  }
  v5.receiver = self;
  v5.super_class = (Class)AHFTrackpadController;
  -[AHFTrackpadController dealloc](&v5, sel_dealloc);
}

- (BOOL)initializeTrackpadSystem
{
  NSMutableDictionary *v3;
  NSMutableDictionary *availableTrackpads;
  void *v5;
  HIDEventSystemClient *v6;
  HIDEventSystemClient *trackpadClient;
  void *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD);
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[4];
  id v25;
  id location;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = (NSMutableDictionary *)objc_opt_new();
  availableTrackpads = self->_availableTrackpads;
  self->_availableTrackpads = v3;

  -[AHFTrackpadController availableTrackpads](self, "availableTrackpads");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    return 0;
  v6 = (HIDEventSystemClient *)objc_msgSend(objc_alloc(MEMORY[0x24BE3E800]), "initWithType:", 2);
  trackpadClient = self->_trackpadClient;
  self->_trackpadClient = v6;

  -[AHFTrackpadController trackpadClient](self, "trackpadClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    return 0;
  -[AHFTrackpadController trackpadClient](self, "trackpadClient");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMatching:", &unk_2507CBCA0);

  objc_initWeak(&location, self);
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __49__AHFTrackpadController_initializeTrackpadSystem__block_invoke;
  v24[3] = &unk_2507CAAF8;
  objc_copyWeak(&v25, &location);
  v10 = (void (**)(_QWORD, _QWORD))MEMORY[0x23B7F3730](v24);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[AHFTrackpadController trackpadClient](self, "trackpadClient", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "services");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v27, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v21;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v12);
        v10[2](v10, *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v15++));
      }
      while (v13 != v15);
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v27, 16);
    }
    while (v13);
  }

  -[AHFTrackpadController trackpadClient](self, "trackpadClient");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setServiceNotificationHandler:", v10);

  -[AHFTrackpadController trackpadClient](self, "trackpadClient");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setDispatchQueue:", self->_queue);

  -[AHFTrackpadController trackpadClient](self, "trackpadClient");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "activate");

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
  return 1;
}

void __49__AHFTrackpadController_initializeTrackpadSystem__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11[2];
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  const char *label;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v6 = (void *)objc_msgSend(v3, "serviceID");
    LoggingFramework();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v13 = "-[AHFTrackpadController initializeTrackpadSystem]_block_invoke";
      v14 = 2048;
      v15 = v6;
      v16 = 2080;
      label = dispatch_queue_get_label(0);
      _os_log_impl(&dword_236442000, v7, OS_LOG_TYPE_DEFAULT, "%s Trackpad with senderID 0x%llx added in %s queue", buf, 0x20u);
    }

    objc_msgSend(WeakRetained, "availableTrackpads");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v3, v9);

    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __49__AHFTrackpadController_initializeTrackpadSystem__block_invoke_13;
    v10[3] = &unk_2507CAAD0;
    objc_copyWeak(v11, v4);
    v11[1] = v6;
    objc_msgSend(v3, "setRemovalHandler:", v10);
    objc_destroyWeak(v11);
  }

}

void __49__AHFTrackpadController_initializeTrackpadSystem__block_invoke_13(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  const char *label;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    LoggingFramework();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 40);
      v7 = 136315650;
      v8 = "-[AHFTrackpadController initializeTrackpadSystem]_block_invoke";
      v9 = 2048;
      v10 = v4;
      v11 = 2080;
      label = dispatch_queue_get_label(0);
      _os_log_impl(&dword_236442000, v3, OS_LOG_TYPE_DEFAULT, "%s Trackpad with senderID 0x%llx removed in %s queue", (uint8_t *)&v7, 0x20u);
    }

    objc_msgSend(WeakRetained, "availableTrackpads");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectForKey:", v6);

  }
}

- (int)getActuationIdForPattern:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("detent_in")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("detent_out")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("edge")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("app_switcher")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("empty_app_switcher")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("generic_selection")) & 1) != 0
         || (objc_msgSend(v3, "isEqualToString:", CFSTR("index_bar_selection")) & 1) != 0)
  {
    v4 = 30;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("page_control_selection")) & 1) != 0)
  {
    v4 = 32;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("drag_drop_table_edit")) & 1) != 0)
  {
    v4 = 33;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("context_menu")) & 1) != 0)
  {
    v4 = 34;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("state")) & 1) != 0)
  {
    v4 = 35;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("refresh")))
  {
    v4 = 36;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)playFeedbackGated:(id)a3 client:(id)a4 timestamp:(unint64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  NSObject *v22;
  float v23;
  void *v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  unint64_t v38;
  __int16 v39;
  double v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = machTimeToMicrosec(a5);
  v13 = -[AHFTrackpadController getActuationIdForPattern:](self, "getActuationIdForPattern:", v10);
  if ((_DWORD)v13)
  {
    v19 = v13;
    v20 = mach_absolute_time();
    v21 = machTimeToMicrosec(v20);
    LoggingFramework();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = (float)(v12 - self->_prevTimestampUs);
      *(_DWORD *)buf = 136315906;
      v34 = "-[AHFTrackpadController playFeedbackGated:client:timestamp:error:]";
      v35 = 2112;
      v36 = v10;
      v37 = 2048;
      v38 = v21 - v12;
      v39 = 2048;
      v40 = (float)(v23 / 1000.0);
      _os_log_impl(&dword_236442000, v22, OS_LOG_TYPE_DEFAULT, "%s Playing pattern %@ requested %lldus ago, previous was %.2fms ago", buf, 0x2Au);
    }

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v19);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v11, "setProperty:forKey:", v24, CFSTR("AppKitActuateWithID"));

    if (v25)
    {
      v31 = -536870212;
      failure(a6, -536870212, (uint64_t)"Error requesting playback of actuation ID %d to service", v26, v27, v28, v29, v30, v19);
    }
    else
    {
      v31 = 0;
    }
    self->_prevTimestampUs = v12;
  }
  else
  {
    v31 = -536870206;
    failure(a6, -536870206, (uint64_t)"Could not find pattern %@", v14, v15, v16, v17, v18, (uint64_t)v10);
  }

  return v31;
}

- (int)playFeedback:(id)a3 senderID:(unint64_t)a4 timestamp:(unint64_t)a5 error:(id *)a6
{
  id v10;
  NSObject *v11;
  NSObject *queue;
  id v13;
  int v14;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  id v20[3];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  int v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  unint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = -536870212;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__0;
  v25 = __Block_byref_object_dispose__0;
  v26 = 0;
  LoggingFramework();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v32 = "-[AHFTrackpadController playFeedback:senderID:timestamp:error:]";
    v33 = 2112;
    v34 = v10;
    v35 = 2048;
    v36 = a4;
    _os_log_impl(&dword_236442000, v11, OS_LOG_TYPE_DEFAULT, "%s Trying to play pattern %@ on trackpad HID sender ID 0x%llX", buf, 0x20u);
  }

  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __63__AHFTrackpadController_playFeedback_senderID_timestamp_error___block_invoke;
  v16[3] = &unk_2507CAB20;
  objc_copyWeak(v20, (id *)buf);
  v20[1] = (id)a4;
  v18 = &v27;
  v19 = &v21;
  v13 = v10;
  v17 = v13;
  v20[2] = (id)a5;
  dispatch_sync(queue, v16);
  v14 = *((_DWORD *)v28 + 6);
  if (a6 && v14)
  {
    *a6 = objc_retainAutorelease((id)v22[5]);
    v14 = *((_DWORD *)v28 + 6);
  }

  objc_destroyWeak(v20);
  objc_destroyWeak((id *)buf);
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  return v14;
}

void __63__AHFTrackpadController_playFeedback_senderID_timestamp_error___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id obj;
  id v21;

  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "availableTrackpads");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 64));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v12 = objc_loadWeakRetained(v2);
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(_QWORD *)(a1 + 72);
    v15 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    obj = 0;
    v16 = objc_msgSend(v12, "playFeedbackGated:client:timestamp:error:", v13, v6, v14, &obj);
    objc_storeStrong(v15, obj);
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v16;
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = -536870208;
    v17 = *(_QWORD *)(a1 + 40);
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v21 = *(id *)(v18 + 40);
    failure(&v21, *(_DWORD *)(*(_QWORD *)(v17 + 8) + 24), (uint64_t)"SenderID 0x%llX not found", v7, v8, v9, v10, v11, *(_QWORD *)(a1 + 64));
    v19 = v21;
    v12 = *(id *)(v18 + 40);
    *(_QWORD *)(v18 + 40) = v19;
  }

}

- (int)playFeedback:(id)a3 accessoryID:(id)a4 timestamp:(unint64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  NSObject *v12;
  NSObject *queue;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  int v22;
  _QWORD block[4];
  id v25;
  id v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t *v29;
  id v30[2];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  int v44;
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  id v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = -536870212;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__0;
  v39 = __Block_byref_object_dispose__0;
  v40 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  LoggingFramework();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v46 = "-[AHFTrackpadController playFeedback:accessoryID:timestamp:error:]";
    v47 = 2112;
    v48 = v10;
    v49 = 2112;
    v50 = v11;
    _os_log_impl(&dword_236442000, v12, OS_LOG_TYPE_DEFAULT, "%s Trying to play pattern %@ on trackpad power source accessory ID %@", buf, 0x20u);
  }

  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__AHFTrackpadController_playFeedback_accessoryID_timestamp_error___block_invoke;
  block[3] = &unk_2507CAB70;
  objc_copyWeak(v30, (id *)buf);
  v14 = v11;
  v25 = v14;
  v27 = &v41;
  v15 = v10;
  v26 = v15;
  v28 = &v35;
  v30[1] = (id)a5;
  v29 = &v31;
  dispatch_sync(queue, block);
  v21 = v42;
  if (a6 && *((_DWORD *)v42 + 6))
  {
    *a6 = objc_retainAutorelease((id)v36[5]);
    v21 = v42;
  }
  if (!*((_BYTE *)v32 + 24))
  {
    *((_DWORD *)v21 + 6) = -536870208;
    failure(a6, -536870208, (uint64_t)"Accessory ID %@ not found", v16, v17, v18, v19, v20, (uint64_t)v14);
    v21 = v42;
  }
  v22 = *((_DWORD *)v21 + 6);

  objc_destroyWeak(v30);
  objc_destroyWeak((id *)buf);
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);

  _Block_object_dispose(&v41, 8);
  return v22;
}

void __66__AHFTrackpadController_playFeedback_accessoryID_timestamp_error___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id *v15;
  int v16;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v2 = (id *)(a1 + 72);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(WeakRetained, "availableTrackpads");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v10, "propertyForKey:", CFSTR("SerialNumber"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", v11))
        {
          v12 = objc_loadWeakRetained(v2);
          v13 = *(_QWORD *)(a1 + 40);
          v14 = *(_QWORD *)(a1 + 80);
          v15 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
          obj = 0;
          v16 = objc_msgSend(v12, "playFeedbackGated:client:timestamp:error:", v13, v10, v14, &obj);
          objc_storeStrong(v15, obj);
          *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v16;

          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
          goto LABEL_11;
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

}

- (id)allPatterns
{
  return &unk_2507CBC10;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (unint64_t)prevTimestampUs
{
  return self->_prevTimestampUs;
}

- (void)setPrevTimestampUs:(unint64_t)a3
{
  self->_prevTimestampUs = a3;
}

- (HIDEventSystemClient)trackpadClient
{
  return self->_trackpadClient;
}

- (void)setTrackpadClient:(id)a3
{
  objc_storeStrong((id *)&self->_trackpadClient, a3);
}

- (NSMutableDictionary)availableTrackpads
{
  return self->_availableTrackpads;
}

- (void)setAvailableTrackpads:(id)a3
{
  objc_storeStrong((id *)&self->_availableTrackpads, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availableTrackpads, 0);
  objc_storeStrong((id *)&self->_trackpadClient, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
