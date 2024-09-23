@implementation AXRemoteElement

+ (void)initialize
{
  if (initialize_onceToken != -1)
    dispatch_once(&initialize_onceToken, &__block_literal_global_9);
}

void __29__AXRemoteElement_initialize__block_invoke()
{
  id v0;
  void *v1;
  id v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v1 = (void *)Cache;
  Cache = (uint64_t)v0;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3740]);
  v3 = (void *)CacheLock;
  CacheLock = (uint64_t)v2;

}

+ (BOOL)_isSerializableAccessibilityElement
{
  return 1;
}

- (AXRemoteElement)initWithUUID:(id)a3 andRemotePid:(int)a4 andContextId:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  AXRemoteElement *v9;
  AXRemoteElement *v10;
  NSMutableSet *v11;
  NSMutableSet *allChildren;
  AXRemoteElement *v13;
  objc_super v15;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AXRemoteElement;
  v9 = -[AXRemoteElement init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    -[AXRemoteElement setUuid:](v9, "setUuid:", v8);
    -[AXRemoteElement setRemotePid:](v10, "setRemotePid:", v6);
    -[AXRemoteElement setContextId:](v10, "setContextId:", v5);
    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    allChildren = v10->_allChildren;
    v10->_allChildren = v11;

    objc_msgSend((id)CacheLock, "lock");
    objc_msgSend((id)Cache, "addObject:", v10);
    objc_msgSend((id)CacheLock, "unlock");
    v13 = v10;
  }

  return v10;
}

- (unsigned)contextId
{
  void *v3;
  uint64_t (**v4)(void);
  unsigned int v5;

  -[AXRemoteElement contextRetrieval](self, "contextRetrieval");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return self->_contextId;
  -[AXRemoteElement contextRetrieval](self, "contextRetrieval");
  v4 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
  v5 = v4[2]();

  return v5;
}

- (int)remotePid
{
  void *v3;
  uint64_t (**v4)(void);
  int v5;

  -[AXRemoteElement pidRetrieval](self, "pidRetrieval");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return self->_remotePid;
  -[AXRemoteElement pidRetrieval](self, "pidRetrieval");
  v4 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
  v5 = v4[2]();

  return v5;
}

- (unsigned)_accessibilityContextId
{
  unsigned int result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AXRemoteElement;
  result = -[AXRemoteElement _accessibilityContextId](&v4, sel__accessibilityContextId);
  if (!result)
  {
    if (-[AXRemoteElement onClientSide](self, "onClientSide"))
      return 0;
    else
      return -[AXRemoteElement contextId](self, "contextId");
  }
  return result;
}

- (id)_accessibilityTextOperations
{
  void *v2;
  void *v3;

  -[AXRemoteElement accessibilityContainer](self, "accessibilityContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityTextOperations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_accessibilityTextViewTextOperationResponder
{
  void *v3;
  objc_super v5;

  if (-[AXRemoteElement onClientSide](self, "onClientSide"))
  {
    -[AXRemoteElement accessibilityContainer](self, "accessibilityContainer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)AXRemoteElement;
    -[AXRemoteElement _accessibilityTextViewTextOperationResponder](&v5, sel__accessibilityTextViewTextOperationResponder);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_accessibilityHandwritingElement
{
  AXRemoteElement *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  AXRemoteElement *v10;
  AXRemoteElement *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v2 = self;
  v19 = *MEMORY[0x1E0C80C00];
  -[AXRemoteElement accessibilityElements](self, "accessibilityElements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[AXRemoteElement accessibilityElements](v2, "accessibilityElements");
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v2 = (AXRemoteElement *)(id)objc_claimAutoreleasedReturnValue();
    v5 = -[AXRemoteElement countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v15;
      while (2)
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v2);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v8), "_accessibilityResponderElement", (_QWORD)v14);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v9, "_accessibilitySupportsHandwriting") & 1) != 0)
          {

            return v9;
          }

          ++v8;
        }
        while (v6 != v8);
        v6 = -[AXRemoteElement countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v6)
          continue;
        break;
      }
    }

  }
  else
  {
    -[AXRemoteElement accessibilityContainer](v2, "accessibilityContainer");
    v10 = (AXRemoteElement *)objc_claimAutoreleasedReturnValue();
    if (v10 != v2)
    {
      v11 = v10;
      -[AXRemoteElement _accessibilityHandwritingElement](v10, "_accessibilityHandwritingElement");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      return v12;
    }
  }

  v9 = 0;
  return v9;
}

