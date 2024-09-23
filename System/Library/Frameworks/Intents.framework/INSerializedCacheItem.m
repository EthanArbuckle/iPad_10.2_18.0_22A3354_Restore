@implementation INSerializedCacheItem

- (INSerializedCacheItem)init
{
  return -[INSerializedCacheItem initWithType:identifier:payload:](self, "initWithType:identifier:payload:", 0, 0, 0);
}

- (INSerializedCacheItem)initWithType:(int64_t)a3 identifier:(id)a4 payload:(id)a5
{
  id v8;
  id v9;
  INSerializedCacheItem *v10;
  INSerializedCacheItem *v11;
  uint64_t v12;
  NSString *identifier;
  uint64_t v14;
  NSDictionary *payload;
  objc_super v17;

  v8 = a4;
  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)INSerializedCacheItem;
  v10 = -[INSerializedCacheItem init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_type = a3;
    v12 = objc_msgSend(v8, "copy");
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    payload = v11->_payload;
    v11->_payload = (NSDictionary *)v14;

  }
  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  NSUInteger v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_type);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[NSString hash](self->_identifier, "hash");
  v6 = v5 ^ -[NSDictionary hash](self->_payload, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  INSerializedCacheItem *v4;
  INSerializedCacheItem *v5;
  NSString *identifier;
  NSDictionary *payload;
  BOOL v8;

  v4 = (INSerializedCacheItem *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v8 = 0;
      if (self->_type == v5->_type)
      {
        identifier = self->_identifier;
        if (identifier == v5->_identifier || -[NSString isEqual:](identifier, "isEqual:"))
        {
          payload = self->_payload;
          if (payload == v5->_payload || -[NSDictionary isEqual:](payload, "isEqual:"))
            v8 = 1;
        }
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type;
  id v5;

  type = self->_type;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", type, CFSTR("type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_payload, CFSTR("payload"));

}

- (INSerializedCacheItem)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  INSerializedCacheItem *v15;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("payload"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[INSerializedCacheItem initWithType:identifier:payload:](self, "initWithType:identifier:payload:", v5, v6, v14);
  return v15;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)INSerializedCacheItem;
  -[INSerializedCacheItem description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ {type = %zd, identifier = %@, payload = %@}"), v4, self->_type, self->_identifier, self->_payload);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDictionary)payload
{
  return self->_payload;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (void)serializeCacheableObjects:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  dispatch_group_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  _QWORD block[4];
  id v14;
  dispatch_group_t v15;
  id v16;
  id v17;
  id v18;

  v5 = a3;
  v6 = a4;
  if (v6)
  {
    v7 = dispatch_group_create();
    INCacheableGetSerializationQueue();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__INSerializedCacheItem_serializeCacheableObjects_completion___block_invoke;
    block[3] = &unk_1E2291F80;
    v14 = v5;
    v15 = v7;
    v16 = v9;
    v17 = v8;
    v18 = v6;
    v10 = v8;
    v11 = v9;
    v12 = v7;
    dispatch_async(v10, block);

  }
}

+ (void)deserializeCacheItems:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  dispatch_group_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  _QWORD block[4];
  id v16;
  dispatch_group_t v17;
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v6)
  {
    v7 = (void *)INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      v8 = v7;
      *(_DWORD *)buf = 136315394;
      v22 = "+[INSerializedCacheItem deserializeCacheItems:completion:]";
      v23 = 2048;
      v24 = objc_msgSend(v5, "count");
      _os_log_impl(&dword_18BEBC000, v8, OS_LOG_TYPE_INFO, "%s Deserializing %tu serialized cache items...", buf, 0x16u);

    }
    v9 = dispatch_group_create();
    INCacheableGetSerializationQueue();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__INSerializedCacheItem_deserializeCacheItems_completion___block_invoke;
    block[3] = &unk_1E2291F80;
    v16 = v5;
    v17 = v9;
    v18 = v11;
    v19 = v10;
    v20 = v6;
    v12 = v10;
    v13 = v11;
    v14 = v9;
    dispatch_async(v12, block);

  }
}

+ (void)deserializeCacheItem:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v5 = a3;
  v6 = a4;
  if (v6)
  {
    v7 = objc_msgSend(v5, "type");
    if ((v7 == 1 || v7 == 2) && (v8 = objc_opt_class()) != 0)
    {
      v9 = (void *)v8;
      objc_msgSend(v5, "payload");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __57__INSerializedCacheItem_deserializeCacheItem_completion___block_invoke;
      v12[3] = &unk_1E228D5D0;
      v13 = v6;
      objc_msgSend(v9, "buildFromCachePayload:identifier:completion:", v10, v11, v12);

    }
    else
    {
      (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
    }
  }

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __57__INSerializedCacheItem_deserializeCacheItem_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EE056518))
    v3 = v4;
  else
    v3 = 0;
  (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v3);

}

