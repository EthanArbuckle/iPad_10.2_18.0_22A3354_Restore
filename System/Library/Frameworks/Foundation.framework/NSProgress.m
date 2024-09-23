@implementation NSProgress

uint64_t __44__NSProgress__setValueForKeys_settingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", a2);
}

+ (NSProgress)currentProgress
{
  NSProgress *result;

  result = (NSProgress *)_CFGetTSD();
  if (result)
    return (NSProgress *)result->super.isa;
  return result;
}

- (void)setCancellationHandler:(void *)cancellationHandler
{
  id v5;
  qos_class_t v7;
  NSObject *global_queue;

  -[NSLock lock](self->_lock, "lock");
  v5 = self->_cancellationHandler;
  if (v5 != cancellationHandler)
  {

    cancellationHandler = (void *)objc_msgSend(cancellationHandler, "copy");
    self->_cancellationHandler = cancellationHandler;
  }
  if (self->_values->_isCancelled && cancellationHandler != 0)
  {
    v7 = qos_class_self();
    global_queue = dispatch_get_global_queue(v7, 0);
    dispatch_async(global_queue, self->_cancellationHandler);
  }
  -[NSLock unlock](self->_lock, "unlock");
}

- (void)setResumingHandler:(void *)resumingHandler
{
  id v5;

  -[NSLock lock](self->_lock, "lock");
  v5 = self->_resumingHandler;
  if (v5 != resumingHandler)
  {

    self->_resumingHandler = (id)objc_msgSend(resumingHandler, "copy");
  }
  -[NSLock unlock](self->_lock, "unlock");
}

- (void)setPausingHandler:(void *)pausingHandler
{
  id v5;
  qos_class_t v7;
  NSObject *global_queue;

  -[NSLock lock](self->_lock, "lock");
  v5 = self->_pausingHandler;
  if (v5 != pausingHandler)
  {

    pausingHandler = (void *)objc_msgSend(pausingHandler, "copy");
    self->_pausingHandler = pausingHandler;
  }
  if (self->_values->_isPaused && pausingHandler != 0)
  {
    v7 = qos_class_self();
    global_queue = dispatch_get_global_queue(v7, 0);
    dispatch_async(global_queue, self->_pausingHandler);
  }
  -[NSLock unlock](self->_lock, "unlock");
}

- (id)ownedDictionaryKeyEnumerator
{
  NSProgressValues *values;
  NSMutableDictionary *userInfo;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[NSLock lock](self->_lock, "lock");
  values = self->_values;
  userInfo = values->_userInfo;
  if (!userInfo)
  {
    userInfo = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    values->_userInfo = userInfo;
  }
  v5 = (void *)-[NSMutableDictionary allKeys](userInfo, "allKeys");
  v11 = 0;
  v12 = &v11;
  v13 = 0x3052000000;
  v14 = __Block_byref_object_copy__34;
  v15 = __Block_byref_object_dispose__34;
  v16 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __42__NSProgress_ownedDictionaryKeyEnumerator__block_invoke;
  v10[3] = &unk_1E0F4EC80;
  v10[4] = v5;
  v10[5] = &v11;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);
  v6 = (void *)v12[5];
  if (v6)
  {
    v7 = (id)objc_msgSend(v6, "objectEnumerator");

  }
  else
  {
    v7 = (id)-[NSMutableDictionary keyEnumerator](values->_userInfo, "keyEnumerator");
  }
  -[NSLock unlock](self->_lock, "unlock");
  v8 = v7;
  _Block_object_dispose(&v11, 8);
  return v8;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (void)addChild:(NSProgress *)child withPendingUnitCount:(int64_t)inUnitCount
{
  id v8;
  NSMutableSet *children;
  void *v10;

  v8 = -[NSProgress _parent](child, "_parent");
  if (v8)
  {
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: NSProgress %p was already the child of another progress %p"), _NSMethodExceptionProem((objc_class *)self, a2), child, v8), 0);
    objc_exception_throw(v10);
  }
  -[NSLock lock](self->_lock, "lock");
  children = self->_children;
  if (!children)
  {
    children = (NSMutableSet *)(id)objc_msgSend(MEMORY[0x1E0C99E20], "set");
    self->_children = children;
  }
  -[NSMutableSet addObject:](children, "addObject:", child);
  -[NSLock unlock](self->_lock, "unlock");
  -[NSProgress _setParent:portion:](child, "_setParent:portion:", self, inUnitCount);
  if (-[NSProgress isCancelled](self, "isCancelled"))
    -[NSProgress cancel](child, "cancel");
  if (-[NSProgress isPaused](self, "isPaused"))
    -[NSProgress pause](child, "pause");
}

- (BOOL)isCancelled
{
  BOOL isCancelled;

  -[NSLock lock](self->_lock, "lock");
  isCancelled = self->_values->_isCancelled;
  -[NSLock unlock](self->_lock, "unlock");
  return isCancelled;
}

- (void)_setParent:(id)a3 portion:(int64_t)a4
{
  NSProgressValues *values;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[32];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[NSLock lock](self->_lock, "lock");
  objc_storeWeak((id *)&self->_parent, a3);
  self->_values->_portionOfParent = a4;
  v11 = 0uLL;
  *(_QWORD *)v12 = 0;
  values = self->_values;
  if (values)
  {
    -[NSProgressValues overallFraction](values, "overallFraction");
  }
  else
  {
    v8 = 0uLL;
    *(_QWORD *)&v9 = 0;
  }
  *(_OWORD *)&v12[8] = v8;
  *(_QWORD *)&v12[24] = v9;
  -[NSLock unlock](self->_lock, "unlock", v8, (_QWORD)v9);
  v8 = v11;
  v9 = *(_OWORD *)v12;
  v10 = *(_OWORD *)&v12[16];
  objc_msgSend(a3, "_updateChild:fraction:portion:", self, &v8, a4);
}

- (BOOL)isPaused
{
  BOOL isPaused;

  -[NSLock lock](self->_lock, "lock");
  isPaused = self->_values->_isPaused;
  -[NSLock unlock](self->_lock, "unlock");
  return isPaused;
}

- (void)set_adoptChildUserInfo:(BOOL)a3
{
  unint64_t v3;

  if (a3)
    v3 = self->_flags | 2;
  else
    v3 = -3;
  self->_flags = v3;
}

- (BOOL)isPausable
{
  BOOL isPausable;

  -[NSLock lock](self->_lock, "lock");
  isPausable = self->_values->_isPausable;
  -[NSLock unlock](self->_lock, "unlock");
  return isPausable;
}

- (BOOL)isCancellable
{
  BOOL isCancellable;

  -[NSLock lock](self->_lock, "lock");
  isCancellable = self->_values->_isCancellable;
  -[NSLock unlock](self->_lock, "unlock");
  return isCancellable;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  objc_storeWeak((id *)&self->_parent, 0);
  -[NSOwnedDictionaryProxy superRelease](self->_userInfoProxy, "superRelease");

  v3.receiver = self;
  v3.super_class = (Class)NSProgress;
  -[NSProgress dealloc](&v3, sel_dealloc);
}

- (void)cancel
{
  id cancellationHandler;
  id v4;
  qos_class_t v5;
  NSObject *global_queue;
  NSMutableSet *children;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  _QWORD block[5];
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[NSProgress _setValueForKeys:settingBlock:](self, "_setValueForKeys:settingBlock:", &__block_literal_global_297, &__block_literal_global_300_0);
  -[NSLock lock](self->_lock, "lock");
  cancellationHandler = self->_cancellationHandler;
  if (cancellationHandler)
  {
    v4 = cancellationHandler;
    v5 = qos_class_self();
    global_queue = dispatch_get_global_queue(v5, 0);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __20__NSProgress_cancel__block_invoke_3;
    block[3] = &unk_1E0F4E870;
    block[4] = v4;
    dispatch_async(global_queue, block);
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  children = self->_children;
  v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](children, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(children);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "cancel");
      }
      v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](children, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
    }
    while (v9);
  }
  -[NSLock unlock](self->_lock, "unlock");
}

- (void)_setCompletedUnitCount:(int64_t)a3 totalUnitCount:(int64_t)a4
{
  __int128 v5;
  _OWORD v6[3];
  _QWORD v7[8];
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  v14 = &v13;
  v15 = 0x5010000000;
  v16 = &unk_1823C230D;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__NSProgress__setCompletedUnitCount_totalUnitCount___block_invoke;
  v8[3] = &unk_1E0F55A78;
  v8[4] = self;
  v8[5] = a3;
  v8[6] = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__NSProgress__setCompletedUnitCount_totalUnitCount___block_invoke_2;
  v7[3] = &unk_1E0F55AA0;
  v7[6] = a3;
  v7[7] = a4;
  v7[4] = &v13;
  v7[5] = &v9;
  -[NSProgress _setValueForKeys:settingBlock:](self, "_setValueForKeys:settingBlock:", v8, v7);
  if (*((_BYTE *)v10 + 24))
  {
    v5 = *((_OWORD *)v14 + 3);
    v6[0] = *((_OWORD *)v14 + 2);
    v6[1] = v5;
    v6[2] = *((_OWORD *)v14 + 4);
    -[NSProgress _updateFractionCompleted:](self, "_updateFractionCompleted:", v6);
  }
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
}

- (void)_setUserInfoValue:(id)a3 forKey:(id)a4 fromChild:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  NSProgressValues *values;
  NSMutableDictionary *userInfo;
  NSOwnedDictionaryProxy *v12;

  v5 = a5;
  -[NSLock lock](self->_lock, "lock");
  if (v5 && (self->_flags & 2) == 0)
  {
    -[NSLock unlock](self->_lock, "unlock");
    return;
  }
  v12 = self->_userInfoProxy;
  -[NSLock unlock](self->_lock, "unlock");
  v9 = a4;
  if (objc_msgSend(a4, "hasSuffix:", CFSTR(".data")))
    v9 = (id)objc_msgSend(a4, "substringToIndex:", objc_msgSend(a4, "length") - 5);
  -[NSOwnedDictionaryProxy willChangeValueForKey:](v12, "willChangeValueForKey:", v9);
  -[NSLock lock](self->_lock, "lock");
  values = self->_values;
  userInfo = values->_userInfo;
  if (!userInfo)
  {
    userInfo = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    values->_userInfo = userInfo;
    if (a3)
      goto LABEL_8;
LABEL_10:
    -[NSMutableDictionary removeObjectForKey:](userInfo, "removeObjectForKey:", a4);
    goto LABEL_11;
  }
  if (!a3)
    goto LABEL_10;
LABEL_8:
  -[NSMutableDictionary setObject:forKey:](userInfo, "setObject:forKey:", a3, a4);
LABEL_11:
  -[NSProgress _notifyRemoteObserversOfUserInfoValueForKey:](self, "_notifyRemoteObserversOfUserInfoValueForKey:", a4);
  -[NSLock unlock](self->_lock, "unlock");
  objc_msgSend(-[NSProgress _parent](self, "_parent"), "_setUserInfoValue:forKey:fromChild:", a3, a4, 1);
  -[NSOwnedDictionaryProxy didChangeValueForKey:](v12, "didChangeValueForKey:", v9);

}

- (void)_notifyRemoteObserversOfUserInfoValueForKey:(id)a3
{
  void *v5;
  uint64_t v6;

  if (self->_publisherID)
  {
    v5 = (void *)-[NSMutableDictionary objectForKey:](self->_values->_userInfo, "objectForKey:");
    if (objc_lookUpClass("NSImage"))
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = (void *)objc_msgSend(v5, "performSelector:", sel_TIFFRepresentation);
        a3 = (id)objc_msgSend(a3, "stringByAppendingString:", CFSTR(".data"));
      }
    }
    objc_msgSend((id)objc_msgSend(+[NSProgress _serverConnection](NSProgress, "_serverConnection", v6), "remoteObjectProxy"), "observePublisherUserInfoForID:value:forKey:", self->_publisherID, v5, a3);
  }
}

- (int64_t)totalUnitCount
{
  int64_t total;

  -[NSLock lock](self->_lock, "lock");
  total = self->_values->_selfFraction.total;
  -[NSLock unlock](self->_lock, "unlock");
  return total;
}