- (void)setAccessibilityContainer:(id)a3
{
  AXRemoteElement *v4;
  NSObject *v5;
  void *v6;
  int v7;
  AXRemoteElement *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = (AXRemoteElement *)a3;
  if (v4 == self)
  {
    AXLogRemoteElement();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412546;
      v8 = v4;
      v9 = 2112;
      v10 = v6;
      _os_log_impl(&dword_1B54A6000, v5, OS_LOG_TYPE_DEFAULT, "Attempt made to set accessibilityContainer to self (%@), stack = %@", (uint8_t *)&v7, 0x16u);

    }
  }
  objc_storeWeak(&self->_accessibilityContainer, v4);

}

- (void)dealloc
{
  NSMutableSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_allChildren;
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "setAccessibilityContainer:", 0);
      }
      while (v5 != v7);
      v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  -[AXRemoteElement platformCleanup](self, "platformCleanup");
  -[AXRemoteElement setMachPort:](self, "setMachPort:", 0);
  v8.receiver = self;
  v8.super_class = (Class)AXRemoteElement;
  -[AXRemoteElement dealloc](&v8, sel_dealloc);
}

- (unint64_t)uuidHash
{
  void *v2;
  unint64_t v3;

  -[AXRemoteElement uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (void)_getRemoteValuesOffMainThread:(id)a3
{
  id v3;
  __CFRunLoop *Current;
  __CFRunLoopSource *v5;
  NSObject *v6;
  id v7;
  const __CFString *v8;
  double v9;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  __CFRunLoopSource *v13;
  __CFRunLoop *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  CFRunLoopSourceContext context;

  v3 = a3;
  if (_getRemoteValuesOffMainThread__onceToken != -1)
    dispatch_once(&_getRemoteValuesOffMainThread__onceToken, &__block_literal_global_10);
  memset(&context, 0, sizeof(context));
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  Current = CFRunLoopGetCurrent();
  v5 = CFRunLoopSourceCreate(0, 0, &context);
  if (v5)
    CFRunLoopAddSource(Current, v5, (CFRunLoopMode)*MEMORY[0x1E0C9B280]);
  v6 = _getRemoteValuesOffMainThread__Queue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __49__AXRemoteElement__getRemoteValuesOffMainThread___block_invoke_2;
  v10[3] = &unk_1E6919870;
  v7 = v3;
  v11 = v7;
  v12 = &v15;
  v13 = v5;
  v14 = Current;
  dispatch_async(v6, v10);
  if (!*((_BYTE *)v16 + 24))
  {
    v8 = (const __CFString *)*MEMORY[0x1E0C9B280];
    v9 = 0.0;
    do
    {
      if (v9 >= AXUIElementMessagingTimeout() / 1000.0)
        break;
      CFRunLoopRunInMode(v8, 0.001, 1u);
      v9 = v9 + 0.001;
    }
    while (!*((_BYTE *)v16 + 24));
  }

  _Block_object_dispose(&v15, 8);
}

void __49__AXRemoteElement__getRemoteValuesOffMainThread___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E0C80D50], QOS_CLASS_USER_INTERACTIVE, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("AXRemoteElement-BackgroundFetch", v2);
  v1 = (void *)_getRemoteValuesOffMainThread__Queue;
  _getRemoteValuesOffMainThread__Queue = (uint64_t)v0;

}

void __49__AXRemoteElement__getRemoteValuesOffMainThread___block_invoke_2(uint64_t a1)
{
  __CFRunLoopSource *v2;
  __CFRunLoopSource *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = *(__CFRunLoopSource **)(a1 + 48);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  CFRunLoopSourceSignal(v2);
  CFRunLoopWakeUp(*(CFRunLoopRef *)(a1 + 56));
  v3 = *(__CFRunLoopSource **)(a1 + 48);
  if (v3)
  {
    CFRunLoopRemoveSource(*(CFRunLoopRef *)(a1 + 56), v3, (CFRunLoopMode)*MEMORY[0x1E0C9B280]);
    CFRelease(*(CFTypeRef *)(a1 + 48));
  }
}

