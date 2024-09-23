@implementation _CHSWidgetRelevancePropertiesBuf

- (_CHSExtensionIdentityBuf)extensionIdentity
{
  const WidgetRelevancePropertiesBuf *ptr;
  const WidgetRelevancePropertiesBuf *v3;
  uint64_t v4;
  _CHSExtensionIdentityBuf *v5;

  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 5u && (v4 = *(unsigned __int16 *)v3[4].var0) != 0)
    v5 = -[_CHSExtensionIdentityBuf initWithBufRef:cppPointer:]([_CHSExtensionIdentityBuf alloc], "initWithBufRef:cppPointer:", self->_br, &ptr[v4 + *(unsigned int *)ptr[v4].var0]);
  else
    v5 = 0;
  return v5;
}

- (NSString)kind
{
  const WidgetRelevancePropertiesBuf *ptr;
  const WidgetRelevancePropertiesBuf *v3;
  uint64_t v4;
  const WidgetRelevancePropertiesBuf *v6;
  NSString *v7;
  void *v8;

  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 7u && (v4 = *(unsigned __int16 *)v3[6].var0) != 0)
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

- (const)kindAsCString
{
  const WidgetRelevancePropertiesBuf *ptr;
  const WidgetRelevancePropertiesBuf *v3;
  uint64_t v4;

  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 7u && (v4 = *(unsigned __int16 *)v3[6].var0) != 0)
    return (const char *)&ptr[v4 + 4 + *(unsigned int *)ptr[v4].var0];
  else
    return 0;
}

- (NSData)kindAsData
{
  const WidgetRelevancePropertiesBuf *ptr;
  const WidgetRelevancePropertiesBuf *v3;
  uint64_t v4;
  const WidgetRelevancePropertiesBuf *v6;
  uint64_t v7;
  void *v8;
  id v9;
  unsigned int *var0;
  uint64_t v11;
  void *v12;
  void *v13;

  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 7u && (v4 = *(unsigned __int16 *)v3[6].var0) != 0)
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

- (BOOL)hasSupportsBackgroundRefresh
{
  const WidgetRelevancePropertiesBuf *v2;

  v2 = &self->_ptr[-*(int *)self->_ptr];
  return *(unsigned __int16 *)v2->var0 >= 9u && *(_WORD *)v2[8].var0 != 0;
}

- (BOOL)supportsBackgroundRefresh
{
  const WidgetRelevancePropertiesBuf *ptr;
  const WidgetRelevancePropertiesBuf *v3;
  uint64_t v4;

  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  return *(unsigned __int16 *)v3->var0 >= 9u && (v4 = *(unsigned __int16 *)v3[8].var0) != 0 && ptr[v4].var0[0] != 0;
}

- (BOOL)hasIsDeletion
{
  const WidgetRelevancePropertiesBuf *v2;

  v2 = &self->_ptr[-*(int *)self->_ptr];
  return *(unsigned __int16 *)v2->var0 >= 0xBu && *(_WORD *)v2[10].var0 != 0;
}

- (BOOL)isDeletion
{
  const WidgetRelevancePropertiesBuf *ptr;
  const WidgetRelevancePropertiesBuf *v3;
  uint64_t v4;

  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  return *(unsigned __int16 *)v3->var0 >= 0xBu && (v4 = *(unsigned __int16 *)v3[10].var0) != 0 && ptr[v4].var0[0] != 0;
}

- (BOOL)hasLastRelevanceUpdate
{
  const WidgetRelevancePropertiesBuf *v2;

  v2 = &self->_ptr[-*(int *)self->_ptr];
  return *(unsigned __int16 *)v2->var0 >= 0xDu && *(_WORD *)v2[12].var0 != 0;
}

- (double)lastRelevanceUpdate
{
  const WidgetRelevancePropertiesBuf *ptr;
  const WidgetRelevancePropertiesBuf *v3;
  double result;
  uint64_t v5;

  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  result = 0.0;
  if (*(unsigned __int16 *)v3->var0 >= 0xDu)
  {
    v5 = *(unsigned __int16 *)v3[12].var0;
    if (v5)
      return *(double *)ptr[v5].var0;
  }
  return result;
}

- (NSArray)relevances
{
  const WidgetRelevancePropertiesBuf *ptr;
  const WidgetRelevancePropertiesBuf *v3;
  uint64_t v4;
  unsigned int *var0;
  void *v7;
  void *v8;
  _QWORD v10[6];

  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 < 0xFu)
    return (NSArray *)0;
  v4 = *(unsigned __int16 *)v3[14].var0;
  if (!v4)
    return (NSArray *)0;
  var0 = (unsigned int *)ptr[v4 + *(unsigned int *)ptr[v4].var0].var0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __46___CHSWidgetRelevancePropertiesBuf_relevances__block_invoke;
  v10[3] = &unk_1E2A5B0F0;
  v10[4] = self;
  v10[5] = var0;
  v7 = _Block_copy(v10);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFCEC8]), "initWithBufRef:count:objectAtIndex:", self->_br, *var0, v7);

  return (NSArray *)v8;
}

