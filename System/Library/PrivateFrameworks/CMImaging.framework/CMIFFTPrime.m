@implementation CMIFFTPrime

+ (id)getSupportedPrimeFactors
{
  return &unk_1E9514288;
}

+ (id)decomposeIntoPrimeFactors:(unsigned int)a3
{
  void *v4;
  signed int v5;
  void *v6;
  unint64_t v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t i;
  void *v20;
  id v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_opt_new();
  if ((int)a3 >= 2)
  {
    v5 = a3;
    while (1)
    {
      +[CMIFFTPrime getSupportedPrimeFactors](CMIFFTPrime, "getSupportedPrimeFactors");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v6, "count"))
        break;
      v7 = 0;
      v8 = 0;
      do
      {
        objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v5 % (int)objc_msgSend(v9, "intValue");

        if (!v10)
        {
          objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v5 /= (int)objc_msgSend(v11, "intValue");

          objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "arrayByAddingObject:", v12);
          v13 = objc_claimAutoreleasedReturnValue();

          v8 = 1;
          v4 = (void *)v13;
        }
        ++v7;
      }
      while (objc_msgSend(v6, "count") > v7);

      if (v5 < 2 || !v8)
        goto LABEL_12;
    }

  }
LABEL_12:
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v14 = v4;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v24;
    v18 = 1;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(v14);
        v18 *= objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "intValue", (_QWORD)v23);
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v16);
  }
  else
  {
    v18 = 1;
  }

  if (v18 == a3)
    v20 = v14;
  else
    v20 = 0;
  v21 = v20;

  return v21;
}

+ (id)collectPrimeFactorsIntoBins:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  +[CMIFFTPrime getSupportedPrimeFactors](CMIFFTPrime, "getSupportedPrimeFactors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v6 = 0;
    do
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E9513EE8, v7);

      ++v6;
    }
    while (objc_msgSend(v5, "count") > v6);
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v3;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKeyedSubscript:", v13, (_QWORD)v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v14, "intValue") + 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, v13);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  return v4;
}

@end
