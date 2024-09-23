@implementation NSMutableAttributedString

void __73__NSMutableAttributedString_CKUtilities____ck_removeAllAttributesExcept___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v12) & 1) == 0)
          objc_msgSend(*(id *)(a1 + 40), "removeAttribute:range:", v12, a3, a4);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

void __64__NSMutableAttributedString_CKUtilities____ck_filterAttributes___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v8;
  _QWORD v9[5];
  id v10;
  uint64_t v11;
  uint64_t v12;

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__NSMutableAttributedString_CKUtilities____ck_filterAttributes___block_invoke_2;
  v9[3] = &unk_1E274E3E0;
  v8 = *(id *)(a1 + 40);
  v11 = a3;
  v12 = a4;
  v9[4] = *(_QWORD *)(a1 + 32);
  v10 = v8;
  objc_msgSend(a2, "enumerateKeysAndObjectsUsingBlock:", v9);

}

void __64__NSMutableAttributedString_CKUtilities____ck_filterAttributes___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))() & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", v3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

void __82__NSMutableAttributedString_TextEffects__ck_toggleTextEffectNamed_range_getAdded___block_invoke(_QWORD *a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  id v9;
  BOOL v11;
  id v12;

  v9 = a2;
  if (v9)
  {
    v12 = v9;
    v11 = objc_msgSend(v9, "unsignedIntegerValue") != a1[5] || a1[6] != a3 || a1[7] != a4;
    v9 = v12;
  }
  else
  {
    v11 = 1;
  }
  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = v11;
  *a5 = 1;

}

uint64_t __80__NSMutableAttributedString_TextEffects__ck_removeAnimatedTextEffectsFromRange___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "removeAttribute:range:", *MEMORY[0x1E0D393F0], a3, a4);
  return result;
}

uint64_t __80__NSMutableAttributedString_TextEffects__ck_removeAnimatedTextEffectsFromRange___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "removeAttribute:range:", *MEMORY[0x1E0DC11D0], a3, a4);
  return result;
}

void __105__NSMutableAttributedString_TextEffects___ck_intersectingTextAnimationOnRange_getExistingAnimationRange___block_invoke(NSRange *a1, void *a2, NSUInteger a3, NSUInteger a4, _BYTE *a5)
{
  uint64_t v10;
  id v11;
  NSRange v12;

  v11 = a2;
  v12.location = a3;
  v12.length = a4;
  if (NSIntersectionRange(v12, a1[48]).length)
  {
    v10 = *(_QWORD *)(a1[2].location + 8);
    *(_QWORD *)(v10 + 32) = a3;
    *(_QWORD *)(v10 + 40) = a4;
    objc_storeStrong((id *)(*(_QWORD *)(a1[2].length + 8) + 40), a2);
    *a5 = 1;
  }

}

void __71__NSMutableAttributedString_TextEffects__ck_applyTextEffectType_range___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", *MEMORY[0x1E0D381F0], a3, a4);
    v7 = *MEMORY[0x1E0DC1140];
    objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", *MEMORY[0x1E0DC1140], a3, a4);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v11, "theme");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "entryFieldTextColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addAttribute:value:range:", v7, v10, a3, a4);

  }
}

void __71__NSMutableAttributedString_TextEffects__ck_applyTextEffectType_range___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  id v8;

  if (a2)
  {
    v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v7, a3 - v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3 + a4;

  }
}

void __72__NSMutableAttributedString_TextEffects__ck_addTextStyle_options_range___block_invoke(uint64_t a1, void *a2, NSUInteger a3, NSUInteger a4)
{
  id v7;
  NSRange v8;

  v7 = a2;
  if (v7)
  {
    v8.location = a3;
    v8.length = a4;
    if (NSIntersectionRange(v8, *(NSRange *)(a1 + 40)).length)
      objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", *MEMORY[0x1E0D393F0], a3, a4);
  }

}

void __72__NSMutableAttributedString_TextEffects__ck_addTextStyle_options_range___block_invoke_2(uint64_t a1, void *a2, NSUInteger a3, NSUInteger a4)
{
  id v7;
  NSRange v8;

  v7 = a2;
  if (v7)
  {
    v8.location = a3;
    v8.length = a4;
    if (NSIntersectionRange(v8, *(NSRange *)(a1 + 40)).length)
      objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", *MEMORY[0x1E0DC11D0], a3, a4);
  }

}

void __72__NSMutableAttributedString_TextEffects__ck_addTextStyle_options_range___block_invoke_78(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  if (a2)
  {
    objc_msgSend(a2, "ck_fontByAddingSymbolicTrait:", 2);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 32);
    v5 = *MEMORY[0x1E0DC1138];
  }
  else
  {
    v6 = *(void **)(a1 + 32);
    v7 = *MEMORY[0x1E0DC1138];
    objc_msgSend(MEMORY[0x1E0DC1350], "ck_boldBalloonFont");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = v6;
    v5 = v7;
  }
  v8 = (id)v3;
  objc_msgSend(v4, "addAttribute:value:range:", v5);

}

void __72__NSMutableAttributedString_TextEffects__ck_addTextStyle_options_range___block_invoke_2_81(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  if (a2)
  {
    objc_msgSend(a2, "ck_fontByAddingSymbolicTrait:", 1);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 32);
    v5 = *MEMORY[0x1E0DC1138];
  }
  else
  {
    v6 = *(void **)(a1 + 32);
    v7 = *MEMORY[0x1E0DC1138];
    objc_msgSend(MEMORY[0x1E0DC1350], "ck_italicBalloonFont");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = v6;
    v5 = v7;
  }
  v8 = (id)v3;
  objc_msgSend(v4, "addAttribute:value:range:", v5);

}

void __62__NSMutableAttributedString_Helper__ck_removeAttributesNotIn___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  if (objc_msgSend(v7, "count"))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
          if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v13, (_QWORD)v14) & 1) == 0)
            objc_msgSend(*(id *)(a1 + 40), "removeAttribute:range:", v13, a3, a4);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v10);
    }

  }
}

@end
