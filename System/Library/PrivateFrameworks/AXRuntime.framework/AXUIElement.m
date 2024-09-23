@implementation AXUIElement

- (id)copyWithZone:(_NSZone *)a3
{
  __CFData *Data;
  const __CFData *v5;
  NSMutableDictionary *v6;
  void *v7;

  Data = _AXUIElementCreateData((const UInt8 *)self->_axElement);
  v5 = _AXUIElementCreateWithData(Data);
  v6 = -[AXUIElement copyCachedAttributes](self, "copyCachedAttributes");
  +[AXUIElement uiElementWithAXElement:cache:](AXUIElement, "uiElementWithAXElement:cache:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (Data)
    CFRelease(Data);
  if (v5)
    CFRelease(v5);
  return v7;
}

+ (__AXUIElement)systemWideAXUIElement
{
  return (__AXUIElement *)_SCRSystemWideAXUIElementRef;
}

+ (id)uiSystemWideApplication
{
  return (id)_SCRSystemWideUIElement;
}

+ (void)applyElementAttributeCacheScheme:(unint64_t)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
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
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  _QWORD block[4];
  id v62;

  switch(a3)
  {
    case 1uLL:
      v3 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99D20]), "initWithObjects:", &unk_1E6925EE8, &unk_1E6925F00, &unk_1E6925F18, &unk_1E6925F30, &unk_1E6925F48, &unk_1E6925F60, &unk_1E6925F78, &unk_1E6925F90, &unk_1E6925FA8, &unk_1E6925FC0, &unk_1E6925FD8, &unk_1E6925FF0, &unk_1E6926008, &unk_1E6926020, &unk_1E6926038, &unk_1E6926050, &unk_1E6926068,
                     &unk_1E6926080,
                     &unk_1E6926098,
                     &unk_1E69260B0,
                     &unk_1E69260C8,
                     &unk_1E69260E0,
                     &unk_1E69260F8,
                     &unk_1E6926110,
                     &unk_1E6926128,
                     &unk_1E6926140,
                     &unk_1E6926158,
                     &unk_1E6926170,
                     &unk_1E6926188,
                     &unk_1E69261A0,
                     &unk_1E69261B8,
                     &unk_1E69261D0,
                     &unk_1E69261E8,
                     &unk_1E6926200,
                     &unk_1E6926218,
                     &unk_1E6926230,
                     &unk_1E6926248,
                     &unk_1E6926260,
                     &unk_1E6926278,
                     &unk_1E6926290,
                     &unk_1E69262A8,
                     &unk_1E69262C0,
                     &unk_1E69262D8,
                     &unk_1E69262F0,
                     &unk_1E6926308,
                     &unk_1E6926320,
                     &unk_1E6926290,
                     &unk_1E6926278,
                     &unk_1E6926338,
                     &unk_1E6926350,
                     &unk_1E6926368,
                     &unk_1E6926380,
                     &unk_1E6926398,
                     0);
      goto LABEL_13;
    case 2uLL:
      v4 = objc_allocWithZone(MEMORY[0x1E0C99D20]);
      v20 = &unk_1E6926410;
      v22 = 0;
      goto LABEL_7;
    case 3uLL:
      v4 = objc_allocWithZone(MEMORY[0x1E0C99D20]);
      v24 = &unk_1E6926470;
      v25 = 0;
      v22 = &unk_1E6926440;
      v23 = &unk_1E6926458;
      v20 = &unk_1E6926428;
LABEL_7:
      v16 = &unk_1E69263F8;
      v18 = &unk_1E6926320;
      v13 = &unk_1E69263E0;
      v14 = &unk_1E6926050;
      v11 = &unk_1E6925FF0;
      v12 = &unk_1E69263C8;
      v9 = &unk_1E6925FA8;
      v10 = &unk_1E6926098;
      v7 = &unk_1E6925F90;
      goto LABEL_12;
    case 4uLL:
      v3 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99D20]), "initWithObjects:", &unk_1E6925F90, &unk_1E6926488, &unk_1E69264A0, &unk_1E69264B8, &unk_1E69264D0, &unk_1E6925F18, &unk_1E6925F00, &unk_1E69264E8, &unk_1E6926500, &unk_1E6926518, &unk_1E6926530, &unk_1E6926548, 0, v15, v17, v19, v21,
                     v23,
                     v24,
                     v25,
                     v26,
                     v27,
                     v28,
                     v29,
                     v30,
                     v31,
                     v32,
                     v33,
                     v34,
                     v35,
                     v36,
                     v37,
                     v38,
                     v39,
                     v40,
                     v41,
                     v42,
                     v43,
                     v44,
                     v45,
                     v46,
                     v47,
                     v48,
                     v49,
                     v50,
                     v51,
                     v52,
                     v53,
                     v54,
                     v55,
                     v56,
                     v57,
                     v58,
                     v59);
      goto LABEL_13;
    case 5uLL:
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", &unk_1E6925F90, &unk_1E6925EE8, &unk_1E6925F30, &unk_1E6926560, &unk_1E6926578, &unk_1E6926590, &unk_1E6925F18, &unk_1E69265A8, 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    case 6uLL:
      v4 = objc_allocWithZone(MEMORY[0x1E0C99D20]);
      v30 = &unk_1E6926680;
      v31 = 0;
      v28 = &unk_1E6926650;
      v29 = &unk_1E6926668;
      v26 = &unk_1E6926638;
      v27 = &unk_1E6925FC0;
      v24 = &unk_1E6926608;
      v25 = &unk_1E6926620;
      v22 = &unk_1E69265D8;
      v23 = &unk_1E69265F0;
      v18 = &unk_1E6926320;
      v20 = &unk_1E6926230;
      v14 = &unk_1E6926038;
      v16 = &unk_1E6926050;
      v12 = &unk_1E6926098;
      v13 = &unk_1E6925FF0;
      v11 = &unk_1E6925FA8;
      v5 = &unk_1E69265C0;
      v6 = &unk_1E6925F90;
      goto LABEL_11;
    case 7uLL:
    case 8uLL:
      v3 = (void *)objc_opt_new();
      goto LABEL_13;
    default:
      v4 = objc_allocWithZone(MEMORY[0x1E0C99D20]);
      v27 = &unk_1E69262D8;
      v28 = 0;
      v25 = &unk_1E6926050;
      v26 = &unk_1E6926320;
      v23 = &unk_1E6925FF0;
      v24 = &unk_1E6926038;
      v20 = &unk_1E6926098;
      v22 = &unk_1E6926218;
      v16 = &unk_1E6926248;
      v18 = &unk_1E6926260;
      v13 = &unk_1E6925FD8;
      v14 = &unk_1E6926290;
      v11 = &unk_1E6925FA8;
      v12 = &unk_1E6925FC0;
      v5 = &unk_1E6925F90;
      v6 = &unk_1E6925F78;
LABEL_11:
      v9 = v6;
      v10 = v5;
      v7 = &unk_1E6925F60;
LABEL_12:
      v3 = (void *)objc_msgSend(v4, "initWithObjects:", &unk_1E6925EE8, &unk_1E69263B0, &unk_1E6925F00, &unk_1E6925F18, &unk_1E6925F30, &unk_1E6925F48, v7, v9, v10, v11, v12, v13, v14, v16, v18, v20, v22,
                     v23,
                     v24,
                     v25,
                     v26,
                     v27,
                     v28,
                     v29,
                     v30,
                     v31,
                     v32,
                     v33,
                     v34,
                     v35,
                     v36,
                     v37,
                     v38,
                     v39,
                     v40,
                     v41,
                     v42,
                     v43,
                     v44,
                     v45,
                     v46,
                     v47,
                     v48,
                     v49,
                     v50,
                     v51,
                     v52,
                     v53,
                     v54,
                     v55,
                     v56,
                     v57,
                     v58,
                     v59);
LABEL_13:
      v8 = _CacheAttributeNamesAccessQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __48__AXUIElement_applyElementAttributeCacheScheme___block_invoke;
      block[3] = &unk_1E6919A38;
      v62 = v3;
      v60 = v3;
      dispatch_sync(v8, block);

      return;
  }
}

void __48__AXUIElement_applyElementAttributeCacheScheme___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)&CachedAttributeNames, *(id *)(a1 + 32));
}

+ (void)applyElementCustomAttributeCacheScheme:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  v4 = _CacheAttributeNamesAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__AXUIElement_applyElementCustomAttributeCacheScheme___block_invoke;
  block[3] = &unk_1E6919A38;
  v7 = v3;
  v5 = v3;
  dispatch_sync(v4, block);

}

void __54__AXUIElement_applyElementCustomAttributeCacheScheme___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)&CachedAttributeNames, *(id *)(a1 + 32));
}

+ (void)initialize
{
  uint64_t v4;
  void *v5;
  dispatch_queue_t v6;
  void *v7;
  _QWORD block[5];

  if ((id)objc_opt_class() == a1 && _SCRSystemWideAXUIElementRef == 0)
  {
    _SCRSystemWideAXUIElementRef = (uint64_t)AXUIElementCreateSystemWide();
    +[AXUIElement uiElementWithAXElement:cache:](AXUIElement, "uiElementWithAXElement:cache:", _SCRSystemWideAXUIElementRef, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)_SCRSystemWideUIElement;
    _SCRSystemWideUIElement = v4;

    v6 = dispatch_queue_create("VOElementSyncNotification", 0);
    v7 = (void *)_ElementChangedQueue;
    _ElementChangedQueue = (uint64_t)v6;

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__AXUIElement_initialize__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initialize_onceToken_0 != -1)
    dispatch_once(&initialize_onceToken_0, block);
}

uint64_t __25__AXUIElement_initialize__block_invoke(uint64_t a1)
{
  dispatch_queue_t v2;
  void *v3;

  v2 = dispatch_queue_create("AXUIElementCacheNameAccessQueue", 0);
  v3 = (void *)_CacheAttributeNamesAccessQueue;
  _CacheAttributeNamesAccessQueue = (uint64_t)v2;

  return objc_msgSend(*(id *)(a1 + 32), "applyElementAttributeCacheScheme:", 0);
}

+ (id)uiElementWithAXElement:(__AXUIElement *)a3
{
  pid_t v5;
  id v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const void *v12;
  void *v13;
  pid_t pid;

  pid = -1;
  AXUIElementGetPid(a3, &pid);
  v5 = pid;
  if (pid <= -2 && v5 + getpid() && pid != kAXUIServerFakePid)
  {
    _AXUIElementIDForElement((uint64_t)a3);
    if (v8 == 9999)
      v9 = -pid;
    else
      v9 = pid;
    v10 = _AXUIElementIDForElement((uint64_t)a3);
    v12 = (const void *)_AXUIElementCreateWithPIDAndID(v9, v10, v11);
    +[AXUIMLElement cachedElementForParent:](AXUIMLElement, "cachedElementForParent:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      if (v12)
        CFRelease(v12);
      v6 = v13;
    }
    else
    {
      v6 = (id)objc_msgSend(objc_allocWithZone((Class)AXUIMLElement), "initWithParentElement:", v12);
      if (v12)
        CFRelease(v12);
    }

  }
  else
  {
    v6 = (id)objc_msgSend(objc_allocWithZone((Class)a1), "initWithAXElement:", a3);
  }
  return v6;
}

