@implementation NSArray(SCNDeepCopy)

- (void)SCNMutableDeepCopy
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(a1, "mutableCopy");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      v8 = v5;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(a1);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v10 = (void *)objc_msgSend(v9, "SCNMutableDeepCopy");
          objc_msgSend(v2, "replaceObjectAtIndex:withObject:", v8 + v7, v10);

        }
        ++v7;
      }
      while (v4 != v7);
      v4 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v5 = v8 + v7;
    }
    while (v4);
  }
  return v2;
}

@end
