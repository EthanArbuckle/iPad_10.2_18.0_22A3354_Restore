@implementation NEUserNotification

- (id)initAndShowAlertWithHeader:(id)a3 message:(id)a4 alternateMessage:(id)a5 defaultMessage:(id)a6 noBoldDefault:(BOOL)a7 usePrivacyIcon:(BOOL)a8 extensionItem:(id)a9 callbackQueue:(id)a10 callbackHandler:(id)a11
{
  _BOOL4 v11;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  NEUserNotification *v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  _BOOL4 v28;
  id v29;
  void *v30;
  SEL v31;
  const __CFAllocator *v32;
  __CFDictionary *Mutable;
  const char *v34;
  __CFDictionary *v35;
  const void **v36;
  void *v37;
  void *v38;
  void *v39;
  NEUserNotification *v40;
  NSObject *v41;
  CFOptionFlags v42;
  CFUserNotificationRef v43;
  const char *v44;
  NEUserNotification *v45;
  NEUserNotification *v47;
  id v48;
  const __CFAllocator *v49;
  _BOOL4 v50;
  void *value;
  id v52;
  SInt32 error;
  objc_super v54;
  id v55;
  uint8_t buf[4];
  NEUserNotification *v57;
  uint64_t v58;

  v11 = a7;
  v58 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a9;
  v21 = a10;
  v22 = a11;
  v54.receiver = self;
  v54.super_class = (Class)NEUserNotification;
  v23 = -[NEUserNotification init](&v54, sel_init);
  if (!v23)
    goto LABEL_36;
  v50 = v11;
  value = v16;
  os_unfair_lock_lock((os_unfair_lock_t)&g_currentNotificationLock);
  v24 = objc_msgSend((id)g_currentNotifications, "count");
  ne_log_obj();
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v24)
  {
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend((id)g_currentNotifications, "firstObject");
      v47 = (NEUserNotification *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v57 = v47;
      _os_log_error_impl(&dword_19BD16000, v26, OS_LOG_TYPE_ERROR, "Already have outstanding notification %@, cannot show an additional one", buf, 0xCu);

    }
    os_unfair_lock_unlock((os_unfair_lock_t)&g_currentNotificationLock);
    goto LABEL_38;
  }
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v57 = v23;
    _os_log_debug_impl(&dword_19BD16000, v26, OS_LOG_TYPE_DEBUG, "Adding notification %@", buf, 0xCu);
  }

  v27 = (void *)g_currentNotifications;
  v28 = v50;
  if (!g_currentNotifications)
  {
    v29 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v30 = (void *)g_currentNotifications;
    g_currentNotifications = (uint64_t)v29;

    v27 = (void *)g_currentNotifications;
  }
  objc_msgSend(v27, "addObject:", v23);
  os_unfair_lock_unlock((os_unfair_lock_t)&g_currentNotificationLock);
  error = 0;
  objc_setProperty_atomic(v23, v31, 0, 16);
  v32 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (Mutable)
  {
    v35 = Mutable;
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0C9B800], value);
    if (v17)
      CFDictionarySetValue(v35, (const void *)*MEMORY[0x1E0C9B810], v17);
    if (v18)
      CFDictionarySetValue(v35, (const void *)*MEMORY[0x1E0C9B830], v18);
    if (v19)
    {
      v36 = (const void **)MEMORY[0x1E0C9B868];
      if (!v50)
        v36 = (const void **)MEMORY[0x1E0C9B838];
      CFDictionarySetValue(v35, *v36, v19);
    }
    if (v20)
    {
      v48 = v17;
      v49 = v32;
      CFDictionarySetValue(v35, CFSTR("SBUserNotificationExtensionIdentifier"), CFSTR("com.apple.corelocation.CoreLocationMapLNPromptPlugin"));
      v37 = (void *)MEMORY[0x1E0CB36F8];
      v55 = v20;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v55, 1);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = 0;
      objc_msgSend(v37, "archivedDataWithRootObject:requiringSecureCoding:error:", v38, 1, &v52);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = (NEUserNotification *)v52;

      if (v39 || !v40)
      {
        CFDictionarySetValue(v35, CFSTR("SBUserNotificationExtensionItems"), v39);
      }
      else
      {
        ne_log_obj();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v57 = v40;
          _os_log_error_impl(&dword_19BD16000, v41, OS_LOG_TYPE_ERROR, "Failed to encode extension item data, error='%@'", buf, 0xCu);
        }

      }
      v28 = v50;

      v17 = v48;
      v32 = v49;
    }
    if (v28)
      v42 = 35;
    else
      v42 = 1;
    v43 = CFUserNotificationCreate(v32, 0.0, v42, &error, v35);
    CFRelease(v35);
    if (!v43 || error)
      goto LABEL_37;
    objc_setProperty_atomic(v23, v44, v43, 16);

  }
  if (!objc_getProperty(v23, v34, 16, 1)
    || (v23->_isAlert = 1,
        !-[NEUserNotification postNotificationWithCallbackQueue:callbackHandler:]((uint64_t)v23, v21, v22)))
  {
LABEL_37:
    -[NEUserNotification cancel](v23, "cancel");
LABEL_38:
    v45 = 0;
    v16 = value;
    goto LABEL_39;
  }
  v16 = value;