+ (id)uiElementWithAXElement:(__AXUIElement *)a3 cache:(id)a4
{
  id v6;
  pid_t v7;
  id v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const void *v14;
  void *v15;
  pid_t pid;

  v6 = a4;
  pid = 0;
  AXUIElementGetPid(a3, &pid);
  v7 = pid;
  if (pid <= -2 && v7 + getpid() && pid != kAXUIServerFakePid)
  {
    _AXUIElementIDForElement((uint64_t)a3);
    if (v10 == 9999)
      v11 = -pid;
    else
      v11 = pid;
    v12 = _AXUIElementIDForElement((uint64_t)a3);
    v14 = (const void *)_AXUIElementCreateWithPIDAndID(v11, v12, v13);
    +[AXUIMLElement cachedElementForParent:](AXUIMLElement, "cachedElementForParent:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      if (v14)
        CFRelease(v14);
      v8 = v15;
    }
    else
    {
      v8 = (id)objc_msgSend(objc_allocWithZone((Class)AXUIMLElement), "initWithParentElement:", v14);
      if (v14)
        CFRelease(v14);
    }

  }
  else
  {
    v8 = (id)objc_msgSend(objc_allocWithZone((Class)a1), "initWithAXElement:cache:", a3, v6);
  }

  return v8;
}

+ (id)proxiedMLElementsForApp:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (AXProcessEverWantsMLElements())
  {
    objc_msgSend(v3, "stringWithAXAttribute:", 3003);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (AXProcessWantsMLElementsForBundle((uint64_t)v4))
    {
      AXMediaLogElementVision();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v8 = 138412290;
        v9 = v4;
        _os_log_impl(&dword_1B54A6000, v5, OS_LOG_TYPE_INFO, "App wants ML Elements: %@", (uint8_t *)&v8, 0xCu);
      }

      objc_msgSend(v3, "uiElementsWithAttribute:", 3051);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)scrollAncestorAtCoordinate:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  void *v6;
  CFTypeRef cf;
  _QWORD v9[3];
  _QWORD v10[4];

  y = a3.y;
  x = a3.x;
  v10[3] = *MEMORY[0x1E0C80C00];
  cf = 0;
  v9[0] = CFSTR("application");
  v10[0] = AXUIElementSharedSystemWide();
  v9[1] = CFSTR("point");
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPoint:", x, y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = CFSTR("hitTestType");
  v10[1] = v5;
  v10[2] = &unk_1E6926698;
  AXUIElementCopyElementWithParameters((uint64_t *)&cf, (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 3));

  if (cf)
  {
    +[AXUIElement uiElementWithAXElement:](AXUIElement, "uiElementWithAXElement:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(cf);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (unsigned)_activeKeyboardContextId
{
  void *v2;
  void *v3;
  void *v4;
  unsigned int v5;

  -[AXUIElement uiElementsWithAttribute:](self, "uiElementsWithAttribute:", 2076);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "numberWithAXAttribute:", 2021);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "unsignedIntValue");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)uiElementAtCoordinate:(CGPoint)a3 forApplication:(__AXUIElement *)a4 contextId:(unsigned int)a5 displayId:(unsigned int)a6
{
  uint64_t v6;
  double y;
  double x;
  void *v12;
  void *v13;
  int v14;
  int v15;
  void *v16;
  int v17;
  float v18;
  float v19;
  int v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *i;
  void *v25;
  id v26;
  uint64_t v27;
  const void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  CFTypeRef cf;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  cf = 0;
  if (a4)
  {
    v6 = *(_QWORD *)&a6;
    y = a3.y;
    x = a3.x;
    +[AXUIElement uiElementWithAXElement:](AXUIElement, "uiElementWithAXElement:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "proxiedMLElementsForApp:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v13, "count")
      || (v14 = objc_msgSend(v12, "_activeKeyboardContextId")) != 0
      && (v15 = v14,
          +[AXElement systemWideElement](AXElement, "systemWideElement"),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          v17 = objc_msgSend(v16, "contextIdForPoint:", x, y),
          v16,
          v17 == v15))
    {
      v18 = x;
      v19 = y;
      v20 = _AXUIElementCopyElementAtPositionWithParams(a4, (uint64_t *)&cf, 0, 0, a5, v6, 0, v18, v19);
      v21 = 0;
      if (!v20 && cf)
      {
        +[AXUIElement uiElementWithAXElement:](AXUIElement, "uiElementWithAXElement:");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        CFRelease(cf);
      }
    }
    else
    {
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v22 = v13;
      v21 = (void *)objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      if (v21)
      {
        v23 = *(_QWORD *)v31;
        while (2)
        {
          for (i = 0; i != v21; i = (char *)i + 1)
          {
            if (*(_QWORD *)v31 != v23)
              objc_enumerationMutation(v22);
            v25 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
            if (objc_msgSend(v25, "isMLElement", (_QWORD)v30))
            {
              v26 = v25;
              v27 = objc_msgSend(v26, "copyElementAtPosition:", x, y);
              if (v27)
              {
                v28 = (const void *)v27;
                +[AXUIElement uiElementWithAXElement:](AXUIElement, "uiElementWithAXElement:", v27);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                CFRelease(v28);

                goto LABEL_21;
              }

            }
          }
          v21 = (void *)objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
          if (v21)
            continue;
          break;
        }
      }
LABEL_21:

    }
  }
  else
  {
    v21 = 0;
  }
  return v21;
}

+ (id)uiElementAtCoordinate:(CGPoint)a3 forApplication:(__AXUIElement *)a4 contextId:(unsigned int)a5
{
  return (id)objc_msgSend(a1, "uiElementAtCoordinate:forApplication:contextId:displayId:", a4, *(_QWORD *)&a5, 0, a3.x, a3.y);
}

+ (id)uiElementAtCoordinate:(CGPoint)a3 displayId:(unsigned int)a4
{
  double y;
  double x;
  float v7;
  float v8;
  void *v9;
  BOOL v10;
  int v12;
  CFTypeRef cf;

  y = a3.y;
  x = a3.x;
  cf = 0;
  v12 = 0;
  v7 = a3.x;
  v8 = a3.y;
  if (AXUIElementCopyApplicationAndContextAtPositionWithDisplayID((const __AXUIElement *)_SCRSystemWideAXUIElementRef, (uint64_t *)&cf, &v12, *(uint64_t *)&a4, v7, v8))cf = (CFTypeRef)_SCRSystemWideAXUIElementRef;
  objc_msgSend(a1, "uiElementAtCoordinate:forApplication:contextId:displayId:", x, y);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (cf)
    v10 = cf == (CFTypeRef)_SCRSystemWideAXUIElementRef;
  else
    v10 = 1;
  if (!v10)
    CFRelease(cf);
  return v9;
}

+ (id)uiElementAtCoordinate:(CGPoint)a3
{
  return (id)objc_msgSend(a1, "uiElementAtCoordinate:displayId:", 0, a3.x, a3.y);
}

+ (id)uiElementAtCoordinate:(CGPoint)a3 startWithElement:(id)a4
{
  id v4;
  AXValueRef v5;
  const __AXUIElement *v6;
  void *v7;
  CFTypeID v8;
  CFTypeRef result;
  CGPoint valuePtr;

  valuePtr = a3;
  result = 0;
  v4 = a4;
  v5 = AXValueCreate(kAXValueTypeCGPoint, &valuePtr);
  v6 = (const __AXUIElement *)objc_msgSend(v4, "axElement");

  v7 = 0;
  if (AXUIElementCopyParameterizedAttributeValue(v6, (CFStringRef)0x16960, v5, &result) == kAXErrorSuccess && result)
  {
    v8 = CFGetTypeID(result);
    if (v8 != AXUIElementGetTypeID())
    {
      v7 = 0;
      if (!v5)
        return v7;
      goto LABEL_6;
    }
    +[AXUIElement uiElementWithAXElement:](AXUIElement, "uiElementWithAXElement:", result);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(result);
  }
  if (v5)
LABEL_6:
    CFRelease(v5);
  return v7;
}

+ (id)uiApplicationWithPid:(int)a3
{
  const void *AppElementWithPid;
  void *v4;

  AppElementWithPid = (const void *)_AXUIElementCreateAppElementWithPid(a3);
  +[AXUIElement uiElementWithAXElement:](AXUIElement, "uiElementWithAXElement:", AppElementWithPid);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (AppElementWithPid)
    CFRelease(AppElementWithPid);
  return v4;
}

