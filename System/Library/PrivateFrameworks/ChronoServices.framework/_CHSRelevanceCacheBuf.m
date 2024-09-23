@implementation _CHSRelevanceCacheBuf

- (NSArray)archivedObjects
{
  const RelevanceCacheBuf *ptr;
  const RelevanceCacheBuf *v3;
  uint64_t v4;
  unsigned int *var0;
  void *v7;
  void *v8;
  _QWORD aBlock[5];

  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 < 5u)
    return (NSArray *)0;
  v4 = *(unsigned __int16 *)v3[4].var0;
  if (!v4)
    return (NSArray *)0;
  var0 = (unsigned int *)ptr[v4 + *(unsigned int *)ptr[v4].var0].var0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __40___CHSRelevanceCacheBuf_archivedObjects__block_invoke;
  aBlock[3] = &__block_descriptor_40_e18___NSNumber_16__0Q8l;
  aBlock[4] = var0;
  v7 = _Block_copy(aBlock);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFCEC8]), "initWithBufRef:count:objectAtIndex:", self->_br, *var0, v7);

  return (NSArray *)v8;
}

- (NSData)archivedObjectsAsData
{
  const RelevanceCacheBuf *ptr;
  const RelevanceCacheBuf *v3;
  uint64_t v4;
  const RelevanceCacheBuf *v7;
  CFDataRef v8;
  void *v9;

  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 5u && (v4 = *(unsigned __int16 *)v3[4].var0) != 0)
  {
    v7 = &ptr[v4 + *(unsigned int *)ptr[v4].var0];
    -[AFBBufRef retainBuf](self->_br, "retainBuf");
    v8 = CFDataCreateWithBytesNoCopy(0, v7[4].var0, *(unsigned int *)v7->var0, (CFAllocatorRef)-[AFBBufRef deallocator](self->_br, "deallocator"));
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_CHSRelevanceCache_generated.mm"), 187, CFSTR("Failed to create CFData"));

    }
  }
  else
  {
    v8 = 0;
  }
  return (NSData *)v8;
}

- (const)archivedObjectsAsCArrayWithCount:(unint64_t *)a3
{
  const RelevanceCacheBuf *ptr;
  const RelevanceCacheBuf *v4;
  uint64_t v5;
  const RelevanceCacheBuf *v6;
  unint64_t v7;
  const char *v8;

  if (a3)
    *a3 = 0;
  ptr = self->_ptr;
  v4 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v4->var0 < 5u)
    return 0;
  v5 = *(unsigned __int16 *)v4[4].var0;
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

- (BOOL)enumerateArchivedObjectsUsingBlock:(id)a3
{
  void (**v4)(id, _QWORD, unint64_t, unsigned __int8 *);
  const RelevanceCacheBuf *ptr;
  const RelevanceCacheBuf *v6;
  uint64_t v7;
  const RelevanceCacheBuf *v8;
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
  if (*(unsigned __int16 *)v6->var0 >= 5u && (v7 = *(unsigned __int16 *)v6[4].var0) != 0)
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

- (NSArray)groups
{
  const RelevanceCacheBuf *ptr;
  const RelevanceCacheBuf *v3;
  uint64_t v4;
  unsigned int *var0;
  void *v7;
  void *v8;
  _QWORD v10[6];

  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 < 7u)
    return (NSArray *)0;
  v4 = *(unsigned __int16 *)v3[6].var0;
  if (!v4)
    return (NSArray *)0;
  var0 = (unsigned int *)ptr[v4 + *(unsigned int *)ptr[v4].var0].var0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __31___CHSRelevanceCacheBuf_groups__block_invoke;
  v10[3] = &unk_1E2A5B0F0;
  v10[4] = self;
  v10[5] = var0;
  v7 = _Block_copy(v10);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFCEC8]), "initWithBufRef:count:objectAtIndex:", self->_br, *var0, v7);

  return (NSArray *)v8;
}

- (id)deepCopyUsingBufferBuilder:(id)a3
{
  -[_CHSRelevanceCacheBuf deepCopyUsingBufferBuilder:changes:](self, "deepCopyUsingBufferBuilder:changes:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)deepCopyUsingBufferBuilder:(id)a3 changes:(id)a4
{
  id v7;
  _BYTE *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_CHSRelevanceCache_generated.mm"), 235, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bufferBuilder"));

  }
  v9 = (void *)MEMORY[0x194008FB8]();
  v10 = MEMORY[0x1E0C809B0];
  if (!v8)
  {
LABEL_6:
    -[_CHSRelevanceCacheBuf archivedObjects](self, "archivedObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v7, "createVectorOfUInt8WithArray:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }

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
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", *((unsigned int *)v8 + 5));
    goto LABEL_21;
  }
  if (v8[16])
  {
    v16 = 0;
    goto LABEL_21;
  }
