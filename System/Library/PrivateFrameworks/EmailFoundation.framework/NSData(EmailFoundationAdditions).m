@implementation NSData(EmailFoundationAdditions)

- (id)ef_md5Digest
{
  _QWORD v3[5];
  CC_MD5_CTX c;
  unsigned __int8 md[8];
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  memset(&c, 0, sizeof(c));
  CC_MD5_Init(&c);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __48__NSData_EmailFoundationAdditions__ef_md5Digest__block_invoke;
  v3[3] = &__block_descriptor_40_e29_v40__0r_v8__NSRange_QQ_16_B32l;
  v3[4] = &c;
  objc_msgSend(a1, "enumerateByteRangesUsingBlock:", v3);
  *(_QWORD *)md = 0;
  v6 = 0;
  CC_MD5_Final(md, &c);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", md, 16);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (uint64_t)ef_sha256Digest
{
  return objc_msgSend(a1, "ef_sha256DigestWithSalts:", MEMORY[0x1E0C9AA60]);
}

- (id)ef_sha256DigestWithSalts:()EmailFoundationAdditions
{
  id v4;
  __int128 v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  id v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  CC_SHA256_CTX c;
  unsigned __int8 v20[128];
  unsigned __int8 md[16];
  __int128 v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)md = v5;
  v22 = v5;
  *(_QWORD *)&c.wbuf[14] = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&c.wbuf[6] = v5;
  *(_OWORD *)&c.wbuf[10] = v5;
  *(_OWORD *)&c.hash[6] = v5;
  *(_OWORD *)&c.wbuf[2] = v5;
  *(_OWORD *)c.count = v5;
  *(_OWORD *)&c.hash[2] = v5;
  CC_SHA256_Init(&c);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v10, "length", (_QWORD)v15))
        {
          v11 = objc_retainAutorelease(v10);
          CC_SHA256_Update(&c, (const void *)objc_msgSend(v11, "bytes"), objc_msgSend(v11, "length"));
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    }
    while (v7);
  }

  v12 = objc_retainAutorelease(a1);
  CC_SHA256_Update(&c, (const void *)objc_msgSend(v12, "bytes"), objc_msgSend(v12, "length"));
  CC_SHA256_Final(md, &c);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", md, 32);

  return v13;
}

- (id)ef_hexString
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  unsigned __int8 *v5;
  unsigned int v6;

  v2 = objc_msgSend(a1, "length");
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 2 * v2);
  v4 = objc_msgSend(objc_retainAutorelease(a1), "bytes");
  if (v2)
  {
    v5 = (unsigned __int8 *)v4;
    do
    {
      v6 = *v5++;
      objc_msgSend(v3, "appendFormat:", CFSTR("%02X"), v6);
      --v2;
    }
    while (v2);
  }
  return v3;
}

+ (id)ef_crlfData
{
  if (ef_crlfData_onceToken != -1)
    dispatch_once(&ef_crlfData_onceToken, &__block_literal_global_14);
  return (id)ef_crlfData_crlfData;
}

- (uint64_t)ef_subdataFromIndex:()EmailFoundationAdditions
{
  return objc_msgSend(a1, "subdataWithRange:", a3, objc_msgSend(a1, "length") - a3);
}

- (uint64_t)ef_subdataToIndex:()EmailFoundationAdditions
{
  return objc_msgSend(a1, "subdataWithRange:", 0, a3);
}

- (void)ef_enumerateSubdataOfSize:()EmailFoundationAdditions usingBlock:
{
  void (**v6)(id, void *, _BYTE *);
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  int v12;
  unsigned __int8 v13;

  v6 = a4;
  v7 = 0;
  v8 = 0;
  v13 = 0;
  do
  {
    if (v8 >= objc_msgSend(a1, "length"))
      break;
    v9 = objc_msgSend(a1, "length");
    v10 = v7 + v9 >= a3 ? a3 : v7 + v9;
    objc_msgSend(a1, "subdataWithRange:", v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v11, &v13);
    v12 = v13;

    v8 += a3;
    v7 -= a3;
  }
  while (!v12);

}

- (uint64_t)ef_rangeOfData:()EmailFoundationAdditions
{
  return objc_msgSend(a1, "ef_rangeOfData:options:", a3, 0);
}

- (uint64_t)ef_rangeOfData:()EmailFoundationAdditions options:
{
  id v6;
  uint64_t v7;

  v6 = a3;
  v7 = objc_msgSend(a1, "rangeOfData:options:range:", v6, a4, 0, objc_msgSend(a1, "length"));

  return v7;
}

- (uint64_t)ef_hasSuffix:()EmailFoundationAdditions
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = objc_msgSend(a1, "length");
  if (v5 >= objc_msgSend(v4, "length"))
  {
    objc_msgSend(a1, "subdataWithRange:", objc_msgSend(a1, "length") - objc_msgSend(v4, "length"), objc_msgSend(v4, "length"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "isEqualToData:", v4);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)ef_containsData:()EmailFoundationAdditions
{
  id v4;
  uint64_t v5;
  _BOOL8 v6;

  v4 = a3;
  objc_msgSend(a1, "ef_rangeOfData:", v4);
  v6 = v5 == objc_msgSend(v4, "length");

  return v6;
}

@end
