@implementation NSDictionary(SCNExtensions)

- (unint64_t)SCN_safeHash
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v2 = (void *)objc_msgSend(a1, "allKeys");
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v2);
        v5 ^= (v5 << 6) + 2654435769u + (v5 >> 2) + objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "hash");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = (void *)objc_msgSend(a1, "allValues", 0);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      for (j = 0; j != v10; ++j)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v5 ^= (v5 << 6) + 2654435769u + (v5 >> 2) + objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * j), "hash");
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v10);
  }
  return v5;
}

@end
