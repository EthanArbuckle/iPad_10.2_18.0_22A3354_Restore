@implementation AXEventTapManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_3);
  return (id)sharedManager_SharedManager;
}

void __34__AXEventTapManager_sharedManager__block_invoke()
{
  AXEventTapManager *v0;
  void *v1;

  v0 = objc_alloc_init(AXEventTapManager);
  v1 = (void *)sharedManager_SharedManager;
  sharedManager_SharedManager = (uint64_t)v0;

}

- (AXEventTapManager)init
{
  AXEventTapManager *v2;
  NSMutableArray *v3;
  NSMutableArray *eventTaps;
  NSMutableArray *v5;
  NSMutableArray *addedEventTapPairs;
  NSMutableSet *v7;
  NSMutableSet *removedEventTapIdentifiers;
  NSRecursiveLock *v9;
  NSRecursiveLock *eventTapLock;
  uint64_t v11;
  NSMutableDictionary *disabledIDMappingRegistry;
  AXEventTapManager *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)AXEventTapManager;
  v2 = -[AXEventTapManager init](&v15, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    eventTaps = v2->_eventTaps;
    v2->_eventTaps = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    addedEventTapPairs = v2->_addedEventTapPairs;
    v2->_addedEventTapPairs = v5;

    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    removedEventTapIdentifiers = v2->_removedEventTapIdentifiers;
    v2->_removedEventTapIdentifiers = v7;

    v9 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E0CB38E0]);
    eventTapLock = v2->_eventTapLock;
    v2->_eventTapLock = v9;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    disabledIDMappingRegistry = v2->_disabledIDMappingRegistry;
    v2->_disabledIDMappingRegistry = (NSMutableDictionary *)v11;

    v13 = v2;
  }

  return v2;
}

- (void)dealloc
{
  __IOHIDEventSystemClient *ioSystemPostBackClient;
  objc_super v4;

  ioSystemPostBackClient = self->_ioSystemPostBackClient;
  if (ioSystemPostBackClient)
  {
    CFRelease(ioSystemPostBackClient);
    self->_ioSystemPostBackClient = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)AXEventTapManager;
  -[AXEventTapManager dealloc](&v4, sel_dealloc);
}

- (id)description
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("AXEventTapManager <%p>. Taps:\n"), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = self->_eventTaps;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v9, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "priority");
        objc_msgSend(v3, "appendFormat:", CFSTR("\t%@. Priority:%d\n"), v10, v11, (_QWORD)v13);

      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v3;
}

- (void)_setHIDEventTapCallback:(void *)a3
{
  void (**installationHIDCallback)(id, void *);

  installationHIDCallback = (void (**)(id, void *))self->_installationHIDCallback;
  if (installationHIDCallback)
    installationHIDCallback[2](installationHIDCallback, a3);
}

- (id)_copyCurrentEventTapPairs
{
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  -[NSRecursiveLock lock](self->_eventTapLock, "lock");
  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__1;
  v10 = __Block_byref_object_dispose__1;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__AXEventTapManager__copyCurrentEventTapPairs__block_invoke;
  v5[3] = &unk_1E24C5090;
  v5[4] = &v6;
  -[AXEventTapManager _enumerateEventTapPairsUsingBlock:](self, "_enumerateEventTapPairsUsingBlock:", v5);
  -[NSRecursiveLock unlock](self->_eventTapLock, "unlock");
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __46__AXEventTapManager__copyCurrentEventTapPairs__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v8 = v3;
  if (!v4)
  {
    v5 = objc_opt_new();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    v3 = v8;
    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  }
  objc_msgSend(v4, "addObject:", v3);

}