void __58__INSerializedCacheItem_deserializeCacheItems_completion___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v19;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v19 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v6);
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __58__INSerializedCacheItem_deserializeCacheItems_completion___block_invoke_2;
        v14[3] = &unk_1E228D5A8;
        v15 = *(id *)(a1 + 48);
        v16 = v7;
        v17 = *(id *)(a1 + 40);
        +[INSerializedCacheItem deserializeCacheItem:completion:](INSerializedCacheItem, "deserializeCacheItem:completion:", v7, v14);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v4);
  }

  v8 = *(NSObject **)(a1 + 56);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58__INSerializedCacheItem_deserializeCacheItems_completion___block_invoke_7;
  v10[3] = &unk_1E2292238;
  v9 = *(NSObject **)(a1 + 40);
  v11 = *(id *)(a1 + 32);
  v12 = *(id *)(a1 + 48);
  v13 = *(id *)(a1 + 64);
  dispatch_group_notify(v9, v8, v10);

}

void __58__INSerializedCacheItem_deserializeCacheItems_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    v4 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      v5 = *(_QWORD *)(a1 + 40);
      v6 = 136315650;
      v7 = "+[INSerializedCacheItem deserializeCacheItems:completion:]_block_invoke_2";
      v8 = 2112;
      v9 = v5;
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_18BEBC000, v4, OS_LOG_TYPE_INFO, "%s Deserialized %@ to %@", (uint8_t *)&v6, 0x20u);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

void __58__INSerializedCacheItem_deserializeCacheItems_completion___block_invoke_7(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    v5 = objc_msgSend(v3, "count");
    v6 = objc_msgSend(*(id *)(a1 + 40), "count");
    v9 = 136315650;
    v10 = "+[INSerializedCacheItem deserializeCacheItems:completion:]_block_invoke";
    v11 = 2048;
    v12 = v5;
    v13 = 2048;
    v14 = v6;
    _os_log_impl(&dword_18BEBC000, v4, OS_LOG_TYPE_INFO, "%s Deserialized %tu serialized cache items to %tu cacheable objects.", (uint8_t *)&v9, 0x20u);

  }
  v7 = *(_QWORD *)(a1 + 48);
  v8 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

}

void __62__INSerializedCacheItem_serializeCacheableObjects_completion___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  v4 = MEMORY[0x1E0C809B0];
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v22;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v7);
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
        objc_msgSend(v8, "cacheIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v17[0] = v4;
        v17[1] = 3221225472;
        v17[2] = __62__INSerializedCacheItem_serializeCacheableObjects_completion___block_invoke_2;
        v17[3] = &unk_1E228D580;
        v17[4] = v8;
        v18 = v9;
        v19 = *(id *)(a1 + 48);
        v20 = *(id *)(a1 + 40);
        v10 = v9;
        objc_msgSend(v8, "generateCachePayloadWithCompletion:", v17);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v5);
  }

  v11 = *(NSObject **)(a1 + 56);
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __62__INSerializedCacheItem_serializeCacheableObjects_completion___block_invoke_4;
  block[3] = &unk_1E2292238;
  v12 = *(NSObject **)(a1 + 40);
  v14 = *(id *)(a1 + 32);
  v15 = *(id *)(a1 + 48);
  v16 = *(id *)(a1 + 64);
  dispatch_group_notify(v12, v11, block);

}

void __62__INSerializedCacheItem_serializeCacheableObjects_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  INSerializedCacheItem *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  INSerializedCacheItem *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_8;
    v4 = 2;
  }
  v5 = -[INSerializedCacheItem initWithType:identifier:payload:]([INSerializedCacheItem alloc], "initWithType:identifier:payload:", v4, *(_QWORD *)(a1 + 40), v3);
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v5);
  v6 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 136315650;
    v9 = "+[INSerializedCacheItem serializeCacheableObjects:completion:]_block_invoke_2";
    v10 = 2112;
    v11 = v7;
    v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_18BEBC000, v6, OS_LOG_TYPE_INFO, "%s Serialized cacheableObject %@ to %@", (uint8_t *)&v8, 0x20u);
  }

LABEL_8:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

}

void __62__INSerializedCacheItem_serializeCacheableObjects_completion___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    v5 = objc_msgSend(v3, "count");
    v6 = objc_msgSend(*(id *)(a1 + 40), "count");
    v9 = 136315650;
    v10 = "+[INSerializedCacheItem serializeCacheableObjects:completion:]_block_invoke";
    v11 = 2048;
    v12 = v5;
    v13 = 2048;
    v14 = v6;
    _os_log_impl(&dword_18BEBC000, v4, OS_LOG_TYPE_INFO, "%s Serialized %tu cacheable objects to %tu serialized cache items.", (uint8_t *)&v9, 0x20u);

  }
  v7 = *(_QWORD *)(a1 + 48);
  v8 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
  (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

}

@end