- (void)getLeafElementsFromRemoteSide:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__AXRemoteElement_getLeafElementsFromRemoteSide___block_invoke;
  v6[3] = &unk_1E6919898;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[AXRemoteElement _getRemoteValuesOffMainThread:](self, "_getRemoteValuesOffMainThread:", v6);

}

void __49__AXRemoteElement_getLeafElementsFromRemoteSide___block_invoke(uint64_t a1)
{
  const void *v2;
  void *v3;
  id v4;

  v2 = (const void *)_AXUIElementCreateWithPIDAndID(objc_msgSend(*(id *)(a1 + 32), "remotePid"), objc_msgSend(*(id *)(a1 + 32), "uuidHash"), 9999);
  +[AXUIElement uiElementWithAXElement:](AXUIElement, "uiElementWithAXElement:", v2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "childrenIncludingPrefetchedAttributesWithCount:", 1000);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (v2)
    CFRelease(v2);

}

- (id)_remoteElementWithAttribute:(int64_t)a3 limitToRemoteSubviews:(BOOL)a4
{
  const void *AppElementWithPid;
  uint64_t v8;
  CFTypeID TypeID;
  AXRemoteElement *v10;
  pid_t v11;
  const __AXUIElement *v12;
  uint64_t *v13;
  const void *v14;
  pid_t v15;
  int v16;
  uint64_t v17;
  const void *v18;
  AXError v19;
  AXRemoteElement *v20;
  AXRemoteElement *v21;
  NSObject *v22;
  int v24;
  const void *v25;
  _QWORD v26[7];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  pid_t pid;
  _QWORD v32[8];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  int v36;
  _QWORD v37[8];
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  _BYTE buf[24];
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  AppElementWithPid = (const void *)_AXUIElementCreateAppElementWithPid(-[AXRemoteElement remotePid](self, "remotePid"));
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 0;
  if (-[AXRemoteElement machPort](self, "machPort"))
  {
    v8 = MEMORY[0x1E0C809B0];
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __69__AXRemoteElement__remoteElementWithAttribute_limitToRemoteSubviews___block_invoke;
    v37[3] = &unk_1E69198C0;
    v37[6] = AppElementWithPid;
    v37[7] = a3;
    v37[4] = self;
    v37[5] = &v38;
    -[AXRemoteElement _getRemoteValuesOffMainThread:](self, "_getRemoteValuesOffMainThread:", v37);
    if (AppElementWithPid)
      CFRelease(AppElementWithPid);
    if (!v39[3] || (TypeID = AXUIElementGetTypeID(), TypeID != CFGetTypeID((CFTypeRef)v39[3])))
    {
      v20 = 0;
LABEL_19:
      v21 = (AXRemoteElement *)v39[3];
      if (v20 != v21 && v21)
      {
        CFRelease(v21);
        v39[3] = 0;
      }
      goto LABEL_28;
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v43 = 0;
    if (!a4)
    {
      v20 = (AXRemoteElement *)v39[3];
      _Block_object_dispose(buf, 8);
      goto LABEL_28;
    }
    v33 = 0;
    v34 = &v33;
    v35 = 0x2020000000;
    v36 = 0;
    v10 = (AXRemoteElement *)v39[3];
    v32[0] = v8;
    v32[1] = 3221225472;
    v32[2] = __69__AXRemoteElement__remoteElementWithAttribute_limitToRemoteSubviews___block_invoke_2;
    v32[3] = &unk_1E69198E8;
    v32[4] = self;
    v32[5] = &v33;
    v32[6] = &v38;
    v32[7] = buf;
    -[AXRemoteElement _getRemoteValuesOffMainThread:](self, "_getRemoteValuesOffMainThread:", v32);
    if (*((_DWORD *)v34 + 6))
    {
      pid = 0;
      AXUIElementGetPid((AXUIElementRef)v39[3], &pid);
      v11 = pid;
      if (v11 == -[AXRemoteElement remotePid](self, "remotePid"))
      {
LABEL_14:
        v17 = *(_QWORD *)&buf[8];
        v18 = *(const void **)(*(_QWORD *)&buf[8] + 24);
        if (v18)
        {
          CFRelease(v18);
          v17 = *(_QWORD *)&buf[8];
          *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = 0;
        }
        v19 = AXUIElementCopyAttributeValue((AXUIElementRef)v39[3], (CFStringRef)0x7E5, (CFTypeRef *)(v17 + 24));
        *((_DWORD *)v34 + 6) = v19;
        if (v19)
          goto LABEL_36;
      }
      else
      {
        while (1)
        {
          v27 = 0;
          v28 = &v27;
          v29 = 0x2020000000;
          v30 = 0;
          v26[0] = v8;
          v26[1] = 3221225472;
          v26[2] = __69__AXRemoteElement__remoteElementWithAttribute_limitToRemoteSubviews___block_invoke_3;
          v26[3] = &unk_1E6919910;
          v26[4] = &v33;
          v26[5] = &v38;
          v26[6] = &v27;
          -[AXRemoteElement _getRemoteValuesOffMainThread:](self, "_getRemoteValuesOffMainThread:", v26);
          v12 = (const __AXUIElement *)v28[3];
          if (*((_DWORD *)v34 + 6))
            break;
          if (!v12)
            goto LABEL_31;
          v39[3] = (uint64_t)v12;
          AXUIElementGetPid(v12, &pid);
          v13 = v39;
          v14 = (const void *)v39[3];
          if (v14)
          {
            CFRelease(v14);
            v13 = v39;
            v39[3] = 0;
          }
          v13[3] = 0;
          v15 = pid;
          v16 = -[AXRemoteElement remotePid](self, "remotePid");
          _Block_object_dispose(&v27, 8);
          if (v15 == v16)
            goto LABEL_14;
        }
        if (v12)
        {
          CFRelease(v12);
          v28[3] = 0;
        }
LABEL_31:
        _Block_object_dispose(&v27, 8);
        if (*((_DWORD *)v34 + 6))
          goto LABEL_36;
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v24 = objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 24), "unsignedIntValue");
      if (v24 == -[AXRemoteElement contextId](self, "contextId"))
        v20 = v10;
      else
        v20 = 0;
      goto LABEL_37;
    }
LABEL_36:
    v20 = 0;
LABEL_37:
    _Block_object_dispose(&v33, 8);
    v25 = *(const void **)(*(_QWORD *)&buf[8] + 24);
    if (v25)
    {
      CFRelease(v25);
      *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = 0;
    }
    _Block_object_dispose(buf, 8);
    goto LABEL_19;
  }
  AXLogRemoteElement();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = a3;
    _os_log_impl(&dword_1B54A6000, v22, OS_LOG_TYPE_INFO, "%@: attempted to get remote element for attribute %ld but there was no mach port", buf, 0x16u);
  }

  if (AppElementWithPid)
    CFRelease(AppElementWithPid);
  v20 = self;
