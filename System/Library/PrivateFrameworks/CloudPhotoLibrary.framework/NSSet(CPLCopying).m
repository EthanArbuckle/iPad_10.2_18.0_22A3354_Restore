@implementation NSSet(CPLCopying)

- (__CFString)cplFullDescription
{
  __CFString *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1, "count"))
  {
    v2 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("{("));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    obj = a1;
    v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v3)
    {
      v4 = v3;
      v5 = 1;
      v6 = *(_QWORD *)v16;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v16 != v6)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v7), "cplFullDescription");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "componentsSeparatedByString:", CFSTR("\n"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "componentsJoinedByString:", CFSTR("\n  "));
          v10 = objc_claimAutoreleasedReturnValue();
          v11 = (void *)v10;
          if ((v5 & 1) != 0)
            v12 = CFSTR("\n  %@");
          else
            v12 = CFSTR(",\n  %@");
          -[__CFString appendFormat:](v2, "appendFormat:", v12, v10);

          v5 = 0;
          ++v7;
        }
        while (v4 != v7);
        v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        v5 = 0;
      }
      while (v4);
    }

    -[__CFString appendString:](v2, "appendString:", CFSTR("\n)}"));
  }
  else
  {
    v2 = CFSTR("{()}");
  }
  return v2;
}

@end