+ (id)uiApplicationAtCoordinate:(CGPoint)a3
{
  float x;
  float y;
  void *v5;
  CFTypeRef cf;

  cf = 0;
  if (!_SCRSystemWideAXUIElementRef)
    return 0;
  x = a3.x;
  y = a3.y;
  if (AXUIElementCopyApplicationAtPosition((const __AXUIElement *)_SCRSystemWideAXUIElementRef, (uint64_t *)&cf, x, y))
  {
    v5 = 0;
  }
  else
  {
    +[AXUIElement uiElementWithAXElement:](AXUIElement, "uiElementWithAXElement:", cf);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (cf)
  {
    CFRelease(cf);
    cf = 0;
  }
  return v5;
}

+ (id)uiApplicationForContext:(unsigned int)a3
{
  void *v3;
  void *v4;
  AXError v5;
  BOOL v6;
  CFTypeID v7;
  const void *AppElementWithPid;
  void *v9;
  int valuePtr;
  CFTypeRef result;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
    goto LABEL_13;
  result = 0;
  v13 = CFSTR("contextId");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = AXUIElementCopyParameterizedAttributeValue((AXUIElementRef)_SCRSystemWideAXUIElementRef, (CFStringRef)0x16574, v4, &result);
  if (!result
    || ((CFAutorelease(result), v5 == kAXErrorSuccess) ? (v6 = result == 0) : (v6 = 1),
        v6
     || (v7 = CFGetTypeID(result), v7 != CFNumberGetTypeID())
     || (valuePtr = 0, CFNumberGetValue((CFNumberRef)result, kCFNumberIntType, &valuePtr), !valuePtr)))
  {

LABEL_13:
    v9 = 0;
    return v9;
  }
  AppElementWithPid = (const void *)_AXUIElementCreateAppElementWithPid(valuePtr);
  +[AXUIElement uiElementWithAXElement:](AXUIElement, "uiElementWithAXElement:", AppElementWithPid);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (AppElementWithPid)
    CFRelease(AppElementWithPid);

  return v9;
}

- (AXUIElement)initWithAXElement:(__AXUIElement *)a3 cache:(id)a4
{
  id v6;
  AXUIElement *v7;
  AXUIElement *v8;
  __AXUIElement *v9;
  void *v10;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AXUIElement;
  v7 = -[AXUIElement init](&v12, sel_init);
  v8 = v7;
  if (a3)
  {
    if (!v7)
    {
LABEL_8:
      a3 = v8;
      goto LABEL_9;
    }
    v9 = (__AXUIElement *)CFRetain(a3);
    v8->_axElement = v9;
    if (v9)
    {
      v8->_isValid = 1;
      if (v6)
      {
        v10 = (void *)objc_msgSend(v6, "mutableCopy");
        -[AXUIElement setCachedAttributes:](v8, "setCachedAttributes:", v10);

      }
      else
      {
        -[AXUIElement enableCache:](v8, "enableCache:", 0);
      }
      goto LABEL_8;
    }
    a3 = 0;
  }
LABEL_9:

  return (AXUIElement *)a3;
}

- (AXUIElement)initWithAXElement:(__AXUIElement *)a3
{
  AXUIElement *v3;
  AXUIElement *v4;

  v3 = -[AXUIElement initWithAXElement:cache:](self, "initWithAXElement:cache:", a3, 0);
  v4 = v3;
  if (v3)
    -[AXUIElement enableCache:](v3, "enableCache:", 1);
  return v4;
}

- (void)dealloc
{
  __AXUIElement *axElement;
  objc_super v4;

  axElement = self->_axElement;
  if (axElement)
  {
    CFRelease(axElement);
    self->_axElement = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)AXUIElement;
  -[AXUIElement dealloc](&v4, sel_dealloc);
}

- (NSDictionary)cachedAttributes
{
  AXUIElement *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSMutableDictionary copy](v2->_cachedAttributes, "copy");
  objc_sync_exit(v2);

  return (NSDictionary *)v3;
}

- (NSMutableDictionary)copyCachedAttributes
{
  AXUIElement *v2;
  NSMutableDictionary *v3;

  v2 = self;
  objc_sync_enter(v2);
  -[NSMutableDictionary ax_deepMutableCopy](v2->_cachedAttributes, "ax_deepMutableCopy");
  v3 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return v3;
}

- (void)_cachedValueForAttribute:(int64_t)a3
{
  AXUIElement *v4;
  NSMutableDictionary *cachedAttributes;
  void *v6;
  void *v7;
  CFTypeRef v8;
  CFTypeRef v9;

  v4 = self;
  objc_sync_enter(v4);
  cachedAttributes = v4->_cachedAttributes;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](cachedAttributes, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = CFRetain(v7);
    v9 = CFAutorelease(v8);
  }
  else
  {
    v9 = 0;
  }
  objc_sync_exit(v4);

  return (void *)v9;
}

- (void)_setCachedValue:(void *)a3 forAttribute:(int64_t)a4
{
  NSMutableDictionary *cachedAttributes;
  void *v7;
  AXUIElement *obj;

  obj = self;
  objc_sync_enter(obj);
  cachedAttributes = obj->_cachedAttributes;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
    -[NSMutableDictionary setObject:forKeyedSubscript:](cachedAttributes, "setObject:forKeyedSubscript:", a3, v7);
  else
    -[NSMutableDictionary removeObjectForKey:](cachedAttributes, "removeObjectForKey:", v7);

  objc_sync_exit(obj);
}

- (int)pid
{
  __AXUIElement *axElement;
  pid_t pid;

  axElement = self->_axElement;
  if (axElement)
  {
    pid = 0;
    AXUIElementGetPid(axElement, &pid);
    LODWORD(axElement) = pid;
  }
  return (int)axElement;
}

- (unint64_t)hash
{
  __AXUIElement *axElement;
  objc_super v5;

  axElement = self->_axElement;
  if (axElement)
    return CFHash(axElement);
  v5.receiver = self;
  v5.super_class = (Class)AXUIElement;
  return -[AXUIElement hash](&v5, sel_hash);
}

- (BOOL)isEqual:(id)a3
{
  AXUIElement *v4;
  AXUIElement *v5;
  __AXUIElement *axElement;
  __AXUIElement *v7;
  BOOL v8;
  objc_super v10;

  v4 = (AXUIElement *)a3;
  v5 = v4;
  if (self == v4)
    goto LABEL_8;
  if (!v4)
  {
    v8 = 0;
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ((axElement = v5->_axElement, v7 = self->_axElement, v7 == axElement) || axElement
                                                                             && v7
                                                                             && CFEqual(v7, axElement)))
  {
LABEL_8:
    v8 = 1;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)AXUIElement;
    v8 = -[AXUIElement isEqual:](&v10, sel_isEqual_, v5);
  }
LABEL_11:

  return v8;
}

- (__AXUIElement)axElement
{
  if (self->_isValid)
    return self->_axElement;
  else
    return 0;
}

- (void)setAXElement:(__AXUIElement *)a3
{
  __AXUIElement *axElement;

  axElement = self->_axElement;
  if (axElement != a3)
  {
    if (axElement)
      CFRelease(axElement);
    if (a3)
      CFRetain(a3);
    self->_axElement = a3;
  }
}

- (void)_invalidate
{
  self->_isValid = 0;
}

- (void)modifyStaticCacheValue:(void *)a3
{
  void *v3;
  CFTypeID v5;

  if (!a3)
    return (void *)*MEMORY[0x1E0C9B0D0];
  v3 = a3;
  if (AXValueGetType((AXValueRef)a3) == kAXValueTypeAXError)
    return (void *)*MEMORY[0x1E0C9B0D0];
  v5 = CFGetTypeID(v3);
  if (v5 != AXUIElementGetTypeID())
    return v3;
  return +[AXUIElement uiElementWithAXElement:](AXUIElement, "uiElementWithAXElement:", v3);
}

- (void)setCachedAttributes:(id)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *cachedAttributes;
  AXUIElement *obj;

  v4 = (NSMutableDictionary *)a3;
  obj = self;
  objc_sync_enter(obj);
  cachedAttributes = obj->_cachedAttributes;
  obj->_cachedRefCount = 0;
  obj->_cachedAttributes = v4;

  obj->_cachedRefCount = obj->_cachedAttributes != 0;
  objc_sync_exit(obj);

}

- (void)enableCache:(BOOL)a3
{
  ++self->_cachedRefCount;
  -[AXUIElement _createCache:](self, "_createCache:", a3);
}

- (void)disableCache
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1B54A6000, log, OS_LOG_TYPE_DEBUG, "DISABLING AN AXUIELEMENT'S CACHING MECHANISM SHOULD NEVER BE DONE UNLESS ITS ALREADY CACHING", v1, 2u);
}

- (void)_createCache:(BOOL)a3
{
  _BOOL4 v3;
  AXUIElement *v4;
  uint64_t v5;
  NSMutableDictionary *cachedAttributes;
  _QWORD block[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v3 = a3;
  v4 = self;
  objc_sync_enter(v4);
  if (!v4->_cachedAttributes)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    cachedAttributes = v4->_cachedAttributes;
    v4->_cachedAttributes = (NSMutableDictionary *)v5;

  }
  objc_sync_exit(v4);

  if (v3)
  {
    if (_CacheAttributeNamesAccessQueue)
    {
      v8 = 0;
      v9 = &v8;
      v10 = 0x3032000000;
      v11 = __Block_byref_object_copy__0;
      v12 = __Block_byref_object_dispose__0;
      v13 = 0;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __28__AXUIElement__createCache___block_invoke;
      block[3] = &unk_1E69194D0;
      block[4] = &v8;
      dispatch_sync((dispatch_queue_t)_CacheAttributeNamesAccessQueue, block);
      -[AXUIElement updateCacheWithAttributes:](v4, "updateCacheWithAttributes:", v9[5]);
      _Block_object_dispose(&v8, 8);

    }
  }
}

void __28__AXUIElement__createCache___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), (id)CachedAttributeNames);
}

- (void)updateCacheWithAttributes:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  AXUIElement *v13;
  id v14;

  v14 = a3;
  -[AXUIElement valueArrayWithAXAttributes:](self, "valueArrayWithAXAttributes:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  if (v4)
  {
    if (v5)
    {
      v6 = objc_msgSend(v14, "count");
      if (v6)
      {
        v7 = v6;
        for (i = 0; i != v7; ++i)
        {
          objc_msgSend(v4, "objectAtIndexedSubscript:", i);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          if (v9)
          {
            objc_msgSend(v14, "objectAtIndex:", i);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = objc_msgSend(v10, "unsignedIntValue");

            if (AXValueGetType((AXValueRef)v9) == kAXValueTypeAXError)
            {
              v12 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
              v13 = self;
            }
            else
            {
              v13 = self;
              v12 = (uint64_t)v9;
            }
            -[AXUIElement _setCachedValue:forAttribute:](v13, "_setCachedValue:forAttribute:", v12, v11);
          }
        }
      }
    }
  }

}

- (BOOL)isValidForApplication:(id)a3
{
  _QWORD *v4;
  __AXUIElement *axElement;
  const __AXUIElement *v6;
  int64_t cachedRefCount;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  double v16;
  void *v17;
  char v18;
  BOOL v19;
  pid_t v21;
  pid_t pid;

  v4 = a3;
  if (!v4)
    goto LABEL_9;
  pid = 0;
  axElement = self->_axElement;
  if (!axElement)
    goto LABEL_9;
  v21 = 0;
  if (AXUIElementGetPid(axElement, &pid) == kAXErrorInvalidUIElement)
    goto LABEL_9;
  v6 = (const __AXUIElement *)v4[1];
  if (!v6)
    goto LABEL_9;
  if (AXUIElementGetPid(v6, &v21) == kAXErrorInvalidUIElement)
    goto LABEL_9;
  if (pid != v21)
    goto LABEL_9;
  cachedRefCount = self->_cachedRefCount;
  self->_cachedRefCount = 0;
  -[AXUIElement pointWithAXAttribute:](self, "pointWithAXAttribute:", 2062);
  v9 = v8;
  v11 = v10;
  -[AXUIElement numberWithAXAttribute:](self, "numberWithAXAttribute:", 2021);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "unsignedIntValue");

  -[AXUIElement numberWithAXAttribute:](self, "numberWithAXAttribute:", 2123);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "unsignedIntValue");

  v16 = AXConvertPointFromHostedCoordinates(v13, v15, v9, v11);
  self->_cachedRefCount = cachedRefCount;
  +[AXUIElement uiElementAtCoordinate:forApplication:contextId:displayId:](AXUIElement, "uiElementAtCoordinate:forApplication:contextId:displayId:", self->_axElement, v13, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isEqual:", self);

  if ((v18 & 1) != 0)
    v19 = 1;
  else
LABEL_9:
    v19 = 0;

  return v19;
}

