@implementation NSData(ISStoreIndex_HashTable)

- (uint64_t)_ISStoreIndex_enumerateValuesForUUID:()ISStoreIndex_HashTable bock:
{
  void (**v6)(id, uint64_t, _BYTE *);
  void *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  NSObject *v13;
  char v15;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v15 = 0;
  v7 = (void *)MEMORY[0x1AF423108]();
  v8 = objc_msgSend(a1, "_ISStoreIndex_nodeRefForKey:", *(_QWORD *)(a3 + 8) ^ *(_QWORD *)a3);
  v9 = objc_msgSend(a1, "_ISStoreIndex_nodeForRef:", v8);
  if (v9)
  {
    v10 = v9;
    v11 = HIDWORD(v8);
    while (objc_msgSend(a1, "_ISStoreIndex_checkNodeBounds:", v10))
    {
      if (*(_BYTE *)(v10 + 32) && !uuid_compare((const unsigned __int8 *)(v10 + 8), (const unsigned __int8 *)a3))
        v6[2](v6, v10, &v15);
      if (!v15)
      {
        v12 = *(unsigned int *)(v10 + 24);
        if (v12 <= v8)
        {
          if ((_DWORD)v12)
          {
            _ISDefaultLog();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 67109376;
              v17 = v8;
              v18 = 1024;
              v19 = v11;
              _os_log_fault_impl(&dword_1AA928000, v13, OS_LOG_TYPE_FAULT, "Cyclic node detected: (offset: %u, size: %u) ", buf, 0xEu);
            }

          }
          break;
        }
        v11 = *(unsigned int *)(v10 + 28);
        v10 = objc_msgSend(a1, "_ISStoreIndex_nodeForRef:", v12 | (v11 << 32));
        LODWORD(v8) = v12;
      }
      if (!v10 || v15)
        break;
    }
  }
  objc_autoreleasePoolPop(v7);

  return 1;
}

- (uint64_t)_ISStoreIndex_nodeForRef:()ISStoreIndex_HashTable
{
  unint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  NSObject *v11;

  if (!a3)
    return 0;
  v5 = objc_msgSend(a1, "length");
  v6 = objc_retainAutorelease(a1);
  v7 = objc_msgSend(v6, "bytes");
  v8 = objc_msgSend(v6, "_ISStoreIndex_nodesOffset") + a3;
  v9 = (uint64_t *)(v8 + v7);
  if (v8 + HIDWORD(a3) >= v5 || v9 == 0)
    return 0;
  if (*v9 != a3)
  {
    _ISDefaultLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[NSData(ISStoreIndex_HashTable) _ISStoreIndex_nodeForRef:].cold.1(v9, a3, v11);

    return 0;
  }
  return v9;
}

- (uint64_t)_ISStoreIndex_nodesOffset
{
  id v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  BOOL v5;

  v1 = objc_retainAutorelease(a1);
  v2 = objc_msgSend(v1, "bytes");
  result = objc_msgSend(v1, "_ISStoreIndex_hashTableHeader");
  if (result)
  {
    v4 = *(unsigned int *)(result + 12);
    if ((_DWORD)v4)
      v5 = v2 == 0;
    else
      v5 = 1;
    if (v5)
      return 0;
    else
      return 8 * v4 + 20;
  }
  return result;
}

- (uint64_t)_ISStoreIndex_hashTableHeader
{
  if ((unint64_t)objc_msgSend(a1, "length") < 0x15)
    return 0;
  else
    return objc_msgSend(objc_retainAutorelease(a1), "bytes");
}

- (uint64_t)_ISStoreIndex_checkNodeBounds:()ISStoreIndex_HashTable
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  id v11;
  uint64_t v12;
  id v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  int v18;
  unint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = objc_retainAutorelease(a1);
    if (objc_msgSend(v4, "bytes") <= a3)
    {
      v6 = objc_retainAutorelease(v4);
      v7 = objc_msgSend(v6, "bytes");
      if (objc_msgSend(v6, "length") + v7 <= a3)
      {
        _ISDefaultLog();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
          -[NSData(ISStoreIndex_HashTable) _ISStoreIndex_checkNodeBounds:].cold.4();
      }
      else
      {
        v8 = objc_retainAutorelease(v6);
        v9 = objc_msgSend(v8, "bytes");
        if (a3 + 36 >= objc_msgSend(v8, "length") + v9)
        {
          _ISDefaultLog();
          v5 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
            -[NSData(ISStoreIndex_HashTable) _ISStoreIndex_checkNodeBounds:].cold.3();
        }
        else
        {
          v10 = *(unsigned int *)(a3 + 4) + a3;
          v11 = objc_retainAutorelease(v8);
          v12 = objc_msgSend(v11, "bytes");
          if (v10 < objc_msgSend(v11, "length") + v12)
            return 1;
          _ISDefaultLog();
          v5 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
          {
            v14 = objc_retainAutorelease(v11);
            v15 = objc_msgSend(v14, "bytes");
            v16 = objc_msgSend(v14, "length");
            v17 = *(_DWORD *)(a3 + 4);
            v18 = 134218496;
            v19 = a3;
            v20 = 2048;
            v21 = v15 + v16;
            v22 = 1024;
            v23 = v17;
            _os_log_fault_impl(&dword_1AA928000, v5, OS_LOG_TYPE_FAULT, "Node exceeds expected bounds, %p vs %p node expected size=%d", (uint8_t *)&v18, 0x1Cu);
          }
        }
      }
    }
    else
    {
      _ISDefaultLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[NSData(ISStoreIndex_HashTable) _ISStoreIndex_checkNodeBounds:].cold.2();
    }
  }
  else
  {
    _ISDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[NSData(ISStoreIndex_HashTable) _ISStoreIndex_checkNodeBounds:].cold.1(v5);
  }

  return 0;
}