LABEL_28:
  _Block_object_dispose(&v38, 8);
  return v20;
}

uint64_t __69__AXRemoteElement__remoteElementWithAttribute_limitToRemoteSubviews___block_invoke(uint64_t a1)
{
  _AXUIElementSetMachPortForNextMessage(objc_msgSend(*(id *)(a1 + 32), "machPort"));
  return AXUIElementCopyAttributeValue(*(AXUIElementRef *)(a1 + 48), *(CFStringRef *)(a1 + 56), (CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

uint64_t __69__AXRemoteElement__remoteElementWithAttribute_limitToRemoteSubviews___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  _AXUIElementSetMachPortForNextMessage(objc_msgSend(*(id *)(a1 + 32), "machPort"));
  result = AXUIElementCopyAttributeValue(*(AXUIElementRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), (CFStringRef)0x7E5, (CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __69__AXRemoteElement__remoteElementWithAttribute_limitToRemoteSubviews___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = AXUIElementCopyAttributeValue(*(AXUIElementRef *)(*(_QWORD *)(a1[5] + 8) + 24), (CFStringRef)0x906, (CFTypeRef *)(*(_QWORD *)(a1[6] + 8) + 24));
  *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  return result;
}

- (id)_accessibilityActiveKeyboard
{
  void *v3;
  void *v4;

  if (-[AXRemoteElement onClientSide](self, "onClientSide"))
  {
    -[AXRemoteElement _remoteElementWithAttribute:limitToRemoteSubviews:](self, "_remoteElementWithAttribute:limitToRemoteSubviews:", 2076, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[AXRemoteElement remoteChildrenDelegate](self, "remoteChildrenDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_accessibilityActiveKeyboard");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)_accessibilityResponderElement
{
  return -[AXRemoteElement _remoteElementWithAttribute:limitToRemoteSubviews:](self, "_remoteElementWithAttribute:limitToRemoteSubviews:", 3002, 1);
}

- (id)_accessibilityFirstElement
{
  return -[AXRemoteElement _remoteElementWithAttribute:limitToRemoteSubviews:](self, "_remoteElementWithAttribute:limitToRemoteSubviews:", 3000, 1);
}

- (id)_accessibilityLastElement
{
  return -[AXRemoteElement _remoteElementWithAttribute:limitToRemoteSubviews:](self, "_remoteElementWithAttribute:limitToRemoteSubviews:", 3016, 1);
}

- (BOOL)_accessibilityIsGroupedParent
{
  return 0;
}

- (id)_accessibilitySortedElementsWithin
{
  void *v3;
  void *v4;

  -[AXRemoteElement remoteChildrenDelegate](self, "remoteChildrenDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityRemoteSubstituteChildren:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)_accessibilityAutomationType
{
  return 83;
}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  NSMutableSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[5];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[AXRemoteElement remoteChildrenDelegate](self, "remoteChildrenDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityRemoteSubstituteChildren:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_allChildren;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9++), "setAccessibilityContainer:", 0);
      }
      while (v7 != v9);
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  -[NSMutableSet removeAllObjects](self->_allChildren, "removeAllObjects");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __40__AXRemoteElement_accessibilityElements__block_invoke;
  v11[3] = &unk_1E6919938;
  v11[4] = self;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v11);
  return v4;
}

void __40__AXRemoteElement_accessibilityElements__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setAccessibilityContainer:", v3);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addObject:", v4);

}

+ (id)remoteElementForBlock:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "remoteElementsForBlock:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)registeredRemoteElements
{
  return (id)objc_msgSend(a1, "remoteElementsForBlock:", &__block_literal_global_16);
}

uint64_t __43__AXRemoteElement_registeredRemoteElements__block_invoke()
{
  return 1;
}

+ (id)remoteElementsForBlock:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  objc_msgSend((id)CacheLock, "lock");
  v4 = (void *)Cache;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __42__AXRemoteElement_remoteElementsForBlock___block_invoke;
  v9[3] = &unk_1E69199A0;
  v5 = v3;
  v10 = v5;
  objc_msgSend(v4, "indexesOfObjectsPassingTest:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend((id)Cache, "objectsAtIndexes:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend((id)CacheLock, "unlock");

  return v7;
}

uint64_t __42__AXRemoteElement_remoteElementsForBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)remoteElementsForContextId:(unsigned int)a3
{
  _QWORD v4[4];
  unsigned int v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__AXRemoteElement_remoteElementsForContextId___block_invoke;
  v4[3] = &__block_descriptor_36_e25_B16__0__AXRemoteElement_8l;
  v5 = a3;
  objc_msgSend(a1, "remoteElementsForBlock:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

BOOL __46__AXRemoteElement_remoteElementsForContextId___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "contextId") == *(_DWORD *)(a1 + 32);
}

+ (BOOL)registerRemoteElement:(id)a3 remotePort:(unsigned int)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  id *v17;
  id v18;
  void *v19;
  NSObject *v20;
  BOOL v21;
  NSObject *v22;
  void *v23;
  void *v24;
  AXRemoteElement *v25;
  void *v26;
  void *v27;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  const __CFString *v33;
  AXRemoteElement *v34;
  uint8_t buf[4];
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  AXLogRemoteElement();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v36 = v5;
    _os_log_impl(&dword_1B54A6000, v6, OS_LOG_TYPE_INFO, "+[AXRemoteElement registerRemoteElement]: %@", buf, 0xCu);
  }

  objc_msgSend(v5, "objectForKey:", CFSTR("ax-pid"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "intValue");

  objc_msgSend(v5, "objectForKey:", CFSTR("ax-context"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedIntValue");

  objc_msgSend(v5, "objectForKey:", CFSTR("ax-contextretrieval"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("ax-pidretrieval"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("ax-uuid"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("ax-register"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "BOOLValue");

  if (v15)
  {
    objc_msgSend((id)CacheLock, "lock");
    v16 = (void *)Cache;
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __52__AXRemoteElement_registerRemoteElement_remotePort___block_invoke;
    v31[3] = &unk_1E69199E8;
    v17 = &v32;
    v18 = v13;
    v32 = v18;
    objc_msgSend(v16, "indexesOfObjectsPassingTest:", v31);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)CacheLock, "unlock");
    if (objc_msgSend(v19, "count"))
    {
      AXLogRemoteElement();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v36 = v19;
        _os_log_impl(&dword_1B54A6000, v20, OS_LOG_TYPE_INFO, "We don't need to re-register, we already have a remote element that works with this UUID: %@", buf, 0xCu);
      }

      v21 = 0;
    }
    else
    {
      v25 = -[AXRemoteElement initWithUUID:andRemotePid:andContextId:]([AXRemoteElement alloc], "initWithUUID:andRemotePid:andContextId:", v18, v8, v10);
      -[AXRemoteElement setContextRetrieval:](v25, "setContextRetrieval:", v11);
      -[AXRemoteElement setPidRetrieval:](v25, "setPidRetrieval:", v12);
      -[AXRemoteElement setMachPort:](v25, "setMachPort:", a4);
      v33 = CFSTR("element");
      v34 = v25;
      v21 = 1;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "postNotificationName:object:userInfo:", CFSTR("ax_remote_element_registered"), 0, v26);

    }
  }
  else
  {
    AXLogRemoteElement();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v13;
      _os_log_impl(&dword_1B54A6000, v22, OS_LOG_TYPE_INFO, "Unregistering remote element: %@", buf, 0xCu);
    }

    objc_msgSend((id)CacheLock, "lock");
    v23 = (void *)Cache;
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __52__AXRemoteElement_registerRemoteElement_remotePort___block_invoke_37;
    v29[3] = &unk_1E69199E8;
    v17 = &v30;
    v30 = v13;
    objc_msgSend(v23, "indexesOfObjectsPassingTest:", v29);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "removeObjectsAtIndexes:", v24);

    objc_msgSend((id)CacheLock, "unlock");
    v21 = 1;
  }

  return v21;
}

uint64_t __52__AXRemoteElement_registerRemoteElement_remotePort___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __52__AXRemoteElement_registerRemoteElement_remotePort___block_invoke_37(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)setMachPort:(unsigned int)a3
{
  ipc_space_t *v5;
  _BOOL4 v6;
  mach_port_name_t machPort;

  v5 = (ipc_space_t *)MEMORY[0x1E0C83DA0];
  if (a3)
    v6 = mach_port_mod_refs(*MEMORY[0x1E0C83DA0], a3, 0, 1) == 0;
  else
    v6 = 0;
  machPort = self->_machPort;
  if (machPort)
  {
    mach_port_deallocate(*v5, machPort);
    self->_machPort = 0;
  }
  if (v6)
    self->_machPort = a3;
}

- (void)unregister
{
  objc_msgSend((id)CacheLock, "lock");
  objc_msgSend((id)Cache, "removeObjectIdenticalTo:", self);
  objc_msgSend((id)CacheLock, "unlock");
}

- (CGRect)accessibilityFrame
{
  void *v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  uint64_t i;
  void *v17;
  BOOL v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;
  CGRect v37;
  CGRect result;
  CGRect v39;
  CGRect v40;

  v36 = *MEMORY[0x1E0C80C00];
  -[AXRemoteElement accessibilityElements](self, "accessibilityElements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = *MEMORY[0x1E0C9D648];
    v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v8 = v3;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v32;
      v12 = v7;
      v13 = v6;
      v14 = v5;
      v15 = v4;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v32 != v11)
            objc_enumerationMutation(v8);
          v17 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          v37.origin.x = v15;
          v37.origin.y = v14;
          v37.size.width = v13;
          v37.size.height = v12;
          v39.origin.x = v4;
          v39.origin.y = v5;
          v39.size.width = v6;
          v39.size.height = v7;
          v18 = CGRectEqualToRect(v37, v39);
          objc_msgSend(v17, "accessibilityFrame", (_QWORD)v31);
          if (!v18)
          {
            v40.origin.x = v15;
            v40.origin.y = v14;
            v40.size.width = v13;
            v40.size.height = v12;
            *(CGRect *)&v19 = CGRectUnion(*(CGRect *)&v19, v40);
          }
          v15 = v19;
          v14 = v20;
          v13 = v21;
          v12 = v22;
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v10);
    }
    else
    {
      v12 = v7;
      v13 = v6;
      v14 = v5;
      v15 = v4;
    }
  }
  else
  {
    -[AXRemoteElement accessibilityContainer](self, "accessibilityContainer");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accessibilityFrame");
    v15 = v23;
    v14 = v24;
    v13 = v25;
    v12 = v26;
  }

  v27 = v15;
  v28 = v14;
  v29 = v13;
  v30 = v12;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
  return result;
}

