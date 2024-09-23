@implementation KMRadioStationBridge

- (KMRadioStationBridge)init
{
  KMRadioStationBridge *v2;
  KVItemBuilder *v3;
  KVItemBuilder *builder;
  KMRadioStationBridge *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)KMRadioStationBridge;
  v2 = -[KMRadioStationBridge init](&v7, sel_init);
  if (v2)
  {
    v3 = (KVItemBuilder *)objc_alloc_init(MEMORY[0x24BE5E8E8]);
    builder = v2->_builder;
    v2->_builder = v3;

    v5 = v2;
  }

  return v2;
}

- (BOOL)enumerateItemsWithError:(id *)a3 usingBlock:(id)a4
{
  uint64_t (**v5)(_QWORD);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  BOOL v16;
  NSObject *v17;
  NSObject *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = (uint64_t (**)(_QWORD))a4;
  +[CarPlayConnectionManager shared](CarPlayConnectionManager, "shared");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "radioStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[KMRadioStationBridge setRadioStore:](self, "setRadioStore:", v7);

  -[KMRadioStationBridge radioStore](self, "radioStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "radioStations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)KMLogContextCore;
  if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_DEBUG))
  {
    v19 = v10;
    *(_DWORD *)buf = 136315394;
    v26 = "-[KMRadioStationBridge enumerateItemsWithError:usingBlock:]";
    v27 = 2048;
    v28 = objc_msgSend(v9, "count");
    _os_log_debug_impl(&dword_218838000, v19, OS_LOG_TYPE_DEBUG, "%s #radio: %li radio stations found for donation.", buf, 0x16u);

  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        if (!*(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i) || (v5[2](v5) & 1) == 0)
        {
          v17 = KMLogContextCore;
          if (os_log_type_enabled((os_log_t)KMLogContextCore, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            v26 = "-[KMRadioStationBridge enumerateItemsWithError:usingBlock:]";
            _os_log_error_impl(&dword_218838000, v17, OS_LOG_TYPE_ERROR, "%s #radio: Could not donate while enumerating over station list", buf, 0xCu);
          }
          v16 = 0;
          goto LABEL_17;
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      v16 = 1;
      if (v13)
        continue;
      break;
    }
  }
  else
  {
    v16 = 1;
  }
LABEL_17:

  return v16;
}

- (unsigned)cascadeItemType
{
  return -16470;
}

- (id)originAppId
{
  return (id)*MEMORY[0x24BE5E878];
}

- (RadioListener)radioStore
{
  return (RadioListener *)objc_loadWeakRetained((id *)&self->_radioStore);
}

- (void)setRadioStore:(id)a3
{
  objc_storeWeak((id *)&self->_radioStore, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_radioStore);
  objc_storeStrong((id *)&self->_builder, 0);
}

+ (void)bootstrapListenerWithHandler:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[CarPlayConnectionManager shared](CarPlayConnectionManager, "shared");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerUpdateHandler:", v3);

}

@end
