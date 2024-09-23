@implementation NSData(ISMutableStoreIndex_HashTable_Internal)

- (uint64_t)_ISStoreIndex_setNodeRef:()ISMutableStoreIndex_HashTable_Internal forKey:
{
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  unint64_t v10;

  v7 = objc_msgSend(a1, "_ISStoreIndex_hashTable");
  result = objc_msgSend(a1, "_ISStoreIndex_hashTableHeader");
  if (result)
  {
    v9 = result;
    result = 0;
    if (v7)
    {
      v10 = *(unsigned int *)(v9 + 12);
      if ((_DWORD)v10)
      {
        *(_QWORD *)(v7 + 8 * (a4 % v10)) = a3;
        return 1;
      }
    }
  }
  return result;
}

@end
