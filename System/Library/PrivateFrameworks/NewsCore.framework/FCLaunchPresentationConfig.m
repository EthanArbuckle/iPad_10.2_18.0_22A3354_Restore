@implementation FCLaunchPresentationConfig

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentationOperations, 0);
}

- (FCLaunchPresentationConfig)initWithConfigDictionary:(id)a3
{
  id v4;
  FCLaunchPresentationConfig *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  FCPresentationOperation *v14;
  FCPresentationOperation *v15;
  uint64_t v16;
  NSArray *presentationOperations;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)FCLaunchPresentationConfig;
  v5 = -[FCLaunchPresentationConfig init](&v23, sel_init);
  if (v5)
  {
    v5->_configVersion = FCAppConfigurationIntegerValue(v4, (uint64_t)CFSTR("configVersion"), 0);
    FCAppConfigurationArrayValueWithDefaultValue(v4, (uint64_t)CFSTR("presentationOperations"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v20;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v12);
          v14 = [FCPresentationOperation alloc];
          v15 = -[FCPresentationOperation initWithConfigDictionary:](v14, "initWithConfigDictionary:", v13, (_QWORD)v19);
          objc_msgSend(v7, "addObject:", v15);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v10);
    }

    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v7);
    v16 = objc_claimAutoreleasedReturnValue();
    presentationOperations = v5->_presentationOperations;
    v5->_presentationOperations = (NSArray *)v16;

  }
  return v5;
}

- (int64_t)configVersion
{
  return self->_configVersion;
}

- (void)setConfigVersion:(int64_t)a3
{
  self->_configVersion = a3;
}

- (NSArray)presentationOperations
{
  return self->_presentationOperations;
}

- (void)setPresentationOperations:(id)a3
{
  objc_storeStrong((id *)&self->_presentationOperations, a3);
}

@end
