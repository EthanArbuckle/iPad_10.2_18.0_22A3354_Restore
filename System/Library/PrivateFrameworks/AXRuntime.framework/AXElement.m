@implementation AXElement

+ (id)elementWithAXUIElement:(__AXUIElement *)a3
{
  return -[AXElement initWithAXUIElement:]([AXElement alloc], "initWithAXUIElement:", a3);
}

+ (AXElement)elementWithUIElement:(id)a3
{
  id v3;
  AXElement *v4;

  v3 = a3;
  v4 = -[AXElement initWithUIElement:]([AXElement alloc], "initWithUIElement:", v3);

  return v4;
}

+ (id)elementsWithUIElements:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          +[AXElement elementWithUIElement:](AXElement, "elementWithUIElement:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)primaryApp
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  +[AXElement systemWideElement](AXElement, "systemWideElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "systemApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentApplications");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (void)unregisterNotifications:(id)a3
{
  objc_msgSend((id)Handlers, "removeObjectForKey:", a3);
}

+ (void)registerNotifications:(id)a3 withIdentifier:(id)a4 withHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  const __AXUIElement *v13;
  __CFString **v14;
  NSObject *v15;
  uint64_t i;
  void *v17;
  __CFString **v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  char v25;
  __CFString *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  AXError v31;
  int v32;
  NSObject *v33;
  CFRunLoopSourceRef RunLoopSource;
  __CFRunLoopSource *v35;
  __CFRunLoop *Current;
  id v37;
  id v38;
  id v39;
  const __AXUIElement *element;
  AXError v41;
  NSObject *obj;
  uint64_t v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  pid_t pid;
  _QWORD v55[2];
  _QWORD v56[2];
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    AXRuntimeLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      +[AXElement registerNotifications:withIdentifier:withHandler:].cold.4(v10);

  }
  +[AXElement systemWideElement](AXElement, "systemWideElement");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "uiElement");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (const __AXUIElement *)objc_msgSend(v12, "axElement");

  v14 = kAXAnnouncementTypeLockScreenTouchIDAuthenticationSuccessSound;
  if (!Observer)
  {
    v29 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v30 = (void *)Handlers;
    Handlers = (uint64_t)v29;

    pid = 0;
    AXUIElementGetPid(v13, &pid);
    v31 = AXObserverCreate(pid, (AXObserverCallback)_accessibilityEventsHandler, (AXObserverRef *)&Observer);
    if (v31)
    {
      v32 = v31;
      AXRuntimeLogCommon();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        +[AXElement registerNotifications:withIdentifier:withHandler:].cold.3(v32, v33);
    }
    else
    {
      RunLoopSource = AXObserverGetRunLoopSource((AXObserverRef)Observer);
      if (RunLoopSource)
      {
        v35 = RunLoopSource;
        Current = CFRunLoopGetCurrent();
        CFRunLoopAddSource(Current, v35, (CFRunLoopMode)*MEMORY[0x1E0C9B280]);
        goto LABEL_6;
      }
      AXRuntimeLogCommon();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        +[AXElement registerNotifications:withIdentifier:withHandler:].cold.1(v33);
    }

    goto LABEL_32;
  }
LABEL_6:
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v15 = v7;
  obj = v15;
  v45 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
  if (v45)
  {
    v39 = v7;
    element = v13;
    v37 = v9;
    v38 = v8;
    v41 = kAXErrorSuccess;
    v44 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v45; ++i)
      {
        if (*(_QWORD *)v51 != v44)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
        v46 = 0u;
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        v18 = v14;
        -[__CFString allValues](v14[314], "allValues");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v46, v57, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v47;
          while (2)
          {
            for (j = 0; j != v21; ++j)
            {
              if (*(_QWORD *)v47 != v22)
                objc_enumerationMutation(v19);
              objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * j), "objectForKey:", CFSTR("notifications"));
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = objc_msgSend(v24, "containsObject:", v17);

              if ((v25 & 1) != 0)
              {

                goto LABEL_21;
              }
            }
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v46, v57, 16);
            if (v21)
              continue;
            break;
          }
        }

        v41 = AXObserverAddNotification((AXObserverRef)Observer, element, (CFStringRef)objc_msgSend(v17, "intValue"), a1);
LABEL_21:
        v14 = v18;
      }
      v45 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
    }
    while (v45);

    v8 = v38;
    v7 = v39;
    v9 = v37;
    if (v41 == kAXErrorSuccess)
      goto LABEL_27;
    AXRuntimeLogCommon();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      +[AXElement registerNotifications:withIdentifier:withHandler:].cold.2(v41, v15);
  }

LABEL_27:
  v26 = v14[314];
  v55[0] = CFSTR("notifications");
  v55[1] = CFSTR("handler");
  v56[0] = obj;
  v27 = (void *)objc_msgSend(v9, "copy");
  v56[1] = v27;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, v55, 2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString setObject:forKey:](v26, "setObject:forKey:", v28, v8);

LABEL_32:
}

- (unsigned)displayIdForContextId:(unsigned int)a3
{
  uint64_t v3;
  __AXUIElement *v4;
  CFTypeID v5;
  CFTypeRef cf;
  unsigned int valuePtr;

  v3 = *(_QWORD *)&a3;
  valuePtr = 0;
  cf = 0;
  v4 = -[AXElement elementRef](self, "elementRef");
  AXUIElementCopyParameterizedAttributeValue(v4, (CFStringRef)0x16575, (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3), &cf);
  if (cf)
  {
    v5 = CFGetTypeID(cf);
    if (v5 == CFNumberGetTypeID())
      CFNumberGetValue((CFNumberRef)cf, kCFNumberIntType, &valuePtr);
    if (cf)
      CFRelease(cf);
  }
  return valuePtr;
}

- (unsigned)contextIdForPoint:(CGPoint)a3
{
  AXValueRef v4;
  CFTypeID v5;
  CFTypeRef cf;
  unsigned int v8;
  CGPoint valuePtr;

  valuePtr = a3;
  v8 = 0;
  cf = 0;
  v4 = AXValueCreate(kAXValueTypeCGPoint, &valuePtr);
  AXUIElementCopyParameterizedAttributeValue(-[AXElement elementRef](self, "elementRef"), (CFStringRef)0x16572, v4, &cf);
  if (cf)
  {
    v5 = CFGetTypeID(cf);
    if (v5 == CFNumberGetTypeID())
      CFNumberGetValue((CFNumberRef)cf, kCFNumberIntType, &v8);
    if (cf)
    {
      CFRelease(cf);
      cf = 0;
    }
  }
  if (v4)
    CFRelease(v4);
  return v8;
}