- (void)setPausable:(BOOL)pausable
{
  _BOOL8 v3;
  _QWORD v5[4];
  BOOL v6;
  _QWORD v7[4];
  BOOL v8;
  uint64_t v9;

  v3 = pausable;
  v9 = *MEMORY[0x1E0C80C00];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __26__NSProgress_setPausable___block_invoke;
  v7[3] = &__block_descriptor_33_e35___NSArray_16__0__NSProgressValues_8l;
  v8 = pausable;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __26__NSProgress_setPausable___block_invoke_2;
  v5[3] = &__block_descriptor_33_e26_v16__0__NSProgressValues_8l;
  v6 = pausable;
  -[NSProgress _setValueForKeys:settingBlock:](self, "_setValueForKeys:settingBlock:", v7, v5);
  objc_msgSend(objc_loadWeak((id *)&self->_parent), "_setPausable:fromChild:", v3, 1);
}

- (void)setCancellable:(BOOL)cancellable
{
  _BOOL8 v3;
  _QWORD v5[4];
  BOOL v6;
  _QWORD v7[4];
  BOOL v8;
  uint64_t v9;

  v3 = cancellable;
  v9 = *MEMORY[0x1E0C80C00];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __29__NSProgress_setCancellable___block_invoke;
  v7[3] = &__block_descriptor_33_e35___NSArray_16__0__NSProgressValues_8l;
  v8 = cancellable;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __29__NSProgress_setCancellable___block_invoke_2;
  v5[3] = &__block_descriptor_33_e26_v16__0__NSProgressValues_8l;
  v6 = cancellable;
  -[NSProgress _setValueForKeys:settingBlock:](self, "_setValueForKeys:settingBlock:", v7, v5);
  objc_msgSend(objc_loadWeak((id *)&self->_parent), "_setCancellable:fromChild:", v3, 1);
}

- (void)resignCurrent
{
  NSProgress **v4;
  NSProgress **v5;
  void *v6;

  v4 = (NSProgress **)_CFGetTSD();
  if (!v4 || (v5 = v4, *v4 != self))
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: NSProgress was not the current progress on this thread %@"), _NSMethodExceptionProem((objc_class *)self, a2), +[NSThread currentThread](NSThread, "currentThread")), 0);
    objc_exception_throw(v6);
  }
  pthread_self();
  if (!*((_BYTE *)v5 + 24))
    -[NSProgress _addCompletedUnitCount:](self, "_addCompletedUnitCount:", v5[2]);
  _CFSetTSD();

  free(v5);
}

- (void)_addCompletedUnitCount:(int64_t)a3
{
  __int128 v4;
  _OWORD v5[3];
  _QWORD v6[7];
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = &v12;
  v14 = 0x5010000000;
  v15 = &unk_1823C230D;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v6[6] = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__NSProgress__addCompletedUnitCount___block_invoke;
  v7[3] = &unk_1E0F55A28;
  v7[4] = self;
  v7[5] = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __37__NSProgress__addCompletedUnitCount___block_invoke_2;
  v6[3] = &unk_1E0F55A50;
  v6[4] = &v12;
  v6[5] = &v8;
  -[NSProgress _setValueForKeys:settingBlock:](self, "_setValueForKeys:settingBlock:", v7, v6);
  if (*((_BYTE *)v9 + 24))
  {
    v4 = *((_OWORD *)v13 + 3);
    v5[0] = *((_OWORD *)v13 + 2);
    v5[1] = v4;
    v5[2] = *((_OWORD *)v13 + 4);
    -[NSProgress _updateFractionCompleted:](self, "_updateFractionCompleted:", v5);
  }
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
}

+ (NSProgress)progressWithTotalUnitCount:(int64_t)unitCount
{
  void *v4;

  v4 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithParent:userInfo:", objc_msgSend(a1, "currentProgress"), 0);
  objc_msgSend(v4, "setTotalUnitCount:", unitCount);
  return (NSProgress *)v4;
}

+ (NSProgress)discreteProgressWithTotalUnitCount:(int64_t)unitCount
{
  void *v4;

  v4 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithParent:userInfo:", 0, 0);
  objc_msgSend(v4, "setTotalUnitCount:", unitCount);
  return (NSProgress *)v4;
}

- (NSProgress)initWithParent:(NSProgress *)parentProgressOrNil userInfo:(NSDictionary *)userInfoOrNil
{
  NSProgress *v8;
  NSString *v10;
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (parentProgressOrNil && (NSProgress *)objc_msgSend((id)objc_opt_class(), "currentProgress") != parentProgressOrNil)
  {
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: The parent of an NSProgress object must be the currentProgress."), _NSMethodExceptionProem((objc_class *)self, a2));

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v10, 0));
  }
  v11.receiver = self;
  v11.super_class = (Class)NSProgress;
  v8 = -[NSProgress init](&v11, sel_init);
  if (v8)
  {
    v8->_lock = (NSLock *)objc_opt_new();
    v8->_values = objc_alloc_init(NSProgressValues);
    v8->_values->_userInfo = (NSMutableDictionary *)-[NSDictionary mutableCopy](userInfoOrNil, "mutableCopy");
    if (parentProgressOrNil)
      -[NSProgress _addImplicitChild:](parentProgressOrNil, "_addImplicitChild:", v8);
  }
  return v8;
}

- (double)fractionCompleted
{
  double v3;
  double v4;

  -[NSLock lock](self->_lock, "lock");
  -[NSProgressValues fractionCompleted](self->_values, "fractionCompleted");
  v4 = v3;
  -[NSLock unlock](self->_lock, "unlock");
  return v4;
}

double __37__NSProgress__addCompletedUnitCount___block_invoke_2(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  double result;
  __int128 v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;

  objc_msgSend(a2, "overallFraction");
  v4 = *(_QWORD *)(a1[4] + 8);
  *(_OWORD *)(v4 + 32) = v9;
  *(_QWORD *)(v4 + 48) = v10;
  a2[2] += a1[6];
  objc_msgSend(a2, "overallFraction");
  v5 = *(_QWORD *)(a1[4] + 8);
  result = *(double *)&v7;
  *(_OWORD *)(v5 + 56) = v7;
  *(_QWORD *)(v5 + 72) = v8;
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
  return result;
}

void *__44__NSProgress__updateChild_fraction_portion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL4 v12;
  uint64_t v13;
  int v14;
  uint64_t v16;
  uint64_t v17;
  int v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23[2];
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27[3];
  __int128 v28;
  uint64_t v29;
  uint64_t v30[3];
  __int128 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v31 = *(_OWORD *)(a2 + 40);
  v32 = *(_QWORD *)(a2 + 56);
  v5 = *(_QWORD *)(a2 + 24);
  v6 = *(_QWORD *)(a1 + 40);
  v30[0] = *(_QWORD *)(a1 + 32);
  v30[1] = v5;
  v30[2] = 0;
  if ((v6 & 0x8000000000000000) == 0)
  {
    v7 = *(_QWORD *)(a1 + 48);
    if ((v7 & 0x8000000000000000) == 0)
    {
      if (v7 | v6)
      {
        *((_QWORD *)&v28 + 1) = *(_QWORD *)(a1 + 48);
        v29 = 0;
        *(_QWORD *)&v28 = v6;
        LOBYTE(v29) = *(_BYTE *)(a1 + 56);
        _NSProgressFractionMultiplyByFraction((uint64_t *)&v28, v30);
        _NSProgressFractionSubtractFraction((uint64_t)&v31, (uint64_t *)&v28);
      }
    }
  }
  v8 = *(_QWORD *)(a1 + 64);
  if ((v8 & 0x8000000000000000) == 0)
  {
    v9 = *(_QWORD *)(a1 + 72);
    if ((v9 & 0x8000000000000000) == 0)
    {
      if (v9 | v8)
      {
        *((_QWORD *)&v28 + 1) = *(_QWORD *)(a1 + 72);
        v29 = 0;
        *(_QWORD *)&v28 = v8;
        LOBYTE(v29) = *(_BYTE *)(a1 + 80);
        _NSProgressFractionMultiplyByFraction((uint64_t *)&v28, v30);
        _NSProgressFractionAddFraction((uint64_t)&v31, (uint64_t *)&v28);
      }
    }
  }
  v28 = v31;
  v29 = v32;
  _NSProgressFractionAddFraction((uint64_t)&v28, (uint64_t *)(a2 + 16));
  memset(v27, 0, sizeof(v27));
  objc_msgSend((id)a2, "overallFraction");
  if ((_NSProgressFractionIsFractionCompletedEqual((uint64_t *)&v28, v27) & 1) == 0)
    objc_msgSend(v4, "addObject:", CFSTR("fractionCompleted"));
  v10 = *(_QWORD *)(a1 + 64);
  v11 = *(_QWORD *)(a1 + 72);
  v12 = v10 >= v11;
  if (v11 <= 0)
    v12 = 0;
  if (!v11)
    v12 = 1;
  if (v10 >= 1 && v12)
  {
    v25 = *(_OWORD *)(a2 + 16);
    v26 = *(_QWORD *)(a2 + 32);
    v13 = *(_QWORD *)(a1 + 32);
    if (v13)
    {
      *(_QWORD *)&v25 = v25 + v13;
      objc_msgSend(v4, "addObject:", CFSTR("completedUnitCount"));
      v10 = *(_QWORD *)(a1 + 64);
      v11 = *(_QWORD *)(a1 + 72);
    }
    v23[1] = v11;
    v24 = 0;
    v23[0] = v10;
    LOBYTE(v24) = *(_BYTE *)(a1 + 80);
    _NSProgressFractionMultiplyByFraction(v23, v30);
    v21 = v31;
    v22 = v32;
    _NSProgressFractionSubtractFraction((uint64_t)&v21, v23);
    _NSProgressFractionAddFraction((uint64_t)&v25, (uint64_t *)&v21);
    v14 = (uint64_t)v25 >= 1 && (uint64_t)v25 >= *((uint64_t *)&v25 + 1) && *((uint64_t *)&v25 + 1) > 0
       || (uint64_t)v25 > 0 && *((_QWORD *)&v25 + 1) == 0;
    v16 = *(_QWORD *)(a2 + 16);
    v17 = *(_QWORD *)(a2 + 24);
    if (v16 >= 1 && v16 >= v17 && v17 >= 1)
    {
      if ((v14 & 1) != 0)
        goto LABEL_34;
      goto LABEL_33;
    }
    v20 = v16 > 0 && v17 == 0;
    if (v14 != v20)
LABEL_33:
      objc_msgSend(v4, "addObject:", CFSTR("finished"));
  }
LABEL_34:
  if (objc_msgSend(v4, "count"))
    return v4;
  else
    return 0;
}

- (void)setTotalUnitCount:(int64_t)totalUnitCount
{
  __int128 v4;
  _OWORD v5[3];
  _QWORD v6[7];
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = &v12;
  v14 = 0x5010000000;
  v15 = &unk_1823C230D;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v6[6] = totalUnitCount;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __32__NSProgress_setTotalUnitCount___block_invoke;
  v7[3] = &unk_1E0F55A28;
  v7[4] = self;
  v7[5] = totalUnitCount;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __32__NSProgress_setTotalUnitCount___block_invoke_2;
  v6[3] = &unk_1E0F55A50;
  v6[4] = &v12;
  v6[5] = &v8;
  -[NSProgress _setValueForKeys:settingBlock:](self, "_setValueForKeys:settingBlock:", v7, v6);
  if (*((_BYTE *)v9 + 24))
  {
    v4 = *((_OWORD *)v13 + 3);
    v5[0] = *((_OWORD *)v13 + 2);
    v5[1] = v4;
    v5[2] = *((_OWORD *)v13 + 4);
    -[NSProgress _updateFractionCompleted:](self, "_updateFractionCompleted:", v5);
  }
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
}

- (void)setCompletedUnitCount:(int64_t)completedUnitCount
{
  __int128 v4;
  _OWORD v5[3];
  _QWORD v6[7];
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = &v12;
  v14 = 0x5010000000;
  v15 = &unk_1823C230D;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v6[6] = completedUnitCount;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__NSProgress_setCompletedUnitCount___block_invoke;
  v7[3] = &unk_1E0F55A28;
  v7[4] = self;
  v7[5] = completedUnitCount;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__NSProgress_setCompletedUnitCount___block_invoke_2;
  v6[3] = &unk_1E0F55A50;
  v6[4] = &v12;
  v6[5] = &v8;
  -[NSProgress _setValueForKeys:settingBlock:](self, "_setValueForKeys:settingBlock:", v7, v6);
  if (*((_BYTE *)v9 + 24))
  {
    v4 = *((_OWORD *)v13 + 3);
    v5[0] = *((_OWORD *)v13 + 2);
    v5[1] = v4;
    v5[2] = *((_OWORD *)v13 + 4);
    -[NSProgress _updateFractionCompleted:](self, "_updateFractionCompleted:", v5);
  }
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
}