- (void)_enumerateEventTapPairsUsingBlock:(id)a3
{
  id v4;
  BOOL isEnumeratingEventTaps;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  NSMutableArray *eventTaps;
  void *v17;
  uint64_t (*v18)(uint64_t, uint64_t, void *);
  _QWORD v19[5];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  char v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  isEnumeratingEventTaps = self->_isEnumeratingEventTaps;
  self->_isEnumeratingEventTaps = 1;
  v28 = 0;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v6 = self->_eventTaps;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v25;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v25 != v9)
        objc_enumerationMutation(v6);
      (*((void (**)(id, _QWORD, _QWORD, char *))v4 + 2))(v4, *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v10), 0, &v28);
      if (v28)
        break;
      if (v8 == ++v10)
      {
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
        if (v8)
          goto LABEL_3;
        break;
      }
    }
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = self->_addedEventTapPairs;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        -[NSMutableArray insertObject:atIndex:](self->_eventTaps, "insertObject:atIndex:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i), 0);
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
    }
    while (v13);
  }

  -[NSMutableArray removeAllObjects](self->_addedEventTapPairs, "removeAllObjects");
  if (-[NSMutableSet count](self->_removedEventTapIdentifiers, "count"))
  {
    eventTaps = self->_eventTaps;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __55__AXEventTapManager__enumerateEventTapPairsUsingBlock___block_invoke;
    v19[3] = &unk_1E24C50B8;
    v19[4] = self;
    -[NSMutableArray indexesOfObjectsPassingTest:](eventTaps, "indexesOfObjectsPassingTest:", v19);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObjectsAtIndexes:](eventTaps, "removeObjectsAtIndexes:", v17);

    -[NSMutableSet removeAllObjects](self->_removedEventTapIdentifiers, "removeAllObjects");
  }
  self->_isEnumeratingEventTaps = isEnumeratingEventTaps;
  if (self->_shouldReorderEventTaps)
    -[AXEventTapManager _reorderEventTaps](self, "_reorderEventTaps");
  if (-[NSMutableArray count](self->_eventTaps, "count"))
    v18 = _axEventTapHIDCallback;
  else
    v18 = 0;
  -[AXEventTapManager _setHIDEventTapCallback:](self, "_setHIDEventTapCallback:", v18);

}

uint64_t __55__AXEventTapManager__enumerateEventTapPairsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

- (void)sendHIDSystemEvent:(id)a3 senderID:(unint64_t)a4
{
  -[AXEventTapManager sendHIDSystemEvent:repostCreatorHIDEvent:senderID:](self, "sendHIDSystemEvent:repostCreatorHIDEvent:senderID:", a3, 0, a4);
}

- (void)sendHIDSystemEvent:(id)a3 repostCreatorHIDEvent:(BOOL)a4 senderID:(unint64_t)a5
{
  _BOOL4 v5;
  id v7;
  uint64_t v8;
  const void *v9;
  const __CFArray *Children;
  const __CFArray *v11;
  unint64_t v12;
  unsigned int IntegerValue;
  uint64_t v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  const void *v21;
  id v22;

  v5 = a4;
  v7 = a3;
  v22 = v7;
  if (!self->_ioSystemPostBackClient)
  {
    self->_ioSystemPostBackClient = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreate();
    v7 = v22;
  }
  v8 = objc_msgSend(v7, "newHIDEventRef");
  if (v8)
  {
    v9 = (const void *)v8;
    Children = (const __CFArray *)IOHIDEventGetChildren();
    if (Children)
    {
      v11 = Children;
      if (CFArrayGetCount(Children) >= 1)
      {
        v12 = 0;
        while (1)
        {
          CFArrayGetValueAtIndex(v11, v12);
          IntegerValue = IOHIDEventGetIntegerValue();
          v14 = IOHIDEventGetIntegerValue();
          if (((v14 == 0) & (IntegerValue >> 1)) == 0 && !v14)
            break;
          if ((uint64_t)++v12 >= CFArrayGetCount(v11))
            goto LABEL_13;
        }
        objc_msgSend(v22, "handInfo");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "paths");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "count");

        if (v12 < v17)
        {
          objc_msgSend(v22, "handInfo");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "paths");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "objectAtIndex:", v12);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setShouldSetTouchFlag:", 1);

        }
      }
    }
LABEL_13:
    CFRelease(v9);
  }
  if (v5)
  {
    v21 = (const void *)objc_msgSend(v22, "creatorHIDEvent");
    CFRetain(v21);
  }
  else
  {
    v21 = (const void *)objc_msgSend(v22, "newHIDEventRef");
  }
  objc_msgSend(v22, "type");
  if (v21)
  {
    IOHIDEventSetSenderID();
    IOHIDEventSystemClientDispatchEvent();
    CFRelease(v21);
  }
  else
  {
    _AXAssert();
  }

}

