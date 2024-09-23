@implementation NSPersistentStoreCache

- (void)registerRow:(void *)a3 forObjectID:(char)a4 options:
{
  os_unfair_lock_s *v8;

  if (a1)
  {
    v8 = (os_unfair_lock_s *)(a1 + 36);
    os_unfair_lock_lock_with_options();
    -[NSPersistentStoreCache _registerRow:forObjectID:options:](a1, a2, a3, a4);
    os_unfair_lock_unlock(v8);
  }
}

- (void)_registerRow:(void *)key forObjectID:(char)a4 options:
{
  unsigned int *Value;
  uint64_t v9;
  unsigned int v10;
  unsigned int *v11;
  unsigned int v12;
  uint64_t v13;

  if (a1)
  {
    Value = (unsigned int *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 8), key);
    if (Value != a2)
    {
      v9 = (uint64_t)Value;
      if (Value)
      {
        if (a2)
        {
          v10 = Value[3];
          v11 = a2 + 3;
          do
            v12 = __ldxr(v11);
          while (__stxr(v12 + v10, v11));
        }
        if ((a4 & 4) == 0 && (*(_BYTE *)(a1 + 32) & 1) != 0)
        {
          v13 = objc_msgSend(Value, "version");
          if (v13 == objc_msgSend(a2, "version"))
            -[NSPersistentCacheRow copyRelationshipCachesFrom:](a2, v9);
        }
      }
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 8), key, a2);
    }
  }
}

- (uint64_t)toManyInformationForSourceObjectID:(void *)a3 forProperty:(double)a4 afterTimestamp:
{
  os_unfair_lock_s *v8;
  _QWORD *Value;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (!a1)
    return 0;
  v8 = (os_unfair_lock_s *)(a1 + 36);
  os_unfair_lock_lock_with_options();
  Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 8), a2);
  if (!Value)
    goto LABEL_8;
  v10 = Value;
  if (-[NSPersistentCacheRow timestampForProperty:]((uint64_t)Value, a3) <= a4)
    goto LABEL_8;
  if (!v10[3])
  {
    -[NSPersistentCacheRow ancillaryOrderKeysForProperty:]((uint64_t)v10, a3);
    goto LABEL_8;
  }
  v11 = *(_QWORD *)(v10[3] + 24 * (_QWORD)-[NSPersistentCacheRow toManyOffsetForProperty:](v10, a3) + 8);
  v12 = -[NSPersistentCacheRow ancillaryOrderKeysForProperty:]((uint64_t)v10, a3);
  if (!v11)
  {
LABEL_8:
    v13 = 0;
    goto LABEL_9;
  }
  v13 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v11, v12, 0);
LABEL_9:
  os_unfair_lock_unlock(v8);
  return v13;
}

- (os_unfair_lock_s)rowForObjectID:(double)a3 afterTimestamp:
{
  os_unfair_lock_s *v5;
  os_unfair_lock_s *v6;
  double *Value;
  double *v8;
  double *v9;

  if (result)
  {
    v5 = result;
    v6 = result + 9;
    os_unfair_lock_lock_with_options();
    Value = (double *)CFDictionaryGetValue(*(CFDictionaryRef *)&v5[2]._os_unfair_lock_opaque, a2);
    if (Value && (v8 = Value, Value[4] > a3))
    {
      v9 = Value;
      objc_msgSend(v8, "knownKeyValuesPointer");
    }
    else
    {
      v8 = 0;
    }
    os_unfair_lock_unlock(v6);
    return (os_unfair_lock_s *)v8;
  }
  return result;
}

- (void)incrementRefCountForObjectID:(uint64_t)a1
{
  os_unfair_lock_s *v4;
  char *Value;
  unsigned int *v6;
  unsigned int v7;

  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 36);
    os_unfair_lock_lock_with_options();
    Value = (char *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 8), a2);
    if (Value)
    {
      v6 = (unsigned int *)(Value + 12);
      do
        v7 = __ldxr(v6);
      while (__stxr(v7 + 1, v6));
    }
    os_unfair_lock_unlock(v4);
  }
}

