@implementation ISMutableStoreIndex

- (ISMutableStoreIndex)initWithStoreFileURL:(id)a3 capacity:(unint64_t)a4
{
  id v6;
  ISMutableStoreIndex *v7;
  ISMutableStoreIndex *v8;
  id v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *serialQueue;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ISMutableStoreIndex;
  v7 = -[ISStoreIndex initWithStoreFileURL:](&v13, sel_initWithStoreFileURL_, v6);
  v8 = v7;
  if (v7)
  {
    v7->_initialCapacity = a4;
    objc_msgSend(v6, "path");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = dispatch_queue_create((const char *)objc_msgSend(v9, "UTF8String"), 0);
    serialQueue = v8->_serialQueue;
    v8->_serialQueue = (OS_dispatch_queue *)v10;

  }
  return v8;
}

- (id)data
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;

  os_unfair_lock_lock(-[ISStoreIndex dataLock](self, "dataLock"));
  -[ISStoreIndex _internalData](self, "_internalData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_ISStoreIndex_isValid");

  if ((v4 & 1) != 0)
  {
    -[ISStoreIndex _internalData](self, "_internalData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[ISStoreIndex indexFileURL](self, "indexFileURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D50], "_ISMutableStoreIndex_mappedDataWithURL:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "_ISStoreIndex_isValid") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "_ISMutableStoreIndex_mappedDataWithCapacity:additionalSize:", self->_initialCapacity, 116 * self->_initialCapacity);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "_ISMutableStoreIndex_makeBackedByFileAtURL:", v6);
      v5 = v7;
    }
    -[ISStoreIndex _internalSetData:](self, "_internalSetData:", v5);

  }
  os_unfair_lock_unlock(-[ISStoreIndex dataLock](self, "dataLock"));
  return v5;
}

- (void)performBlock:(id)a3
{
  dispatch_async((dispatch_queue_t)self->_serialQueue, a3);
}

- (BOOL)addValue:(id *)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  BOOL v10;
  void *v11;
  NSObject *v12;

  -[ISMutableStoreIndex data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_ISStoreIndex_hashTableHeader");
  if (v6 && *(_DWORD *)(v6 + 12) <= *(_DWORD *)(v6 + 8))
  {
    -[ISMutableStoreIndex _extend](self, "_extend");
    -[ISMutableStoreIndex data](self, "data");
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }
  v8 = objc_msgSend(v5, "_ISStoreIndex_nodesOffset") + 152;
  if (v8 > objc_msgSend(v5, "length"))
  {
    -[ISMutableStoreIndex _extendData](self, "_extendData");
    -[ISMutableStoreIndex data](self, "data");
    v9 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v9;
  }
  if ((objc_msgSend(v5, "_ISMutableStoreIndex_addValue:", a3) & 1) != 0)
  {
    v10 = 1;
    v11 = v5;
  }
  else
  {
    -[ISMutableStoreIndex removeAll](self, "removeAll");
    -[ISMutableStoreIndex data](self, "data");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v11, "_ISMutableStoreIndex_addValue:", a3) & 1) != 0)
    {
      v10 = 1;
    }
    else
    {
      _ISDefaultLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[ISStoreMapTable setBytes:size:forUUID:].cold.1(v12);

      v10 = 0;
    }
  }

  return v10;
}

- (BOOL)removeValuePassingTest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  char v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  -[ISMutableStoreIndex data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46__ISMutableStoreIndex_removeValuePassingTest___block_invoke;
  v9[3] = &unk_1E5800A48;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "_ISStoreIndex_enumerateValuesWithBock:", v9);
  v7 = *((_BYTE *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __46__ISMutableStoreIndex_removeValuePassingTest___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = NodeStructGetDataSize(a2);
  if (result == 116)
  {
    result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    if ((_DWORD)result)
    {
      *(_BYTE *)(a2 + 32) = 0;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    }
  }
  return result;
}

- (BOOL)removeValueForUUID:(unsigned __int8)a3[16] passingTest:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v6 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  -[ISMutableStoreIndex data](self, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__ISMutableStoreIndex_removeValueForUUID_passingTest___block_invoke;
  v10[3] = &unk_1E5800A48;
  v8 = v6;
  v11 = v8;
  v12 = &v13;
  objc_msgSend(v7, "_ISStoreIndex_enumerateValuesForUUID:bock:", a3, v10);
  LOBYTE(a3) = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return (char)a3;
}

uint64_t __54__ISMutableStoreIndex_removeValueForUUID_passingTest___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = NodeStructGetDataSize(a2);
  if (result == 116)
  {
    result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    if ((_DWORD)result)
    {
      *(_BYTE *)(a2 + 32) = 0;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    }
  }
  return result;
}