LABEL_36:
  v45 = v23;
LABEL_39:

  return v45;
}

- (id)initAndShowAuthenticationWithHeader:(id)a3 options:(id)a4 flags:(unint64_t)a5 callbackQueue:(id)a6 callbackHandler:(id)a7
{
  id v12;
  const __CFDictionary *v13;
  id v14;
  id v15;
  NEUserNotification *v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  SEL v23;
  const char *v24;
  const void *v25;
  const __CFAllocator *v26;
  __CFDictionary *MutableCopy;
  const char *v28;
  CFUserNotificationRef v29;
  NEUserNotification *v30;
  NEUserNotification *v32;
  objc_super v33;
  SInt32 error;
  NEUserNotification *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = (const __CFDictionary *)a4;
  v14 = a6;
  v15 = a7;
  v33.receiver = self;
  v33.super_class = (Class)NEUserNotification;
  v16 = -[NEUserNotification init](&v33, sel_init);
  if (!v16)
    goto LABEL_20;
  os_unfair_lock_lock((os_unfair_lock_t)&g_currentNotificationLock);
  v17 = objc_msgSend((id)g_currentNotifications, "count");
  ne_log_obj();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v17)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend((id)g_currentNotifications, "firstObject");
      v32 = (NEUserNotification *)objc_claimAutoreleasedReturnValue();
      error = 138412290;
      v35 = v32;
      _os_log_error_impl(&dword_19BD16000, v19, OS_LOG_TYPE_ERROR, "Already have outstanding notification %@, cannot show an additional one", (uint8_t *)&error, 0xCu);

    }
    os_unfair_lock_unlock((os_unfair_lock_t)&g_currentNotificationLock);
    goto LABEL_22;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    error = 138412290;
    v35 = v16;
    _os_log_debug_impl(&dword_19BD16000, v19, OS_LOG_TYPE_DEBUG, "No outstanding notification, we are now the current notification %@", (uint8_t *)&error, 0xCu);
  }

  v20 = (void *)g_currentNotifications;
  if (!g_currentNotifications)
  {
    v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v22 = (void *)g_currentNotifications;
    g_currentNotifications = (uint64_t)v21;

    v20 = (void *)g_currentNotifications;
  }
  objc_msgSend(v20, "addObject:", v16);
  os_unfair_lock_unlock((os_unfair_lock_t)&g_currentNotificationLock);
  error = 0;
  objc_setProperty_atomic(v16, v23, 0, 16);
  if (v13)
  {
    NEResourcesCopyLocalizedNSString(CFSTR("CANCEL_BUTTON"), CFSTR("CANCEL_BUTTON"));
    v25 = (const void *)objc_claimAutoreleasedReturnValue();
    v26 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, v13);
    CFDictionarySetValue(MutableCopy, (const void *)*MEMORY[0x1E0C9B800], v12);
    CFDictionarySetValue(MutableCopy, (const void *)*MEMORY[0x1E0C9B830], v25);
    v29 = CFUserNotificationCreate(v26, 150.0, a5, &error, MutableCopy);
    if (MutableCopy)
      CFRelease(MutableCopy);
    if (v25)
      CFRelease(v25);
    if (!v29 || error)
      goto LABEL_21;
    objc_setProperty_atomic(v16, v28, v29, 16);

  }
  if (!objc_getProperty(v16, v24, 16, 1)
    || !-[NEUserNotification postNotificationWithCallbackQueue:callbackHandler:]((uint64_t)v16, v14, v15))
  {
LABEL_21:
    -[NEUserNotification cancel](v16, "cancel");
LABEL_22:
    v30 = 0;
    goto LABEL_23;
  }
