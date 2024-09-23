@implementation PBCodable(FCAdditions)

- (id)logMessage
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "logMessageDictionaryFromProtobufDictionary:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)logMessageDictionaryFromProtobufDictionary:()FCAdditions
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  uint64_t v12;
  char v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v2, "allKeys", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v2, "objectForKeyedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        objc_msgSend(v2, "objectForKeyedSubscript:", v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(a1, "hexStringFromData:", v11);
          v12 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_opt_class();
          v13 = objc_opt_isKindOfClass();

          if ((v13 & 1) == 0)
            continue;
          objc_msgSend(v2, "objectForKeyedSubscript:", v8);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "logMessageDictionaryFromProtobufDictionary:", v11);
          v12 = objc_claimAutoreleasedReturnValue();
        }
        v14 = (void *)v12;
        objc_msgSend(v2, "setObject:forKeyedSubscript:", v12, v8);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }

  return v2;
}

- (__CFString)hexStringFromData:()FCAdditions
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 *v6;
  char *v7;
  char *v8;
  uint64_t v9;
  _BYTE *v10;
  unsigned int v11;
  __CFString *v12;

  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  if (v4)
  {
    v5 = v4;
    v6 = (unsigned __int8 *)objc_msgSend(objc_retainAutorelease(v3), "bytes");
    v7 = (char *)malloc_type_malloc((2 * v5) | 1, 0x100004077774924uLL);
    if (v7)
    {
      v8 = v7;
      v9 = 2 * v5;
      v10 = v7 + 1;
      do
      {
        v11 = *v6++;
        *(v10 - 1) = a0123456789abcd[(unint64_t)v11 >> 4];
        *v10 = a0123456789abcd[v11 & 0xF];
        v10 += 2;
        --v5;
      }
      while (v5);
      v7[v9] = 0;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v7);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      free(v8);
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    v12 = &stru_1E464BC40;
  }

  return v12;
}

@end
