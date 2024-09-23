@implementation _CDReceiverNotifier

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6 != -1)
    dispatch_once(&sharedInstance__pasOnceToken6, &__block_literal_global_46);
  return (id)sharedInstance__pasExprOnceResult_1;
}

- (_CDReceiverNotifier)init
{
  _CDReceiverNotifier *v2;
  objc_class *v3;
  id v4;
  const char *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  BMSource *intentSource;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  BMSource *activitySource;
  OS_dispatch_queue *v22;
  void *v23;
  uint64_t v24;
  _CDXPCEventPublisher *xpcPublisher;
  uint64_t v26;
  NSMutableDictionary *subscribers;
  _QWORD handler[4];
  id v30;
  id buf[2];
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)_CDReceiverNotifier;
  v2 = -[_CDReceiverNotifier init](&v32, sel_init);
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = (const char *)objc_msgSend(v4, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create(v5, v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    LODWORD(v5) = getuid();
    v2->_isRootProcess = (_DWORD)v5 == 0;
    _logChannel();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if ((_DWORD)v5)
    {
      if (v10)
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_18DDBE000, v9, OS_LOG_TYPE_DEFAULT, "Setting up AppIntent/AppActivity XPC event handler", (uint8_t *)buf, 2u);
      }

      objc_initWeak(buf, v2);
      v11 = v2->_queue;
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __27___CDReceiverNotifier_init__block_invoke;
      handler[3] = &unk_1E26E5838;
      objc_copyWeak(&v30, buf);
      xpc_set_event_stream_handler("com.apple.coreduet.xpc.receiver", v11, handler);
      BiomeLibrary();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "App");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "Intent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "source");
      v15 = objc_claimAutoreleasedReturnValue();
      intentSource = v2->_intentSource;
      v2->_intentSource = (BMSource *)v15;

      BiomeLibrary();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "App");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "Activity");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "source");
      v20 = objc_claimAutoreleasedReturnValue();
      activitySource = v2->_activitySource;
      v2->_activitySource = (BMSource *)v20;

      objc_destroyWeak(&v30);
      objc_destroyWeak(buf);
    }
    else
    {
      if (v10)
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_18DDBE000, v9, OS_LOG_TYPE_DEFAULT, "Setting up AppIntent/AppActivity XPC event publisher", (uint8_t *)buf, 2u);
      }

      v22 = v2->_queue;
      _logChannel();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[_CDXPCEventPublisher eventPublisherWithStreamName:delegate:queue:log:](_CDXPCEventPublisher, "eventPublisherWithStreamName:delegate:queue:log:", "com.apple.coreduet.xpc.receiver", v2, v22, v23);
      v24 = objc_claimAutoreleasedReturnValue();
      xpcPublisher = v2->_xpcPublisher;
      v2->_xpcPublisher = (_CDXPCEventPublisher *)v24;

      v26 = objc_opt_new();
      subscribers = v2->_subscribers;
      v2->_subscribers = (NSMutableDictionary *)v26;

    }
  }
  return v2;
}

- (void)publishXPCEventForAppIntents:(id)a3 appActivities:(id)a4 uid:(unsigned int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[2];
  _QWORD v39[2];
  _BYTE v40[128];
  uint8_t v41[128];
  uint8_t buf[4];
  id v43;
  __int16 v44;
  id v45;
  __int16 v46;
  int v47;
  uint64_t v48;

  v5 = *(_QWORD *)&a5;
  v48 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  _logChannel();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138478339;
    v43 = v8;
    v44 = 2113;
    v45 = v9;
    v46 = 1024;
    v47 = v5;
    _os_log_debug_impl(&dword_18DDBE000, v10, OS_LOG_TYPE_DEBUG, "Publishing XPC event with AppIntents: %{private}@; AppActivities: %{private}@; uid: %d",
      buf,
      0x1Cu);
  }

  v11 = (void *)objc_opt_new();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v12 = v8;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v35;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v35 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v16), "serialize");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
    }
    while (v14);
  }

  v18 = (void *)objc_opt_new();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v19 = v9;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v31;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v31 != v22)
          objc_enumerationMutation(v19);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v23), "serialize");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObject:", v24);

        ++v23;
      }
      while (v21 != v23);
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
    }
    while (v21);
  }

  v38[0] = CFSTR("_CDAppIntentsKey");
  v38[1] = CFSTR("_CDAppActivitiesKey");
  v39[0] = v11;
  v39[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  +[_CDXPCCodecs notificationEventWithRegistrationIdentifier:info:error:](_CDXPCCodecs, "notificationEventWithRegistrationIdentifier:info:error:", CFSTR("_CDAppIntentNotification"), v25, &v29);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v29;

  if (!v26 || v27)
  {
    _logChannel();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      -[_CDReceiverNotifier publishXPCEventForAppIntents:appActivities:uid:].cold.1();

  }
  else
  {
    -[_CDReceiverNotifier _publishXPCEvent:uid:](self, "_publishXPCEvent:uid:", v26, v5);
  }

}

