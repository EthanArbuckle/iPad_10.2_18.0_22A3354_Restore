@implementation _CHSIntentReferenceBuf

- (BOOL)hasStableHash
{
  const IntentReferenceBuf *v2;

  v2 = &self->_ptr[-*(int *)self->_ptr];
  return *(unsigned __int16 *)v2->var0 >= 5u && *(_WORD *)v2[4].var0 != 0;
}

- (int64_t)stableHash
{
  const IntentReferenceBuf *ptr;
  const IntentReferenceBuf *v3;
  uint64_t v4;

  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 5u && (v4 = *(unsigned __int16 *)v3[4].var0) != 0)
    return *(_QWORD *)ptr[v4].var0;
  else
    return 0;
}

- (NSArray)intentData
{
  const IntentReferenceBuf *ptr;
  const IntentReferenceBuf *v3;
  uint64_t v4;
  unsigned int *var0;
  void *v7;
  void *v8;
  _QWORD aBlock[5];

  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 < 7u)
    return (NSArray *)0;
  v4 = *(unsigned __int16 *)v3[6].var0;
  if (!v4)
    return (NSArray *)0;
  var0 = (unsigned int *)ptr[v4 + *(unsigned int *)ptr[v4].var0].var0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __36___CHSIntentReferenceBuf_intentData__block_invoke;
  aBlock[3] = &__block_descriptor_40_e18___NSNumber_16__0Q8l;
  aBlock[4] = var0;
  v7 = _Block_copy(aBlock);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFCEC8]), "initWithBufRef:count:objectAtIndex:", self->_br, *var0, v7);

  return (NSArray *)v8;
}

- (NSData)intentDataAsData
{
  const IntentReferenceBuf *ptr;
  const IntentReferenceBuf *v3;
  uint64_t v4;
  const IntentReferenceBuf *v7;
  CFDataRef v8;
  void *v9;

  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 7u && (v4 = *(unsigned __int16 *)v3[6].var0) != 0)
  {
    v7 = &ptr[v4 + *(unsigned int *)ptr[v4].var0];
    -[AFBBufRef retainBuf](self->_br, "retainBuf");
    v8 = CFDataCreateWithBytesNoCopy(0, v7[4].var0, *(unsigned int *)v7->var0, (CFAllocatorRef)-[AFBBufRef deallocator](self->_br, "deallocator"));
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_CHSRelevanceCache_generated.mm"), 2092, CFSTR("Failed to create CFData"));

    }
  }
  else
  {
    v8 = 0;
  }
  return (NSData *)v8;
}

- (const)intentDataAsCArrayWithCount:(unint64_t *)a3
{
  const IntentReferenceBuf *ptr;
  const IntentReferenceBuf *v4;
  uint64_t v5;
  const IntentReferenceBuf *v6;
  unint64_t v7;
  const char *v8;

  if (a3)
    *a3 = 0;
  ptr = self->_ptr;
  v4 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v4->var0 < 7u)
    return 0;
  v5 = *(unsigned __int16 *)v4[6].var0;
  if (!v5)
    return 0;
  v6 = &ptr[v5 + *(unsigned int *)ptr[v5].var0];
  v7 = *(unsigned int *)v6->var0;
  if (a3)
    *a3 = v7;
  v8 = (const char *)&v6[4];
  if ((_DWORD)v7)
    return v8;
  else
    return (const char *)&emptyCArrayStorage;
}

