@implementation _DPBitValueMap

+ (void)initialize
{
  if (initialize_onceToken_0 != -1)
    dispatch_once(&initialize_onceToken_0, &__block_literal_global_12);
}

- (_DPBitValueMap)init
{

  return 0;
}

- (_DPBitValueMap)initWithKey:(id)a3 bitValueMapsDirectory:(id)a4
{
  id v7;
  id v8;
  _DPBitValueMap *v9;
  _DPBitValueMap *v10;
  uint64_t v11;
  NSDictionary *map;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_DPBitValueMap;
  v9 = -[_DPBitValueMap init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_key, a3);
    objc_msgSend((id)objc_opt_class(), "bitValueMapForKey:fromConfigurationsFile:", v7, v8);
    v11 = objc_claimAutoreleasedReturnValue();
    map = v10->_map;
    v10->_map = (NSDictionary *)v11;

  }
  return v10;
}

+ (id)bitValueMapForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[_DPStrings bitValueMapDirectoryPath](_DPStrings, "bitValueMapDirectoryPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "bitValueMapForKey:bitValueMapsDirectory:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)bitValueMapForKey:(id)a3 bitValueMapsDirectory:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = (id)_allBitValueMaps;
  objc_sync_enter(v8);
  objc_msgSend((id)_allBitValueMaps, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithKey:bitValueMapsDirectory:", v6, v7);
    if (v9)
      objc_msgSend((id)_allBitValueMaps, "setObject:forKeyedSubscript:", v9, v6);
  }
  objc_sync_exit(v8);

  return v9;
}

+ (void)removeBitValueMapForKey:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v5 = a3;
  v3 = (void *)MEMORY[0x1D8256B78]();
  v4 = (id)_allBitValueMaps;
  objc_sync_enter(v4);
  objc_msgSend((id)_allBitValueMaps, "removeObjectForKey:", v5);
  objc_sync_exit(v4);

  objc_autoreleasePoolPop(v3);
}

+ (id)bitValueMapForKey:(id)a3 fromConfigurationsFile:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1D8256B78]();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@.plist"), v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithContentsOfFile:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __59___DPBitValueMap_bitValueMapForKey_fromConfigurationsFile___block_invoke;
  v14[3] = &unk_1E95D9DD0;
  v15 = v10;
  v11 = v10;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v14);
  v12 = (void *)objc_msgSend(v11, "copy");

  objc_autoreleasePoolPop(v7);
  return v12;
}

- (id)bitValueForString:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (!v4
    || (-[NSDictionary objectForKeyedSubscript:](self->_map, "objectForKeyedSubscript:", v4),
        (v5 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v5 = &unk_1E96FB0A0;
  }

  return v5;
}

- (NSString)key
{
  return self->_key;
}

- (NSDictionary)map
{
  return self->_map;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_map, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