- (BOOL)isValid
{
  __AXUIElement *axElement;
  AXError v4;
  BOOL v5;
  BOOL v6;
  BOOL v7;
  pid_t pid;

  if (!self->_isValid)
    return 0;
  axElement = self->_axElement;
  pid = 0;
  v4 = AXUIElementGetPid(axElement, &pid);
  if (axElement)
    v5 = v4 == kAXErrorInvalidUIElement;
  else
    v5 = 1;
  v6 = v5 || pid <= 0;
  v7 = !v6;
  if (v6)
    -[AXUIElement _invalidate](self, "_invalidate");
  return v7;
}

- (id)_outputCache
{
  void *v3;
  AXUIElement *v4;
  NSMutableDictionary *cachedAttributes;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self;
  objc_sync_enter(v4);
  cachedAttributes = v4->_cachedAttributes;
  if (cachedAttributes)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[NSMutableDictionary allKeys](cachedAttributes, "allKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v6);
          v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
          -[NSMutableDictionary objectForKeyedSubscript:](v4->_cachedAttributes, "objectForKeyedSubscript:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendFormat:", CFSTR("Cache: key: %@ - value: %@"), v10, v11);

        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

    objc_sync_exit(v4);
    v12 = v3;
  }
  else
  {
    objc_sync_exit(v4);

    v12 = CFSTR("No Cache");
  }

  return v12;
}

- (void)updateCache:(int64_t)a3
{
  __AXUIElement *axElement;
  AXError v6;
  BOOL v7;
  CFTypeRef value;

  if (self->_isValid)
  {
    axElement = self->_axElement;
    if (axElement)
    {
      value = 0;
      v6 = AXUIElementCopyAttributeValue(axElement, (CFStringRef)a3, &value);
      if (v6)
        v7 = 1;
      else
        v7 = value == 0;
      if (v7)
      {
        if (v6 == kAXErrorNoValue)
          -[AXUIElement _setCachedValue:forAttribute:](self, "_setCachedValue:forAttribute:", objc_msgSend(MEMORY[0x1E0C99E38], "null"), a3);
      }
      else
      {
        -[AXUIElement _setCachedValue:forAttribute:](self, "_setCachedValue:forAttribute:");
        CFRelease(value);
      }
    }
  }
}

- (id)arrayWithAXAttribute:(int64_t)a3
{
  CFTypeRef v5;
  __AXUIElement *axElement;
  AXError v7;
  CFTypeID v8;
  CFTypeID v10;
  CFTypeID TypeID;
  void *v12;
  CFTypeRef value;

  v5 = -[AXUIElement _cachedValueForAttribute:](self, "_cachedValueForAttribute:");
  value = v5;
  if (v5 == (CFTypeRef)*MEMORY[0x1E0C9B0D0])
    return 0;
  if (v5)
    goto LABEL_14;
  if (self->_isValid)
  {
    axElement = self->_axElement;
    if (axElement)
    {
      v7 = AXUIElementCopyAttributeValue(axElement, (CFStringRef)a3, &value);
      switch(v7)
      {
        case kAXErrorNoValue:
          -[AXUIElement _setCachedValue:forAttribute:](self, "_setCachedValue:forAttribute:", objc_msgSend(MEMORY[0x1E0C99E38], "null"), a3);
          break;
        case kAXErrorInvalidUIElement:
          -[AXUIElement _invalidate](self, "_invalidate");
          break;
        case kAXErrorSuccess:
          v8 = CFGetTypeID(value);
          if (v8 != CFArrayGetTypeID())
          {
            CFRelease(value);
            v12 = 0;
            value = 0;
            return v12;
          }
          -[AXUIElement _setCachedValue:forAttribute:](self, "_setCachedValue:forAttribute:", value, a3);
          CFAutorelease(value);
          break;
      }
    }
  }
  v5 = value;
  if (value)
  {
LABEL_14:
    v10 = CFGetTypeID(v5);
    TypeID = CFNullGetTypeID();
    v12 = (void *)value;
    if (v10 == TypeID)
      v12 = 0;
    return v12;
  }
  v12 = 0;
  return v12;
}

- (id)stringWithAXAttribute:(int64_t)a3
{
  void *v5;
  CFTypeRef v6;
  CFTypeID v7;
  __AXUIElement *axElement;
  AXError v10;
  AXError v11;
  CFTypeID v12;
  NSObject *v13;
  CFTypeID v14;
  CFTypeID TypeID;
  void *v16;
  __AXUIElement *v17;
  CFTypeRef value;
  uint8_t buf[4];
  AXUIElement *v20;
  __int16 v21;
  __AXUIElement *v22;
  __int16 v23;
  int64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = -[AXUIElement _cachedValueForAttribute:](self, "_cachedValueForAttribute:");
  value = v5;
  if (v5 == (void *)*MEMORY[0x1E0C9B0D0])
    return 0;
  v6 = v5;
  if (v5)
  {
    v7 = CFGetTypeID(v5);
    if (v7 != CFStringGetTypeID() && !AXIsAXAttributedString())
      return 0;
    goto LABEL_19;
  }
  if (self->_isValid)
  {
    axElement = self->_axElement;
    if (axElement)
    {
      v10 = AXUIElementCopyAttributeValue(axElement, (CFStringRef)a3, &value);
      if (v10 == kAXErrorNoValue)
      {
        -[AXUIElement _setCachedValue:forAttribute:](self, "_setCachedValue:forAttribute:", objc_msgSend(MEMORY[0x1E0C99E38], "null"), a3);
      }
      else
      {
        v11 = v10;
        if (v10)
        {
          AXRuntimeLogCommon();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            v17 = self->_axElement;
            *(_DWORD *)buf = 134218752;
            v20 = self;
            v21 = 2048;
            v22 = v17;
            v23 = 2048;
            v24 = a3;
            v25 = 2048;
            v26 = v11;
            _os_log_error_impl(&dword_1B54A6000, v13, OS_LOG_TYPE_ERROR, "error in stringWithAXAttribute. AXUIElement:%p ref:%p attr:%ld error:%ld", buf, 0x2Au);
          }

          if (v11 == kAXErrorInvalidUIElement)
            -[AXUIElement _invalidate](self, "_invalidate");
        }
        else
        {
          v12 = CFGetTypeID(value);
          if (v12 != CFStringGetTypeID() && !AXIsAXAttributedString())
          {
            CFRelease(value);
            v16 = 0;
            value = 0;
            return v16;
          }
          -[AXUIElement _setCachedValue:forAttribute:](self, "_setCachedValue:forAttribute:", value, a3);
          CFAutorelease(value);
        }
      }
    }
  }
  v6 = value;
  if (value)
  {
LABEL_19:
    v14 = CFGetTypeID(v6);
    TypeID = CFNullGetTypeID();
    v16 = (void *)value;
    if (v14 == TypeID)
      v16 = 0;
    return v16;
  }
  v16 = 0;
  return v16;
}

- (BOOL)BOOLWithAXAttribute:(int64_t)a3
{
  void *v5;
  const __CFBoolean *v6;
  CFTypeID v7;
  char v8;
  __AXUIElement *axElement;
  AXError v10;
  CFTypeID v11;
  CFTypeID v13;
  CFTypeRef value;

  v5 = -[AXUIElement _cachedValueForAttribute:](self, "_cachedValueForAttribute:");
  value = v5;
  if (v5 == (void *)*MEMORY[0x1E0C9B0D0])
    return 0;
  v6 = (const __CFBoolean *)v5;
  if (v5)
  {
    v7 = CFGetTypeID(v5);
    if (v7 != CFNullGetTypeID())
      return CFBooleanGetValue(v6) != 0;
    return 0;
  }
  if (!self->_isValid)
    return 0;
  axElement = self->_axElement;
  if (!axElement)
    return 0;
  v10 = AXUIElementCopyAttributeValue(axElement, (CFStringRef)a3, &value);
  if (v10 == kAXErrorNoValue)
  {
    -[AXUIElement _setCachedValue:forAttribute:](self, "_setCachedValue:forAttribute:", objc_msgSend(MEMORY[0x1E0C99E38], "null"), a3);
    return 0;
  }
  if (v10 == kAXErrorInvalidUIElement)
  {
    -[AXUIElement _invalidate](self, "_invalidate");
    return 0;
  }
  if (v10)
    return 0;
  v11 = CFGetTypeID(value);
  if (v11 == CFBooleanGetTypeID())
  {
    -[AXUIElement _setCachedValue:forAttribute:](self, "_setCachedValue:forAttribute:", value, a3);
    v8 = CFBooleanGetValue((CFBooleanRef)value) != 0;
  }
  else
  {
    v13 = CFGetTypeID(value);
    if (v13 == CFNumberGetTypeID())
    {
      -[AXUIElement _setCachedValue:forAttribute:](self, "_setCachedValue:forAttribute:", value, a3);
      v8 = objc_msgSend((id)value, "BOOLValue");
    }
    else
    {
      v8 = 0;
    }
  }
  CFRelease(value);
  return v8;
}

- (id)numberWithAXAttribute:(int64_t)a3
{
  CFTypeRef v5;
  __AXUIElement *axElement;
  AXError v7;
  CFTypeID v8;
  CFTypeID v10;
  CFTypeID TypeID;
  void *v12;
  CFTypeRef value;

  v5 = -[AXUIElement _cachedValueForAttribute:](self, "_cachedValueForAttribute:");
  value = v5;
  if (v5 == (CFTypeRef)*MEMORY[0x1E0C9B0D0])
    return 0;
  if (v5)
    goto LABEL_14;
  if (self->_isValid)
  {
    axElement = self->_axElement;
    if (axElement)
    {
      v7 = AXUIElementCopyAttributeValue(axElement, (CFStringRef)a3, &value);
      switch(v7)
      {
        case kAXErrorNoValue:
          -[AXUIElement _setCachedValue:forAttribute:](self, "_setCachedValue:forAttribute:", objc_msgSend(MEMORY[0x1E0C99E38], "null"), a3);
          break;
        case kAXErrorInvalidUIElement:
          -[AXUIElement _invalidate](self, "_invalidate");
          break;
        case kAXErrorSuccess:
          v8 = CFGetTypeID(value);
          if (v8 != CFNumberGetTypeID())
          {
            CFRelease(value);
            v12 = 0;
            value = 0;
            return v12;
          }
          -[AXUIElement _setCachedValue:forAttribute:](self, "_setCachedValue:forAttribute:", value, a3);
          CFAutorelease(value);
          break;
      }
    }
  }
  v5 = value;
  if (value)
  {
LABEL_14:
    v10 = CFGetTypeID(v5);
    TypeID = CFNullGetTypeID();
    v12 = (void *)value;
    if (v10 == TypeID)
      v12 = 0;
    return v12;
  }
  v12 = 0;
  return v12;
}

