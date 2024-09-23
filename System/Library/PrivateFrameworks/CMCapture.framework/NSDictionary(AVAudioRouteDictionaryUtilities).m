@implementation NSDictionary(AVAudioRouteDictionaryUtilities)

- (void)bw_dataSourceDictionaryForDesiredMicOrientation:()AVAudioRouteDictionaryUtilities
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v5 = (void *)objc_msgSend(a1, "objectForKeyedSubscript:", *MEMORY[0x1E0D49E70]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (!v6)
    return 0;
  v7 = v6;
  v8 = *(_QWORD *)v15;
  v9 = *MEMORY[0x1E0D49DC8];
LABEL_5:
  v10 = 0;
  while (1)
  {
    if (*(_QWORD *)v15 != v8)
      objc_enumerationMutation(v5);
    v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v10);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = (void *)objc_msgSend(v11, "objectForKeyedSubscript:", v9);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v12, "intValue") == a3)
        return v11;
    }
    if (v7 == ++v10)
    {
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v11 = 0;
      if (v7)
        goto LABEL_5;
      return v11;
    }
  }
}

- (uint64_t)bw_containsBuiltInMicAsAnInput
{
  void *v2;
  void *v3;
  void *v4;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v2 = (void *)objc_msgSend(a1, "objectForKeyedSubscript:", *MEMORY[0x1E0D49E90]),
        objc_opt_class(),
        (objc_opt_isKindOfClass() & 1) != 0)
    && objc_msgSend(v2, "count")
    && (v3 = (void *)objc_msgSend(v2, "objectAtIndexedSubscript:", 0),
        objc_opt_class(),
        (objc_opt_isKindOfClass() & 1) != 0)
    && (v4 = (void *)objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D49EB8])) != 0)
  {
    return objc_msgSend(v4, "isEqualToString:", CFSTR("MicrophoneBuiltIn"));
  }
  else
  {
    return 0;
  }
}

@end