- (BOOL)enumerateIntentDataUsingBlock:(id)a3
{
  void (**v4)(id, _QWORD, unint64_t, unsigned __int8 *);
  const IntentReferenceBuf *ptr;
  const IntentReferenceBuf *v6;
  uint64_t v7;
  const IntentReferenceBuf *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  BOOL v15;
  unsigned __int8 v17;

  v4 = (void (**)(id, _QWORD, unint64_t, unsigned __int8 *))a3;
  ptr = self->_ptr;
  v6 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v6->var0 >= 7u && (v7 = *(unsigned __int16 *)v6[6].var0) != 0)
  {
    v8 = &ptr[v7];
    v9 = *(unsigned int *)ptr[v7].var0;
    if (*(_DWORD *)ptr[v7 + v9].var0)
    {
      v10 = 0;
      v11 = (uint64_t)&ptr[v7 + 4 + v9];
      do
      {
        v12 = MEMORY[0x194008FB8]();
        v17 = 0;
        if (v10 >= *(unsigned int *)v8[v9].var0)
          __assert_rtn("Get", "flatbuffers.h", 275, "i < size()");
        v13 = (void *)v12;
        v4[2](v4, *(unsigned __int8 *)(v11 + v10), v10, &v17);
        v14 = v17;
        objc_autoreleasePoolPop(v13);
        if (v14)
          break;
        ++v10;
      }
      while (v10 < *(unsigned int *)v8[v9].var0);
    }
    v15 = 1;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (NSArray)schemaData
{
  const IntentReferenceBuf *ptr;
  const IntentReferenceBuf *v3;
  uint64_t v4;
  unsigned int *var0;
  void *v7;
  void *v8;
  _QWORD aBlock[5];

  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 < 9u)
    return (NSArray *)0;
  v4 = *(unsigned __int16 *)v3[8].var0;
  if (!v4)
    return (NSArray *)0;
  var0 = (unsigned int *)ptr[v4 + *(unsigned int *)ptr[v4].var0].var0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __36___CHSIntentReferenceBuf_schemaData__block_invoke;
  aBlock[3] = &__block_descriptor_40_e18___NSNumber_16__0Q8l;
  aBlock[4] = var0;
  v7 = _Block_copy(aBlock);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFCEC8]), "initWithBufRef:count:objectAtIndex:", self->_br, *var0, v7);

  return (NSArray *)v8;
}

- (NSData)schemaDataAsData
{
  const IntentReferenceBuf *ptr;
  const IntentReferenceBuf *v3;
  uint64_t v4;
  const IntentReferenceBuf *v7;
  CFDataRef v8;
  void *v9;

  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 9u && (v4 = *(unsigned __int16 *)v3[8].var0) != 0)
  {
    v7 = &ptr[v4 + *(unsigned int *)ptr[v4].var0];
    -[AFBBufRef retainBuf](self->_br, "retainBuf");
    v8 = CFDataCreateWithBytesNoCopy(0, v7[4].var0, *(unsigned int *)v7->var0, (CFAllocatorRef)-[AFBBufRef deallocator](self->_br, "deallocator"));
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_CHSRelevanceCache_generated.mm"), 2138, CFSTR("Failed to create CFData"));

    }
  }
  else
  {
    v8 = 0;
  }
  return (NSData *)v8;
}

- (const)schemaDataAsCArrayWithCount:(unint64_t *)a3
{
  const IntentReferenceBuf *ptr;
  const IntentReferenceBuf *v4;
  uint64_t v5;
  const IntentReferenceBuf *v6;
  unint64_t v7;
  const char *v8;

  if (a3)
    *a3 = 0;
  ptr = self->_ptr;
  v4 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v4->var0 < 9u)
    return 0;
  v5 = *(unsigned __int16 *)v4[8].var0;
  if (!v5)
    return 0;
  v6 = &ptr[v5 + *(unsigned int *)ptr[v5].var0];
  v7 = *(unsigned int *)v6->var0;
  if (a3)
    *a3 = v7;
  v8 = (const char *)&v6[4];
  if ((_DWORD)v7)
    return v8;
  else
    return (const char *)&emptyCArrayStorage;
}