- (void)publishXPCEventForDeletedIntentIdentifiers:(id)a3 bundleID:(id)a4 uid:(unsigned int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  _QWORD v16[2];
  _QWORD v17[2];
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v5 = *(_QWORD *)&a5;
  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  _logChannel();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138478339;
    v19 = v8;
    v20 = 2113;
    v21 = v9;
    v22 = 1024;
    v23 = v5;
    _os_log_debug_impl(&dword_18DDBE000, v10, OS_LOG_TYPE_DEBUG, "Publishing XPC event with deleted intent identifiers: %{private}@; bundleID: %{private}@; uid: %d",
      buf,
      0x1Cu);
  }

  v16[0] = CFSTR("_CDAppIntentsDeletedIdentifiersKey");
  v16[1] = CFSTR("_CDAppIntentsBundleIDKey");
  v17[0] = v8;
  v17[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  +[_CDXPCCodecs notificationEventWithRegistrationIdentifier:info:error:](_CDXPCCodecs, "notificationEventWithRegistrationIdentifier:info:error:", CFSTR("_CDAppIntentNotification"), v11, &v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v15;

  if (!v12 || v13)
  {
    _logChannel();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[_CDReceiverNotifier publishXPCEventForDeletedIntentIdentifiers:bundleID:uid:].cold.1();

  }
  else
  {
    -[_CDReceiverNotifier _publishXPCEvent:uid:](self, "_publishXPCEvent:uid:", v12, v5);
  }

}

- (void)publishXPCEventForDeletedIntentGroupIdentifiers:(id)a3 bundleID:(id)a4 uid:(unsigned int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  _QWORD v16[2];
  _QWORD v17[2];
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v5 = *(_QWORD *)&a5;
  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  _logChannel();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138478339;
    v19 = v8;
    v20 = 2113;
    v21 = v9;
    v22 = 1024;
    v23 = v5;
    _os_log_debug_impl(&dword_18DDBE000, v10, OS_LOG_TYPE_DEBUG, "Publishing XPC event with deleted intent group identifiers: %{private}@; bundleID: %{private}@; uid: %d",
      buf,
      0x1Cu);
  }

  v16[0] = CFSTR("_CDAppIntentsDeletedGroupIdentifiersKey");
  v16[1] = CFSTR("_CDAppIntentsBundleIDKey");
  v17[0] = v8;
  v17[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  +[_CDXPCCodecs notificationEventWithRegistrationIdentifier:info:error:](_CDXPCCodecs, "notificationEventWithRegistrationIdentifier:info:error:", CFSTR("_CDAppIntentNotification"), v11, &v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v15;

  if (!v12 || v13)
  {
    _logChannel();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[_CDReceiverNotifier publishXPCEventForDeletedIntentGroupIdentifiers:bundleID:uid:].cold.1();

  }
  else
  {
    -[_CDReceiverNotifier _publishXPCEvent:uid:](self, "_publishXPCEvent:uid:", v12, v5);
  }

}

- (void)_publishXPCEvent:(id)a3 uid:(unsigned int)a4
{
  void *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  _CDXPCEventPublisher *xpcPublisher;
  NSMutableDictionary *obj;
  id v16;
  _QWORD v17[5];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  obj = self->_subscribers;
  objc_sync_enter(obj);
  -[NSMutableDictionary allValues](self->_subscribers, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _logChannel();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[_CDReceiverNotifier _publishXPCEvent:uid:].cold.1();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v19;
    v11 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v13, "uid") == a4)
        {
          xpcPublisher = self->_xpcPublisher;
          v17[0] = v11;
          v17[1] = 3221225472;
          v17[2] = __44___CDReceiverNotifier__publishXPCEvent_uid___block_invoke;
          v17[3] = &unk_1E26E3118;
          v17[4] = v13;
          -[_CDXPCEventPublisher sendEvent:toSubscriber:handler:](xpcPublisher, "sendEvent:toSubscriber:handler:", v16, v13, v17);
        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  objc_sync_exit(obj);
}

- (void)handleXPCNotificationEvent:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL4 v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  void *v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t j;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  NSObject *v54;
  id v55;
  void *v56;
  id v57;
  void *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  id v67;
  id v68;
  id v69;
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _logChannel();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[_CDReceiverNotifier handleXPCNotificationEvent:].cold.8(v5, v6, v7, v8, v9, v10, v11, v12);

  v68 = 0;
  v69 = 0;
  v67 = 0;
  v13 = +[_CDXPCCodecs parseNotificationEvent:registrationIdentifier:info:error:](_CDXPCCodecs, "parseNotificationEvent:registrationIdentifier:info:error:", v4, &v69, &v68, &v67);
  v14 = v69;
  v15 = v68;
  v16 = v67;
  _logChannel();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (!v13)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[_CDReceiverNotifier handleXPCNotificationEvent:].cold.7();
    goto LABEL_42;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    -[_CDReceiverNotifier handleXPCNotificationEvent:].cold.6();

  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("_CDAppIntentsKey"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {

  }
  else
  {
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("_CDAppActivitiesKey"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
    {
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("_CDAppIntentsDeletedIdentifiersKey"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      if (v50)
      {
        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("_CDAppIntentsDeletedIdentifiersKey"));
        v18 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("_CDAppIntentsBundleIDKey"));
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        _logChannel();
        v52 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
          -[_CDReceiverNotifier handleXPCNotificationEvent:].cold.3();

        -[objc_class pruneWithDeletedIntentIdentifiers:bundleId:](getBMLibraryStreamsPrunerClass(), "pruneWithDeletedIntentIdentifiers:bundleId:", v18, v51);
      }
      else
      {
        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("_CDAppIntentsDeletedGroupIdentifiersKey"));
        v53 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v53)
        {
          _logChannel();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            -[_CDReceiverNotifier handleXPCNotificationEvent:].cold.1();
          goto LABEL_42;
        }
        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("_CDAppIntentsDeletedGroupIdentifiersKey"));
        v18 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("_CDAppIntentsBundleIDKey"));
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        _logChannel();
        v54 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
          -[_CDReceiverNotifier handleXPCNotificationEvent:].cold.2();

        -[objc_class pruneWithDeletedIntentGroupIdentifiers:bundleId:](getBMLibraryStreamsPrunerClass(), "pruneWithDeletedIntentGroupIdentifiers:bundleId:", v18, v51);
      }

LABEL_42:
      goto LABEL_43;
    }
  }
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("_CDAppIntentsKey"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v55 = v16;
  v57 = v14;
  if (v21)
  {
    _logChannel();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      -[_CDReceiverNotifier handleXPCNotificationEvent:].cold.5(v22, v23, v24, v25, v26, v27, v28, v29);

    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("_CDAppIntentsKey"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v64;
      do
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(_QWORD *)v64 != v33)
            objc_enumerationMutation(v30);
          objc_msgSend(MEMORY[0x1E0D01E90], "eventWithData:dataVersion:", *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * i), objc_msgSend(MEMORY[0x1E0D01E90], "latestDataVersion", v55, v57));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          -[BMSource sendEvent:](self->_intentSource, "sendEvent:", v35);

        }
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
      }
      while (v32);
    }

    v16 = v55;
    v14 = v57;
  }
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("_CDAppActivitiesKey"), v55, v57);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    _logChannel();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
      -[_CDReceiverNotifier handleXPCNotificationEvent:].cold.4(v37, v38, v39, v40, v41, v42, v43, v44);

    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("_CDAppActivitiesKey"));
    v18 = objc_claimAutoreleasedReturnValue();
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v45 = -[NSObject countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v59, v70, 16);
    if (v45)
    {
      v46 = v45;
      v47 = *(_QWORD *)v60;
      do
      {
        for (j = 0; j != v46; ++j)
        {
          if (*(_QWORD *)v60 != v47)
            objc_enumerationMutation(v18);
          objc_msgSend(MEMORY[0x1E0D01E80], "eventWithData:dataVersion:", *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * j), objc_msgSend(MEMORY[0x1E0D01E80], "latestDataVersion"));
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          -[BMSource sendEvent:](self->_activitySource, "sendEvent:", v49);

        }
        v46 = -[NSObject countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v59, v70, 16);
      }
      while (v46);
      v16 = v56;
      v14 = v58;
    }
    goto LABEL_42;
  }
