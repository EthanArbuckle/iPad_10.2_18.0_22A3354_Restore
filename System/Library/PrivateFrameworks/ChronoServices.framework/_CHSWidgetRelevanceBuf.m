@implementation _CHSWidgetRelevanceBuf

- (NSString)attributeKey
{
  const WidgetRelevanceBuf *ptr;
  const WidgetRelevanceBuf *v3;
  uint64_t v4;
  const WidgetRelevanceBuf *v6;
  NSString *v7;
  void *v8;

  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 5u && (v4 = *(unsigned __int16 *)v3[4].var0) != 0)
  {
    v6 = &ptr[v4 + *(unsigned int *)ptr[v4].var0];
    NSStringFromSelector(a2);
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    makeNSString(v7, self->_br, (const char *)&v6[4]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return (NSString *)v8;
}

- (const)attributeKeyAsCString
{
  const WidgetRelevanceBuf *ptr;
  const WidgetRelevanceBuf *v3;
  uint64_t v4;

  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 5u && (v4 = *(unsigned __int16 *)v3[4].var0) != 0)
    return (const char *)&ptr[v4 + 4 + *(unsigned int *)ptr[v4].var0];
  else
    return 0;
}

- (NSData)attributeKeyAsData
{
  const WidgetRelevanceBuf *ptr;
  const WidgetRelevanceBuf *v3;
  uint64_t v4;
  const WidgetRelevanceBuf *v6;
  uint64_t v7;
  void *v8;
  id v9;
  unsigned int *var0;
  uint64_t v11;
  void *v12;
  void *v13;

  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 5u && (v4 = *(unsigned __int16 *)v3[4].var0) != 0)
  {
    v6 = &ptr[v4];
    v7 = *(unsigned int *)ptr[v4].var0;
    v8 = (void *)MEMORY[0x194008FB8]();
    -[AFBBufRef data](self->_br, "data");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    var0 = (unsigned int *)v6[v7].var0;
    v11 = (uint64_t)var0 - objc_msgSend(v9, "bytes") + 4;

    -[AFBBufRef data](self->_br, "data");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "subdataWithRange:", v11, *var0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v8);
  }
  else
  {
    v13 = 0;
  }
  return (NSData *)v13;
}

- (_CHSIntentReferenceBuf)intentReference
{
  const WidgetRelevanceBuf *ptr;
  const WidgetRelevanceBuf *v3;
  uint64_t v4;
  _CHSIntentReferenceBuf *v5;

  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 7u && (v4 = *(unsigned __int16 *)v3[6].var0) != 0)
    v5 = -[_CHSIntentReferenceBuf initWithBufRef:cppPointer:]([_CHSIntentReferenceBuf alloc], "initWithBufRef:cppPointer:", self->_br, &ptr[v4 + *(unsigned int *)ptr[v4].var0]);
  else
    v5 = 0;
  return v5;
}

- (id)deepCopyUsingBufferBuilder:(id)a3
{
  -[_CHSWidgetRelevanceBuf deepCopyUsingBufferBuilder:changes:](self, "deepCopyUsingBufferBuilder:changes:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)deepCopyUsingBufferBuilder:(id)a3 changes:(id)a4
{
  id v7;
  _BYTE *v8;
  void *v9;
  void *v10;
  const char *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_CHSRelevanceCache_generated.mm"), 1734, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bufferBuilder"));

  }
  v9 = (void *)MEMORY[0x194008FB8]();
  if (!v8)
  {
LABEL_6:
    v10 = (void *)MEMORY[0x194008FB8]();
    v11 = -[_CHSWidgetRelevanceBuf attributeKeyAsCString](objc_retainAutorelease(self), "attributeKeyAsCString");
    if (v11)
    {
      objc_msgSend(v7, "createStringWithCString:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
    objc_autoreleasePoolPop(v10);
    if (!v8)
      goto LABEL_15;
    goto LABEL_13;
  }
  if (v8[8] == 1)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", *((unsigned int *)v8 + 3));
  }
  else
  {
    if (!v8[8])
      goto LABEL_6;
    v12 = 0;
  }
LABEL_13:
  if (v8[16] == 1)
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", *((unsigned int *)v8 + 5));
    goto LABEL_21;
  }
  if (v8[16])
  {
    v15 = 0;
    goto LABEL_21;
  }
LABEL_15:
  -[_CHSWidgetRelevanceBuf intentReference](self, "intentReference");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "deepCopyUsingBufferBuilder:", v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }

LABEL_21:
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __61___CHSWidgetRelevanceBuf_deepCopyUsingBufferBuilder_changes___block_invoke;
  v21[3] = &unk_1E2A5B250;
  v16 = v12;
  v22 = v16;
  v23 = v15;
  v17 = v15;
  objc_msgSend(v7, "_chsCreateWidgetRelevanceBufUsingBlock:", v21);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v9);
  return v18;
}

