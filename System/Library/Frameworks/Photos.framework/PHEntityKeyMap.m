@implementation PHEntityKeyMap

- (id)entityKeyForPropertyKey:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_entityKeysByPropertyKey, "objectForKeyedSubscript:", a3);
}

void __51__PHEntityKeyMap_transposePropertyKeysByEntityKey___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 40), "assertPropertyKey:doesNotExistForEntityKey:inEntityKeysByProperty:", v11, v5, *(_QWORD *)(a1 + 32));
        objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

+ (void)assertPropertyKey:(id)a3 doesNotExistForEntityKey:(id)a4 inEntityKeysByProperty:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v7 = a4;
  v8 = a5;
  objc_msgSend(v8, "objectForKeyedSubscript:", v11);
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v12[0] = CFSTR("existingEntityKey");
    v12[1] = CFSTR("entityKey");
    v13[0] = v9;
    v13[1] = v7;
    v12[2] = CFSTR("propertyKey");
    v13[2] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Duplicate property key"), objc_claimAutoreleasedReturnValue());
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v10);
  }

}

- (PHEntityKeyMap)initWithPropertyKeysByEntityKey:(id)a3
{
  id v4;
  PHEntityKeyMap *v5;
  uint64_t v6;
  NSDictionary *propertyKeysByEntityKey;
  uint64_t v8;
  NSDictionary *entityKeysByPropertyKey;
  PHEntityKeyMap *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PHEntityKeyMap;
  v5 = -[PHEntityKeyMap init](&v12, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    propertyKeysByEntityKey = v5->_propertyKeysByEntityKey;
    v5->_propertyKeysByEntityKey = (NSDictionary *)v6;

    objc_msgSend((id)objc_opt_class(), "transposePropertyKeysByEntityKey:", v5->_propertyKeysByEntityKey);
    v8 = objc_claimAutoreleasedReturnValue();
    entityKeysByPropertyKey = v5->_entityKeysByPropertyKey;
    v5->_entityKeysByPropertyKey = (NSDictionary *)v8;

    v10 = v5;
  }

  return v5;
}

+ (id)transposePropertyKeysByEntityKey:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = (void *)MEMORY[0x1E0C99E08];
  v5 = a3;
  objc_msgSend(v4, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__PHEntityKeyMap_transposePropertyKeysByEntityKey___block_invoke;
  v9[3] = &unk_1E35D71B8;
  v11 = a1;
  v7 = v6;
  v10 = v7;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v9);

  return v7;
}

- (id)propertyKeyForEntityKey:(id)a3
{
  void *v3;
  void *v4;

  -[NSDictionary objectForKeyedSubscript:](self->_propertyKeysByEntityKey, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityKeysByPropertyKey, 0);
  objc_storeStrong((id *)&self->_propertyKeysByEntityKey, 0);
}

@end