LABEL_15:
  -[_CHSRelevanceCacheBuf groups](self, "groups");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v25[0] = v10;
    v25[1] = 3221225472;
    v25[2] = __60___CHSRelevanceCacheBuf_deepCopyUsingBufferBuilder_changes___block_invoke;
    v25[3] = &unk_1E2A5B118;
    v14 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v13, "count"));
    v26 = v14;
    v15 = v7;
    v27 = v15;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", v25);
    objc_msgSend(v15, "_chsCreateVectorOfWidgetRelevancePropertiesBufWithOffsets:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }

LABEL_21:
  v22[0] = v10;
  v22[1] = 3221225472;
  v22[2] = __60___CHSRelevanceCacheBuf_deepCopyUsingBufferBuilder_changes___block_invoke_2;
  v22[3] = &unk_1E2A5B140;
  v17 = v12;
  v23 = v17;
  v24 = v16;
  v18 = v16;
  objc_msgSend(v7, "_chsCreateRelevanceCacheBufUsingBlock:", v22);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v9);
  return v19;
}

- (_CHSRelevanceCacheBuf)initWithBufRef:(id)a3 cppPointer:(const RelevanceCacheBuf *)a4
{
  id v7;
  _CHSRelevanceCacheBuf *v8;
  _CHSRelevanceCacheBuf *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_CHSRelevanceCacheBuf;
  v8 = -[_CHSRelevanceCacheBuf init](&v11, sel_init);
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
  return -[_CHSRelevanceCacheBuf initVerifiedRootObjectFromData:requireUTF8:](self, "initVerifiedRootObjectFromData:requireUTF8:", a3, 1);
}

- (id)initVerifiedRootObjectFromData:(id)a3 requireUTF8:(BOOL)a4
{
  return -[_CHSRelevanceCacheBuf initVerifiedRootObjectFromData:requireUTF8:maxDepth:maxTables:](self, "initVerifiedRootObjectFromData:requireUTF8:maxDepth:maxTables:", a3, a4, 64, 1000000);
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
  _CHSRelevanceCacheBuf *v18;
  _CHSRelevanceCacheBuf *v19;
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
  if (apple::aiml::flatbuffers2::Verifier::VerifyBufferFromStart<RelevanceCacheBuf>((apple::aiml::flatbuffers2::Verifier *)&v21, "RECA", 0))
  {
    v15 = *v14;
    v16 = objc_alloc(MEMORY[0x1E0CFCED0]);
    v17 = (void *)objc_msgSend(v16, "initWithData:", v12, v21, v22, v23, v24, v25, v26);
    self = -[_CHSRelevanceCacheBuf initWithBufRef:cppPointer:](self, "initWithBufRef:cppPointer:", v17, (char *)v14 + v15);

    v18 = self;
    if (a4)
    {
      if (-[_CHSRelevanceCacheBuf verifyUTF8Fields](self, "verifyUTF8Fields"))
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
  void *v2;
  void *v3;
  int v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  -[_CHSRelevanceCacheBuf groups](self, "groups");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    goto LABEL_3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 1;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41___CHSRelevanceCacheBuf_verifyUTF8Fields__block_invoke;
  v6[3] = &unk_1E2A5B168;
  v6[4] = &v7;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v6);
  v4 = *((unsigned __int8 *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  if (v4)
LABEL_3:
    LOBYTE(v4) = 1;

  return v4;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;

  v3 = (void *)MEMORY[0x194008FB8](self, a2);
  -[_CHSRelevanceCacheBuf archivedObjects](self, "archivedObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");

  -[_CHSRelevanceCacheBuf groups](self, "groups");
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
      -[_CHSRelevanceCacheBuf archivedObjects](self, "archivedObjects");
      v8 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "archivedObjects");
      v9 = objc_claimAutoreleasedReturnValue();
      if (v8 | v9 && (v10 = objc_msgSend((id)v8, "isEqual:", v9), (id)v9, (id)v8, !v10))
      {
        v13 = 0;
      }
      else
      {
        -[_CHSRelevanceCacheBuf groups](self, "groups");
        v11 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "groups");
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
