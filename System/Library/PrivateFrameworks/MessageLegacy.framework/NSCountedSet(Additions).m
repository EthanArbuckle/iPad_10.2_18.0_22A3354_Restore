@implementation NSCountedSet(Additions)

- (uint64_t)mf_debugDescription
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a1, "count"));
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(a1);
        objc_msgSend(v2, "ef_insertObject:usingComparator:allowDuplicates:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\t\"%@\" : %lu"), *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6), objc_msgSend(a1, "countForObject:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6))), &__block_literal_global_20, 1);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{\n%@\n}"), objc_msgSend(v2, "componentsJoinedByString:", CFSTR(",\n")));
}

@end