LABEL_43:

}

- (void)addSubscriber:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *subscribers;
  void *v12;
  NSObject *v13;
  uint8_t v14[16];
  uint8_t buf[16];

  v4 = a3;
  _logChannel();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18DDBE000, v5, OS_LOG_TYPE_DEFAULT, "Adding subscriber", buf, 2u);
  }

  objc_msgSend(v4, "streamName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "token");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.coreduet.xpc.receiver");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", v6);

  if (v9)
  {
    v10 = self->_subscribers;
    objc_sync_enter(v10);
    subscribers = self->_subscribers;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](subscribers, "setObject:forKeyedSubscript:", v4, v12);

    _logChannel();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_18DDBE000, v13, OS_LOG_TYPE_DEFAULT, "Successfully added subscriber", v14, 2u);
    }

    objc_sync_exit(v10);
  }
  else
  {
    _logChannel();
    v10 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v10->super.super, OS_LOG_TYPE_ERROR))
      -[_CDReceiverNotifier addSubscriber:].cold.1();
  }

}

- (void)removeSubscriberWithToken:(unint64_t)a3 streamName:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *subscribers;
  void *v12;
  NSObject *v13;
  uint8_t v14[16];
  uint8_t buf[16];

  v6 = a4;
  _logChannel();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18DDBE000, v7, OS_LOG_TYPE_DEFAULT, "Removing subscriber", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "com.apple.coreduet.xpc.receiver");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", v6);

  if (v9)
  {
    v10 = self->_subscribers;
    objc_sync_enter(v10);
    subscribers = self->_subscribers;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](subscribers, "setObject:forKeyedSubscript:", 0, v12);

    _logChannel();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_18DDBE000, v13, OS_LOG_TYPE_DEFAULT, "Successfully removed subscriber for AppIntent recording", v14, 2u);
    }

    objc_sync_exit(v10);
  }
  else
  {
    _logChannel();
    v10 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v10->super.super, OS_LOG_TYPE_ERROR))
      -[_CDReceiverNotifier removeSubscriberWithToken:streamName:].cold.1();
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activitySource, 0);
  objc_storeStrong((id *)&self->_intentSource, 0);
  objc_storeStrong((id *)&self->_subscribers, 0);
  objc_storeStrong((id *)&self->_xpcPublisher, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)publishXPCEventForAppIntents:appActivities:uid:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18DDBE000, v0, v1, "Failed to encoding XPC event for AppIntents/AppActivities object with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)publishXPCEventForDeletedIntentIdentifiers:bundleID:uid:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18DDBE000, v0, v1, "Failed to encoding XPC event for deleted intent identifiers with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)publishXPCEventForDeletedIntentGroupIdentifiers:bundleID:uid:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18DDBE000, v0, v1, "Failed to encoding XPC event for deleted intent group identifiers with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_publishXPCEvent:uid:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5_0(&dword_18DDBE000, v0, v1, "All subscribers %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)handleXPCNotificationEvent:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18DDBE000, v0, v1, "Invalid XPC event object: %{private}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)handleXPCNotificationEvent:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_2_6(&dword_18DDBE000, v0, v1, "Deleting intents with group identifiers: %{private}@; bundleID: %{private}@");
  OUTLINED_FUNCTION_5();
}

