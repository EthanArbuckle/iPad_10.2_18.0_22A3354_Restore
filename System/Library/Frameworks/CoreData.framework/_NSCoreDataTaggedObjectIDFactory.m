@implementation _NSCoreDataTaggedObjectIDFactory

- (id)_storeInfo1
{
  uint64_t v2;
  BOOL v3;

  v2 = _PFTaggedPointersPool + 32 * self->_taggedPoolIndex;
  if (*(_QWORD *)v2)
    v3 = *(_QWORD *)(v2 + 8) == 0;
  else
    v3 = 1;
  if (v3)
    return 0;
  else
    return (id)objc_msgSend(*(id *)v2, "_storeInfoForEntityDescription:");
}

- (_NSCoreDataTaggedObjectIDFactory)initWithPK64:(int64_t)a3
{
  _NSCoreDataTaggedObjectIDFactory *result;
  unint64_t v4;

  if (a3 > 0x3FFFFFFFFFFLL)
    return (_NSCoreDataTaggedObjectIDFactory *)objc_msgSend((id)objc_msgSend(-[_NSCoreDataTaggedObjectIDFactory _fallbackFactory](self, "_fallbackFactory"), "alloc"), "initWithPK64:", a3);
  result = (_NSCoreDataTaggedObjectIDFactory *)((a3 << 21) | (16 * self->_taggedPoolIndex) | 0x8000000000000005);
  v4 = (unint64_t)result ^ *MEMORY[0x1E0DE7C58];
  if ((~v4 & 0xC000000000000007) != 0)
    return (_NSCoreDataTaggedObjectIDFactory *)(v4 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E0DE7C48]
                                                                                               + (v4 & 7)));
  return result;
}

- (unsigned)allocateBatch:(id *)a3 count:(unsigned int)a4
{
  unint64_t v5;
  unint64_t v6;
  unint64_t __pattern8;

  v5 = (16 * self->_taggedPoolIndex) | 0x8000000000000005;
  v6 = v5 ^ *MEMORY[0x1E0DE7C58];
  if ((~v6 & 0xC000000000000007) != 0)
    v5 = v6 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E0DE7C48] + (v6 & 7));
  __pattern8 = v5;
  memset_pattern8(a3, &__pattern8, 8 * a4);
  return a4;
}

- (id)managedObjectIDFromUTF8String:(const char *)a3 length:(unint64_t)a4
{
  unint64_t v6;
  id result;
  BOOL v8;
  unint64_t v9;
  char *__endptr;

  __endptr = 0;
  v6 = strtouq(a3, &__endptr, 0);
  result = 0;
  if (__endptr)
    v8 = __endptr == a3;
  else
    v8 = 1;
  if (!v8)
  {
    if (v6 >> 42)
    {
      return (id)objc_msgSend((id)objc_msgSend(-[_NSCoreDataTaggedObjectIDFactory _fallbackFactory](self, "_fallbackFactory"), "alloc"), "initWithPK64:", v6);
    }
    else
    {
      result = (id)((v6 << 21) | (16 * self->_taggedPoolIndex) | 0x8000000000000005);
      v9 = (unint64_t)result ^ *MEMORY[0x1E0DE7C58];
      if ((~v9 & 0xC000000000000007) != 0)
        return (id)(v9 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E0DE7C48] + (v9 & 7)));
    }
  }
  return result;
}

- (_NSCoreDataTaggedObjectIDFactory)retain
{
  int *p_cd_rc;
  unsigned int v3;

  p_cd_rc = &self->_cd_rc;
  do
    v3 = __ldxr((unsigned int *)p_cd_rc);
  while (__stxr(v3 + 1, (unsigned int *)p_cd_rc));
  return self;
}

- (void)release
{
  int *p_cd_rc;
  int v3;

  p_cd_rc = &self->_cd_rc;
  do
    v3 = __ldxr((unsigned int *)p_cd_rc);
  while (__stxr(v3 - 1, (unsigned int *)p_cd_rc));
  if (v3 <= 0)
  {
    self->_cd_rc += 0x20000000;
    -[_NSCoreDataTaggedObjectIDFactory dealloc](self, "dealloc");
  }
}

- (void)_storeDeallocated
{
  *(_QWORD *)(_PFTaggedPointersPool + 32 * self->_taggedPoolIndex) = 0;
}