- (void)sendEvent:(id)a3 afterTap:(id)a4 useGSEvent:(BOOL)a5 namedTaps:(id)a6 options:(unint64_t)a7
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  int v22;
  uint64_t (**v23)(_QWORD, _QWORD);
  int v24;
  void (**installationEventRepPost)(id, id);
  AXEventTapManager *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v27 = a3;
  v10 = a4;
  v11 = a6;
  v26 = self;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v12 = -[AXEventTapManager _copyCurrentEventTapPairs](self, "_copyCurrentEventTapPairs");
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v13)
  {
    v14 = v13;
    v15 = v10 == 0;
    v16 = *(_QWORD *)v29;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v29 != v16)
          objc_enumerationMutation(v12);
        v18 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v17);
        if (v10
          && (objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v17), "identifier"),
              v19 = (void *)objc_claimAutoreleasedReturnValue(),
              v20 = objc_msgSend(v19, "isEqualToString:", v10),
              v19,
              (v20 & 1) != 0))
        {
          v15 = 1;
        }
        else if (v15
               || (objc_msgSend(v18, "identifier"),
                   v21 = (void *)objc_claimAutoreleasedReturnValue(),
                   v22 = objc_msgSend(v11, "containsObject:", v21),
                   v21,
                   v22))
        {
          if (!objc_msgSend(v18, "type"))
          {
            objc_msgSend(v18, "handler");
            v23 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
            v24 = ((uint64_t (**)(_QWORD, id))v23)[2](v23, v27);

            if (v24)
            {

              goto LABEL_19;
            }
          }
        }
        else
        {
          v15 = 0;
        }
        ++v17;
      }
      while (v14 != v17);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v14);
  }

  installationEventRepPost = (void (**)(id, id))v26->_installationEventRepPost;
  if (installationEventRepPost)
    installationEventRepPost[2](installationEventRepPost, v27);
LABEL_19:

}

- (void)_handleTestIOHIDEvent:(__IOHIDEvent *)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t (**v11)(_QWORD, _QWORD);
  char v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  +[AXEventRepresentation representationWithHIDEvent:hidStreamIdentifier:clientID:taskPort:](AXEventRepresentation, "representationWithHIDEvent:hidStreamIdentifier:clientID:taskPort:", a3, CFSTR("AXEventTapManager"), 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = -[AXEventTapManager _copyCurrentEventTapPairs](self, "_copyCurrentEventTapPairs");
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
      if (objc_msgSend(v10, "type", (_QWORD)v13))
      {
        objc_msgSend(v10, "handler");
        v11 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v12 = ((uint64_t (**)(_QWORD, void *))v11)[2](v11, v4);
        objc_msgSend(v10, "identifier");

        if ((v12 & 1) != 0)
          break;
      }
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (BOOL)_processHIDEvent:(__IOHIDEvent *)a3 taskPort:(unsigned int)a4 bundleId:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t (**v16)(_QWORD, _QWORD);
  char v17;
  BOOL v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  +[AXEventRepresentation representationWithHIDEvent:hidStreamIdentifier:clientID:taskPort:](AXEventRepresentation, "representationWithHIDEvent:hidStreamIdentifier:clientID:taskPort:", a3, CFSTR("AXEventTapManager"), a5, *(_QWORD *)&a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (AXEventTypeIsTouch(objc_msgSend(v6, "type"))
    && (objc_msgSend(v6, "handInfo"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "paths"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "indexOfObjectPassingTest:", &__block_literal_global_123),
        v8,
        v7,
        v9 != 0x7FFFFFFFFFFFFFFFLL))
  {
    v18 = 1;
  }
  else
  {
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v10 = -[AXEventTapManager _copyCurrentEventTapPairs](self, "_copyCurrentEventTapPairs");
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v21 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          if (!objc_msgSend(v15, "type", (_QWORD)v20))
          {
            objc_msgSend(v15, "handler");
            v16 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
            v17 = ((uint64_t (**)(_QWORD, void *))v16)[2](v16, v6);
            objc_msgSend(v15, "identifier");

            if ((v17 & 1) != 0)
            {
              v18 = 0;
              goto LABEL_14;
            }
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v12)
          continue;
        break;
      }
    }
    v18 = 1;
LABEL_14:

  }
  return v18;
}

BOOL __56__AXEventTapManager__processHIDEvent_taskPort_bundleId___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pathIndex") > 0x12;
}

- (void)_reorderEventTaps
{
  BOOL v3;

  if (self->_isEnumeratingEventTaps)
  {
    v3 = 1;
  }
  else
  {
    -[NSMutableArray sortUsingComparator:](self->_eventTaps, "sortUsingComparator:", &__block_literal_global_125);
    v3 = 0;
  }
  self->_shouldReorderEventTaps = v3;
}

uint64_t __38__AXEventTapManager__reorderEventTaps__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;

  v4 = a3;
  v5 = objc_msgSend(a2, "priority");
  v6 = objc_msgSend(v4, "priority");

  v7 = -1;
  if (v6 >= v5)
    v7 = 1;
  if (v6 == v5)
    return 0;
  else
    return v7;
}