- (BOOL)_accessibilityHasVisibleFrame
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  char v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[AXRemoteElement accessibilityElements](self, "accessibilityElements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "_accessibilityHasVisibleFrame", (_QWORD)v11) & 1) != 0)
          {
            v9 = 1;
            goto LABEL_13;
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v6)
          continue;
        break;
      }
    }

  }
  -[AXRemoteElement accessibilityContainer](self, "accessibilityContainer", (_QWORD)v11);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "_accessibilityHasVisibleFrame");
LABEL_13:

  return v9;
}

- (void)_accessibilityIncreaseSelection:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AXRemoteElement accessibilityContainer](self, "accessibilityContainer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_accessibilityIncreaseSelection:", v4);

}

- (id)description
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;

  v14 = (void *)MEMORY[0x1E0CB3940];
  v3 = objc_opt_class();
  v4 = -[AXRemoteElement remotePid](self, "remotePid");
  v5 = -[AXRemoteElement machPort](self, "machPort");
  v6 = -[AXRemoteElement contextId](self, "contextId");
  v7 = -[AXRemoteElement uuidHash](self, "uuidHash");
  -[AXRemoteElement uuid](self, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXRemoteElement accessibilityContainer](self, "accessibilityContainer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXRemoteElement accessibilityContainer](self, "accessibilityContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "valueForKey:", CFSTR("_accessibilityWindow"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("%@:%p - pid: %d, mach port: %d context: %u, uuid hash: %lld uuid: %@\n\tParent: %@[%@]"), v3, self, v4, v5, v6, v7, v8, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)_accessibilitySetFocusOnElement:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[AXRemoteElement accessibilityContainer](self, "accessibilityContainer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_accessibilitySetFocusOnElement:", v3);

}

