@implementation NSAttributedString(Shared)

- (void)ic_enumerateAttachmentsInContext:()Shared usingBlock:
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "ic_enumerateAttachmentsInContext:range:usingBlock:", v7, 0, objc_msgSend(a1, "length"), v6);

}

- (uint64_t)ic_enumerateAttachmentsInContext:()Shared range:usingBlock:
{
  return objc_msgSend(a1, "ic_enumerateAttachmentsInContext:range:options:usingBlock:", a3, a4, a5, 0, a6);
}

- (void)ic_enumerateAttachmentsInContext:()Shared range:options:usingBlock:
{
  id v12;
  id v13;
  NSUInteger v14;
  NSRange v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  NSRange v21;
  NSRange v22;

  v12 = a3;
  v13 = a7;
  v22.location = objc_msgSend(a1, "ic_range");
  v22.length = v14;
  v21.location = a4;
  v21.length = a5;
  v15 = NSIntersectionRange(v21, v22);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __88__NSAttributedString_Shared__ic_enumerateAttachmentsInContext_range_options_usingBlock___block_invoke;
  v18[3] = &unk_1E76CD268;
  v19 = v12;
  v20 = v13;
  v16 = v13;
  v17 = v12;
  objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("NSAttachment"), v15.location, v15.length, a6, v18);

}

- (void)ic_enumerateInlineAttachmentsInContext:()Shared range:options:usingBlock:
{
  id v12;
  id v13;
  NSUInteger v14;
  NSRange v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  NSRange v21;
  NSRange v22;

  v12 = a3;
  v13 = a7;
  v22.location = objc_msgSend(a1, "ic_range");
  v22.length = v14;
  v21.location = a4;
  v21.length = a5;
  v15 = NSIntersectionRange(v21, v22);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __94__NSAttributedString_Shared__ic_enumerateInlineAttachmentsInContext_range_options_usingBlock___block_invoke;
  v18[3] = &unk_1E76CD268;
  v19 = v12;
  v20 = v13;
  v16 = v13;
  v17 = v12;
  objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("NSAttachment"), v15.location, v15.length, a6, v18);

}

- (id)abstractAttachmentsInContext:()Shared range:options:
{
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;

  v10 = (void *)MEMORY[0x1E0C99DE8];
  v11 = a3;
  objc_msgSend(v10, "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __73__NSAttributedString_Shared__abstractAttachmentsInContext_range_options___block_invoke;
  v16[3] = &unk_1E76C80E8;
  v17 = v12;
  v13 = v12;
  objc_msgSend(a1, "ic_enumerateAbstractAttachmentsInContext:range:options:usingBlock:", v11, a4, a5, a6, v16);

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)ic_enumerateAbstractAttachmentsInContext:()Shared range:options:usingBlock:
{
  id v12;
  id v13;
  NSUInteger v14;
  NSRange v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  NSRange v21;
  NSRange v22;

  v12 = a3;
  v13 = a7;
  v22.location = objc_msgSend(a1, "ic_range");
  v22.length = v14;
  v21.location = a4;
  v21.length = a5;
  v15 = NSIntersectionRange(v21, v22);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __96__NSAttributedString_Shared__ic_enumerateAbstractAttachmentsInContext_range_options_usingBlock___block_invoke;
  v18[3] = &unk_1E76CD268;
  v19 = v12;
  v20 = v13;
  v16 = v13;
  v17 = v12;
  objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("NSAttachment"), v15.location, v15.length, a6, v18);

}

- (id)ic_attributedStringByRefreshingParagraphStyleUUIDs
{
  void *v1;
  __CFString *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithAttributedString:", a1);
  v2 = ICTTAttributeNameParagraphStyle;
  v3 = objc_msgSend(v1, "ic_range");
  v5 = v4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __80__NSAttributedString_Shared__ic_attributedStringByRefreshingParagraphStyleUUIDs__block_invoke;
  v9[3] = &unk_1E76CD290;
  v10 = v1;
  v6 = v1;
  objc_msgSend(v6, "enumerateAttribute:inRange:options:usingBlock:", v2, v3, v5, 0, v9);
  v7 = (void *)objc_msgSend(v6, "copy");

  return v7;
}

- (uint64_t)ic_attributedStringByFlatteningInlineAttachmentsWithContext:()Shared flattenUnsupportedInlineattachmentsOnly:
{
  return objc_msgSend(a1, "ic_attributedStringByFlatteningInlineAttachmentsWithContext:flattenUnsupportedInlineAttachmentsOnly:updateRangeValueToObjectMapBlock:replacementAttributedStringBlock:", a3, a4, &__block_literal_global_48, &__block_literal_global_64);
}