LABEL_20:
  v30 = v16;
LABEL_23:

  return v30;
}

- (void)cancel
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __28__NEUserNotification_cancel__block_invoke;
  v2[3] = &unk_1E3CC41F0;
  v2[4] = self;
  +[NEUserNotification executeOnMainLoop:]((uint64_t)NEUserNotification, v2);
}

- (id)initAndShowAddConfigurationsForApp:(id)a3 warningHeader:(const char *)a4 warning:(const char *)a5 callbackQueue:(id)a6 callbackHandler:(id)a7
{
  id v10;
  id v11;
  id v12;
  void *v13;
  int v14;
  int v15;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  __CFString *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  unsigned __int8 v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v10 = a7;
  v11 = a6;
  v12 = a3;
  objc_opt_self();
  if (!g_UIKitBundle)
  {
    v37 = 0;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "fileExistsAtPath:isDirectory:", CFSTR("/System/Library/PrivateFrameworks/UIKitCore.framework"), &v37);
    v15 = v37;

    if (v14 && v15 != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/UIKitCore.framework"));
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)g_UIKitBundle;
      g_UIKitBundle = v17;

      if (g_UIKitBundle)
      {
        objc_msgSend((id)g_UIKitBundle, "load");
        g_UIDeviceClass = objc_msgSend((id)g_UIKitBundle, "classNamed:", CFSTR("UIDevice"));
        ne_log_obj();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          v39 = "+[NEUserNotification getUIDeviceClass]";
          v40 = 2112;
          v41 = g_UIKitBundle;
          v42 = 2112;
          v43 = g_UIDeviceClass;
          _os_log_debug_impl(&dword_19BD16000, v19, OS_LOG_TYPE_DEBUG, "%s: bundle %@ class %@", buf, 0x20u);
        }

      }
    }
  }
  objc_msgSend((id)g_UIDeviceClass, "currentDevice");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    objc_msgSend(v20, "localizedModel");
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = CFSTR("Mac");
  }
  v23 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  NEResourcesCopyLocalizedNSString(v24, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v23, "initWithFormat:", v25, v12);

  v27 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a5);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  NEResourcesCopyLocalizedNSString(v28, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v27, "initWithFormat:", v29, v22, v12);

  NEResourcesCopyLocalizedNSString(CFSTR("DONT_ALLOW_BUTTON"), CFSTR("DONT_ALLOW_BUTTON"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  NEResourcesCopyLocalizedNSString(CFSTR("ALLOW_BUTTON"), CFSTR("ALLOW_BUTTON"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = -[NEUserNotification initAndShowAlertWithHeader:message:alternateMessage:defaultMessage:noBoldDefault:usePrivacyIcon:extensionItem:callbackQueue:callbackHandler:](self, "initAndShowAlertWithHeader:message:alternateMessage:defaultMessage:noBoldDefault:usePrivacyIcon:extensionItem:callbackQueue:callbackHandler:", v26, v30, v32, v31, 0, 0, 0, v11, v10);

  return v33;
}

- (id)initAndShowLocalNetworkAlertWithAppName:(id)a3 reasonString:(id)a4 extensionItem:(id)a5 callbackQueue:(id)a6 callbackHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v29;

  v11 = a4;
  v12 = a5;
  v13 = a7;
  v14 = a6;
  v15 = a3;
  NEResourcesCopyDeviceLocalizedNSString(CFSTR("APP_WANTS_LOCAL_NETWORK_HEADER"), CFSTR("APP_WANTS_LOCAL_NETWORK_HEADER"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v17 = v11;
  }
  else
  {
    NEResourcesCopyDeviceLocalizedNSString(CFSTR("APP_WANTS_LOCAL_NETWORK_MESSAGE"), CFSTR("APP_WANTS_LOCAL_NETWORK_MESSAGE"));
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  v18 = v17;
  v19 = _os_feature_enabled_impl();
  if (v12 && v19)
  {
    NEResourcesCopyDeviceLocalizedNSString(CFSTR("APP_WANTS_LOCAL_NETWORK_DISCOVERED_DEVICES_MESSAGE"), CFSTR("APP_WANTS_LOCAL_NETWORK_DISCOVERED_DEVICES_MESSAGE"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v29 = v16;
      objc_msgSend(v12, "userInfo");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        objc_msgSend(v12, "userInfo");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)objc_msgSend(v22, "mutableCopy");

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
      }

      objc_msgSend(v23, "setObject:forKey:", v20, CFSTR("message"));
      objc_msgSend(v12, "setUserInfo:", v23);

      v16 = v29;
    }

  }
  NEResourcesCopyDeviceLocalizedNSString(CFSTR("ALLOW_BUTTON"), CFSTR("ALLOW_BUTTON"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  NEResourcesCopyDeviceLocalizedNSString(CFSTR("DONT_ALLOW_BUTTON"), CFSTR("DONT_ALLOW_BUTTON"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", v16, v15);

  v27 = -[NEUserNotification initAndShowAlertWithHeader:message:alternateMessage:defaultMessage:noBoldDefault:usePrivacyIcon:extensionItem:callbackQueue:callbackHandler:](self, "initAndShowAlertWithHeader:message:alternateMessage:defaultMessage:noBoldDefault:usePrivacyIcon:extensionItem:callbackQueue:callbackHandler:", v26, v18, v25, v24, 1, 1, v12, v14, v13);
  return v27;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong(&self->_notificationSource, 0);
  objc_storeStrong(&self->_notification, 0);
}

void __28__NEUserNotification_cancel__block_invoke(uint64_t a1)
{
  const char *v2;
  void *v3;
  const char *v4;
  id Property;
  __CFRunLoopSource *v6;
  __CFRunLoop *Current;
  const char *v8;
  void *v9;
  void *v10;
  const char *v11;
  id v12;
  id v13;
  __CFUserNotification *v14;
  const char *v15;
  void *v16;
  const char *v17;
  void *v18;

  os_unfair_lock_lock((os_unfair_lock_t)&g_currentNotificationLock);
  if (objc_msgSend((id)g_currentNotifications, "containsObject:", *(_QWORD *)(a1 + 32)))
    objc_msgSend((id)g_currentNotifications, "removeObject:", *(_QWORD *)(a1 + 32));
  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    if (objc_getProperty(v3, v2, 24, 1))
    {
      Property = *(id *)(a1 + 32);
      if (Property)
        Property = objc_getProperty(Property, v4, 24, 1);
      v6 = (__CFRunLoopSource *)Property;
      Current = CFRunLoopGetCurrent();
      CFRunLoopRemoveSource(Current, v6, (CFRunLoopMode)*MEMORY[0x1E0C9B280]);
      CFRelease(v6);
      v9 = *(void **)(a1 + 32);
      if (!v9)
        goto LABEL_18;
      objc_setProperty_atomic(v9, v8, 0, 24);
    }
    v10 = *(void **)(a1 + 32);
    if (!v10)
      goto LABEL_18;
    v12 = objc_getProperty(v10, v4, 16, 1);
    v13 = *(id *)(a1 + 32);
    if (!v12)
      goto LABEL_15;
    if (v13)
      v13 = objc_getProperty(v13, v11, 16, 1);
    v14 = (__CFUserNotification *)v13;
    CFUserNotificationCancel(v14);
    CFRelease(v14);
    v16 = *(void **)(a1 + 32);
    if (v16)
    {
      objc_setProperty_atomic(v16, v15, 0, 16);
      v13 = *(id *)(a1 + 32);
LABEL_15:
      if (v13)
      {
        objc_setProperty_nonatomic_copy(v13, v11, 0, 40);
        v18 = *(void **)(a1 + 32);
        if (v18)
          objc_setProperty_atomic(v18, v17, 0, 32);
      }
    }
  }
LABEL_18:
  os_unfair_lock_unlock((os_unfair_lock_t)&g_currentNotificationLock);
}

+ (void)executeOnMainLoop:(uint64_t)a1
{
  __CFRunLoop *Current;
  void (**v3)(void);
  _QWORD block[4];
  void (**v5)(void);

  v3 = a2;
  objc_opt_self();
  Current = CFRunLoopGetCurrent();
  if (Current == CFRunLoopGetMain())
  {
    v3[2]();
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__NEUserNotification_executeOnMainLoop___block_invoke;
    block[3] = &unk_1E3CC4720;
    v5 = v3;
    dispatch_sync(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __40__NEUserNotification_executeOnMainLoop___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)postNotificationWithCallbackQueue:(void *)a3 callbackHandler:
{
  id v5;
  id v6;
  id v7;
  id v8;
  _BOOL8 v9;
  NSObject *v10;
  uint8_t v12[16];
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v5 = a2;
  v6 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __72__NEUserNotification_postNotificationWithCallbackQueue_callbackHandler___block_invoke;
  v13[3] = &unk_1E3CC3AE0;
  v13[4] = a1;
  v7 = v6;
  v15 = v7;
  v8 = v5;
  v14 = v8;
  v16 = &v17;
  +[NEUserNotification executeOnMainLoop:]((uint64_t)NEUserNotification, v13);
  if (*((_BYTE *)v18 + 24))
  {
    v9 = 1;
  }
  else
  {
    ne_log_obj();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_19BD16000, v10, OS_LOG_TYPE_INFO, "Failed to post new user notification: current notification in progress", v12, 2u);
    }

    v9 = *((_BYTE *)v18 + 24) != 0;
  }

  _Block_object_dispose(&v17, 8);
  return v9;
}

void __72__NEUserNotification_postNotificationWithCallbackQueue_callbackHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  const char *v3;
  void *v4;
  id v5;
  const char *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  char v11;
  const char *v12;
  id Property;
  __CFUserNotification *v14;
  uint64_t v15;
  void (__cdecl *v16)(CFUserNotificationRef, CFOptionFlags);
  const char *v17;
  __CFRunLoopSource *RunLoopSource;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  void *v23;
  __CFRunLoop *Main;
  const char *v25;
  void *v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  ne_log_obj();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v27 = *(_QWORD *)(a1 + 32);
    v28 = 138412290;
    v29 = v27;
    _os_log_debug_impl(&dword_19BD16000, v2, OS_LOG_TYPE_DEBUG, "Displaying notification: %@", (uint8_t *)&v28, 0xCu);
  }

  os_unfair_lock_lock((os_unfair_lock_t)&g_currentNotificationLock);
  v4 = *(void **)(a1 + 32);
  if (!v4)
    goto LABEL_8;
  v5 = objc_getProperty(v4, v3, 16, 1);
  if (!v5)
    goto LABEL_8;
  v7 = v5;
  v8 = *(void **)(a1 + 32);
  if (v8)
  {
    v9 = objc_getProperty(v8, v6, 24, 1);
    if (v9)
    {

LABEL_8:
      os_unfair_lock_unlock((os_unfair_lock_t)&g_currentNotificationLock);
      return;
    }
    v10 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v10 = 0;
  }
  v11 = objc_msgSend((id)g_currentNotifications, "containsObject:", v10);

  os_unfair_lock_unlock((os_unfair_lock_t)&g_currentNotificationLock);
  if ((v11 & 1) != 0)
  {
    Property = *(id *)(a1 + 32);
    if (Property)
      Property = objc_getProperty(Property, v12, 16, 1);
    v14 = (__CFUserNotification *)Property;
    v15 = *(_QWORD *)(a1 + 32);
    v16 = (void (__cdecl *)(CFUserNotificationRef, CFOptionFlags))authCallback;
    if (v15 && (*(_BYTE *)(v15 + 8) & 1) != 0)
      v16 = (void (__cdecl *)(CFUserNotificationRef, CFOptionFlags))alertCallback;
    RunLoopSource = CFUserNotificationCreateRunLoopSource((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v14, v16, 0);
    v19 = *(void **)(a1 + 32);
    if (v19)
      objc_setProperty_atomic(v19, v17, v14, 16);

    if (RunLoopSource)
    {
      v21 = *(void **)(a1 + 32);
      if (v21)
      {
        objc_setProperty_nonatomic_copy(v21, v20, *(id *)(a1 + 48), 40);
        v23 = *(void **)(a1 + 32);
        if (v23)
          objc_setProperty_atomic(v23, v22, *(id *)(a1 + 40), 32);
      }
      Main = CFRunLoopGetMain();
      CFRunLoopAddSource(Main, RunLoopSource, (CFRunLoopMode)*MEMORY[0x1E0C9B280]);
      v26 = *(void **)(a1 + 32);
      if (v26)
        objc_setProperty_atomic(v26, v25, RunLoopSource, 24);

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    }
  }
}

+ (void)cancelCurrentNotificationWithResponse:(unint64_t)a3 queue:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  unint64_t v14;

  v7 = a4;
  v8 = a5;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __84__NEUserNotification_cancelCurrentNotificationWithResponse_queue_completionHandler___block_invoke;
  v11[3] = &unk_1E3CC3B80;
  v13 = v8;
  v14 = a3;
  v12 = v7;
  v9 = v8;
  v10 = v7;
  +[NEUserNotification executeOnMainLoop:]((uint64_t)NEUserNotification, v11);

}

+ (BOOL)shouldPromptForLocalAuthentication
{
  void *v2;
  char v3;
  id v4;
  void *v5;
  BOOL v6;
  id v8;

  +[NEUserNotification createLAContext]();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v3 = objc_msgSend(v2, "canEvaluatePolicy:error:", 2, &v8);
  v4 = v8;
  v5 = v4;
  v6 = (v3 & 1) != 0 || !v4 || objc_msgSend(v4, "code") != -5;

  return v6;
}

+ (void)promptForLocalAuthenticationWithReason:(id)a3 completionQueue:(id)a4 completionHandler:(id)a5
{
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  _QWORD v17[4];
  NSObject *v18;
  _QWORD v19[4];
  NSObject *v20;
  id v21;
  id v22;
  _QWORD block[4];
  id v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  +[NEUserNotification createLAContext]();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v22 = 0;
    v12 = objc_msgSend(v10, "canEvaluatePolicy:error:", 2, &v22);
    v13 = v22;
    if (v12)
    {
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __95__NEUserNotification_promptForLocalAuthenticationWithReason_completionQueue_completionHandler___block_invoke_2;
      v19[3] = &unk_1E3CC3B58;
      v20 = v8;
      v21 = v9;
      objc_msgSend(v11, "evaluatePolicy:localizedReason:reply:", 2, v7, v19);

      v14 = v20;
    }
    else
    {
      ne_log_obj();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v13;
        _os_log_error_impl(&dword_19BD16000, v16, OS_LOG_TYPE_ERROR, "Device cannot evaluate Local Authentication: %@", buf, 0xCu);
      }

      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __95__NEUserNotification_promptForLocalAuthenticationWithReason_completionQueue_completionHandler___block_invoke_34;
      v17[3] = &unk_1E3CC4720;
      v18 = v9;
      dispatch_async(v8, v17);
      v14 = v18;
    }

  }
  else
  {
    ne_log_obj();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19BD16000, v15, OS_LOG_TYPE_ERROR, "Failed to create the LocalAuthentication context", buf, 2u);
    }

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __95__NEUserNotification_promptForLocalAuthenticationWithReason_completionQueue_completionHandler___block_invoke;
    block[3] = &unk_1E3CC4720;
    v24 = v9;
    dispatch_async(v8, block);
    v13 = v24;
  }

}

