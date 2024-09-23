@implementation FigDisplayMirroringChangeObserver

- (FigDisplayMirroringChangeObserver)init
{
  FigDisplayMirroringChangeObserver *v2;
  NSMutableSet *v3;
  uint64_t v4;
  _QWORD block[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FigDisplayMirroringChangeObserver;
  v2 = -[FigDisplayMirroringChangeObserver init](&v7, sel_init);
  if (v2)
  {
    v2->_clonedDisplays = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v4 = MEMORY[0x1E0C809B0];
    v2->_cloningSupportedDisplays = v3;
    v2->_baseDisplayList = 0;
    block[0] = v4;
    block[1] = 3221225472;
    block[2] = __41__FigDisplayMirroringChangeObserver_init__block_invoke;
    block[3] = &unk_1E2F88548;
    block[4] = v2;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    v2->_player = 0;
    v2->_callback = 0;
    v2->_weakCallbackContext = 0;
  }
  return v2;
}

uint64_t __41__FigDisplayMirroringChangeObserver_init__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = (void *)objc_msgSend(MEMORY[0x1E0CD2728], "displays", 0);
  result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        objc_msgSend(v7, "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 32), CFSTR("cloned"), 4, 0);
        objc_msgSend(v7, "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 32), CFSTR("cloningSupported"), 4, 0);
        ++v6;
      }
      while (v4 != v6);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      v4 = result;
    }
    while (result);
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 40) = 1;
  return result;
}

- (FigDisplayMirroringChangeObserver)initWithPlayer:(OpaqueFigPlayer *)a3
{
  FigDisplayMirroringChangeObserver *result;

  result = -[FigDisplayMirroringChangeObserver init](self, "init");
  if (result)
    result->_player = a3;
  return result;
}

- (FigDisplayMirroringChangeObserver)initWithCallback:(void *)a3 context:(void *)a4
{
  FigDisplayMirroringChangeObserver *v6;
  FigDisplayMirroringChangeObserver *v7;

  v6 = -[FigDisplayMirroringChangeObserver init](self, "init");
  v7 = v6;
  if (v6)
  {
    v6->_callback = a3;
    if (a4)
      v6->_weakCallbackContext = (OpaqueFigCFWeakReferenceHolder *)FigCFWeakReferenceHolderCreateWithReferencedObject();
  }
  return v7;
}

- (void)removeObserversOnCADisplays
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__FigDisplayMirroringChangeObserver_removeObserversOnCADisplays__block_invoke;
  block[3] = &unk_1E2F88548;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __64__FigDisplayMirroringChangeObserver_removeObserversOnCADisplays__block_invoke(uint64_t result)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(*(_QWORD *)(result + 32) + 40))
  {
    v1 = result;
    v9 = 0u;
    v10 = 0u;
    v7 = 0u;
    v8 = 0u;
    v2 = (void *)objc_msgSend(MEMORY[0x1E0CD2728], "displays", 0);
    result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    if (result)
    {
      v3 = result;
      v4 = *(_QWORD *)v8;
      do
      {
        v5 = 0;
        do
        {
          if (*(_QWORD *)v8 != v4)
            objc_enumerationMutation(v2);
          v6 = *(void **)(*((_QWORD *)&v7 + 1) + 8 * v5);
          objc_msgSend(v6, "removeObserver:forKeyPath:", *(_QWORD *)(v1 + 32), CFSTR("cloned"));
          objc_msgSend(v6, "removeObserver:forKeyPath:", *(_QWORD *)(v1 + 32), CFSTR("cloningSupported"));
          ++v5;
        }
        while (v3 != v5);
        result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
        v3 = result;
      }
      while (result);
    }
    *(_BYTE *)(*(_QWORD *)(v1 + 32) + 40) = 0;
  }
  return result;
}

- (void)dealloc
{
  OpaqueFigCFWeakReferenceHolder *weakCallbackContext;
  objc_super v4;

  weakCallbackContext = self->_weakCallbackContext;
  if (weakCallbackContext)
  {
    CFRelease(weakCallbackContext);
    self->_weakCallbackContext = 0;
  }

  v4.receiver = self;
  v4.super_class = (Class)FigDisplayMirroringChangeObserver;
  -[FigDisplayMirroringChangeObserver dealloc](&v4, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  NSMutableSet *clonedDisplays;
  char v10;
  char v11;
  _QWORD v12[7];
  char v13;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("cloned"), a4, a5, a6))
  {
    clonedDisplays = self->_clonedDisplays;
    v10 = objc_msgSend(a4, "isCloned");
  }
  else
  {
    if (!objc_msgSend(a3, "isEqualToString:", CFSTR("cloningSupported")))
      return;
    clonedDisplays = self->_cloningSupportedDisplays;
    v10 = objc_msgSend(a4, "isCloningSupported");
  }
  v11 = v10;
  if (clonedDisplays)
  {
    if (FigDisplayMirroringGetAccessQueue_sFigDisplayMirroringOnce != -1)
      dispatch_once(&FigDisplayMirroringGetAccessQueue_sFigDisplayMirroringOnce, &__block_literal_global_24);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __84__FigDisplayMirroringChangeObserver_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v12[3] = &unk_1E2F8CAE8;
    v13 = v11;
    v12[4] = clonedDisplays;
    v12[5] = a4;
    v12[6] = self;
    dispatch_async((dispatch_queue_t)FigDisplayMirroringGetAccessQueue_sFigDisplayMirroringAccessQueue, v12);
  }
}

