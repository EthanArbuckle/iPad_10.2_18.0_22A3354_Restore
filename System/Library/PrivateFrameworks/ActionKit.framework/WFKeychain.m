@implementation WFKeychain

- (WFKeychain)initWithService:(id)a3
{
  return -[WFKeychain initWithService:accessGroup:](self, "initWithService:accessGroup:", a3, *MEMORY[0x24BE19960]);
}

- (WFKeychain)initWithService:(id)a3 accessGroup:(id)a4
{
  id v7;
  id v8;
  void *v9;
  WFKeychain *v10;
  uint64_t v11;
  NSString *service;
  uint64_t v13;
  NSString *accessGroup;
  WFKeychain *v15;
  void *v17;
  void *v18;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFKeychain.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("service"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFKeychain.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("accessGroup"));

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)WFKeychain;
  v10 = -[WFKeychain init](&v19, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v7, "copy");
    service = v10->_service;
    v10->_service = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    accessGroup = v10->_accessGroup;
    v10->_accessGroup = (NSString *)v13;

    v15 = v10;
  }

  return v10;
}

- (unint64_t)numberOfItems
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  const __CFDictionary *v9;
  CFIndex Count;
  CFArrayRef theArray;
  _QWORD v13[6];
  _QWORD v14[7];

  v14[6] = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BDE9220];
  v14[0] = *MEMORY[0x24BDE9230];
  v4 = *MEMORY[0x24BDE9128];
  v13[0] = v3;
  v13[1] = v4;
  -[WFKeychain service](self, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v5;
  v13[2] = *MEMORY[0x24BDE8F50];
  -[WFKeychain accessGroup](self, "accessGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x24BDE93B0];
  v13[3] = *MEMORY[0x24BDE94C0];
  v13[4] = v7;
  v8 = *MEMORY[0x24BDBD270];
  v13[5] = *MEMORY[0x24BDE9528];
  v14[2] = v6;
  v14[3] = v8;
  v14[4] = *MEMORY[0x24BDE93B8];
  v14[5] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 6);
  v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  theArray = 0;
  Count = 0;
  if (!SecItemCopyMatching(v9, (CFTypeRef *)&theArray))
  {
    Count = CFArrayGetCount(theArray);
    CFRelease(theArray);
  }

  return Count;
}

- (id)items
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const __CFDictionary *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  const __CFDictionary *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  CFTypeRef result;
  _BYTE v36[128];
  _QWORD v37[7];
  _QWORD v38[9];

  v38[7] = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BDE9220];
  v38[0] = *MEMORY[0x24BDE9230];
  v4 = *MEMORY[0x24BDE9128];
  v37[0] = v3;
  v37[1] = v4;
  -[WFKeychain service](self, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v5;
  v37[2] = *MEMORY[0x24BDE8F50];
  -[WFKeychain accessGroup](self, "accessGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x24BDE94C8];
  v8 = *MEMORY[0x24BDBD270];
  v38[2] = v6;
  v38[3] = v8;
  v9 = *MEMORY[0x24BDE94C0];
  v37[3] = v7;
  v37[4] = v9;
  v10 = *MEMORY[0x24BDE93B0];
  v11 = *MEMORY[0x24BDE93B8];
  v38[4] = v8;
  v38[5] = v11;
  v12 = *MEMORY[0x24BDE9528];
  v37[5] = v10;
  v37[6] = v12;
  v38[6] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, v37, 7);
  v13 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  result = 0;
  if (SecItemCopyMatching(v13, &result))
  {
    v14 = (void *)MEMORY[0x24BDBD1B8];
  }
  else
  {
    v30 = v13;
    v14 = (void *)objc_opt_new();
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v15 = (void *)result;
    v16 = objc_msgSend((id)result, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v32;
      v19 = *MEMORY[0x24BDE8FA8];
      v20 = *MEMORY[0x24BDE9550];
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v32 != v18)
            objc_enumerationMutation(v15);
          v22 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          objc_msgSend(v22, "objectForKeyedSubscript:", v19);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v24 = v23;
            else
              v24 = 0;
          }
          else
          {
            v24 = 0;
          }
          v25 = v24;

          objc_msgSend(v22, "objectForKeyedSubscript:", v20);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (v26)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v27 = v26;
            else
              v27 = 0;
          }
          else
          {
            v27 = 0;
          }
          v28 = v27;

          if (v25 && v28)
            objc_msgSend(v14, "setObject:forKey:", v28, v25);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v17);
    }

    v13 = v30;
  }

  return v14;
}

- (BOOL)setData:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const __CFDictionary *v18;
  void *v19;
  OSStatus v20;
  _QWORD v22[4];
  _QWORD v23[4];
  _QWORD v24[4];
  _QWORD v25[5];

  v25[4] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x24BDE9220];
  v25[0] = *MEMORY[0x24BDE9230];
  v9 = *MEMORY[0x24BDE9128];
  v24[0] = v8;
  v24[1] = v9;
  -[WFKeychain service](self, "service");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v10;
  v24[2] = *MEMORY[0x24BDE8F50];
  -[WFKeychain accessGroup](self, "accessGroup");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = *MEMORY[0x24BDE8FA8];
  v25[2] = v11;
  v25[3] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v13 = *MEMORY[0x24BDE8F60];
    v22[0] = *MEMORY[0x24BDE9550];
    v22[1] = v13;
    v14 = *MEMORY[0x24BDE8F68];
    v23[0] = v6;
    v23[1] = v14;
    v15 = *MEMORY[0x24BDBD268];
    v16 = *MEMORY[0x24BDE9528];
    v22[2] = *MEMORY[0x24BDE9140];
    v22[3] = v16;
    v17 = *MEMORY[0x24BDBD270];
    v23[2] = v15;
    v23[3] = v17;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 4);
    v18 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v12, "mutableCopy");
    objc_msgSend(v19, "addEntriesFromDictionary:", v18);
    v20 = SecItemAdd((CFDictionaryRef)v19, 0);
    if (v20 == -25299)
      v20 = SecItemUpdate((CFDictionaryRef)v12, v18);

  }
  else
  {
    v20 = SecItemDelete((CFDictionaryRef)v12);
  }

  return v20 == 0;
}

- (id)dataForKey:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const __CFDictionary *v14;
  void *v15;
  CFTypeRef v17;
  _QWORD v18[7];
  _QWORD v19[4];
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = *MEMORY[0x24BDE9220];
  v19[0] = *MEMORY[0x24BDE9230];
  v5 = *MEMORY[0x24BDE9128];
  v18[0] = v4;
  v18[1] = v5;
  v6 = a3;
  -[WFKeychain service](self, "service");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v7;
  v18[2] = *MEMORY[0x24BDE8F50];
  -[WFKeychain accessGroup](self, "accessGroup");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x24BDE8FA8];
  v19[2] = v8;
  v19[3] = v6;
  v10 = *MEMORY[0x24BDE94C8];
  v18[3] = v9;
  v18[4] = v10;
  v11 = *MEMORY[0x24BDE93B0];
  v12 = *MEMORY[0x24BDE93C0];
  v20 = *MEMORY[0x24BDBD270];
  v21 = v12;
  v13 = *MEMORY[0x24BDE9528];
  v18[5] = v11;
  v18[6] = v13;
  v22 = v20;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 7);
  v14 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  v17 = 0;
  if (SecItemCopyMatching(v14, &v17))
    v15 = 0;
  else
    v15 = (void *)v17;

  return v15;
}

- (NSString)service
{
  return self->_service;
}

- (NSString)accessGroup
{
  return self->_accessGroup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessGroup, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

@end