- (void)_setValueForKeys:(id)a3 settingBlock:(id)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[5];
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[NSLock lock](self->_lock, "lock");
  v7 = (void *)(*((uint64_t (**)(id, NSProgressValues *))a3 + 2))(a3, self->_values);
  -[NSLock unlock](self->_lock, "unlock");
  if (v7)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          -[NSProgress willChangeValueForKey:](self, "willChangeValueForKey:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11++));
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
      }
      while (v9);
    }
    -[NSLock lock](self->_lock, "lock");
    (*((void (**)(id, NSProgressValues *))a4 + 2))(a4, self->_values);
    -[NSProgress _notifyRemoteObserversOfValueForKeys:](self, "_notifyRemoteObserversOfValueForKeys:", v7);
    -[NSLock unlock](self->_lock, "unlock");
  }
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __44__NSProgress__setValueForKeys_settingBlock___block_invoke;
  v12[3] = &unk_1E0F536E0;
  v12[4] = self;
  objc_msgSend(v7, "enumerateObjectsWithOptions:usingBlock:", 2, v12);
}

- (void)_notifyRemoteObserversOfValueForKeys:(id)a3
{
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSMutableDictionary *lastNotificationTimesByKey;
  double v10;
  double v11;
  double v12;
  double v13;
  int v14;
  NSProgressValues *values;
  int64_t completed;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  __int128 v21;
  void *v22;
  void *v23;
  uint64_t v25;
  uint8_t buf[4];
  NSProgress *v27;
  __int16 v28;
  uint64_t v29;
  _BYTE v30[128];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (self->_publisherID)
  {
    v23 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v22 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v4 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v31, v30, 16);
    if (v4)
    {
      v6 = v4;
      v25 = *(_QWORD *)v32;
      *(_QWORD *)&v5 = 134218242;
      v21 = v5;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v32 != v25)
            objc_enumerationMutation(a3);
          v8 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v7);
          lastNotificationTimesByKey = self->_lastNotificationTimesByKey;
          if (!lastNotificationTimesByKey)
          {
            lastNotificationTimesByKey = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
            self->_lastNotificationTimesByKey = lastNotificationTimesByKey;
          }
          objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](lastNotificationTimesByKey, "objectForKeyedSubscript:", v8, v21), "doubleValue");
          v11 = v10;
          -[NSProcessInfo systemUptime](+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"), "systemUptime");
          v13 = v12;
          if (qword_1ECD09858 != -1)
            dispatch_once(&qword_1ECD09858, &__block_literal_global_245);
          v14 = objc_msgSend((id)qword_1ECD09860, "containsObject:", v8);
          values = self->_values;
          completed = values->_selfFraction.completed;
          if (!completed)
            goto LABEL_19;
          if (v13 - v11 > 0.0166666667 || completed == values->_selfFraction.total)
            v14 = 1;
          if (v14 != 1)
          {
            if (qword_1ECD09840 != -1)
              dispatch_once(&qword_1ECD09840, &__block_literal_global_90);
            v20 = _MergedGlobals_25_1;
            if (os_log_type_enabled((os_log_t)_MergedGlobals_25_1, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v21;
              v27 = self;
              v28 = 2114;
              v29 = v8;
              _os_log_debug_impl(&dword_1817D9000, v20, OS_LOG_TYPE_DEBUG, "<NSProgress %p> Dropped remote update for key %{public}@ due to throttling", buf, 0x16u);
            }
          }
          else
          {
LABEL_19:
            v18 = -[NSProgressValues valueForKey:](values, "valueForKey:", v8);
            if (v18)
            {
              objc_msgSend(v23, "addObject:", v18, v19);
              objc_msgSend(v22, "addObject:", v8);
              -[NSMutableDictionary setObject:forKeyedSubscript:](lastNotificationTimesByKey, "setObject:forKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v13), v8);
            }
          }
          ++v7;
        }
        while (v6 != v7);
        v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v31, v30, 16);
      }
      while (v6);
    }
    if (objc_msgSend(v23, "count"))
      objc_msgSend((id)objc_msgSend(+[NSProgress _serverConnection](NSProgress, "_serverConnection"), "remoteObjectProxy"), "observePublisherForID:values:forKeys:", self->_publisherID, v23, v22);
  }
}

void *__36__NSProgress_setCompletedUnitCount___block_invoke(uint64_t a1, uint64_t a2)
{
  return keysChangedForFractionCompletedValues(a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a2 + 24));
}

double __32__NSProgress_setTotalUnitCount___block_invoke_2(_QWORD *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  double result;
  __int128 v10;
  uint64_t v11;
  uint64_t v12[3];
  __int128 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "overallFraction");
  v4 = *(_QWORD *)(a1[4] + 8);
  *(_QWORD *)(v4 + 48) = v14;
  *(_OWORD *)(v4 + 32) = v13;
  v5 = a2[3];
  v6 = a1[6];
  if (v5 >= 1 && v5 != v6)
  {
    v12[1] = a1[6];
    v12[2] = 0;
    v12[0] = v5;
    _NSProgressFractionMultiplyByFraction(a2 + 5, v12);
    v6 = a1[6];
  }
  a2[3] = v6;
  objc_msgSend(a2, "overallFraction");
  v8 = *(_QWORD *)(a1[4] + 8);
  result = *(double *)&v10;
  *(_OWORD *)(v8 + 56) = v10;
  *(_QWORD *)(v8 + 72) = v11;
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
  return result;
}

double __36__NSProgress_setCompletedUnitCount___block_invoke_2(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  double result;
  __int128 v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;

  objc_msgSend(a2, "overallFraction");
  v4 = *(_QWORD *)(a1[4] + 8);
  *(_OWORD *)(v4 + 32) = v9;
  *(_QWORD *)(v4 + 48) = v10;
  a2[2] = a1[6];
  objc_msgSend(a2, "overallFraction");
  v5 = *(_QWORD *)(a1[4] + 8);
  result = *(double *)&v7;
  *(_OWORD *)(v5 + 56) = v7;
  *(_QWORD *)(v5 + 72) = v8;
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
  return result;
}

- (void)_updateFractionCompleted:(_NSProgressFractionTuple *)a3
{
  id v5;
  int64_t portionOfParent;
  __int128 v7;
  _OWORD v8[3];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if ((_NSProgressFractionIsEqual(&a3->var0.completed, &a3->var1.completed) & 1) == 0)
  {
    v5 = -[NSProgress _parent](self, "_parent");
    portionOfParent = self->_values->_portionOfParent;
    v7 = *(_OWORD *)&a3->var0.overflowed;
    v8[0] = *(_OWORD *)&a3->var0.completed;
    v8[1] = v7;
    v8[2] = *(_OWORD *)&a3->var1.total;
    objc_msgSend(v5, "_updateChild:fraction:portion:", self, v8, portionOfParent);
  }
}

- (id)_parent
{
  return objc_loadWeak((id *)&self->_parent);
}

void *__32__NSProgress_setTotalUnitCount___block_invoke(uint64_t a1, uint64_t a2)
{
  return keysChangedForFractionCompletedValues(a2, *(_QWORD *)(a2 + 16), *(_QWORD *)(a1 + 40));
}

- (void)_updateChild:(id)a3 fraction:(_NSProgressFractionTuple *)a4 portion:(int64_t)a5
{
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _OWORD v10[3];
  _QWORD v11[9];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _QWORD v15[5];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v23 = 0;
  v24 = &v23;
  v25 = 0x5010000000;
  v26 = &unk_1823C230D;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __44__NSProgress__updateChild_fraction_portion___block_invoke;
  v15[3] = &__block_descriptor_88_e35___NSArray_16__0__NSProgressValues_8l;
  v15[4] = a5;
  v6 = *(_OWORD *)&a4->var0.completed;
  v7 = *(_OWORD *)&a4->var1.total;
  v8 = *(_OWORD *)&a4->var0.completed;
  v17 = *(_OWORD *)&a4->var0.overflowed;
  v18 = v7;
  v16 = v6;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __44__NSProgress__updateChild_fraction_portion___block_invoke_2;
  v11[3] = &unk_1E0F55AE8;
  v11[7] = &v19;
  v11[8] = a5;
  v14 = *(_OWORD *)&a4->var1.total;
  v13 = v17;
  v12 = v8;
  v11[4] = self;
  v11[5] = a3;
  v11[6] = &v23;
  -[NSProgress _setValueForKeys:settingBlock:](self, "_setValueForKeys:settingBlock:", v15, v11);
  if (*((_BYTE *)v20 + 24))
  {
    v9 = *((_OWORD *)v24 + 3);
    v10[0] = *((_OWORD *)v24 + 2);
    v10[1] = v9;
    v10[2] = *((_OWORD *)v24 + 4);
    -[NSProgress _updateFractionCompleted:](self, "_updateFractionCompleted:", v10);
  }
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);
}

double __44__NSProgress__updateChild_fraction_portion___block_invoke_2(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  _BOOL4 v13;
  uint64_t v14;
  uint64_t v15;
  double result;
  __int128 v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "overallFraction");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  *(_OWORD *)(v4 + 32) = v25;
  *(_QWORD *)(v4 + 48) = v26;
  v5 = a2[3];
  *(_QWORD *)&v23 = *(_QWORD *)(a1 + 64);
  *((_QWORD *)&v23 + 1) = v5;
  v24 = 0;
  v6 = (uint64_t *)(a1 + 96);
  v22 = 0;
  v21 = *(_OWORD *)(a1 + 72);
  LOBYTE(v22) = *(_BYTE *)(a1 + 88);
  _NSProgressFractionMultiplyByFraction((uint64_t *)&v21, (uint64_t *)&v23);
  v7 = *(_QWORD *)(a1 + 72);
  if ((v7 & 0x8000000000000000) == 0)
  {
    v8 = *(_QWORD *)(a1 + 80);
    if ((v8 & 0x8000000000000000) == 0)
    {
      if (v8 | v7)
        _NSProgressFractionSubtractFraction((uint64_t)(a2 + 5), (uint64_t *)&v21);
    }
  }
  v9 = *v6;
  if ((*v6 & 0x8000000000000000) == 0)
  {
    v10 = *(_QWORD *)(a1 + 104);
    if ((v10 & 0x8000000000000000) == 0)
    {
      if (v10 | v9)
      {
        *((_QWORD *)&v19 + 1) = *(_QWORD *)(a1 + 104);
        v20 = 0;
        *(_QWORD *)&v19 = v9;
        LOBYTE(v20) = *(_BYTE *)(a1 + 112);
        _NSProgressFractionMultiplyByFraction((uint64_t *)&v19, (uint64_t *)&v23);
        _NSProgressFractionAddFraction((uint64_t)(a2 + 5), (uint64_t *)&v19);
        v9 = *(_QWORD *)(a1 + 96);
      }
    }
  }
  v11 = *(_QWORD *)(a1 + 104);
  v12 = v11 == 0;
  v13 = v11 > 0 && v9 >= v11;
  if (v12)
    v13 = 1;
  if (v9 >= 1 && v13)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "removeObject:", *(_QWORD *)(a1 + 40));
    v14 = *(_QWORD *)(a1 + 64);
    if (v14)
    {
      a2[2] += v14;
      v19 = v23;
      v20 = v24;
      _NSProgressFractionMultiplyByFraction((uint64_t *)&v19, (uint64_t *)(a1 + 96));
      _NSProgressFractionSubtractFraction((uint64_t)(a2 + 5), (uint64_t *)&v19);
    }
  }
  objc_msgSend(a2, "overallFraction");
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  result = *(double *)&v17;
  *(_OWORD *)(v15 + 56) = v17;
  *(_QWORD *)(v15 + 72) = v18;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  return result;
}

void *__37__NSProgress__addCompletedUnitCount___block_invoke(uint64_t a1, uint64_t a2)
{
  return keysChangedForFractionCompletedValues(a2, *(_QWORD *)(a1 + 40) + *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24));
}

void *__29__NSProgress_setCancellable___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(unsigned __int8 *)(a2 + 104) == *(unsigned __int8 *)(a1 + 32))
    return 0;
  else
    return &unk_1E0FCEC50;
}

void *__26__NSProgress_setPausable___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(unsigned __int8 *)(a2 + 105) == *(unsigned __int8 *)(a1 + 32))
    return 0;
  else
    return &unk_1E0FCEC68;
}