- (CGPoint)pointWithAXAttribute:(int64_t)a3
{
  void *v5;
  void *v6;
  const __AXValue *v7;
  CFTypeID v8;
  __AXUIElement *axElement;
  AXError v10;
  double v11;
  double v12;
  CFTypeRef value;
  __int128 valuePtr;
  CGPoint result;

  v5 = -[AXUIElement _cachedValueForAttribute:](self, "_cachedValueForAttribute:");
  value = v5;
  v6 = (void *)*MEMORY[0x1E0C9B0D0];
  valuePtr = *MEMORY[0x1E0C9D538];
  if (v5 != v6)
  {
    v7 = (const __AXValue *)v5;
    if (v5)
    {
      v8 = CFGetTypeID(v5);
      if (v8 != CFNullGetTypeID())
        AXValueGetValue(v7, kAXValueTypeCGPoint, &valuePtr);
    }
    else if (self->_isValid)
    {
      axElement = self->_axElement;
      if (axElement)
      {
        v10 = AXUIElementCopyAttributeValue(axElement, (CFStringRef)a3, &value);
        switch(v10)
        {
          case kAXErrorNoValue:
            -[AXUIElement _setCachedValue:forAttribute:](self, "_setCachedValue:forAttribute:", objc_msgSend(MEMORY[0x1E0C99E38], "null"), a3);
            break;
          case kAXErrorInvalidUIElement:
            -[AXUIElement _invalidate](self, "_invalidate");
            break;
          case kAXErrorSuccess:
            if (AXValueGetType((AXValueRef)value) == kAXValueTypeCGPoint)
            {
              -[AXUIElement _setCachedValue:forAttribute:](self, "_setCachedValue:forAttribute:", value, a3);
              AXValueGetValue((AXValueRef)value, kAXValueTypeCGPoint, &valuePtr);
            }
            CFRelease(value);
            break;
        }
      }
    }
  }
  v12 = *((double *)&valuePtr + 1);
  v11 = *(double *)&valuePtr;
  result.y = v12;
  result.x = v11;
  return result;
}

- (CGPath)pathWithAXAttribute:(int64_t)a3
{
  CGPath *result;
  __AXUIElement *axElement;
  AXError v7;
  CFTypeID v8;
  CFTypeID v9;
  CFTypeRef value;

  result = -[AXUIElement _cachedValueForAttribute:](self, "_cachedValueForAttribute:");
  value = result;
  if (result == (CGPath *)*MEMORY[0x1E0C9B0D0])
    return 0;
  if (!result)
  {
    if (self->_isValid)
    {
      axElement = self->_axElement;
      if (axElement)
      {
        v7 = AXUIElementCopyAttributeValue(axElement, (CFStringRef)a3, &value);
        if (v7 == kAXErrorNoValue)
        {
          -[AXUIElement _setCachedValue:forAttribute:](self, "_setCachedValue:forAttribute:", objc_msgSend(MEMORY[0x1E0C99E38], "null"), a3);
        }
        else
        {
          if (v7 != kAXErrorInvalidUIElement)
          {
            if (v7)
              goto LABEL_12;
            v8 = CFGetTypeID(value);
            if (v8 == CGPathGetTypeID())
            {
              -[AXUIElement _setCachedValue:forAttribute:](self, "_setCachedValue:forAttribute:", value, a3);
              CFAutorelease(value);
              goto LABEL_12;
            }
            CFRelease(value);
            return 0;
          }
          -[AXUIElement _invalidate](self, "_invalidate");
        }
      }
    }
LABEL_12:
    result = (CGPath *)value;
    if (!value)
      return result;
  }
  v9 = CFGetTypeID(result);
  if (v9 == CFNullGetTypeID())
    return 0;
  else
    return (CGPath *)value;
}

