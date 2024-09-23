@implementation GEOCanonicalResourceNameForVersionedName

void __GEOCanonicalResourceNameForVersionedName_block_invoke()
{
  id v0;
  id v1;
  id v2;
  uint64_t i;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v1 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  for (i = 2; i != 4; ++i)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("@%lux"), i);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "addObject:", v4);

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("@%.1fx"), 0x4004CCCCC0000000);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObject:", v5);
  objc_msgSend(v1, "addObject:", v5);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v1;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v10), "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), CFSTR("_"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  v12 = (void *)qword_1ECDBBF10;
  qword_1ECDBBF10 = (uint64_t)v0;
  v13 = v0;

  v14 = (void *)qword_1ECDBBF18;
  qword_1ECDBBF18 = (uint64_t)v6;
  v15 = v6;

  v16 = (void *)qword_1ECDBBF20;
  qword_1ECDBBF20 = (uint64_t)v2;

}

void __GEOCanonicalResourceNameForVersionedName_block_invoke_2()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("-"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECDBBF30;
  qword_1ECDBBF30 = v0;

  objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invertedSet");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ECDBBF38;
  qword_1ECDBBF38 = v2;

}

@end