- (BOOL)enumerateSchemaDataUsingBlock:(id)a3
{
  void (**v4)(id, _QWORD, unint64_t, unsigned __int8 *);
  const IntentReferenceBuf *ptr;
  const IntentReferenceBuf *v6;
  uint64_t v7;
  const IntentReferenceBuf *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  BOOL v15;
  unsigned __int8 v17;

  v4 = (void (**)(id, _QWORD, unint64_t, unsigned __int8 *))a3;
  ptr = self->_ptr;
  v6 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v6->var0 >= 9u && (v7 = *(unsigned __int16 *)v6[8].var0) != 0)
  {
    v8 = &ptr[v7];
    v9 = *(unsigned int *)ptr[v7].var0;
    if (*(_DWORD *)ptr[v7 + v9].var0)
    {
      v10 = 0;
      v11 = (uint64_t)&ptr[v7 + 4 + v9];
      do
      {
        v12 = MEMORY[0x194008FB8]();
        v17 = 0;
        if (v10 >= *(unsigned int *)v8[v9].var0)
          __assert_rtn("Get", "flatbuffers.h", 275, "i < size()");
        v13 = (void *)v12;
        v4[2](v4, *(unsigned __int8 *)(v11 + v10), v10, &v17);
        v14 = v17;
        objc_autoreleasePoolPop(v13);
        if (v14)
          break;
        ++v10;
      }
      while (v10 < *(unsigned int *)v8[v9].var0);
    }
    v15 = 1;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (NSArray)partialIntentData
{
  const IntentReferenceBuf *ptr;
  const IntentReferenceBuf *v3;
  uint64_t v4;
  unsigned int *var0;
  void *v7;
  void *v8;
  _QWORD aBlock[5];

  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 < 0xBu)
    return (NSArray *)0;
  v4 = *(unsigned __int16 *)v3[10].var0;
  if (!v4)
    return (NSArray *)0;
  var0 = (unsigned int *)ptr[v4 + *(unsigned int *)ptr[v4].var0].var0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __43___CHSIntentReferenceBuf_partialIntentData__block_invoke;
  aBlock[3] = &__block_descriptor_40_e18___NSNumber_16__0Q8l;
  aBlock[4] = var0;
  v7 = _Block_copy(aBlock);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFCEC8]), "initWithBufRef:count:objectAtIndex:", self->_br, *var0, v7);

  return (NSArray *)v8;
}

- (NSData)partialIntentDataAsData
{
  const IntentReferenceBuf *ptr;
  const IntentReferenceBuf *v3;
  uint64_t v4;
  const IntentReferenceBuf *v7;
  CFDataRef v8;
  void *v9;

  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0xBu && (v4 = *(unsigned __int16 *)v3[10].var0) != 0)
  {
    v7 = &ptr[v4 + *(unsigned int *)ptr[v4].var0];
    -[AFBBufRef retainBuf](self->_br, "retainBuf");
    v8 = CFDataCreateWithBytesNoCopy(0, v7[4].var0, *(unsigned int *)v7->var0, (CFAllocatorRef)-[AFBBufRef deallocator](self->_br, "deallocator"));
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_CHSRelevanceCache_generated.mm"), 2184, CFSTR("Failed to create CFData"));

    }
  }
  else
  {
    v8 = 0;
  }
  return (NSData *)v8;
}

- (const)partialIntentDataAsCArrayWithCount:(unint64_t *)a3
{
  const IntentReferenceBuf *ptr;
  const IntentReferenceBuf *v4;
  uint64_t v5;
  const IntentReferenceBuf *v6;
  unint64_t v7;
  const char *v8;

  if (a3)
    *a3 = 0;
  ptr = self->_ptr;
  v4 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v4->var0 < 0xBu)
    return 0;
  v5 = *(unsigned __int16 *)v4[10].var0;
  if (!v5)
    return 0;
  v6 = &ptr[v5 + *(unsigned int *)ptr[v5].var0];
  v7 = *(unsigned int *)v6->var0;
  if (a3)
    *a3 = v7;
  v8 = (const char *)&v6[4];
  if ((_DWORD)v7)
    return v8;
  else
    return (const char *)&emptyCArrayStorage;
}