- (id)deepCopyUsingBufferBuilder:(id)a3
{
  -[_CHSWidgetRelevancePropertiesBuf deepCopyUsingBufferBuilder:changes:](self, "deepCopyUsingBufferBuilder:changes:", a3, 0);
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
  void *v14;
  const char *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  _BYTE *v23;
  id v24;
  void *v25;
  void *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  _CHSWidgetRelevancePropertiesBuf *v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_CHSRelevanceCache_generated.mm"), 1186, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bufferBuilder"));

  }
  v9 = (void *)MEMORY[0x194008FB8]();
  v10 = MEMORY[0x1E0C809B0];
  if (!v8)
    goto LABEL_6;
  if (v8[8] == 1)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", *((unsigned int *)v8 + 3));
    goto LABEL_13;
  }
  if (v8[8])
  {
    v13 = 0;
  }
  else
  {
LABEL_6:
    -[_CHSWidgetRelevancePropertiesBuf extensionIdentity](self, "extensionIdentity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "deepCopyUsingBufferBuilder:", v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }

    if (!v8)
    {
LABEL_15:
      v14 = (void *)MEMORY[0x194008FB8]();
      v15 = -[_CHSWidgetRelevancePropertiesBuf kindAsCString](objc_retainAutorelease(self), "kindAsCString");
      if (v15)
      {
        objc_msgSend(v7, "createStringWithCString:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = 0;
      }
      objc_autoreleasePoolPop(v14);
      if (!v8)
        goto LABEL_23;
      goto LABEL_21;
    }
  }
LABEL_13:
  if (v8[16] == 1)
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", *((unsigned int *)v8 + 5));
  }
  else
  {
    if (!v8[16])
      goto LABEL_15;
    v16 = 0;
  }
LABEL_21:
  if (v8[40] == 1)
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", *((unsigned int *)v8 + 11));
    goto LABEL_29;
  }
  if (v8[40])
  {
    v20 = 0;
    goto LABEL_29;
  }
LABEL_23:
  -[_CHSWidgetRelevancePropertiesBuf relevances](self, "relevances");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v34[0] = v10;
    v34[1] = 3221225472;
    v34[2] = __71___CHSWidgetRelevancePropertiesBuf_deepCopyUsingBufferBuilder_changes___block_invoke;
    v34[3] = &unk_1E2A5B1D8;
    v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v17, "count"));
    v35 = v18;
    v19 = v7;
    v36 = v19;
    objc_msgSend(v17, "enumerateObjectsUsingBlock:", v34);
    objc_msgSend(v19, "_chsCreateVectorOfWidgetRelevanceBufWithOffsets:", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = MEMORY[0x1E0C809B0];
  }
  else
  {
    v20 = 0;
  }

LABEL_29:
  v28[0] = v10;
  v28[1] = 3221225472;
  v28[2] = __71___CHSWidgetRelevancePropertiesBuf_deepCopyUsingBufferBuilder_changes___block_invoke_2;
  v28[3] = &unk_1E2A5B200;
  v21 = v13;
  v29 = v21;
  v22 = v16;
  v30 = v22;
  v23 = v8;
  v31 = v23;
  v32 = self;
  v33 = v20;
  v24 = v20;
  objc_msgSend(v7, "_chsCreateWidgetRelevancePropertiesBufUsingBlock:", v28);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v9);
  return v25;
}

- (_CHSWidgetRelevancePropertiesBuf)initWithBufRef:(id)a3 cppPointer:(const WidgetRelevancePropertiesBuf *)a4
{
  id v7;
  _CHSWidgetRelevancePropertiesBuf *v8;
  _CHSWidgetRelevancePropertiesBuf *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_CHSWidgetRelevancePropertiesBuf;
  v8 = -[_CHSWidgetRelevancePropertiesBuf init](&v11, sel_init);
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
  return -[_CHSWidgetRelevancePropertiesBuf initVerifiedRootObjectFromData:requireUTF8:](self, "initVerifiedRootObjectFromData:requireUTF8:", a3, 1);
}

