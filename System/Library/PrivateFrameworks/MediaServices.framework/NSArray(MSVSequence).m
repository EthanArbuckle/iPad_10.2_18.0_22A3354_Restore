@implementation NSArray(MSVSequence)

- (id)msv_compactMap:()MSVSequence
{
  void *v4;
  void *v5;

  v4 = (void *)MEMORY[0x1A1AFBD28](a3);
  objc_msgSend(a1, "msv_enumeratedCompactMap:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)msv_firstWhere:()MSVSequence
{
  uint64_t (**v4)(id, void *);
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = a1;
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((v4[2](v4, v9) & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)msv_flatMap:()MSVSequence
{
  id v4;
  uint64_t v5;
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
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
  v4 = a3;
  v5 = objc_msgSend(a1, "count");
  v6 = a1;
  v7 = (void (**)(id, _QWORD))v4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v7[2](v7, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v13));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObjectsFromArray:", v14, (_QWORD)v17);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  v15 = (void *)objc_msgSend(v8, "copy");
  return v15;
}

- (id)msv_map:()MSVSequence
{
  void *v4;
  void *v5;

  v4 = (void *)MEMORY[0x1A1AFBD28](a3);
  objc_msgSend(a1, "msv_enumeratedMap:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)msv_enumeratedCompactMap:()MSVSequence
{
  void (**v4)(id, void *, unint64_t);
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = (void *)objc_msgSend(a1, "mutableCopy");
  if (objc_msgSend(a1, "count"))
  {
    v6 = 0;
    v7 = 0;
    do
    {
      objc_msgSend(a1, "objectAtIndexedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v8, v7);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      if (v9)
      {
        if ((void *)v9 != v8)
          objc_msgSend(v5, "setObject:atIndexedSubscript:", v9, v7 - v6);
      }
      else
      {
        objc_msgSend(v5, "removeObjectAtIndex:", v7 - v6++);
      }

      ++v7;
    }
    while (v7 < objc_msgSend(a1, "count"));
  }
  v11 = (void *)objc_msgSend(v5, "copy");

  return v11;
}

- (id)msv_enumeratedMap:()MSVSequence
{
  void (**v4)(id, void *, unint64_t);
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_msgSend(a1, "mutableCopy");
  if (objc_msgSend(a1, "count"))
  {
    v6 = 0;
    do
    {
      objc_msgSend(a1, "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v7, v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 != v7)
        objc_msgSend(v5, "setObject:atIndexedSubscript:", v8, v6);

      ++v6;
    }
    while (v6 < objc_msgSend(a1, "count"));
  }
  v9 = (void *)objc_msgSend(v5, "copy");

  return v9;
}

- (id)msv_filter:()MSVSequence
{
  uint64_t (**v4)(id, void *);
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_msgSend(a1, "mutableCopy");
  if (objc_msgSend(a1, "count"))
  {
    v6 = 0;
    v7 = 0;
    do
    {
      objc_msgSend(a1, "objectAtIndexedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v4[2](v4, v8) & 1) == 0)
        objc_msgSend(v5, "removeObjectAtIndex:", v7 - v6++);

      ++v7;
    }
    while (v7 < objc_msgSend(a1, "count"));
  }
  v9 = (void *)objc_msgSend(v5, "copy");

  return v9;
}

- (id)msv_prefixUpToIndex:()MSVSequence
{
  id v5;

  if (objc_msgSend(a1, "count") == a3)
  {
    v5 = a1;
  }
  else
  {
    objc_msgSend(a1, "subarrayWithRange:", 0, a3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)msv_suffixFromIndex:()MSVSequence
{
  id v5;

  if (a3)
  {
    if (objc_msgSend(a1, "count") <= a3)
    {
      v5 = (id)MEMORY[0x1E0C9AA60];
    }
    else
    {
      objc_msgSend(a1, "subarrayWithRange:", a3, objc_msgSend(a1, "count") - a3);
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v5 = a1;
  }
  return v5;
}

- (uint64_t)msv_reduceIntoBool:()MSVSequence by:
{
  uint64_t (**v6)(id, uint64_t, _QWORD);
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = a1;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        a3 = v6[2](v6, a3 & 1, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  return a3;
}

- (float)msv_reduceIntoFloat:()MSVSequence by:
{
  float (**v6)(id, _QWORD, float);
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = a1;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        a2 = v6[2](v6, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11++), a2);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  return a2;
}

- (double)msv_reduceIntoCGFloat:()MSVSequence by:
{
  double (**v6)(id, _QWORD, double);
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = a1;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        a2 = v6[2](v6, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11++), a2);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  return a2;
}

- (double)msv_reduceIntoDouble:()MSVSequence by:
{
  double (**v6)(id, _QWORD, double);
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = a1;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        a2 = v6[2](v6, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11++), a2);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  return a2;
}

- (uint64_t)msv_reduceIntoInt:()MSVSequence by:
{
  uint64_t (**v6)(id, uint64_t, _QWORD);
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = a1;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        a3 = v6[2](v6, a3, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  return a3;
}

- (uint64_t)msv_reduceIntoInt32:()MSVSequence by:
{
  uint64_t (**v6)(id, uint64_t, _QWORD);
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = a1;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        a3 = v6[2](v6, a3, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  return a3;
}

- (uint64_t)msv_reduceIntoInt64:()MSVSequence by:
{
  uint64_t (**v6)(id, uint64_t, _QWORD);
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = a1;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        a3 = v6[2](v6, a3, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  return a3;
}

- (uint64_t)msv_reduceIntoUInt:()MSVSequence by:
{
  uint64_t (**v6)(id, uint64_t, _QWORD);
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = a1;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        a3 = v6[2](v6, a3, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  return a3;
}

- (uint64_t)msv_reduceIntoUInt32:()MSVSequence by:
{
  uint64_t (**v6)(id, uint64_t, _QWORD);
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = a1;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        a3 = v6[2](v6, a3, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  return a3;
}

- (uint64_t)msv_reduceIntoUInt64:()MSVSequence by:
{
  uint64_t (**v6)(id, uint64_t, _QWORD);
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = a1;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        a3 = v6[2](v6, a3, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  return a3;
}

- (id)msv_reduceIntoObject:()MSVSequence by:
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = a1;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  v11 = v8;
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v18;
    v11 = v8;
    do
    {
      v14 = 0;
      v15 = v11;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v9);
        v7[2](v7, v15, *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v14));
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        ++v14;
        v15 = v11;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

  return v11;
}

- (uint64_t)msv_reduceIntoBool:()MSVSequence enumeratedBy:
{
  uint64_t (**v6)(id, _QWORD, void *, unint64_t);
  unint64_t v7;
  void *v8;

  v6 = a4;
  if (objc_msgSend(a1, "count"))
  {
    v7 = 0;
    do
    {
      objc_msgSend(a1, "objectAtIndexedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      a3 = v6[2](v6, a3 & 1, v8, v7);

      ++v7;
    }
    while (v7 < objc_msgSend(a1, "count"));
  }

  return a3;
}

- (float)msv_reduceIntoFloat:()MSVSequence enumeratedBy:
{
  float (**v6)(id, void *, unint64_t, float);
  unint64_t v7;
  void *v8;

  v6 = a4;
  if (objc_msgSend(a1, "count"))
  {
    v7 = 0;
    do
    {
      objc_msgSend(a1, "objectAtIndexedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      a2 = v6[2](v6, v8, v7, a2);

      ++v7;
    }
    while (v7 < objc_msgSend(a1, "count"));
  }

  return a2;
}

- (double)msv_reduceIntoCGFloat:()MSVSequence enumeratedBy:
{
  double (**v6)(id, void *, unint64_t, double);
  unint64_t v7;
  void *v8;

  v6 = a4;
  if (objc_msgSend(a1, "count"))
  {
    v7 = 0;
    do
    {
      objc_msgSend(a1, "objectAtIndexedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      a2 = v6[2](v6, v8, v7, a2);

      ++v7;
    }
    while (v7 < objc_msgSend(a1, "count"));
  }

  return a2;
}

- (double)msv_reduceIntoDouble:()MSVSequence enumeratedBy:
{
  double (**v6)(id, void *, unint64_t, double);
  unint64_t v7;
  void *v8;

  v6 = a4;
  if (objc_msgSend(a1, "count"))
  {
    v7 = 0;
    do
    {
      objc_msgSend(a1, "objectAtIndexedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      a2 = v6[2](v6, v8, v7, a2);

      ++v7;
    }
    while (v7 < objc_msgSend(a1, "count"));
  }

  return a2;
}

- (uint64_t)msv_reduceIntoInt:()MSVSequence enumeratedBy:
{
  uint64_t (**v6)(id, uint64_t, void *, unint64_t);
  unint64_t v7;
  void *v8;

  v6 = a4;
  if (objc_msgSend(a1, "count"))
  {
    v7 = 0;
    do
    {
      objc_msgSend(a1, "objectAtIndexedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      a3 = v6[2](v6, a3, v8, v7);

      ++v7;
    }
    while (v7 < objc_msgSend(a1, "count"));
  }

  return a3;
}

- (uint64_t)msv_reduceIntoInt32:()MSVSequence enumeratedBy:
{
  uint64_t (**v6)(id, uint64_t, void *, unint64_t);
  unint64_t v7;
  void *v8;

  v6 = a4;
  if (objc_msgSend(a1, "count"))
  {
    v7 = 0;
    do
    {
      objc_msgSend(a1, "objectAtIndexedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      a3 = v6[2](v6, a3, v8, v7);

      ++v7;
    }
    while (v7 < objc_msgSend(a1, "count"));
  }

  return a3;
}

- (uint64_t)msv_reduceIntoInt64:()MSVSequence enumeratedBy:
{
  uint64_t (**v6)(id, uint64_t, void *, unint64_t);
  unint64_t v7;
  void *v8;

  v6 = a4;
  if (objc_msgSend(a1, "count"))
  {
    v7 = 0;
    do
    {
      objc_msgSend(a1, "objectAtIndexedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      a3 = v6[2](v6, a3, v8, v7);

      ++v7;
    }
    while (v7 < objc_msgSend(a1, "count"));
  }

  return a3;
}

- (uint64_t)msv_reduceIntoUInt:()MSVSequence enumeratedBy:
{
  uint64_t (**v6)(id, uint64_t, void *, unint64_t);
  unint64_t v7;
  void *v8;

  v6 = a4;
  if (objc_msgSend(a1, "count"))
  {
    v7 = 0;
    do
    {
      objc_msgSend(a1, "objectAtIndexedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      a3 = v6[2](v6, a3, v8, v7);

      ++v7;
    }
    while (v7 < objc_msgSend(a1, "count"));
  }

  return a3;
}

- (uint64_t)msv_reduceIntoUInt32:()MSVSequence enumeratedBy:
{
  uint64_t (**v6)(id, uint64_t, void *, unint64_t);
  unint64_t v7;
  void *v8;

  v6 = a4;
  if (objc_msgSend(a1, "count"))
  {
    v7 = 0;
    do
    {
      objc_msgSend(a1, "objectAtIndexedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      a3 = v6[2](v6, a3, v8, v7);

      ++v7;
    }
    while (v7 < objc_msgSend(a1, "count"));
  }

  return a3;
}

- (uint64_t)msv_reduceIntoUInt64:()MSVSequence enumeratedBy:
{
  uint64_t (**v6)(id, uint64_t, void *, unint64_t);
  unint64_t v7;
  void *v8;

  v6 = a4;
  if (objc_msgSend(a1, "count"))
  {
    v7 = 0;
    do
    {
      objc_msgSend(a1, "objectAtIndexedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      a3 = v6[2](v6, a3, v8, v7);

      ++v7;
    }
    while (v7 < objc_msgSend(a1, "count"));
  }

  return a3;
}

- (id)msv_reduceIntoObject:()MSVSequence enumeratedBy:
{
  id v6;
  void (**v7)(id, void *, void *, unint64_t);
  id v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  v9 = v8;
  if (objc_msgSend(a1, "count"))
  {
    v10 = 0;
    v11 = v8;
    do
    {
      objc_msgSend(a1, "objectAtIndexedSubscript:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v11, v12, v10);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      ++v10;
      v11 = v9;
    }
    while (v10 < objc_msgSend(a1, "count"));
  }

  return v9;
}

@end