- (void)decrementRefCountForObjectID:(uint64_t)a1
{
  os_unfair_lock_s *v4;
  char *Value;
  unsigned int *v6;
  unsigned int v7;
  BOOL v8;
  signed int v9;

  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 36);
    os_unfair_lock_lock_with_options();
    Value = (char *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 8), a2);
    if (Value)
    {
      v6 = (unsigned int *)(Value + 12);
      do
      {
        v7 = __ldxr(v6);
        v8 = __OFSUB__(v7, 1);
        v9 = v7 - 1;
      }
      while (__stxr(v9, v6));
      if ((v9 < 0) ^ v8 | (v9 == 0))
        CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 8), a2);
    }
    os_unfair_lock_unlock(v4);
  }
}

- (void)registerToMany:(uint64_t)a1 withOrderKeys:(void *)a2 forSourceObjectID:(void *)a3 forProperty:(void *)a4 options:(void *)a5 andTimestamp:(double)a6
{
  os_unfair_lock_s *v12;

  if (a1)
  {
    v12 = (os_unfair_lock_s *)(a1 + 36);
    os_unfair_lock_lock_with_options();
    -[NSPersistentStoreCache _registerToMany:withOrderKeys:forSourceObjectID:forProperty:options:andTimestamp:](a1, a2, a3, a4, a5, a6);
    os_unfair_lock_unlock(v12);
  }
}

- (void)_registerToMany:(uint64_t)a1 withOrderKeys:(void *)a2 forSourceObjectID:(void *)a3 forProperty:(void *)key options:(void *)a5 andTimestamp:(double)a6
{
  _QWORD *Value;

  if (a1)
  {
    Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 8), key);
    -[NSPersistentCacheRow setRelatedObjectIDs:forProperty:options:andTimestamp:](Value, a2, a5, a6);
    if (a3)
      -[NSPersistentCacheRow setAncillaryOrderKeys:forProperty:options:andTimestamp:](Value, a3, a5);
  }
}

- (void)forgetRowForObjectID:(uint64_t)a1
{
  os_unfair_lock_s *v4;

  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 36);
    os_unfair_lock_lock_with_options();
    CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 8), a2);
    os_unfair_lock_unlock(v4);
  }
}

- (os_unfair_lock_s)ancillaryOrderKeysForSourceObjectID:(void *)a3 forProperty:(double)a4 afterTimestamp:
{
  os_unfair_lock_s *v7;
  os_unfair_lock_s *v8;
  const void *Value;
  uint64_t v10;
  id v11;

  if (result)
  {
    v7 = result;
    v8 = result + 9;
    os_unfair_lock_lock_with_options();
    Value = CFDictionaryGetValue(*(CFDictionaryRef *)&v7[2]._os_unfair_lock_opaque, a2);
    if (Value && (v10 = (uint64_t)Value, -[NSPersistentCacheRow timestampForProperty:]((uint64_t)Value, a3) > a4))
      v11 = (id)-[NSPersistentCacheRow ancillaryOrderKeysForProperty:](v10, a3);
    else
      v11 = 0;
    os_unfair_lock_unlock(v8);
    return (os_unfair_lock_s *)v11;
  }
  return result;
}

- (void)dealloc
{
  id externalData;
  $BA245B817A3E003E9697A149A0B100CB *externalDataValueCallbacks;
  objc_super v5;

  externalData = self->_externalData;
  if (externalData)
  {
    CFRelease(externalData);
    self->_externalData = 0;
  }
  externalDataValueCallbacks = self->_externalDataValueCallbacks;
  if (externalDataValueCallbacks)
    free(externalDataValueCallbacks);
  v5.receiver = self;
  v5.super_class = (Class)NSPersistentStoreCache;
  -[NSPersistentStoreCache dealloc](&v5, sel_dealloc);
}

