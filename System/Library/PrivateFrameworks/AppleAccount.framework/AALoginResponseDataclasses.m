@implementation AALoginResponseDataclasses

- (AALoginResponseDataclasses)initWithiCloudServiceData:(id)a3
{
  id v4;
  AALoginResponseDataclasses *v5;
  uint64_t v6;
  NSArray *provisionedDataclasses;
  NSDictionary *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  NSDictionary *dataclassProperties;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)AALoginResponseDataclasses;
  v5 = -[AALoginResponseDataclasses init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("availableFeatures"));
    v6 = objc_claimAutoreleasedReturnValue();
    provisionedDataclasses = v5->_provisionedDataclasses;
    v5->_provisionedDataclasses = (NSArray *)v6;

    v8 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(v4, "allKeys", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          if (objc_msgSend(v14, "hasPrefix:", CFSTR("com.apple.Dataclass")))
          {
            objc_msgSend(v4, "objectForKey:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (v15)
              -[NSDictionary setObject:forKey:](v8, "setObject:forKey:", v15, v14);

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v11);
    }

    dataclassProperties = v5->_dataclassProperties;
    v5->_dataclassProperties = v8;

  }
  return v5;
}

- (NSArray)provisionedDataclasses
{
  return self->_provisionedDataclasses;
}

- (NSDictionary)dataclassProperties
{
  return self->_dataclassProperties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataclassProperties, 0);
  objc_storeStrong((id *)&self->_provisionedDataclasses, 0);
}

@end
