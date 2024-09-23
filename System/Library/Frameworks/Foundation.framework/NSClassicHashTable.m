@implementation NSClassicHashTable

- (void)insertItem:(const void *)a3
{
  if (!a3)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("*** NSHashInsert(): attempt to insert NULL pointer"), 0));
  CFBasicHashSetValue((uint64_t)self->_ht, (unint64_t)a3);
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  CFRelease(self->_ht);
  v3.receiver = self;
  v3.super_class = (Class)NSClassicHashTable;
  -[NSClassicHashTable dealloc](&v3, sel_dealloc);
}

- (void)removeAllItems
{
  __CFBasicHash *ht;

  ht = self->_ht;
  if ((*((_BYTE *)ht + 18) & 0x3F) != 0)
    __CFBasicHashDrain((uint64_t)ht, 0);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;

  if (self == a3)
    return 1;
  if (a3)
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class())
      return CFBasicHashesAreEqual(self->_ht, *((_QWORD **)a3 + 6)) != 0;
  }
  return 0;
}

- (id)copy
{
  NSZone *v2;
  __int128 v4;
  NSHashTable *v5;
  __CFBasicHash *ht;
  _QWORD v8[5];
  NSHashTableCallBacks callBacks;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = *(_OWORD *)&self->_callBacks.retain;
  *(_OWORD *)&callBacks.hash = *(_OWORD *)&self->_callBacks.hash;
  *(_OWORD *)&callBacks.retain = v4;
  callBacks.describe = (NSString *(__cdecl *)(NSHashTable *, const void *))self->_callBacks.describe;
  v5 = NSCreateHashTableWithZone(&callBacks, (NSUInteger)a2, v2);
  ht = self->_ht;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __26__NSClassicHashTable_copy__block_invoke;
  v8[3] = &unk_1E0F4E5B0;
  v8[4] = v5;
  CFBasicHashApply(ht, (uint64_t)v8);
  return v5;
}

uint64_t __26__NSClassicHashTable_copy__block_invoke(uint64_t a1, uint64_t a2)
{
  CFBasicHashAddValue(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48), *(_QWORD *)(a2 + 8));
  return 1;
}

- (void)getItem:(const void *)a3
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  v5 = 0u;
  v6 = 0u;
  v4 = 0u;
  CFBasicHashFindBucket((uint64_t)self->_ht, (unint64_t)a3, (uint64_t)&v4);
  if (*((_QWORD *)&v6 + 1))
    return (void *)*((_QWORD *)&v5 + 1);
  else
    return 0;
}

- (void)addObject:(id)a3
{
  if (!a3)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("*** NSHashInsertKnownAbsent(): attempt to insert NULL pointer"), 0));
  CFBasicHashAddValue((unint64_t)self->_ht, (unint64_t)a3);
}

- (void)insertKnownAbsentItem:(const void *)a3
{
  void *v5;
  uint64_t v6;
  NSString *v7;
  _OWORD v8[2];
  __int128 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99778];
    v7 = (NSString *)CFSTR("*** NSHashInsertKnownAbsent(): attempt to insert NULL pointer");
    goto LABEL_6;
  }
  v10 = 0;
  v9 = 0u;
  memset(v8, 0, sizeof(v8));
  CFBasicHashFindBucket((uint64_t)self->_ht, (unint64_t)a3, (uint64_t)v8);
  if (*((_QWORD *)&v9 + 1))
  {
    v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("*** NSHashInsertKnownAbsent(): item %p already in table"), a3);
    v5 = (void *)MEMORY[0x1E0C99DA0];
    v6 = *MEMORY[0x1E0C99778];
LABEL_6:
    objc_exception_throw((id)objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, 0));
  }
  CFBasicHashAddValue((unint64_t)self->_ht, (unint64_t)a3);
}

- (void)removeItem:(const void *)a3
{
  if (!a3)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("*** NSHashRemove(): attempt to remove NULL pointer"), 0));
  CFBasicHashRemoveValue((uint64_t)self->_ht, (unint64_t)a3);
}

- (unint64_t)count
{
  return CFBasicHashGetCount(self->_ht);
}

