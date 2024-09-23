@implementation NSArray(BW_AVAudioSelectableInputUtilities)

- (void)bw_builtInMicRouteDictionary
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (!v2)
    return 0;
  v3 = v2;
  v4 = *(_QWORD *)v11;
  v5 = *MEMORY[0x1E0D49EB8];
LABEL_4:
  v6 = 0;
  while (1)
  {
    if (*(_QWORD *)v11 != v4)
      objc_enumerationMutation(a1);
    v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v6);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = (void *)objc_msgSend(v7, "objectForKeyedSubscript:", v5);
      if (v8)
      {
        if ((objc_msgSend(v8, "isEqualToString:", CFSTR("MicrophoneBuiltIn")) & 1) != 0)
          return v7;
      }
    }
    if (v3 == ++v6)
    {
      v3 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v3)
        goto LABEL_4;
      return 0;
    }
  }
}

+ (uint64_t)bw_selectedInputsArrayForBuiltInMicRouteDictionary:()BW_AVAudioSelectableInputUtilities dataSource:polarPattern:
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v16[3];
  _QWORD v17[3];
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  if (a3
    && a4
    && (v7 = objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D49E88])) != 0
    && (v8 = v7, (v9 = objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D49DC0])) != 0))
  {
    v10 = v9;
    v11 = *MEMORY[0x1E0D49F08];
    v12 = *MEMORY[0x1E0D49EF8];
    v18[0] = *MEMORY[0x1E0D49F08];
    v18[1] = v12;
    v19[0] = v8;
    v19[1] = v9;
    v13 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
    if ((_DWORD)a5)
    {
      v16[0] = v11;
      v16[1] = v12;
      v17[0] = v8;
      v17[1] = v10;
      v16[2] = *MEMORY[0x1E0D49F00];
      v17[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a5);
      v14 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
    }
    else
    {
      v14 = 0;
    }
    return objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v13, v14, 0);
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
}

@end