double __52__NSProgress__setCompletedUnitCount_totalUnitCount___block_invoke_2(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  double result;
  __int128 v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;

  objc_msgSend(a2, "overallFraction");
  v4 = *(_QWORD *)(a1[4] + 8);
  *(_OWORD *)(v4 + 32) = v9;
  *(_QWORD *)(v4 + 48) = v10;
  a2[2] = a1[6];
  a2[3] = a1[7];
  objc_msgSend(a2, "overallFraction");
  v5 = *(_QWORD *)(a1[4] + 8);
  result = *(double *)&v7;
  *(_OWORD *)(v5 + 56) = v7;
  *(_QWORD *)(v5 + 72) = v8;
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
  return result;
}

void *__52__NSProgress__setCompletedUnitCount_totalUnitCount___block_invoke(uint64_t a1, uint64_t a2)
{
  return keysChangedForFractionCompletedValues(a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __20__NSProgress_cancel__block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(a2 + 106) = 1;
}

void *__20__NSProgress_cancel__block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(_BYTE *)(a2 + 106))
    return 0;
  else
    return &unk_1E0FCEC80;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parent);
}

- (int64_t)completedUnitCount
{
  int64_t completed;

  -[NSLock lock](self->_lock, "lock");
  completed = self->_values->_selfFraction.completed;
  -[NSLock unlock](self->_lock, "unlock");
  return completed;
}

- (NSDictionary)userInfo
{
  NSOwnedDictionaryProxy *userInfoProxy;
  NSDictionary *v4;

  -[NSLock lock](self->_lock, "lock");
  userInfoProxy = self->_userInfoProxy;
  if (!userInfoProxy)
  {
    userInfoProxy = -[NSOwnedDictionaryProxy initWithOwner:]([NSOwnedDictionaryProxy alloc], "initWithOwner:", self);
    self->_userInfoProxy = userInfoProxy;
  }
  v4 = userInfoProxy;
  -[NSLock unlock](self->_lock, "unlock");
  return v4;
}

- (NSProgressKind)kind
{
  NSString *v3;

  -[NSLock lock](self->_lock, "lock");
  v3 = self->_values->_kind;
  -[NSLock unlock](self->_lock, "unlock");
  return v3;
}

- (NSProgress)init
{
  return -[NSProgress initWithParent:userInfo:](self, "initWithParent:userInfo:", 0, 0);
}

- (void)becomeCurrentWithPendingUnitCount:(int64_t)unitCount
{
  NSProgress **v6;
  NSProgress **v7;
  malloc_zone_t *v8;
  _OWORD *v9;
  void *v10;

  v6 = (NSProgress **)_CFGetTSD();
  v7 = v6;
  if (v6 && *v6 == self)
  {
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: NSProgress object is already current on this thread %@"), _NSMethodExceptionProem((objc_class *)self, a2), +[NSThread currentThread](NSThread, "currentThread")), 0);
    objc_exception_throw(v10);
  }
  pthread_self();
  v8 = malloc_default_zone();
  v9 = malloc_type_zone_calloc(v8, 1uLL, 0x20uLL, 0xC2E5A2B2uLL);
  *v9 = 0u;
  v9[1] = 0u;
  *(_QWORD *)v9 = self;
  *((_QWORD *)v9 + 1) = v7;
  *((_QWORD *)v9 + 2) = unitCount;
  _CFSetTSD();
}

- (unint64_t)ownedDictionaryCount
{
  unint64_t v3;

  -[NSLock lock](self->_lock, "lock");
  v3 = -[NSMutableDictionary count](self->_values->_userInfo, "count");
  -[NSLock unlock](self->_lock, "unlock");
  return v3;
}

- (void)setUserInfoObject:(id)objectOrNil forKey:(NSProgressUserInfoKey)key
{
  -[NSProgress _setUserInfoValue:forKey:fromChild:](self, "_setUserInfoValue:forKey:fromChild:", objectOrNil, key, 0);
}

- (BOOL)isFinished
{
  NSProgressValues *values;
  int64_t total;
  uint64_t completed;
  BOOL v7;
  BOOL v10;

  -[NSLock lock](self->_lock, "lock");
  values = self->_values;
  completed = values->_selfFraction.completed;
  total = values->_selfFraction.total;
  v7 = completed > 0 && total == 0;
  v10 = completed >= 1 && completed >= total && total > 0 || v7;
  -[NSLock unlock](self->_lock, "unlock");
  return v10;
}

- (BOOL)isIndeterminate
{
  NSProgressValues *values;
  int64_t completed;
  uint64_t total;
  BOOL v6;
  BOOL v7;

  -[NSLock lock](self->_lock, "lock");
  values = self->_values;
  completed = values->_selfFraction.completed;
  if (completed < 0)
  {
    v7 = 1;
  }
  else
  {
    total = values->_selfFraction.total;
    v6 = (total | completed) == 0;
    v7 = total < 0 || v6;
  }
  -[NSLock unlock](self->_lock, "unlock");
  return v7;
}

- (void)cancellationHandler
{
  id v3;

  -[NSLock lock](self->_lock, "lock");
  v3 = self->_cancellationHandler;
  -[NSLock unlock](self->_lock, "unlock");
  return v3;
}

- (id)ownedDictionaryObjectForKey:(id)a3
{
  NSProgressValues *values;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;

  -[NSLock lock](self->_lock, "lock");
  values = self->_values;
  v6 = (id)-[NSMutableDictionary objectForKey:](values->_userInfo, "objectForKey:", a3);
  if (!v6)
  {
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("NSProgressPhysicalFileURLKey")))
    {
      v7 = (id)-[NSMutableDictionary objectForKey:](values->_userInfo, "objectForKey:", CFSTR("NSProgressFileURLKey"));
    }
    else
    {
      v8 = -[NSMutableDictionary objectForKey:](values->_userInfo, "objectForKey:", objc_msgSend(a3, "stringByAppendingString:", CFSTR(".data")));
      if (!v8 || (v9 = v8, !_NSIsNSData()))
      {
        v6 = 0;
        goto LABEL_9;
      }
      v7 = (id)objc_msgSend(objc_alloc(objc_lookUpClass("NSImage")), "performSelector:withObject:", sel_initWithData_, v9);
    }
    v6 = v7;
  }
LABEL_9:
  -[NSLock unlock](self->_lock, "unlock");
  return v6;
}

void *__42__NSProgress_ownedDictionaryKeyEnumerator__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  void *result;

  v4 = a2;
  if (objc_msgSend(a2, "hasSuffix:", CFSTR(".data")))
  {
    v4 = (void *)objc_msgSend(v4, "substringToIndex:", objc_msgSend(v4, "length") - 5);
    result = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (!result)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "subarrayWithRange:", 0, a3), "mutableCopy");
      result = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    }
  }
  else
  {
    result = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (!result)
      return result;
  }
  return (void *)objc_msgSend(result, "addObject:", v4);
}

uint64_t __34__NSProgress__subscriberInterface__block_invoke(uint64_t a1)
{
  qword_1ECD09880 = +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &unk_1EDCC7820);
  objc_msgSend((id)qword_1ECD09880, "setInterface:forSelector:argumentIndex:ofReply:", objc_msgSend(*(id *)(a1 + 32), "_publisherInterface"), sel_addPublisher_forID_withValues_isOld_, 0, 0);
  objc_msgSend((id)qword_1ECD09880, "setClasses:forSelector:argumentIndex:ofReply:", +[NSProgressValues decodableClasses](NSProgressValues, "decodableClasses"), sel_observePublisherForID_values_forKeys_, 1, 0);
  return objc_msgSend((id)qword_1ECD09880, "setClasses:forSelector:argumentIndex:ofReply:", +[NSProgressValues decodableClasses](NSProgressValues, "decodableClasses"), sel_observePublisherUserInfoForID_value_forKey_, 1, 0);
}

uint64_t __33__NSProgress__registrarInterface__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;

  qword_1ECD09890 = +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &unk_1EDCC7A88);
  objc_msgSend((id)qword_1ECD09890, "setInterface:forSelector:argumentIndex:ofReply:", objc_msgSend(*(id *)(a1 + 32), "_publisherInterface"), sel_addPublisher_forID_acknowledgementAppBundleIDs_category_fileURL_initialValues_completionHandler_, 0, 0);
  v2 = (void *)qword_1ECD09890;
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0), sel_addPublisher_forID_acknowledgementAppBundleIDs_category_fileURL_initialValues_completionHandler_, 2, 0);
  v5 = (void *)qword_1ECD09890;
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0), sel_addPublisher_forID_acknowledgementAppBundleIDs_category_fileURL_initialValues_completionHandler_, 0, 1);
  objc_msgSend((id)qword_1ECD09890, "setClasses:forSelector:argumentIndex:ofReply:", +[NSProgressValues decodableClasses](NSProgressValues, "decodableClasses"), sel_observePublisherForID_values_forKeys_, 1, 0);
  objc_msgSend((id)qword_1ECD09890, "setClasses:forSelector:argumentIndex:ofReply:", +[NSProgressValues decodableClasses](NSProgressValues, "decodableClasses"), sel_observePublisherUserInfoForID_value_forKey_, 1, 0);
  objc_msgSend((id)qword_1ECD09890, "setInterface:forSelector:argumentIndex:ofReply:", objc_msgSend(*(id *)(a1 + 32), "_subscriberInterface"), sel_addSubscriber_forID_appBundleID_category_completionHandler_, 0, 0);
  return objc_msgSend((id)qword_1ECD09890, "setInterface:forSelector:argumentIndex:ofReply:", objc_msgSend(*(id *)(a1 + 32), "_subscriberInterface"), sel_addSubscriber_forID_appBundleID_fileURL_completionHandler_, 0, 0);
}

NSXPCInterface *__33__NSProgress__publisherInterface__block_invoke()
{
  NSXPCInterface *result;

  result = +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &unk_1EDCC75A8);
  qword_1ECD09870 = (uint64_t)result;
  return result;
}

uint64_t __31__NSProgress__serverConnection__block_invoke()
{
  qword_1ECD09898 = +[NSFileCoordinator _createConnectionToProgressRegistrar](NSFileCoordinator, "_createConnectionToProgressRegistrar");
  objc_msgSend((id)qword_1ECD09898, "setRemoteObjectInterface:", +[NSProgress _registrarInterface](NSProgress, "_registrarInterface"));
  objc_msgSend((id)qword_1ECD09898, "setOptions:", 4096);
  return objc_msgSend((id)qword_1ECD09898, "resume");
}

- (void)setFileTotalCount:(NSNumber *)fileTotalCount
{
  -[NSProgress setUserInfoObject:forKey:](self, "setUserInfoObject:forKey:", fileTotalCount, CFSTR("NSProgressFileTotalCountKey"));
}

- (void)setFileCompletedCount:(NSNumber *)fileCompletedCount
{
  -[NSProgress setUserInfoObject:forKey:](self, "setUserInfoObject:forKey:", fileCompletedCount, CFSTR("NSProgressFileCompletedCountKey"));
}

