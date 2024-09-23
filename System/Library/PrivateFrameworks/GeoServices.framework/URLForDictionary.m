@implementation URLForDictionary

uint64_t ___geo_URLForDictionary_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  int v6;
  uint64_t v7;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "hasPrefix:", CFSTR("_"));
  if (v6 == objc_msgSend(v5, "hasPrefix:", CFSTR("_")))
  {
    v7 = objc_msgSend(v4, "compare:", v5);
  }
  else if (v6)
  {
    v7 = 1;
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

void ___geo_URLForDictionary_block_invoke_256(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (v8)
    {
      v10 = v8;
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v17;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v17 != v13)
              objc_enumerationMutation(v10);
            (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) + 16))();
            ++v14;
          }
          while (v12 != v14);
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v12);
      }

    }
  }
  else
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB39D8]), "initWithName:value:", v7, v8);
    objc_msgSend(v9, "addObject:", v15);

  }
}

@end