+ (id)createLAContext
{
  void *v0;
  int v1;
  int v2;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  unsigned __int8 v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  if (!g_LABundle)
  {
    v8 = 0;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    v1 = objc_msgSend(v0, "fileExistsAtPath:isDirectory:", CFSTR("/System/Library/Frameworks/LocalAuthentication.framework"), &v8);
    v2 = v8;

    if (v1 && v2 != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", CFSTR("/System/Library/Frameworks/LocalAuthentication.framework"));
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = (void *)g_LABundle;
      g_LABundle = v4;

      if (g_LABundle)
      {
        objc_msgSend((id)g_LABundle, "load");
        g_LAContextClass = objc_msgSend((id)g_LABundle, "classNamed:", CFSTR("LAContext"));
        ne_log_obj();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          v10 = "+[NEUserNotification createLAContext]";
          v11 = 2112;
          v12 = g_LABundle;
          v13 = 2112;
          v14 = g_LAContextClass;
          _os_log_debug_impl(&dword_19BD16000, v6, OS_LOG_TYPE_DEBUG, "%s: bundle %@ class %@", buf, 0x20u);
        }

      }
    }
  }
  return objc_alloc_init((Class)g_LAContextClass);
}

uint64_t __95__NEUserNotification_promptForLocalAuthenticationWithReason_completionQueue_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __95__NEUserNotification_promptForLocalAuthenticationWithReason_completionQueue_completionHandler___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  char v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  ne_log_obj();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_19BD16000, v7, OS_LOG_TYPE_DEBUG, "User successfully passed Local Authentication", buf, 2u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v5;
    _os_log_error_impl(&dword_19BD16000, v7, OS_LOG_TYPE_ERROR, "User failed Local Authentication, error = %@", buf, 0xCu);
  }

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __95__NEUserNotification_promptForLocalAuthenticationWithReason_completionQueue_completionHandler___block_invoke_32;
  v9[3] = &unk_1E3CC3B30;
  v8 = *(NSObject **)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  v11 = a2;
  dispatch_async(v8, v9);

}

