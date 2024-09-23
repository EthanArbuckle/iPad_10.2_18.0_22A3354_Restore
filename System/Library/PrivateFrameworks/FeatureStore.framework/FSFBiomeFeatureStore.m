@implementation FSFBiomeFeatureStore

+ (id)singletonInstance
{
  id v3;
  _QWORD block[5];

  if (+[FSFUtils isSupportedPlatform](FSFUtils, "isSupportedPlatform"))
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __41__FSFBiomeFeatureStore_singletonInstance__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (singletonInstance_onceToken != -1)
      dispatch_once(&singletonInstance_onceToken, block);
    v3 = (id)singletonInstance_sharedInstance;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("This method is not implemented for the current platform"));
    v3 = 0;
  }
  return v3;
}

void __41__FSFBiomeFeatureStore_singletonInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)singletonInstance_sharedInstance;
  singletonInstance_sharedInstance = (uint64_t)v1;

}

- (FSFBiomeFeatureStore)init
{
  FSFBiomeFeatureStore *v2;
  uint64_t v3;
  BMStoreConfig *config;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FSFBiomeFeatureStore;
  v2 = -[FSFBiomeFeatureStore init](&v6, sel_init);
  if (v2)
  {
    +[FSFUtils biomeStoreConfig](FSFUtils, "biomeStoreConfig");
    v3 = objc_claimAutoreleasedReturnValue();
    config = v2->_config;
    v2->_config = (BMStoreConfig *)v3;

  }
  return v2;
}

- (id)getStream:(id)a3
{
  id v4;
  FSFBiomeFeatureStoreStream *v5;

  v4 = a3;
  v5 = -[FSFBiomeFeatureStoreStream initWithConfig:streamId:]([FSFBiomeFeatureStoreStream alloc], "initWithConfig:streamId:", self->_config, v4);

  return v5;
}

- (BOOL)deleteStream:(id)a3
{
  id v4;
  void *v5;
  char v6;
  FSFBiomeFeatureStoreStream *v7;
  BOOL v8;

  v4 = a3;
  +[FSFUtils availableStreams](FSFUtils, "availableStreams");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if ((v6 & 1) != 0)
  {
    v7 = -[FSFBiomeFeatureStoreStream initWithConfig:streamId:]([FSFBiomeFeatureStoreStream alloc], "initWithConfig:streamId:", self->_config, v4);
    v8 = -[FSFBiomeFeatureStoreStream deleteCurrentStream](v7, "deleteCurrentStream");

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[FSFBiomeFeatureStore deleteStream:].cold.1();
    v8 = 0;
  }

  return v8;
}

- (BOOL)deleteAllStreams
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  +[FSFUtils availableStreams](FSFUtils, "availableStreams", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    v7 = 1;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v7 &= -[FSFBiomeFeatureStore deleteStream:](self, "deleteStream:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i));
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  else
  {
    LOBYTE(v7) = 1;
  }

  return v7;
}

- (BMStoreConfig)config
{
  return self->_config;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_config, 0);
}

- (void)deleteStream:.cold.1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_212552000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "deleteStream: received non available streamId", v0, 2u);
}

@end
