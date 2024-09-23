@implementation _PFManagedObjectReferenceQueue

- (uint64_t)_queueForDealloc:(uint64_t)a1
{
  os_unfair_lock_s *v4;
  __CFArray *Mutable;
  uint64_t v6;
  _BOOL4 v7;
  uint64_t v8;
  unsigned int *v9;

  if (!a1)
    return 0;
  v4 = (os_unfair_lock_s *)(a1 + 12);
  os_unfair_lock_lock_with_options();
  v6 = *(_QWORD *)(a1 + 24);
  Mutable = *(__CFArray **)(a1 + 32);
  if (v6)
  {
    if (!Mutable)
    {
      Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
      *(_QWORD *)(a1 + 32) = Mutable;
    }
    CFArrayAppendValue(Mutable, a2);
    v7 = 0;
  }
  else
  {
    v7 = Mutable != 0;
  }
  if (*(_QWORD *)(a1 + 40) && !*(_DWORD *)(a1 + 20) && *(_QWORD *)(a1 + 24))
    *(_DWORD *)(a1 + 20) = 1;
  os_unfair_lock_unlock(v4);
  if (v6)
    return 0;
  if (*MEMORY[0x1E0C9A980])
    NSRecordAllocationEvent();
  v9 = a2 + 2;
  while (!__ldaxr(v9))
  {
    if (!__stlxr(1u, v9))
    {
      objc_msgSend(a2, "dealloc");
      goto LABEL_20;
    }
  }
  __clrex();
LABEL_20:
  v8 = 1;
  if (v7)
    -[_PFManagedObjectReferenceQueue _processReferenceQueue:](a1, 1);
  return v8;
}

- (void)_processReferenceQueue:(uint64_t)a1
{
  int v3;
  unsigned int *v4;
  os_unfair_lock_s *v5;
  const void *v6;
  uint64_t v7;
  int v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  uint64_t i;
  uint64_t v17;
  unsigned int *v18;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  unsigned int *v27;
  void *v29;
  void *v30;
  unsigned int v31;
  unsigned int v32;
  void *v33;
  int v34;
  uint64_t v35;
  id v36;
  uint64_t v38;
  os_unfair_lock_s *v39;
  uint64_t *v40;
  int v41;
  int v42;
  int v43;
  void *v44;
  CFTypeRef v45;
  uint64_t v46;
  _QWORD *v47;
  uint64_t Count;
  id v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[104];
  uint64_t v56;
  CFRange v57;

  v43 = a2;
  v56 = *MEMORY[0x1E0C80C00];
  v50 = a1;
  if (a1)
  {
    if (*(_QWORD *)(v50 + 32) || v43 != 0)
    {
      v39 = (os_unfair_lock_s *)(v50 + 12);
      if (v43)
        v3 = 9999;
      else
        v3 = 9;
      v42 = v3;
      v4 = (unsigned int *)(v50 + 8);
      do
      {
        v5 = v39;
        os_unfair_lock_lock_with_options();
        v6 = *(const void **)(v50 + 32);
        *(_QWORD *)(v50 + 32) = 0;
        os_unfair_lock_unlock(v5);
        if (!v6)
          return;
        v45 = v6;
        Count = CFArrayGetCount((CFArrayRef)v6);
        if (!Count)
        {
          CFRelease(v45);
          return;
        }
        v7 = *(_QWORD *)(v50 + 24);
        if ((v43 & 1) == 0 && v7)
        {
          if ((*(_BYTE *)(v7 + 41) & 1) == 0)
          {
            v8 = objc_msgSend(*(id *)(v50 + 24), "_isDeallocating");
            if ((v8 & 1) == 0)
              v9 = (id)v7;
            v10 = objc_alloc(MEMORY[0x1E0C99DE8]);
            v11 = (void *)objc_msgSend(v10, "initWithCapacity:", Count);
            v12 = 0;
            v41 = v8 ^ 1;
            goto LABEL_22;
          }
          v7 = 0;
        }
        v41 = 0;
        v11 = 0;
        if (v7)
          v12 = v43;
        else
          v12 = 1;
LABEL_22:
        v49 = v11;
        v40 = &v38;
        MEMORY[0x1E0C80A78]();
        v15 = (char *)&v38 - v13;
        if (v14 > 0x200)
          v15 = (char *)NSAllocateScannedUncollectable();
        else
          bzero((char *)&v38 - v13, 8 * v14);
        v57.location = 0;
        v57.length = Count;
        v47 = v15;
        CFArrayGetValues((CFArrayRef)v45, v57, (const void **)v15);
        v44 = (void *)MEMORY[0x18D76B4E4]();
        *(_DWORD *)(v50 + 48) = 1;
        if (Count >= 1)
        {
          for (i = 0; i < Count; ++i)
          {
            v17 = v47[i];
            if (v17 == 1)
            {
              v46 = i + 1;
              v22 = (void *)v47[i + 1];
              v53 = 0u;
              v54 = 0u;
              v52 = 0u;
              v51 = 0u;
              v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
              if (v23)
              {
                v24 = *(_QWORD *)v52;
                do
                {
                  for (j = 0; j != v23; ++j)
                  {
                    if (*(_QWORD *)v52 != v24)
                      objc_enumerationMutation(v22);
                    v26 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * j);
                    v27 = (unsigned int *)(v26 + 8);
                    while (!__ldaxr(v27))
                    {
                      if (!__stlxr(1u, v27))
                      {
                        if ((v12 & 1) == 0)
                        {
                          v29 = (void *)objc_msgSend((id)v26, "objectID");
                          if (v26)
                          {
                            if ((*(_BYTE *)(v26 + 17) & 2) != 0)
                            {
                              v30 = v29;
                              if ((objc_msgSend(v29, "isTemporaryID") & 1) == 0)
                                objc_msgSend(v49, "addObject:", v30);
                            }
                          }
                          objc_msgSend((id)v7, "_forgetObject:propagateToObjectStore:removeFromRegistry:", v26, 0, 1);
                        }
                        if (*MEMORY[0x1E0C9A980])
                          NSRecordAllocationEvent();
                        objc_msgSend((id)v26, "dealloc");
                        goto LABEL_61;
                      }
                    }
                    __clrex();
                    if (!*(_QWORD *)(v26 + 56))
                    {
                      do
                        v31 = __ldaxr(v4);
                      while (__stlxr(v31 + 1, v4));
                      *(_QWORD *)(v26 + 56) = v50;
                    }

LABEL_61:
                    ;
                  }
                  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
                }
                while (v23);
              }
              if (v22)
                CFRelease(v22);
              i = v46;
            }
            else
            {
              v18 = (unsigned int *)(v17 + 8);
              while (!__ldaxr(v18))
              {
                if (!__stlxr(1u, v18))
                {
                  v20 = (void *)objc_msgSend((id)v17, "objectID");
                  if ((v12 & 1) == 0)
                  {
                    if (v17)
                    {
                      if ((*(_BYTE *)(v17 + 17) & 2) != 0)
                      {
                        v21 = v20;
                        if ((objc_msgSend(v20, "isTemporaryID") & 1) == 0)
                          objc_msgSend(v49, "addObject:", v21);
                      }
                    }
                    objc_msgSend((id)v7, "_forgetObject:propagateToObjectStore:removeFromRegistry:", v17, 0, 1);
                  }
                  if (*MEMORY[0x1E0C9A980])
                    NSRecordAllocationEvent();
                  objc_msgSend((id)v17, "dealloc");
                  goto LABEL_71;
                }
              }
              __clrex();
              if (!*(_QWORD *)(v17 + 56))
              {
                do
                  v32 = __ldaxr(v4);
                while (__stlxr(v32 + 1, v4));
                *(_QWORD *)(v17 + 56) = v50;
              }

            }
LABEL_71:
            ;
          }
        }
        if ((v12 & 1) != 0 || !objc_msgSend(v49, "count"))
        {
          v34 = 0;
        }
        else
        {
          -[NSManagedObjectContext lockObjectStore](v7);
          v33 = *(void **)(v7 + 32);
          v34 = 1;
          v35 = objc_msgSend((id)v7, "_queryGenerationToken");
          objc_msgSend(v33, "managedObjectContextDidUnregisterObjectsWithIDs:generation:", v49, v35);
        }
        if (v49)

        if (v34)
          -[NSManagedObjectContext unlockObjectStore](v7);
        if ((unint64_t)Count >= 0x201)
          NSZoneFree(0, v47);
        if (v41)

        if (v44)
          objc_autoreleasePoolPop(v44);
        *(_DWORD *)(v50 + 48) = 0;
        __dmb(0xBu);
        v36 = 0;
        CFRelease(v45);
      }
      while (v42-- > 0);
    }
  }
}

