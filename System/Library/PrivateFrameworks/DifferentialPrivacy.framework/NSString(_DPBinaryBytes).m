@implementation NSString(_DPBinaryBytes)

- (id)dp_binaryBytesData
{
  void *v2;
  unint64_t i;
  int v4;
  char *v5;
  void *v6;
  char v8;
  char v9;

  objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "length"))
  {
    for (i = 0; i < objc_msgSend(a1, "length"); ++i)
    {
      v4 = objc_msgSend(a1, "characterAtIndex:", i);
      if (v4 == 49)
      {
        v8 = 1;
        v5 = &v8;
      }
      else
      {
        if (v4 != 48)
        {
          v6 = 0;
          goto LABEL_10;
        }
        v9 = 0;
        v5 = &v9;
      }
      objc_msgSend(v2, "appendBytes:length:", v5, 1);
    }
  }
  v6 = (void *)objc_msgSend(v2, "copy");
LABEL_10:

  return v6;
}

- (id)dp_floatVectorBytesData
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  int v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D8256B78]();
  objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setNumberStyle:", 1);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(","));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "componentsSeparatedByCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v4, "numberFromString:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v10));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v11)
        {

          v14 = 0;
          goto LABEL_11;
        }
        v12 = v11;
        v16 = 0;
        objc_msgSend(v11, "floatValue");
        v16 = v13;
        objc_msgSend(v3, "appendBytes:length:", &v16, 4);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v8)
        continue;
      break;
    }
  }

  v14 = (void *)objc_msgSend(v3, "copy");
LABEL_11:

  objc_autoreleasePoolPop(v2);
  return v14;
}

@end
