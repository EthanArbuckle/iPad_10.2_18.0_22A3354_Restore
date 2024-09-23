@implementation NSDictionary(SCNDeepCopy)

- (void)SCNMutableDeepCopy
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v1 = (void *)objc_msgSend(a1, "mutableCopy");
  v2 = (void *)objc_msgSend(v1, "allKeys");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        v8 = (void *)objc_msgSend(v1, "objectForKey:", v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v9 = (void *)objc_msgSend(v8, "SCNMutableDeepCopy");
          objc_msgSend(v1, "setValue:forKey:", v9, v7);

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }
  return v1;
}

@end
