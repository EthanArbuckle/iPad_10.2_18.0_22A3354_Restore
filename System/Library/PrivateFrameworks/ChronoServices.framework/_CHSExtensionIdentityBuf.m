@implementation _CHSExtensionIdentityBuf

- (NSString)tokenString
{
  const ExtensionIdentityBuf *ptr;
  const ExtensionIdentityBuf *v3;
  uint64_t v4;
  const ExtensionIdentityBuf *v6;
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

- (const)tokenStringAsCString
{
  const ExtensionIdentityBuf *ptr;
  const ExtensionIdentityBuf *v3;
  uint64_t v4;

  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 5u && (v4 = *(unsigned __int16 *)v3[4].var0) != 0)
    return (const char *)&ptr[v4 + 4 + *(unsigned int *)ptr[v4].var0];
  else
    return 0;
}

- (NSData)tokenStringAsData
{
  const ExtensionIdentityBuf *ptr;
  const ExtensionIdentityBuf *v3;
  uint64_t v4;
  const ExtensionIdentityBuf *v6;
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

- (NSString)extensionBundleIdentifier
{
  const ExtensionIdentityBuf *ptr;
  const ExtensionIdentityBuf *v3;
  uint64_t v4;
  const ExtensionIdentityBuf *v6;
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

- (const)extensionBundleIdentifierAsCString
{
  const ExtensionIdentityBuf *ptr;
  const ExtensionIdentityBuf *v3;
  uint64_t v4;

  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 7u && (v4 = *(unsigned __int16 *)v3[6].var0) != 0)
    return (const char *)&ptr[v4 + 4 + *(unsigned int *)ptr[v4].var0];
  else
    return 0;
}

- (NSData)extensionBundleIdentifierAsData
{
  const ExtensionIdentityBuf *ptr;
  const ExtensionIdentityBuf *v3;
  uint64_t v4;
  const ExtensionIdentityBuf *v6;
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

- (NSString)containerBundleIdentifier
{
  const ExtensionIdentityBuf *ptr;
  const ExtensionIdentityBuf *v3;
  uint64_t v4;
  const ExtensionIdentityBuf *v6;
  NSString *v7;
  void *v8;

  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 9u && (v4 = *(unsigned __int16 *)v3[8].var0) != 0)
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

- (const)containerBundleIdentifierAsCString
{
  const ExtensionIdentityBuf *ptr;
  const ExtensionIdentityBuf *v3;
  uint64_t v4;

  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 9u && (v4 = *(unsigned __int16 *)v3[8].var0) != 0)
    return (const char *)&ptr[v4 + 4 + *(unsigned int *)ptr[v4].var0];
  else
    return 0;
}

- (NSData)containerBundleIdentifierAsData
{
  const ExtensionIdentityBuf *ptr;
  const ExtensionIdentityBuf *v3;
  uint64_t v4;
  const ExtensionIdentityBuf *v6;
  uint64_t v7;
  void *v8;
  id v9;
  unsigned int *var0;
  uint64_t v11;
  void *v12;
  void *v13;

  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 9u && (v4 = *(unsigned __int16 *)v3[8].var0) != 0)
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

- (NSString)deviceIdentifier
{
  const ExtensionIdentityBuf *ptr;
  const ExtensionIdentityBuf *v3;
  uint64_t v4;
  const ExtensionIdentityBuf *v6;
  NSString *v7;
  void *v8;

  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0xBu && (v4 = *(unsigned __int16 *)v3[10].var0) != 0)
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

- (const)deviceIdentifierAsCString
{
  const ExtensionIdentityBuf *ptr;
  const ExtensionIdentityBuf *v3;
  uint64_t v4;

  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0xBu && (v4 = *(unsigned __int16 *)v3[10].var0) != 0)
    return (const char *)&ptr[v4 + 4 + *(unsigned int *)ptr[v4].var0];
  else
    return 0;
}