- (id)initVerifiedRootObjectFromData:(id)a3 requireUTF8:(BOOL)a4
{
  return -[_CHSWidgetRelevancePropertiesBuf initVerifiedRootObjectFromData:requireUTF8:maxDepth:maxTables:](self, "initVerifiedRootObjectFromData:requireUTF8:maxDepth:maxTables:", a3, a4, 64, 1000000);
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
  _CHSWidgetRelevancePropertiesBuf *v18;
  _CHSWidgetRelevancePropertiesBuf *v19;
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
  if (apple::aiml::flatbuffers2::Verifier::VerifyBufferFromStart<WidgetRelevancePropertiesBuf>((apple::aiml::flatbuffers2::Verifier *)&v21, "RECA", 0))
  {
    v15 = *v14;
    v16 = objc_alloc(MEMORY[0x1E0CFCED0]);
    v17 = (void *)objc_msgSend(v16, "initWithData:", v12, v21, v22, v23, v24, v25, v26);
    self = -[_CHSWidgetRelevancePropertiesBuf initWithBufRef:cppPointer:](self, "initWithBufRef:cppPointer:", v17, (char *)v14 + v15);

    v18 = self;
    if (a4)
    {
      if (-[_CHSWidgetRelevancePropertiesBuf verifyUTF8Fields](self, "verifyUTF8Fields"))
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
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  int v8;
  const WidgetRelevancePropertiesBuf *v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  -[_CHSWidgetRelevancePropertiesBuf relevances](self, "relevances");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = 1;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __52___CHSWidgetRelevancePropertiesBuf_verifyUTF8Fields__block_invoke;
    v11[3] = &unk_1E2A5B228;
    v11[4] = &v12;
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v11);
    v5 = *((unsigned __int8 *)v13 + 24);
    _Block_object_dispose(&v12, 8);
    if (!v5)
    {

      return 0;
    }
  }

  -[_CHSWidgetRelevancePropertiesBuf extensionIdentity](self, "extensionIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = v6;
    v8 = objc_msgSend(v6, "verifyUTF8Fields");

    if (!v8)
      return 0;
  }
  v9 = &self->_ptr[-*(int *)self->_ptr];
  if (*(unsigned __int16 *)v9->var0 >= 7u && *(_WORD *)v9[6].var0)
    return AFBIsValidUTF8();
  else
    return 1;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _BOOL4 v8;
  _BOOL4 v9;
  double v10;
  double v11;
  void *v12;
  unint64_t v13;

  v3 = (void *)MEMORY[0x194008FB8](self, a2);
  -[_CHSWidgetRelevancePropertiesBuf extensionIdentity](self, "extensionIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");

  -[_CHSWidgetRelevancePropertiesBuf kind](self, "kind");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");

  v8 = -[_CHSWidgetRelevancePropertiesBuf supportsBackgroundRefresh](self, "supportsBackgroundRefresh");
  v9 = -[_CHSWidgetRelevancePropertiesBuf isDeletion](self, "isDeletion");
  -[_CHSWidgetRelevancePropertiesBuf lastRelevanceUpdate](self, "lastRelevanceUpdate");
  v11 = v10;
  -[_CHSWidgetRelevancePropertiesBuf relevances](self, "relevances");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "hash") + 37 * ((unint64_t)v11 + 37 * (37 * (37 * (v7 + 37 * v5) + v8) + v9));

  objc_autoreleasePoolPop(v3);
  return v13;
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
  int v13;
  int v14;
  int v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  char v21;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)MEMORY[0x194008FB8]();
      -[_CHSWidgetRelevancePropertiesBuf extensionIdentity](self, "extensionIdentity");
      v8 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "extensionIdentity");
      v9 = objc_claimAutoreleasedReturnValue();
      if (v8 | v9)
      {
        v10 = objc_msgSend((id)v8, "isEqual:", v9);

        if (!v10)
          goto LABEL_14;
      }
      -[_CHSWidgetRelevancePropertiesBuf kind](self, "kind");
      v11 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "kind");
      v12 = objc_claimAutoreleasedReturnValue();
      if (v11 | v12)
      {
        v13 = objc_msgSend((id)v11, "isEqual:", v12);

        if (!v13)
          goto LABEL_14;
      }
      v14 = -[_CHSWidgetRelevancePropertiesBuf supportsBackgroundRefresh](self, "supportsBackgroundRefresh");
      if (v14 == objc_msgSend(v6, "supportsBackgroundRefresh")
        && (v15 = -[_CHSWidgetRelevancePropertiesBuf isDeletion](self, "isDeletion"),
            v15 == objc_msgSend(v6, "isDeletion"))
        && (-[_CHSWidgetRelevancePropertiesBuf lastRelevanceUpdate](self, "lastRelevanceUpdate"),
            v17 = v16,
            objc_msgSend(v6, "lastRelevanceUpdate"),
            v17 == v18))
      {
        -[_CHSWidgetRelevancePropertiesBuf relevances](self, "relevances");
        v19 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "relevances");
        v20 = objc_claimAutoreleasedReturnValue();
        if (v19 | v20)
          v21 = objc_msgSend((id)v19, "isEqual:", v20);
        else
          v21 = 1;

      }
      else
      {
LABEL_14:
        v21 = 0;
      }
      objc_autoreleasePoolPop(v7);
    }
    else
    {
      v21 = 0;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_br, 0);
}

@end
