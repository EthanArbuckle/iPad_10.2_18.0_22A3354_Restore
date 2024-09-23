@implementation NSAttributedString

uint64_t __94__NSAttributedString_NTKUtilities__NTKReplaceTimeDesignatorAttributesFrom_withDesignatorFont___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;

  if (a2)
  {
    v6 = result;
    objc_msgSend(*(id *)(result + 32), "removeAttribute:range:", *MEMORY[0x1E0C940F8], a3, a4);
    return objc_msgSend(*(id *)(v6 + 32), "addAttribute:value:range:", *MEMORY[0x1E0DC1138], *(_QWORD *)(v6 + 40), a3, a4);
  }
  return result;
}

void __108__NSAttributedString_NTKUtilities___attributedStringFromAttributesTable_defaultAttributes_format_arguments___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = a3 - *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    v12 = v7;
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0DC10F8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "length");
      objc_msgSend(*(id *)(a1 + 40), "replaceCharactersInRange:withAttributedString:", v8, a4, v10);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += a4 - v11;

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "setAttributes:range:", v12, v8, a4);
    }

    v7 = v12;
  }

}

uint64_t __108__NSAttributedString_NTKUtilities___attributedStringFromAttributesTable_defaultAttributes_format_arguments___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

void __108__NSAttributedString_NTKUtilities___attributedStringFromAttributesTable_defaultAttributes_format_arguments___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v8, "BOOLValue"))
          (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

@end
