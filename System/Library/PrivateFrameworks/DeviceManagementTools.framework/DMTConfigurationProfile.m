@implementation DMTConfigurationProfile

+ (id)configurationProfileWithData:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  CFTypeID v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;

  v6 = a3;
  v7 = v6;
  if (!v6)
  {
    if (a4)
    {
      v15 = &unk_24E5A9C50;
      v16 = 70;
LABEL_12:
      DMTErrorWithCodeAndUserInfo(v16, v15);
      v14 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
LABEL_13:
    v14 = 0;
    goto LABEL_16;
  }
  v8 = CFGetTypeID(v6);
  if (v8 != CFDataGetTypeID())
  {
    if (a4)
    {
      v15 = &unk_24E5A9C78;
      v16 = 71;
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  ExtractSignedData(v7);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (void *)v9;
  else
    v11 = v7;
  v12 = v11;

  objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v12, 0, 0, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(a1, "configurationProfileWithDictionary:error:", v13, a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

LABEL_16:
  return v14;
}

+ (id)configurationProfileWithDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  CFTypeID v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v6 = a3;
  v7 = v6;
  if (!v6)
  {
    if (a4)
    {
      v10 = &unk_24E5A9CA0;
      v11 = 70;
LABEL_8:
      DMTErrorWithCodeAndUserInfo(v11, v10);
      v9 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
LABEL_9:
    v9 = 0;
    goto LABEL_10;
  }
  v8 = CFGetTypeID(v6);
  if (v8 != CFDictionaryGetTypeID())
  {
    if (a4)
    {
      v10 = &unk_24E5A9CC8;
      v11 = 71;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDictionary:error:", v7, a4);
LABEL_10:

  return v9;
}

- (NSDictionary)payloadsByType
{
  NSDictionary *payloadsByType;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSDictionary *v16;
  NSDictionary *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  payloadsByType = self->_payloadsByType;
  if (!payloadsByType)
  {
    -[DMTConfigurationProfile payloads](self, "payloads");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_opt_new();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v20 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v11, "type");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v13;
          if (v13)
          {
            objc_msgSend(v13, "addObject:", v11);
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", v11);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, v12);

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v8);
    }

    v16 = (NSDictionary *)objc_msgSend(v5, "copy");
    v17 = self->_payloadsByType;
    self->_payloadsByType = v16;

    payloadsByType = self->_payloadsByType;
  }
  return payloadsByType;
}

- (NSDictionary)payloadsByUUID
{
  NSDictionary *payloadsByUUID;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  NSDictionary *v13;
  NSDictionary *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  payloadsByUUID = self->_payloadsByUUID;
  if (!payloadsByUUID)
  {
    -[DMTConfigurationProfile payloads](self, "payloads");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v11, "uuid", (_QWORD)v16);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, v12);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v8);
    }

    v13 = (NSDictionary *)objc_msgSend(v5, "copy");
    v14 = self->_payloadsByUUID;
    self->_payloadsByUUID = v13;

    payloadsByUUID = self->_payloadsByUUID;
  }
  return payloadsByUUID;
}

- (id)payloadsOfType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[DMTConfigurationProfile payloads](self, "payloads", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v11, "type");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v4);

        if (v13)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)payloadsOfTypes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[DMTConfigurationProfile payloads](self, "payloads", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v11, "type");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v4, "containsObject:", v12);

        if (v13)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (BOOL)validateWithValidators:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = a3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "validateProfile:error:", self, a4, (_QWORD)v13))
        {
          v11 = 0;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
        continue;
      break;
    }
  }
  v11 = 1;
LABEL_11:

  return v11;
}

- (DMTConfigurationProfile)initWithDictionary:(id)a3 error:(id *)a4
{
  id v6;
  DMTConfigurationProfile *v7;
  DMTConfigurationProfile *v8;
  void *v9;
  char v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSArray *payloads;
  DMTConfigurationProfile *v23;
  uint64_t v24;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  _BYTE v32[128];
  const __CFString *v33;
  const __CFString *v34;
  _QWORD v35[2];
  _QWORD v36[4];

  v36[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v31.receiver = self;
  v31.super_class = (Class)DMTConfigurationProfile;
  v7 = -[DMTConfigurationPrimitive initWithDictionary:error:](&v31, sel_initWithDictionary_error_, v6, a4);
  v8 = v7;
  if (v7)
  {
    -[DMTConfigurationPrimitive type](v7, "type");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("Configuration"));

    if ((v10 & 1) != 0)
    {
      DMTValidateProfileArray(v6, CFSTR("PayloadContent"), 0, a4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (!v11)
        goto LABEL_23;
      v13 = objc_msgSend(v11, "count");
      if (v13)
      {
        objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v12 = v12;
        v15 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
        if (v15)
        {
          v16 = v15;
          v26 = v6;
          v17 = 0;
          v18 = *(_QWORD *)v28;
          while (2)
          {
            v19 = 0;
            v20 = v17;
            do
            {
              if (*(_QWORD *)v28 != v18)
                objc_enumerationMutation(v12);
              +[DMTConfigurationPayloadBase concretePayloadWithDictionary:error:](DMTConfigurationPayloadBase, "concretePayloadWithDictionary:error:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v19), a4);
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v17)
              {

                v23 = 0;
                v6 = v26;
                goto LABEL_20;
              }
              objc_msgSend(v14, "addObject:", v17);
              ++v19;
              v20 = v17;
            }
            while (v16 != v19);
            v16 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
            if (v16)
              continue;
            break;
          }

          v6 = v26;
        }

        v21 = objc_msgSend(v14, "copy");
        payloads = v8->_payloads;
        v8->_payloads = (NSArray *)v21;

        v23 = v8;
        goto LABEL_20;
      }
      if (!a4)
      {
LABEL_23:
        v23 = 0;
        goto LABEL_24;
      }
      v33 = CFSTR("kDMTInvalidConfigurationProfileValueErrorKey");
      v34 = CFSTR("PayloadContent");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 74;
LABEL_17:
      DMTErrorWithCodeAndUserInfo(v24, v14);
      v23 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_20:

LABEL_24:
      goto LABEL_25;
    }
    if (a4)
    {
      v35[1] = CFSTR("PayloadType");
      v36[0] = CFSTR("PayloadType");
      v35[0] = CFSTR("kDMTInvalidConfigurationProfileValueErrorKey");
      -[DMTConfigurationPrimitive type](v8, "type");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      v36[1] = v12;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 72;
      goto LABEL_17;
    }
  }
  v23 = 0;
LABEL_25:

  return v23;
}

- (NSArray)payloads
{
  return self->_payloads;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadsByUUID, 0);
  objc_storeStrong((id *)&self->_payloadsByType, 0);
  objc_storeStrong((id *)&self->_payloads, 0);
}

@end