- (void)setFailedToProcessInTimeCallback:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, uint64_t, _BYTE *);
  void *v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  -[NSRecursiveLock lock](self->_eventTapLock, "lock");
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __63__AXEventTapManager_setFailedToProcessInTimeCallback_callback___block_invoke;
  v13 = &unk_1E24C5160;
  v14 = v6;
  v15 = v7;
  v8 = v7;
  v9 = v6;
  -[AXEventTapManager _enumerateEventTapPairsUsingBlock:](self, "_enumerateEventTapPairsUsingBlock:", &v10);
  -[NSRecursiveLock unlock](self->_eventTapLock, "unlock", v10, v11, v12, v13);

}

void __63__AXEventTapManager_setFailedToProcessInTimeCallback_callback___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v7)
  {
    objc_msgSend(v8, "setFailedToHandleInTime:", *(_QWORD *)(a1 + 40));
    *a4 = 1;
  }

}

- (void)setEventTapPriority:(id)a3 priority:(int)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  AXEventTapManager *v10;
  int v11;

  v6 = a3;
  -[NSRecursiveLock lock](self->_eventTapLock, "lock");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__AXEventTapManager_setEventTapPriority_priority___block_invoke;
  v8[3] = &unk_1E24C5188;
  v9 = v6;
  v10 = self;
  v11 = a4;
  v7 = v6;
  -[AXEventTapManager _enumerateEventTapPairsUsingBlock:](self, "_enumerateEventTapPairsUsingBlock:", v8);
  -[AXEventTapManager _reorderEventTaps](self, "_reorderEventTaps");
  -[NSRecursiveLock unlock](self->_eventTapLock, "unlock");

}

void __50__AXEventTapManager_setEventTapPriority_priority___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 40), "_setEventTapPriority:priority:", v8, *(unsigned int *)(a1 + 48));
    *a4 = 1;
  }

}

- (BOOL)_accessibilityShouldIgnoreHIDServiceForContinuity:(__IOHIDServiceClient *)a3
{
  _BOOL4 v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = -[AXEventTapManager ignoreEventsForContinuitySession](self, "ignoreEventsForContinuitySession");
  LOBYTE(v6) = 0;
  if (a3 && v5)
  {
    IOHIDServiceClientGetRegistryID(a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[AXEventTapManager disabledIDMappingRegistry](self, "disabledIDMappingRegistry");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        LOBYTE(v6) = objc_msgSend(v9, "BOOLValue");
      }
      else
      {
        v11 = (void *)IOHIDServiceClientCopyProperty(a3, CFSTR("DisableAccessibilityEventTranslation"));
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v6 = objc_msgSend(v11, "BOOLValue");
        else
          v6 = 0;
        -[AXEventTapManager disabledIDMappingRegistry](self, "disabledIDMappingRegistry");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKey:", v13, v7);

      }
    }
    else
    {
      AXLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[AXEventTapManager _accessibilityShouldIgnoreHIDServiceForContinuity:].cold.1((uint64_t)v7, v10);

      LOBYTE(v6) = 0;
    }

  }
  return v6;
}

- (void)_setEventTapPriority:(id)a3 priority:(int)a4
{
  uint64_t v4;
  id v5;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  objc_msgSend(v5, "setPriority:", v4);
  if (objc_msgSend(v5, "type") == 1)
  {
    if (!objc_msgSend(v5, "systemClient"))
      _AXAssert();
    objc_msgSend(v5, "systemClient");
    IOHIDEventSystemClientRegisterEventFilterCallbackWithPriority();
  }

}

- (void)_installEventTap:(id)a3 skipDeviceMatching:(BOOL)a4 filterEvents:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v6 = a4;
  v14 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  AXLogCommon();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412290;
    v13 = v11;
    _os_log_impl(&dword_18C62B000, v10, OS_LOG_TYPE_DEFAULT, "Installing event filter for: %@", (uint8_t *)&v12, 0xCu);

  }
  if (objc_msgSend(v8, "type") == 1)
    -[AXEventTapManager _installHIDFilter:skipDeviceMatching:filterEvents:](self, "_installHIDFilter:skipDeviceMatching:filterEvents:", v8, v6, v9);
  else
    -[AXEventTapManager _installSystemEventTap:](self, "_installSystemEventTap:", v8);

}