- (CGRect)rectWithAXAttribute:(int64_t)a3
{
  void *v5;
  void *v6;
  __int128 v7;
  const __AXValue *v8;
  CFTypeID v9;
  __AXUIElement *axElement;
  AXError v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CFTypeRef value;
  __int128 valuePtr;
  __int128 v18;
  CGRect result;

  v5 = -[AXUIElement _cachedValueForAttribute:](self, "_cachedValueForAttribute:");
  value = v5;
  v6 = (void *)*MEMORY[0x1E0C9B0D0];
  v7 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  valuePtr = *MEMORY[0x1E0C9D648];
  v18 = v7;
  if (v5 != v6)
  {
    v8 = (const __AXValue *)v5;
    if (v5)
    {
      v9 = CFGetTypeID(v5);
      if (v9 != CFNullGetTypeID())
        AXValueGetValue(v8, kAXValueTypeCGRect, &valuePtr);
    }
    else if (self->_isValid)
    {
      axElement = self->_axElement;
      if (axElement)
      {
        v11 = AXUIElementCopyAttributeValue(axElement, (CFStringRef)a3, &value);
        switch(v11)
        {
          case kAXErrorNoValue:
            -[AXUIElement _setCachedValue:forAttribute:](self, "_setCachedValue:forAttribute:", objc_msgSend(MEMORY[0x1E0C99E38], "null"), a3);
            break;
          case kAXErrorInvalidUIElement:
            -[AXUIElement _invalidate](self, "_invalidate");
            break;
          case kAXErrorSuccess:
            if (AXValueGetType((AXValueRef)value) == kAXValueTypeCGRect)
            {
              -[AXUIElement _setCachedValue:forAttribute:](self, "_setCachedValue:forAttribute:", value, a3);
              AXValueGetValue((AXValueRef)value, kAXValueTypeCGRect, &valuePtr);
            }
            CFRelease(value);
            break;
        }
      }
    }
  }
  v13 = *((double *)&valuePtr + 1);
  v12 = *(double *)&valuePtr;
  v15 = *((double *)&v18 + 1);
  v14 = *(double *)&v18;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (_NSRange)rangeWithAXAttribute:(int64_t)a3
{
  void *v5;
  const __AXValue *v6;
  CFTypeID v7;
  NSUInteger v8;
  NSUInteger v9;
  __AXUIElement *axElement;
  AXError v11;
  CFTypeRef value;
  __int128 valuePtr;
  _NSRange result;

  v5 = -[AXUIElement _cachedValueForAttribute:](self, "_cachedValueForAttribute:");
  value = v5;
  if (v5 == (void *)*MEMORY[0x1E0C9B0D0])
  {
    valuePtr = xmmword_1B54F0210;
  }
  else
  {
    v6 = (const __AXValue *)v5;
    valuePtr = 0uLL;
    if (v5)
    {
      v7 = CFGetTypeID(v5);
      if (v7 != CFNullGetTypeID())
        AXValueGetValue(v6, kAXValueTypeCFRange, &valuePtr);
    }
    else if (self->_isValid)
    {
      axElement = self->_axElement;
      if (axElement)
      {
        v11 = AXUIElementCopyAttributeValue(axElement, (CFStringRef)a3, &value);
        switch(v11)
        {
          case kAXErrorNoValue:
            -[AXUIElement _setCachedValue:forAttribute:](self, "_setCachedValue:forAttribute:", objc_msgSend(MEMORY[0x1E0C99E38], "null"), a3);
            break;
          case kAXErrorInvalidUIElement:
            -[AXUIElement _invalidate](self, "_invalidate");
            break;
          case kAXErrorSuccess:
            if (AXValueGetType((AXValueRef)value) == kAXValueTypeCFRange)
            {
              -[AXUIElement _setCachedValue:forAttribute:](self, "_setCachedValue:forAttribute:", value, a3);
              AXValueGetValue((AXValueRef)value, kAXValueTypeCFRange, &valuePtr);
            }
            CFRelease(value);
            break;
        }
      }
    }
  }
  v9 = *((_QWORD *)&valuePtr + 1);
  v8 = valuePtr;
  result.length = v9;
  result.location = v8;
  return result;
}

- (CGColor)colorWithAXAttribute:(int64_t)a3
{
  CGColor *result;
  __AXUIElement *axElement;
  AXError v7;
  CFTypeRef v8;
  CFTypeID v9;
  CFTypeRef value;

  result = -[AXUIElement _cachedValueForAttribute:](self, "_cachedValueForAttribute:");
  value = result;
  if (!result)
  {
    if (self->_isValid)
    {
      axElement = self->_axElement;
      if (axElement)
      {
        v7 = AXUIElementCopyAttributeValue(axElement, (CFStringRef)a3, &value);
        if (v7 == kAXErrorNoValue)
        {
          v8 = (CFTypeRef)objc_msgSend(MEMORY[0x1E0C99E38], "null");
        }
        else
        {
          if (v7 == kAXErrorInvalidUIElement)
          {
            -[AXUIElement _invalidate](self, "_invalidate");
            goto LABEL_13;
          }
          if (v7)
            goto LABEL_13;
          if (value)
          {
            CFAutorelease(value);
            v8 = value;
          }
          else
          {
            v8 = 0;
          }
        }
        -[AXUIElement _setCachedValue:forAttribute:](self, "_setCachedValue:forAttribute:", v8, a3);
      }
    }
LABEL_13:
    result = (CGColor *)value;
    if (!value)
      return result;
  }
  v9 = CFGetTypeID(result);
  if (v9 == CGColorGetTypeID())
    return (CGColor *)value;
  else
    return 0;
}

- (id)objectWithAXAttribute:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CFTypeID v9;
  CFTypeID TypeID;
  void *v11;
  __AXUIElement *axElement;
  AXError v13;
  CFTypeRef v14;
  CFTypeRef cf;

  cf = -[AXUIElement _cachedValueForAttribute:](self, "_cachedValueForAttribute:");
  if (!cf && self->_isValid)
  {
    axElement = self->_axElement;
    if (axElement)
    {
      v13 = AXUIElementCopyAttributeValue(axElement, (CFStringRef)a3, &cf);
      switch(v13)
      {
        case kAXErrorNoValue:
          v14 = (CFTypeRef)objc_msgSend(MEMORY[0x1E0C99E38], "null");
LABEL_23:
          -[AXUIElement _setCachedValue:forAttribute:](self, "_setCachedValue:forAttribute:", v14, a3);
          break;
        case kAXErrorInvalidUIElement:
          -[AXUIElement _invalidate](self, "_invalidate");
          break;
        case kAXErrorSuccess:
          if (cf)
          {
            CFAutorelease(cf);
            v14 = cf;
          }
          else
          {
            v14 = 0;
          }
          goto LABEL_23;
      }
    }
  }
  if ((unint64_t)(a3 - 3000) <= 9 && ((1 << (a3 + 72)) & 0x205) != 0)
  {
    +[AXUIElement proxiedMLElementsForApp:](AXUIElement, "proxiedMLElementsForApp:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      objc_msgSend(v5, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "nextElementsWithCount:", 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      cf = (CFTypeRef)objc_msgSend(v8, "axElement");

    }
  }
  if (cf)
  {
    v9 = CFGetTypeID(cf);
    TypeID = CFNullGetTypeID();
    v11 = (void *)cf;
    if (v9 == TypeID)
      v11 = 0;
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (id)objectWithAXAttribute:(int64_t)a3 parameter:(void *)a4
{
  __AXUIElement *axElement;
  id v7;
  void *v8;
  CFTypeRef result;

  if (self->_isValid && (axElement = self->_axElement, result = 0, axElement))
  {
    v7 = AXUIElementConvertOutgoingType(a4);
    if (AXUIElementCopyParameterizedAttributeValue(axElement, (CFStringRef)a3, v7, &result) == kAXErrorInvalidUIElement)
      -[AXUIElement _invalidate](self, "_invalidate");
    v8 = (void *)result;
    if (result)
    {
      CFAutorelease(result);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)valueArrayWithAXAttributes:(__CFArray *)a3
{
  __CFArray *Mutable;
  __AXUIElement *axElement;
  AXError v7;
  CFArrayRef v8;
  BOOL v9;
  CFIndex Count;
  CFIndex v11;
  CFIndex i;
  const void *ValueAtIndex;
  const void *v14;
  CFTypeID v15;
  void *v16;
  CFArrayRef values;

  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
  if (!self->_isValid)
    goto LABEL_22;
  axElement = self->_axElement;
  if (!axElement)
    goto LABEL_22;
  values = 0;
  v7 = AXUIElementCopyMultipleAttributeValues(axElement, a3, 0, &values);
  v8 = values;
  if (v7)
    v9 = 1;
  else
    v9 = values == 0;
  if (v9)
  {
    if (v7 != kAXErrorInvalidUIElement)
      goto LABEL_20;
    -[AXUIElement _invalidate](self, "_invalidate");
  }
  else
  {
    Count = CFArrayGetCount(values);
    if (Count)
    {
      v11 = Count;
      for (i = 0; i != v11; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(values, i);
        if (ValueAtIndex)
        {
          v14 = ValueAtIndex;
          v15 = CFGetTypeID(ValueAtIndex);
          if (v15 == AXUIElementGetTypeID())
          {
            +[AXUIElement uiElementWithAXElement:cache:](AXUIElement, "uiElementWithAXElement:cache:", v14, 0);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (v16)
              CFArrayAppendValue(Mutable, v16);

          }
          else
          {
            CFArrayAppendValue(Mutable, v14);
          }
        }
      }
    }
  }
  v8 = values;
LABEL_20:
  if (v8)
    CFRelease(v8);
LABEL_22:
  CFAutorelease(Mutable);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)performAXAction:(int)a3 withValue:(id)a4
{
  return -[AXUIElement performAXAction:withValue:fencePort:](self, "performAXAction:withValue:fencePort:", *(_QWORD *)&a3, a4, 0);
}

- (BOOL)performAXAction:(int)a3 withValue:(id)a4 fencePort:(unsigned int)a5
{
  id v6;
  void *v7;
  uint64_t v8;
  int v9;
  BOOL v10;

  v6 = a4;
  v7 = v6;
  if (self->_isValid && self->_axElement)
  {
    AXUIElementConvertOutgoingType(v6);
    v8 = objc_claimAutoreleasedReturnValue();

    v9 = AXUIElementPerformFencedActionWithValue();
    v10 = v9 == 0;
    if (v9 == -25202)
    {
      -[AXUIElement _invalidate](self, "_invalidate");
      v10 = 0;
    }
    v7 = (void *)v8;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)canPerformAXAction:(int)a3
{
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUIElement objectWithAXAttribute:parameter:](self, "objectWithAXAttribute:parameter:", 95221, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = objc_msgSend(v5, "BOOLValue");
  else
    v6 = 0;

  return v6;
}

- (BOOL)performAXAction:(int)a3
{
  __AXUIElement *axElement;
  AXError v5;

  if (!self->_isValid)
    goto LABEL_5;
  axElement = self->_axElement;
  if (axElement)
  {
    v5 = AXUIElementPerformAction(axElement, *(CFStringRef *)&a3);
    LOBYTE(axElement) = v5 == kAXErrorSuccess;
    if (v5 == kAXErrorInvalidUIElement)
    {
      -[AXUIElement _invalidate](self, "_invalidate");
LABEL_5:
      LOBYTE(axElement) = 0;
    }
  }
  return (char)axElement;
}

- (id)uiElementsWithAttribute:(int64_t)a3 parameter:(void *)a4
{
  return -[AXUIElement uiElementsWithAttribute:parameter:fetchAttributes:](self, "uiElementsWithAttribute:parameter:fetchAttributes:", a3, a4, 1);
}

- (id)uiElementsWithAttribute:(int64_t)a3 parameter:(void *)a4 fetchAttributes:(BOOL)a5
{
  _BOOL4 v5;
  __AXUIElement *axElement;
  AXError v10;
  void *v11;
  CFTypeRef v12;
  CFTypeID v13;
  AXError v14;
  char isKindOfClass;
  void *v16;
  void *v17;
  CFTypeID v18;
  void *v19;
  CFIndex Count;
  CFIndex v21;
  CFIndex i;
  const void *ValueAtIndex;
  void *v24;
  void *v25;
  CFTypeRef result;
  _QWORD v28[2];

  v5 = a5;
  v28[1] = *MEMORY[0x1E0C80C00];
  if (a4)
  {
LABEL_2:
    result = 0;
    goto LABEL_3;
  }
  v11 = -[AXUIElement _cachedValueForAttribute:](self, "_cachedValueForAttribute:", a3);
  result = v11;
  if (v11)
  {
    v12 = v11;
    v13 = CFGetTypeID(v11);
    if (v13 == CFArrayGetTypeID())
      goto LABEL_16;
    goto LABEL_2;
  }
LABEL_3:
  if (!self->_isValid)
    goto LABEL_26;
  axElement = self->_axElement;
  if (!axElement)
    goto LABEL_26;
  if (a4)
    v10 = AXUIElementCopyParameterizedAttributeValue(axElement, (CFStringRef)a3, a4, &result);
  else
    v10 = AXUIElementCopyAttributeValue(axElement, (CFStringRef)a3, &result);
  v14 = v10;
  if (!result)
    goto LABEL_24;
  CFAutorelease(result);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v12 = result;
  if ((isKindOfClass & 1) == 0)
  {
    v28[0] = result;
    v16 = (void *)MEMORY[0x1E0C99D20];
    v17 = (id)result;
    v12 = (CFTypeRef)objc_msgSend(v16, "arrayWithObjects:count:", v28, 1);

    result = v12;
  }
  if (v14 || !v12)
  {
LABEL_24:
    if (v14 == kAXErrorInvalidUIElement)
      -[AXUIElement _invalidate](self, "_invalidate");
    goto LABEL_26;
  }
LABEL_16:
  v18 = CFGetTypeID(v12);
  if (v18 != CFArrayGetTypeID())
  {
LABEL_26:
    v19 = 0;
    return v19;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  Count = CFArrayGetCount((CFArrayRef)result);
  if (Count >= 1)
  {
    v21 = Count;
    for (i = 0; i != v21; ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)result, i);
      if (v5)
      {
        +[AXUIElement uiElementWithAXElement:](AXUIElement, "uiElementWithAXElement:", ValueAtIndex);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        +[AXUIElement uiElementWithAXElement:cache:](AXUIElement, "uiElementWithAXElement:cache:", ValueAtIndex, v25);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v19, "addObject:", v24);

    }
  }
  return v19;
}

- (id)uiElementsWithAttribute:(int64_t)a3
{
  return -[AXUIElement uiElementsWithAttribute:parameter:](self, "uiElementsWithAttribute:parameter:", a3, 0);
}

- (id)nextElementsWithParameters:(id)a3
{
  return -[AXUIElement _elementsWithParameter:parameters:prefetchAttributes:](self, "_elementsWithParameter:parameters:prefetchAttributes:", 92501, a3, 0);
}

- (id)previousElementsWithParameters:(id)a3
{
  return -[AXUIElement _elementsWithParameter:parameters:prefetchAttributes:](self, "_elementsWithParameter:parameters:prefetchAttributes:", 92502, a3, 0);
}

- (id)nextElementsWithCount:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8 = CFSTR("elementCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUIElement _elementsWithParameter:parameters:prefetchAttributes:](self, "_elementsWithParameter:parameters:prefetchAttributes:", 92501, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)nextElementsIncludingPrefetchedAttributesWithCount:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8 = CFSTR("elementCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUIElement _elementsWithParameter:parameters:prefetchAttributes:](self, "_elementsWithParameter:parameters:prefetchAttributes:", 92501, v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)previousElementsWithCount:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8 = CFSTR("elementCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUIElement _elementsWithParameter:parameters:prefetchAttributes:](self, "_elementsWithParameter:parameters:prefetchAttributes:", 92502, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)childrenIncludingPrefetchedAttributesWithCount:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8 = CFSTR("elementCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUIElement _elementsWithParameter:parameters:prefetchAttributes:](self, "_elementsWithParameter:parameters:prefetchAttributes:", 95252, v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_elementsWithParameter:(int64_t)a3 parameters:(id)a4 prefetchAttributes:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  __AXUIElement *axElement;
  AXError v11;
  CFTypeRef v12;
  BOOL v13;
  BOOL v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  CFIndex Count;
  CFIndex v20;
  CFIndex i;
  const void *ValueAtIndex;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  BOOL v28;
  void *v29;
  CFTypeRef result;

  v5 = a5;
  v9 = a4;
  if (!self->_isValid)
  {
    result = 0;
    goto LABEL_16;
  }
  axElement = self->_axElement;
  result = 0;
  if (!axElement
    || ((v11 = AXUIElementCopyParameterizedAttributeValue(axElement, (CFStringRef)a3, v9, &result),
         v12 = result,
         v11 == kAXErrorSuccess)
      ? (v13 = result == 0)
      : (v13 = 1),
        v13 ? (v14 = v11 == kAXErrorNoValue) : (v14 = 1),
        v14))
  {
LABEL_16:
    objc_msgSend(v9, "objectForKey:", CFSTR("elementCount"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "unsignedIntegerValue");

    if (!v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AXUIElement.m"), 2134, CFSTR("A count parameter must be passed to this method"));

    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (result)
    {
      Count = CFArrayGetCount((CFArrayRef)result);
      if (Count >= 1)
      {
        v20 = Count;
        for (i = 0; i != v20; ++i)
        {
          ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)result, i);
          if (v5)
            +[AXUIElement uiElementWithAXElement:](AXUIElement, "uiElementWithAXElement:", ValueAtIndex);
          else
            +[AXUIElement uiElementWithAXElement:cache:](AXUIElement, "uiElementWithAXElement:cache:", ValueAtIndex, 0);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObject:", v23);

        }
      }
      CFRelease(result);
    }
    -[AXUIElement stringWithAXAttribute:](self, "stringWithAXAttribute:", 3003);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (AXProcessWantsMLElementsForBundle((uint64_t)v24))
    {
      -[AXUIElement numberWithAXAttribute:](self, "numberWithAXAttribute:", 2004);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v25, "unsignedLongValue") & 0x400000) == 0)
      {
        v28 = -[AXUIElement BOOLWithAXAttribute:](self, "BOOLWithAXAttribute:", 2044);

        if (!v28)
        {
          +[AXUIMLElement elementsInDirection:withElement:nextElements:](AXUIMLElement, "elementsInDirection:withElement:nextElements:", a3, self, v18);
          v26 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_31;
        }
LABEL_30:
        v26 = v18;
LABEL_31:
        v15 = v26;

        goto LABEL_32;
      }

    }
    goto LABEL_30;
  }
  if (v11 == kAXErrorInvalidUIElement)
  {
    -[AXUIElement _invalidate](self, "_invalidate");
    v12 = result;
  }
  if (v12)
    CFRelease(v12);
  v15 = 0;
LABEL_32:

  return v15;
}

- (void)setAXAttribute:(int64_t)a3 withBOOL:(BOOL)a4
{
  __AXUIElement *axElement;
  CFTypeRef *v6;

  if (self->_isValid)
  {
    axElement = self->_axElement;
    if (axElement)
    {
      v6 = (CFTypeRef *)MEMORY[0x1E0C9AE50];
      if (!a4)
        v6 = (CFTypeRef *)MEMORY[0x1E0C9AE40];
      if (AXUIElementSetAttributeValue(axElement, (CFStringRef)a3, *v6) == kAXErrorInvalidUIElement)
        -[AXUIElement _invalidate](self, "_invalidate");
    }
  }
}

- (void)setAXAttribute:(int64_t)a3 withString:(id)a4
{
  id v6;
  __AXUIElement *axElement;
  AXError v8;
  id v9;

  v6 = a4;
  if (self->_isValid)
  {
    axElement = self->_axElement;
    if (axElement)
    {
      v9 = v6;
      v8 = AXUIElementSetAttributeValue(axElement, (CFStringRef)a3, v6);
      v6 = v9;
      if (v8 == kAXErrorInvalidUIElement)
      {
        -[AXUIElement _invalidate](self, "_invalidate", v9);
        v6 = v9;
      }
    }
  }

}

- (void)setAXAttribute:(int64_t)a3 withLong:(int64_t)a4
{
  id v6;

  v6 = (id)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), "initWithLong:", a4);
  -[AXUIElement setAXAttribute:withNumber:](self, "setAXAttribute:withNumber:", a3, v6);

}