- (uint64_t)ic_attributedStringByFlatteningInlineAttachmentsWithContext:()Shared
{
  return objc_msgSend(a1, "ic_attributedStringByFlatteningInlineAttachmentsWithContext:flattenUnsupportedInlineattachmentsOnly:", a3, 0);
}

- (uint64_t)ic_attributedStringByFlatteningUnsupportedInlineAttachmentsWithContext:()Shared
{
  return objc_msgSend(a1, "ic_attributedStringByFlatteningInlineAttachmentsWithContext:flattenUnsupportedInlineattachmentsOnly:", a3, 1);
}

- (id)ic_attributedStringByFlatteningInlineAttachmentsWithContext:()Shared flattenUnsupportedInlineAttachmentsOnly:updateRangeValueToObjectMapBlock:replacementAttributedStringBlock:
{
  id v10;
  id v11;
  void (**v12)(id, void *, void *);
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  __CFString *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id v45;
  id v46;
  void (**v47)(id, void *, void *);
  uint64_t v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  id obj;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD v58[4];
  id v59;
  id v60;
  id v61;
  id v62;
  char v63;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithAttributedString:", a1);
  v14 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v16 = objc_msgSend(v13, "length");
  v58[0] = MEMORY[0x1E0C809B0];
  v58[1] = 3221225472;
  v58[2] = __196__NSAttributedString_Shared__ic_attributedStringByFlatteningInlineAttachmentsWithContext_flattenUnsupportedInlineAttachmentsOnly_updateRangeValueToObjectMapBlock_replacementAttributedStringBlock___block_invoke;
  v58[3] = &unk_1E76CD338;
  v46 = v10;
  v59 = v46;
  v63 = a4;
  v17 = v14;
  v60 = v17;
  v45 = v11;
  v62 = v45;
  v18 = v15;
  v61 = v18;
  v53 = v13;
  objc_msgSend(v13, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("NSAttachment"), 0, v16, 0, v58);
  objc_msgSend(v17, "sortUsingComparator:", &__block_literal_global_71);
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  obj = v17;
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v55;
    v48 = *MEMORY[0x1E0DC1178];
    v49 = *(_QWORD *)v55;
    v50 = v18;
    v47 = v12;
    do
    {
      v22 = 0;
      v51 = v20;
      do
      {
        if (*(_QWORD *)v55 != v21)
          objc_enumerationMutation(obj);
        v23 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v22);
        v24 = objc_msgSend(v23, "rangeValue");
        v26 = v25;
        objc_msgSend(v18, "objectForKeyedSubscript:", v23);
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = (void *)v27;
        if (v12 && v27)
        {
          objc_msgSend(v53, "attributesAtIndex:effectiveRange:", v24, 0);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = (void *)objc_msgSend(v29, "mutableCopy");

          v12[2](v12, v30, v28);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = (void *)objc_msgSend(v31, "mutableCopy");

          if (v32)
          {
            objc_opt_class();
            objc_msgSend(v30, "objectForKeyedSubscript:", ICTTAttributeNameParagraphStyle);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            ICDynamicCast();
            v34 = (void *)objc_claimAutoreleasedReturnValue();

            v35 = ICTTAttributeNameParagraphStyle;
            v37 = objc_msgSend(v32, "ic_range");
            if (v34)
              objc_msgSend(v32, "addAttribute:value:range:", v35, v34, v37, v36);
            else
              objc_msgSend(v32, "removeAttribute:range:", v35, v37, v36);
            objc_opt_class();
            objc_msgSend(v30, "objectForKeyedSubscript:", v48);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            ICDynamicCast();
            v39 = (void *)objc_claimAutoreleasedReturnValue();

            v41 = objc_msgSend(v32, "ic_range");
            if (v39)
              objc_msgSend(v32, "addAttribute:value:range:", v48, v39, v41, v40);
            else
              objc_msgSend(v32, "removeAttribute:range:", v48, v41, v40);
            v42 = (void *)objc_msgSend(v32, "copy");
            objc_msgSend(v53, "replaceCharactersInRange:withAttributedString:", v24, v26, v42);

            v21 = v49;
            v18 = v50;
            v12 = v47;
          }

          v20 = v51;
        }

        ++v22;
      }
      while (v20 != v22);
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
    }
    while (v20);
  }

  v43 = (void *)objc_msgSend(v53, "copy");
  return v43;
}

- (id)ic_searchableStringInContext:()Shared
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0CB3778]);
  objc_msgSend(a1, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithString:", v6);

  v8 = objc_msgSend(a1, "length");
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __59__NSAttributedString_Shared__ic_searchableStringInContext___block_invoke;
  v14[3] = &unk_1E76CD3A0;
  v15 = v4;
  v9 = v7;
  v16 = v9;
  v10 = v4;
  objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("NSAttachment"), 0, v8, 2, v14);
  v11 = v16;
  v12 = v9;

  return v12;
}

@end