- (NSString)localizedDescription
{
  NSProgressValues *values;
  NSString *v4;
  NSString *v5;
  void *v6;
  __objc2_class **v7;
  __objc2_class **v8;
  void *v9;
  void *v10;
  int v11;
  int64_t completed;
  uint64_t total;
  uint64_t v14;
  BOOL v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  double v19;
  double v20;
  uint64_t v21;
  void *v22;
  NSString *v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  void *v28;
  const __CFString *v29;
  void *v30;
  const __CFString *v31;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  -[NSLock lock](self->_lock, "lock");
  values = self->_values;
  v4 = values->_localizedDescription;
  if (!v4)
  {
    if (!-[NSString isEqualToString:](values->_kind, "isEqualToString:", CFSTR("NSProgressKindFile")))
    {
      completed = values->_selfFraction.completed;
      if (completed < 0
        || ((total = values->_selfFraction.total, v14 = total | completed, total >= 1) ? (v15 = v14 == 0) : (v15 = 1),
            v15))
      {
        -[NSLock unlock](self->_lock, "unlock");
        return (NSString *)&stru_1E0F56070;
      }
      -[NSProgressValues fractionCompleted](values, "fractionCompleted");
      v20 = v19;
      v21 = -[NSMutableDictionary objectForKey:](values->_userInfo, "objectForKey:", CFSTR("NSProgressLocalizedDescriptionPercentCompleteFormatterKey"));
      if (!v21 || (v22 = (void *)v21, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        if (qword_1ECD098A8 != -1)
          dispatch_once(&qword_1ECD098A8, &__block_literal_global_669);
        v22 = (void *)qword_1ECD098B0;
      }
      v23 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", objc_msgSend((id)_NSFoundationBundle(), "localizedStringForKey:value:table:", CFSTR("%@ completed"), &stru_1E0F56070, CFSTR("Progress")), objc_msgSend(v22, "stringFromNumber:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v20)), v32);
      goto LABEL_60;
    }
    v6 = (void *)-[NSMutableDictionary objectForKey:](values->_userInfo, "objectForKey:", CFSTR("NSProgressFileDisplayNameKey"));
    v33[0] = v6;
    if ((_NSIsNSString() & 1) == 0)
    {
      v6 = 0;
      v33[0] = 0;
    }
    if (!objc_msgSend(v6, "length"))
    {
      v6 = 0;
      v33[0] = 0;
    }
    v7 = (__objc2_class **)-[NSMutableDictionary objectForKey:](values->_userInfo, "objectForKey:", CFSTR("NSProgressFileTotalCountKey"));
    if (_NSIsNSNumber())
      v8 = v7;
    else
      v8 = 0;
    v9 = (void *)-[NSMutableDictionary objectForKey:](values->_userInfo, "objectForKey:", CFSTR("NSProgressFileURLKey"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      v9 = 0;
    if (!v8 || objc_msgSend(v8, "longLongValue") <= 1)
    {
      if (!v6)
      {
        v7 = v8;
        if (!v9)
          goto LABEL_17;
        if ((objc_msgSend(v9, "getResourceValue:forKey:error:", v33, *MEMORY[0x1E0C99A70], 0) & 1) == 0)
          v33[0] = 0;
      }
      v7 = &off_1E0FBEA18;
    }
LABEL_17:
    v10 = (void *)-[NSMutableDictionary objectForKey:](values->_userInfo, "objectForKey:", CFSTR("NSProgressUseItemDescriptionKey"));
    if (_NSIsNSNumber())
      v11 = objc_msgSend(v10, "BOOLValue");
    else
      v11 = 0;
    v16 = (void *)-[NSMutableDictionary objectForKey:](values->_userInfo, "objectForKey:", CFSTR("NSProgressFileOperationKindKey"));
    if (objc_msgSend(v16, "isEqualToString:", CFSTR("NSProgressFileOperationKindDownloading")))
    {
      v17 = (void *)_NSFoundationBundle();
      v18 = CFSTR("Downloading");
    }
    else if (objc_msgSend(v16, "isEqualToString:", CFSTR("NSProgressFileOperationKindUploading")))
    {
      v17 = (void *)_NSFoundationBundle();
      v18 = CFSTR("Uploading");
    }
    else if (objc_msgSend(v16, "isEqualToString:", CFSTR("NSProgressFileOperationKindDecompressingAfterDownloading")))
    {
      v17 = (void *)_NSFoundationBundle();
      v18 = CFSTR("DecompressingAfterDownloading");
    }
    else if (objc_msgSend(v16, "isEqualToString:", CFSTR("NSProgressFileOperationKindReceiving")))
    {
      v17 = (void *)_NSFoundationBundle();
      v18 = CFSTR("Receiving");
    }
    else if (objc_msgSend(v16, "isEqualToString:", CFSTR("NSProgressFileOperationKindCopying")))
    {
      v17 = (void *)_NSFoundationBundle();
      v18 = CFSTR("Copying");
    }
    else if (objc_msgSend(v16, "isEqualToString:", CFSTR("NSProgressFileOperationKindDuplicating")))
    {
      v17 = (void *)_NSFoundationBundle();
      v18 = CFSTR("Duplicating");
    }
    else if (objc_msgSend(v16, "isEqualToString:", CFSTR("NSProgressFileOperationKindCompressing")))
    {
      v17 = (void *)_NSFoundationBundle();
      v18 = CFSTR("Compressing");
    }
    else if (objc_msgSend(v16, "isEqualToString:", CFSTR("NSProgressFileOperationKindDecompressing")))
    {
      v17 = (void *)_NSFoundationBundle();
      v18 = CFSTR("Decompressing");
    }
    else if (objc_msgSend(v16, "isEqualToString:", CFSTR("NSProgressFileOperationKindArchiving")))
    {
      v17 = (void *)_NSFoundationBundle();
      v18 = CFSTR("Archiving");
    }
    else
    {
      v24 = objc_msgSend(v16, "isEqualToString:", CFSTR("NSProgressFileOperationKindUnarchiving"));
      v17 = (void *)_NSFoundationBundle();
      if (v24)
        v18 = CFSTR("Unarchiving");
      else
        v18 = CFSTR("Processing");
    }
    v25 = objc_msgSend(v17, "localizedStringForKey:value:table:", v18, &stru_1E0F56070, CFSTR("Progress"));
    if (v33[0])
    {
      v26 = objc_msgSend((id)_NSFoundationBundle(), "localizedStringForKey:value:table:", CFSTR("%@ \\U201C%@\\U201D\\U2026"), &stru_1E0F56070, CFSTR("Progress"));
      v32 = v33[0];
LABEL_59:
      v23 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v26, v25, v32);
      goto LABEL_60;
    }
    if (!v7)
    {
      v30 = (void *)_NSFoundationBundle();
      if (v11)
        v31 = CFSTR("%@ items\\U2026");
      else
        v31 = CFSTR("%@ files\\U2026");
      v26 = objc_msgSend(v30, "localizedStringForKey:value:table:", v31, &stru_1E0F56070, CFSTR("Progress"));
      goto LABEL_59;
    }
    v28 = (void *)_NSFoundationBundle();
    if (v11)
      v29 = CFSTR("%@ %lld items…");
    else
      v29 = CFSTR("%@ %lld files…");
    v23 = +[NSString localizedStringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", objc_msgSend(v28, "localizedStringForKey:value:table:", v29, &stru_1E0F56070, CFSTR("Progress")), CFSTR("%lld %@"), 0, objc_msgSend(v7, "longLongValue"), v25);
LABEL_60:
    v5 = v23;
    -[NSLock unlock](self->_lock, "unlock");
    if (v5)
      return v5;
    return (NSString *)&stru_1E0F56070;
  }
  v5 = v4;
  -[NSLock unlock](self->_lock, "unlock");
  return v5;
}

- (void)appWithBundleID:(id)a3 didAcknowledgeWithSuccess:(BOOL)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  qos_class_t v10;
  NSObject *global_queue;
  _QWORD block[5];
  BOOL v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[NSLock lock](self->_lock, "lock");
  v7 = objc_msgSend(a3, "lowercaseString");
  v8 = -[NSMutableDictionary objectForKey:](self->_acknowledgementHandlersByLowercaseBundleID, "objectForKey:", v7);
  if (v8)
  {
    v9 = v8;
    v10 = qos_class_self();
    global_queue = dispatch_get_global_queue(v10, 0);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__NSProgress_appWithBundleID_didAcknowledgeWithSuccess___block_invoke;
    block[3] = &unk_1E0F54118;
    block[4] = v9;
    v13 = a4;
    dispatch_async(global_queue, block);
    -[NSMutableDictionary removeObjectForKey:](self->_acknowledgementHandlersByLowercaseBundleID, "removeObjectForKey:", v7);
  }
  -[NSLock unlock](self->_lock, "unlock");
}

- (void)_setRemoteUserInfoValue:(id)a3 forKey:(id)a4
{
  -[NSProgress _setUserInfoValue:forKey:fromChild:](self, "_setUserInfoValue:forKey:fromChild:", a3, a4, 0);
}

- (void)_receiveProgressMessage:(void *)a1 forSequence:(xpc_object_t)xdict
{
  uint64_t v4;
  const __CFString *v5;
  uint64_t uint64;
  const __CFString *v7;
  const char *string;
  BOOL v9;
  NSString *v10;
  NSString *v11;
  NSString *v12;

  if (a1)
  {
    if (!xpc_dictionary_get_BOOL(xdict, "isUserInfo"))
    {
      uint64 = xpc_dictionary_get_uint64(xdict, "totalCount");
      objc_msgSend(a1, "_setCompletedUnitCount:totalUnitCount:", xpc_dictionary_get_uint64(xdict, "completedCount"), uint64);
      return;
    }
    v4 = xpc_dictionary_get_uint64(xdict, "userInfoKey");
    if ((v4 & 0xFFFFFFFFFFFFFFFBLL) - 1 > 1)
    {
      if (v4 - 3 > 1)
      {
        if (v4 == 8)
        {
          objc_msgSend(a1, "setPausable:", xpc_dictionary_get_BOOL(xdict, "isPausable"));
        }
        else if (v4 == 7)
        {
          objc_msgSend(a1, "setCancellable:", xpc_dictionary_get_BOOL(xdict, "isCancellable"));
        }
        v10 = 0;
LABEL_28:

        return;
      }
      v7 = CFSTR("_NSProgressRemoteLocalizedAdditionalDescriptionKey");
      if (v4 != 4)
        v7 = 0;
      if (v4 == 3)
        v5 = CFSTR("_NSProgressRemoteLocalizedDescriptionKey");
      else
        v5 = v7;
      string = xpc_dictionary_get_string(xdict, "userInfoVal");
      v9 = xpc_dictionary_get_BOOL(xdict, "userInfoValNil");
      v10 = 0;
      if (!string || v9)
      {
LABEL_24:
        if (v5)
        {
          v12 = v10;
          objc_msgSend(a1, "setUserInfoObject:forKey:", v10, v5);

          return;
        }
        goto LABEL_28;
      }
      v11 = -[NSString initWithUTF8String:]([NSString alloc], "initWithUTF8String:", string);
    }
    else
    {
      if (v4 - 1 > 5)
        v5 = 0;
      else
        v5 = off_1E0F55D50[v4 - 1];
      if (xpc_dictionary_get_BOOL(xdict, "userInfoValNil"))
      {
        v10 = 0;
        goto LABEL_24;
      }
      v11 = -[NSNumber initWithUnsignedInteger:]([NSNumber alloc], "initWithUnsignedInteger:", xpc_dictionary_get_uint64(xdict, "userInfoVal"));
    }
    v10 = v11;
    goto LABEL_24;
  }
}

- (id)_initWithValues:(id)a3
{
  NSProgress *v4;
  NSProgressValues *v5;
  double v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)NSProgress;
  v4 = -[NSProgress init](&v8, sel_init);
  if (v4)
  {
    v5 = (NSProgressValues *)objc_msgSend(a3, "copy");
    v4->_values = v5;
    -[NSProgressValues fractionCompleted](v5, "fractionCompleted");
    v4->_values->_remoteFractionCompleted = v6;
  }
  return v4;
}

- (void)_addImplicitChild:(id)a3
{
  uint64_t v5;
  uint64_t v6;

  v5 = _CFGetTSD();
  if (!*(_BYTE *)(v5 + 24))
  {
    v6 = v5;
    -[NSProgress addChild:withPendingUnitCount:](self, "addChild:withPendingUnitCount:", a3, *(_QWORD *)(v5 + 16));
    *(_BYTE *)(v6 + 24) = 1;
  }
}

+ (void)removeSubscriber:(id)subscriber
{
  objc_msgSend(subscriber, "stop");
}

+ (id)addSubscriberForFileURL:(NSURL *)url withPublishingHandler:(NSProgressPublishingHandler)publishingHandler
{
  _NSProgressSubscriber *v5;

  v5 = -[_NSProgressSubscriber initWithPublishingHandler:]([_NSProgressSubscriber alloc], "initWithPublishingHandler:", publishingHandler);
  -[_NSProgressSubscriber startForFileURL:](v5, "startForFileURL:", url);
  return v5;
}

+ (id)_subscriberInterface
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __34__NSProgress__subscriberInterface__block_invoke;
  v3[3] = &unk_1E0F4D2D8;
  v3[4] = a1;
  if (qword_1ECD09878 != -1)
    dispatch_once(&qword_1ECD09878, v3);
  return (id)qword_1ECD09880;
}

+ (id)_serverConnection
{
  if (qword_1ECD098A0 != -1)
    dispatch_once(&qword_1ECD098A0, &__block_literal_global_399);
  return (id)qword_1ECD09898;
}