- (void)removeAll
{
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;
  void *v6;
  void *v7;
  id v8;

  -[ISStoreIndex _internalData](self, "_internalData");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v8, "_ISStoreIndex_hashTableHeader");
  v4 = v3;
  if (!v3 || (v5 = *(_DWORD *)(v3 + 12)) == 0)
    v5 = 10000;
  objc_msgSend(MEMORY[0x1E0C99D50], "_ISMutableStoreIndex_mappedDataWithCapacity:additionalSize:", v5, 116 * v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISStoreIndex indexFileURL](self, "indexFileURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_ISMutableStoreIndex_makeBackedByFileAtURL:", v7);

  os_unfair_lock_lock(-[ISStoreIndex dataLock](self, "dataLock"));
  -[ISStoreIndex _internalSetData:](self, "_internalSetData:", v6);
  os_unfair_lock_unlock(-[ISStoreIndex dataLock](self, "dataLock"));
  if (v4)
    *(_BYTE *)(v4 + 4) = 0;

}

- (void)_extend
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  -[ISStoreIndex _internalData](self, "_internalData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_ISStoreIndex_hashTableHeader");
  v5 = v4;
  if (!v4 || (v6 = *(_DWORD *)(v4 + 12)) == 0)
    v6 = 10000;
  v7 = ((double)v6 * 1.5);
  v8 = objc_msgSend(v3, "length");
  v9 = objc_msgSend(v3, "_ISStoreIndex_nodesOffset");
  objc_msgSend(MEMORY[0x1E0C99D50], "_ISMutableStoreIndex_mappedDataWithCapacity:additionalSize:", v7, (unint64_t)((double)(unint64_t)(v8 - v9) * 1.5));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __30__ISMutableStoreIndex__extend__block_invoke;
  v13[3] = &unk_1E5800948;
  v14 = v10;
  v11 = v10;
  objc_msgSend(v3, "_ISStoreIndex_enumerateValuesWithBock:", v13);
  -[ISStoreIndex indexFileURL](self, "indexFileURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_ISMutableStoreIndex_makeBackedByFileAtURL:", v12);

  os_unfair_lock_lock(-[ISStoreIndex dataLock](self, "dataLock"));
  -[ISStoreIndex _internalSetData:](self, "_internalSetData:", v11);
  os_unfair_lock_unlock(-[ISStoreIndex dataLock](self, "dataLock"));
  if (v5)
    *(_BYTE *)(v5 + 4) = 0;

}

uint64_t __30__ISMutableStoreIndex__extend__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = NodeStructGetDataSize(a2);
  if (result == 116)
    return objc_msgSend(*(id *)(a1 + 32), "_ISMutableStoreIndex_addValue:", a2 + 36);
  return result;
}

- (void)_extendData
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  vm_map_t v10;
  id v11;
  vm_address_t v12;
  vm_size_t v13;
  id v14;
  NSObject *v15;
  void *v16;

  -[ISStoreIndex _internalData](self, "_internalData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_ISStoreIndex_hashTableHeader");
  v5 = v4;
  if (!v4 || (v6 = *(_DWORD *)(v4 + 12)) == 0)
    v6 = 10000;
  v7 = objc_msgSend(v3, "length");
  v8 = objc_msgSend(v3, "_ISStoreIndex_nodesOffset");
  objc_msgSend(MEMORY[0x1E0C99D50], "_ISMutableStoreIndex_mappedDataWithCapacity:additionalSize:", v6, (unint64_t)((double)(unint64_t)(v7 - v8) * 1.5));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0C83DA0];
  v11 = objc_retainAutorelease(v3);
  v12 = objc_msgSend(v11, "bytes");
  v13 = objc_msgSend(v11, "length");
  v14 = objc_retainAutorelease(v9);
  if (vm_copy(v10, v12, v13, objc_msgSend(v14, "bytes")))
  {
    _ISDefaultLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[ISStoreMapTable _extendData].cold.1(v15);

  }
  else
  {
    -[ISStoreIndex indexFileURL](self, "indexFileURL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_ISMutableStoreIndex_makeBackedByFileAtURL:", v16);

    os_unfair_lock_lock(-[ISStoreIndex dataLock](self, "dataLock"));
    -[ISStoreIndex _internalSetData:](self, "_internalSetData:", v14);
    os_unfair_lock_unlock(-[ISStoreIndex dataLock](self, "dataLock"));
    if (v5)
      *(_BYTE *)(v5 + 4) = 0;
  }

}

- (unint64_t)initialCapacity
{
  return self->_initialCapacity;
}

- (OS_dispatch_queue)serialQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

@end