uint64_t __84__FigDisplayMirroringChangeObserver_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  uint64_t v4;

  v2 = *(unsigned __int8 *)(a1 + 56);
  v3 = *(void **)(a1 + 32);
  v4 = objc_msgSend(*(id *)(a1 + 40), "name");
  if (v2)
    objc_msgSend(v3, "addObject:", v4);
  else
    objc_msgSend(v3, "removeObject:", v4);
  return objc_msgSend(*(id *)(a1 + 48), "updatePlayerDisplayList");
}

- (void)setBaseDisplayList:(id)a3
{
  _QWORD v5[6];

  if (FigDisplayMirroringGetAccessQueue_sFigDisplayMirroringOnce != -1)
    dispatch_once(&FigDisplayMirroringGetAccessQueue_sFigDisplayMirroringOnce, &__block_literal_global_24);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__FigDisplayMirroringChangeObserver_setBaseDisplayList___block_invoke;
  v5[3] = &unk_1E2F8AEF0;
  v5[4] = a3;
  v5[5] = self;
  dispatch_sync((dispatch_queue_t)FigDisplayMirroringGetAccessQueue_sFigDisplayMirroringAccessQueue, v5);
}

uint64_t __56__FigDisplayMirroringChangeObserver_setBaseDisplayList___block_invoke(uint64_t result)
{
  void *v1;
  uint64_t v2;

  v1 = *(void **)(*(_QWORD *)(result + 40) + 32);
  if (*(void **)(result + 32) != v1)
  {
    v2 = result;

    *(_QWORD *)(*(_QWORD *)(v2 + 40) + 32) = *(id *)(v2 + 32);
    return objc_msgSend(*(id *)(v2 + 40), "updatePlayerDisplayList");
  }
  return result;
}

- (void)updatePlayerDisplayList
{
  NSArray *baseDisplayList;
  id v4;
  void *v5;
  NSMutableSet *clonedDisplays;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  OpaqueFigPlayer *player;
  uint64_t FigBaseObject;
  void (*v13)(uint64_t, __CFString *, void *);
  uint64_t v14;
  const void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  baseDisplayList = self->_baseDisplayList;
  if (baseDisplayList)
    v4 = (id)-[NSArray mutableCopy](baseDisplayList, "mutableCopy");
  else
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = v4;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  clonedDisplays = self->_clonedDisplays;
  v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](clonedDisplays, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(clonedDisplays);
        if (-[NSArray containsObject:](self->_baseDisplayList, "containsObject:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i)))
        {
          objc_msgSend(v5, "addObjectsFromArray:", -[NSMutableSet allObjects](self->_cloningSupportedDisplays, "allObjects"));
          goto LABEL_14;
        }
      }
      v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](clonedDisplays, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_14:
  player = self->_player;
  if (player)
  {
    FigBaseObject = FigPlayerGetFigBaseObject(player);
    v13 = *(void (**)(uint64_t, __CFString *, void *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v13)
      v13(FigBaseObject, CFSTR("Server_DisplayList"), v5);
  }
  if (self->_callback)
  {
    if (self->_weakCallbackContext)
    {
      v14 = FigCFWeakReferenceHolderCopyReferencedObject();
      if (v14)
      {
        v15 = (const void *)v14;
        ((void (*)(void *, uint64_t))self->_callback)(v5, v14);
        CFRelease(v15);
      }
    }
  }

}

- (void)removeReferenceToPlayer
{
  _QWORD block[5];

  if (FigDisplayMirroringGetAccessQueue_sFigDisplayMirroringOnce != -1)
    dispatch_once(&FigDisplayMirroringGetAccessQueue_sFigDisplayMirroringOnce, &__block_literal_global_24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__FigDisplayMirroringChangeObserver_removeReferenceToPlayer__block_invoke;
  block[3] = &unk_1E2F88548;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)FigDisplayMirroringGetAccessQueue_sFigDisplayMirroringAccessQueue, block);
}

uint64_t __60__FigDisplayMirroringChangeObserver_removeReferenceToPlayer__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 8) = 0;
  return result;
}

- (void)removeCallback
{
  _QWORD block[5];

  if (FigDisplayMirroringGetAccessQueue_sFigDisplayMirroringOnce != -1)
    dispatch_once(&FigDisplayMirroringGetAccessQueue_sFigDisplayMirroringOnce, &__block_literal_global_24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__FigDisplayMirroringChangeObserver_removeCallback__block_invoke;
  block[3] = &unk_1E2F88548;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)FigDisplayMirroringGetAccessQueue_sFigDisplayMirroringAccessQueue, block);
}

void __51__FigDisplayMirroringChangeObserver_removeCallback__block_invoke(uint64_t a1)
{
  const void *v2;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = 0;
  v2 = *(const void **)(*(_QWORD *)(a1 + 32) + 56);
  if (v2)
  {
    CFRelease(v2);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = 0;
  }
}

@end