+ (id)_registrarInterface
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __33__NSProgress__registrarInterface__block_invoke;
  v3[3] = &unk_1E0F4D2D8;
  v3[4] = a1;
  if (qword_1ECD09888 != -1)
    dispatch_once(&qword_1ECD09888, v3);
  return (id)qword_1ECD09890;
}

+ (id)_publisherInterface
{
  if (qword_1ECD09868 != -1)
    dispatch_once(&qword_1ECD09868, &__block_literal_global_325);
  return (id)qword_1ECD09870;
}

+ (NSProgress)progressWithTotalUnitCount:(int64_t)unitCount parent:(NSProgress *)parent pendingUnitCount:(int64_t)portionOfParentTotalUnitCount
{
  NSProgress *v8;

  v8 = -[NSProgress initWithParent:userInfo:]([NSProgress alloc], "initWithParent:userInfo:", 0, 0);
  -[NSProgress setTotalUnitCount:](v8, "setTotalUnitCount:", unitCount);
  -[NSProgress addChild:withPendingUnitCount:](parent, "addChild:withPendingUnitCount:", v8, portionOfParentTotalUnitCount);
  return v8;
}

- (void)performAsCurrentWithPendingUnitCount:(int64_t)unitCount usingBlock:(void *)work
{
  -[NSProgress becomeCurrentWithPendingUnitCount:](self, "becomeCurrentWithPendingUnitCount:", unitCount);
  (*((void (**)(void *))work + 2))(work);
  -[NSProgress resignCurrent](self, "resignCurrent");
}

- (BOOL)_adoptChildUserInfo
{
  return (LOBYTE(self->_flags) >> 1) & 1;
}

id __51__NSProgress__notifyRemoteObserversOfValueForKeys___block_invoke()
{
  id result;

  result = +[NSProgressValues _importantKeys](NSProgressValues, "_importantKeys");
  qword_1ECD09860 = (uint64_t)result;
  return result;
}

- (void)setLocalizedDescription:(NSString *)localizedDescription
{
  _QWORD v3[5];
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  v3[4] = localizedDescription;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __38__NSProgress_setLocalizedDescription___block_invoke;
  v4[3] = &unk_1E0F55B10;
  v4[4] = localizedDescription;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __38__NSProgress_setLocalizedDescription___block_invoke_2;
  v3[3] = &unk_1E0F55B38;
  -[NSProgress _setValueForKeys:settingBlock:](self, "_setValueForKeys:settingBlock:", v4, v3);
}

void *__38__NSProgress_setLocalizedDescription___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(a2 + 72))
    return 0;
  else
    return &unk_1E0FCEC20;
}

uint64_t __38__NSProgress_setLocalizedDescription___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "copy");
  *(_QWORD *)(a2 + 72) = result;
  return result;
}

+ (id)keyPathsForValuesAffectingLocalizedDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("kind"), CFSTR("completedUnitCount"), CFSTR("totalUnitCount"), CFSTR("fractionCompleted"), CFSTR("userInfo.NSProgressFileOperationKindKey"), CFSTR("userInfo.NSProgressFileURLKey"), CFSTR("userInfo.NSProgressFileTotalCountKey"), CFSTR("userInfo.NSProgressFileCompletedCountKey"), CFSTR("userInfo.NSProgressByteTotalCountKey"), CFSTR("userInfo.NSProgressByteCompletedCountKey"), CFSTR("userInfo.NSProgressFileDisplayNameKey"), 0);
}

- (void)setLocalizedAdditionalDescription:(NSString *)localizedAdditionalDescription
{
  _QWORD v3[5];
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  v3[4] = localizedAdditionalDescription;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__NSProgress_setLocalizedAdditionalDescription___block_invoke;
  v4[3] = &unk_1E0F55B10;
  v4[4] = localizedAdditionalDescription;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __48__NSProgress_setLocalizedAdditionalDescription___block_invoke_2;
  v3[3] = &unk_1E0F55B38;
  -[NSProgress _setValueForKeys:settingBlock:](self, "_setValueForKeys:settingBlock:", v4, v3);
}

void *__48__NSProgress_setLocalizedAdditionalDescription___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(a2 + 80))
    return 0;
  else
    return &unk_1E0FCEC38;
}

uint64_t __48__NSProgress_setLocalizedAdditionalDescription___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "copy");
  *(_QWORD *)(a2 + 80) = result;
  return result;
}

+ (id)keyPathsForValuesAffectingLocalizedAdditionalDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("kind"), CFSTR("completedUnitCount"), CFSTR("fractionCompleted"), CFSTR("totalUnitCount"), CFSTR("userInfo.NSProgressFileOperationKindKey"), CFSTR("userInfo.NSProgressFileTotalCountKey"), CFSTR("userInfo.NSProgressFileCompletedCountKey"), CFSTR("userInfo.NSProgressByteTotalCountKey"), CFSTR("userInfo.NSProgressByteCompletedCountKey"), CFSTR("userInfo.NSProgressEstimatedTimeRemainingKey"), CFSTR("userInfo.NSProgressThroughputKey"), 0);
}

- (NSString)localizedAdditionalDescription
{
  NSProgressValues *values;
  NSString *v4;
  NSString *v5;
  void *v7;
  void *v8;
  BOOL v9;
  NSString *locked;
  NSString *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  NSString *v19;
  NSString *v20;
  int v21;
  uint64_t v22;
  NSString *v23;
  uint64_t v24;
  uint64_t total;
  uint64_t completed;
  NSString *v27;
  NSString *v28;
  void *v29;
  NSString *v30;
  NSString *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  BOOL v38;
  int v39;
  NSString *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  BOOL v46;
  uint64_t v47;
  void *v48;
  const __CFString *v49;

  -[NSLock lock](self->_lock, "lock");
  values = self->_values;
  v4 = values->_localizedAdditionalDescription;
  if (v4)
  {
    v5 = v4;
LABEL_3:
    -[NSLock unlock](self->_lock, "unlock");
    return v5;
  }
  v7 = (void *)-[NSMutableDictionary objectForKey:](values->_userInfo, "objectForKey:", CFSTR("NSProgressByteTotalCountKey"));
  v8 = (void *)-[NSMutableDictionary objectForKey:](values->_userInfo, "objectForKey:", CFSTR("NSProgressByteCompletedCountKey"));
  if (-[NSString isEqualToString:](values->_kind, "isEqualToString:", CFSTR("NSProgressKindFile"))
    || (v8 ? (v9 = v7 == 0) : (v9 = 1), !v9))
  {
    locked = (NSString *)_lockedLocalizedTimeRemaining((uint64_t)values);
    v11 = _localizedAppendedTimeRemaining(locked);
    v12 = (void *)-[NSMutableDictionary objectForKey:](values->_userInfo, "objectForKey:", CFSTR("NSProgressUseItemDescriptionKey"));
    if (_NSIsNSNumber())
      v13 = objc_msgSend(v12, "BOOLValue");
    else
      v13 = 0;
    v14 = -[NSMutableDictionary objectForKey:](values->_userInfo, "objectForKey:", CFSTR("NSProgressLocalizedDescriptionFileSizeFormatterOptionsKey"));
    if (v14 && (v15 = (void *)v14, _NSIsNSNumber()))
      v16 = objc_msgSend(v15, "unsignedLongLongValue");
    else
      v16 = 0x1000000;
    if (-[NSMutableDictionary objectForKey:](values->_userInfo, "objectForKey:", CFSTR("NSProgressThroughputKey"))
      && (v17 = (void *)-[NSMutableDictionary objectForKey:](values->_userInfo, "objectForKey:", CFSTR("NSProgressThroughputKey")), _NSIsNSNumber()))
    {
      v18 = objc_msgSend(v17, "unsignedLongLongValue");
      v19 = locked;
      v20 = v11;
      v21 = v13;
      v22 = objc_msgSend((id)_NSFoundationBundle(), "localizedStringForKey:value:table:", CFSTR("%@/s"), &stru_1E0F56070, CFSTR("Progress"));
      v23 = NSLocalizedFileSizeDescription(v18, 0, v16);
      v24 = v22;
      v13 = v21;
      v11 = v20;
      locked = v19;
      v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v24, v23);
      if (!v7)
        goto LABEL_24;
    }
    else
    {
      v5 = 0;
      if (!v7)
        goto LABEL_24;
    }
    if (v8)
    {
      total = objc_msgSend(v7, "longLongValue");
      completed = objc_msgSend(v8, "longLongValue");
LABEL_25:
      v27 = 0;
      v28 = 0;
      if (total && completed <= total)
      {
        v27 = NSLocalizedFileSizeDescription(completed, 0, v16);
        v28 = NSLocalizedFileSizeDescription(total, 0, v16);
      }
      v29 = (void *)-[NSMutableDictionary objectForKey:](values->_userInfo, "objectForKey:", CFSTR("NSProgressFileOperationKindKey"));
      if ((objc_msgSend(v29, "isEqualToString:", CFSTR("NSProgressFileOperationKindDownloading")) & 1) != 0
        || (objc_msgSend(v29, "isEqualToString:", CFSTR("NSProgressFileOperationKindUploading")) & 1) != 0)
      {
        if (!v27)
          goto LABEL_43;
      }
      else if (!objc_msgSend(v29, "isEqualToString:", CFSTR("NSProgressFileOperationKindReceiving"))
             || !v27)
      {
        goto LABEL_38;
      }
      if (v28 && v5)
      {
        v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", objc_msgSend((id)_NSFoundationBundle(), "localizedStringForKey:value:table:", CFSTR("%@ of %@ (%@)"), &stru_1E0F56070, CFSTR("Progress")), v27, v28, v5);
        if (!v11)
          goto LABEL_59;
        v30 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v5, v11);
LABEL_58:
        v5 = v30;
LABEL_59:
        if (v5)
          goto LABEL_3;
        goto LABEL_60;
      }
LABEL_38:
      if (v27 && v28)
      {
        v31 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", objc_msgSend((id)_NSFoundationBundle(), "localizedStringForKey:value:table:", CFSTR("%@ of %@"), &stru_1E0F56070, CFSTR("Progress")), v27, v28);
        if (v31)
          goto LABEL_41;
        goto LABEL_49;
      }
LABEL_43:
      v32 = (void *)-[NSMutableDictionary objectForKey:](values->_userInfo, "objectForKey:", CFSTR("NSProgressFileCompletedCountKey"));
      v33 = -[NSMutableDictionary objectForKey:](values->_userInfo, "objectForKey:", CFSTR("NSProgressFileTotalCountKey"));
      if (!v32)
      {
LABEL_48:
        v31 = 0;
        goto LABEL_49;
      }
      v34 = (void *)v33;
      v35 = _NSIsNSNumber();
      v31 = 0;
      if (v35 && v34)
      {
        if (!_NSIsNSNumber())
          goto LABEL_48;
        v36 = objc_msgSend(v32, "longLongValue");
        v37 = objc_msgSend(v34, "longLongValue");
        if (v36 > v37)
          goto LABEL_48;
        v47 = v37;
        v48 = (void *)_NSFoundationBundle();
        if (v13)
          v49 = CFSTR("%lld of %lld items");
        else
          v49 = CFSTR("%lld of %lld files");
        v31 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", objc_msgSend(v48, "localizedStringForKey:value:table:", v49, &stru_1E0F56070, CFSTR("Progress")), v47, v36);
        if (!v31)
          goto LABEL_49;
LABEL_41:
        if (v11)
          v31 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v31, v11);
      }
LABEL_49:
      if (v31)
        v38 = 1;
      else
        v38 = v5 == 0;
      v39 = !v38;
      if (!locked || !v39)
      {
        if ((v39 & 1) != 0)
          goto LABEL_3;
        v46 = v31 || locked == 0;
        v5 = v46 ? v31 : locked;
        if (v5)
          goto LABEL_3;
        goto LABEL_60;
      }
      v30 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", objc_msgSend((id)_NSFoundationBundle(), "localizedStringForKey:value:table:", CFSTR("%@ (%@)"), &stru_1E0F56070, CFSTR("Progress")), locked, v5);
      goto LABEL_58;
    }
LABEL_24:
    completed = values->_selfFraction.completed;
    total = values->_selfFraction.total;
    goto LABEL_25;
  }
