@implementation AXLoadPunctuationTable

void __AXLoadPunctuationTable_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int16 v10;

  v10 = a3;
  if ((unint64_t)(a2 - 1) <= 2)
  {
    AXVOLocalizedStringForCharacterWithPrefix(a3, *(void **)(a1 + 32), CFSTR("UnicodeHex."));
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5 || (v5 = (uint64_t)AXCopyUnicodeDescriptionStringForCharacter(a3)) != 0)
    {
      v9 = (void *)v5;
      objc_msgSend(*(id *)(a1 + 40), "setObject:forIndex:", v5, a3);
    }
    else
    {
      AXVOLocalizedStringForCharacterWithPrefix(a3, *(void **)(a1 + 32), CFSTR("UnicodeHex.Math."));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
        goto LABEL_6;
      v9 = 0;
      _AXLogWithFacility();
    }
    v6 = v9;
LABEL_6:

    return;
  }
  if (a2)
  {
    if (a2 == 4)
      objc_msgSend(*(id *)(a1 + 40), "setObject:forIndex:", &stru_1E24CAB08, a3);
  }
  else
  {
    v7 = *(void **)(a1 + 40);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCharacters:length:", &v10, 1);
    objc_msgSend(v7, "setObject:forIndex:", v8, v10);

  }
}

void __AXLoadPunctuationTable_block_invoke_2(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x18D7864C8]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

void __AXLoadPunctuationTable_block_invoke_78(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v4;
  void *v5;

  if (a2 == 1)
  {
    v4 = a3;
    objc_msgSend(*(id *)(a1 + 32), "objectForIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      objc_msgSend(*(id *)(a1 + 32), "setObject:forIndex:", &stru_1E24CAB08, v4);
  }
}

@end
