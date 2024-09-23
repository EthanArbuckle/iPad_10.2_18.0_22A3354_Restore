@implementation ISStoreIndex

- (void)enumerateValuesForUUID:(unsigned __int8)a3[16] bock:(id)a4
{
  id v6;
  char v7;
  void *v8;
  void *v9;
  id v10;
  char v11;
  NSData *data;
  char v13;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  v7 = 1;
  do
  {
    v8 = (void *)MEMORY[0x1AF423108]();
    -[ISStoreIndex data](self, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __44__ISStoreIndex_enumerateValuesForUUID_bock___block_invoke;
    v14[3] = &unk_1E5800990;
    v10 = v6;
    v15 = v10;
    v11 = objc_msgSend(v9, "_ISStoreIndex_enumerateValuesForUUID:bock:", a3, v14);
    if ((v11 & 1) == 0)
    {
      os_unfair_lock_lock(-[ISStoreIndex dataLock](self, "dataLock"));
      data = self->_data;
      self->_data = 0;

      os_unfair_lock_unlock(-[ISStoreIndex dataLock](self, "dataLock"));
    }

    objc_autoreleasePoolPop(v8);
    v13 = v7 & (v11 ^ 1);
    v7 = 0;
  }
  while ((v13 & 1) != 0);

}

- (NSData)data
{
  void *v3;
  void *v4;
  NSData *v5;
  NSData *data;
  NSData *v7;
  NSData *v8;
  NSObject *v9;
  NSData *v10;

  os_unfair_lock_lock(-[ISStoreIndex dataLock](self, "dataLock"));
  if (!-[NSData _ISStoreIndex_isValid](self->_data, "_ISStoreIndex_isValid"))
  {
    v3 = (void *)MEMORY[0x1E0C99D50];
    -[ISStoreIndex indexFileURL](self, "indexFileURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_ISStoreIndex_mappedDataWithURL:", v4);
    v5 = (NSData *)objc_claimAutoreleasedReturnValue();
    data = self->_data;
    self->_data = v5;

    v7 = self->_data;
    if (v7)
    {
      if (!-[NSData _ISStoreIndex_isValid](v7, "_ISStoreIndex_isValid"))
      {
        v8 = self->_data;
        self->_data = 0;

        _ISDefaultLog();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          -[ISStoreIndex data].cold.1(self, v9);

      }
    }
  }
  v10 = self->_data;
  os_unfair_lock_unlock(-[ISStoreIndex dataLock](self, "dataLock"));
  return v10;
}

- (os_unfair_lock_s)dataLock
{
  return &self->_dataLock;
}

uint64_t __44__ISStoreIndex_enumerateValuesForUUID_bock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = NodeStructGetDataSize(a2);
  if (result == 116)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return result;
}

- (NSURL)indexFileURL
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (ISStoreIndex)initWithStoreFileURL:(id)a3
{
  id v5;

  v5 = a3;
  if (self)
  {
    objc_storeStrong((id *)&self->_indexFileURL, a3);
    self->_dataLock._os_unfair_lock_opaque = 0;
  }

  return self;
}

- (void)invalidate
{
  NSData *data;

  os_unfair_lock_lock(-[ISStoreIndex dataLock](self, "dataLock"));
  data = self->_data;
  self->_data = 0;

  os_unfair_lock_unlock(-[ISStoreIndex dataLock](self, "dataLock"));
}

- (id)_internalData
{
  return self->_data;
}

- (void)_internalSetData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (void)enumerateValuesWithBock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[ISStoreIndex data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__ISStoreIndex_enumerateValuesWithBock___block_invoke;
  v7[3] = &unk_1E5800990;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "_ISStoreIndex_enumerateValuesWithBock:", v7);

}

uint64_t __40__ISStoreIndex_enumerateValuesWithBock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = NodeStructGetDataSize(a2);
  if (result == 116)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return result;
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void *v10;
  id v11;
  _QWORD *v12;
  _QWORD v13[3];
  int v14;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v14 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __27__ISStoreIndex_description__block_invoke;
  v10 = &unk_1E58009D8;
  v4 = v3;
  v11 = v4;
  v12 = v13;
  -[ISStoreIndex enumerateValuesWithBock:](self, "enumerateValuesWithBock:", &v7);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v4, v7, v8, v9, v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(v13, 8);
  return v5;
}

