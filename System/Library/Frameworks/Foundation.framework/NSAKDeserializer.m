@implementation NSAKDeserializer

- (id)initForDeserializerStream:(id)a3
{
  NSAKDeserializer *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)NSAKDeserializer;
  v4 = -[NSAKDeserializer init](&v6, sel_init);
  v4->ds = a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSAKDeserializer;
  -[NSAKDeserializer dealloc](&v3, sel_dealloc);
}

- (id)deserializerStream
{
  return self->ds;
}

- (id)deserializeNewObject
{
  id result;

  switch(objc_msgSend(self->ds, "readInt"))
  {
    case 1u:
      result = -[NSAKDeserializer deserializeNewData](self, "deserializeNewData");
      break;
    case 2u:
      result = -[NSAKDeserializer deserializeNewList](self, "deserializeNewList");
      break;
    case 3u:
      result = -[NSAKDeserializer deserializeNewPList](self, "deserializeNewPList");
      break;
    case 4u:
      result = -[NSAKDeserializer deserializeNewString](self, "deserializeNewString");
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (id)deserializeNewData
{
  return -[NSAKDeserializer deserializeData:](self, "deserializeData:", objc_msgSend(MEMORY[0x1E0C99D50], "allocWithZone:", -[NSAKDeserializer zone](self, "zone")));
}

- (id)deserializeData:(id)a3
{
  NSUInteger v5;
  void *v6;
  void *v7;

  v5 = objc_msgSend(self->ds, "readAlignedDataSize");
  v6 = NSAllocateMemoryPages(v5);
  objc_msgSend(self->ds, "readData:length:", v6, v5);
  v7 = (void *)objc_msgSend(a3, "initWithBytes:length:", v6, v5);
  NSDeallocateMemoryPages(v6, v5);
  return v7;
}

- (id)deserializeNewString
{
  return -[NSAKDeserializer deserializeString:](self, "deserializeString:", +[NSString allocWithZone:](NSString, "allocWithZone:", -[NSAKDeserializer zone](self, "zone")));
}

- (id)deserializeNewKeyString
{
  return -[NSAKDeserializer deserializeString:](self, "deserializeString:", +[NSString allocWithZone:](NSString, "allocWithZone:", -[NSAKDeserializer zone](self, "zone")));
}

- (id)deserializeString:(id)a3
{
  vm_size_t v5;
  vm_address_t v6;
  void *v7;

  v5 = objc_msgSend(self->ds, "readAlignedDataSize");
  v6 = allocate(v5);
  objc_msgSend(self->ds, "readData:length:", v6, v5);
  v7 = (void *)objc_msgSend(a3, "initWithBytes:length:encoding:", v6, v5, 4);
  unallocate(v6, v5);
  return v7;
}

- (id)deserializeNewList
{
  return -[NSAKDeserializer deserializeList:](self, "deserializeList:", objc_msgSend(MEMORY[0x1E0C99DE8], "allocWithZone:", -[NSAKDeserializer zone](self, "zone")));
}

- (id)deserializeList:(id)a3
{
  int v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t i;
  id v13;
  void *v15;
  const __CFString *v16;

  v5 = objc_msgSend(self->ds, "readInt");
  if (v5 < 0)
  {
    v15 = (void *)MEMORY[0x1E0C99DA0];
    v16 = CFSTR("count too large");
    goto LABEL_11;
  }
  v6 = v5;
  v7 = malloc_type_malloc(8 * v5, 0x100004000313F17uLL);
  if (!v7)
  {
    v15 = (void *)MEMORY[0x1E0C99DA0];
    v16 = CFSTR("unable to allocate memory");
LABEL_11:
    objc_exception_throw((id)objc_msgSend(v15, "exceptionWithName:reason:userInfo:", CFSTR("NSDeserializeException"), v16, 0));
  }
  v8 = v7;
  v9 = (void *)objc_msgSend(a3, "init");
  if ((_DWORD)v6)
  {
    v10 = v8;
    v11 = v6;
    do
    {
      *v10++ = (int)objc_msgSend(self->ds, "readInt");
      --v11;
    }
    while (v11);
    for (i = 0; i != v6; ++i)
    {
      v13 = -[NSAKDeserializer deserializeListItemIn:at:length:](self, "deserializeListItemIn:at:length:", v9, i, v8[i]);
      objc_msgSend(v9, "addObject:", v13);

    }
  }
  free(v8);
  return v9;
}

- (id)deserializeNewPList
{
  return -[NSAKDeserializer deserializePList:](self, "deserializePList:", objc_msgSend(MEMORY[0x1E0C99E08], "allocWithZone:", -[NSAKDeserializer zone](self, "zone")));
}

- (id)deserializePList:(id)a3
{
  void *v4;
  int v5;
  int v6;
  uint64_t v7;
  _QWORD *v8;
  malloc_zone_t *v9;
  _QWORD *v10;
  _QWORD *v11;
  BOOL v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t *v17;
  _QWORD *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  BOOL v23;

  v4 = (void *)objc_msgSend(a3, "init");
  v5 = objc_msgSend(self->ds, "readInt");
  v6 = v5;
  if (v5 < 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NSDeserializeException"), CFSTR("count too large"), 0));
  v7 = v5;
  v8 = malloc_type_malloc(8 * v5, 0x100004000313F17uLL);
  v9 = malloc_default_zone();
  v10 = malloc_type_zone_calloc(v9, 1uLL, 8 * v6, 0xC2E5A2B2uLL);
  v11 = v10;
  if (v8)
    v12 = v10 == 0;
  else
    v12 = 1;
  if (v12)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NSDeserializeException"), CFSTR("unable to allocate memory"), 0));
  if (v6)
  {
    v13 = v10;
    v14 = v7;
    do
    {
      *v13++ = -[NSAKDeserializer deserializePListKeyIn:](self, "deserializePListKeyIn:", v4);
      --v14;
    }
    while (v14);
    v15 = v8;
    v16 = v7;
    do
    {
      *v15++ = (int)objc_msgSend(self->ds, "readInt");
      --v16;
    }
    while (v16);
    v17 = v8;
    v18 = v11;
    do
    {
      v19 = *v17++;
      v20 = (void *)*v18;
      v21 = -[NSAKDeserializer deserializePListValueIn:key:length:](self, "deserializePListValueIn:key:length:", v4, *v18, v19);
      v22 = v21;
      if (v20)
        v23 = v21 == 0;
      else
        v23 = 1;
      if (!v23)
        objc_msgSend(v4, "setObject:forKey:", v21, v20);

      ++v18;
      --v7;
    }
    while (v7);
  }
  free(v8);
  free(v11);
  return v4;
}

@end
