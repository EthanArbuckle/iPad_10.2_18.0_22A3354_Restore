@implementation GEOPlaceFetchCacheReply

- (GEOPlaceFetchCacheReply)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6;
  GEOPlaceFetchCacheReply *v7;
  void *v8;
  size_t count;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  GEOPlaceFetchCacheReply *v15;
  _QWORD applier[5];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  objc_super v26;

  v6 = a3;
  v26.receiver = self;
  v26.super_class = (Class)GEOPlaceFetchCacheReply;
  v7 = -[GEOXPCReply initWithXPCDictionary:error:](&v26, sel_initWithXPCDictionary_error_, v6, a4);
  if (v7)
  {
    xpc_dictionary_get_dictionary(v6, "allCacheEntries");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    count = xpc_dictionary_get_count(v8);
    if (count)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", count);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 0;
      v21 = &v20;
      v22 = 0x3032000000;
      v23 = __Block_byref_object_copy__72;
      v24 = __Block_byref_object_dispose__72;
      v25 = 0;
      applier[0] = MEMORY[0x1E0C809B0];
      applier[1] = 3221225472;
      applier[2] = __55__GEOPlaceFetchCacheReply_initWithXPCDictionary_error___block_invoke;
      applier[3] = &unk_1E1C123E8;
      applier[4] = v8;
      v19 = &v20;
      v11 = v10;
      v18 = v11;
      xpc_dictionary_apply(v8, applier);
      if (a4)
      {
        v12 = (void *)v21[5];
        if (v12)
          *a4 = objc_retainAutorelease(v12);
      }
      v13 = objc_msgSend(v11, "count");
      if (v13)
        v14 = (void *)objc_msgSend(v11, "copy");
      else
        v14 = 0;
      objc_storeStrong((id *)&v7->_allCacheEntries, v14);
      if (v13)

      _Block_object_dispose(&v20, 8);
    }

    v15 = v7;
  }

  return v7;
}

uint64_t __55__GEOPlaceFetchCacheReply_initWithXPCDictionary_error___block_invoke(uint64_t a1, const char *a2)
{
  void *v4;
  const void *data;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id obj;
  size_t length;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  length = 0;
  data = xpc_dictionary_get_data(*(xpc_object_t *)(a1 + 32), a2, &length);
  if (data)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", data, length, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CB3710];
    v8 = objc_opt_class();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    obj = *(id *)(v9 + 40);
    objc_msgSend(v7, "unarchivedObjectOfClass:fromData:error:", v8, v6, &obj);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v9 + 40), obj);
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v10, v4);

  }
  return 1;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4;
  xpc_object_t v5;
  NSDictionary *allCacheEntries;
  id v7;
  _QWORD v8[4];
  id v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOPlaceFetchCacheReply;
  -[GEOXPCReply encodeToXPCDictionary:](&v10, sel_encodeToXPCDictionary_, v4);
  if (-[NSDictionary count](self->_allCacheEntries, "count"))
  {
    v5 = xpc_dictionary_create(0, 0, 0);
    allCacheEntries = self->_allCacheEntries;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __49__GEOPlaceFetchCacheReply_encodeToXPCDictionary___block_invoke;
    v8[3] = &unk_1E1C12410;
    v7 = v5;
    v9 = v7;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](allCacheEntries, "enumerateKeysAndObjectsUsingBlock:", v8);
    if (xpc_dictionary_get_count(v7))
      xpc_dictionary_set_value(v4, "allCacheEntries", v7);

  }
}

void __49__GEOPlaceFetchCacheReply_encodeToXPCDictionary___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  const char *v10;
  id v11;

  v5 = (void *)MEMORY[0x1E0CB36F8];
  v6 = a2;
  objc_msgSend(v5, "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 32);
  v9 = objc_retainAutorelease(v6);
  v10 = (const char *)objc_msgSend(v9, "UTF8String");

  v11 = objc_retainAutorelease(v7);
  xpc_dictionary_set_data(v8, v10, (const void *)objc_msgSend(v11, "bytes"), objc_msgSend(v11, "length"));

}

- (BOOL)isValid
{
  return 1;
}

- (NSDictionary)allCacheEntries
{
  return self->_allCacheEntries;
}

- (void)setAllCacheEntries:(id)a3
{
  objc_storeStrong((id *)&self->_allCacheEntries, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allCacheEntries, 0);
}

@end