- (id)description
{
  id v3;
  void *describe;
  __CFBasicHash *ht;
  _QWORD v7[5];
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  if (!CFBasicHashGetCount(self->_ht))
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<NSHashTable: %p> {}"), self);
  v8[3] = 1;
  v3 = (id)objc_msgSend(objc_allocWithZone((Class)NSMutableString), "initWithCapacity:", CFBasicHashGetCount(self->_ht) << 6);
  objc_msgSend(v3, "appendFormat:", CFSTR("<NSHashTable: %p> ("), self);
  describe = self->_callBacks.describe;
  v8[0] = self;
  v8[1] = describe;
  v8[2] = v3;
  ht = self->_ht;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __33__NSClassicHashTable_description__block_invoke;
  v7[3] = &__block_descriptor_40_e18_C64__0___qQQQQQQ_8l;
  v7[4] = v8;
  CFBasicHashApply(ht, (uint64_t)v7);
  objc_msgSend(v3, "appendString:", CFSTR(")"));
  return v3;
}

uint64_t __33__NSClassicHashTable_description__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(_QWORD, uint64_t);
  void *v5;

  v2 = *(_QWORD *)(a2 + 24);
  v3 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v3 + 24))
    objc_msgSend(*(id *)(v3 + 16), "appendString:", CFSTR(", "));
  v4 = *(uint64_t (**)(_QWORD, uint64_t))(v3 + 8);
  v5 = *(void **)(v3 + 16);
  if (v4)
    objc_msgSend(v5, "appendString:", v4(*(_QWORD *)v3, v2));
  else
    objc_msgSend(v5, "appendFormat:", CFSTR("%p"), v2);
  *(_BYTE *)(v3 + 24) = 0;
  return 1;
}

- (id)allObjects
{
  unint64_t Count;
  unint64_t v4;
  uint64_t v5;
  __CFBasicHash *ht;
  id *v7;
  unint64_t v8;
  id v9;
  void *v10;
  id v11;
  CFStringRef v13;
  void *v14;
  _QWORD v15[5];
  _QWORD v16[6];

  v16[5] = *MEMORY[0x1E0C80C00];
  Count = CFBasicHashGetCount(self->_ht);
  v4 = Count;
  if (Count >> 60)
  {
    v13 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), Count);
    v14 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], v13, 0);
    CFRelease(v13);
    objc_exception_throw(v14);
  }
  v16[4] = 0;
  v5 = _CFCreateArrayStorage();
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  ht = self->_ht;
  v16[3] = v5;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __32__NSClassicHashTable_allObjects__block_invoke;
  v15[3] = &unk_1E0F4E5F8;
  v15[4] = v16;
  CFBasicHashApply(ht, (uint64_t)v15);
  if (v5)
  {
    if (v4)
    {
      v7 = (id *)v5;
      v8 = v4;
      do
      {
        v9 = *v7++;
        --v8;
      }
      while (v8);
    }
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "_initByAdoptingBuffer:count:size:", v5, v4, v4);
  }
  else
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", 0, v4);
  }
  v11 = v10;
  _Block_object_dispose(v16, 8);
  return v11;
}

uint64_t __32__NSClassicHashTable_allObjects__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = *(_QWORD *)(a2 + 8);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(_QWORD **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v4 + 1;
  *v4 = v2;
  return 1;
}

- (void)getKeys:(const void *)a3 count:(unint64_t *)a4
{
  __CFBasicHash *ht;
  _QWORD v7[5];
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  ht = self->_ht;
  v8[3] = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__NSClassicHashTable_getKeys_count___block_invoke;
  v7[3] = &unk_1E0F4E5F8;
  v7[4] = v8;
  CFBasicHashApply(ht, (uint64_t)v7);
  if (a4)
    *a4 = CFBasicHashGetCount(self->_ht);
  _Block_object_dispose(v8, 8);
}

uint64_t __36__NSClassicHashTable_getKeys_count___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = *(_QWORD *)(a2 + 8);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(_QWORD **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v4 + 1;
  *v4 = v2;
  return 1;
}

@end