- (_PFManagedObjectReferenceQueue)retain
{
  int *p_cd_rc;
  unsigned int v3;

  p_cd_rc = &self->_cd_rc;
  do
    v3 = __ldaxr((unsigned int *)p_cd_rc);
  while (__stlxr(v3 + 1, (unsigned int *)p_cd_rc));
  return self;
}

- (void)release
{
  int *p_cd_rc;
  int v3;

  if (self)
  {
    p_cd_rc = &self->_cd_rc;
    do
      v3 = __ldaxr((unsigned int *)p_cd_rc);
    while (__stlxr(v3 - 1, (unsigned int *)p_cd_rc));
    if (v3 <= 0)
    {
      self->_cd_rc += 0x20000000;
      -[_PFManagedObjectReferenceQueue dealloc](self, "dealloc");
    }
  }
}

- (void)_unregisterRunloopObservers
{
  os_unfair_lock_s *v2;
  __CFRunLoopObserver *v3;
  __CFRunLoop *Main;
  _QWORD v5[6];

  if (a1)
  {
    *(_DWORD *)(a1 + 20) = -1;
    v2 = (os_unfair_lock_s *)(a1 + 12);
    os_unfair_lock_lock_with_options();
    v3 = *(__CFRunLoopObserver **)(a1 + 40);
    *(_QWORD *)(a1 + 40) = 0;
    os_unfair_lock_unlock(v2);
    if (v3)
    {
      Main = CFRunLoopGetMain();
      CFRunLoopObserverInvalidate(v3);
      CFRunLoopRemoveObserver(Main, v3, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __61___PFManagedObjectReferenceQueue__unregisterRunloopObservers__block_invoke;
      v5[3] = &unk_1E1EDE568;
      v5[4] = a1;
      v5[5] = v3;
      dispatch_async(MEMORY[0x1E0C80D38], v5);
    }
  }
}

- (void)dealloc
{
  objc_super v3;

  if (!self->_context)
  {
    -[_PFManagedObjectReferenceQueue _unregisterRunloopObservers]((uint64_t)self);
    -[_PFManagedObjectReferenceQueue _processReferenceQueue:]((uint64_t)self, 1);
    v3.receiver = self;
    v3.super_class = (Class)_PFManagedObjectReferenceQueue;
    -[_PFManagedObjectReferenceQueue dealloc](&v3, sel_dealloc);
  }
}

- (unint64_t)retainCount
{
  return self->_cd_rc + 1;
}

- (BOOL)_tryRetain
{
  return 0;
}

- (BOOL)_isDeallocating
{
  return 1;
}

@end
