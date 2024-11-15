@implementation IMUserNotificationCenter

+ (id)sharedInstance
{
  if (qword_1ECD91018 != -1)
    dispatch_once(&qword_1ECD91018, &unk_1E2C42D08);
  return (id)qword_1ECD90FC8;
}

- (id)_frontUserNotificationForIdentifier:(id)a3
{
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  if (a3)
  {
    objc_msgSend_objectForKey_(self->_identifierToIMUserNotificationQueueMap, a2, (uint64_t)a3, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___imFirstObject(v4, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)_frontListenerForIdentifier:(id)a3
{
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  if (a3)
  {
    objc_msgSend_objectForKey_(self->_identifierToListenerQueueMap, a2, (uint64_t)a3, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___imFirstObject(v4, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)_frontBlockForIdentifier:(id)a3
{
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  void *v10;

  if (a3)
  {
    objc_msgSend_objectForKey_(self->_identifierToBlockQueueMap, a2, (uint64_t)a3, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___imFirstObject(v4, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = 0;
    else
      v9 = v8;
    v10 = _Block_copy(v9);

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)_dequeueUserNotificationForIdentifier:(id)a3
{
  const char *v4;
  uint64_t v5;
  id v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  NSMutableDictionary *identifierToIMUserNotificationQueueMap;

  v6 = a3;
  if (v6)
  {
    objc_msgSend_objectForKey_(self->_identifierToIMUserNotificationQueueMap, v4, (uint64_t)v6, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___imFirstObject(v7, v8, v9, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      objc_msgSend_removeFirstObject(v7, v11, v12, v13);
    if (!objc_msgSend_count(v7, v11, v12, v13))
      objc_msgSend_removeObjectForKey_(self->_identifierToIMUserNotificationQueueMap, v15, (uint64_t)v6, v17);
    if (!objc_msgSend_count(self->_identifierToIMUserNotificationQueueMap, v15, v16, v17))
    {
      identifierToIMUserNotificationQueueMap = self->_identifierToIMUserNotificationQueueMap;
      self->_identifierToIMUserNotificationQueueMap = 0;

    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)_dequeueListenerForIdentifier:(id)a3
{
  const char *v4;
  uint64_t v5;
  id v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  NSMutableDictionary *identifierToListenerQueueMap;

  v6 = a3;
  if (v6)
  {
    objc_msgSend_objectForKey_(self->_identifierToListenerQueueMap, v4, (uint64_t)v6, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend___imFirstObject(v7, v8, v9, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      objc_msgSend_removeFirstObject(v7, v11, v12, v13);
    if (!objc_msgSend_count(v7, v11, v12, v13))
      objc_msgSend_removeObjectForKey_(self->_identifierToListenerQueueMap, v15, (uint64_t)v6, v17);
    if (!objc_msgSend_count(self->_identifierToListenerQueueMap, v15, v16, v17))
    {
      identifierToListenerQueueMap = self->_identifierToListenerQueueMap;
      self->_identifierToListenerQueueMap = 0;

    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)_dequeueBlockForIdentifier:(id)a3
{
  const char *v4;
  uint64_t v5;
  id v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  NSMutableDictionary *identifierToBlockQueueMap;

  v6 = a3;
  if (v6)
  {
    objc_msgSend_objectForKey_(self->_identifierToBlockQueueMap, v4, (uint64_t)v6, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_count(v7, v8, v9, v10))
    {
      objc_msgSend_objectAtIndex_(v7, v11, 0, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = 0;
    else
      v15 = v13;
    v19 = _Block_copy(v15);
    if (v13)
      objc_msgSend_removeFirstObject(v7, v16, v17, v18);
    if (!objc_msgSend_count(v7, v16, v17, v18))
      objc_msgSend_removeObjectForKey_(self->_identifierToBlockQueueMap, v20, (uint64_t)v6, v22);
    if (!objc_msgSend_count(self->_identifierToBlockQueueMap, v20, v21, v22))
    {
      identifierToBlockQueueMap = self->_identifierToBlockQueueMap;
      self->_identifierToBlockQueueMap = 0;

    }
    v14 = _Block_copy(v19);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)_enqueueUserNotification:(id)a3 forIdentifier:(id)a4
{
  const char *v6;
  uint64_t v7;
  id v8;
  const char *v9;
  uint64_t v10;
  id v11;
  const char *v12;
  NSMutableDictionary *identifierToIMUserNotificationQueueMap;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *v15;
  id v16;

  v16 = a3;
  v8 = a4;
  if (v8)
  {
    objc_msgSend_objectForKey_(self->_identifierToIMUserNotificationQueueMap, v6, (uint64_t)v8, v7);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      identifierToIMUserNotificationQueueMap = self->_identifierToIMUserNotificationQueueMap;
      if (!identifierToIMUserNotificationQueueMap)
      {
        Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
        v15 = self->_identifierToIMUserNotificationQueueMap;
        self->_identifierToIMUserNotificationQueueMap = Mutable;

        identifierToIMUserNotificationQueueMap = self->_identifierToIMUserNotificationQueueMap;
      }
      objc_msgSend_setObject_forKey_(identifierToIMUserNotificationQueueMap, v12, (uint64_t)v11, (uint64_t)v8);
    }
    objc_msgSend_addObject_(v11, v9, (uint64_t)v16, v10);

  }
}

- (void)_enqueueListener:(id)a3 forIdentifier:(id)a4
{
  const char *v6;
  uint64_t v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  NSMutableDictionary *identifierToListenerQueueMap;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  id v20;

  v20 = a3;
  v8 = a4;
  if (v8)
  {
    objc_msgSend_objectForKey_(self->_identifierToListenerQueueMap, v6, (uint64_t)v8, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      objc_msgSend_nonRetainingArray(MEMORY[0x1E0C99DE8], v9, v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      identifierToListenerQueueMap = self->_identifierToListenerQueueMap;
      if (!identifierToListenerQueueMap)
      {
        Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
        v16 = self->_identifierToListenerQueueMap;
        self->_identifierToListenerQueueMap = Mutable;

        identifierToListenerQueueMap = self->_identifierToListenerQueueMap;
      }
      objc_msgSend_setObject_forKey_(identifierToListenerQueueMap, v13, (uint64_t)v12, (uint64_t)v8);
    }
    if (v20)
    {
      objc_msgSend_addObject_(v12, v9, (uint64_t)v20, v11);
    }
    else
    {
      objc_msgSend_null(MEMORY[0x1E0C99E38], v9, 0, v11);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v12, v18, (uint64_t)v17, v19);

    }
  }

}

- (void)_enqueueBlock:(id)a3 forIdentifier:(id)a4
{
  const char *v6;
  uint64_t v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  const char *v13;
  NSMutableDictionary *identifierToBlockQueueMap;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  id v21;

  v21 = a3;
  v8 = a4;
  if (v8)
  {
    objc_msgSend_objectForKey_(self->_identifierToBlockQueueMap, v6, (uint64_t)v8, v7);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      identifierToBlockQueueMap = self->_identifierToBlockQueueMap;
      if (!identifierToBlockQueueMap)
      {
        Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
        v16 = self->_identifierToBlockQueueMap;
        self->_identifierToBlockQueueMap = Mutable;

        identifierToBlockQueueMap = self->_identifierToBlockQueueMap;
      }
      objc_msgSend_setObject_forKey_(identifierToBlockQueueMap, v13, (uint64_t)v12, (uint64_t)v8);
    }
    if (v21)
    {
      v17 = objc_msgSend_copy(v21, v9, v10, v11);
    }
    else
    {
      objc_msgSend_null(MEMORY[0x1E0C99E38], v9, v10, v11);
      v17 = objc_claimAutoreleasedReturnValue();
    }
    v20 = (void *)v17;
    objc_msgSend_addObject_(v12, v18, v17, v19);

  }
}

- (void)_cancelActiveUserNotificationForIdentifier:(id)a3
{
  const char *v4;
  uint64_t v5;
  __CFUserNotification *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  __CFRunLoopSource *v11;
  id v12;
  const char *v13;
  uint64_t v14;
  id v15;
  const char *v16;
  uint64_t v17;
  id v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  NSMutableDictionary *identifierToCFUserNotificationMap;
  NSMutableDictionary *identifierToRunLoopSourcesMap;
  id v31;

  v31 = a3;
  v6 = (__CFUserNotification *)objc_msgSend_objectForKey_(self->_identifierToCFUserNotificationMap, v4, (uint64_t)v31, v5);
  v11 = (__CFRunLoopSource *)objc_msgSend_objectForKey_(self->_identifierToRunLoopSourcesMap, v7, (uint64_t)v31, v8);
  if (v6)
    CFUserNotificationCancel(v6);
  if (v11)
    CFRunLoopSourceInvalidate(v11);
  v12 = (id)objc_msgSend__dequeueUserNotificationForIdentifier_(self, v9, (uint64_t)v31, v10);
  v15 = (id)objc_msgSend__dequeueListenerForIdentifier_(self, v13, (uint64_t)v31, v14);
  v18 = (id)objc_msgSend__dequeueBlockForIdentifier_(self, v16, (uint64_t)v31, v17);
  objc_msgSend_removeObjectForKey_(self->_identifierToCFUserNotificationMap, v19, (uint64_t)v31, v20);
  objc_msgSend_removeObjectForKey_(self->_identifierToRunLoopSourcesMap, v21, (uint64_t)v31, v22);
  if (!objc_msgSend_count(self->_identifierToCFUserNotificationMap, v23, v24, v25))
  {
    identifierToCFUserNotificationMap = self->_identifierToCFUserNotificationMap;
    self->_identifierToCFUserNotificationMap = 0;

  }
  if (!objc_msgSend_count(self->_identifierToRunLoopSourcesMap, v26, v27, v28))
  {
    identifierToRunLoopSourcesMap = self->_identifierToRunLoopSourcesMap;
    self->_identifierToRunLoopSourcesMap = 0;

  }
}

- (void)_displayNextUserNotificationForIdentifier:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  double v12;
  CFTimeInterval v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  CFOptionFlags v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  __CFDictionary *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  const __CFAllocator *v38;
  const char *v39;
  __CFUserNotification *v40;
  NSMutableDictionary *Mutable;
  NSMutableDictionary *identifierToCFUserNotificationMap;
  const char *v43;
  __CFRunLoopSource *RunLoopSource;
  NSMutableDictionary *v45;
  NSMutableDictionary *identifierToRunLoopSourcesMap;
  __CFRunLoop *Main;
  SInt32 v48;
  __CFDictionary *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend__frontUserNotificationForIdentifier_(self, v5, (uint64_t)v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v7;
  if (v7)
  {
    objc_msgSend_timeout(v7, v8, v9, v10);
    v13 = v12;
    v17 = objc_msgSend_displayFlags(v11, v14, v15, v16);
    objc_msgSend_displayInformation(v11, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (__CFDictionary *)objc_msgSend_mutableCopy(v21, v22, v23, v24);

    objc_msgSend_mainBundle(MEMORY[0x1E0CB34D0], v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_resourceURL(v29, v30, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
      CFDictionarySetValue(v25, (const void *)*MEMORY[0x1E0C9B860], v33);

    objc_msgSend_registration(IMRGLog, v34, v35, v36);
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      v48 = 138412290;
      v49 = v25;
      _os_log_impl(&dword_19066D000, v37, OS_LOG_TYPE_DEFAULT, "Creating CFUserNotification with display information: %@", (uint8_t *)&v48, 0xCu);
    }

    v48 = -1431655766;
    v38 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v40 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v13, v17, &v48, v25);
    if (!self->_identifierToCFUserNotificationMap)
    {
      Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      identifierToCFUserNotificationMap = self->_identifierToCFUserNotificationMap;
      self->_identifierToCFUserNotificationMap = Mutable;

    }
    if (v40)
    {
      objc_msgSend_setObject_forKey_(self->_identifierToCFUserNotificationMap, v39, (uint64_t)v40, (uint64_t)v4);
      RunLoopSource = CFUserNotificationCreateRunLoopSource(v38, v40, (CFUserNotificationCallBack)sub_190695398, 0);
      if (!self->_identifierToRunLoopSourcesMap)
      {
        v45 = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
        identifierToRunLoopSourcesMap = self->_identifierToRunLoopSourcesMap;
        self->_identifierToRunLoopSourcesMap = v45;

      }
      if (RunLoopSource)
      {
        objc_msgSend_setObject_forKey_(self->_identifierToRunLoopSourcesMap, v43, (uint64_t)RunLoopSource, (uint64_t)v4);
        Main = CFRunLoopGetMain();
        CFRunLoopAddSource(Main, RunLoopSource, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
        CFRelease(RunLoopSource);
      }
      CFRelease(v40);
    }

  }
}

- (void)_handleUserNotification:(__CFUserNotification *)a3 responseFlags:(unint64_t)a4
{
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void (**v19)(_QWORD, _QWORD);
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  __CFRunLoopSource *v31;
  CFDictionaryRef ResponseDictionary;
  const char *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  NSMutableDictionary *identifierToCFUserNotificationMap;
  const char *v47;
  uint64_t v48;
  NSMutableDictionary *identifierToRunLoopSourcesMap;
  id v50;

  objc_msgSend_allKeysForObject_(self->_identifierToCFUserNotificationMap, a2, (uint64_t)a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lastObject(v7, v8, v9, v10);
  v50 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend__dequeueUserNotificationForIdentifier_(self, v11, (uint64_t)v50, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__dequeueListenerForIdentifier_(self, v14, (uint64_t)v50, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__dequeueBlockForIdentifier_(self, v17, (uint64_t)v50, v18);
  v19 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v20 = _Block_copy(v19);
  objc_msgSend_null(MEMORY[0x1E0C99E38], v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20 == v24)
  {

    v19 = 0;
  }
  objc_msgSend_null(MEMORY[0x1E0C99E38], v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16 == v28)
  {

    v16 = 0;
  }
  objc_msgSend_objectForKey_(self->_identifierToRunLoopSourcesMap, v29, (uint64_t)v50, v30);
  v31 = (__CFRunLoopSource *)objc_claimAutoreleasedReturnValue();
  CFRunLoopSourceInvalidate(v31);

  ResponseDictionary = CFUserNotificationGetResponseDictionary(a3);
  objc_msgSend__setResponseFlags_responseInformation_(v13, v33, a4, (uint64_t)ResponseDictionary);
  objc_msgSend_userNotificationDidFinish_(v16, v34, (uint64_t)v13, v35);
  if (v19)
    ((void (**)(_QWORD, void *))v19)[2](v19, v13);
  objc_msgSend_removeObjectForKey_(self->_identifierToCFUserNotificationMap, v36, (uint64_t)v50, v37);
  objc_msgSend_removeObjectForKey_(self->_identifierToRunLoopSourcesMap, v38, (uint64_t)v50, v39);
  if (!objc_msgSend_count(self->_identifierToCFUserNotificationMap, v40, v41, v42))
  {
    identifierToCFUserNotificationMap = self->_identifierToCFUserNotificationMap;
    self->_identifierToCFUserNotificationMap = 0;

  }
  if (!objc_msgSend_count(self->_identifierToRunLoopSourcesMap, v43, v44, v45))
  {
    identifierToRunLoopSourcesMap = self->_identifierToRunLoopSourcesMap;
    self->_identifierToRunLoopSourcesMap = 0;

  }
  objc_msgSend__displayNextUserNotificationForIdentifier_(self, v47, (uint64_t)v50, v48);

}

- (void)addUserNotification:(id)a3 listener:(id)a4
{
  MEMORY[0x1E0DE7D20](self, sel_addUserNotification_listener_completionHandler_, a3, a4);
}

- (void)addUserNotification:(id)a3 listener:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  int v24;
  id v25;

  v25 = a3;
  v8 = a5;
  v9 = a4;
  objc_msgSend_identifier(v25, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__enqueueUserNotification_forIdentifier_(self, v14, (uint64_t)v25, (uint64_t)v13);
  objc_msgSend__enqueueListener_forIdentifier_(self, v15, (uint64_t)v9, (uint64_t)v13);

  objc_msgSend__enqueueBlock_forIdentifier_(self, v16, (uint64_t)v8, (uint64_t)v13);
  objc_msgSend_objectForKey_(self->_identifierToCFUserNotificationMap, v17, (uint64_t)v13, v18);
  v19 = objc_claimAutoreleasedReturnValue();
  if (!v19
    || (v23 = (void *)v19, v24 = objc_msgSend_usesNotificationCenter(v25, v20, v21, v22), v23, v24))
  {
    objc_msgSend__displayNextUserNotificationForIdentifier_(self, v20, (uint64_t)v13, v22);
  }

}

- (unint64_t)countForIdentifier:(id)a3
{
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  objc_msgSend_objectForKey_(self->_identifierToIMUserNotificationQueueMap, a2, (uint64_t)a3, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_count(v4, v5, v6, v7);

  return v8;
}

- (void)removeNotificationsForServiceIdentifier:(id)a3
{
  uint64_t v3;

  if (a3)
    objc_msgSend__cancelActiveUserNotificationForIdentifier_(self, a2, (uint64_t)a3, v3);
}

- (void)removeListener:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  id v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  unint64_t v48;
  const char *v49;
  uint64_t v50;
  id v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  const char *v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t k;
  void *v67;
  id obj;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (v7)
  {
    objc_msgSend_null(MEMORY[0x1E0C99E38], v4, v5, v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8 != v7)
    {
      v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v77 = 0u;
      v78 = 0u;
      v79 = 0u;
      v80 = 0u;
      objc_msgSend_allKeys(self->_identifierToListenerQueueMap, v10, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v77, (uint64_t)v83, 16);
      if (v15)
      {
        v18 = v15;
        v19 = *(_QWORD *)v78;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v78 != v19)
              objc_enumerationMutation(v13);
            v21 = *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * i);
            objc_msgSend__frontListenerForIdentifier_(self, v16, v21, v17);
            v22 = (id)objc_claimAutoreleasedReturnValue();

            if (v22 == v7)
            {
              objc_msgSend_addObject_(v9, v16, v21, v17);
              objc_msgSend__cancelActiveUserNotificationForIdentifier_(self, v23, v21, v24);
            }
          }
          v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v77, (uint64_t)v83, 16);
        }
        while (v18);
      }
      v67 = v9;

      v75 = 0u;
      v76 = 0u;
      v73 = 0u;
      v74 = 0u;
      objc_msgSend_allKeys(self->_identifierToIMUserNotificationQueueMap, v25, v26, v27);
      obj = (id)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v28, (uint64_t)&v73, (uint64_t)v82, 16);
      if (v29)
      {
        v32 = v29;
        v33 = *(_QWORD *)v74;
        do
        {
          for (j = 0; j != v32; ++j)
          {
            if (*(_QWORD *)v74 != v33)
              objc_enumerationMutation(obj);
            v35 = *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * j);
            objc_msgSend_objectForKey_(self->_identifierToIMUserNotificationQueueMap, v30, v35, v31, v67);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKey_(self->_identifierToListenerQueueMap, v37, v35, v38);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKey_(self->_identifierToBlockQueueMap, v40, v35, v41);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend_count(v36, v43, v44, v45))
            {
              v48 = 0;
              do
              {
                objc_msgSend_objectAtIndex_(v36, v46, v48, v47);
                v51 = (id)objc_claimAutoreleasedReturnValue();
                if (v51 == v7)
                {
                  objc_msgSend_removeObjectAtIndex_(v36, v49, v48, v50);
                  objc_msgSend_removeObjectAtIndex_(v39, v52, v48, v53);
                  objc_msgSend_removeObjectAtIndex_(v42, v54, v48, v55);
                }
                else
                {
                  ++v48;
                }

              }
              while (v48 < objc_msgSend_count(v36, v56, v57, v58));
            }

          }
          v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v30, (uint64_t)&v73, (uint64_t)v82, 16);
        }
        while (v32);
      }

      v71 = 0u;
      v72 = 0u;
      v69 = 0u;
      v70 = 0u;
      v59 = v67;
      v61 = objc_msgSend_countByEnumeratingWithState_objects_count_(v59, v60, (uint64_t)&v69, (uint64_t)v81, 16);
      if (v61)
      {
        v64 = v61;
        v65 = *(_QWORD *)v70;
        do
        {
          for (k = 0; k != v64; ++k)
          {
            if (*(_QWORD *)v70 != v65)
              objc_enumerationMutation(v59);
            objc_msgSend__displayNextUserNotificationForIdentifier_(self, v62, *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * k), v63, v67);
          }
          v64 = objc_msgSend_countByEnumeratingWithState_objects_count_(v59, v62, (uint64_t)&v69, (uint64_t)v81, 16);
        }
        while (v64);
      }

    }
  }

}

- (void)removeAllListeners
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  NSMutableDictionary *identifierToIMUserNotificationQueueMap;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  NSMutableDictionary *identifierToListenerQueueMap;
  NSMutableDictionary *identifierToBlockQueueMap;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  objc_msgSend_allKeys(self->_identifierToIMUserNotificationQueueMap, a2, v2, v3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v34, (uint64_t)v38, 16);
  if (v7)
  {
    v10 = v7;
    v11 = *(_QWORD *)v35;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v35 != v11)
          objc_enumerationMutation(v5);
        objc_msgSend__cancelActiveUserNotificationForIdentifier_(self, v8, *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v12++), v9);
      }
      while (v10 != v12);
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v34, (uint64_t)v38, 16);
    }
    while (v10);
  }

  objc_msgSend_removeAllObjects(self->_identifierToIMUserNotificationQueueMap, v13, v14, v15);
  objc_msgSend_removeAllObjects(self->_identifierToListenerQueueMap, v16, v17, v18);
  objc_msgSend_removeAllObjects(self->_identifierToBlockQueueMap, v19, v20, v21);
  if (!objc_msgSend_count(self->_identifierToIMUserNotificationQueueMap, v22, v23, v24))
  {
    identifierToIMUserNotificationQueueMap = self->_identifierToIMUserNotificationQueueMap;
    self->_identifierToIMUserNotificationQueueMap = 0;

  }
  if (!objc_msgSend_count(self->_identifierToListenerQueueMap, v25, v26, v27))
  {
    identifierToListenerQueueMap = self->_identifierToListenerQueueMap;
    self->_identifierToListenerQueueMap = 0;

  }
  if (!objc_msgSend_count(self->_identifierToBlockQueueMap, v29, v30, v31))
  {
    identifierToBlockQueueMap = self->_identifierToBlockQueueMap;
    self->_identifierToBlockQueueMap = 0;

  }
}

- (NSMutableDictionary)identifierToIMUserNotificationQueueMap
{
  return self->_identifierToIMUserNotificationQueueMap;
}

- (void)setIdentifierToIMUserNotificationQueueMap:(id)a3
{
  objc_storeStrong((id *)&self->_identifierToIMUserNotificationQueueMap, a3);
}

- (NSMutableDictionary)identifierToListenerQueueMap
{
  return self->_identifierToListenerQueueMap;
}

- (void)setIdentifierToListenerQueueMap:(id)a3
{
  objc_storeStrong((id *)&self->_identifierToListenerQueueMap, a3);
}

- (NSMutableDictionary)identifierToBlockQueueMap
{
  return self->_identifierToBlockQueueMap;
}

- (void)setIdentifierToBlockQueueMap:(id)a3
{
  objc_storeStrong((id *)&self->_identifierToBlockQueueMap, a3);
}

- (NSMutableDictionary)identifierToRunLoopSourcesMap
{
  return self->_identifierToRunLoopSourcesMap;
}

- (void)setIdentifierToRunLoopSourcesMap:(id)a3
{
  objc_storeStrong((id *)&self->_identifierToRunLoopSourcesMap, a3);
}

- (NSMutableDictionary)identifierToCFUserNotificationMap
{
  return self->_identifierToCFUserNotificationMap;
}

- (void)setIdentifierToCFUserNotificationMap:(id)a3
{
  objc_storeStrong((id *)&self->_identifierToCFUserNotificationMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifierToCFUserNotificationMap, 0);
  objc_storeStrong((id *)&self->_identifierToRunLoopSourcesMap, 0);
  objc_storeStrong((id *)&self->_identifierToBlockQueueMap, 0);
  objc_storeStrong((id *)&self->_identifierToListenerQueueMap, 0);
  objc_storeStrong((id *)&self->_identifierToIMUserNotificationQueueMap, 0);
}

@end