- (id)_hidFilterListForPair:(id)a3 filterEvents:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  _QWORD v83[2];
  _QWORD v84[2];
  _QWORD v85[2];
  _QWORD v86[2];
  _QWORD v87[2];
  _QWORD v88[2];
  _QWORD v89[2];
  _QWORD v90[2];
  _QWORD v91[2];
  _QWORD v92[2];
  _QWORD v93[2];
  _QWORD v94[2];
  _QWORD v95[2];
  _QWORD v96[2];
  _QWORD v97[2];
  _QWORD v98[2];
  _QWORD v99[2];
  _QWORD v100[2];
  _QWORD v101[2];
  _QWORD v102[2];
  _QWORD v103[2];
  _QWORD v104[2];
  _QWORD v105[2];
  _QWORD v106[2];
  _QWORD v107[2];
  _QWORD v108[2];
  _QWORD v109[2];
  _QWORD v110[2];
  void *v111;
  void *v112;
  _QWORD v113[2];
  _QWORD v114[2];
  _QWORD v115[2];
  _QWORD v116[2];
  _QWORD v117[2];
  _QWORD v118[2];
  _QWORD v119[2];
  _QWORD v120[2];
  _QWORD v121[2];
  _QWORD v122[2];
  _QWORD v123[2];
  _QWORD v124[2];
  _QWORD v125[2];
  _QWORD v126[2];
  _QWORD v127[2];
  _QWORD v128[2];
  _QWORD v129[2];
  _QWORD v130[2];
  _QWORD v131[2];
  _QWORD v132[4];

  v132[2] = *MEMORY[0x1E0C80C00];
  v4 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "wantsDigitizerEvents"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "DeviceUsagePage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v131[0] = v6;
    v132[0] = &unk_1E24F7748;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "DeviceUsage");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v131[1] = v7;
    v132[1] = &unk_1E24F7760;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v132, v131, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v8);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "DeviceUsagePage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v129[0] = v9;
    v130[0] = &unk_1E24F7748;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "DeviceUsage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v129[1] = v10;
    v130[1] = &unk_1E24F7778;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v130, v129, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v11);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "DeviceUsagePage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v127[0] = v12;
    v128[0] = &unk_1E24F7748;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "DeviceUsage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v127[1] = v13;
    v128[1] = &unk_1E24F7790;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v128, v127, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v14);

    +[AXSettings sharedInstance](AXSettings, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v13) = objc_msgSend(v15, "automationTrueTouch");

    if ((_DWORD)v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "DeviceUsagePage");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v125[0] = v16;
      v126[0] = &unk_1E24F7748;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "DeviceUsage");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v125[1] = v17;
      v126[1] = &unk_1E24F77A8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v126, v125, 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v18);

    }
  }
  if (objc_msgSend(v4, "wantsKeyboardEvents"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "DeviceUsagePage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v123[0] = v19;
    v124[0] = &unk_1E24F77C0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "DeviceUsage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v123[1] = v20;
    v124[1] = &unk_1E24F77D8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v124, v123, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v21);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "DeviceUsagePage");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v121[0] = v22;
    v122[0] = &unk_1E24F77C0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "DeviceUsage");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v121[1] = v23;
    v122[1] = &unk_1E24F77F0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v122, v121, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v24);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "DeviceUsagePage");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v119[0] = v25;
    v120[0] = &unk_1E24F77C0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "DeviceUsage");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v119[1] = v26;
    v120[1] = &unk_1E24F7808;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v120, v119, 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v27);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "DeviceUsagePage");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v117[0] = v28;
    v118[0] = &unk_1E24F77D8;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "DeviceUsage");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v117[1] = v29;
    v118[1] = &unk_1E24F7820;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v118, v117, 2);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v30);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "DeviceUsagePage");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v115[0] = v31;
    v116[0] = &unk_1E24F7838;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "DeviceUsage");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v115[1] = v32;
    v116[1] = &unk_1E24F7820;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v116, v115, 2);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v33);

    if (AXDeviceIsAudioAccessory())
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "DeviceUsagePage");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v113[0] = v34;
      v114[0] = &unk_1E24F7760;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "DeviceUsage");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v113[1] = v35;
      v114[1] = &unk_1E24F77D8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v114, v113, 2);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v36);

    }
    if ((AXDeviceIsWatch() & 1) != 0 || _AXSMossdeepEnabled())
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "DeviceUsagePage");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v111 = v37;
      v112 = &unk_1E24F7850;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v112, &v111, 1);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v38);

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "DeviceUsagePage");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v109[0] = v39;
    v110[0] = &unk_1E24F7868;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "DeviceUsage");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v109[1] = v40;
    v110[1] = &unk_1E24F7808;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v110, v109, 2);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v41);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "DeviceUsagePage");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v107[0] = v42;
    v108[0] = &unk_1E24F7868;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "DeviceUsage");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v107[1] = v43;
    v108[1] = &unk_1E24F7820;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v108, v107, 2);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v44);

  }
  if (objc_msgSend(v4, "wantsLisaEvents"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "DeviceUsagePage");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v105[0] = v45;
    v106[0] = &unk_1E24F7880;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "DeviceUsage");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v105[1] = v46;
    v106[1] = &unk_1E24F77D8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v106, v105, 2);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v47);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "DeviceUsagePage");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v103[0] = v48;
    v104[0] = &unk_1E24F77D8;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "DeviceUsage");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v103[1] = v49;
    v104[1] = &unk_1E24F7898;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v104, v103, 2);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v50);

  }
  if (objc_msgSend(v4, "wantsATVRemoteEvents"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "DeviceUsagePage");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v101[0] = v51;
    v102[0] = &unk_1E24F77D8;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "DeviceUsage");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v101[1] = v52;
    v102[1] = &unk_1E24F78B0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v102, v101, 2);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v53);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "DeviceUsagePage");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v99[0] = v54;
    v100[0] = &unk_1E24F77D8;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "DeviceUsage");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v99[1] = v55;
    v100[1] = &unk_1E24F78C8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v100, v99, 2);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v56);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "DeviceUsagePage");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v97[0] = v57;
    v98[0] = &unk_1E24F77D8;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "DeviceUsage");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v97[1] = v58;
    v98[1] = &unk_1E24F78E0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v98, v97, 2);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v59);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "DeviceUsagePage");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v95[0] = v60;
    v96[0] = &unk_1E24F77D8;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "DeviceUsage");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v95[1] = v61;
    v96[1] = &unk_1E24F78F8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v96, v95, 2);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v62);

  }
  if (objc_msgSend(v4, "wantsMouseEvents"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "DeviceUsagePage");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v93[0] = v63;
    v94[0] = &unk_1E24F77D8;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "DeviceUsage");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v93[1] = v64;
    v94[1] = &unk_1E24F77F0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v94, v93, 2);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v65);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "DeviceUsagePage");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v91[0] = v66;
    v92[0] = &unk_1E24F77D8;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "DeviceUsage");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v91[1] = v67;
    v92[1] = &unk_1E24F77D8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v92, v91, 2);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v68);

    +[AXSettings sharedInstance](AXSettings, "sharedInstance");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v67) = objc_msgSend(v69, "laserEnabled");

    if ((_DWORD)v67)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "DeviceUsagePage");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v89[0] = v70;
      v90[0] = &unk_1E24F7748;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "DeviceUsage");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v89[1] = v71;
      v90[1] = &unk_1E24F7760;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v90, v89, 2);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v72);

    }
  }
  if (objc_msgSend(v4, "wantsStylusEvents"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "DeviceUsagePage");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v87[0] = v73;
    v88[0] = &unk_1E24F7748;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "DeviceUsage");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v87[1] = v74;
    v88[1] = &unk_1E24F7778;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v88, v87, 2);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v75);

  }
  if (objc_msgSend(v4, "wantsAccessibilityEvents"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "DeviceUsagePage");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v85[0] = v76;
    v86[0] = &unk_1E24F7910;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "DeviceUsage");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v85[1] = v77;
    v86[1] = &unk_1E24F7928;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v86, v85, 2);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v78);

  }
  if (objc_msgSend(v4, "wantsVolumeButtonEvents"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "DeviceUsagePage");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v84[0] = &unk_1E24F7850;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "DeviceUsage", v79);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v83[1] = v80;
    v84[1] = &unk_1E24F77D8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v84, v83, 2);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v81);

  }
  return v5;
}