+ (id)elementAtCoordinate:(CGPoint)a3 withVisualPadding:(BOOL)a4 displayID:(unsigned int)a5
{
  _BOOL4 v5;
  CGFloat y;
  CGFloat x;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v15;
  CGPoint v17;

  v5 = a4;
  y = a3.y;
  x = a3.x;
  +[AXUIElement uiElementAtCoordinate:displayId:](AXUIElement, "uiElementAtCoordinate:displayId:", *(_QWORD *)&a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[AXElement elementWithUIElement:](AXElement, "elementWithUIElement:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v8)
    goto LABEL_6;
  objc_msgSend(v9, "frame");
  if (v5)
    *(CGRect *)&v11 = CGRectInset(*(CGRect *)&v11, -5.0, -5.0);
  v17.x = x;
  v17.y = y;
  if (CGRectContainsPoint(*(CGRect *)&v11, v17))
    v15 = v10;
  else
LABEL_6:
    v15 = 0;

  return v15;
}

+ (id)elementAtCoordinate:(CGPoint)a3 withVisualPadding:(BOOL)a4
{
  return +[AXElement elementAtCoordinate:withVisualPadding:displayID:](AXElement, "elementAtCoordinate:withVisualPadding:displayID:", a4, 0, a3.x, a3.y);
}

+ (id)systemWideElement
{
  if (systemWideElement_onceToken != -1)
    dispatch_once(&systemWideElement_onceToken, &__block_literal_global_11);
  return (id)systemWideElement_System;
}

void __30__AXElement_systemWideElement__block_invoke()
{
  AXUIElementRef SystemWide;
  AXElement *v1;
  void *v2;

  SystemWide = AXUIElementCreateSystemWide();
  v1 = -[AXElement initWithAXUIElement:]([AXElement alloc], "initWithAXUIElement:", SystemWide);
  v2 = (void *)systemWideElement_System;
  systemWideElement_System = (uint64_t)v1;

  if (SystemWide)
    CFRelease(SystemWide);
}

+ (id)applicationAtCoordinate:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  const __AXUIElement *v6;
  float v7;
  float v8;
  void *v9;
  CFTypeRef cf;

  y = a3.y;
  x = a3.x;
  +[AXElement systemWideElement](AXElement, "systemWideElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  cf = 0;
  v6 = (const __AXUIElement *)objc_msgSend(v5, "elementRef");
  v7 = x;
  v8 = y;
  v9 = 0;
  if (!AXUIElementCopyApplicationAtPosition(v6, (uint64_t *)&cf, v7, v8))
  {
    +[AXElement elementWithAXUIElement:](AXElement, "elementWithAXUIElement:", cf);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (cf)
  {
    CFRelease(cf);
    cf = 0;
  }

  return v9;
}

+ (AXElement)systemEventDispatchElement
{
  void *v2;
  id v3;
  void *v4;

  +[AXElement systemWideElement](AXElement, "systemWideElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_AXSMossdeepEnabled())
  {
    objc_msgSend(v2, "systemApplication");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = v2;
  }
  v4 = v3;

  return (AXElement *)v4;
}

- (AXElement)initWithAXUIElement:(__AXUIElement *)a3
{
  void *v4;
  AXElement *v5;

  +[AXUIElement uiElementWithAXElement:](AXUIElement, "uiElementWithAXElement:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[AXElement initWithUIElement:](self, "initWithUIElement:", v4);

  return v5;
}

- (AXElement)initWithUIElement:(id)a3
{
  id v5;
  AXElement *v6;
  AXElement *v7;
  AXElement *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AXElement;
  v6 = -[AXElement init](&v14, sel_init);
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    objc_storeStrong((id *)&v6->_uiElement, a3);
    v9 = *MEMORY[0x1E0C9D628];
    v10 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v11 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v12 = *(double *)(MEMORY[0x1E0C9D628] + 24);
    -[AXElement setCachedVisibleFrame:](v7, "setCachedVisibleFrame:", *MEMORY[0x1E0C9D628], v10, v11, v12);
    -[AXElement setCachedFrame:](v7, "setCachedFrame:", v9, v10, v11, v12);
    v8 = v7;
  }

  return v8;
}

+ (AXElement)elementWithData:(id)a3
{
  const __CFData *v3;
  const __CFData *v4;
  const __CFData *v5;
  const __CFData *v6;
  void *v7;

  v3 = (const __CFData *)a3;
  v4 = v3;
  if (v3 && (v5 = _AXUIElementCreateWithData(v3)) != 0)
  {
    v6 = v5;
    +[AXElement elementWithAXUIElement:](AXElement, "elementWithAXUIElement:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(v6);
  }
  else
  {
    v7 = 0;
  }

  return (AXElement *)v7;
}

- (id)serializeToData
{
  __CFData *Data;

  Data = -[AXElement elementRef](self, "elementRef");
  if (Data)
    Data = _AXUIElementCreateData((const UInt8 *)Data);
  return Data;
}

- (void)dealloc
{
  objc_super v3;

  CGPathRelease(self->_cachedPath);
  v3.receiver = self;
  v3.super_class = (Class)AXElement;
  -[AXElement dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[AXElement uiElement](self, "uiElement");
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uiElement");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v5 && v6)
      v8 = CFEqual((CFTypeRef)v5, (CFTypeRef)v6) != 0;
    else
      v8 = (v5 | v6) == 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[AXElement uiElement](self, "uiElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("AXElement<%p>. uiElement:%@"), self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (id)elementForAttribute:(int64_t)a3
{
  return -[AXElement elementForAttribute:shouldFetchAttributes:](self, "elementForAttribute:shouldFetchAttributes:", a3, 1);
}

- (id)elementForAttribute:(int64_t)a3 shouldFetchAttributes:(BOOL)a4
{
  return -[AXElement _elementForAttribute:shouldUpdateCache:shouldFetchAttributes:](self, "_elementForAttribute:shouldUpdateCache:shouldFetchAttributes:", a3, 1, a4);
}

- (id)_elementForAttribute:(int64_t)a3 shouldUpdateCache:(BOOL)a4 shouldFetchAttributes:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;

  v5 = a5;
  if (a4)
    -[AXUIElement updateCache:](self->_uiElement, "updateCache:", a3);
  v8 = -[AXUIElement objectWithAXAttribute:](self->_uiElement, "objectWithAXAttribute:", a3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = (id)objc_msgSend(v8, "axElement");
  if (v8)
  {
    if (v5)
    {
      +[AXElement elementWithAXUIElement:](AXElement, "elementWithAXUIElement:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[AXUIElement uiElementWithAXElement:cache:](AXUIElement, "uiElementWithAXElement:cache:", v8, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[AXElement elementWithUIElement:](AXElement, "elementWithUIElement:", v10);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)elementForAttribute:(int64_t)a3 parameter:(id)a4
{
  id v4;

  v4 = -[AXUIElement objectWithAXAttribute:parameter:](self->_uiElement, "objectWithAXAttribute:parameter:", a3, a4);
  if (v4)
  {
    +[AXElement elementWithAXUIElement:](AXElement, "elementWithAXUIElement:", v4);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)elementsForAttribute:(int64_t)a3 parameter:(id)a4
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[AXUIElement uiElementsWithAttribute:parameter:](self->_uiElement, "uiElementsWithAttribute:parameter:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        +[AXElement elementWithUIElement:](AXElement, "elementWithUIElement:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)elementsForAttribute:(int64_t)a3
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[AXUIElement uiElementsWithAttribute:](self->_uiElement, "uiElementsWithAttribute:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
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
        +[AXElement elementWithUIElement:](AXElement, "elementWithUIElement:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (__AXUIElement)elementRef
{
  return -[AXUIElement axElement](self->_uiElement, "axElement");
}

- (BOOL)isSystemWideElement
{
  AXElement *v3;

  +[AXElement systemWideElement](AXElement, "systemWideElement");
  v3 = (AXElement *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = v3 == self;

  return (char)self;
}

- (BOOL)isPassivelyListeningForEvents
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[AXElement isSystemWideElement](self, "isSystemWideElement");
  if (v3)
  {
    -[AXElement uiElement](self, "uiElement");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLWithAXAttribute:", 1002);

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (void)setPassivelyListeningForEvents:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  if (-[AXElement isSystemWideElement](self, "isSystemWideElement"))
  {
    -[AXElement uiElement](self, "uiElement");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAXAttribute:withBOOL:", 1002, v3);

  }
}

- (AXElement)currentApplication
{
  void *v2;
  void *v3;

  -[AXElement currentApplications](self, "currentApplications");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (AXElement *)v3;
}

- (NSArray)currentApplications
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[AXElement uiElement](self, "uiElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateCache:", 1102);

  -[AXElement uiElement](self, "uiElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uiElementsWithAttribute:", 1102);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXElement _axElementsForAXUIElements:](self, "_axElementsForAXUIElements:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v6;
}

- (NSArray)currentApplicationsIgnoringSiri
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[AXElement uiElement](self, "uiElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateCache:", 1105);

  -[AXElement uiElement](self, "uiElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uiElementsWithAttribute:", 1105);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXElement _axElementsForAXUIElements:](self, "_axElementsForAXUIElements:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v6;
}

- (AXElement)springBoardApplication
{
  return (AXElement *)-[AXElement elementForAttribute:](self, "elementForAttribute:", 1000);
}

- (BOOL)applicationIsModal
{
  void *v2;
  char v3;

  -[AXElement uiElement](self, "uiElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLWithAXAttribute:", 1514);

  return v3;
}

+ (id)systemApplication
{
  return +[AXElement elementWithAXUIElement:](AXElement, "elementWithAXUIElement:", AXUIElementSharedSystemApp());
}

- (AXElement)systemApplication
{
  return (AXElement *)+[AXElement systemApplication](AXElement, "systemApplication");
}

+ (int)systemAppPid
{
  const __AXUIElement *v2;
  pid_t pid;

  pid = 0;
  v2 = (const __AXUIElement *)AXUIElementSharedSystemApp();
  AXUIElementGetPid(v2, &pid);
  return pid;
}

- (id)carPlaySystemApplication
{
  return -[AXElement elementForAttribute:](self, "elementForAttribute:", 1009);
}

- (AXElement)accessibilityUIServerApplication
{
  return (AXElement *)-[AXElement elementForAttribute:](self, "elementForAttribute:", 1005);
}

- (void)sendUserEventOccurred
{
  -[AXElement performAction:](self, "performAction:", 5010);
}

- (BOOL)systemPressTVSelectButton
{
  return -[AXElement performAction:](self, "performAction:", 5100);
}

- (BOOL)systemPressTVPlayPauseButton
{
  return -[AXElement performAction:](self, "performAction:", 5101);
}

- (BOOL)systemPressTVUpButton
{
  return -[AXElement performAction:](self, "performAction:", 5102);
}

- (BOOL)systemPressTVDownButton
{
  return -[AXElement performAction:](self, "performAction:", 5103);
}

- (BOOL)systemPressTVLeftButton
{
  return -[AXElement performAction:](self, "performAction:", 5104);
}

- (BOOL)systemPressTVRightButton
{
  return -[AXElement performAction:](self, "performAction:", 5105);
}

- (BOOL)systemPressTVMenuButton
{
  return -[AXElement performAction:](self, "performAction:", 5106);
}

- (BOOL)systemLongPressTVMenuButton
{
  return -[AXElement performAction:](self, "performAction:", 5109);
}

- (BOOL)systemPressTVHomeButton
{
  return -[AXElement performAction:](self, "performAction:", 5107);
}

- (BOOL)systemLongPressTVHomeButton
{
  return -[AXElement performAction:](self, "performAction:", 5110);
}

- (BOOL)systemPressTVSiriButton
{
  return -[AXElement performAction:](self, "performAction:", 5108);
}

- (NSString)elementTransactionSummary
{
  return (NSString *)-[AXUIElement stringWithAXAttribute:](self->_uiElement, "stringWithAXAttribute:", 3067);
}

- (CGRect)convertRect:(CGRect)a3 toContextId:(unsigned int)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[AXElement convertRect:toContextId:displayId:](self, "convertRect:toContextId:displayId:", *(_QWORD *)&a4, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 toContextId:(unsigned int)a4 displayId:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  AXValueRef v8;
  AXUIElement *uiElement;
  void *v10;
  void *v11;
  const __AXValue *v12;
  double width;
  double height;
  double x;
  double y;
  CGRect v17;
  _QWORD v18[4];
  CGRect result;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  v18[3] = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v8 = AXValueCreate(kAXValueTypeCGRect, &v17);
  uiElement = self->_uiElement;
  v18[0] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v10;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v11;
  v12 = -[AXUIElement objectWithAXAttribute:parameter:](uiElement, "objectWithAXAttribute:parameter:", 91511, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 3));

  if (v8)
    CFRelease(v8);
  if (v12)
    AXValueGetValue(v12, kAXValueTypeCGRect, &v17);
  width = v17.size.width;
  height = v17.size.height;
  x = v17.origin.x;
  y = v17.origin.y;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 fromContextId:(unsigned int)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[AXElement convertRect:fromContextId:displayId:](self, "convertRect:fromContextId:displayId:", *(_QWORD *)&a4, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 fromContextId:(unsigned int)a4 displayId:(unsigned int)a5
{
  uint64_t v5;
  uint64_t v6;
  AXValueRef v8;
  AXUIElement *uiElement;
  void *v10;
  void *v11;
  const __AXValue *v12;
  double width;
  double height;
  double x;
  double y;
  CGRect v17;
  _QWORD v18[4];
  CGRect result;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  v18[3] = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v8 = AXValueCreate(kAXValueTypeCGRect, &v17);
  uiElement = self->_uiElement;
  v18[0] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v10;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v11;
  v12 = -[AXUIElement objectWithAXAttribute:parameter:](uiElement, "objectWithAXAttribute:parameter:", 91505, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 3));

  if (v8)
    CFRelease(v8);
  if (v12)
    AXValueGetValue(v12, kAXValueTypeCGRect, &v17);
  width = v17.size.width;
  height = v17.size.height;
  x = v17.origin.x;
  y = v17.origin.y;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 fromContextId:(unsigned int)a4
{
  double v4;
  double v5;
  CGPoint result;

  -[AXElement convertPoint:fromContextId:displayId:](self, "convertPoint:fromContextId:displayId:", *(_QWORD *)&a4, 0, a3.x, a3.y);
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 fromContextId:(unsigned int)a4 displayId:(unsigned int)a5
{
  double v5;
  double v6;
  CGPoint result;

  v5 = AXConvertPointFromHostedCoordinates(*(uint64_t *)&a4, *(uint64_t *)&a5, a3.x, a3.y);
  result.y = v6;
  result.x = v5;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 toContextId:(unsigned int)a4
{
  double v4;
  double v5;
  CGPoint result;

  -[AXElement convertPoint:toContextId:displayId:](self, "convertPoint:toContextId:displayId:", *(_QWORD *)&a4, 0, a3.x, a3.y);
  result.y = v5;
  result.x = v4;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 toContextId:(unsigned int)a4 displayId:(unsigned int)a5
{
  double v5;
  double v6;
  CGPoint result;

  v5 = AXConvertPointToHostedCoordinates(*(uint64_t *)&a4, *(uint64_t *)&a5, a3.x, a3.y);
  result.y = v6;
  result.x = v5;
  return result;
}

- (CGPath)convertPath:(CGPath *)a3 fromContextId:(unsigned int)a4
{
  return -[AXElement convertPath:fromContextId:displayId:](self, "convertPath:fromContextId:displayId:", a3, *(_QWORD *)&a4, 0);
}

- (CGPath)convertPath:(CGPath *)a3 fromContextId:(unsigned int)a4 displayId:(unsigned int)a5
{
  CGMutablePathRef Mutable;
  _QWORD v11[6];
  unsigned int v12;
  unsigned int v13;

  if (!a3)
    return 0;
  Mutable = CGPathCreateMutable();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __49__AXElement_convertPath_fromContextId_displayId___block_invoke;
  v11[3] = &unk_1E6919DA8;
  v12 = a4;
  v13 = a5;
  v11[4] = self;
  v11[5] = Mutable;
  AX_CGPathEnumerateElementsUsingBlock(a3, v11);
  return (CGPath *)CFAutorelease(Mutable);
}

void __49__AXElement_convertPath_fromContextId_displayId___block_invoke(uint64_t a1, int a2, CGFloat *a3, uint64_t a4)
{
  uint64_t v7;
  double *v8;
  uint64_t v9;
  uint64_t v10;

  if (a4)
  {
    v7 = a4;
    v8 = a3 + 1;
    do
    {
      objc_msgSend(*(id *)(a1 + 32), "convertPoint:fromContextId:displayId:", *(unsigned int *)(a1 + 48), *(unsigned int *)(a1 + 52), *(v8 - 1), *v8);
      *((_QWORD *)v8 - 1) = v9;
      *(_QWORD *)v8 = v10;
      v8 += 2;
      --v7;
    }
    while (v7);
  }
  switch(a2)
  {
    case 0:
      CGPathMoveToPoint(*(CGMutablePathRef *)(a1 + 40), 0, *a3, a3[1]);
      break;
    case 1:
      CGPathAddLineToPoint(*(CGMutablePathRef *)(a1 + 40), 0, *a3, a3[1]);
      break;
    case 2:
      CGPathAddQuadCurveToPoint(*(CGMutablePathRef *)(a1 + 40), 0, *a3, a3[1], a3[2], a3[3]);
      break;
    case 3:
      CGPathAddCurveToPoint(*(CGMutablePathRef *)(a1 + 40), 0, *a3, a3[1], a3[2], a3[3], a3[4], a3[5]);
      break;
    case 4:
      CGPathCloseSubpath(*(CGMutablePathRef *)(a1 + 40));
      break;
    default:
      return;
  }
}

- (void)updateCache:(int64_t)a3
{
  -[AXUIElement updateCache:](self->_uiElement, "updateCache:", a3);
}

- (void)clearCachedFrame:(BOOL)a3 cachedVisibleFrame:(BOOL)a4
{
  _BOOL4 v4;
  double *v6;

  v4 = a4;
  v6 = (double *)MEMORY[0x1E0C9D628];
  if (a3)
    -[AXElement setCachedFrame:](self, "setCachedFrame:", *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
  if (v4)
    -[AXElement setCachedVisibleFrame:](self, "setCachedVisibleFrame:", *v6, v6[1], v6[2], v6[3]);
}

- (int64_t)applicationOrientation
{
  void *v2;
  void *v3;
  int64_t v4;

  -[AXElement uiElement](self, "uiElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithAXAttribute:", 1503);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (int)objc_msgSend(v3, "intValue");

  return v4;
}

- (BOOL)isScreenLocked
{
  void *v2;
  char v3;

  -[AXElement uiElement](self, "uiElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLWithAXAttribute:", 1500);

  return v3;
}

- (NSArray)visibleElements
{
  void *v3;
  void *v4;

  -[AXUIElement updateCache:](self->_uiElement, "updateCache:", 3015);
  -[AXUIElement uiElementsWithAttribute:](self->_uiElement, "uiElementsWithAttribute:", 3015);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXElement _axElementsForAXUIElements:](self, "_axElementsForAXUIElements:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (AXElement)firstResponder
{
  return (AXElement *)-[AXElement elementForAttribute:](self, "elementForAttribute:", 3002);
}

- (id)firstResponderForFocus
{
  return -[AXElement elementForAttribute:](self, "elementForAttribute:", 3023);
}

- (AXElement)nativeFocusElement
{
  return (AXElement *)-[AXElement elementForAttribute:](self, "elementForAttribute:", 3024);
}

- (AXElement)nativeFocusPreferredElement
{
  return (AXElement *)-[AXElement elementForAttribute:](self, "elementForAttribute:", 3027);
}

- (AXElement)firstElementInApplication
{
  return (AXElement *)-[AXElement elementForAttribute:](self, "elementForAttribute:", 3000);
}

- (AXElement)firstElementInApplicationForFocus
{
  return (AXElement *)-[AXElement elementForAttribute:](self, "elementForAttribute:", 3009);
}

- (NSString)bundleId
{
  return (NSString *)-[AXUIElement stringWithAXAttribute:](self->_uiElement, "stringWithAXAttribute:", 3003);
}

- (NSString)processName
{
  return (NSString *)-[AXUIElement stringWithAXAttribute:](self->_uiElement, "stringWithAXAttribute:", 3041);
}

- (BOOL)isSpringBoard
{
  void *v2;
  char v3;

  -[AXElement bundleId](self, "bundleId");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.springboard"));

  return v3;
}

- (BOOL)isSystemApplication
{
  void *v2;
  char v3;

  -[AXElement bundleId](self, "bundleId");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.springboard")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.PineBoard")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.Carousel")) & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.ClarityBoard"));
  }

  return v3;
}

- (BOOL)isControlCenterVisible
{
  return -[AXUIElement BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 1516);
}

- (BOOL)isDictationListening
{
  -[AXUIElement updateCache:](self->_uiElement, "updateCache:", 3010);
  return -[AXUIElement BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 3010);
}

- (BOOL)isAXUIServer
{
  void *v2;
  char v3;

  -[AXElement bundleId](self, "bundleId");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.accessibility.AccessibilityUIServer"));

  return v3;
}

- (NSArray)explorerElements
{
  void *v3;
  void *v4;

  -[AXUIElement uiElementsWithAttribute:](self->_uiElement, "uiElementsWithAttribute:", 3022);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXElement _axElementsForAXUIElements:](self, "_axElementsForAXUIElements:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)nativeFocusableElements
{
  void *v3;
  void *v4;

  -[AXUIElement uiElementsWithAttribute:](self->_uiElement, "uiElementsWithAttribute:", 3029);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXElement _axElementsForAXUIElements:](self, "_axElementsForAXUIElements:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)elementsWithSemanticContext
{
  void *v3;
  void *v4;

  -[AXUIElement uiElementsWithAttribute:](self->_uiElement, "uiElementsWithAttribute:", 3025);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXElement _axElementsForAXUIElements:](self, "_axElementsForAXUIElements:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)siriContentNativeFocusableElements
{
  void *v3;
  void *v4;

  -[AXUIElement uiElementsWithAttribute:](self->_uiElement, "uiElementsWithAttribute:", 3031);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXElement _axElementsForAXUIElements:](self, "_axElementsForAXUIElements:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)siriContentElementsWithSemanticContext
{
  void *v3;
  void *v4;

  -[AXUIElement uiElementsWithAttribute:](self->_uiElement, "uiElementsWithAttribute:", 3032);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXElement _axElementsForAXUIElements:](self, "_axElementsForAXUIElements:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (id)focusContainersForCurrentSceneIdentifier:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v4 = (objc_class *)MEMORY[0x1E0C99E08];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  -[AXUIElement objectWithAXAttribute:parameter:](self->_uiElement, "objectWithAXAttribute:parameter:", 95257, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__AXElement_focusContainersForCurrentSceneIdentifier___block_invoke;
  v10[3] = &unk_1E6919E38;
  v8 = v6;
  v11 = v8;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v10);

  return v8;
}

void __54__AXElement_focusContainersForCurrentSceneIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  objc_msgSend(a3, "ax_mappedArrayUsingBlock:", &__block_literal_global_33);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

}

AXElement *__54__AXElement_focusContainersForCurrentSceneIdentifier___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[AXElement elementWithAXUIElement:](AXElement, "elementWithAXUIElement:", a2);
}

- (NSString)focusedSceneIdentifier
{
  return (NSString *)-[AXUIElement stringWithAXAttribute:](self->_uiElement, "stringWithAXAttribute:", 3069);
}

- (AXElement)currentFocusContainer
{
  return (AXElement *)-[AXElement elementForAttribute:](self, "elementForAttribute:", 3062);
}

- (id)elementsMatchingText:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB3500];
  v5 = a3;
  objc_msgSend(v4, "whitespaceAndNewlineCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v7, CFSTR("searchText"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v9, CFSTR("resultLimit"));

  -[AXUIElement uiElementsWithAttribute:parameter:](self->_uiElement, "uiElementsWithAttribute:parameter:", 92516, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        +[AXElement elementWithAXUIElement:](AXElement, "elementWithAXUIElement:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v16), (_QWORD)v19);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
          objc_msgSend(v11, "addObject:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v14);
  }

  return v11;
}

- (AXElement)application
{
  return (AXElement *)-[AXElement elementForAttribute:](self, "elementForAttribute:", 2017);
}

- (id)remoteApplication
{
  void *v2;
  uint64_t v3;

  -[AXElement elementForAttribute:](self, "elementForAttribute:", 2142);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[AXElement elementWithUIElement:](AXElement, "elementWithUIElement:", v2);
    v3 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v3;
  }
  return v2;
}

- (BOOL)isAccessibleElement
{
  return -[AXUIElement BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 2016);
}

- (BOOL)isVisible
{
  return -[AXUIElement BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 2025);
}

- (NSString)label
{
  return (NSString *)-[AXUIElement stringWithAXAttribute:](self->_uiElement, "stringWithAXAttribute:", 2001);
}

- (NSString)speakThisString
{
  return (NSString *)-[AXUIElement stringWithAXAttribute:](self->_uiElement, "stringWithAXAttribute:", 2085);
}

- (id)accessibilityLocalizedStringKey
{
  return -[AXUIElement stringWithAXAttribute:](self->_uiElement, "stringWithAXAttribute:", 5047);
}

- (id)accessibilityLocalizationBundleID
{
  return -[AXUIElement stringWithAXAttribute:](self->_uiElement, "stringWithAXAttribute:", 5048);
}

- (id)accessibilityLocalizationBundlePath
{
  return -[AXUIElement stringWithAXAttribute:](self->_uiElement, "stringWithAXAttribute:", 5049);
}

- (id)accessibilityLocalizedStringTableName
{
  return -[AXUIElement stringWithAXAttribute:](self->_uiElement, "stringWithAXAttribute:", 5050);
}

- (NSString)hint
{
  return (NSString *)-[AXUIElement stringWithAXAttribute:](self->_uiElement, "stringWithAXAttribute:", 2002);
}

- (NSString)speechInputLabel
{
  void *v2;
  void *v3;

  -[AXElement userInputLabels](self, "userInputLabels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSArray)userInputLabels
{
  return (NSArray *)-[AXUIElement arrayWithAXAttribute:](self->_uiElement, "arrayWithAXAttribute:", 2186);
}

- (void)setValue:(id)a3
{
  -[AXUIElement setAXAttribute:withString:](self->_uiElement, "setAXAttribute:withString:", 2006, a3);
}

- (NSString)value
{
  return (NSString *)-[AXUIElement stringWithAXAttribute:](self->_uiElement, "stringWithAXAttribute:", 2006);
}

- (NSURL)url
{
  void *v2;
  id v3;

  -[AXUIElement objectWithAXAttribute:](self->_uiElement, "objectWithAXAttribute:", 2020);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return (NSURL *)v3;
}

- (CGPath)path
{
  CGPath *v3;
  void *v4;

  if (!-[AXElement cachedPath](self, "cachedPath"))
  {
    v3 = -[AXUIElement pathWithAXAttribute:](self->_uiElement, "pathWithAXAttribute:", 2042);
    +[AXElement systemWideElement](AXElement, "systemWideElement");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXElement setCachedPath:](self, "setCachedPath:", objc_msgSend(v4, "convertPath:fromContextId:displayId:", v3, -[AXElement windowContextId](self, "windowContextId"), -[AXElement windowDisplayId](self, "windowDisplayId")));

  }
  return -[AXElement cachedPath](self, "cachedPath");
}

- (NSString)language
{
  return (NSString *)-[AXUIElement stringWithAXAttribute:](self->_uiElement, "stringWithAXAttribute:", 2008);
}

- (NSString)identifier
{
  return (NSString *)-[AXUIElement stringWithAXAttribute:](self->_uiElement, "stringWithAXAttribute:", 2031);
}

- (unint64_t)traits
{
  void *v2;
  unint64_t v3;

  -[AXUIElement numberWithAXAttribute:](self->_uiElement, "numberWithAXAttribute:", 2004);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedLongLongValue");

  return v3;
}

- (id)auditIssuesForOptions:(id)a3
{
  void *v3;
  id v4;

  -[AXUIElement objectWithAXAttribute:parameter:](self->_uiElement, "objectWithAXAttribute:parameter:", 95005, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (CGPoint)centerPoint
{
  double v2;
  double v3;
  CGPoint result;

  -[AXUIElement pointWithAXAttribute:](self->_uiElement, "pointWithAXAttribute:", 2007);
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)visiblePoint
{
  double v2;
  double v3;
  CGPoint result;

  -[AXUIElement pointWithAXAttribute:](self->_uiElement, "pointWithAXAttribute:", 2070);
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGRect)frame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect v16;
  CGRect result;

  -[AXElement cachedFrame](self, "cachedFrame");
  if (CGRectIsNull(v16))
  {
    -[AXUIElement rectWithAXAttribute:](self->_uiElement, "rectWithAXAttribute:", 2003);
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    +[AXElement systemWideElement](AXElement, "systemWideElement");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "convertRect:fromContextId:displayId:", -[AXElement windowContextId](self, "windowContextId"), -[AXElement windowDisplayId](self, "windowDisplayId"), v4, v6, v8, v10);
    -[AXElement setCachedFrame:](self, "setCachedFrame:");

  }
  -[AXElement cachedFrame](self, "cachedFrame");
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGRect)textCursorFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect result;

  -[AXUIElement updateCache:](self->_uiElement, "updateCache:", 2050);
  -[AXUIElement rectWithAXAttribute:](self->_uiElement, "rectWithAXAttribute:", 2050);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  +[AXElement systemWideElement](AXElement, "systemWideElement");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "convertRect:fromContextId:displayId:", -[AXElement windowContextId](self, "windowContextId"), -[AXElement windowDisplayId](self, "windowDisplayId"), v4, v6, v8, v10);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  v20 = v13;
  v21 = v15;
  v22 = v17;
  v23 = v19;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (CGRect)visibleFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect v16;
  CGRect result;

  -[AXElement cachedVisibleFrame](self, "cachedVisibleFrame");
  if (CGRectIsNull(v16))
  {
    -[AXUIElement rectWithAXAttribute:](self->_uiElement, "rectWithAXAttribute:", 2057);
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    +[AXElement systemWideElement](AXElement, "systemWideElement");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "convertRect:fromContextId:displayId:", -[AXElement windowContextId](self, "windowContextId"), -[AXElement windowDisplayId](self, "windowDisplayId"), v4, v6, v8, v10);
    -[AXElement setCachedVisibleFrame:](self, "setCachedVisibleFrame:");

  }
  -[AXElement cachedVisibleFrame](self, "cachedVisibleFrame");
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGRect)focusableFrameForZoom
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect result;

  -[AXUIElement updateCache:](self->_uiElement, "updateCache:", 2149);
  -[AXUIElement rectWithAXAttribute:](self->_uiElement, "rectWithAXAttribute:", 2149);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  +[AXElement systemWideElement](AXElement, "systemWideElement");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "convertRect:fromContextId:displayId:", -[AXElement windowContextId](self, "windowContextId"), -[AXElement windowDisplayId](self, "windowDisplayId"), v4, v6, v8, v10);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  v20 = v13;
  v21 = v15;
  v22 = v17;
  v23 = v19;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (BOOL)isValid
{
  return -[AXUIElement BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 2056);
}

- (unint64_t)containerType
{
  void *v2;
  unint64_t v3;

  -[AXUIElement numberWithAXAttribute:](self->_uiElement, "numberWithAXAttribute:", 2187);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (BOOL)isTouchContainer
{
  return (~-[AXElement traits](self, "traits") & 0x200000000000) == 0
      || -[AXElement containerType](self, "containerType") == 256
      || -[AXElement containerType](self, "containerType") == 0x2000;
}

- (id)containerTypes
{
  return -[AXUIElement arrayWithAXAttribute:](self->_uiElement, "arrayWithAXAttribute:", 2145);
}

- (AXElement)touchContainer
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  CFTypeID v7;
  id v8;
  CFTypeID v9;
  void *v10;

  -[AXElement containerTypes](self, "containerTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = &unk_1E69266E0;
  if ((objc_msgSend(v3, "containsObject:", &unk_1E69266E0) & 1) != 0
    || (v4 = &unk_1E69266F8, (objc_msgSend(v3, "containsObject:", &unk_1E69266F8) & 1) != 0)
    || (v4 = &unk_1E6926710, (objc_msgSend(v3, "containsObject:", &unk_1E6926710) & 1) != 0)
    || (v4 = &unk_1E6926728, (objc_msgSend(v3, "containsObject:", &unk_1E6926728) & 1) != 0)
    || (v4 = &unk_1E6926740, (objc_msgSend(v3, "containsObject:", &unk_1E6926740) & 1) != 0)
    || (v4 = &unk_1E6926758, (objc_msgSend(v3, "containsObject:", &unk_1E6926758) & 1) != 0)
    || (v4 = &unk_1E6926770, (objc_msgSend(v3, "containsObject:", &unk_1E6926770) & 1) != 0)
    || (v4 = &unk_1E6926788, objc_msgSend(v3, "containsObject:", &unk_1E6926788)))
  {
    v5 = -[AXUIElement objectWithAXAttribute:parameter:](self->_uiElement, "objectWithAXAttribute:parameter:", 92515, v4);
    if (v5)
    {
      v6 = v5;
      v7 = CFGetTypeID(v5);
      if (v7 == AXUIElementGetTypeID())
        goto LABEL_13;
    }
  }
  -[AXUIElement updateCache:](self->_uiElement, "updateCache:", 2012);
  v8 = -[AXUIElement objectWithAXAttribute:](self->_uiElement, "objectWithAXAttribute:", 2012);
  if (v8 && (v6 = v8, v9 = CFGetTypeID(v8), v9 == AXUIElementGetTypeID()))
  {
LABEL_13:
    +[AXElement elementWithAXUIElement:](AXElement, "elementWithAXUIElement:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return (AXElement *)v10;
}

- (AXElement)accessibleAncestor
{
  id v2;
  id v3;
  CFTypeID v4;

  v2 = -[AXUIElement objectWithAXAttribute:](self->_uiElement, "objectWithAXAttribute:", 2096);
  if (v2)
  {
    v3 = v2;
    v4 = CFGetTypeID(v2);
    if (v4 == AXUIElementGetTypeID())
    {
      +[AXElement elementWithAXUIElement:](AXElement, "elementWithAXUIElement:", v3);
      v2 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v2 = 0;
    }
  }
  return (AXElement *)v2;
}

- (NSArray)accessibleDescendants
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[AXElement uiElement](self, "uiElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateCache:", 2095);

  -[AXElement uiElement](self, "uiElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uiElementsWithAttribute:", 2095);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXElement _axElementsForAXUIElements:](self, "_axElementsForAXUIElements:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v6;
}

- (BOOL)isKeyboardKey
{
  return -[AXElement hasAllTraits:](self, "hasAllTraits:", 32);
}

- (id)keyboardContainer
{
  id v2;
  uint64_t v3;

  -[AXElement parentGroup](self, "parentGroup");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    while (!objc_msgSend(v2, "isKeyboardContainer"))
    {
      objc_msgSend(v2, "parentGroup");
      v3 = objc_claimAutoreleasedReturnValue();

      v2 = (id)v3;
      if (!v3)
        goto LABEL_6;
    }
    v2 = v2;
  }
LABEL_6:

  return v2;
}

- (BOOL)isMathEquation
{
  return -[AXElement hasAllTraits:](self, "hasAllTraits:", 0x40000000000);
}

- (BOOL)hasWebContent
{
  return -[AXElement hasAllTraits:](self, "hasAllTraits:", 0x20000);
}

- (BOOL)hasTextEntry
{
  return -[AXElement hasAllTraits:](self, "hasAllTraits:", 0x200000);
}

- (BOOL)isMap
{
  void *v4;
  char v5;

  if (-[AXElement hasAnyTraits:](self, "hasAnyTraits:", 0x1000000000))
    return 1;
  -[AXElement touchContainer](self, "touchContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasAnyTraits:", 0x1000000000);

  return v5;
}

- (NSArray)variantKeys
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[AXElement uiElement](self, "uiElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateCache:", 12002);

  -[AXElement uiElement](self, "uiElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uiElementsWithAttribute:", 12002);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXElement _axElementsForAXUIElements:](self, "_axElementsForAXUIElements:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v6;
}

- (BOOL)hasVariantKeys
{
  void *v3;
  void *v4;

  -[AXElement uiElement](self, "uiElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateCache:", 12003);

  -[AXElement uiElement](self, "uiElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "BOOLWithAXAttribute:", 12003);

  return (char)v3;
}

- (id)_textOperationsOperator
{
  AXElement *v2;
  uint64_t v3;

  v2 = self;
  if (-[AXElement hasWebContent](v2, "hasWebContent"))
  {
    -[AXElement elementForAttribute:](v2, "elementForAttribute:", 2011);
    v3 = objc_claimAutoreleasedReturnValue();

    v2 = (AXElement *)v3;
  }
  return v2;
}

- (NSArray)textOperations
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[AXElement _textOperationsOperator](self, "_textOperationsOperator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uiElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateCache:", 2010);

  objc_msgSend(v2, "uiElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectWithAXAttribute:", 2010);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (NSArray)typingCandidates
{
  void *v3;
  void *v4;
  void *v5;

  -[AXElement uiElement](self, "uiElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uiElementsWithAttribute:", 3004);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXElement _axElementsForAXUIElements:](self, "_axElementsForAXUIElements:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (void)setAssistiveTechFocused:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  const __CFString *v7;
  id v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v5, CFSTR("focused"));

  if (setAssistiveTechFocused__onceToken != -1)
    dispatch_once(&setAssistiveTechFocused__onceToken, &__block_literal_global_51);
  v6 = v8;
  if (setAssistiveTechFocused__isSwitchControl)
  {
    v7 = CFSTR("UIAccessibilityNotificationSwitchControlIdentifier");
LABEL_7:
    objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("assistiveTech"));
    goto LABEL_8;
  }
  if (setAssistiveTechFocused__isVoiceOver)
  {
    v7 = CFSTR("UIAccessibilityNotificationVoiceOverIdentifier");
    v6 = v8;
    goto LABEL_7;
  }
LABEL_8:
  -[AXUIElement setAXAttribute:withObject:synchronous:](self->_uiElement, "setAXAttribute:withObject:synchronous:", 2018, v8, 0);

}

void __37__AXElement_setAssistiveTechFocused___block_invoke()
{
  void *v0;
  char v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.assistivetouchd")) & 1) != 0)
    v1 = 1;
  else
    v1 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.accessibility.ASTTestApp"));
  setAssistiveTechFocused__isSwitchControl = v1;
  setAssistiveTechFocused__isVoiceOver = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.VoiceOverTouch"));

}

- (BOOL)assistiveTechFocused
{
  return -[AXUIElement BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 2018);
}

- (NSArray)customActions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXElement remoteParent](self, "remoteParent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "customActions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
      objc_msgSend(v3, "addObjectsFromArray:", v6);

  }
  -[AXElement uiElement](self, "uiElement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "arrayWithAXAttribute:", 2036);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count"))
    objc_msgSend(v3, "addObjectsFromArray:", v8);

  return (NSArray *)v3;
}

- (NSArray)drags
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[AXElement uiElement](self, "uiElement", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayWithAXAttribute:", 2175);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (AXValidateDictionaryAsDragWireFormat(v10))
          objc_msgSend(v3, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return (NSArray *)v3;
}

- (NSArray)drops
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[AXElement uiElement](self, "uiElement", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayWithAXAttribute:", 2176);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (AXValidateDictionaryAsDropWireFormat(v10))
          objc_msgSend(v3, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return (NSArray *)v3;
}

- (NSString)roleDescription
{
  void *v2;
  void *v3;

  -[AXElement uiElement](self, "uiElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithAXAttribute:", 2077);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (_NSRange)rowRange
{
  void *v2;
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;

  -[AXElement uiElement](self, "uiElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "rangeWithAXAttribute:", 2027);
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (NSString)textualContext
{
  void *v2;
  void *v3;

  -[AXElement uiElement](self, "uiElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithAXAttribute:", 2193);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isComboBox
{
  void *v2;
  char v3;

  -[AXElement uiElement](self, "uiElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLWithAXAttribute:", 2030);

  return v3;
}

- (BOOL)required
{
  void *v2;
  char v3;

  -[AXElement uiElement](self, "uiElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLWithAXAttribute:", 2029);

  return v3;
}

- (_NSRange)selectedTextRange
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  _NSRange result;

  -[AXElement uiElement](self, "uiElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateCache:", 2005);

  -[AXElement uiElement](self, "uiElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "rangeWithAXAttribute:", 2005);
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.length = v9;
  result.location = v8;
  return result;
}

- (void)setSelectedTextRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  id v5;

  length = a3.length;
  location = a3.location;
  -[AXElement uiElement](self, "uiElement");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAXAttribute:withRange:", 2005, location, length);

}

- (id)_objectForRange:(_NSRange)a3 withParameterizedAttribute:(int64_t)a4
{
  AXValueRef v6;
  AXValueRef v7;
  void *v8;
  _NSRange v10;

  v10 = a3;
  v6 = AXValueCreate(kAXValueTypeCFRange, &v10);
  if (!v6)
    return 0;
  v7 = v6;
  -[AXUIElement objectWithAXAttribute:parameter:](self->_uiElement, "objectWithAXAttribute:parameter:", a4, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CFRelease(v7);
  return v8;
}

- (CGRect)boundsForTextRange:(_NSRange)a3
{
  CGRect *v4;
  CGSize v5;
  const __AXValue *v6;
  const __AXValue *v7;
  CFTypeID v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double x;
  double y;
  double width;
  double height;
  CGRect v20;
  CGRect result;

  v4 = (CGRect *)MEMORY[0x1E0C9D648];
  v5 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  v20.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  v20.size = v5;
  v6 = -[AXElement _objectForRange:withParameterizedAttribute:](self, "_objectForRange:withParameterizedAttribute:", a3.location, a3.length, 92506);
  if (v6)
  {
    v7 = v6;
    v8 = CFGetTypeID(v6);
    if (v8 == AXValueGetTypeID() && AXValueGetType(v7) == kAXValueTypeCGRect)
      AXValueGetValue(v7, kAXValueTypeCGRect, &v20);
  }
  if (!CGRectEqualToRect(v20, *v4) && !CGRectEqualToRect(v20, *MEMORY[0x1E0C9D628]))
  {
    +[AXElement systemWideElement](AXElement, "systemWideElement");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[AXElement windowContextId](self, "windowContextId");
    v11 = -[AXElement windowDisplayId](self, "windowDisplayId");
    objc_msgSend(v9, "convertRect:fromContextId:displayId:", v10, v11, *(_OWORD *)&v20.origin, *(_OWORD *)&v20.size);
    v20.origin.x = v12;
    v20.origin.y = v13;
    v20.size.width = v14;
    v20.size.height = v15;

  }
  y = v20.origin.y;
  x = v20.origin.x;
  height = v20.size.height;
  width = v20.size.width;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (id)nextElementsWithCount:(unint64_t)a3
{
  unsigned int v3;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  -[AXElement uiElement](self, "uiElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nextElementsWithCount:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXElement _axElementsForAXUIElements:](self, "_axElementsForAXUIElements:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)previousElementsWithCount:(unint64_t)a3
{
  unsigned int v3;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  -[AXElement uiElement](self, "uiElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "previousElementsWithCount:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXElement _axElementsForAXUIElements:](self, "_axElementsForAXUIElements:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)hasAllTraits:(unint64_t)a3
{
  return (a3 & ~-[AXElement traits](self, "traits")) == 0;
}

- (BOOL)hasAnyTraits:(unint64_t)a3
{
  return (-[AXElement traits](self, "traits") & a3) != 0;
}

- (BOOL)hasOnlyTraits:(unint64_t)a3
{
  return -[AXElement traits](self, "traits") == a3;
}

- (double)distanceToElement:(id)a3
{
  id v4;
  double v5;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  double v11;
  CGRect v13;
  CGRect v14;

  v4 = a3;
  if (v4)
  {
    v5 = 0.0;
    if (!-[AXElement isEqual:](self, "isEqual:", v4))
    {
      objc_msgSend(v4, "visibleFrame");
      x = v13.origin.x;
      y = v13.origin.y;
      width = v13.size.width;
      height = v13.size.height;
      MidX = CGRectGetMidX(v13);
      v14.origin.x = x;
      v14.origin.y = y;
      v14.size.width = width;
      v14.size.height = height;
      -[AXElement distanceToPoint:](self, "distanceToPoint:", MidX, CGRectGetMidY(v14));
      v5 = v11;
    }
  }
  else
  {
    v5 = 1.79769313e308;
  }

  return v5;
}

- (double)distanceToPoint:(CGPoint)a3
{
  double y;
  double x;
  CGFloat v5;
  CGFloat v6;
  CGFloat width;
  CGFloat height;
  double MidX;
  CGFloat MidY;
  CGRect v12;
  CGRect v13;

  y = a3.y;
  x = a3.x;
  -[AXElement visibleFrame](self, "visibleFrame");
  v5 = v12.origin.x;
  v6 = v12.origin.y;
  width = v12.size.width;
  height = v12.size.height;
  MidX = CGRectGetMidX(v12);
  v13.origin.x = v5;
  v13.origin.y = v6;
  v13.size.width = width;
  v13.size.height = height;
  MidY = CGRectGetMidY(v13);
  return sqrt((x - MidX) * (x - MidX) + (y - MidY) * (y - MidY));
}

- (BOOL)isAccessibilityOpaqueElementProvider
{
  return -[AXUIElement BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 2065);
}

- (BOOL)isNativeFocused
{
  return -[AXUIElement BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 2094);
}

- (BOOL)viewHierarchyHasNativeFocus
{
  return -[AXUIElement BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 2127);
}

- (BOOL)setNativeFocus
{
  return -[AXUIElement performAXAction:](self->_uiElement, "performAXAction:", 2044);
}

- (BOOL)eligibleForIconVision
{
  _BOOL8 v3;
  void *v4;
  unint64_t v5;

  if ((-[AXElement traits](self, "traits") & 0x8000020) != 0)
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    -[AXUIElement numberWithAXAttribute:](self->_uiElement, "numberWithAXAttribute:", 2701);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "unsignedIntegerValue");

    return (v5 >> 15) & 1;
  }
  return v3;
}

- (NSDictionary)semanticContext
{
  void *v2;
  id v3;

  -[AXUIElement objectWithAXAttribute:](self->_uiElement, "objectWithAXAttribute:", 13001);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return (NSDictionary *)v3;
}

- (int)pid
{
  void *v2;
  int v3;

  -[AXElement uiElement](self, "uiElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "pid");

  return v3;
}

- (AXElement)elementParent
{
  return (AXElement *)-[AXElement _elementForAttribute:shouldUpdateCache:shouldFetchAttributes:](self, "_elementForAttribute:shouldUpdateCache:shouldFetchAttributes:", 5002, 0, 0);
}

- (AXElement)remoteParent
{
  void *v3;
  void *v4;

  -[AXElement cachedRemoteParent](self, "cachedRemoteParent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[AXElement _elementForAttribute:shouldUpdateCache:shouldFetchAttributes:](self, "_elementForAttribute:shouldUpdateCache:shouldFetchAttributes:", 2092, 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXElement setCachedRemoteParent:](self, "setCachedRemoteParent:", v4);

  }
  return -[AXElement cachedRemoteParent](self, "cachedRemoteParent");
}

- (unint64_t)scanningBehaviorTraits
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[AXElement uiElement](self, "uiElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithAXAttribute:", 2147);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (int)objc_msgSend(v3, "intValue");

  return v4;
}

- (id)_remoteParentForContextID
{
  void *v3;
  void *v4;

  -[AXElement cachedRemoteParentForContextID](self, "cachedRemoteParentForContextID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[AXElement _elementForAttribute:shouldUpdateCache:shouldFetchAttributes:](self, "_elementForAttribute:shouldUpdateCache:shouldFetchAttributes:", 2310, 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXElement setCachedRemoteParentForContextID:](self, "setCachedRemoteParentForContextID:", v4);

  }
  return -[AXElement cachedRemoteParentForContextID](self, "cachedRemoteParentForContextID");
}

- (BOOL)canPerformZoom
{
  _BOOL4 v3;

  if (-[AXElement hasAnyTraits:](self, "hasAnyTraits:", 0x400000000000) || -[AXElement isMap](self, "isMap"))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    v3 = -[AXElement hasWebContent](self, "hasWebContent");
    if (v3)
    {
      if (-[AXElement hasTextEntry](self, "hasTextEntry") || -[AXElement isKeyboardKey](self, "isKeyboardKey"))
        LOBYTE(v3) = 0;
      else
        LOBYTE(v3) = !-[AXElement isMathEquation](self, "isMathEquation");
    }
  }
  return v3;
}

- (BOOL)canPerformTrackingDetail
{
  return -[AXElement isMap](self, "isMap") && -[AXElement hasAnyTraits:](self, "hasAnyTraits:", 0x80000000000000);
}

- (BOOL)_showContextMenuWithTargetPointValue:(id)a3
{
  id v4;
  char v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (-[AXUIElement performAXAction:withValue:](self->_uiElement, "performAXAction:withValue:", 2051, v4))
  {
    v5 = 1;
  }
  else
  {
    -[AXElement remoteParent](self, "remoteParent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      v5 = objc_msgSend(v6, "_showContextMenuWithTargetPointValue:", v4);
    else
      v5 = 0;

  }
  return v5;
}

- (BOOL)showContextMenu
{
  void *v3;
  void *v4;
  BOOL v5;

  if (-[AXElement hasAllTraits:](self, "hasAllTraits:", 0x20000))
  {
    v3 = (void *)MEMORY[0x1E0CB3B18];
    -[AXElement centerPoint](self, "centerPoint");
    objc_msgSend(v3, "valueWithPoint:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v5 = -[AXElement _showContextMenuWithTargetPointValue:](self, "_showContextMenuWithTargetPointValue:", v4);

  return v5;
}

- (BOOL)scrollToVisible
{
  void *v3;
  char v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;

  -[AXElement uiElement](self, "uiElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "performAXAction:", 2003);

  -[AXElement uiElement](self, "uiElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLWithAXAttribute:", 2093);

  if (v6)
  {
    -[AXElement remoteParent](self, "remoteParent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[AXElement uiElement](self, "uiElement");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "updateCache:", 2003);

      -[AXElement frame](self, "frame");
      v10 = v9;
      v12 = v11;
      v14 = v13;
      v16 = v15;
      objc_msgSend(v7, "uiElement");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:", v10, v12, v14, v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v17, "performAXAction:withValue:", 2039, v18);

    }
  }
  -[AXElement uiElement](self, "uiElement");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "updateCache:", 2057);

  return v4;
}

- (BOOL)canScrollInAtLeastOneDirection
{
  void *v3;
  char v4;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  char v10;

  -[AXElement uiElement](self, "uiElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLWithAXAttribute:", 2064);

  if ((v4 & 1) != 0)
    return 1;
  -[AXElement uiElement](self, "uiElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLWithAXAttribute:", 2093);

  if (!v7)
    return 0;
  -[AXElement remoteParent](self, "remoteParent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uiElement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLWithAXAttribute:", 2064);

  return v10;
}

- (BOOL)supportsAction:(int)a3
{
  uint64_t v3;
  BOOL result;
  void *v6;
  char v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  char v12;
  char v13;

  v3 = *(_QWORD *)&a3;
  result = 0;
  if (a3 > 2029)
  {
    if ((a3 - 2037) < 2)
    {
      return -[AXElement canPerformTrackingDetail](self, "canPerformTrackingDetail");
    }
    else if (a3 == 2030)
    {
      -[AXElement uiElement](self, "uiElement");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v10, "canPerformAXAction:", 2030);
LABEL_18:
      v12 = v13;
LABEL_19:

      return v12;
    }
    else if (a3 == 2036)
    {
      return -[AXElement canPerformSecondaryActivate](self, "canPerformSecondaryActivate");
    }
  }
  else
  {
    switch(a3)
    {
      case 2001:
      case 2002:
        return -[AXElement canPerformZoom](self, "canPerformZoom");
      case 2006:
      case 2007:
      case 2008:
      case 2009:
        -[AXElement uiElement](self, "uiElement");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "canPerformAXAction:", v3);

        if ((v7 & 1) != 0)
          return 1;
        -[AXElement uiElement](self, "uiElement");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "BOOLWithAXAttribute:", 2093);

        if (v9)
        {
          -[AXElement remoteParent](self, "remoteParent");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "uiElement");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "canPerformAXAction:", v3);

          goto LABEL_19;
        }
        result = 0;
        break;
      case 2010:
        return -[AXElement canPerformActivate](self, "canPerformActivate");
      case 2012:
        -[AXElement _textOperationsOperator](self, "_textOperationsOperator");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v10, "hasAnyTraits:", 0x2000000000);
        goto LABEL_18;
      case 2013:
        return -[AXElement canPerformEscape](self, "canPerformEscape");
      default:
        return result;
    }
  }
  return result;
}

- (BOOL)performAction:(int)a3
{
  uint64_t v3;
  void *v5;
  char v6;
  char v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  char v21;
  void *v23;

  v3 = *(_QWORD *)&a3;
  if ((a3 - 2006) > 0xE)
    goto LABEL_18;
  if (((1 << (a3 + 42)) & 0x600F) == 0)
  {
    if (a3 == 2010)
      return -[AXElement press](self, "press");
    if (a3 == 2013)
    {
      -[AXElement uiElement](self, "uiElement");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "performAXAction:", 2013);

      if ((v14 & 1) != 0)
        return 1;
      -[AXElement remoteParent](self, "remoteParent");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v16 = v15;
        objc_msgSend(v15, "uiElement");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "performAXAction:", 2013);

        if ((v18 & 1) != 0)
          return 1;
      }
      if (_AXSClarityBoardEnabled())
      {
        +[AXElement systemApplication](AXElement, "systemApplication");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[AXElement application](self, "application");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "isEqual:", v19);

        if ((v21 & 1) != 0)
        {
          v7 = 0;
        }
        else
        {
          objc_msgSend(v19, "firstElementInApplication");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = objc_msgSend(v23, "performAction:", 2013);

        }
        return v7;
      }
      return 0;
    }
LABEL_18:
    -[AXElement uiElement](self, "uiElement");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "performAXAction:", v3);
    goto LABEL_19;
  }
  -[AXElement uiElement](self, "uiElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "performAXAction:", v3);

  if ((v6 & 1) != 0)
    return 1;
  -[AXElement uiElement](self, "uiElement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLWithAXAttribute:", 2093);

  if (!v9)
    return 0;
  -[AXElement remoteParent](self, "remoteParent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uiElement");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "performAXAction:", v3);

LABEL_19:
  return v12;
}

- (BOOL)performAction:(int)a3 withValue:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char v12;
  void *v13;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  if ((_DWORD)v4 == 2012)
  {
    -[AXElement _textOperationsOperator](self, "_textOperationsOperator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uiElement");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = 2012;
    goto LABEL_7;
  }
  -[AXElement uiElement](self, "uiElement");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "performAXAction:withValue:", v4, v6);

  if ((_DWORD)v4 == 2021 && (v12 & 1) == 0)
  {
    -[AXElement remoteParent](self, "remoteParent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v13;
    if (!v13)
    {
      v12 = 0;
      goto LABEL_8;
    }
    objc_msgSend(v13, "uiElement");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = 2021;
LABEL_7:
    v12 = objc_msgSend(v8, "performAXAction:withValue:", v10, v6);

LABEL_8:
  }

  return v12;
}

- (__AXUIElement)scrollAncestorForScrollAction:(int)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;

  if ((a3 - 2006) > 2)
    v4 = 2107;
  else
    v4 = qword_1B54F05E0[a3 - 2006];
  -[AXElement uiElement](self, "uiElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "objectWithAXAttribute:", v4);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = (void *)objc_msgSend(v6, "axElement");
  if (!v6)
  {
    -[AXElement uiElement](self, "uiElement");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "BOOLWithAXAttribute:", 2093);

    if (v8)
    {
      -[AXElement remoteParent](self, "remoteParent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "uiElement");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v10, "objectWithAXAttribute:", v4);

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        return (__AXUIElement *)objc_msgSend(v6, "axElement");
    }
    else
    {
      return 0;
    }
  }
  return (__AXUIElement *)v6;
}

- (unsigned)windowDisplayId
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[AXUIElement numberWithAXAttribute:](self->_uiElement, "numberWithAXAttribute:", 2123);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntValue");

  if (!v4)
  {
    -[AXElement _remoteParentForContextID](self, "_remoteParentForContextID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "uiElement");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "numberWithAXAttribute:", 2123);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v8, "unsignedIntValue");

    }
    else
    {
      v4 = 0;
    }

  }
  return v4;
}

- (unsigned)windowContextId
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[AXUIElement numberWithAXAttribute:](self->_uiElement, "numberWithAXAttribute:", 2021);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntValue");

  if (!v4)
  {
    -[AXElement _remoteParentForContextID](self, "_remoteParentForContextID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "uiElement");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "numberWithAXAttribute:", 2021);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v8, "unsignedIntValue");

    }
    else
    {
      v4 = 0;
    }

  }
  return v4;
}

- (NSString)fbSceneIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[AXUIElement stringWithAXAttribute:](self->_uiElement, "stringWithAXAttribute:", 2721);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[AXElement _remoteParentForContextID](self, "_remoteParentForContextID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "uiElement");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithAXAttribute:", 2721);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v3 = 0;
    }

  }
  return (NSString *)v3;
}

- (NSString)windowSceneIdentifier
{
  void *v3;
  void *v4;

  -[AXUIElement stringWithAXAttribute:](self->_uiElement, "stringWithAXAttribute:", 3056);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[AXElement _remoteParentForContextID](self, "_remoteParentForContextID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "windowSceneIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v3;
}

- (NSArray)supportedGestures
{
  return (NSArray *)-[AXUIElement arrayWithAXAttribute:](self->_uiElement, "arrayWithAXAttribute:", 2063);
}

- (BOOL)canPerformActivate
{
  void *v3;
  void *v4;
  char v5;
  char v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[AXElement uiElement](self, "uiElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateCache:", 2019);

  -[AXElement uiElement](self, "uiElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLWithAXAttribute:", 2019);

  if ((v5 & 1) != 0)
    return 1;
  -[AXElement uiElement](self, "uiElement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLWithAXAttribute:", 2101);

  if (!v8)
    return 0;
  -[AXElement remoteParent](self, "remoteParent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "uiElement");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "updateCache:", 2019);

    objc_msgSend(v10, "uiElement");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v12, "BOOLWithAXAttribute:", 2019);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_performActivate
{
  void *v3;
  char v4;
  char v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;

  -[AXElement uiElement](self, "uiElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "performAXAction:", 2010);

  if ((v4 & 1) != 0)
    return 1;
  -[AXElement uiElement](self, "uiElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLWithAXAttribute:", 2101);

  if (!v7)
    return 0;
  -[AXElement remoteParent](self, "remoteParent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "uiElement");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v10, "performAXAction:", 2010);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)canPerformSecondaryActivate
{
  -[AXUIElement updateCache:](self->_uiElement, "updateCache:", 2079);
  return -[AXUIElement BOOLWithAXAttribute:](self->_uiElement, "BOOLWithAXAttribute:", 2079);
}

- (BOOL)press
{
  double v3;
  double v4;
  char v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  AXValueRef v12;
  void *v13;
  void *v14;
  void *v15;
  dispatch_time_t v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double valuePtr;
  double v23;
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[3];
  _QWORD v27[4];

  v27[3] = *MEMORY[0x1E0C80C00];
  if (-[AXElement canPerformActivate](self, "canPerformActivate")
    && -[AXElement _performActivate](self, "_performActivate"))
  {
    goto LABEL_9;
  }
  -[AXElement visiblePoint](self, "visiblePoint");
  valuePtr = v4;
  v23 = v3;
  if (v4 != -1.0 || v3 != -1.0)
    goto LABEL_11;
  if (-[AXUIElement performAXAction:](self->_uiElement, "performAXAction:", 2010))
  {
LABEL_9:
    v6 = 1;
    goto LABEL_18;
  }
  -[AXElement centerPoint](self, "centerPoint");
  valuePtr = v7;
  v23 = v8;
LABEL_11:
  if (_AXSMossdeepEnabled())
  {
    -[AXUIElement objectWithAXAttribute:](self->_uiElement, "objectWithAXAttribute:", 5063);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v24[0] = CFSTR("additionalInfo");
      -[AXUIElement objectWithAXAttribute:](self->_uiElement, "objectWithAXAttribute:", 5063);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v24[1] = CFSTR("delay");
      v25[0] = v10;
      v25[1] = &unk_1E6926B88;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[AXElement windowContextId](self, "windowContextId"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = AXValueCreate(kAXValueTypeCGPoint, &valuePtr);
    v26[0] = CFSTR("point");
    v26[1] = CFSTR("windowContextID");
    v27[0] = v12;
    v27[1] = v9;
    v26[2] = CFSTR("delay");
    v27[2] = &unk_1E6926B88;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      CFRelease(v12);
  }

  +[AXElement systemEventDispatchElement](AXElement, "systemEventDispatchElement");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v13, "performAction:withValue:", 5008, v11);

LABEL_18:
  -[AXElement elementForAttribute:](self, "elementForAttribute:", 2017);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bundleId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v15, "hasPrefix:", CFSTR("com.apple.")) & 1) == 0)
  {
    v16 = dispatch_time(0, 500000000);
    dispatch_after(v16, MEMORY[0x1E0C80D38], &__block_literal_global_66);
  }
  -[AXElement uiElement](self, "uiElement");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "numberWithAXAttribute:", 2068);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "doubleValue");
  v20 = v19;

  if (v20 <= 0.0)
    -[AXElement _updateLabel](self, "_updateLabel");
  else
    -[AXElement performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__updateLabel, 0, v20);

  return v6;
}

uint64_t __18__AXElement_press__block_invoke()
{
  return AXPushNotificationToSystemForBroadcast();
}

- (BOOL)longPress
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  AXValueRef v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  uint64_t v13;
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  -[AXElement visiblePoint](self, "visiblePoint");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[AXElement windowContextId](self, "windowContextId", v3, v4));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = AXValueCreate(kAXValueTypeCGPoint, &v13);
  v14[0] = v6;
  LODWORD(v7) = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v8;
  v14[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    CFRelease(v6);
  +[AXElement systemWideElement](AXElement, "systemWideElement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "performAction:withValue:", 5004, v9);

  return v11;
}

- (BOOL)_zoomInOrOut:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  if (a3)
    v4 = 2001;
  else
    v4 = 2002;
  -[AXElement centerPoint](self, "centerPoint");
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPoint:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXElement performAction:withValue:](self, "performAction:withValue:", v4, v5);
  -[AXElement remoteParent](self, "remoteParent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "performAction:withValue:", v4, v5);

  return 1;
}

- (BOOL)zoomIn
{
  return -[AXElement _zoomInOrOut:](self, "_zoomInOrOut:", 1);
}

- (BOOL)zoomOut
{
  return -[AXElement _zoomInOrOut:](self, "_zoomInOrOut:", 0);
}

- (id)_uiElementForTextInsertionAndDeletion
{
  void *v3;
  void *v4;

  -[AXUIElement updateCache:](self->_uiElement, "updateCache:", 2183);
  -[AXUIElement objectWithAXAttribute:](self->_uiElement, "objectWithAXAttribute:", 2183);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[AXUIElement uiElementWithAXElement:cache:](AXUIElement, "uiElementWithAXElement:cache:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)insertText:(id)a3
{
  -[AXElement insertText:asUndoableAction:](self, "insertText:asUndoableAction:", a3, 0);
}

- (void)insertText:(id)a3 asUndoableAction:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  AXElement *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v4 = a4;
  v14[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    if (v4)
    {
      -[AXElement _textOperationsOperator](self, "_textOperationsOperator");
      v7 = (AXElement *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7 == self)
      {
        -[AXElement _uiElementForTextInsertionAndDeletion](self, "_uiElementForTextInsertionAndDeletion");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v13[0] = CFSTR("text");
        v13[1] = CFSTR("createsUndoableAction");
        v14[0] = v6;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v14[1] = v11;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "performAXAction:withValue:", 2056, v12);

      }
      else
      {
        -[AXElement performAction:](v7, "performAction:", 2060);
        -[AXElement _uiElementForTextInsertionAndDeletion](self, "_uiElementForTextInsertionAndDeletion");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "performAXAction:withValue:", 2056, v6);

        objc_msgSend(v8, "performAction:", 2061);
      }
    }
    else
    {
      -[AXElement _uiElementForTextInsertionAndDeletion](self, "_uiElementForTextInsertionAndDeletion");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "performAXAction:withValue:", 2056, v6);
    }

  }
}