- (uint64_t)_ISStoreIndex_nodeRefForKey:()ISStoreIndex_HashTable
{
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  unint64_t v8;

  v5 = objc_msgSend(a1, "_ISStoreIndex_hashTable");
  result = objc_msgSend(a1, "_ISStoreIndex_hashTableHeader");
  if (result)
  {
    v7 = result;
    result = 0;
    if (v5)
    {
      v8 = *(unsigned int *)(v7 + 12);
      if ((_DWORD)v8)
        return *(_QWORD *)(v5 + 8 * (a3 % v8));
    }
  }
  return result;
}

- (uint64_t)_ISStoreIndex_hashTable
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  BOOL v5;

  objc_msgSend(a1, "length");
  v2 = objc_retainAutorelease(a1);
  v3 = objc_msgSend(v2, "bytes");
  v4 = objc_msgSend(v2, "_ISStoreIndex_hashTableHeader");
  if (v3)
    v5 = v4 == 0;
  else
    v5 = 1;
  if (v5)
    return 0;
  else
    return v3 + 20;
}

- (uint64_t)_ISStoreIndex_isValid
{
  uint64_t result;

  result = objc_msgSend(a1, "_ISStoreIndex_hashTableHeader");
  if (result)
    return *(_BYTE *)(result + 4) && *(_DWORD *)result == 11;
  return result;
}

- (void)_ISStoreIndex_enumerateValuesWithBock:()ISStoreIndex_HashTable
{
  void (**v4)(id, uint64_t, _BYTE *);
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  char v13;

  v4 = a3;
  v5 = objc_msgSend(a1, "_ISStoreIndex_hashTableHeader");
  v6 = objc_retainAutorelease(a1);
  v7 = objc_msgSend(v6, "bytes");
  v8 = objc_msgSend(v6, "_ISStoreIndex_nodesOffset");
  if (v5)
  {
    v9 = *(_DWORD *)(v5 + 8);
    v13 = 0;
    if ((v9 & 0x80000000) == 0)
    {
      v10 = v8 + v7;
      while (1)
      {
        v11 = (void *)MEMORY[0x1AF423108]();
        if ((objc_msgSend(v6, "_ISStoreIndex_checkNodeBounds:", v10) & 1) == 0)
          break;
        if (*(_BYTE *)(v10 + 32))
          v4[2](v4, v10, &v13);
        if (!v13)
          v10 += *(unsigned int *)(v10 + 4);
        objc_autoreleasePoolPop(v11);
        v12 = __OFSUB__(v9--, 1);
        if (v9 < 0 != v12 || v13)
          goto LABEL_13;
      }
      objc_autoreleasePoolPop(v11);
    }
  }
LABEL_13:

}

- (void)_ISStoreIndex_nodeForRef:()ISStoreIndex_HashTable .cold.1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 134218240;
  v5 = a2;
  v6 = 2048;
  v7 = v3;
  _os_log_debug_impl(&dword_1AA928000, log, OS_LOG_TYPE_DEBUG, "StoreIndex node ref missmatch ref: %llx node: %llx.", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)_ISStoreIndex_checkNodeBounds:()ISStoreIndex_HashTable .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1AA928000, log, OS_LOG_TYPE_FAULT, "Null nodePtr", v1, 2u);
}

- (void)_ISStoreIndex_checkNodeBounds:()ISStoreIndex_HashTable .cold.2()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_8();
  objc_msgSend(objc_retainAutorelease(v0), "bytes");
  OUTLINED_FUNCTION_4_0(&dword_1AA928000, v1, v2, "nodePtr preceeds bytes, %p vs %p", v3, v4, v5, v6, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)_ISStoreIndex_checkNodeBounds:()ISStoreIndex_HashTable .cold.3()
{
  NSObject *v0;
  id v1;
  __int16 v2;
  uint8_t v3[22];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_8();
  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(objc_retainAutorelease(v1), "bytes");
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_2_1();
  v4 = v2;
  v5 = 36;
  _os_log_fault_impl(&dword_1AA928000, v0, OS_LOG_TYPE_FAULT, "Node exceeds minimal bounds. %p vs %p struct size=%lu", v3, 0x20u);
  OUTLINED_FUNCTION_0_1();
}

- (void)_ISStoreIndex_checkNodeBounds:()ISStoreIndex_HashTable .cold.4()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_8();
  objc_msgSend(objc_retainAutorelease(v0), "bytes");
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4_0(&dword_1AA928000, v1, v2, "nodePtr exceeds bounds, %p vs %p", v3, v4, v5, v6, v7);
}

@end