- (void)_installHIDFilter:(id)a3 skipDeviceMatching:(BOOL)a4 filterEvents:(id)a5
{
  id v8;
  id v9;
  __IOHIDEventSystemClient *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (**v20)(_QWORD, _QWORD);
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t, uint64_t, uint64_t);
  void *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (!objc_msgSend(v8, "systemClient"))
  {
    v10 = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreate();
    CFRunLoopGetCurrent();
    IOHIDEventSystemClientScheduleWithRunLoop();
    if (!a4)
    {
      -[AXEventTapManager _hidFilterListForPair:filterEvents:](self, "_hidFilterListForPair:filterEvents:", v8, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v11, "count") < 2)
      {
        if (objc_msgSend(v11, "count") == 1)
        {
          objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          IOHIDEventSystemClientSetMatching();

        }
      }
      else
      {
        IOHIDEventSystemClientSetMatchingMultiple();
      }
      objc_msgSend(v8, "matchingServiceHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        v21 = v11;
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v14 = IOHIDEventSystemClientCopyServices(v10);
        v15 = -[__CFArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v28;
          do
          {
            v18 = 0;
            do
            {
              if (*(_QWORD *)v28 != v17)
                objc_enumerationMutation(v14);
              v19 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v18);
              objc_msgSend(v8, "matchingServiceHandler", v21);
              v20 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
              v20[2](v20, v19);

              ++v18;
            }
            while (v16 != v18);
            v16 = -[__CFArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
          }
          while (v16);
        }

        v22 = MEMORY[0x1E0C809B0];
        v23 = 3221225472;
        v24 = __71__AXEventTapManager__installHIDFilter_skipDeviceMatching_filterEvents___block_invoke;
        v25 = &unk_1E24C51B0;
        v26 = v8;
        IOHIDEventSystemClientRegisterDeviceMatchingBlock();

        v11 = v21;
      }

    }
    objc_msgSend(v8, "setSystemClient:", v10, v21, v22, v23, v24, v25);
    if (v10)
      CFRelease(v10);
    -[NSRecursiveLock lock](self->_eventTapLock, "lock");
    -[NSMutableArray insertObject:atIndex:](self->_eventTaps, "insertObject:atIndex:", v8, 0);
    -[NSRecursiveLock unlock](self->_eventTapLock, "unlock");
  }

}

