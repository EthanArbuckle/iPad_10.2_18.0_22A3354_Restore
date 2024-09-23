@implementation ISStoreMapTable

- (ISStoreMapTable)initWithURL:(id)a3 capacity:(unint64_t)a4
{
  id v7;
  ISStoreMapTable *v8;
  ISStoreMapTable *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ISStoreMapTable;
  v8 = -[ISStoreMapTable init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_url, a3);
    v9->_dataLock._os_unfair_lock_opaque = 0;
    v9->_initialCapacity = a4;
  }

  return v9;
}

- (void)addData:(id)a3 forUUID:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    v8[0] = 0;
    v8[1] = 0;
    objc_msgSend(a4, "getUUIDBytes:", v8);
    v7 = objc_retainAutorelease(v6);
    -[ISStoreMapTable setBytes:size:forUUID:](self, "setBytes:size:forUUID:", objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"), v8);
  }
  else
  {
    -[ISStoreMapTable removeDataForUUID:](self, "removeDataForUUID:", a4);
  }

}

- (id)dataForUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void *v13;
  id v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[ISStoreMapTable data](self, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = 0;
  v15[1] = 0;
  objc_msgSend(v4, "getUUIDBytes:", v15);

  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __31__ISStoreMapTable_dataForUUID___block_invoke;
  v13 = &unk_1E5800948;
  v14 = v5;
  v7 = v5;
  objc_msgSend(v6, "_ISStoreIndex_enumerateValuesForUUID:bock:", v15, &v10);
  v8 = (void *)objc_msgSend(v7, "copy", v10, v11, v12, v13);

  return v8;
}

void __31__ISStoreMapTable_dataForUUID___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", a2 + 36, NodeStructGetDataSize(a2), 0);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (void)removeDataForUUID:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ISStoreMapTable data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = 0;
  v6[1] = 0;
  objc_msgSend(v4, "getUUIDBytes:", v6);

  objc_msgSend(v5, "_ISStoreIndex_enumerateValuesForUUID:bock:", v6, &__block_literal_global_5);
}

void __37__ISStoreMapTable_removeDataForUUID___block_invoke(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(a2 + 32) = 0;
}

- (void)removeDataForUUID:(id)a3 passingTest:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[ISStoreMapTable data](self, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = 0;
  v12[1] = 0;
  objc_msgSend(v7, "getUUIDBytes:", v12);

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __49__ISStoreMapTable_removeDataForUUID_passingTest___block_invoke;
  v10[3] = &unk_1E5800990;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "_ISStoreIndex_enumerateValuesForUUID:bock:", v12, v10);

}

void __49__ISStoreMapTable_removeDataForUUID_passingTest___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", a2 + 36, NodeStructGetDataSize(a2), 0);
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
    *(_BYTE *)(a2 + 32) = 0;

}

- (void)enumerateWithBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[ISStoreMapTable data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__ISStoreMapTable_enumerateWithBlock___block_invoke;
  v7[3] = &unk_1E5800990;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "_ISStoreIndex_enumerateValuesWithBock:", v7);

}

void __38__ISStoreMapTable_enumerateWithBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;

  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", a2 + 8);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", a2 + 36, NodeStructGetDataSize(a2), 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)removeAll
{
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;
  NSData *v6;
  void *v7;
  NSData *data;
  NSData *v9;

  v9 = self->_data;
  v3 = -[NSData _ISStoreIndex_hashTableHeader](v9, "_ISStoreIndex_hashTableHeader");
  v4 = v3;
  if (!v3 || (v5 = *(_DWORD *)(v3 + 12)) == 0)
    v5 = 10000;
  objc_msgSend(MEMORY[0x1E0C99D50], "_ISMutableStoreIndex_mappedDataWithCapacity:additionalSize:", v5, v5 << 8);
  v6 = (NSData *)objc_claimAutoreleasedReturnValue();
  -[ISStoreMapTable url](self, "url");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSData _ISMutableStoreIndex_makeBackedByFileAtURL:](v6, "_ISMutableStoreIndex_makeBackedByFileAtURL:", v7);

  os_unfair_lock_lock(&self->_dataLock);
  data = self->_data;
  self->_data = v6;

  os_unfair_lock_unlock(&self->_dataLock);
  if (v4)
    *(_BYTE *)(v4 + 4) = 0;

}

- (void)compact
{
  double v2;

  LODWORD(v2) = 1.0;
  -[ISStoreMapTable _extendWithMultiplyer:](self, "_extendWithMultiplyer:", v2);
}

- (void)enumerateWithUUID:(unsigned __int8)a3[16] block:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  -[ISStoreMapTable data](self, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __43__ISStoreMapTable_enumerateWithUUID_block___block_invoke;
  v9[3] = &unk_1E5800990;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "_ISStoreIndex_enumerateValuesForUUID:bock:", a3, v9);

}

uint64_t __43__ISStoreMapTable_enumerateWithUUID_block___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t DataSize;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a2 + 36;
  DataSize = NodeStructGetDataSize(a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 16))(v4, v5, DataSize, a3);
}

