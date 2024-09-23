@implementation IDSSocketPairHandshake

- (IDSSocketPairHandshake)initWithCommand:(unsigned __int8)a3 underlyingData:(id)a4
{
  uint64_t v4;
  id v6;
  const char *v7;
  IDSSocketPairHandshake *v8;
  double v9;
  unsigned int v11;
  objc_super v12;

  v4 = a3;
  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IDSSocketPairHandshake;
  v8 = -[IDSSocketPairMessage initWithCommand:underlyingData:](&v12, sel_initWithCommand_underlyingData_, v4, v6);
  if (v8)
  {
    v11 = -1431655766;
    objc_msgSend_getBytes_range_(v6, v7, (uint64_t)&v11, v9, 0, 4);
    *(_DWORD *)(&v8->super._wasWrittenToConnection + 2) = bswap32(v11);
  }

  return v8;
}

- (IDSSocketPairHandshake)initWithVersionNumber:(unsigned int)a3
{
  IDSSocketPairHandshake *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IDSSocketPairHandshake;
  result = -[IDSSocketPairHandshake init](&v5, sel_init);
  if (result)
    *(_DWORD *)(&result->super._wasWrittenToConnection + 2) = a3;
  return result;
}

- (unsigned)command
{
  return 4;
}

- (id)_nonHeaderData
{
  uint64_t v2;
  double v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  double v8;
  const char *v9;
  double v10;
  unsigned int v12;

  objc_msgSend_data(MEMORY[0x1E0C99DF0], a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = bswap32(objc_msgSend_versionNumber(self, v6, v7, v8));
  objc_msgSend_appendBytes_length_(v5, v9, (uint64_t)&v12, v10, 4);
  return v5;
}

- (unsigned)versionNumber
{
  return *(_DWORD *)(&self->super._wasWrittenToConnection + 2);
}

@end