- (void)dealloc
{
  uint64_t taggedPoolIndex;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  unint64_t *v7;
  unint64_t v8;

  taggedPoolIndex = self->_taggedPoolIndex;
  v4 = _PFTaggedPointersPool;
  v5 = (uint64_t *)(_PFTaggedPointersPool + 32 * taggedPoolIndex);
  v5[1] = 0;
  v6 = *v5;
  do
  {
    v7 = (unint64_t *)(v4 + 32 * taggedPoolIndex);
    while (1)
    {
      v8 = __ldaxr(v7);
      if (v8 != v6)
        break;
      if (!__stlxr(0, v7))
        goto LABEL_7;
    }
    __clrex();
    v4 = _PFTaggedPointersPool;
  }
  while (_PFTaggedPointersPool + 32 * taggedPoolIndex == v6);
LABEL_7:

  self->_fallbackFactories = 0;
  _PFDeallocateObject(self);
}

- (unint64_t)retainCount
{
  return self->_cd_rc + 1;
}

- (id)_fallbackFactory
{
  id result;
  void *v4;
  _QWORD *v5;

  result = self->_fallbackFactories;
  if (!result)
  {
    v4 = (void *)objc_opt_class();
    v5 = (_QWORD *)(_PFTaggedPointersPool + 32 * self->_taggedPoolIndex);
    result = (id)objc_msgSend(v4, "classWithStore:andEntity:", *v5, v5[1]);
    self->_fallbackFactories = result;
  }
  return result;
}

- (id)managedObjectIDFromURIRepresentation:(id)a3
{
  void *v5;
  void *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  void *v11;
  NSTemporaryObjectID *v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v16;

  v5 = (void *)MEMORY[0x18D76B4E4](self, a2);
  v6 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "path"), "pathComponents"), "objectAtIndex:", 2);
  v16 = 0;
  v7 = (uint64_t *)(_PFTaggedPointersPool + 32 * self->_taggedPoolIndex);
  v8 = *v7;
  v9 = v7[1];
  v10 = objc_msgSend(v6, "characterAtIndex:", 0);
  v11 = (void *)objc_msgSend(v6, "substringFromIndex:", 1);
  if (v10 == 116)
  {
    v12 = -[NSTemporaryObjectID initWithEntity:andUUIDString:]([NSTemporaryObjectID alloc], "initWithEntity:andUUIDString:", v9, v11);
    -[NSTemporaryObjectID _setPersistentStore:](v12, "_setPersistentStore:", v8);
    if (v12)
      goto LABEL_10;
  }
  if (!+[_PFRoutines convertCString:toUnsignedInt64:withBase:]((uint64_t)_PFRoutines, (const char *)objc_msgSend(v11, "UTF8String"), &v16, 0))
  {
    v12 = 0;
LABEL_10:
    objc_autoreleasePoolPop(v5);
    return v12;
  }
  if (v16 >> 42)
  {
    v12 = (NSTemporaryObjectID *)objc_msgSend((id)objc_msgSend(-[_NSCoreDataTaggedObjectIDFactory _fallbackFactory](self, "_fallbackFactory"), "alloc"), "initWithPK64:", v16);
    goto LABEL_10;
  }
  v13 = (v16 << 21) | (16 * self->_taggedPoolIndex) | 0x8000000000000005;
  v14 = v13 ^ *MEMORY[0x1E0DE7C58];
  if ((~v14 & 0xC000000000000007) != 0)
    v13 = v14 & 0xFFFFFFFFFFFFFFF8 | *(unsigned __int8 *)(MEMORY[0x1E0DE7C48] + (v14 & 7));
  objc_autoreleasePoolPop(v5);
  return (id)v13;
}

- (void)setObjectStoreIdentifier:(id)a3
{
  uint64_t v5;
  id v6;

  v6 = *(id *)(_PFTaggedPointersPool + 32 * self->_taggedPoolIndex + 16);
  if ((objc_msgSend(v6, "isEqual:") & 1) == 0)
  {
    v5 = objc_msgSend(a3, "copy");
    *(_QWORD *)(_PFTaggedPointersPool + 32 * self->_taggedPoolIndex + 16) = v5;

  }
}

@end
