@implementation NSCountedSet(NAAdditions)

- (id)na_mostCommonObject
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v1 = a1;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v2)
  {
    v3 = v2;
    v4 = 0;
    v5 = 0;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v1);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        v9 = objc_msgSend(v1, "countForObject:", v8, (_QWORD)v13);
        if (v9 > v5)
        {
          v10 = v9;
          v11 = v8;

          v4 = v11;
          v5 = v10;
        }
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v3);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