uint64_t __95__NEUserNotification_promptForLocalAuthenticationWithReason_completionQueue_completionHandler___block_invoke_34(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __95__NEUserNotification_promptForLocalAuthenticationWithReason_completionQueue_completionHandler___block_invoke_32(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void __84__NEUserNotification_cancelCurrentNotificationWithResponse_queue_completionHandler___block_invoke(uint64_t a1)
{
  id *v2;
  const char *v3;
  NSObject *v4;
  id v5;
  BOOL v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  os_unfair_lock_lock((os_unfair_lock_t)&g_currentNotificationLock);
  objc_msgSend((id)g_currentNotifications, "firstObject");
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock((os_unfair_lock_t)&g_currentNotificationLock);
  if (v2)
  {
    v4 = objc_getProperty(v2, v3, 32, 1);
    v5 = v2[5];
    objc_msgSend(v2, "cancel");
    if (v4)
      v6 = v5 == 0;
    else
      v6 = 1;
    if (!v6)
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __84__NEUserNotification_cancelCurrentNotificationWithResponse_queue_completionHandler___block_invoke_2;
      v9[3] = &unk_1E3CC3B08;
      v7 = v5;
      v8 = *(_QWORD *)(a1 + 48);
      v10 = v7;
      v11 = v8;
      dispatch_async(v4, v9);

    }
  }
  dispatch_async(*(dispatch_queue_t *)(a1 + 32), *(dispatch_block_t *)(a1 + 40));

}

uint64_t __84__NEUserNotification_cancelCurrentNotificationWithResponse_queue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0);
}

@end