- (BOOL)enumeratePartialIntentDataUsingBlock:(id)a3
{
  void (**v4)(id, _QWORD, unint64_t, unsigned __int8 *);
  const IntentReferenceBuf *ptr;
  const IntentReferenceBuf *v6;
  uint64_t v7;
  const IntentReferenceBuf *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  BOOL v15;
  unsigned __int8 v17;

  v4 = (void (**)(id, _QWORD, unint64_t, unsigned __int8 *))a3;
  ptr = self->_ptr;
  v6 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v6->var0 >= 0xBu && (v7 = *(unsigned __int16 *)v6[10].var0) != 0)
  {
    v8 = &ptr[v7];
    v9 = *(unsigned int *)ptr[v7].var0;
    if (*(_DWORD *)ptr[v7 + v9].var0)
    {
      v10 = 0;
      v11 = (uint64_t)&ptr[v7 + 4 + v9];
      do
      {
        v12 = MEMORY[0x194008FB8]();
        v17 = 0;
        if (v10 >= *(unsigned int *)v8[v9].var0)
          __assert_rtn("Get", "flatbuffers.h", 275, "i < size()");
        v13 = (void *)v12;
        v4[2](v4, *(unsigned __int8 *)(v11 + v10), v10, &v17);
        v14 = v17;
        objc_autoreleasePoolPop(v13);
        if (v14)
          break;
        ++v10;
      }
      while (v10 < *(unsigned int *)v8[v9].var0);
    }
    v15 = 1;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)deepCopyUsingBufferBuilder:(id)a3
{
  -[_CHSIntentReferenceBuf deepCopyUsingBufferBuilder:changes:](self, "deepCopyUsingBufferBuilder:changes:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)deepCopyUsingBufferBuilder:(id)a3 changes:(id)a4
{
  id v7;
  _BYTE *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BYTE *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v22;
  _QWORD v23[4];
  id v24;
  _CHSIntentReferenceBuf *v25;
  id v26;
  id v27;
  id v28;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_CHSRelevanceCache_generated.mm"), 2219, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bufferBuilder"));

  }
  v9 = (void *)MEMORY[0x194008FB8]();
  if (!v8)
    goto LABEL_6;
  if (v8[24] == 1)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", *((unsigned int *)v8 + 7));
    goto LABEL_13;
  }
  if (v8[24])
  {
    v11 = 0;
  }
  else
  {
LABEL_6:
    -[_CHSIntentReferenceBuf intentData](self, "intentData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v7, "createVectorOfUInt8WithArray:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }

    if (!v8)
    {
LABEL_15:
      -[_CHSIntentReferenceBuf schemaData](self, "schemaData");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        objc_msgSend(v7, "createVectorOfUInt8WithArray:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = 0;
      }

      if (!v8)
        goto LABEL_23;
      goto LABEL_21;
    }
  }
LABEL_13:
  if (v8[32] == 1)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", *((unsigned int *)v8 + 9));
  }
  else
  {
    if (!v8[32])
      goto LABEL_15;
    v13 = 0;
  }
LABEL_21:
  if (v8[40] == 1)
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", *((unsigned int *)v8 + 11));
    goto LABEL_29;
  }
  if (v8[40])
  {
    v15 = 0;
    goto LABEL_29;
  }
LABEL_23:
  -[_CHSIntentReferenceBuf partialIntentData](self, "partialIntentData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(v7, "createVectorOfUInt8WithArray:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }

LABEL_29:
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __61___CHSIntentReferenceBuf_deepCopyUsingBufferBuilder_changes___block_invoke;
  v23[3] = &unk_1E2A5B278;
  v16 = v8;
  v24 = v16;
  v25 = self;
  v17 = v11;
  v26 = v17;
  v18 = v13;
  v27 = v18;
  v28 = v15;
  v19 = v15;
  objc_msgSend(v7, "_chsCreateIntentReferenceBufUsingBlock:", v23);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v9);
  return v20;
}