- (void)setBytes:(const void *)a3 size:(unint64_t)a4 forUUID:(unsigned __int8)a5[16]
{
  void *v9;
  uint64_t v10;
  NSObject *v11;

  -[ISStoreMapTable data](self, "data");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "_ISStoreIndex_hashTableHeader");
  if (v10 && *(_DWORD *)(v10 + 12) <= *(_DWORD *)(v10 + 8))
    -[ISStoreMapTable _extend](self, "_extend");
  if ((objc_msgSend(v9, "_ISMutableStoreIndex_addValue:size:forUUID:", a3, a4, a5) & 1) == 0)
  {
    _ISDefaultLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[ISStoreMapTable setBytes:size:forUUID:].cold.1(v11);

  }
}

- (NSData)data
{
  os_unfair_lock_s *p_dataLock;
  NSData **p_data;
  NSData *v5;
  void *v6;
  NSData *v7;

  p_dataLock = &self->_dataLock;
  os_unfair_lock_lock(&self->_dataLock);
  p_data = &self->_data;
  if (-[NSData _ISStoreIndex_isValid](self->_data, "_ISStoreIndex_isValid"))
  {
    v5 = *p_data;
  }
  else
  {
    -[ISStoreMapTable url](self, "url");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D50], "_ISMutableStoreIndex_mappedDataWithURL:", v6);
    v5 = (NSData *)objc_claimAutoreleasedReturnValue();
    if (!-[NSData _ISStoreIndex_isValid](v5, "_ISStoreIndex_isValid"))
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "_ISMutableStoreIndex_mappedDataWithCapacity:additionalSize:", self->_initialCapacity, self->_initialCapacity << 8);
      v7 = (NSData *)objc_claimAutoreleasedReturnValue();

      -[NSData _ISMutableStoreIndex_makeBackedByFileAtURL:](v7, "_ISMutableStoreIndex_makeBackedByFileAtURL:", v6);
      v5 = v7;
    }
    objc_storeStrong((id *)p_data, v5);

  }
  os_unfair_lock_unlock(p_dataLock);
  return v5;
}

- (void)_extend
{
  double v2;

  LODWORD(v2) = 1.5;
  -[ISStoreMapTable _extendWithMultiplyer:](self, "_extendWithMultiplyer:", v2);
}

- (void)_extendWithMultiplyer:(float)a3
{
  NSData *v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSData *v13;
  void *v14;
  os_unfair_lock_s *p_dataLock;
  NSData *data;
  NSData *v17;
  _QWORD v18[4];
  NSData *v19;

  v5 = self->_data;
  v6 = -[NSData _ISStoreIndex_hashTableHeader](v5, "_ISStoreIndex_hashTableHeader");
  v7 = v6;
  if (!v6 || (v8 = *(_DWORD *)(v6 + 12)) == 0)
    v8 = 10000;
  v9 = (float)((float)v8 * a3);
  v10 = -[NSData length](v5, "length");
  v11 = -[NSData _ISStoreIndex_nodesOffset](v5, "_ISStoreIndex_nodesOffset");
  objc_msgSend(MEMORY[0x1E0C99D50], "_ISMutableStoreIndex_mappedDataWithCapacity:additionalSize:", v9, (unint64_t)(float)((float)(unint64_t)(v10 - v11) * a3));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __41__ISStoreMapTable__extendWithMultiplyer___block_invoke;
  v18[3] = &unk_1E5800948;
  v13 = v12;
  v19 = v13;
  -[NSData _ISStoreIndex_enumerateValuesWithBock:](v5, "_ISStoreIndex_enumerateValuesWithBock:", v18);
  -[ISStoreMapTable url](self, "url");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSData _ISMutableStoreIndex_makeBackedByFileAtURL:](v13, "_ISMutableStoreIndex_makeBackedByFileAtURL:", v14);

  p_dataLock = &self->_dataLock;
  os_unfair_lock_lock(&self->_dataLock);
  data = self->_data;
  self->_data = v13;
  v17 = v13;

  os_unfair_lock_unlock(p_dataLock);
  if (v7)
    *(_BYTE *)(v7 + 4) = 0;

}

uint64_t __41__ISStoreMapTable__extendWithMultiplyer___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_ISMutableStoreIndex_addValue:size:forUUID:", a2 + 36, NodeStructGetDataSize(a2), a2 + 8);
}

- (void)_extendData
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AA928000, log, OS_LOG_TYPE_ERROR, "Failed to extend the store index size.", v1, 2u);
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUrl:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (os_unfair_lock_s)dataLock
{
  return self->_dataLock;
}

- (void)setDataLock:(os_unfair_lock_s)a3
{
  self->_dataLock = a3;
}

- (unint64_t)initialCapacity
{
  return self->_initialCapacity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

- (void)setBytes:(os_log_t)log size:forUUID:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1AA928000, log, OS_LOG_TYPE_DEBUG, "Error: Rcovery from addValue to corrupt index failed.", v1, 2u);
}

@end