- (void)setAXAttribute:(int64_t)a3 withFloat:(float)a4
{
  id v7;
  double v8;
  id v9;

  v7 = objc_allocWithZone(MEMORY[0x1E0CB37E8]);
  *(float *)&v8 = a4;
  v9 = (id)objc_msgSend(v7, "initWithFloat:", v8);
  -[AXUIElement setAXAttribute:withNumber:](self, "setAXAttribute:withNumber:", a3, v9);

}

- (void)setAXAttribute:(int64_t)a3 withNumber:(id)a4
{
  id v6;
  __AXUIElement *axElement;
  id v8;

  v6 = a4;
  if (self->_isValid)
  {
    axElement = self->_axElement;
    if (axElement)
    {
      v8 = v6;
      AXUIElementSetAttributeValue(axElement, (CFStringRef)a3, v6);
      v6 = v8;
    }
  }

}

- (void)setAXAttribute:(int64_t)a3 withPoint:(CGPoint)a4
{
  __AXUIElement *axElement;
  AXValueRef v7;
  CGPoint v8;

  v8 = a4;
  if (self->_isValid)
  {
    axElement = self->_axElement;
    if (axElement)
    {
      v7 = AXValueCreate(kAXValueTypeCGPoint, &v8);
      if (AXUIElementSetAttributeValue(axElement, (CFStringRef)a3, v7) == kAXErrorInvalidUIElement)
        -[AXUIElement _invalidate](self, "_invalidate", *(_QWORD *)&v8.x, *(_QWORD *)&v8.y);
      CFRelease(v7);
    }
  }
}

- (void)setAXAttribute:(int64_t)a3 withSize:(CGSize)a4
{
  __AXUIElement *axElement;
  AXValueRef v7;
  CGSize v8;

  v8 = a4;
  if (self->_isValid)
  {
    axElement = self->_axElement;
    if (axElement)
    {
      v7 = AXValueCreate(kAXValueTypeCGSize, &v8);
      if (AXUIElementSetAttributeValue(axElement, (CFStringRef)a3, v7) == kAXErrorInvalidUIElement)
        -[AXUIElement _invalidate](self, "_invalidate", *(_QWORD *)&v8.width, *(_QWORD *)&v8.height);
      CFRelease(v7);
    }
  }
}

- (void)setAXAttribute:(int64_t)a3 withRange:(_NSRange)a4
{
  __AXUIElement *axElement;
  AXValueRef v7;
  _NSRange v8;

  v8 = a4;
  if (self->_isValid)
  {
    axElement = self->_axElement;
    if (axElement)
    {
      v7 = AXValueCreate(kAXValueTypeCFRange, &v8);
      if (AXUIElementSetAttributeValue(axElement, (CFStringRef)a3, v7) == kAXErrorInvalidUIElement)
        -[AXUIElement _invalidate](self, "_invalidate", v8.location, v8.length);
      CFRelease(v7);
    }
  }
}

- (void)setAXAttribute:(int64_t)a3 withUIElement:(id)a4
{
  id v6;
  __AXUIElement *axElement;
  void *v8;
  BOOL v9;
  id v10;

  v6 = a4;
  if (self->_isValid)
  {
    axElement = self->_axElement;
    if (axElement)
    {
      v10 = v6;
      v8 = (void *)objc_opt_class();
      if (objc_msgSend(v8, "isSubclassOfClass:", objc_opt_class()))
      {
        v9 = AXUIElementSetAttributeValue(axElement, (CFStringRef)a3, (CFTypeRef)objc_msgSend(v10, "axElement")) == kAXErrorInvalidUIElement;
        v6 = v10;
        if (!v9)
          goto LABEL_9;
        -[AXUIElement _invalidate](self, "_invalidate");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("SCRCUIElementException"), CFSTR("Passed in SCRCUIElement must be a (subclass of) SCRCUIElement."));
      }
      v6 = v10;
    }
  }
LABEL_9:

}

- (void)setAXAttribute:(int64_t)a3 withUIElementArray:(id)a4
{
  id v6;
  __AXUIElement *axElement;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v6 = a4;
  if (self->_isValid)
  {
    axElement = self->_axElement;
    if (axElement)
    {
      v16 = v6;
      if (objc_msgSend(v6, "count")
        && (objc_msgSend(v16, "objectAtIndex:", 0),
            v8 = (void *)objc_claimAutoreleasedReturnValue(),
            v9 = (void *)objc_opt_class(),
            LODWORD(v9) = objc_msgSend(v9, "isSubclassOfClass:", objc_opt_class()),
            v8,
            !(_DWORD)v9))
      {
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("SCRCUIElementException"), CFSTR("Passed in SCRCUIElement must be a (subclass of) SCRCUIElement."));
      }
      else
      {
        v10 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v16, "count"));
        objc_msgSend(v16, "objectEnumerator");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "nextObject");
        v12 = objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v13 = (void *)v12;
          do
          {
            v14 = objc_msgSend(v13, "axElement");
            if (v14)
              objc_msgSend(v10, "addObject:", v14);
            objc_msgSend(v11, "nextObject");
            v15 = objc_claimAutoreleasedReturnValue();

            v13 = (void *)v15;
          }
          while (v15);
        }
        if (AXUIElementSetAttributeValue(axElement, (CFStringRef)a3, v10) == kAXErrorInvalidUIElement)
          -[AXUIElement _invalidate](self, "_invalidate");

      }
      v6 = v16;
    }
  }

}

- (void)setAXAttribute:(int64_t)a3 withArray:(id)a4
{
  id v6;
  __AXUIElement *axElement;
  AXError v8;
  id v9;

  v6 = a4;
  if (self->_isValid)
  {
    axElement = self->_axElement;
    if (axElement)
    {
      v9 = v6;
      v8 = AXUIElementSetAttributeValue(axElement, (CFStringRef)a3, v6);
      v6 = v9;
      if (v8 == kAXErrorInvalidUIElement)
      {
        -[AXUIElement _invalidate](self, "_invalidate", v9);
        v6 = v9;
      }
    }
  }

}

- (void)setAXAttribute:(int64_t)a3 withObject:(id)a4 synchronous:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  __AXUIElement *axElement;
  void (**v10)(_QWORD);
  void *v11;
  _QWORD v12[4];
  id v13;
  AXUIElement *v14;
  __AXUIElement *v15;
  int64_t v16;

  v5 = a5;
  v8 = a4;
  if (self->_isValid)
  {
    axElement = self->_axElement;
    if (axElement)
    {
      CFRetain(self->_axElement);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __53__AXUIElement_setAXAttribute_withObject_synchronous___block_invoke;
      v12[3] = &unk_1E6919A60;
      v15 = axElement;
      v16 = a3;
      v13 = v8;
      v14 = self;
      v10 = (void (**)(_QWORD))_Block_copy(v12);
      v11 = v10;
      if (v5)
        v10[2](v10);
      else
        dispatch_async((dispatch_queue_t)_ElementChangedQueue, v10);

    }
  }

}

void __53__AXUIElement_setAXAttribute_withObject_synchronous___block_invoke(uint64_t a1)
{
  if (AXUIElementSetAttributeValue(*(AXUIElementRef *)(a1 + 48), *(CFStringRef *)(a1 + 56), *(CFTypeRef *)(a1 + 32)) == kAXErrorInvalidUIElement)
    objc_msgSend(*(id *)(a1 + 40), "_invalidate");
  CFRelease(*(CFTypeRef *)(a1 + 48));
}

- (BOOL)isMockElement
{
  return 0;
}

- (BOOL)isMLElement
{
  return 0;
}

- (void)setAXAttribute:(int64_t)a3 withObject:(id)a4
{
  -[AXUIElement setAXAttribute:withObject:synchronous:](self, "setAXAttribute:withObject:synchronous:", a3, a4, 1);
}