- (_CHSIntentReferenceBuf)initWithBufRef:(id)a3 cppPointer:(const IntentReferenceBuf *)a4
{
  id v7;
  _CHSIntentReferenceBuf *v8;
  _CHSIntentReferenceBuf *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_CHSIntentReferenceBuf;
  v8 = -[_CHSIntentReferenceBuf init](&v11, sel_init);
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
  return -[_CHSIntentReferenceBuf initVerifiedRootObjectFromData:requireUTF8:](self, "initVerifiedRootObjectFromData:requireUTF8:", a3, 1);
}

- (id)initVerifiedRootObjectFromData:(id)a3 requireUTF8:(BOOL)a4
{
  return -[_CHSIntentReferenceBuf initVerifiedRootObjectFromData:requireUTF8:maxDepth:maxTables:](self, "initVerifiedRootObjectFromData:requireUTF8:maxDepth:maxTables:", a3, a4, 64, 1000000);
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
  _CHSIntentReferenceBuf *v18;
  _CHSIntentReferenceBuf *v19;
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
  if (apple::aiml::flatbuffers2::Verifier::VerifyBufferFromStart<IntentReferenceBuf>((apple::aiml::flatbuffers2::Verifier *)&v21, "RECA", 0))
  {
    v15 = *v14;
    v16 = objc_alloc(MEMORY[0x1E0CFCED0]);
    v17 = (void *)objc_msgSend(v16, "initWithData:", v12, v21, v22, v23, v24, v25, v26);
    self = -[_CHSIntentReferenceBuf initWithBufRef:cppPointer:](self, "initWithBufRef:cppPointer:", v17, (char *)v14 + v15);

    v18 = self;
    if (a4)
    {
      if (-[_CHSIntentReferenceBuf verifyUTF8Fields](self, "verifyUTF8Fields"))
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
  return 1;
}

- (unint64_t)hash
{
  void *v3;
  int64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  v3 = (void *)MEMORY[0x194008FB8](self, a2);
  v4 = -[_CHSIntentReferenceBuf stableHash](self, "stableHash");
  -[_CHSIntentReferenceBuf intentData](self, "intentData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");

  -[_CHSIntentReferenceBuf schemaData](self, "schemaData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");

  -[_CHSIntentReferenceBuf partialIntentData](self, "partialIntentData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash") + 37 * (v8 + 37 * (v6 + 37 * v4));

  objc_autoreleasePoolPop(v3);
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  char v17;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)MEMORY[0x194008FB8]();
      v8 = -[_CHSIntentReferenceBuf stableHash](self, "stableHash");
      if (v8 != objc_msgSend(v6, "stableHash"))
        goto LABEL_12;
      -[_CHSIntentReferenceBuf intentData](self, "intentData");
      v9 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "intentData");
      v10 = objc_claimAutoreleasedReturnValue();
      if (v9 | v10)
      {
        v11 = objc_msgSend((id)v9, "isEqual:", v10);

        if (!v11)
          goto LABEL_12;
      }
      -[_CHSIntentReferenceBuf schemaData](self, "schemaData");
      v12 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "schemaData");
      v13 = objc_claimAutoreleasedReturnValue();
      if (!(v12 | v13)
        || (v14 = objc_msgSend((id)v12, "isEqual:", v13), (id)v13, (id)v12, v14))
      {
        -[_CHSIntentReferenceBuf partialIntentData](self, "partialIntentData");
        v15 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "partialIntentData");
        v16 = objc_claimAutoreleasedReturnValue();
        if (v15 | v16)
          v17 = objc_msgSend((id)v15, "isEqual:", v16);
        else
          v17 = 1;

      }
      else
      {
LABEL_12:
        v17 = 0;
      }
      objc_autoreleasePoolPop(v7);
    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_br, 0);
}

@end