- (void)handleXPCNotificationEvent:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_2_6(&dword_18DDBE000, v0, v1, "Deleting intents with identifiers: %{private}@; bundleID: %{private}@");
  OUTLINED_FUNCTION_5();
}

- (void)handleXPCNotificationEvent:(uint64_t)a3 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_8(&dword_18DDBE000, a1, a3, "Donating AppActivities to Biome", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)handleXPCNotificationEvent:(uint64_t)a3 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_8(&dword_18DDBE000, a1, a3, "Donating AppIntents to Biome", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)handleXPCNotificationEvent:.cold.6()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_2_6(&dword_18DDBE000, v0, v1, "Received XPC notification event for registration %@: %{private}@");
  OUTLINED_FUNCTION_5();
}

- (void)handleXPCNotificationEvent:.cold.7()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6_9(&dword_18DDBE000, v0, v1, "Failed to parse notification event for registration %@: %@");
  OUTLINED_FUNCTION_5();
}

- (void)handleXPCNotificationEvent:(uint64_t)a3 .cold.8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_8(&dword_18DDBE000, a1, a3, "Handling notification event", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)addSubscriber:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18DDBE000, v0, v1, "Unknown event stream name adding subscriber: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)removeSubscriberWithToken:streamName:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_18DDBE000, v0, v1, "Unknown event stream name removing subscriber: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

@end
