@implementation NSUUID(IconFoundationAdditions)

+ (id)_IF_nullUUID
{
  if (_IF_nullUUID_onceToken != -1)
    dispatch_once(&_IF_nullUUID_onceToken, &__block_literal_global_10);
  return (id)_IF_nullUUID_nullUUID;
}

+ (uint64_t)_IF_UUIDWithData:()IconFoundationAdditions
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;

  v3 = (void *)MEMORY[0x1E0CB3A28];
  v4 = objc_retainAutorelease(a3);
  v5 = objc_msgSend(v4, "bytes");
  v6 = objc_msgSend(v4, "length");

  return objc_msgSend(v3, "_IF_UUIDWithBytes:size:", v5, v6);
}

+ (id)_IF_UUIDWithString:()IconFoundationAdditions
{
  id v3;
  void *v4;
  const char *v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (!v3
    || (v5 = (const char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String")) == 0
    || (objc_msgSend(MEMORY[0x1E0CB3A28], "_IF_UUIDWithBytes:size:", v5, strlen(v5)),
        (v6 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "_IF_nullUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

+ (id)_IF_UUIDWithBytes:()IconFoundationAdditions size:
{
  unsigned __int8 v5[32];
  unsigned __int8 uu[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  memset(uu, 0, 16);
  if (data && len)
  {
    CC_SHA256(data, len, v5);
    *(_OWORD *)uu = *(_OWORD *)v5;
    uu[6] = v5[6] & 0xF | 0x30;
    uu[8] = v5[8] & 0x3F | 0x80;
  }
  else
  {
    uuid_clear(uu);
  }
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", uu);
}

- (uint64_t)_IF_getUUIDBytes:()IconFoundationAdditions hash64:
{
  uint64_t result;

  if (!a3)
    -[NSUUID(IconFoundationAdditions) _IF_getUUIDBytes:hash64:].cold.1();
  result = objc_msgSend(a1, "getUUIDBytes:");
  if (a4)
    *a4 = a3[1] ^ *a3;
  return result;
}

+ (id)_IF_UUIDWithInt64:()IconFoundationAdditions
{
  uint64_t v4;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3A28], "_IF_UUIDWithBytes:size:", &v4, 8);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_IF_UUIDWithDouble:()IconFoundationAdditions
{
  double v2;

  v2 = a1;
  objc_msgSend(MEMORY[0x1E0CB3A28], "_IF_UUIDWithBytes:size:", &v2, 8);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_IF_UUIDWithOSType:()IconFoundationAdditions
{
  int v4;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3A28], "_IF_UUIDWithBytes:size:", &v4, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_IF_UUIDByXORingUUIDs:()IconFoundationAdditions
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  int8x16_t v16;
  unsigned __int8 v17[128];
  uuid_t uu;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  memset(uu, 0, sizeof(uu));
  uuid_clear(uu);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v8);
        v16 = 0uLL;
        objc_msgSend(v9, "getUUIDBytes:", &v16, (_QWORD)v12);
        *(int8x16_t *)uu = veorq_s8(*(int8x16_t *)uu, v16);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v6);
  }

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", uu);
  return v10;
}

- (void)_IF_getUUIDBytes:()IconFoundationAdditions hash64:.cold.1()
{
  __assert_rtn("-[NSUUID(IconFoundationAdditions) _IF_getUUIDBytes:hash64:]", "NSUUID+IconFoundationAdditions.m", 83, "UUIDBytes");
}

@end
