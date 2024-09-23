@implementation _NSObserverList

+ (_QWORD)_copyObserversOfObject:(int)a3 creatingIfAbsent:
{
  objc_class *v5;
  uint64_t v6;
  _QWORD *v7;
  void **v9;
  void *v10;
  _QWORD *v11;
  id v12;
  _QWORD *v13;

  v5 = (objc_class *)objc_opt_self();
  if (qword_1ECD0A8A0 != -1)
    dispatch_once(&qword_1ECD0A8A0, &__block_literal_global_84);
  v6 = objc_msgSend(a2, "_observerStorageOfSize:", qword_1ECD0A890);
  if (v6)
  {
    v7 = (_QWORD *)v6;
    os_unfair_lock_lock_with_options();
    if (!*v7)
    {
      objc_constructInstance((Class)qword_1ECD0A898, v7);
      v7[1] = a2;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_153);
    return v7;
  }
  else
  {
    v9 = (void **)objc_msgSend(a2, "_observerStorage");
    os_unfair_lock_lock_with_options();
    if (v9)
    {
      v10 = *v9;
      if (!*v9 && a3)
      {
        v11 = objc_alloc_init(v5);
        *v9 = v11;
        v11[1] = a2;
        v10 = *v9;
      }
      v12 = v10;
      os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_153);
      return v12;
    }
    else
    {
      v13 = objc_getAssociatedObject(a2, "_NSObserverListInternalKey");
      if (!v13 && a3)
      {
        v13 = objc_alloc_init(v5);
        v13[1] = a2;
        objc_setAssociatedObject(a2, "_NSObserverListInternalKey", v13, (void *)0x301);
      }
      os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_153);
      return v13;
    }
  }
}

+ (void)destroyObserverListForObject:(uint64_t)a1
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void **v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  size_t (*v10)(uint64_t);
  void *v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = objc_opt_self();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __48___NSObserverList_destroyObserverListForObject___block_invoke;
  v11 = &unk_1E0F4D2D8;
  v12 = v3;
  if (qword_1ECD0A8B0 != -1)
    dispatch_once(&qword_1ECD0A8B0, &v8);
  v4 = objc_msgSend(a2, "_observerStorageOfSize:", qword_1ECD0A8A8, v8, v9, v10, v11, v12, v13);
  if (v4)
  {
    v5 = (void *)v4;
    if (*(void **)(v4 + 8) == a2)
    {
      clearAllObservers(v4);
      objc_destructInstance(v5);
    }
  }
  else
  {
    v6 = (void **)objc_msgSend(a2, "_observerStorage");
    if (!v6)
    {
      NSLog((NSString *)CFSTR("Using +destroyObserverListForObject: on an object without inline observer storage is invalid"));
      abort();
    }
    v7 = *v6;
    if (v7)

  }
}

- (_NSObserverList)init
{
  _NSObserverList *result;
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)_NSObserverList;
  result = -[_NSObserverList init](&v3, sel_init);
  if (result)
    result->_observersLock._os_unfair_lock_opaque = 0;
  return result;
}

- (NSObservation)addBlockSink:(uint64_t)a3 toObservableObject:(uint64_t)a4 forTag:
{
  uint64_t v4;
  NSObservation *v5;

  if (result)
  {
    v4 = (uint64_t)result;
    v5 = -[NSObservation initWithObservable:blockSink:tag:]([NSObservation alloc], "initWithObservable:blockSink:tag:", a3, a2, a4);
    addObserver(v4, v5);
    return v5;
  }
  return result;
}

- (NSObservation)addObserver:(void *)a3 toObservableObject:
{
  uint64_t v5;
  NSObservation *v6;
  void *v7;
  uint64_t v8;
  NSString *v9;

  if (result)
  {
    v5 = (uint64_t)result;
    if ((objc_msgSend(a2, "conformsToProtocol:", &unk_1EDCD1520) & 1) != 0)
    {
      if ((objc_msgSend(a3, "conformsToProtocol:", &unk_1EDCD14C0) & 1) != 0)
      {
        v6 = -[NSObservation initWithObservable:observer:]([NSObservation alloc], "initWithObservable:observer:", a3, a2);
        addObserver(v5, a2);
        return v6;
      }
      v7 = (void *)MEMORY[0x1E0C99DA0];
      v8 = *MEMORY[0x1E0C99778];
      v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Attempt to add %@ as an observer of non-NSObservable object %@"), a2, a3);
    }
    else
    {
      v7 = (void *)MEMORY[0x1E0C99DA0];
      v8 = *MEMORY[0x1E0C99778];
      v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Attempt to add non-NSObserver object %@ as an observer of %@"), a2, a3);
    }
    objc_exception_throw((id)objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0));
  }
  return result;
}

- (void)finishObserving
{
  id owner;
  uint64_t StackObservedValueClassAndBoxSize;
  uint64_t v5;
  Class v6;
  _DWORD *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  owner = self->_owner;
  v8[0] = 0;
  StackObservedValueClassAndBoxSize = getStackObservedValueClassAndBoxSize(v8);
  MEMORY[0x1E0C80A78](StackObservedValueClassAndBoxSize);
  v7 = objc_constructInstance(v6, (char *)v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7[6] = 3;
  *((_QWORD *)v7 + 1) = 0;
  *((_QWORD *)v7 + 2) = owner;
  -[_NSObserverList _receiveBox:](self, "_receiveBox:", v7);
}

- (void)removeObservation:(id)a3
{
  objc_msgSend(a3, "remove");
}

- (void)_receiveBox:(id)a3
{
  _QWORD v5[7];

  v5[6] = *MEMORY[0x1E0C80C00];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __31___NSObserverList__receiveBox___block_invoke;
  v5[3] = &unk_1E0F55378;
  v5[4] = a3;
  v5[5] = self;
  withUnlockedObservers((uint64_t)self, (uint64_t)v5);
  if (*((_DWORD *)a3 + 6) == 3)
    clearAllObservers((uint64_t)self);
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  clearAllObservers((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)_NSObserverList;
  -[_NSObserverList dealloc](&v3, sel_dealloc);
}

- (id)description
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = 0;
  v6 = &v5;
  v7 = 0x3052000000;
  v8 = __Block_byref_object_copy__32;
  v9 = __Block_byref_object_dispose__32;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __30___NSObserverList_description__block_invoke;
  v4[3] = &unk_1E0F553A0;
  v4[4] = self;
  v4[5] = &v5;
  withUnlockedObservers((uint64_t)self, (uint64_t)v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_observers);
}

@end
