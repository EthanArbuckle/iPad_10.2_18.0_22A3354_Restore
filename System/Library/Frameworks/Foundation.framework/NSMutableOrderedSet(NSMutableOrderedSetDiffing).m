@implementation NSMutableOrderedSet(NSMutableOrderedSetDiffing)

- (uint64_t)applyDifference:()NSMutableOrderedSetDiffing
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _BYTE v10[128];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  result = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
  if (result)
  {
    v6 = result;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(a3);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
        if (objc_msgSend(v9, "changeType") == 1)
          objc_msgSend(a1, "removeObjectAtIndex:", objc_msgSend(v9, "index"));
        else
          objc_msgSend(a1, "insertObject:atIndex:", objc_msgSend(v9, "object"), objc_msgSend(v9, "index"));
        ++v8;
      }
      while (v6 != v8);
      result = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
      v6 = result;
    }
    while (result);
  }
  return result;
}

@end
