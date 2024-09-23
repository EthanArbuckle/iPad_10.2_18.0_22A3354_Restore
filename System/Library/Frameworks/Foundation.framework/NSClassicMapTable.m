@implementation NSClassicMapTable

- (void)setItem:(const void *)a3 forKnownAbsentKey:(const void *)a4
{
  void *v6;
  uint64_t v7;
  NSString *v8;
  _OWORD v9[2];
  __int128 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (self->_keyCallBacks.notAKeyMarker == a4)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    v8 = (NSString *)CFSTR("*** NSMapInsertKnownAbsent(): attempt to insert notAKeyMarker");
    goto LABEL_6;
  }
  v11 = 0;
  v10 = 0u;
  memset(v9, 0, sizeof(v9));
  CFBasicHashFindBucket((uint64_t)self->_ht, (unint64_t)a4, (uint64_t)v9);
  if (*((_QWORD *)&v10 + 1))
  {
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("*** NSMapInsertKnownAbsent(): key %p already in table"), a4);
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
LABEL_6:
    objc_exception_throw((id)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0));
  }
  CFBasicHashAddValue((unint64_t)self->_ht, (unint64_t)a4);
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  if (self->_keyCallBacks.notAKeyMarker == a4)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("*** NSMapInsert(): attempt to insert notAKeyMarker"), 0));
  CFBasicHashSetValue((uint64_t)self->_ht, (unint64_t)a4);
}

- (id)objectForKey:(id)a3
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
    return (id)*((_QWORD *)&v5 + 1);
  else
    return 0;
}

- (unint64_t)count
{
  return CFBasicHashGetCount(self->_ht);
}

- (void)removeObjectForKey:(id)a3
{
  if (self->_keyCallBacks.notAKeyMarker == a3)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("*** NSMapRemove(): attempt to remove notAKeyMarker"), 0));
  CFBasicHashRemoveValue((uint64_t)self->_ht, (unint64_t)a3);
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  CFRelease(self->_ht);
  v3.receiver = self;
  v3.super_class = (Class)NSClassicMapTable;
  -[NSClassicMapTable dealloc](&v3, sel_dealloc);
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

  v5 = objc_opt_class();
  return v5 == objc_opt_class() && CFBasicHashesAreEqual(self->_ht, *((_QWORD **)a3 + 10)) != 0;
}

- (id)copy
{
  NSUInteger v2;
  NSZone *v3;
  __int128 v5;
  NSMapTable *v6;
  __CFBasicHash *ht;
  _QWORD v9[5];
  NSMapTableValueCallBacks valueCallBacks;
  NSMapTableKeyCallBacks keyCallBacks;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = *(_OWORD *)&self->_keyCallBacks.retain;
  *(_OWORD *)&keyCallBacks.hash = *(_OWORD *)&self->_keyCallBacks.hash;
  *(_OWORD *)&keyCallBacks.retain = v5;
  *(_OWORD *)&keyCallBacks.describe = *(_OWORD *)&self->_keyCallBacks.describe;
  valueCallBacks = (NSMapTableValueCallBacks)self->_valueCallBacks;
  v6 = NSCreateMapTableWithZone(&keyCallBacks, &valueCallBacks, v2, v3);
  ht = self->_ht;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __25__NSClassicMapTable_copy__block_invoke;
  v9[3] = &unk_1E0F4E5B0;
  v9[4] = v6;
  CFBasicHashApply(ht, (uint64_t)v9);
  return v6;
}

uint64_t __25__NSClassicMapTable_copy__block_invoke(uint64_t a1, uint64_t a2)
{
  CFBasicHashAddValue(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80), *(_QWORD *)(a2 + 8));
  return 1;
}

- (BOOL)mapMember:(const void *)a3 originalKey:(const void *)a4 value:(const void *)a5
{
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v10 = 0u;
  v11 = 0u;
  v9 = 0u;
  CFBasicHashFindBucket((uint64_t)self->_ht, (unint64_t)a3, (uint64_t)&v9);
  v7 = *((_QWORD *)&v11 + 1);
  if (*((_QWORD *)&v11 + 1))
  {
    if (a5)
      *a5 = (const void *)*((_QWORD *)&v10 + 1);
    if (a4)
      *a4 = (const void *)*((_QWORD *)&v9 + 1);
  }
  return v7 != 0;
}

