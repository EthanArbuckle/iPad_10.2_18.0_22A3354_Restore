@implementation NSTextLayoutManager

uint64_t __90__NSTextLayoutManager_Helper__enumerateTextParagraphsFromLocation_options_usingBlock_emk___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "textElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v4 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  else
    v4 = 1;

  return v4;
}

uint64_t __72__NSTextLayoutManager_Helper__enumerateAllTextParagraphsUsingBlock_emk___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return 1;
}

uint64_t __81__NSTextLayoutManager_Helper___enumerateTextLineFragmentsInTextRange_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  NSUInteger v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSUInteger v15;
  uint64_t i;
  NSUInteger length;
  NSRange v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v26;
  id v27;
  id obj;
  void *v29;
  uint64_t v30;
  NSUInteger range2;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;
  NSRange v39;
  NSRange v40;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "rangeInElement");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "textRangeByIntersectingWithTextRange:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && (objc_msgSend(v4, "isEmpty") & 1) == 0)
  {
    v7 = *(void **)(a1 + 40);
    objc_msgSend(v29, "location");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "location");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "offsetFromLocation:toLocation:", v8, v9);

    v11 = *(void **)(a1 + 40);
    objc_msgSend(v29, "location");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endLocation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v11, "offsetFromLocation:toLocation:", v12, v13);

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    objc_msgSend(v3, "textLineFragments");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v32)
    {
      v26 = v5;
      v27 = v3;
      v15 = 0;
      range2 = v14 - v10;
      v30 = *(_QWORD *)v34;
      while (2)
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(_QWORD *)v34 != v30)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "characterRange");
          length = v39.length;
          v39.location = v15;
          v40.location = v10;
          v40.length = range2;
          v18 = NSIntersectionRange(v39, v40);
          if (v18.length)
          {
            v19 = *(void **)(a1 + 40);
            objc_msgSend(v29, "location");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "locationFromLocation:withOffset:", v20, v18.location);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(*(id *)(a1 + 40), "locationFromLocation:withOffset:", v21, v18.length);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC1318]), "initWithLocation:endLocation:", v21, v22);
            v24 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

            if (!v24)
            {
              v6 = 1;
              goto LABEL_15;
            }
          }
          v15 += length;
          ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
        }
        v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        if (v32)
          continue;
        break;
      }
      v6 = 0;
LABEL_15:
      v5 = v26;
      v3 = v27;
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 1;
  }

  return v6 ^ 1u;
}

void __69__NSTextLayoutManager_Helper___enumerateAllTokenListsUsingBlock_emk___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;

  v3 = a2;
  objc_msgSend(v3, "attributedString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "elementRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__NSTextLayoutManager_Helper___enumerateAllTokenListsUsingBlock_emk___block_invoke_2;
  v8[3] = &unk_1EA258A40;
  v6 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v10 = v5;
  v11 = *(id *)(a1 + 48);
  v7 = v5;
  objc_msgSend(v4, "_enumerateTokenListsInReverse:handler_emk:", 0, v8);

}

void __69__NSTextLayoutManager_Helper___enumerateAllTokenListsUsingBlock_emk___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v7 = *(void **)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v9 = a2;
  objc_msgSend(v8, "location");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "location");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v7, "offsetFromLocation:toLocation:", v10, v11);

  v13 = v12 + a3;
  v14 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "location");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "locationFromLocation:withOffset:", v15, v13);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "locationFromLocation:withOffset:", v18, a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC1318]), "initWithLocation:endLocation:", v18, v16);
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

uint64_t __54__NSTextLayoutManager_Helper__animatingGlyphCount_emk__block_invoke(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += objc_msgSend(a2, "animatingGlyphCount_emk");
  return 1;
}

@end