- (NSPersistentStoreCache)initWithValueCallbacks:(void *)a3 preserveToManyRelationships:(BOOL)a4
{
  _BOOL4 v4;
  NSPersistentStoreCache *v6;
  uint64_t v7;
  _OWORD *v8;
  uint64_t v9;
  __int128 v10;
  objc_super v12;

  v4 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NSPersistentStoreCache;
  v6 = -[NSPersistentStoreCache init](&v12, sel_init);
  v7 = (uint64_t)v6;
  if (v6)
  {
    v6->_persistentStoreCacheFlags = (persistentStoreCacheFlags)(*(_DWORD *)&v6->_persistentStoreCacheFlags & 0xFFFFFFFE | v4);
    v8 = malloc_type_malloc(0x28uLL, 0x1080040EC4B14DAuLL);
    *(_QWORD *)(v7 + 24) = v8;
    v9 = *((_QWORD *)a3 + 4);
    v10 = *((_OWORD *)a3 + 1);
    *v8 = *(_OWORD *)a3;
    v8[1] = v10;
    *((_QWORD *)v8 + 4) = v9;
    -[NSPersistentStoreCache _createExternalDataDictWithValueCallbacks:](v7, *(CFDictionaryValueCallBacks **)(v7 + 24));
    *(_DWORD *)(v7 + 36) = 0;
  }
  return (NSPersistentStoreCache *)v7;
}

- (uint64_t)_createExternalDataDictWithValueCallbacks:(uint64_t)result
{
  uint64_t v2;
  CFStringRef (__cdecl *v3)(const void *);
  CFDictionaryKeyCallBacks v4;

  if (result)
  {
    v2 = result;
    v4.version = 0;
    v4.retain = (CFDictionaryRetainCallBack)_PFfastOidRetain;
    v3 = *(CFStringRef (__cdecl **)(const void *))(MEMORY[0x1E0C9B390] + 24);
    v4.release = (CFDictionaryReleaseCallBack)_PFfastOidRelease;
    v4.copyDescription = v3;
    v4.equal = (CFDictionaryEqualCallBack)_PFObjectIDFastEquals64;
    v4.hash = (CFDictionaryHashCallBack)_PFObjectIDFastHash64;
    *(_QWORD *)(result + 8) = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, &v4, valueCallBacks);
    result = _CFDictionarySetCapacity();
    *(_QWORD *)(v2 + 16) = 32;
  }
  return result;
}

- (NSPersistentStoreCache)init
{
  return -[NSPersistentStoreCache initWithValueCallbacks:preserveToManyRelationships:](self, "initWithValueCallbacks:preserveToManyRelationships:", MEMORY[0x1E0C9B3A0], 0);
}

+ (void)initialize
{
  objc_opt_self();
}

- (void)forgetAllExternalData
{
  os_unfair_lock_s *v2;

  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 36);
    os_unfair_lock_lock_with_options();

    -[NSPersistentStoreCache _createExternalDataDictWithValueCallbacks:](a1, *(CFDictionaryValueCallBacks **)(a1 + 24));
    os_unfair_lock_unlock(v2);
  }
}

- (os_unfair_lock_s)toManyForSourceObjectID:(void *)a3 forProperty:(double)a4 afterTimestamp:
{
  os_unfair_lock_s *v7;
  os_unfair_lock_s *v8;
  _QWORD *Value;
  _QWORD *v10;
  void *v11;
  id v12;

  if (result)
  {
    v7 = result;
    v8 = result + 9;
    os_unfair_lock_lock_with_options();
    Value = CFDictionaryGetValue(*(CFDictionaryRef *)&v7[2]._os_unfair_lock_opaque, a2);
    if (Value && (v10 = Value, -[NSPersistentCacheRow timestampForProperty:]((uint64_t)Value, a3) > a4))
    {
      v11 = (void *)v10[3];
      if (v11)
        v11 = *(void **)(v10[3] + 24 * (_QWORD)-[NSPersistentCacheRow toManyOffsetForProperty:](v10, a3) + 8);
      v12 = v11;
    }
    else
    {
      v12 = 0;
    }
    os_unfair_lock_unlock(v8);
    return (os_unfair_lock_s *)v12;
  }
  return result;
}

@end