- (_NSRange)_selectedTextRange
{
  NSUInteger v3;
  NSUInteger v4;
  _NSRange result;

  -[AXUIElement updateCache:](self, "updateCache:", 2005);
  v3 = -[AXUIElement rangeWithAXAttribute:](self, "rangeWithAXAttribute:", 2005);
  result.length = v4;
  result.location = v3;
  return result;
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
  -[AXUIElement objectWithAXAttribute:parameter:](self, "objectWithAXAttribute:parameter:", a4, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CFRelease(v7);
  return v8;
}

- (id)_attributedValueForRange:(_NSRange)a3
{
  void *v3;
  id v4;

  -[AXUIElement _objectForRange:withParameterizedAttribute:](self, "_objectForRange:withParameterizedAttribute:", a3.location, a3.length, 92508);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (id)_valueForRange:(_NSRange)a3
{
  void *v3;
  id v4;

  -[AXUIElement _objectForRange:withParameterizedAttribute:](self, "_objectForRange:withParameterizedAttribute:", a3.location, a3.length, 92505);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (int64_t)_lineStartPosition
{
  void *v3;
  int64_t v4;

  -[AXUIElement updateCache:](self, "updateCache:", 4001);
  -[AXUIElement numberWithAXAttribute:](self, "numberWithAXAttribute:", 4001);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (int64_t)_lineEndPosition
{
  void *v3;
  int64_t v4;

  -[AXUIElement updateCache:](self, "updateCache:", 4002);
  -[AXUIElement numberWithAXAttribute:](self, "numberWithAXAttribute:", 4002);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (_NSRange)_lineRangeForPosition:(unint64_t)a3
{
  const __AXValue *v3;
  const __AXValue *v4;
  CFTypeID v5;
  NSUInteger v6;
  NSUInteger v7;
  __int128 v8;
  _NSRange result;

  v8 = xmmword_1B54F0210;
  v3 = -[AXUIElement objectWithAXAttribute:parameter:](self, "objectWithAXAttribute:parameter:", 94009, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3));
  if (v3 && (v4 = v3, v5 = CFGetTypeID(v3), v5 == AXValueGetTypeID()) && AXValueGetType(v4) == kAXValueTypeCFRange)
  {
    AXValueGetValue(v4, kAXValueTypeCFRange, &v8);
    v7 = *((_QWORD *)&v8 + 1);
    v6 = v8;
  }
  else
  {
    v7 = 0;
    v6 = 0x7FFFFFFFLL;
  }
  result.length = v7;
  result.location = v6;
  return result;
}

- (_NSRange)nextCursorRangeInDirection:(unint64_t)a3 unit:(unint64_t)a4 outputRange:(_NSRange *)a5
{
  uint64_t v9;
  uint64_t v10;
  NSUInteger v11;
  NSUInteger v12;
  _NSRange result;

  v9 = -[AXUIElement _selectedTextRange](self, "_selectedTextRange");
  v11 = -[AXUIElement nextCursorRangeInDirection:unit:outputRange:currentCursorRange:](self, "nextCursorRangeInDirection:unit:outputRange:currentCursorRange:", a3, a4, a5, v9, v10);
  result.length = v12;
  result.location = v11;
  return result;
}

- (_NSRange)_lineRangeWithFaultTolerance:(int64_t)a3 forward:(BOOL)a4
{
  _BOOL4 v4;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  NSUInteger v10;
  NSUInteger v11;
  BOOL v12;
  _NSRange result;

  v4 = a4;
  v7 = 0;
  v8 = 0;
  do
  {
    if (v4)
      v9 = v8;
    else
      v9 = v7;
    v10 = -[AXUIElement _lineRangeForPosition:](self, "_lineRangeForPosition:", v9 + a3);
    v12 = v10 != 0x7FFFFFFF || v8++ >= 2;
    --v7;
  }
  while (!v12);
  result.length = v11;
  result.location = v10;
  return result;
}

- (_NSRange)nextCursorRangeInDirection:(unint64_t)a3 unit:(unint64_t)a4 outputRange:(_NSRange *)a5 currentCursorRange:(_NSRange)a6
{
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger length;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSUInteger v17;
  uint64_t v18;
  NSUInteger v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSUInteger v24;
  AXUIElement *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSUInteger v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  _BOOL8 v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSUInteger v45;
  NSUInteger v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  BOOL v51;
  _NSRange result;

  v7 = 0x7FFFFFFFLL;
  if (a6.location == 0x7FFFFFFF)
    v8 = 0x7FFFFFFFLL;
  else
    v8 = a6.location + a6.length;
  if (a6.location == 0x7FFFFFFF)
    length = a6.length;
  else
    length = 0;
  switch(a4)
  {
    case 0uLL:
      -[AXUIElement stringWithAXAttribute:](self, "stringWithAXAttribute:", 2006);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXUIElement _attributedValueForRange:](self, "_attributedValueForRange:", 0, objc_msgSend(v13, "length"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (a3)
      {
        if (!v8 || !objc_msgSend(v14, "length") || v8 - 1 >= objc_msgSend(v15, "length"))
        {
          v23 = v8 - 1;
          v30 = 1;
LABEL_42:

          goto LABEL_43;
        }
        v16 = v15;
        v17 = v8 - 1;
LABEL_41:
        v23 = objc_msgSend(v16, "rangeOfComposedCharacterSequenceAtIndex:", v17);
        v30 = v31;
        goto LABEL_42;
      }
      if (v8 < objc_msgSend(v14, "length"))
      {
        v16 = v15;
        v17 = v8;
        goto LABEL_41;
      }

      v33 = 0x7FFFFFFFLL;
      goto LABEL_65;
    case 1uLL:
      if (v8 >= 0x64)
        v18 = 100;
      else
        v18 = v8;
      v19 = v8 - v18;
      -[AXUIElement _valueForRange:](self, "_valueForRange:", v19, 200);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v13, "ax_wordFromPosition:inDirection:", v18, a3);
      goto LABEL_32;
    case 2uLL:
      if (v8 == 0x7FFFFFFF)
        v8 = 0;
      if (!a3)
      {
        v42 = -[AXUIElement _lineRangeWithFaultTolerance:forward:](self, "_lineRangeWithFaultTolerance:forward:", v8, 1);
        v44 = v42 + v43;
        v7 = 0x7FFFFFFFLL;
        if (v42 + v43 != 0x7FFFFFFF)
        {
          if (length + v8 != v44)
          {
            v47 = -[AXUIElement _lineRangeWithFaultTolerance:forward:](self, "_lineRangeWithFaultTolerance:forward:", v8, 1);
            v51 = v47 == 0x7FFFFFFF;
            if (v47 == 0x7FFFFFFF)
              v30 = 0;
            else
              v30 = v44 - v47;
            goto LABEL_82;
          }
          v24 = v8 + 1;
          v25 = self;
          v26 = 1;
          goto LABEL_69;
        }
LABEL_61:
        v32 = 0;
        goto LABEL_62;
      }
      v22 = -[AXUIElement _lineRangeWithFaultTolerance:forward:](self, "_lineRangeWithFaultTolerance:forward:", v8, 0);
      v7 = 0x7FFFFFFFLL;
      if (v22 == 0x7FFFFFFF)
        goto LABEL_61;
      v23 = v22;
      if (v22 == v8)
      {
        if (!v8)
        {
          v48 = 0;
          v47 = 0x7FFFFFFFLL;
LABEL_79:
          v51 = v47 == 0x7FFFFFFF;
          if (v47 == 0x7FFFFFFF)
            v30 = 0;
          else
            v30 = v48;
LABEL_82:
          if (v51)
            v23 = -1;
          else
            v23 = v47;
          goto LABEL_44;
        }
        v24 = v8 - 1;
        v25 = self;
        v26 = 0;
LABEL_69:
        v47 = -[AXUIElement _lineRangeWithFaultTolerance:forward:](v25, "_lineRangeWithFaultTolerance:forward:", v24, v26);
        goto LABEL_79;
      }
      v49 = -[AXUIElement _lineRangeWithFaultTolerance:forward:](self, "_lineRangeWithFaultTolerance:forward:", v8, 0);
      if (v49 + v50 == 0x7FFFFFFF)
        v30 = 0;
      else
        v30 = v49 + v50 - v23;
      if (v49 + v50 == 0x7FFFFFFF)
        v23 = -1;
LABEL_44:
      v32 = 0;
      v7 = 0x7FFFFFFFLL;
      if (v23 < 0)
      {
LABEL_62:
        v33 = 0x7FFFFFFFLL;
LABEL_63:
        if (!a5)
          goto LABEL_65;
        goto LABEL_64;
      }
      v33 = 0x7FFFFFFFLL;
      if (v23 == 0x7FFFFFFF)
        goto LABEL_63;
      -[AXUIElement _valueForRange:](self, "_valueForRange:", v23, v30);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "length");
      if (a4 == 2 || v35)
      {
        if (a3 || a4 != 2)
        {
          if (a3)
            v41 = 0;
          else
            v41 = v30;
          v33 = v23 + v41;
        }
        else
        {
          v36 = objc_msgSend(v34, "rangeOfString:", CFSTR("\n")) == 0;
          objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "stringByTrimmingCharactersInSet:", v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          v39 = objc_msgSend(v34, "length");
          v40 = v39 - objc_msgSend(v38, "length") - v36;
          if (v40 == v30)
            v40 = 0;
          v33 = v23 + v30 - v40;

        }
      }
      else
      {
        v33 = 0x7FFFFFFFLL;
      }

      v7 = v23;
      v32 = v30;
      if (a5)
      {
LABEL_64:
        a5->location = v7;
        a5->length = v32;
      }
LABEL_65:
      v45 = v33;
      v46 = 0;
      result.length = v46;
      result.location = v45;
      return result;
    case 3uLL:
      if (v8 >= 0x12C)
        v27 = 300;
      else
        v27 = v8;
      v19 = v8 - v27;
      -[AXUIElement _valueForRange:](self, "_valueForRange:", v19, 300);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v13, "ax_sentenceFromPosition:inDirection:", v27, a3);
      goto LABEL_32;
    case 4uLL:
      if (v8 >= 0x7D0)
        v28 = 2000;
      else
        v28 = v8;
      v19 = v8 - v28;
      -[AXUIElement _valueForRange:](self, "_valueForRange:", v19, 2000);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v13, "ax_paragraphFromPosition:inDirection:", v28, a3);
LABEL_32:
      v29 = v20 + v19;
      if (v20 == 0x7FFFFFFF)
        v30 = 0;
      else
        v30 = v21;
      if (v20 == 0x7FFFFFFF)
        v23 = -1;
      else
        v23 = v29;
LABEL_43:

      goto LABEL_44;
    default:
      goto LABEL_61;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedAttributes, 0);
}

@end