void __71__AXEventTapManager__installHIDFilter_skipDeviceMatching_filterEvents___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void (**v5)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "matchingServiceHandler");
  v5 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
  v5[2](v5, a4);

}

- (void)_installSystemEventTap:(id)a3
{
  NSRecursiveLock *eventTapLock;
  id v5;

  eventTapLock = self->_eventTapLock;
  v5 = a3;
  -[NSRecursiveLock lock](eventTapLock, "lock");
  if (self->_isEnumeratingEventTaps)
  {
    -[NSMutableArray addObject:](self->_addedEventTapPairs, "addObject:", v5);

  }
  else
  {
    -[NSMutableArray insertObject:atIndex:](self->_eventTaps, "insertObject:atIndex:", v5, 0);

    if (-[NSMutableArray count](self->_eventTaps, "count") == 1)
      -[AXEventTapManager _setHIDEventTapCallback:](self, "_setHIDEventTapCallback:", _axEventTapHIDCallback);
  }
  -[AXEventTapManager _reorderEventTaps](self, "_reorderEventTaps");
  -[NSRecursiveLock unlock](self->_eventTapLock, "unlock");
}

- (id)installEventTap:(id)a3 identifier:(id)a4 type:(int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v5 = *(_QWORD *)&a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_opt_new();
  -[AXEventTapManager installEventTap:identifier:type:skipDeviceMatching:filterEvents:matchingServiceHandler:](self, "installEventTap:identifier:type:skipDeviceMatching:filterEvents:matchingServiceHandler:", v9, v8, v5, 0, v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)installEventTap:(id)a3 identifier:(id)a4 type:(int)a5 skipDeviceMatching:(BOOL)a6 filterEvents:(id)a7 matchingServiceHandler:(id)a8
{
  _BOOL8 v10;
  uint64_t v11;
  id v14;
  id v15;
  id v16;
  id v17;
  AXEventTapPair *v18;
  const __CFAllocator *v19;
  const __CFUUID *v20;
  __CFString *v21;
  void *v22;

  v10 = a6;
  v11 = *(_QWORD *)&a5;
  v14 = a4;
  v15 = a7;
  v16 = a8;
  v17 = a3;
  v18 = objc_alloc_init(AXEventTapPair);
  -[AXEventTapPair setHandler:](v18, "setHandler:", v17);

  -[AXEventTapPair setMatchingServiceHandler:](v18, "setMatchingServiceHandler:", v16);
  -[AXEventTapPair setType:](v18, "setType:", v11);
  v19 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v20 = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  if (v14)
  {
    -[AXEventTapPair setIdentifier:](v18, "setIdentifier:", v14);
  }
  else
  {
    v21 = (__CFString *)CFUUIDCreateString(v19, v20);
    -[AXEventTapPair setIdentifier:](v18, "setIdentifier:", v21);

  }
  -[AXEventTapPair setPriority:](v18, "setPriority:", 30);
  if (v20)
    CFRelease(v20);
  -[AXEventTapManager _installEventTap:skipDeviceMatching:filterEvents:](self, "_installEventTap:skipDeviceMatching:filterEvents:", v18, v10, v15);
  -[AXEventTapPair identifier](v18, "identifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (id)installKeyboardEventTap:(id)a3 identifier:(id)a4 matchingServiceHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "setWantsKeyboardEvents:", 1);
  -[AXEventTapManager installEventTap:identifier:type:skipDeviceMatching:filterEvents:matchingServiceHandler:](self, "installEventTap:identifier:type:skipDeviceMatching:filterEvents:matchingServiceHandler:", v10, v9, 1, 0, v11, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)removeEventTap:(id)a3
{
  id v4;
  NSMutableArray *eventTaps;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  AXEventTapManager *v10;

  v4 = a3;
  if (v4)
  {
    v7 = v4;
    -[NSRecursiveLock lock](self->_eventTapLock, "lock");
    if (self->_isEnumeratingEventTaps)
    {
      -[NSMutableSet addObject:](self->_removedEventTapIdentifiers, "addObject:", v7);
    }
    else
    {
      eventTaps = self->_eventTaps;
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __36__AXEventTapManager_removeEventTap___block_invoke;
      v8[3] = &unk_1E24C51D8;
      v9 = v7;
      v10 = self;
      -[NSMutableArray indexesOfObjectsPassingTest:](eventTaps, "indexesOfObjectsPassingTest:", v8);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray removeObjectsAtIndexes:](eventTaps, "removeObjectsAtIndexes:", v6);

      if (!-[NSMutableArray count](self->_eventTaps, "count"))
        -[AXEventTapManager _setHIDEventTapCallback:](self, "_setHIDEventTapCallback:", 0);

    }
    -[AXEventTapManager _reorderEventTaps](self, "_reorderEventTaps");
    -[NSRecursiveLock unlock](self->_eventTapLock, "unlock");
    v4 = v7;
  }

}

uint64_t __36__AXEventTapManager_removeEventTap___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  uint64_t v8;

  v6 = a2;
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if ((_DWORD)v8)
  {
    *a4 = 1;
    objc_msgSend(*(id *)(a1 + 40), "_removeHIDEventTapFilter:", v6);
  }

  return v8;
}

- (void)_removeHIDEventTapFilter:(id)a3
{
  id v3;

  v3 = a3;
  if (objc_msgSend(v3, "systemClient"))
  {
    if (objc_msgSend(v3, "type") != 1)
      _AXAssert();
    objc_msgSend(v3, "systemClient");
    IOHIDEventSystemClientUnregisterEventFilterCallback();
    objc_msgSend(v3, "systemClient");
    CFRunLoopGetCurrent();
    IOHIDEventSystemClientUnscheduleWithRunLoop();
  }

}

- (void)runMatchingServiceHandlerForEventTap:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = -[AXEventTapManager _copyCurrentEventTapPairs](self, "_copyCurrentEventTapPairs");
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v10, "identifier", (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", v4);

        if (v12)
        {
          -[AXEventTapManager _runMatchingServiceHandler:](self, "_runMatchingServiceHandler:", v10);
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

}

- (void)_runMatchingServiceHandler:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  const __CFArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (**v12)(_QWORD, _QWORD);
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "matchingServiceHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    _AXAssert();
  objc_msgSend(v3, "matchingServiceHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = IOHIDEventSystemClientCopyServices((IOHIDEventSystemClientRef)objc_msgSend(v3, "systemClient"));
    v7 = -[__CFArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
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
          v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10);
          objc_msgSend(v3, "matchingServiceHandler", (_QWORD)v13);
          v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          v12[2](v12, v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = -[__CFArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
}

- (id)installationGSCallback
{
  return self->_installationGSCallback;
}

- (void)setInstallationGSCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)installationHIDCallback
{
  return self->_installationHIDCallback;
}

- (void)setInstallationHIDCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)installationEventRepPost
{
  return self->_installationEventRepPost;
}

- (void)setInstallationEventRepPost:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)ignoreEventsForContinuitySession
{
  return self->_ignoreEventsForContinuitySession;
}

- (void)setIgnoreEventsForContinuitySession:(BOOL)a3
{
  self->_ignoreEventsForContinuitySession = a3;
}

- (NSMutableDictionary)disabledIDMappingRegistry
{
  return self->_disabledIDMappingRegistry;
}

- (void)setDisabledIDMappingRegistry:(id)a3
{
  objc_storeStrong((id *)&self->_disabledIDMappingRegistry, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disabledIDMappingRegistry, 0);
  objc_storeStrong(&self->_installationEventRepPost, 0);
  objc_storeStrong((id *)&self->_eventTapLock, 0);
  objc_storeStrong(&self->_installationHIDCallback, 0);
  objc_storeStrong(&self->_installationGSCallback, 0);
  objc_storeStrong((id *)&self->_removedEventTapIdentifiers, 0);
  objc_storeStrong((id *)&self->_addedEventTapPairs, 0);
  objc_storeStrong((id *)&self->_eventTaps, 0);
}

- (void)_accessibilityShouldIgnoreHIDServiceForContinuity:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[AXEventTapManager _accessibilityShouldIgnoreHIDServiceForContinuity:]";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_18C62B000, a2, OS_LOG_TYPE_ERROR, "%s: hidServiceClientRegistryIDNum is not NSNumber: %@", (uint8_t *)&v2, 0x16u);
}

@end
