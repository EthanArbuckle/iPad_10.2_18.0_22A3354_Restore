@implementation NSData(ISMutableStoreIndex_HashTable)

+ (id)_ISMutableStoreIndex_mappedDataWithCapacity:()ISMutableStoreIndex_HashTable additionalSize:
{
  int v4;
  size_t v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  id v10;
  uint64_t v11;

  v4 = a3;
  v5 = (a4 + 40 * a3 + *MEMORY[0x1E0C85AD8] + 19) & -*MEMORY[0x1E0C85AD8];
  v6 = mmap(0, v5, 3, 4097, 0, 0);
  v7 = 0;
  if (v6 == (void *)-1)
    v8 = 0;
  else
    v8 = v6;
  if (v5)
    v9 = v8 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    v10 = objc_alloc(MEMORY[0x1E0C99D50]);
    v7 = (void *)objc_msgSend(v10, "initWithBytesNoCopy:length:deallocator:", v8, v5, *MEMORY[0x1E0CB2910]);
  }
  v11 = objc_msgSend(v7, "_ISStoreIndex_hashTableHeader");
  if (v11)
  {
    *(_DWORD *)v11 = 11;
    *(_BYTE *)(v11 + 4) = 1;
    *(_DWORD *)(v11 + 12) = v4;
  }
  return v7;
}

- (uint64_t)_ISStoreIndex_addNodeWithSize:()ISMutableStoreIndex_HashTable
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t *v12;

  result = objc_msgSend(a1, "_ISStoreIndex_hashTableHeader");
  if (result)
  {
    v6 = a3 + 36;
    v7 = *(unsigned int *)(result + 16);
    *(_DWORD *)(result + 16) = v7 + a3 + 36;
    v8 = objc_msgSend(a1, "length");
    v9 = objc_retainAutorelease(a1);
    v10 = objc_msgSend(v9, "bytes");
    v11 = objc_msgSend(v9, "_ISStoreIndex_nodesOffset");
    v12 = (unint64_t *)(v11 + v7 + v10);
    if (v11 + v7 + (unint64_t)v6 < v8 && v12 != 0)
      *v12 = v7 | ((unint64_t)v6 << 32);
    return v7 | (v6 << 32);
  }
  return result;
}

- (uint64_t)_ISMutableStoreIndex_addValue:()ISMutableStoreIndex_HashTable
{
  return objc_msgSend(a1, "_ISMutableStoreIndex_addValue:size:forUUID:", a3, 116, a3);
}

- (uint64_t)_ISMutableStoreIndex_addValue:()ISMutableStoreIndex_HashTable size:forUUID:
{
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t *v18;
  NSObject *v19;

  result = objc_msgSend(a1, "_ISStoreIndex_hashTableHeader");
  if (result)
  {
    v10 = result;
    v11 = objc_msgSend(a1, "_ISStoreIndex_addNodeWithSize:", a4);
    result = objc_msgSend(a1, "_ISStoreIndex_nodeForRef:", v11);
    if (result)
    {
      v12 = result;
      *(_QWORD *)result = v11;
      uuid_copy((unsigned __int8 *)(result + 8), (const unsigned __int8 *)a5);
      *(_BYTE *)(v12 + 32) = 0;
      *(_QWORD *)(v12 + 24) = 0;
      memcpy((void *)(v12 + 36), a3, a4);
      v13 = *(_QWORD *)(a5 + 8) ^ *(_QWORD *)a5;
      v14 = objc_msgSend(a1, "_ISStoreIndex_nodeRefForKey:", v13);
      if (v14)
      {
        v15 = v14;
        result = objc_msgSend(a1, "_ISStoreIndex_nodeForRef:", v14);
        if (!result)
          return result;
        v16 = v15;
        while (1)
        {
          v17 = *(_QWORD *)(result + 24);
          if (!v17)
          {
            v18 = (uint64_t *)(result + 24);
            goto LABEL_17;
          }
          if (v16 >= v17)
            break;
          result = objc_msgSend(a1, "_ISStoreIndex_nodeForRef:", v17);
          HIDWORD(v15) = HIDWORD(v17);
          v16 = v17;
          if (!result)
            return result;
        }
        v18 = (uint64_t *)(result + 24);
        if ((_DWORD)v17)
        {
          _ISDefaultLog();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
            -[NSData(ISMutableStoreIndex_HashTable) _ISMutableStoreIndex_addValue:size:forUUID:].cold.1(v16, SHIDWORD(v15), v19);

        }
LABEL_17:
        *v18 = v11;
      }
      else if ((objc_msgSend(a1, "_ISStoreIndex_setNodeRef:forKey:", v11, v13) & 1) == 0)
      {
        return 0;
      }
      result = 1;
      *(_BYTE *)(v12 + 32) = 1;
      ++*(_DWORD *)(v10 + 8);
    }
  }
  return result;
}

- (void)_ISMutableStoreIndex_addValue:()ISMutableStoreIndex_HashTable size:forUUID:.cold.1(int a1, int a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109376;
  v3[1] = a1;
  v4 = 1024;
  v5 = a2;
  _os_log_fault_impl(&dword_1AA928000, log, OS_LOG_TYPE_FAULT, "Cyclic node detected: (offset: %u, size: %u) ", (uint8_t *)v3, 0xEu);
  OUTLINED_FUNCTION_2();
}

@end