void __27__ISStoreIndex_description__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  char v5[48];
  char v6[48];
  char v7[48];
  char v8[48];
  char out[40];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1AF423108]();
  memset(out, 0, 37);
  uuid_unparse((const unsigned __int8 *)a2, out);
  memset(v8, 0, 37);
  uuid_unparse((const unsigned __int8 *)(a2 + 60), v8);
  memset(v7, 0, 37);
  uuid_unparse((const unsigned __int8 *)(a2 + 76), v7);
  memset(v6, 0, 37);
  uuid_unparse((const unsigned __int8 *)(a2 + 100), v6);
  memset(v5, 0, 37);
  uuid_unparse((const unsigned __int8 *)(a2 + 44), v5);
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("Item [%u]\n\tUUID: %s\n\tSize: %upt @%ux\n\tValid from: %upt to %upt\n\tBitmap filename: %s.isdata\n\tValidation Token:- DB UUID: %s seq: %llu RSC UUID: %s\n\tDescriptor UUID: %s\n-------------------------------------------------\n"), (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))++, out, *(double *)(a2 + 32), *(unsigned int *)(a2 + 40), *(double *)(a2 + 16), *(double *)(a2 + 24), v8, v7, *(_QWORD *)(a2 + 92), v6, v5);
  objc_autoreleasePoolPop(v4);
}

- (BOOL)validate
{
  void *v2;
  id v3;
  char v4;
  _QWORD v6[4];
  id v7;
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 1;
  -[ISStoreIndex data](self, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __24__ISStoreIndex_validate__block_invoke_7;
  v6[3] = &unk_1E5800A20;
  v8 = &__block_literal_global_7;
  v3 = v2;
  v7 = v3;
  v9 = &v10;
  objc_msgSend(v3, "_ISStoreIndex_enumerateValuesWithBock:", v6);
  v4 = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return v4;
}

uint64_t __24__ISStoreIndex_validate__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  int v15;
  void *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = objc_msgSend(v4, "_ISStoreIndex_nodeForRef:", a3);
  if (!v5)
    goto LABEL_6;
  v6 = v5;
  v7 = *(unsigned int *)(v5 + 24);
  if (v7 > a3)
  {
    while (1)
    {
      v8 = v7;
      v9 = *(unsigned int *)(v6 + 28);
      v10 = objc_msgSend(v4, "_ISStoreIndex_nodeForRef:", v7 | (v9 << 32));
      if (!v10)
        goto LABEL_6;
      v6 = v10;
      v7 = *(unsigned int *)(v10 + 24);
      if (v7 <= v8)
      {
        if (*(_DWORD *)(v10 + 24))
          goto LABEL_8;
        goto LABEL_6;
      }
    }
  }
  v9 = HIDWORD(a3);
  LODWORD(v8) = a3;
  if (!*(_DWORD *)(v5 + 24))
  {
LABEL_6:
    v11 = 1;
    goto LABEL_11;
  }
LABEL_8:
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v6 + 8);
  _ISDefaultLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
  {
    v15 = 138412802;
    v16 = v12;
    v17 = 1024;
    v18 = v8;
    v19 = 1024;
    v20 = v9;
    _os_log_fault_impl(&dword_1AA928000, v13, OS_LOG_TYPE_FAULT, "Cyclic node detected: %@ (offset: %u, size: %u) ", (uint8_t *)&v15, 0x18u);
  }

  v11 = 0;
LABEL_11:

  return v11;
}

uint64_t __24__ISStoreIndex_validate__block_invoke_7(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if ((result & 1) == 0)
  {
    *a3 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entryData, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_indexFileURL, 0);
}

- (void)data
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "indexFileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_1AA928000, a2, OS_LOG_TYPE_DEBUG, "Store index at URL: %@ is not valid.", (uint8_t *)&v4, 0xCu);

}

@end
