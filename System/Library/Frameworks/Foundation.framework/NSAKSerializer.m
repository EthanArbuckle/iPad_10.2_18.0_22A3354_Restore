@implementation NSAKSerializer

- (id)initForSerializerStream:(id)a3
{
  NSAKSerializer *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)NSAKSerializer;
  v4 = -[NSAKSerializer init](&v6, sel_init);
  v4->ss = a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSAKSerializer;
  -[NSAKSerializer dealloc](&v3, sel_dealloc);
}

- (id)serializerStream
{
  return self->ss;
}

- (unint64_t)serializeObject:(id)a3
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v8;

  if ((_NSIsNSData() & 1) != 0)
  {
    v5 = objc_msgSend(self->ss, "writeInt:", 1);
    v6 = -[NSAKSerializer serializeData:](self, "serializeData:", a3);
    return v6 + v5;
  }
  if ((_NSIsNSArray() & 1) != 0)
  {
    v5 = objc_msgSend(self->ss, "writeInt:", 2);
    v6 = -[NSAKSerializer serializeList:](self, "serializeList:", a3);
    return v6 + v5;
  }
  if ((_NSIsNSDictionary() & 1) != 0)
  {
    v5 = objc_msgSend(self->ss, "writeInt:", 3);
    v6 = -[NSAKSerializer serializePropertyList:](self, "serializePropertyList:", a3);
    return v6 + v5;
  }
  if ((_NSIsNSString() & 1) != 0)
  {
    v5 = objc_msgSend(self->ss, "writeInt:", 4);
    v6 = -[NSAKSerializer serializeString:](self, "serializeString:", a3);
    return v6 + v5;
  }
  if (a3)
  {
    v8 = objc_opt_class();
    NSLog((NSString *)CFSTR("Serializing object of class %@\n"), v8);
  }
  return objc_msgSend(self->ss, "writeInt:", 0);
}

- (unint64_t)serializeData:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v5 = objc_msgSend(a3, "length");
  v6 = objc_msgSend(a3, "bytes");
  v7 = objc_msgSend(self->ss, "writeAlignedDataSize:", v5);
  return objc_msgSend(self->ss, "writeData:length:", v6, v5) + v7;
}

- (unint64_t)serializeString:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v4 = (void *)objc_msgSend(a3, "dataUsingEncoding:allowLossyConversion:", 4, 1);
  v5 = objc_msgSend(v4, "length");
  v6 = objc_msgSend(self->ss, "writeAlignedDataSize:", v5);
  return objc_msgSend(self->ss, "writeData:length:", objc_msgSend(v4, "bytes"), v5) + v6;
}

- (unint64_t)serializeList:(id)a3
{
  uint64_t v5;
  unint64_t v6;
  unsigned int *v7;
  unsigned int *v8;
  char *v9;
  uint64_t v10;
  uint64_t i;
  unint64_t v12;

  v5 = objc_msgSend(a3, "count");
  v6 = objc_msgSend(self->ss, "writeInt:", v5);
  v7 = (unsigned int *)malloc_type_malloc(4 * v5, 0x100004052888210uLL);
  if (!v7)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NSSerializeException"), CFSTR("unable to allocate memory"), 0));
  v8 = v7;
  if (v5)
  {
    v9 = (char *)v7;
    v10 = v5;
    do
    {
      v6 += objc_msgSend(self->ss, "writeRoomForInt:", v9);
      v9 += 4;
      --v10;
    }
    while (v10);
    for (i = 0; i != v5; ++i)
    {
      v12 = -[NSAKSerializer serializeListItemIn:at:](self, "serializeListItemIn:at:", a3, i);
      objc_msgSend(self->ss, "writeDelayedInt:for:", v12, v8[i]);
      v6 += v12;
    }
  }
  free(v8);
  return v6;
}

- (unint64_t)serializeListItemIn:(id)a3 at:(unint64_t)a4
{
  return -[NSAKSerializer serializeObject:](self, "serializeObject:", objc_msgSend(a3, "objectAtIndex:", a4));
}

- (unint64_t)serializePropertyList:(id)a3
{
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  _QWORD v12[9];
  _QWORD v13[4];
  _QWORD v14[7];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a3, "count");
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v18 = objc_msgSend(self->ss, "writeInt:", v5);
  v6 = (char *)malloc_type_malloc(4 * v5, 0x546FFFFFuLL);
  if (!v6)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NSSerializeException"), CFSTR("unable to allocate memory"), 0));
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __40__NSAKSerializer_serializePropertyList___block_invoke;
  v14[3] = &unk_1E0F52548;
  v14[4] = self;
  v14[5] = a3;
  v14[6] = &v15;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v14);
  bzero(v6, 4 * v5);
  if (v5)
  {
    v8 = v6;
    do
    {
      v9 = objc_msgSend(self->ss, "writeRoomForInt:", v8);
      v16[3] += v9;
      v8 += 4;
      --v5;
    }
    while (v5);
  }
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v13[3] = 0;
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __40__NSAKSerializer_serializePropertyList___block_invoke_2;
  v12[3] = &unk_1E0F52570;
  v12[4] = self;
  v12[5] = a3;
  v12[7] = v13;
  v12[8] = v6;
  v12[6] = &v15;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v12);
  free(v6);
  v10 = v16[3];
  _Block_object_dispose(v13, 8);
  _Block_object_dispose(&v15, 8);
  return v10;
}

uint64_t __40__NSAKSerializer_serializePropertyList___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "serializePListKeyIn:key:value:", *(_QWORD *)(a1 + 40), a2, a3);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += result;
  return result;
}

uint64_t __40__NSAKSerializer_serializePropertyList___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  v4 = objc_msgSend(*(id *)(a1 + 32), "serializePListValueIn:key:value:", *(_QWORD *)(a1 + 40), a2, a3);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += v4;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "writeDelayedInt:for:", v4, *(unsigned int *)(*(_QWORD *)(a1 + 64) + 4* (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))++));
}

- (unint64_t)serializePListKeyIn:(id)a3 key:(id)a4 value:(id)a5
{
  return -[NSAKSerializer serializeString:](self, "serializeString:", a4);
}

- (unint64_t)serializePListValueIn:(id)a3 key:(id)a4 value:(id)a5
{
  return -[NSAKSerializer serializeObject:](self, "serializeObject:", a5, a4);
}

@end
