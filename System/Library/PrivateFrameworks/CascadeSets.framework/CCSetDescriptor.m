@implementation CCSetDescriptor

+ (id)sourceIdentifierWithValue:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithKey:value:error:", CFSTR("sourceIdentifier"), v6, a4);

  return v7;
}

+ (id)localeIdentifierWithValue:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithKey:value:error:", CFSTR("localeIdentifier"), v6, a4);

  return v7;
}

+ (id)accountIdentifierFromAccount:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = objc_alloc((Class)a1);
  objc_msgSend(v6, "accountIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v7, "initWithKey:value:error:", CFSTR("accountIdentifier"), v8, a4);
  return v9;
}

+ (id)setDescriptorsFromResourceDescriptors:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  CCSetDescriptor *v13;
  void *v14;
  CCSetDescriptor *v15;
  id v16;
  BOOL v17;
  void *v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void *)objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v11);
        v13 = [CCSetDescriptor alloc];
        objc_msgSend(v12, "encodedString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 0;
        v15 = -[BMResourceDescriptor initWithEncodedString:error:](v13, "initWithEncodedString:error:", v14, &v20);
        v16 = v20;

        if (v15)
          v17 = v16 == 0;
        else
          v17 = 0;
        if (!v17)
        {
          CCSetError(a4, v16);

          v18 = 0;
          goto LABEL_14;
        }
        objc_msgSend(v6, "addObject:", v15);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v9);
  }

  v18 = (void *)objc_msgSend(v6, "copy");
LABEL_14:

  return v18;
}

@end