- (NSData)deviceIdentifierAsData
{
  const ExtensionIdentityBuf *ptr;
  const ExtensionIdentityBuf *v3;
  uint64_t v4;
  const ExtensionIdentityBuf *v6;
  uint64_t v7;
  void *v8;
  id v9;
  unsigned int *var0;
  uint64_t v11;
  void *v12;
  void *v13;

  ptr = self->_ptr;
  v3 = &ptr[-*(int *)ptr->var0];
  if (*(unsigned __int16 *)v3->var0 >= 0xBu && (v4 = *(unsigned __int16 *)v3[10].var0) != 0)
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

- (id)deepCopyUsingBufferBuilder:(id)a3
{
  -[_CHSExtensionIdentityBuf deepCopyUsingBufferBuilder:changes:](self, "deepCopyUsingBufferBuilder:changes:", a3, 0);
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
  const char *v14;
  void *v15;
  void *v16;
  const char *v17;
  void *v18;
  void *v19;
  const char *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_CHSRelevanceCache_generated.mm"), 670, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bufferBuilder"));

  }
  v9 = (void *)MEMORY[0x194008FB8]();
  if (!v8)
  {
LABEL_6:
    v10 = (void *)MEMORY[0x194008FB8]();
    v11 = -[_CHSExtensionIdentityBuf tokenStringAsCString](objc_retainAutorelease(self), "tokenStringAsCString");
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
  v13 = (void *)MEMORY[0x194008FB8]();
  v14 = -[_CHSExtensionIdentityBuf extensionBundleIdentifierAsCString](objc_retainAutorelease(self), "extensionBundleIdentifierAsCString");
  if (v14)
  {
    objc_msgSend(v7, "createStringWithCString:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
  objc_autoreleasePoolPop(v13);
  if (!v8)
  {
LABEL_23:
    v16 = (void *)MEMORY[0x194008FB8]();
    v17 = -[_CHSExtensionIdentityBuf containerBundleIdentifierAsCString](objc_retainAutorelease(self), "containerBundleIdentifierAsCString");
    if (v17)
    {
      objc_msgSend(v7, "createStringWithCString:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = 0;
    }
    objc_autoreleasePoolPop(v16);
    if (!v8)
      goto LABEL_31;
    goto LABEL_29;
  }
LABEL_21:
  if (v8[24] == 1)
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", *((unsigned int *)v8 + 7));
  }
  else
  {
    if (!v8[24])
      goto LABEL_23;
    v18 = 0;
  }
LABEL_29:
  if (v8[32] == 1)
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", *((unsigned int *)v8 + 9));
    goto LABEL_37;
  }
  if (v8[32])
  {
    v21 = 0;
    goto LABEL_37;
  }
LABEL_31:
  v19 = (void *)MEMORY[0x194008FB8]();
  v20 = -[_CHSExtensionIdentityBuf deviceIdentifierAsCString](objc_retainAutorelease(self), "deviceIdentifierAsCString");
  if (v20)
  {
    objc_msgSend(v7, "createStringWithCString:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = 0;
  }
  objc_autoreleasePoolPop(v19);
LABEL_37:
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __63___CHSExtensionIdentityBuf_deepCopyUsingBufferBuilder_changes___block_invoke;
  v29[3] = &unk_1E2A5B1B0;
  v22 = v12;
  v30 = v22;
  v23 = v15;
  v31 = v23;
  v24 = v18;
  v32 = v24;
  v33 = v21;
  v25 = v21;
  objc_msgSend(v7, "_chsCreateExtensionIdentityBufUsingBlock:", v29);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v9);
  return v26;
}

- (_CHSExtensionIdentityBuf)initWithBufRef:(id)a3 cppPointer:(const ExtensionIdentityBuf *)a4
{
  id v7;
  _CHSExtensionIdentityBuf *v8;
  _CHSExtensionIdentityBuf *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_CHSExtensionIdentityBuf;
  v8 = -[_CHSExtensionIdentityBuf init](&v11, sel_init);
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
  return -[_CHSExtensionIdentityBuf initVerifiedRootObjectFromData:requireUTF8:](self, "initVerifiedRootObjectFromData:requireUTF8:", a3, 1);
}

- (id)initVerifiedRootObjectFromData:(id)a3 requireUTF8:(BOOL)a4
{
  return -[_CHSExtensionIdentityBuf initVerifiedRootObjectFromData:requireUTF8:maxDepth:maxTables:](self, "initVerifiedRootObjectFromData:requireUTF8:maxDepth:maxTables:", a3, a4, 64, 1000000);
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
  _CHSExtensionIdentityBuf *v18;
  _CHSExtensionIdentityBuf *v19;
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
  if (apple::aiml::flatbuffers2::Verifier::VerifyBufferFromStart<ExtensionIdentityBuf>((apple::aiml::flatbuffers2::Verifier *)&v21, "RECA", 0))
  {
    v15 = *v14;
    v16 = objc_alloc(MEMORY[0x1E0CFCED0]);
    v17 = (void *)objc_msgSend(v16, "initWithData:", v12, v21, v22, v23, v24, v25, v26);
    self = -[_CHSExtensionIdentityBuf initWithBufRef:cppPointer:](self, "initWithBufRef:cppPointer:", v17, (char *)v14 + v15);

    v18 = self;
    if (a4)
    {
      if (-[_CHSExtensionIdentityBuf verifyUTF8Fields](self, "verifyUTF8Fields"))
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
  const ExtensionIdentityBuf *ptr;
  uint64_t v4;
  uint64_t v5;
  const ExtensionIdentityBuf *v6;
  int valid;
  const ExtensionIdentityBuf *v8;

  ptr = self->_ptr;
  v4 = *(int *)ptr->var0;
  v5 = -v4;
  v6 = &ptr[-v4];
  if (*(unsigned __int16 *)v6->var0 >= 5u && *(_WORD *)v6[4].var0)
  {
    valid = AFBIsValidUTF8();
    if (!valid)
      return valid;
    ptr = self->_ptr;
    v5 = -(uint64_t)*(int *)ptr->var0;
  }
  if (*(unsigned __int16 *)ptr[v5].var0 >= 7u && *(_WORD *)ptr[v5 + 6].var0)
  {
    valid = AFBIsValidUTF8();
    if (!valid)
      return valid;
    ptr = self->_ptr;
    v5 = -(uint64_t)*(int *)ptr->var0;
  }
  if (*(unsigned __int16 *)ptr[v5].var0 >= 9u && *(_WORD *)ptr[v5 + 8].var0)
  {
    valid = AFBIsValidUTF8();
    if (!valid)
      return valid;
    ptr = self->_ptr;
    v5 = -(uint64_t)*(int *)ptr->var0;
  }
  v8 = &ptr[v5];
  if (*(unsigned __int16 *)v8->var0 >= 0xBu && *(_WORD *)v8[10].var0)
    LOBYTE(valid) = AFBIsValidUTF8();
  else
    LOBYTE(valid) = 1;
  return valid;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;

  v3 = (void *)MEMORY[0x194008FB8](self, a2);
  -[_CHSExtensionIdentityBuf tokenString](self, "tokenString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");

  -[_CHSExtensionIdentityBuf extensionBundleIdentifier](self, "extensionBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");

  -[_CHSExtensionIdentityBuf containerBundleIdentifier](self, "containerBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash");

  -[_CHSExtensionIdentityBuf deviceIdentifier](self, "deviceIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash") + 37 * (v9 + 37 * (v7 + 37 * v5));

  objc_autoreleasePoolPop(v3);
  return v11;
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
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  char v19;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)MEMORY[0x194008FB8]();
      -[_CHSExtensionIdentityBuf tokenString](self, "tokenString");
      v8 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "tokenString");
      v9 = objc_claimAutoreleasedReturnValue();
      if (v8 | v9)
      {
        v10 = objc_msgSend((id)v8, "isEqual:", v9);

        if (!v10)
          goto LABEL_13;
      }
      -[_CHSExtensionIdentityBuf extensionBundleIdentifier](self, "extensionBundleIdentifier");
      v11 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "extensionBundleIdentifier");
      v12 = objc_claimAutoreleasedReturnValue();
      if (v11 | v12)
      {
        v13 = objc_msgSend((id)v11, "isEqual:", v12);

        if (!v13)
          goto LABEL_13;
      }
      -[_CHSExtensionIdentityBuf containerBundleIdentifier](self, "containerBundleIdentifier");
      v14 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "containerBundleIdentifier");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v14 | v15
        && (v16 = objc_msgSend((id)v14, "isEqual:", v15), (id)v15, (id)v14, !v16))
      {
LABEL_13:
        v19 = 0;
      }
      else
      {
        -[_CHSExtensionIdentityBuf deviceIdentifier](self, "deviceIdentifier");
        v17 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "deviceIdentifier");
        v18 = objc_claimAutoreleasedReturnValue();
        if (v17 | v18)
          v19 = objc_msgSend((id)v17, "isEqual:", v18);
        else
          v19 = 1;

      }
      objc_autoreleasePoolPop(v7);
    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_br, 0);
}

@end