- (BOOL)_accessibilitySetNativeFocus
{
  void *v2;
  char v3;

  -[AXRemoteElement accessibilityContainer](self, "accessibilityContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_accessibilitySetNativeFocus");

  return v3;
}

- (void)setRemotePid:(int)a3
{
  self->_remotePid = a3;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (void)setContextId:(unsigned int)a3
{
  self->_contextId = a3;
}

- (BOOL)onClientSide
{
  return self->_onClientSide;
}

- (void)setOnClientSide:(BOOL)a3
{
  self->_onClientSide = a3;
}

- (AXRemoteElementChildrenDelegate)remoteChildrenDelegate
{
  return (AXRemoteElementChildrenDelegate *)objc_loadWeakRetained((id *)&self->_remoteChildrenDelegate);
}

- (void)setRemoteChildrenDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_remoteChildrenDelegate, a3);
}

- (unsigned)machPort
{
  return self->_machPort;
}

- (id)accessibilityContainer
{
  return objc_loadWeakRetained(&self->_accessibilityContainer);
}

- (BOOL)deniesDirectAppConnection
{
  return self->_deniesDirectAppConnection;
}

- (void)setDeniesDirectAppConnection:(BOOL)a3
{
  self->_deniesDirectAppConnection = a3;
}

- (id)contextRetrieval
{
  return self->_contextRetrieval;
}

- (void)setContextRetrieval:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)pidRetrieval
{
  return self->_pidRetrieval;
}

- (void)setPidRetrieval:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pidRetrieval, 0);
  objc_storeStrong(&self->_contextRetrieval, 0);
  objc_destroyWeak(&self->_accessibilityContainer);
  objc_destroyWeak((id *)&self->_remoteChildrenDelegate);
  objc_storeStrong((id *)&self->_allChildren, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