LABEL_60:
  v5 = (NSString *)_lockedLocalizedTimeRemaining((uint64_t)values);
  v40 = _localizedAppendedTimeRemaining(v5);
  v41 = -[NSMutableDictionary objectForKey:](values->_userInfo, "objectForKey:", CFSTR("NSProgressSuppressUnitCountInAdditionalDescriptionKey"));
  if (v41 && (v42 = (void *)v41, _NSIsNSNumber()) && (objc_msgSend(v42, "BOOLValue") & 1) != 0
    || values->_selfFraction.total < 1
    || values->_selfFraction.completed < 0)
  {
    if (!v40)
    {
      -[NSLock unlock](self->_lock, "unlock");
      return (NSString *)&stru_1E0F56070;
    }
  }
  else
  {
    v43 = -[NSMutableDictionary objectForKey:](values->_userInfo, "objectForKey:", CFSTR("NSProgressLocalizedDescriptionUnitCountFormatterKey"));
    if (v43 && (v44 = (void *)v43, (objc_opt_isKindOfClass() & 1) != 0))
    {
      v45 = objc_msgSend(v44, "stringFromNumber:", +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", values->_selfFraction.completed));
    }
    else
    {
      if (qword_1ECD098C8 != -1)
        dispatch_once(&qword_1ECD098C8, &__block_literal_global_691);
      v45 = objc_msgSend((id)qword_1ECD098D0, "stringFromNumber:", +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", values->_selfFraction.completed));
      v44 = (void *)qword_1ECD098D0;
    }
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", objc_msgSend((id)_NSFoundationBundle(), "localizedStringForKey:value:table:", CFSTR("%@ of %@"), &stru_1E0F56070, CFSTR("Progress")), v45, objc_msgSend(v44, "stringFromNumber:", +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", values->_selfFraction.total)));
    if (v40)
      v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v5, v40);
  }
  -[NSLock unlock](self->_lock, "unlock");
  if (v5)
    return v5;
  return (NSString *)&stru_1E0F56070;
}

uint64_t __29__NSProgress_setCancellable___block_invoke_2(uint64_t result, uint64_t a2)
{
  *(_BYTE *)(a2 + 104) = *(_BYTE *)(result + 32);
  return result;
}

- (void)_setCancellable:(BOOL)a3 fromChild:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;

  v4 = a4;
  v5 = a3;
  -[NSLock lock](self->_lock, "lock");
  if (!v4 || (self->_flags & 2) != 0)
  {
    -[NSLock unlock](self->_lock, "unlock");
    objc_msgSend(objc_loadWeak((id *)&self->_parent), "_setCancellable:fromChild:", v5, 1);
  }
  else
  {
    -[NSLock unlock](self->_lock, "unlock");
  }
}

uint64_t __26__NSProgress_setPausable___block_invoke_2(uint64_t result, uint64_t a2)
{
  *(_BYTE *)(a2 + 105) = *(_BYTE *)(result + 32);
  return result;
}

- (void)_setPausable:(BOOL)a3 fromChild:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL8 v5;

  v4 = a4;
  v5 = a3;
  -[NSLock lock](self->_lock, "lock");
  if (!v4 || (self->_flags & 2) != 0)
  {
    -[NSLock unlock](self->_lock, "unlock");
    objc_msgSend(objc_loadWeak((id *)&self->_parent), "_setPausable:fromChild:", v5, 1);
  }
  else
  {
    -[NSLock unlock](self->_lock, "unlock");
  }
}

- (void)pausingHandler
{
  id v3;

  -[NSLock lock](self->_lock, "lock");
  v3 = self->_pausingHandler;
  -[NSLock unlock](self->_lock, "unlock");
  return v3;
}

- (void)resumingHandler
{
  id v3;

  -[NSLock lock](self->_lock, "lock");
  v3 = self->_resumingHandler;
  -[NSLock unlock](self->_lock, "unlock");
  return v3;
}

- (id)_indentedDescription:(unint64_t)a3
{
  NSString *v5;
  unint64_t v6;
  NSProgressValues *values;
  NSString *v8;
  NSString *v9;
  id v10;
  int64_t portionOfParent;
  uint64_t v12;
  const char *v13;
  const char *v14;
  NSMutableSet *children;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t i;
  objc_super v22;
  _BYTE v23[128];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = +[NSString string](NSMutableString, "string");
  if (a3)
  {
    v6 = a3;
    do
    {
      -[NSString appendString:](v5, "appendString:", CFSTR("  "));
      --v6;
    }
    while (v6);
  }
  values = self->_values;
  v8 = +[NSString string](NSMutableString, "string");
  v22.receiver = self;
  v22.super_class = (Class)NSProgress;
  v9 = -[NSProgress description](&v22, sel_description);
  v10 = -[NSProgress _parent](self, "_parent");
  portionOfParent = values->_portionOfParent;
  -[NSProgressValues fractionCompleted](values, "fractionCompleted");
  if (values->_isCancelled)
    v13 = "CANCELLED";
  else
    v13 = "";
  if (values->_isPaused)
    v14 = "PAUSED";
  else
    v14 = "";
  -[NSString appendFormat:](v8, "appendFormat:", CFSTR("%@%@ : Parent: %p (portion: %lld) / Fraction completed: %0.4f / Completed: %lld of %lld %s %s"), v5, v9, v10, portionOfParent, v12, values->_selfFraction.completed, values->_selfFraction.total, v13, v14);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  children = self->_children;
  v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:](children, "countByEnumeratingWithState:objects:count:", &v24, v23, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v25;
    v19 = a3 + 1;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v25 != v18)
          objc_enumerationMutation(children);
        -[NSString appendFormat:](v8, "appendFormat:", CFSTR("\n%@"), objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "_indentedDescription:", v19));
      }
      v17 = -[NSMutableSet countByEnumeratingWithState:objects:count:](children, "countByEnumeratingWithState:objects:count:", &v24, v23, 16);
    }
    while (v17);
  }
  return v8;
}

- (NSString)description
{
  return (NSString *)-[NSProgress _indentedDescription:](self, "_indentedDescription:", 0);
}

void __20__NSProgress_cancel__block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)pause
{
  qos_class_t v3;
  NSObject *global_queue;
  NSMutableSet *children;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  _QWORD block[5];
  _BYTE v11[128];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[NSProgress _setValueForKeys:settingBlock:](self, "_setValueForKeys:settingBlock:", &__block_literal_global_301_0, &__block_literal_global_304_0);
  -[NSLock lock](self->_lock, "lock");
  if (self->_pausingHandler)
  {
    v3 = qos_class_self();
    global_queue = dispatch_get_global_queue(v3, 0);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __19__NSProgress_pause__block_invoke_3;
    block[3] = &unk_1E0F4D2D8;
    block[4] = self;
    dispatch_async(global_queue, block);
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  children = self->_children;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](children, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(children);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "pause");
      }
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](children, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
    }
    while (v7);
  }
  -[NSLock unlock](self->_lock, "unlock");
}

void *__19__NSProgress_pause__block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(_BYTE *)(a2 + 107))
    return 0;
  else
    return &unk_1E0FCEC98;
}

void __19__NSProgress_pause__block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(a2 + 107) = 1;
}

uint64_t __19__NSProgress_pause__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 16))();
}

- (void)resume
{
  qos_class_t v3;
  NSObject *global_queue;
  NSMutableSet *children;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  _QWORD block[5];
  _BYTE v11[128];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[NSProgress _setValueForKeys:settingBlock:](self, "_setValueForKeys:settingBlock:", &__block_literal_global_305, &__block_literal_global_308_0);
  -[NSLock lock](self->_lock, "lock");
  if (self->_resumingHandler)
  {
    v3 = qos_class_self();
    global_queue = dispatch_get_global_queue(v3, 0);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __20__NSProgress_resume__block_invoke_3;
    block[3] = &unk_1E0F4D2D8;
    block[4] = self;
    dispatch_async(global_queue, block);
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  children = self->_children;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](children, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(children);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "resume");
      }
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](children, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
    }
    while (v7);
  }
  -[NSLock unlock](self->_lock, "unlock");
}

void *__20__NSProgress_resume__block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(_BYTE *)(a2 + 107))
    return &unk_1E0FCECB0;
  else
    return 0;
}

void __20__NSProgress_resume__block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(a2 + 107) = 0;
}

uint64_t __20__NSProgress_resume__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) + 16))();
}

- (NSNumber)estimatedTimeRemaining
{
  return (NSNumber *)-[NSDictionary objectForKey:](-[NSProgress userInfo](self, "userInfo"), "objectForKey:", CFSTR("NSProgressEstimatedTimeRemainingKey"));
}

- (void)setEstimatedTimeRemaining:(NSNumber *)estimatedTimeRemaining
{
  -[NSProgress setUserInfoObject:forKey:](self, "setUserInfoObject:forKey:", estimatedTimeRemaining, CFSTR("NSProgressEstimatedTimeRemainingKey"));
}

- (NSNumber)throughput
{
  return (NSNumber *)-[NSDictionary objectForKey:](-[NSProgress userInfo](self, "userInfo"), "objectForKey:", CFSTR("NSProgressThroughputKey"));
}

- (void)setThroughput:(NSNumber *)throughput
{
  -[NSProgress setUserInfoObject:forKey:](self, "setUserInfoObject:forKey:", throughput, CFSTR("NSProgressThroughputKey"));
}

- (NSProgressFileOperationKind)fileOperationKind
{
  return (NSProgressFileOperationKind)-[NSDictionary objectForKey:](-[NSProgress userInfo](self, "userInfo"), "objectForKey:", CFSTR("NSProgressFileOperationKindKey"));
}

- (void)setFileOperationKind:(NSProgressFileOperationKind)fileOperationKind
{
  -[NSProgress setUserInfoObject:forKey:](self, "setUserInfoObject:forKey:", fileOperationKind, CFSTR("NSProgressFileOperationKindKey"));
}

- (NSURL)fileURL
{
  return (NSURL *)-[NSDictionary objectForKey:](-[NSProgress userInfo](self, "userInfo"), "objectForKey:", CFSTR("NSProgressFileURLKey"));
}

- (void)setFileURL:(NSURL *)fileURL
{
  -[NSProgress setUserInfoObject:forKey:](self, "setUserInfoObject:forKey:", fileURL, CFSTR("NSProgressFileURLKey"));
}

- (NSNumber)fileTotalCount
{
  return (NSNumber *)-[NSDictionary objectForKey:](-[NSProgress userInfo](self, "userInfo"), "objectForKey:", CFSTR("NSProgressFileTotalCountKey"));
}

- (NSNumber)fileCompletedCount
{
  return (NSNumber *)-[NSDictionary objectForKey:](-[NSProgress userInfo](self, "userInfo"), "objectForKey:", CFSTR("NSProgressFileCompletedCountKey"));
}

- (id)byteTotalCount
{
  return -[NSDictionary objectForKey:](-[NSProgress userInfo](self, "userInfo"), "objectForKey:", CFSTR("NSProgressByteTotalCountKey"));
}

- (void)setByteTotalCount:(id)a3
{
  -[NSProgress setUserInfoObject:forKey:](self, "setUserInfoObject:forKey:", a3, CFSTR("NSProgressByteTotalCountKey"));
}

- (id)byteCompletedCount
{
  return -[NSDictionary objectForKey:](-[NSProgress userInfo](self, "userInfo"), "objectForKey:", CFSTR("NSProgressByteCompletedCountKey"));
}

- (void)setByteCompletedCount:(id)a3
{
  -[NSProgress setUserInfoObject:forKey:](self, "setUserInfoObject:forKey:", a3, CFSTR("NSProgressByteCompletedCountKey"));
}

- (void)setKind:(NSProgressKind)kind
{
  _QWORD v3[5];
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  v3[4] = kind;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __22__NSProgress_setKind___block_invoke;
  v4[3] = &unk_1E0F55B10;
  v4[4] = kind;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __22__NSProgress_setKind___block_invoke_2;
  v3[3] = &unk_1E0F55B38;
  -[NSProgress _setValueForKeys:settingBlock:](self, "_setValueForKeys:settingBlock:", v4, v3);
}

void *__22__NSProgress_setKind___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(a2 + 88))
    return 0;
  else
    return &unk_1E0FCECC8;
}

uint64_t __22__NSProgress_setKind___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "copy");
  *(_QWORD *)(a2 + 88) = result;
  return result;
}