- (_CHSWidgetRelevanceBuf)initWithBufRef:(id)a3 cppPointer:(const WidgetRelevanceBuf *)a4
{
  id v7;
  _CHSWidgetRelevanceBuf *v8;
  _CHSWidgetRelevanceBuf *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_CHSWidgetRelevanceBuf;
  v8 = -[_CHSWidgetRelevanceBuf init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_br, a3);
    v9->_ptr = a4;
  }

  return v9;
}

- (id)initVerifiedRootObjectFromData:(id)a3
{
  return -[_CHSWidgetRelevanceBuf initVerifiedRootObjectFromData:requireUTF8:](self, "initVerifiedRootObjectFromData:requireUTF8:", a3, 1);
}

- (id)initVerifiedRootObjectFromData:(id)a3 requireUTF8:(BOOL)a4
{
  return -[_CHSWidgetRelevanceBuf initVerifiedRootObjectFromData:requireUTF8:maxDepth:maxTables:](self, "initVerifiedRootObjectFromData:requireUTF8:maxDepth:maxTables:", a3, a4, 64, 1000000);
}

- (id)initVerifiedRootObjectFromData:(id)a3 requireUTF8:(BOOL)a4 maxDepth:(unsigned int)a5 maxTables:(unsigned int)a6
{
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  unsigned int *v14;
  uint64_t v15;
  id v16;
  void *v17;
  _CHSWidgetRelevanceBuf *v18;
  _CHSWidgetRelevanceBuf *v19;
  unsigned int *v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v10 = a3;
  v11 = (void *)MEMORY[0x194008FB8]();
  v12 = objc_retainAutorelease(v10);
  v13 = objc_msgSend(v12, "bytes");
  if (v13)
    v14 = (unsigned int *)v13;
  else
    v14 = (unsigned int *)&emptyCArrayStorage;
  v21 = v14;
  v22 = objc_msgSend(v12, "length");
  LODWORD(v23) = 0;
  HIDWORD(v23) = a5;
  LODWORD(v24) = 0;
  HIDWORD(v24) = a6;
  v25 = 0;
  LOBYTE(v26) = 1;
  if (v22 >= 0x7FFFFFFF)
    __assert_rtn("Verifier", "flatbuffers.h", 2285, "size_ < FLATBUFFERS_MAX_BUFFER_SIZE");
  if (apple::aiml::flatbuffers2::Verifier::VerifyBufferFromStart<WidgetRelevanceBuf>((apple::aiml::flatbuffers2::Verifier *)&v21, "RECA", 0))
  {
    v15 = *v14;
    v16 = objc_alloc(MEMORY[0x1E0CFCED0]);
    v17 = (void *)objc_msgSend(v16, "initWithData:", v12, v21, v22, v23, v24, v25, v26);
    self = -[_CHSWidgetRelevanceBuf initWithBufRef:cppPointer:](self, "initWithBufRef:cppPointer:", v17, (char *)v14 + v15);

    v18 = self;
    if (a4)
    {
      if (-[_CHSWidgetRelevanceBuf verifyUTF8Fields](self, "verifyUTF8Fields"))
        v18 = self;
      else
        v18 = 0;
    }
    v19 = v18;

  }
  else
  {
    v19 = 0;
  }
  objc_autoreleasePoolPop(v11);

  return v19;
}

- (BOOL)verifyUTF8Fields
{
  const WidgetRelevanceBuf *v3;
  void *v4;
  void *v5;
  char v6;

  v3 = &self->_ptr[-*(int *)self->_ptr];
  if (*(unsigned __int16 *)v3->var0 >= 5u && *(_WORD *)v3[4].var0 && !AFBIsValidUTF8())
    return 0;
  -[_CHSWidgetRelevanceBuf intentReference](self, "intentReference");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "verifyUTF8Fields");
  else
    v6 = 1;

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  v3 = (void *)MEMORY[0x194008FB8](self, a2);
  -[_CHSWidgetRelevanceBuf attributeKey](self, "attributeKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");

  -[_CHSWidgetRelevanceBuf intentReference](self, "intentReference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash") + 37 * v5;

  objc_autoreleasePoolPop(v3);
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)MEMORY[0x194008FB8]();
      -[_CHSWidgetRelevanceBuf attributeKey](self, "attributeKey");
      v8 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "attributeKey");
      v9 = objc_claimAutoreleasedReturnValue();
      if (v8 | v9 && (v10 = objc_msgSend((id)v8, "isEqual:", v9), (id)v9, (id)v8, !v10))
      {
        v13 = 0;
      }
      else
      {
        -[_CHSWidgetRelevanceBuf intentReference](self, "intentReference");
        v11 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "intentReference");
        v12 = objc_claimAutoreleasedReturnValue();
        if (v11 | v12)
          v13 = objc_msgSend((id)v11, "isEqual:", v12);
        else
          v13 = 1;

      }
      objc_autoreleasePoolPop(v7);
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_br, 0);
}

@end
