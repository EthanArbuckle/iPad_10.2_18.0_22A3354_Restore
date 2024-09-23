@implementation NSArray(PowerSet)

- (uint64_t)powerSet
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(a1, "count");
  if (!v2)
    return objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", objc_msgSend(MEMORY[0x1E0C99D20], "array"));
  v3 = v2;
  v4 = objc_msgSend(a1, "lastObject");
  v5 = (void *)objc_msgSend((id)objc_msgSend(a1, "subarrayWithRange:", 0, v3 - 1), "powerSet");
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v5);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v5);
        objc_msgSend(v6, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10++), "arrayByAddingObject:", v4));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }
  return objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v6);
}

@end