- (void)publish
{
  NSMutableDictionary *userInfo;
  void *v4;
  uint64_t v5;
  NSMutableDictionary *acknowledgementHandlersByLowercaseBundleID;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  NSString *v12;
  uint64_t v13;
  NSProgressValues *values;
  NSString *publisherID;
  NSString *v16;
  _QWORD v17[5];
  uint8_t buf[4];
  NSProgress *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  NSString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[NSLock lock](self->_lock, "lock");
  if (self->_publisherID)
  {
    -[NSLock unlock](self->_lock, "unlock");
    v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("-[%p publish]: this instance of NSProgress has already been published and can't be published again."), self);
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v16, 0));
  }
  self->_publisherID = -[NSUUID UUIDString](+[NSUUID UUID](NSUUID, "UUID"), "UUIDString");
  userInfo = self->_values->_userInfo;
  v4 = (void *)-[NSMutableDictionary objectForKey:](userInfo, "objectForKey:", CFSTR("NSProgressCategoryKey"));
  v5 = -[NSMutableDictionary objectForKey:](userInfo, "objectForKey:", CFSTR("NSProgressFileURLKey"));
  acknowledgementHandlersByLowercaseBundleID = self->_acknowledgementHandlersByLowercaseBundleID;
  if (acknowledgementHandlersByLowercaseBundleID)
    v7 = objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", -[NSMutableDictionary allKeys](acknowledgementHandlersByLowercaseBundleID, "allKeys"));
  else
    v7 = 0;
  if (qword_1ECD09840 != -1)
    dispatch_once(&qword_1ECD09840, &__block_literal_global_90);
  if (os_log_type_enabled((os_log_t)_MergedGlobals_25_1, OS_LOG_TYPE_DEBUG))
  {
    v10 = _MergedGlobals_25_1;
    if (os_log_type_enabled((os_log_t)_MergedGlobals_25_1, OS_LOG_TYPE_DEBUG))
    {
      publisherID = self->_publisherID;
      *(_DWORD *)buf = 134218755;
      v19 = self;
      v20 = 2113;
      v21 = v5;
      v22 = 2114;
      v23 = v4;
      v24 = 2114;
      v25 = publisherID;
      _os_log_debug_impl(&dword_1817D9000, v10, OS_LOG_TYPE_DEBUG, "<NSProgress %p> Publishing for URL %{private}@ in category %{public}@ with ID %{public}@", buf, 0x2Au);
    }
  }
  v11 = (void *)objc_msgSend(+[NSProgress _serverConnection](NSProgress, "_serverConnection", v8, v9), "remoteObjectProxy");
  v12 = self->_publisherID;
  v13 = objc_msgSend(v4, "lowercaseString");
  values = self->_values;
  v17[1] = 3221225472;
  v17[2] = __21__NSProgress_publish__block_invoke;
  v17[3] = &unk_1E0F55C60;
  v17[4] = self;
  v17[0] = MEMORY[0x1E0C809B0];
  objc_msgSend(v11, "addPublisher:forID:acknowledgementAppBundleIDs:category:fileURL:initialValues:completionHandler:", self, v12, v7, v13, v5, values, v17);
  -[NSLock unlock](self->_lock, "unlock");
}

uint64_t __21__NSProgress_publish__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE v8[128];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
  if (result)
  {
    v5 = result;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(a2);
        objc_msgSend(*(id *)(a1 + 32), "appWithBundleID:didAcknowledgeWithSuccess:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7++), 0);
      }
      while (v5 != v7);
      result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v9, v8, 16);
      v5 = result;
    }
    while (result);
  }
  return result;
}

- (void)unpublish
{
  NSObject *v3;
  NSString *publisherID;
  int v5;
  NSProgress *v6;
  __int16 v7;
  NSString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[NSLock lock](self->_lock, "lock");
  if (qword_1ECD09840 != -1)
    dispatch_once(&qword_1ECD09840, &__block_literal_global_90);
  if (os_log_type_enabled((os_log_t)_MergedGlobals_25_1, OS_LOG_TYPE_DEBUG))
  {
    v3 = _MergedGlobals_25_1;
    if (os_log_type_enabled((os_log_t)_MergedGlobals_25_1, OS_LOG_TYPE_DEBUG))
    {
      publisherID = self->_publisherID;
      v5 = 134218242;
      v6 = self;
      v7 = 2114;
      v8 = publisherID;
      _os_log_debug_impl(&dword_1817D9000, v3, OS_LOG_TYPE_DEBUG, "<NSProgress %p> Unpublishing %{public}@", (uint8_t *)&v5, 0x16u);
    }
  }
  -[NSProgress _notifyRemoteObserversOfValueForKeys:](self, "_notifyRemoteObserversOfValueForKeys:", &unk_1E0FCECE0);
  objc_msgSend((id)objc_msgSend(+[NSProgress _serverConnection](NSProgress, "_serverConnection"), "remoteObjectProxy"), "removePublisherForID:", self->_publisherID);
  -[NSLock unlock](self->_lock, "unlock");
}

- (void)setAcknowledgementHandler:(id)a3 forAppBundleIdentifier:(id)a4
{
  void *v7;

  -[NSLock lock](self->_lock, "lock");
  if (!self->_acknowledgementHandlersByLowercaseBundleID)
    self->_acknowledgementHandlersByLowercaseBundleID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v7 = (void *)objc_msgSend(a3, "copy");
  -[NSMutableDictionary setObject:forKey:](self->_acknowledgementHandlersByLowercaseBundleID, "setObject:forKey:", v7, objc_msgSend(a4, "lowercaseString"));

  -[NSLock unlock](self->_lock, "unlock");
}

- (id)acknowledgementHandlerForAppBundleIdentifier:(id)a3
{
  id v5;

  -[NSLock lock](self->_lock, "lock");
  v5 = (id)-[NSMutableDictionary objectForKey:](self->_acknowledgementHandlersByLowercaseBundleID, "objectForKey:", objc_msgSend(a3, "lowercaseString"));
  -[NSLock unlock](self->_lock, "unlock");
  return v5;
}

uint64_t __56__NSProgress_appWithBundleID_didAcknowledgeWithSuccess___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)isOld
{
  return 0;
}

- (id)_publishingAppBundleIdentifier
{
  return 0;
}

+ (id)_addSubscriberForCategory:(id)a3 usingPublishingHandler:(id)a4
{
  _NSProgressSubscriber *v5;

  v5 = -[_NSProgressSubscriber initWithPublishingHandler:]([_NSProgressSubscriber alloc], "initWithPublishingHandler:", a4);
  -[_NSProgressSubscriber startForCategory:](v5, "startForCategory:", a3);
  return v5;
}

- (void)setPrioritizable:(BOOL)a3
{
  _QWORD v3[4];
  BOOL v4;
  _QWORD v5[4];
  BOOL v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __31__NSProgress_setPrioritizable___block_invoke;
  v5[3] = &__block_descriptor_33_e35___NSArray_16__0__NSProgressValues_8l;
  v6 = a3;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __31__NSProgress_setPrioritizable___block_invoke_2;
  v3[3] = &__block_descriptor_33_e26_v16__0__NSProgressValues_8l;
  v4 = a3;
  -[NSProgress _setValueForKeys:settingBlock:](self, "_setValueForKeys:settingBlock:", v5, v3);
}

void *__31__NSProgress_setPrioritizable___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(unsigned __int8 *)(a2 + 109) == *(unsigned __int8 *)(a1 + 32))
    return 0;
  else
    return &unk_1E0FCECF8;
}

uint64_t __31__NSProgress_setPrioritizable___block_invoke_2(uint64_t result, uint64_t a2)
{
  *(_BYTE *)(a2 + 109) = *(_BYTE *)(result + 32);
  return result;
}

- (BOOL)isPrioritizable
{
  BOOL isPrioritizable;

  -[NSLock lock](self->_lock, "lock");
  isPrioritizable = self->_values->_isPrioritizable;
  -[NSLock unlock](self->_lock, "unlock");
  return isPrioritizable;
}

- (void)setPrioritizationHandler:(id)a3
{
  id prioritizationHandler;

  -[NSLock lock](self->_lock, "lock");
  prioritizationHandler = self->_prioritizationHandler;
  if (prioritizationHandler != a3)
  {

    self->_prioritizationHandler = (id)objc_msgSend(a3, "copy");
  }
  -[NSLock unlock](self->_lock, "unlock");
}

- (id)prioritizationHandler
{
  id v3;

  -[NSLock lock](self->_lock, "lock");
  v3 = self->_prioritizationHandler;
  -[NSLock unlock](self->_lock, "unlock");
  return v3;
}

- (void)prioritize
{
  qos_class_t v3;
  NSObject *global_queue;
  NSMutableSet *children;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  _QWORD block[5];
  _BYTE v11[128];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[NSLock lock](self->_lock, "lock");
  if (self->_prioritizationHandler)
  {
    v3 = qos_class_self();
    global_queue = dispatch_get_global_queue(v3, 0);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __24__NSProgress_prioritize__block_invoke;
    block[3] = &unk_1E0F4D2D8;
    block[4] = self;
    dispatch_async(global_queue, block);
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  children = self->_children;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](children, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(children);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "prioritize");
      }
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](children, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
    }
    while (v7);
  }
  -[NSLock unlock](self->_lock, "unlock");
}

uint64_t __24__NSProgress_prioritize__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) + 16))();
}

- (void)handleAcknowledgementByAppWithBundleIdentifier:(id)a3 usingBlock:(id)a4
{
  -[NSProgress _setAcknowledgementHandler:forAppBundleIdentifier:](self, "_setAcknowledgementHandler:forAppBundleIdentifier:", a4, a3);
}

- (void)_setRemoteValues:(id)a3 forKeys:(id)a4
{
  uint64_t v7;
  NSObject *v8;
  _QWORD v9[7];
  _QWORD v10[7];
  uint8_t buf[8];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = objc_msgSend(a3, "count");
  if (objc_msgSend(a4, "count") == v7)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __39__NSProgress__setRemoteValues_forKeys___block_invoke;
    v10[3] = &unk_1E0F55CA8;
    v10[5] = a4;
    v10[6] = v7;
    v10[4] = a3;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __39__NSProgress__setRemoteValues_forKeys___block_invoke_2;
    v9[3] = &unk_1E0F55CD0;
    v9[5] = a4;
    v9[6] = v7;
    v9[4] = a3;
    -[NSProgress _setValueForKeys:settingBlock:](self, "_setValueForKeys:settingBlock:", v10, v9);
  }
  else
  {
    if (qword_1ECD09840 != -1)
      dispatch_once(&qword_1ECD09840, &__block_literal_global_90);
    v8 = _MergedGlobals_25_1;
    if (os_log_type_enabled((os_log_t)_MergedGlobals_25_1, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1817D9000, v8, OS_LOG_TYPE_ERROR, "mismatched count of values and keys from remote progress KVO update", buf, 2u);
    }
  }
}

uint64_t __39__NSProgress__setRemoteValues_forKeys___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  void *v6;
  __CFString *v7;
  double v8;
  double v9;
  void *v10;
  const __CFString *v11;

  v4 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if (*(_QWORD *)(a1 + 48))
  {
    v5 = 0;
    do
    {
      v6 = (void *)objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v5);
      v7 = (__CFString *)objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", v5);
      if (!-[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("fractionCompleted"))
        || (v8 = *(double *)(a2 + 64), objc_msgSend(v6, "doubleValue"), v8 == v9))
      {
        v10 = (void *)v4;
        v11 = v7;
      }
      else
      {
        v10 = (void *)v4;
        v11 = CFSTR("fractionCompleted");
      }
      objc_msgSend(v10, "addObject:", v11);
      ++v5;
    }
    while (v5 < *(_QWORD *)(a1 + 48));
  }
  return v4;
}

uint64_t __39__NSProgress__setRemoteValues_forKeys___block_invoke_2(uint64_t result, _QWORD *a2)
{
  uint64_t v3;
  unint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;

  if (*(_QWORD *)(result + 48))
  {
    v3 = result;
    v4 = 0;
    do
    {
      v5 = (void *)objc_msgSend(*(id *)(v3 + 32), "objectAtIndexedSubscript:", v4);
      v6 = (void *)objc_msgSend(*(id *)(v3 + 40), "objectAtIndexedSubscript:", v4);
      if (objc_msgSend(v6, "isEqualToString:", CFSTR("fractionCompleted")))
      {
        result = objc_msgSend(v5, "doubleValue");
        a2[8] = v7;
      }
      else
      {
        result = objc_msgSend(a2, "setValue:forKey:", v5, v6);
      }
      ++v4;
    }
    while (v4 < *(_QWORD *)(v3 + 48));
  }
  return result;
}

- (double)_remoteFractionCompleted
{
  return self->_values->_remoteFractionCompleted;
}

@end
