@implementation NSAttributedString

uint64_t __84__NSAttributedString_HUAdditions__hu_attributedStringWithDefaultAttributes_inRange___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "addAttributes:range:", a2, a3, a4);
}

void __84__NSAttributedString_HUAdditions__hu_attributedStringWithDefaultAttributes_inRange___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  objc_msgSend(v15, "image");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v15, "image");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "imageWithConfiguration:", *(_QWORD *)(a1 + 32));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setImage:", v9);

    objc_msgSend(*(id *)(a1 + 40), "attributesAtIndex:effectiveRange:", a3, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    v12 = *MEMORY[0x1E0CEA0D0];
    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0CEA0D0]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "mutableCopy");

    objc_msgSend(v14, "setLineBreakMode:", 1);
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, v12);
    objc_msgSend(*(id *)(a1 + 40), "setAttributes:range:", v11, a3, a4);

  }
}

void __78__NSAttributedString_HUAdditions__hu_safeAttributedStringWithHTML_attributes___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    v10 = *MEMORY[0x1E0CEA0C0];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v12, "isEqualToString:", v10))
        {
          objc_msgSend(v6, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "host");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v14)
            objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", v12, a3, a4);

        }
        else if ((objc_msgSend(*(id *)(a1 + 40), "containsObject:", v12) & 1) == 0)
        {
          objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", v12, a3, a4);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

}

@end