- (void)existingItemForSetItem:(const void *)a3 forAbsentKey:(const void *)a4
{
  __int128 v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (self->_keyCallBacks.notAKeyMarker == a4)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("*** NSMapInsertIfAbsent(): attempt to insert notAKeyMarker"), 0));
  v10 = 0;
  v8 = 0u;
  v9 = 0u;
  v7 = 0u;
  CFBasicHashFindBucket((uint64_t)self->_ht, (unint64_t)a4, (uint64_t)&v7);
  if (*((_QWORD *)&v9 + 1))
    return (void *)*((_QWORD *)&v8 + 1);
  CFBasicHashAddValue((unint64_t)self->_ht, (unint64_t)a4);
  return 0;
}

- (id)description
{
  id v3;
  void *describe;
  void *v5;
  __CFBasicHash *ht;
  _QWORD v8[9];

  v8[8] = *MEMORY[0x1E0C80C00];
  if (!CFBasicHashGetCount(self->_ht))
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<NSMapTable: %p> {}"), self);
  v3 = (id)objc_msgSend(objc_allocWithZone((Class)NSMutableString), "initWithCapacity:", CFBasicHashGetCount(self->_ht) << 6);
  objc_msgSend(v3, "appendFormat:", CFSTR("<NSMapTable: %p> {"), self);
  describe = self->_keyCallBacks.describe;
  v5 = self->_valueCallBacks.describe;
  ht = self->_ht;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __32__NSClassicMapTable_description__block_invoke;
  v8[3] = &__block_descriptor_64_e18_C64__0___qQQQQQQ_8ls32l8s56l8;
  v8[4] = self;
  v8[5] = describe;
  v8[6] = v5;
  v8[7] = v3;
  CFBasicHashApply(ht, (uint64_t)v8);
  objc_msgSend(v3, "appendString:", CFSTR("}"));
  return v3;
}

uint64_t __32__NSClassicMapTable_description__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(_QWORD, uint64_t);
  void *v7;
  uint64_t (*v8)(_QWORD, uint64_t);
  void *v9;

  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 24);
  v6 = *(uint64_t (**)(_QWORD, uint64_t))(a1 + 40);
  v7 = *(void **)(a1 + 56);
  if (v6)
    objc_msgSend(v7, "appendString:", v6(*(_QWORD *)(a1 + 32), v4));
  else
    objc_msgSend(v7, "appendFormat:", CFSTR("%p"), v4);
  objc_msgSend(*(id *)(a1 + 56), "appendString:", CFSTR(" = "));
  v8 = *(uint64_t (**)(_QWORD, uint64_t))(a1 + 48);
  v9 = *(void **)(a1 + 56);
  if (v8)
    objc_msgSend(v9, "appendString:", v8(*(_QWORD *)(a1 + 32), v5));
  else
    objc_msgSend(v9, "appendFormat:", CFSTR("%p"), v5);
  objc_msgSend(*(id *)(a1 + 56), "appendString:", CFSTR(";\n"));
  return 1;
}

- (id)allKeys
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
  v15[2] = __28__NSClassicMapTable_allKeys__block_invoke;
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

uint64_t __28__NSClassicMapTable_allKeys__block_invoke(uint64_t a1, uint64_t a2)
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

- (id)allValues
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
  v15[2] = __30__NSClassicMapTable_allValues__block_invoke;
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

uint64_t __30__NSClassicMapTable_allValues__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = *(_QWORD *)(a2 + 24);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(_QWORD **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v4 + 1;
  *v4 = v2;
  return 1;
}

- (unint64_t)getKeys:(const void *)a3 values:(const void *)a4
{
  __CFBasicHash *ht;
  unint64_t Count;
  _QWORD v8[6];
  _QWORD v9[4];
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v10[3] = a3;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  v9[3] = a4;
  ht = self->_ht;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __36__NSClassicMapTable_getKeys_values___block_invoke;
  v8[3] = &unk_1E0F4F5B0;
  v8[4] = v10;
  v8[5] = v9;
  CFBasicHashApply(ht, (uint64_t)v8);
  Count = CFBasicHashGetCount(self->_ht);
  _Block_object_dispose(v9, 8);
  _Block_object_dispose(v10, 8);
  return Count;
}

uint64_t __36__NSClassicMapTable_getKeys_values___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v2 = *(_QWORD *)(a2 + 8);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(_QWORD **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v4 + 1;
  *v4 = v2;
  v5 = *(_QWORD *)(a2 + 24);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(_QWORD **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v7 + 1;
  *v7 = v5;
  return 1;
}

@end