- (void)insertTextWithAlternatives:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AXElement _uiElementForTextInsertionAndDeletion](self, "_uiElementForTextInsertionAndDeletion");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performAXAction:withValue:", 2055, v4);

}

- (void)deleteText
{
  id v2;

  -[AXElement _uiElementForTextInsertionAndDeletion](self, "_uiElementForTextInsertionAndDeletion");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performAXAction:", 2052);

}

- (id)alternativesForTextAtPosition:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[AXElement _uiElementForTextInsertionAndDeletion](self, "_uiElementForTextInsertionAndDeletion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectWithAXAttribute:parameter:", 95237, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (AXElement)elementForTextInsertionAndDeletion
{
  void *v2;
  void *v3;

  -[AXElement _uiElementForTextInsertionAndDeletion](self, "_uiElementForTextInsertionAndDeletion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[AXElement elementWithUIElement:](AXElement, "elementWithUIElement:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (AXElement *)v3;
}

- (BOOL)respondsToUserInteraction
{
  void *v2;
  char v3;

  -[AXElement uiElement](self, "uiElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLWithAXAttribute:", 12000);

  return v3;
}

- (int64_t)scannerActivateBehavior
{
  void *v2;
  void *v3;
  int64_t v4;

  -[AXElement uiElement](self, "uiElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithAXAttribute:", 12004);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (int)objc_msgSend(v3, "intValue");

  return v4;
}

- (BOOL)canPerformEscape
{
  void *v3;
  char v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;

  -[AXElement uiElement](self, "uiElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLWithAXAttribute:", 2061);

  if ((v4 & 1) != 0)
    return 1;
  -[AXElement remoteParent](self, "remoteParent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "uiElement");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v8, "BOOLWithAXAttribute:", 2061);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (AXElement)autoscrollTarget
{
  void *v2;
  void *v3;

  -[AXElement uiElement](self, "uiElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectWithAXAttribute:", 2054);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (AXElement *)v3;
}

- (void)setAutoscrollTarget:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  -[AXElement uiElement](self, "uiElement");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = v4[2];

  objc_msgSend(v6, "setAXAttribute:withUIElement:", 2054, v5);
}

- (BOOL)autoscrollInDirection:(unint64_t)a3
{
  void *v4;
  void *v5;
  char v6;

  -[AXElement uiElement](self, "uiElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "performAXAction:withValue:", 2026, v5);

  return v6;
}

- (void)pauseAutoscrolling
{
  id v2;

  -[AXElement uiElement](self, "uiElement");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performAXAction:", 2027);

}

- (BOOL)isAutoscrolling
{
  void *v3;
  void *v4;

  -[AXElement uiElement](self, "uiElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateCache:", 2055);

  -[AXElement uiElement](self, "uiElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "BOOLWithAXAttribute:", 2055);

  return (char)v3;
}

- (void)increaseAutoscrollSpeed
{
  id v2;

  -[AXElement uiElement](self, "uiElement");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performAXAction:", 2028);

}

- (void)decreaseAutoscrollSpeed
{
  id v2;

  -[AXElement uiElement](self, "uiElement");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performAXAction:", 2029);

}

- (void)setAutoscrollSpeed:(double)a3
{
  void *v4;
  id v5;

  -[AXElement uiElement](self, "uiElement");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performAXAction:withValue:", 2032, v4);

}

- (id)scrollViewsForAutoScroll
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[AXElement uiElement](self, "uiElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateCache:", 3070);

  -[AXElement uiElement](self, "uiElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uiElementsWithAttribute:", 3070);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXElement _axElementsForAXUIElements:](self, "_axElementsForAXUIElements:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)scrollToTop
{
  id v2;

  -[AXElement uiElement](self, "uiElement");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performAXAction:", 2030);

}

- (void)scrollToBottom
{
  id v2;

  -[AXElement uiElement](self, "uiElement");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performAXAction:", 2031);

}

- (BOOL)pressTVSelectButton
{
  return -[AXElement performAction:](self, "performAction:", 4000);
}

- (BOOL)pressTVBackButton
{
  return -[AXElement performAction:](self, "performAction:", 4001);
}

- (BOOL)pressTVMenuButton
{
  return -[AXElement performAction:](self, "performAction:", 4002);
}

- (BOOL)pressTVPlayPauseButton
{
  return -[AXElement performAction:](self, "performAction:", 4003);
}

- (BOOL)pressTVUpButton
{
  return -[AXElement performAction:](self, "performAction:", 4004);
}

- (BOOL)pressTVDownButton
{
  return -[AXElement performAction:](self, "performAction:", 4005);
}

- (BOOL)pressTVLeftButton
{
  return -[AXElement performAction:](self, "performAction:", 4007);
}

- (BOOL)pressTVRightButton
{
  return -[AXElement performAction:](self, "performAction:", 4006);
}

- (BOOL)pressTVPlayButton
{
  return -[AXElement performAction:](self, "performAction:", 4008);
}

- (BOOL)pressTVPauseButton
{
  return -[AXElement performAction:](self, "performAction:", 4009);
}

- (BOOL)pressTVStopButton
{
  return -[AXElement performAction:](self, "performAction:", 4010);
}

- (BOOL)pressTVRewindButton
{
  return -[AXElement performAction:](self, "performAction:", 4011);
}

- (BOOL)pressTVFastForwardButton
{
  return -[AXElement performAction:](self, "performAction:", 4012);
}

- (BOOL)pressTVNextTrackButton
{
  return -[AXElement performAction:](self, "performAction:", 4013);
}

- (BOOL)pressTVPreviousTrackButton
{
  return -[AXElement performAction:](self, "performAction:", 4014);
}

- (BOOL)pressTVSkipForwardsButton
{
  return -[AXElement performAction:](self, "performAction:", 4015);
}

- (BOOL)pressTVSkipBackwardsButton
{
  return -[AXElement performAction:](self, "performAction:", 4016);
}

- (BOOL)pressTVDataOnScreenButton
{
  return -[AXElement performAction:](self, "performAction:", 4017);
}

- (BOOL)pressTVMicButton
{
  return -[AXElement performAction:](self, "performAction:", 4018);
}

- (NSArray)customContent
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  -[AXUIElement objectWithAXAttribute:](self->_uiElement, "objectWithAXAttribute:", 2210);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = 0;
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v2, &v12);
    v4 = v12;
    v5 = (void *)MEMORY[0x1E0C99E60];
    v6 = objc_opt_class();
    v14 = 0;
    v15 = &v14;
    v16 = 0x2050000000;
    v7 = (void *)getAXCustomContentClass_softClass;
    v17 = getAXCustomContentClass_softClass;
    if (!getAXCustomContentClass_softClass)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __getAXCustomContentClass_block_invoke;
      v13[3] = &unk_1E69194D0;
      v13[4] = &v14;
      __getAXCustomContentClass_block_invoke((uint64_t)v13);
      v7 = (void *)v15[3];
    }
    v8 = objc_retainAutorelease(v7);
    _Block_object_dispose(&v14, 8);
    objc_msgSend(v5, "setWithObjects:", v6, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v9, *MEMORY[0x1E0CB2CD0]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return (NSArray *)v10;
}

- (id)highestAncestorGroup
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  -[AXElement parentGroup](self, "parentGroup");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    v4 = v2;
    do
    {
      v5 = v3;

      objc_msgSend(v5, "parentGroup");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      v4 = v5;
    }
    while (v3);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)isGroup
{
  return 0;
}

- (NSArray)children
{
  void *v3;
  void *v4;

  -[AXUIElement uiElementsWithAttribute:](self->_uiElement, "uiElementsWithAttribute:", 5001);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXElement _axElementsForAXUIElements:](self, "_axElementsForAXUIElements:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)parent
{
  return (NSArray *)-[AXElement elementForAttribute:](self, "elementForAttribute:", 5002);
}

- (id)_axElementsForAXUIElements:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "elementsWithUIElements:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_updateLabel
{
  id v2;

  -[AXElement uiElement](self, "uiElement");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateCache:", 2001);

}

- (AXUIElement)uiElement
{
  return self->_uiElement;
}

- (void)setUiElement:(id)a3
{
  objc_storeStrong((id *)&self->_uiElement, a3);
}

- (AXElementGroup)parentGroup
{
  return self->_parentGroup;
}

- (void)setParentGroup:(id)a3
{
  self->_parentGroup = (AXElementGroup *)a3;
}

- (NSString)localizedStringKey
{
  return self->_localizedStringKey;
}

- (NSString)localizationBundleID
{
  return self->_localizationBundleID;
}

- (NSString)localizationBundlePath
{
  return self->_localizationBundlePath;
}

- (NSString)localizedStringTableName
{
  return self->_localizedStringTableName;
}

- (BOOL)hoverTypingShouldAdjustDockedMode
{
  return self->_hoverTypingShouldAdjustDockedMode;
}

- (BOOL)representsScannerGroup
{
  return self->_representsScannerGroup;
}

- (AXElement)cachedRemoteParent
{
  return self->_cachedRemoteParent;
}

- (void)setCachedRemoteParent:(id)a3
{
  objc_storeStrong((id *)&self->_cachedRemoteParent, a3);
}

- (AXElement)cachedRemoteParentForContextID
{
  return self->_cachedRemoteParentForContextID;
}

- (void)setCachedRemoteParentForContextID:(id)a3
{
  objc_storeStrong((id *)&self->_cachedRemoteParentForContextID, a3);
}

- (CGPath)cachedPath
{
  return self->_cachedPath;
}

- (void)setCachedPath:(CGPath *)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (CGRect)cachedFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_cachedFrame.origin.x;
  y = self->_cachedFrame.origin.y;
  width = self->_cachedFrame.size.width;
  height = self->_cachedFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setCachedFrame:(CGRect)a3
{
  self->_cachedFrame = a3;
}

- (CGRect)cachedVisibleFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_cachedVisibleFrame.origin.x;
  y = self->_cachedVisibleFrame.origin.y;
  width = self->_cachedVisibleFrame.size.width;
  height = self->_cachedVisibleFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setCachedVisibleFrame:(CGRect)a3
{
  self->_cachedVisibleFrame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedRemoteParentForContextID, 0);
  objc_storeStrong((id *)&self->_cachedRemoteParent, 0);
  objc_storeStrong((id *)&self->_localizedStringTableName, 0);
  objc_storeStrong((id *)&self->_localizationBundlePath, 0);
  objc_storeStrong((id *)&self->_localizationBundleID, 0);
  objc_storeStrong((id *)&self->_localizedStringKey, 0);
  objc_storeStrong((id *)&self->_uiElement, 0);
}

- (id)makeLookingGlassRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  AXUIElementSetMessagingTimeout(-[AXElement elementRef](self, "elementRef"), 20.0);
  -[AXElement uiElement](self, "uiElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectWithAXAttribute:parameter:", 96001, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  AXUIElementSetMessagingTimeout(-[AXElement elementRef](self, "elementRef"), 0.0);
  return v6;
}

- (id)_makeTinkerKitRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  AXUIElementSetMessagingTimeout(-[AXElement elementRef](self, "elementRef"), 20.0);
  -[AXElement uiElement](self, "uiElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectWithAXAttribute:parameter:", 96002, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  AXUIElementSetMessagingTimeout(-[AXElement elementRef](self, "elementRef"), 0.0);
  return v6;
}

+ (void)registerNotifications:(os_log_t)log withIdentifier:withHandler:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B54A6000, log, OS_LOG_TYPE_ERROR, "Failed to get the observer run loop source", v1, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)registerNotifications:(int)a1 withIdentifier:(NSObject *)a2 withHandler:.cold.2(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1B54A6000, a2, OS_LOG_TYPE_ERROR, "Error adding notification: %d", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_1();
}

+ (void)registerNotifications:(int)a1 withIdentifier:(NSObject *)a2 withHandler:.cold.3(int a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_1B54A6000, a2, OS_LOG_TYPE_ERROR, "Failed to create an accessibility event observer: %ld", (uint8_t *)&v2, 0xCu);
}

+ (void)registerNotifications:(os_log_t)log withIdentifier:withHandler:.cold.4(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1B54A6000, log, OS_LOG_TYPE_FAULT, "Must register for accessibility notifications on the main thread.", v1, 2u);
  OUTLINED_FUNCTION_1();
}

@end
