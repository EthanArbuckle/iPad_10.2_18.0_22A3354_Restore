@implementation NSArray(CPLCopying)

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
    v2 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("["));
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

    -[__CFString appendString:](v2, "appendString:", CFSTR("\n]"));
  }
  else
  {
    v2 = CFSTR("[]");
  }
  return v2;
}

- (uint64_t)cplDeepCopy
{
  size_t v2;
  size_t v3;
  _OWORD *v4;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t j;
  _QWORD v10[5];
  _OWORD v11[5];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(a1, "count");
  if (!v2)
    return objc_msgSend(a1, "copy");
  v3 = v2;
  memset(v11, 0, sizeof(v11));
  if (v2 >= 0xB)
    v4 = malloc_type_calloc(v2, 8uLL, 0x80040B8603338uLL);
  else
    v4 = v11;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __34__NSArray_CPLCopying__cplDeepCopy__block_invoke;
  v10[3] = &__block_descriptor_40_e15_v32__0_8Q16_B24l;
  v10[4] = v4;
  objc_msgSend(a1, "enumerateObjectsUsingBlock:", v10);
  v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", v4, v3);
  for (i = 0; i != v3; ++i)
  {
    v8 = (void *)*((_QWORD *)v4 + i);
    *((_QWORD *)v4 + i) = 0;

  }
  if (v4 != v11)
    free(v4);
  for (j = 72; j != -8; j -= 8)

  return v6;
}

@end
