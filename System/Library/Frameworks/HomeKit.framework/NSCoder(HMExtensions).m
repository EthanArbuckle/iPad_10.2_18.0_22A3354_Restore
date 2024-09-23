@implementation NSCoder(HMExtensions)

- (void)hm_encodeArrayOfConditionalObjects:()HMExtensions forKey:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "encodeObject:forKey:", v8, v7);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-$count"), v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "encodeInt32:forKey:", objc_msgSend(v6, "count"), v17);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v19;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v9);
        v15 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v14);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-$%d"), v7, v12 + v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "encodeConditionalObject:forKey:", v15, v16);

        ++v14;
      }
      while (v11 != v14);
      v12 = (v12 + v14);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

}

- (id)hm_decodeArrayOfConditionalObjects:()HMExtensions forKey:
{
  id v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v13;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-$count"), v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(a1, "decodeInt32ForKey:");
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v7);
  if (v7 >= 1)
  {
    v9 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-$%d"), v6, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "decodeObjectOfClass:forKey:", a3, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        objc_msgSend(v8, "addObject:", v11);

      v9 = (v9 + 1);
    }
    while (v7 != (_DWORD)v9);
  }

  return v8;
}

- (void)hm_encodeSetOfConditionalObjects:()HMExtensions forKey:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "encodeObject:forKey:", v8, v7);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-$count"), v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "encodeInt32:forKey:", objc_msgSend(v6, "count"), v17);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v19;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v9);
        v15 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v14);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-$%d"), v7, v12 + v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "encodeConditionalObject:forKey:", v15, v16);

        ++v14;
      }
      while (v11 != v14);
      v12 = (v12 + v14);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

}

- (id)hm_decodeSetOfConditionalObjects:()HMExtensions forKey:
{
  id v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v13;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-$count"), v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(a1, "decodeInt32ForKey:");
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", v7);
  if (v7 >= 1)
  {
    v9 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-$%d"), v6, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "decodeObjectOfClass:forKey:", a3, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        objc_msgSend(v8, "addObject:", v11);

      v9 = (v9 + 1);
    }
    while (v7 != (_DWORD)v9);
  }

  return v8;
}

@end
