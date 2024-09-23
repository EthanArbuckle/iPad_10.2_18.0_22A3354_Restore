@implementation HMDMediaPropertyWriteRequest

- (HMDMediaPropertyWriteRequest)initWithProperty:(id)a3 value:(id)a4 mediaProfile:(id)a5 identifier:(id)a6
{
  id v11;
  id v12;
  HMDMediaPropertyWriteRequest *v13;
  HMDMediaPropertyWriteRequest *v14;
  objc_super v16;

  v11 = a4;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)HMDMediaPropertyWriteRequest;
  v13 = -[HMDMediaPropertyRequest initWithProperty:mediaProfile:](&v16, sel_initWithProperty_mediaProfile_, a3, a5);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong(&v13->_value, a4);
    objc_storeStrong((id *)&v14->_identifier, a6);
  }

  return v14;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HMDMediaPropertyRequest mediaProfile](self, "mediaProfile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaPropertyRequest property](self, "property");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaPropertyWriteRequest value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<MPWR: %@/%@ (val: %@)>"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)value
{
  return self->_value;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_value, 0);
}

+ (id)requestWithProperty:(id)a3 mediaProfile:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x227676638]();
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543362;
    v12 = v9;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Write request cannot be initialized using this interface - use -[writeRequestWithProperty:value:medaPofile:]", (uint8_t *)&v11, 0xCu);

  }
  objc_autoreleasePoolPop(v7);

  return 0;
}

+ (id)writeRequestWithProperty:(id)a3 value:(id)a4 mediaProfile:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProperty:value:mediaProfile:identifier:", v10, v9, v8, 0);

  return v11;
}

+ (id)writeRequestWithProperty:(id)a3 value:(id)a4 mediaProfile:(id)a5 identifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProperty:value:mediaProfile:identifier:", v13, v12, v11, v10);

  return v14;
}

+ (id)serializeWriteRequests:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v10, "mediaProfile", (_QWORD)v19);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "uniqueIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "UUIDString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v14)
        {
          objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, v13);
        }
        objc_msgSend(v10, "value");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "property");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, v16);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }

  v17 = (void *)objc_msgSend(v4, "copy");
  return v17;
}

+ (id)deserializeWriteRequests:(id)a3 mediaProfile:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v5, "allKeys", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[HMDMediaPropertyWriteRequest writeRequestWithProperty:value:mediaProfile:](HMDMediaPropertyWriteRequest, "writeRequestWithProperty:value:mediaProfile:", v13, v14, v6);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
          objc_msgSend(v7, "addObject:", v15);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  v16 = (void *)objc_msgSend(v7, "copy");
  return v16;
}

@end
