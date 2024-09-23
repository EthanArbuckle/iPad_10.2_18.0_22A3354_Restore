@implementation EMFStringUtilities

+ (id)_stringWithUnichar:(unsigned int)a3
{
  unsigned int v3;
  uint64_t v4;
  _WORD v6[2];

  if ((a3 - 0x10000) >> 20)
  {
    v4 = 1;
    LOWORD(v3) = a3;
  }
  else
  {
    v3 = (a3 >> 10) - 10304;
    v6[1] = a3 & 0x3FF | 0xDC00;
    v4 = 2;
  }
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", v6, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_preferenceIndexString:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "length") == 1
    && +[EMFEmojiCategory _isDingbatsVariantEmoji:](EMFEmojiCategory, "_isDingbatsVariantEmoji:", v3))
  {
    objc_msgSend(v3, "stringByAppendingString:", CFSTR("️"));
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = v3;
  }
  v5 = v4;

  return v5;
}

+ (unsigned)_firstLongCharacterOfString:(id)a3
{
  id v3;
  unsigned int v4;
  int v5;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    v4 = objc_msgSend(v3, "characterAtIndex:", 0);
    if ((v4 & 0xFC00) == 0xD800 && (unint64_t)objc_msgSend(v3, "length") >= 2)
    {
      v5 = objc_msgSend(v3, "characterAtIndex:", 1);
      if ((v5 & 0xFC00) == 0xDC00)
        v4 = v5 + (v4 << 10) - 56613888;
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)_baseFirstCharacterString:(id)a3
{
  return (id)objc_msgSend(a1, "_stringWithUnichar:", objc_msgSend(a1, "_firstLongCharacterOfString:", a3));
}

+ (BOOL)_emojiString:(id)a3 containsSubstring:(id)a4
{
  return objc_msgSend(a3, "rangeOfString:options:", a4, 2) != 0x7FFFFFFFFFFFFFFFLL;
}

+ (BOOL)_genderEmojiBaseStringNeedVariantSelector:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("⛹")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("🏋")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("🏌")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("🕵"));
  }

  return v4;
}

+ (id)professionSkinToneEmojiBaseKey:(id)a3
{
  id v4;
  uint64_t v5;
  const __CFString *v6;
  id v7;
  void *v8;

  v4 = a3;
  if (objc_msgSend(a1, "_emojiString:containsSubstring:", v4, CFSTR("🏻")))
  {
    v5 = objc_msgSend(v4, "length");
    v6 = CFSTR("🏻");
  }
  else if (objc_msgSend(a1, "_emojiString:containsSubstring:", v4, CFSTR("🏼")))
  {
    v5 = objc_msgSend(v4, "length");
    v6 = CFSTR("🏼");
  }
  else if (objc_msgSend(a1, "_emojiString:containsSubstring:", v4, CFSTR("🏽")))
  {
    v5 = objc_msgSend(v4, "length");
    v6 = CFSTR("🏽");
  }
  else if (objc_msgSend(a1, "_emojiString:containsSubstring:", v4, CFSTR("🏾")))
  {
    v5 = objc_msgSend(v4, "length");
    v6 = CFSTR("🏾");
  }
  else
  {
    if (!objc_msgSend(a1, "_emojiString:containsSubstring:", v4, CFSTR("🏿")))
    {
      v7 = v4;
      goto LABEL_12;
    }
    v5 = objc_msgSend(v4, "length");
    v6 = CFSTR("🏿");
  }
  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:options:range:", v6, &stru_1E670BD50, 2, 0, v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:
  v8 = v7;

  return v8;
}

+ (id)_baseStringForEmojiString:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  __CFString *v8;
  void *v10;
  int v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  uint64_t v18;
  void *v19;

  v4 = a3;
  if (!+[EMFEmojiCategory _isProfessionEmoji:](EMFEmojiCategory, "_isProfessionEmoji:", v4)
    && !+[EMFEmojiCategory _isFlagEmoji:](EMFEmojiCategory, "_isFlagEmoji:", v4)
    && !+[EMFEmojiCategory _isMultiPersonFamilySkinToneEmoji:](EMFEmojiCategory, "_isMultiPersonFamilySkinToneEmoji:", v4)&& (!+[EMFEmojiCategory _isCoupleMultiSkinToneEmoji:](EMFEmojiCategory, "_isCoupleMultiSkinToneEmoji:", v4)|| +[EMFEmojiCategory _isBaseHandshakeOrHandshakeWithSkintonesEmoji:](EMFEmojiCategory, "_isBaseHandshakeOrHandshakeWithSkintonesEmoji:", v4)))
  {
    v5 = objc_msgSend((id)objc_opt_class(), "multiPersonTypeForString:", v4);
    if (v5)
    {
      v6 = v5;
      objc_msgSend(a1, "_joiningStringForCoupleString:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7
        && !+[EMFEmojiCategory _isHandholdingCoupleEmoji:](EMFEmojiCategory, "_isHandholdingCoupleEmoji:", v4)&& !+[EMFEmojiCategory _isBaseHandshakeOrHandshakeWithSkintonesEmoji:](EMFEmojiCategory, "_isBaseHandshakeOrHandshakeWithSkintonesEmoji:", v4))
      {
        if (v6 == 4)
        {
          if ((objc_msgSend(v7, "isEqualToString:", CFSTR("‍❤️‍")) & 1) != 0)
          {
            v8 = CFSTR("💑");
            goto LABEL_39;
          }
          if ((objc_msgSend(v7, "isEqualToString:", CFSTR("‍❤️‍💋‍")) & 1) != 0)
          {
            v8 = CFSTR("💏");
            goto LABEL_39;
          }
        }
        objc_msgSend(a1, "_tokenizedMultiPersonFromString:", v4);
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
        -[__CFString firstObject](v13, "firstObject");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFString lastObject](v13, "lastObject");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_coupleStringWithLeftPerson:leftVariant:joiningString:rightPerson:rightVariant:", v16, 0, v7, v19, 0);
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

        goto LABEL_37;
      }
      if (v6 <= 5)
      {
        v8 = off_1E66F9B40[v6 - 1];
LABEL_39:

        goto LABEL_13;
      }

    }
    objc_msgSend(a1, "professionSkinToneEmojiBaseKey:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[EMFEmojiCategory _isProfessionEmoji:](EMFEmojiCategory, "_isProfessionEmoji:", v7))
    {
      v8 = v7;
      goto LABEL_39;
    }
    if ((objc_msgSend(a1, "_emojiString:containsSubstring:", v4, CFSTR("♀")) & 1) == 0
      && !objc_msgSend(a1, "_emojiString:containsSubstring:", v4, CFSTR("♂")))
    {
      objc_msgSend(a1, "_baseFirstCharacterString:", v4);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if ((-[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("☝")) & 1) != 0
        || (-[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("✌")) & 1) != 0
        || -[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("✍")))
      {
        -[__CFString stringByAppendingString:](v8, "stringByAppendingString:", CFSTR("️"));
        v18 = objc_claimAutoreleasedReturnValue();

        v8 = (__CFString *)v18;
      }
      goto LABEL_39;
    }
    objc_msgSend(a1, "_baseFirstCharacterString:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(a1, "_genderEmojiBaseStringNeedVariantSelector:", v10);
    v12 = &stru_1E670BD50;
    if (v11)
      v12 = CFSTR("️");
    v13 = v12;

    if (objc_msgSend(a1, "_emojiString:containsSubstring:", v4, CFSTR("♀")))
    {
      v14 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(a1, "_baseFirstCharacterString:", v4);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)v15;
      v17 = CFSTR("‍♀️");
    }
    else
    {
      if (!objc_msgSend(a1, "_emojiString:containsSubstring:", v4, CFSTR("♂")))
      {
        v8 = 0;
LABEL_38:

        goto LABEL_39;
      }
      v14 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(a1, "_baseFirstCharacterString:", v4);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)v15;
      v17 = CFSTR("‍♂️");
    }
    objc_msgSend(v14, "stringWithFormat:", CFSTR("%@%@%@"), v15, v13, v17);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_37:

    goto LABEL_38;
  }
  v8 = (__CFString *)v4;
LABEL_13:

  return v8;
}

+ (BOOL)_hasSkinToneVariantsForString:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;

  v4 = a3;
  if (+[EMFEmojiCategory _isMultiPersonFamilySkinToneEmoji:](EMFEmojiCategory, "_isMultiPersonFamilySkinToneEmoji:", v4))
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(a1, "_baseFirstCharacterString:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = +[EMFEmojiCategory _isSkinToneEmoji:](EMFEmojiCategory, "_isSkinToneEmoji:", v6)
      || +[EMFEmojiCategory _isCoupleMultiSkinToneEmoji:](EMFEmojiCategory, "_isCoupleMultiSkinToneEmoji:", v6);

  }
  return v5;
}

+ (id)skinToneSpecifierTypeFromEmojiFitzpatrickModifier:(int)a3
{
  if ((a3 - 1) > 5)
    return CFSTR("EMFSkinToneSpecifierTypeFitzpatrickNone");
  else
    return off_1E66F9B68[a3 - 1];
}

+ (int)_skinToneModifierFromSpecifierType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EMFSkinToneSpecifierTypeFitzpatrickNone")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EMFSkinToneSpecifierTypeFitzpatrick1_2")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EMFSkinToneSpecifierTypeFitzpatrick3")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EMFSkinToneSpecifierTypeFitzpatrick4")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EMFSkinToneSpecifierTypeFitzpatrick5")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("EMFSkinToneSpecifierTypeFitzpatrick6")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)_skinToneSuffixFromSpecifierType:(id)a3
{
  id v3;
  const __CFString *v4;

  v3 = a3;
  v4 = &stru_1E670BD50;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EMFSkinToneSpecifierTypeFitzpatrickNone")) & 1) == 0)
  {
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EMFSkinToneSpecifierTypeFitzpatrick1_2")) & 1) != 0)
    {
      v4 = CFSTR("🏻");
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EMFSkinToneSpecifierTypeFitzpatrick3")) & 1) != 0)
    {
      v4 = CFSTR("🏼");
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EMFSkinToneSpecifierTypeFitzpatrick4")) & 1) != 0)
    {
      v4 = CFSTR("🏽");
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EMFSkinToneSpecifierTypeFitzpatrick5")) & 1) != 0)
    {
      v4 = CFSTR("🏾");
    }
    else if (objc_msgSend(v3, "isEqualToString:", CFSTR("EMFSkinToneSpecifierTypeFitzpatrick6")))
    {
      v4 = CFSTR("🏿");
    }
  }

  return (id)v4;
}

+ (int)_skinToneForString:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  id v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  int v15;
  _QWORD v16[5];
  _QWORD v17[6];

  v17[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16[0] = &unk_1E6724318;
  v16[1] = &unk_1E6724330;
  v17[0] = CFSTR("🏻");
  v17[1] = CFSTR("🏼");
  v16[2] = &unk_1E6724348;
  v16[3] = &unk_1E6724360;
  v17[2] = CFSTR("🏽");
  v17[3] = CFSTR("🏾");
  v16[4] = &unk_1E6724378;
  v17[4] = CFSTR("🏿");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __41__EMFStringUtilities__skinToneForString___block_invoke;
  v8[3] = &unk_1E66F9B20;
  v11 = a1;
  v6 = v4;
  v9 = v6;
  v10 = &v12;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v8);
  LODWORD(v4) = *((_DWORD *)v13 + 6);

  _Block_object_dispose(&v12, 8);
  return (int)v4;
}

void __41__EMFStringUtilities__skinToneForString___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if (objc_msgSend(*(id *)(a1 + 48), "_emojiString:containsSubstring:", *(_QWORD *)(a1 + 32), a3))
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v7, "intValue");
    *a4 = 1;
  }

}

+ (id)_tokenizedMultiPersonFromString:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "rangeOfString:options:", CFSTR("‍🤝‍"), 2);
  if (v5 != 0x7FFFFFFFFFFFFFFFLL
    || (v5 = objc_msgSend(v3, "rangeOfString:options:", CFSTR("‍❤️‍💋‍"), 2), v5 != 0x7FFFFFFFFFFFFFFFLL)
    || (v5 = objc_msgSend(v3, "rangeOfString:options:", CFSTR("‍❤️‍"), 2), v5 != 0x7FFFFFFFFFFFFFFFLL))
  {
    v7 = v5;
    v8 = v6;
    objc_msgSend(v3, "substringToIndex:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v9);
    objc_msgSend(v3, "substringFromIndex:", v8 + v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v10);

  }
  return v4;
}

+ (id)_tokenizedHandshakeFromString:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = _tokenizedHandshakeFromString__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&_tokenizedHandshakeFromString__onceToken, &__block_literal_global_2);
  objc_msgSend(v4, "componentsSeparatedByCharactersInSet:", _tokenizedHandshakeFromString__zwjCharacterSet);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __52__EMFStringUtilities__tokenizedHandshakeFromString___block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3780], "characterSetWithCharactersInString:", CFSTR("‍"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = objc_msgSend(v2, "copy");
  v1 = (void *)_tokenizedHandshakeFromString__zwjCharacterSet;
  _tokenizedHandshakeFromString__zwjCharacterSet = v0;

}

+ (id)_skinToneSpecifiersForString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void **v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const __CFString **v14;
  void *v16;
  char v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  void *v42;
  _BYTE v43[128];
  _BYTE v44[128];
  _QWORD v45[2];
  const __CFString *v46;
  _QWORD v47[2];

  v47[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (+[EMFEmojiCategory _isCoupleMultiSkinToneEmoji:](EMFEmojiCategory, "_isCoupleMultiSkinToneEmoji:", v4)&& !+[EMFEmojiCategory _isBaseHandshakeOrHandshakeWithSkintonesEmoji:](EMFEmojiCategory, "_isBaseHandshakeOrHandshakeWithSkintonesEmoji:", v4))
  {
    v47[0] = CFSTR("EMFSkinToneSpecifierTypeFitzpatrickNone");
    v13 = (void *)MEMORY[0x1E0C99D20];
    v14 = (const __CFString **)v47;
LABEL_12:
    objc_msgSend(v13, "arrayWithObjects:count:", v14, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  objc_msgSend(a1, "_baseFirstCharacterString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("👫")) & 1) != 0)
    goto LABEL_6;
  objc_msgSend(a1, "_baseFirstCharacterString:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("👬")))
  {

LABEL_6:
    goto LABEL_7;
  }
  objc_msgSend(a1, "_baseFirstCharacterString:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("👭"));

  if ((v17 & 1) == 0)
  {
    if (+[EMFEmojiCategory _isComposedCoupleMultiSkinToneEmoji:](EMFEmojiCategory, "_isComposedCoupleMultiSkinToneEmoji:", v4))
    {
      objc_msgSend((id)objc_opt_class(), "_tokenizedMultiPersonFromString:", v4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v18, "count"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v19 = v18;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v39;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v39 != v22)
              objc_enumerationMutation(v19);
            v24 = objc_msgSend((id)objc_opt_class(), "_skinToneForString:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i));
            if ((_DWORD)v24)
            {
              objc_msgSend((id)objc_opt_class(), "skinToneSpecifierTypeFromEmojiFitzpatrickModifier:", v24);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "addObject:", v25);

            }
          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
        }
        while (v21);
      }
    }
    else
    {
      if (!+[EMFEmojiCategory _isBaseHandshakeOrHandshakeWithSkintonesEmoji:](EMFEmojiCategory, "_isBaseHandshakeOrHandshakeWithSkintonesEmoji:", v4))
      {
        v33 = objc_msgSend((id)objc_opt_class(), "_skinToneForString:", v4);
        objc_msgSend((id)objc_opt_class(), "skinToneSpecifierTypeFromEmojiFitzpatrickModifier:", v33);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v8;
        v9 = (void *)MEMORY[0x1E0C99D20];
        v10 = &v42;
        v11 = 1;
        goto LABEL_9;
      }
      objc_msgSend(a1, "_tokenizedHandshakeFromString:", v4);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v19 = v26;
      v27 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v35;
        do
        {
          for (j = 0; j != v28; ++j)
          {
            if (*(_QWORD *)v35 != v29)
              objc_enumerationMutation(v19);
            v31 = objc_msgSend((id)objc_opt_class(), "_skinToneForString:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * j), (_QWORD)v34);
            if ((_DWORD)v31)
            {
              objc_msgSend((id)objc_opt_class(), "skinToneSpecifierTypeFromEmojiFitzpatrickModifier:", v31);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "addObject:", v32);

            }
          }
          v28 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
        }
        while (v28);
      }
    }

    goto LABEL_13;
  }
LABEL_7:
  v7 = objc_msgSend((id)objc_opt_class(), "_skinToneForString:", v4);
  if (!(_DWORD)v7)
  {
    v46 = CFSTR("EMFSkinToneSpecifierTypeFitzpatrickNone");
    v13 = (void *)MEMORY[0x1E0C99D20];
    v14 = &v46;
    goto LABEL_12;
  }
  objc_msgSend((id)objc_opt_class(), "skinToneSpecifierTypeFromEmojiFitzpatrickModifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v8;
  v45[1] = v8;
  v9 = (void *)MEMORY[0x1E0C99D20];
  v10 = (void **)v45;
  v11 = 2;
LABEL_9:
  objc_msgSend(v9, "arrayWithObjects:count:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
  return v12;
}

+ (int64_t)multiPersonTypeForString:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  char v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  char v29;

  v4 = a3;
  if (+[EMFEmojiCategory _isBaseHandshakeOrHandshakeWithSkintonesEmoji:](EMFEmojiCategory, "_isBaseHandshakeOrHandshakeWithSkintonesEmoji:", v4))
  {
    v5 = 5;
    goto LABEL_25;
  }
  objc_msgSend(a1, "_baseFirstCharacterString:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[EMFEmojiCategory _isCoupleMultiSkinToneEmoji:](EMFEmojiCategory, "_isCoupleMultiSkinToneEmoji:", v6);

  if (!v7)
  {
    if (v4
      && (+[EMFEmojiCategory _isComposedCoupleMultiSkinToneEmoji:](EMFEmojiCategory, "_isComposedCoupleMultiSkinToneEmoji:", v4)|| +[EMFEmojiCategory _supportsCoupleSkinToneSelection:](EMFEmojiCategory, "_supportsCoupleSkinToneSelection:", v4)))
    {
      objc_msgSend((id)objc_opt_class(), "_tokenizedMultiPersonFromString:", v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndex:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_baseFirstCharacterString:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("👩"));

      if (v13)
      {
        objc_msgSend(v10, "objectAtIndex:", 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_baseFirstCharacterString:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("👩"));

        if ((v16 & 1) != 0)
        {
          v5 = 2;
LABEL_24:

          goto LABEL_25;
        }
        v5 = 1;
        objc_msgSend(v10, "objectAtIndex:", 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_baseFirstCharacterString:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "isEqualToString:", CFSTR("👨"));

        if ((v29 & 1) != 0)
          goto LABEL_24;
      }
      else
      {
        objc_msgSend(v10, "objectAtIndex:", 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_baseFirstCharacterString:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("👨"));

        if (!v23)
        {
          v5 = 4;
          goto LABEL_24;
        }
        objc_msgSend(v10, "objectAtIndex:", 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_baseFirstCharacterString:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("👨"));

        if (v26)
        {
          v5 = 3;
          goto LABEL_24;
        }
      }

    }
    v5 = 0;
    goto LABEL_25;
  }
  objc_msgSend(a1, "_baseFirstCharacterString:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("👫"));

  if ((v9 & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    objc_msgSend(a1, "_baseFirstCharacterString:", v4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("👭"));

    if ((v18 & 1) != 0)
    {
      v5 = 2;
    }
    else
    {
      objc_msgSend(a1, "_baseFirstCharacterString:", v4);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("👬"));

      if (v20)
        v5 = 3;
      else
        v5 = 4;
    }
  }
LABEL_25:

  return v5;
}

+ (id)_joiningStringForCoupleString:(id)a3
{
  id v3;
  const __CFString *v4;

  v3 = a3;
  v4 = CFSTR("‍🤝‍");
  if (objc_msgSend(v3, "rangeOfString:options:", CFSTR("‍🤝‍"), 2) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = CFSTR("‍❤️‍💋‍");
    if (objc_msgSend(v3, "rangeOfString:options:", CFSTR("‍❤️‍💋‍"), 2) == 0x7FFFFFFFFFFFFFFFLL
      && objc_msgSend(v3, "rangeOfString:options:", CFSTR("💏"), 2) == 0x7FFFFFFFFFFFFFFFLL)
    {
      v4 = CFSTR("‍❤️‍");
      if (objc_msgSend(v3, "rangeOfString:options:", CFSTR("‍❤️‍"), 2) == 0x7FFFFFFFFFFFFFFFLL
        && objc_msgSend(v3, "rangeOfString:options:", CFSTR("💑"), 2) == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (objc_msgSend(v3, "isEqualToString:", CFSTR("🤝")))
          v4 = CFSTR("‍");
        else
          v4 = 0;
      }
    }
  }

  return (id)v4;
}

+ (id)_skinToneChooserVariantsForHandHoldingCoupleType:(int64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t m;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v39;
  id obj;
  id v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _QWORD v69[2];
  _BYTE v70[128];
  _QWORD v71[2];
  _BYTE v72[128];
  _QWORD v73[2];
  _BYTE v74[128];
  _QWORD v75[2];
  _BYTE v76[128];
  _QWORD v77[7];

  v77[5] = *MEMORY[0x1E0C80C00];
  v77[0] = CFSTR("🏻");
  v77[1] = CFSTR("🏼");
  v77[2] = CFSTR("🏽");
  v77[3] = CFSTR("🏾");
  v77[4] = CFSTR("🏿");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  switch(a3)
  {
    case 1:
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = 0u;
      v66 = 0u;
      v67 = 0u;
      v68 = 0u;
      v39 = v5;
      obj = v5;
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v76, 16);
      if (v6)
      {
        v7 = v6;
        v41 = *(id *)v66;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(id *)v66 != v41)
              objc_enumerationMutation(obj);
            v9 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * i);
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@%@%@"), CFSTR("👩"), v9, CFSTR("‍🤝‍"), CFSTR("👨"), CFSTR("‍"));
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "addObject:", v10);

            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@%@%@"), CFSTR("👩"), CFSTR("‍"), CFSTR("‍🤝‍"), CFSTR("👨"), v9);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "addObject:", v11);

          }
          v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v76, 16);
        }
        while (v7);
      }

      v13 = v45;
      v12 = v49;
      v75[0] = v49;
      v75[1] = v45;
      v14 = (void *)MEMORY[0x1E0C99D20];
      v15 = v75;
      goto LABEL_36;
    case 2:
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = 0u;
      v62 = 0u;
      v63 = 0u;
      v64 = 0u;
      v39 = v5;
      v42 = v5;
      v17 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v61, v74, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v62;
        do
        {
          for (j = 0; j != v18; ++j)
          {
            if (*(_QWORD *)v62 != v19)
              objc_enumerationMutation(v42);
            v21 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * j);
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@%@%@"), CFSTR("👩"), v21, CFSTR("‍🤝‍"), CFSTR("👩"), CFSTR("‍"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "addObject:", v22);

            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@%@%@"), CFSTR("👩"), CFSTR("‍"), CFSTR("‍🤝‍"), CFSTR("👩"), v21);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "addObject:", v23);

          }
          v18 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v61, v74, 16);
        }
        while (v18);
      }

      v13 = v46;
      v12 = v50;
      v73[0] = v50;
      v73[1] = v46;
      v14 = (void *)MEMORY[0x1E0C99D20];
      v15 = v73;
      goto LABEL_36;
    case 3:
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = 0u;
      v58 = 0u;
      v59 = 0u;
      v60 = 0u;
      v39 = v5;
      v43 = v5;
      v24 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v57, v72, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v58;
        do
        {
          for (k = 0; k != v25; ++k)
          {
            if (*(_QWORD *)v58 != v26)
              objc_enumerationMutation(v43);
            v28 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * k);
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@%@%@"), CFSTR("👨"), v28, CFSTR("‍🤝‍"), CFSTR("👨"), CFSTR("‍"));
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "addObject:", v29);

            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@%@%@"), CFSTR("👨"), CFSTR("‍"), CFSTR("‍🤝‍"), CFSTR("👨"), v28);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "addObject:", v30);

          }
          v25 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v57, v72, 16);
        }
        while (v25);
      }

      v13 = v47;
      v12 = v51;
      v71[0] = v51;
      v71[1] = v47;
      v14 = (void *)MEMORY[0x1E0C99D20];
      v15 = v71;
      goto LABEL_36;
    case 4:
      objc_msgSend((id)objc_opt_class(), "_skinToneChooserArraysForCoupleType:joiner:", 4, CFSTR("‍🤝‍"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = 0u;
      v54 = 0u;
      v55 = 0u;
      v56 = 0u;
      v39 = v5;
      v44 = v5;
      v31 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v53, v70, 16);
      if (v31)
      {
        v32 = v31;
        v33 = *(_QWORD *)v54;
        do
        {
          for (m = 0; m != v32; ++m)
          {
            if (*(_QWORD *)v54 != v33)
              objc_enumerationMutation(v44);
            v35 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * m);
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@%@%@"), CFSTR("🫱"), v35, CFSTR("‍"), CFSTR("🫲"), CFSTR("‍"));
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "addObject:", v36);

            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@%@%@"), CFSTR("🫱"), CFSTR("‍"), CFSTR("🫲"), v35, CFSTR("‍"));
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "addObject:", v37);

          }
          v32 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v53, v70, 16);
        }
        while (v32);
      }

      v13 = v48;
      v12 = v52;
      v69[0] = v52;
      v69[1] = v48;
      v14 = (void *)MEMORY[0x1E0C99D20];
      v15 = v69;
LABEL_36:
      objc_msgSend(v14, "arrayWithObjects:count:", v15, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = v39;
      break;
    default:
      v16 = (void *)MEMORY[0x1E0C9AA60];
      break;
  }

  return v16;
}

+ (id)_skinToneChooserArraysForCoupleType:(int64_t)a3 joiner:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  int64_t v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  __CFString *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[2];
  _BYTE v29[128];
  _QWORD v30[7];

  v30[5] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v30[0] = CFSTR("🏻");
  v30[1] = CFSTR("🏼");
  v30[2] = CFSTR("🏽");
  v30[3] = CFSTR("🏾");
  v30[4] = CFSTR("🏿");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = a3 - 1;
  if ((unint64_t)(a3 - 1) > 4)
  {
    v9 = 0;
    v10 = 0;
    v22 = 0;
  }
  else
  {
    v9 = off_1E66F9B98[v8];
    v10 = off_1E66F9BC0[v8];
    v22 = off_1E66F9BE8[v8];
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v13 = v7;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v25;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v25 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v17);
        if (v5)
          objc_msgSend(a1, "_coupleStringWithLeftPerson:leftVariant:joiningString:rightPerson:rightVariant:", v10, v18, v5, v9, *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v17));
        else
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v22, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v19);
        objc_msgSend(v12, "addObject:", v19);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v15);
  }

  v28[0] = v11;
  v28[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)_skinToneChooserVariantsForString:(id)a3 usesSilhouetteSpecifiers:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;

  v4 = a4;
  v5 = a3;
  v6 = objc_msgSend((id)objc_opt_class(), "multiPersonTypeForString:", v5);
  if (v6)
  {
    v7 = v6;
    v8 = (void *)objc_opt_class();
    if (v4)
    {
      objc_msgSend(v8, "_skinToneChooserVariantsForHandHoldingCoupleType:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v8, "_joiningStringForCoupleString:", v5);
      v10 = objc_claimAutoreleasedReturnValue();
      if (v10)
        v11 = (__CFString *)v10;
      else
        v11 = CFSTR("‍🤝‍");
      objc_msgSend((id)objc_opt_class(), "_skinToneChooserArraysForCoupleType:joiner:", v7, v11);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)_coupleSkinToneChooserVariantsForString:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;

  v3 = a3;
  v4 = objc_msgSend((id)objc_opt_class(), "multiPersonTypeForString:", v3);
  if (v4)
  {
    v5 = v4;
    objc_msgSend((id)objc_opt_class(), "_joiningStringForCoupleString:", v3);
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = (__CFString *)v6;
    else
      v7 = CFSTR("‍🤝‍");
    objc_msgSend((id)objc_opt_class(), "_skinToneChooserArraysForCoupleType:joiner:", v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)_skinToneChooserVariantsForString:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (objc_msgSend((id)objc_opt_class(), "multiPersonTypeForString:", v3))
  {
    objc_msgSend((id)objc_opt_class(), "_skinToneChooserVariantsForString:usesSilhouetteSpecifiers:", v3, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)_coupleStringWithLeftPerson:(id)a3 leftVariant:(id)a4 joiningString:(id)a5 rightPerson:(id)a6 rightVariant:(id)a7
{
  id v11;
  __CFString *v12;
  id v13;
  id v14;
  __CFString *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  v11 = a3;
  v12 = (__CFString *)a4;
  v13 = a5;
  v14 = a6;
  v15 = (__CFString *)a7;
  if (!v12 || !-[__CFString length](v12, "length"))
  {
    objc_msgSend((id)objc_opt_class(), "_baseStringForEmojiString:", v11);
    v16 = objc_claimAutoreleasedReturnValue();

    v12 = &stru_1E670BD50;
    v11 = (id)v16;
  }
  if (!v15 || !-[__CFString length](v15, "length"))
  {
    objc_msgSend((id)objc_opt_class(), "_baseStringForEmojiString:", v14);
    v17 = objc_claimAutoreleasedReturnValue();

    v15 = &stru_1E670BD50;
    v14 = (id)v17;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@%@%@"), v11, v12, v13, v14, v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)_skinToneVariantsForMultiPersonType:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t m;
  uint64_t v39;
  void *v40;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  id v51;
  id v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _BYTE v94[128];
  _BYTE v95[128];
  _BYTE v96[128];
  _BYTE v97[128];
  _BYTE v98[128];
  _BYTE v99[128];
  _BYTE v100[128];
  _BYTE v101[128];
  _QWORD v102[7];

  v102[5] = *MEMORY[0x1E0C80C00];
  v102[0] = CFSTR("🏻");
  v102[1] = CFSTR("🏼");
  v102[2] = CFSTR("🏽");
  v102[3] = CFSTR("🏾");
  v102[4] = CFSTR("🏿");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v102, 5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v4;
  switch(a3)
  {
    case 1:
      v92 = 0u;
      v93 = 0u;
      v90 = 0u;
      v91 = 0u;
      v6 = v4;
      v54 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v90, v101, 16);
      if (!v54)
        goto LABEL_76;
      v46 = *(_QWORD *)v91;
      v50 = v6;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v91 != v46)
            objc_enumerationMutation(v6);
          v58 = v7;
          v8 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * v7);
          v86 = 0u;
          v87 = 0u;
          v88 = 0u;
          v89 = 0u;
          v9 = v6;
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v86, v100, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v87;
            do
            {
              for (i = 0; i != v11; ++i)
              {
                if (*(_QWORD *)v87 != v12)
                  objc_enumerationMutation(v9);
                v14 = *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * i);
                if (objc_msgSend(v8, "isEqualToString:", v14))
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("👫"), v8, v42, v43, v44);
                else
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@%@%@"), CFSTR("👩"), v8, CFSTR("‍🤝‍"), CFSTR("👨"), v14);
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "addObject:", v15);

              }
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v86, v100, 16);
            }
            while (v11);
          }

          v7 = v58 + 1;
          v6 = v50;
        }
        while (v58 + 1 != v54);
        v54 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v90, v101, 16);
      }
      while (v54);
      goto LABEL_77;
    case 2:
      v84 = 0u;
      v85 = 0u;
      v82 = 0u;
      v83 = 0u;
      v16 = v4;
      v55 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v82, v99, 16);
      if (!v55)
        goto LABEL_75;
      v47 = *(_QWORD *)v83;
      v51 = v16;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v83 != v47)
            objc_enumerationMutation(v16);
          v59 = v17;
          v18 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * v17);
          v78 = 0u;
          v79 = 0u;
          v80 = 0u;
          v81 = 0u;
          v9 = v16;
          v19 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v78, v98, 16);
          if (v19)
          {
            v20 = v19;
            v21 = *(_QWORD *)v79;
            do
            {
              for (j = 0; j != v20; ++j)
              {
                if (*(_QWORD *)v79 != v21)
                  objc_enumerationMutation(v9);
                v23 = *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * j);
                if (objc_msgSend(v18, "isEqualToString:", v23))
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("👭"), v18, v42, v43, v44);
                else
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@%@%@"), CFSTR("👩"), v18, CFSTR("‍🤝‍"), CFSTR("👩"), v23);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "addObject:", v24);

              }
              v20 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v78, v98, 16);
            }
            while (v20);
          }

          v17 = v59 + 1;
          v16 = v51;
        }
        while (v59 + 1 != v55);
        v55 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v82, v99, 16);
      }
      while (v55);
      goto LABEL_77;
    case 3:
      v76 = 0u;
      v77 = 0u;
      v74 = 0u;
      v75 = 0u;
      v16 = v4;
      v56 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v74, v97, 16);
      if (v56)
      {
        v48 = *(_QWORD *)v75;
        v52 = v16;
        do
        {
          v25 = 0;
          do
          {
            if (*(_QWORD *)v75 != v48)
              objc_enumerationMutation(v16);
            v60 = v25;
            v26 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * v25);
            v70 = 0u;
            v71 = 0u;
            v72 = 0u;
            v73 = 0u;
            v9 = v16;
            v27 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v70, v96, 16);
            if (v27)
            {
              v28 = v27;
              v29 = *(_QWORD *)v71;
              do
              {
                for (k = 0; k != v28; ++k)
                {
                  if (*(_QWORD *)v71 != v29)
                    objc_enumerationMutation(v9);
                  v31 = *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * k);
                  if (objc_msgSend(v26, "isEqualToString:", v31))
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("👬"), v26, v42, v43, v44);
                  else
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@%@%@"), CFSTR("👨"), v26, CFSTR("‍🤝‍"), CFSTR("👨"), v31);
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v5, "addObject:", v32);

                }
                v28 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v70, v96, 16);
              }
              while (v28);
            }

            v25 = v60 + 1;
            v16 = v52;
          }
          while (v60 + 1 != v56);
          v56 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v74, v97, 16);
        }
        while (v56);
      }
      else
      {
LABEL_75:
        v9 = v16;
      }
      goto LABEL_77;
    case 4:
      objc_msgSend((id)objc_opt_class(), "_skinToneVariantsForCouple:joiner:", 4, CFSTR("‍🤝‍"));
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObjectsFromArray:", v9);
      goto LABEL_77;
    case 5:
      v68 = 0u;
      v69 = 0u;
      v66 = 0u;
      v67 = 0u;
      v6 = v4;
      v57 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v66, v95, 16);
      if (v57)
      {
        v49 = *(_QWORD *)v67;
        v53 = v6;
        do
        {
          v33 = 0;
          do
          {
            if (*(_QWORD *)v67 != v49)
              objc_enumerationMutation(v6);
            v61 = v33;
            v34 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * v33);
            v62 = 0u;
            v63 = 0u;
            v64 = 0u;
            v65 = 0u;
            v9 = v6;
            v35 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v62, v94, 16);
            if (v35)
            {
              v36 = v35;
              v37 = *(_QWORD *)v63;
              do
              {
                for (m = 0; m != v36; ++m)
                {
                  if (*(_QWORD *)v63 != v37)
                    objc_enumerationMutation(v9);
                  v39 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * m);
                  if (objc_msgSend(v34, "isEqualToString:", v39))
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("🤝"), v34, v42, v43, v44);
                  else
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@%@%@"), CFSTR("🫱"), v34, CFSTR("‍"), CFSTR("🫲"), v39);
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v5, "addObject:", v40);

                }
                v36 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v62, v94, 16);
              }
              while (v36);
            }

            v33 = v61 + 1;
            v6 = v53;
          }
          while (v61 + 1 != v57);
          v57 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v66, v95, 16);
        }
        while (v57);
      }
      else
      {
LABEL_76:
        v9 = v6;
      }
LABEL_77:

      v4 = v45;
      break;
    default:
      break;
  }

  return v5;
}

+ (id)_skinToneVariantsForCouple:(int64_t)a3 joiner:(id)a4
{
  void *v5;
  int64_t v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  id obj;
  uint64_t v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  _QWORD v34[7];

  v34[5] = *MEMORY[0x1E0C80C00];
  v23 = a4;
  v34[0] = CFSTR("🏻");
  v34[1] = CFSTR("🏼");
  v34[2] = CFSTR("🏽");
  v34[3] = CFSTR("🏾");
  v34[4] = CFSTR("🏿");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = a3 - 1;
  if ((unint64_t)(a3 - 1) > 3)
  {
    v7 = 0;
    v8 = 0;
  }
  else
  {
    v7 = off_1E66F9C10[v6];
    v8 = off_1E66F9C30[v6];
  }
  v9 = (void *)objc_opt_new();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v5;
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v20)
  {
    v19 = *(_QWORD *)v29;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v29 != v19)
          objc_enumerationMutation(obj);
        v22 = v10;
        v11 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v10);
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v12 = obj;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v25;
          do
          {
            v16 = 0;
            do
            {
              if (*(_QWORD *)v25 != v15)
                objc_enumerationMutation(v12);
              objc_msgSend((id)objc_opt_class(), "_coupleStringWithLeftPerson:leftVariant:joiningString:rightPerson:rightVariant:", v8, v11, v23, v7, *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v16));
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "addObject:", v17);

              ++v16;
            }
            while (v14 != v16);
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          }
          while (v14);
        }

        v10 = v22 + 1;
      }
      while (v22 + 1 != v20);
      v20 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v20);
  }

  return v9;
}

+ (id)_skinToneVariantsForString:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  _UNKNOWN **v9;
  void *v10;
  uint64_t v11;
  const __CFString *v12;
  int v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  _BOOL4 v30;
  void *v31;
  void *v33;
  _QWORD v34[6];

  v34[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(), "multiPersonTypeForString:", v4);
  if (!v5)
  {
    objc_msgSend(a1, "_baseFirstCharacterString:", v4);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v9 = &off_1E66E3000;
    if (!+[EMFEmojiCategory _isSkinToneEmoji:](EMFEmojiCategory, "_isSkinToneEmoji:", v8))
    {
      v7 = 0;
LABEL_39:

      goto LABEL_40;
    }
    objc_msgSend(a1, "_baseStringForEmojiString:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = CFSTR("🏻");
    v34[1] = CFSTR("🏼");
    v34[2] = CFSTR("🏽");
    v34[3] = CFSTR("🏾");
    v34[4] = CFSTR("🏿");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 5);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -1;
    while (!objc_msgSend(v9[91], "_isGenderEmoji:", v8))
    {
      if (!objc_msgSend(v9[91], "_isProfessionEmoji:", v10))
      {
        if (v11 == -1)
        {
          if (objc_msgSend(v9[91], "_isDingbatsVariantEmoji:", v8))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v8, CFSTR("️"));
            v28 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
LABEL_27:
            v28 = v10;
          }
          v19 = v28;
          goto LABEL_29;
        }
        v26 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v33, "objectAtIndex:", v11);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "stringWithFormat:", CFSTR("%@%@"), v8, v16);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_24;
      }
      if (v11 == -1)
        goto LABEL_27;
      v20 = objc_msgSend(v10, "rangeOfString:options:", v8, 2);
      v22 = v21;
      v23 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v33, "objectAtIndex:", v11);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringWithFormat:", CFSTR("%@%@"), v8, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "stringByReplacingCharactersInRange:withString:", v20, v22, v25);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = &off_1E66E3000;
LABEL_29:
      objc_msgSend(v7, "addObject:", v19);

      if (++v11 == 5)
      {

        goto LABEL_39;
      }
    }
    v12 = CFSTR("‍♀️");
    if ((objc_msgSend(a1, "_emojiString:containsSubstring:", v4, CFSTR("♀")) & 1) == 0)
    {
      if (objc_msgSend(a1, "_emojiString:containsSubstring:", v4, CFSTR("♂")))
        v12 = CFSTR("‍♂️");
      else
        v12 = &stru_1E670BD50;
    }
    v13 = objc_msgSend(a1, "_genderEmojiBaseStringNeedVariantSelector:", v8);
    v14 = &stru_1E670BD50;
    if (v13)
      v14 = CFSTR("️");
    v15 = v14;
    v16 = v15;
    v17 = (void *)MEMORY[0x1E0CB3940];
    if (v11 == -1)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), v8, v15, v12);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v33, "objectAtIndex:", v11);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringWithFormat:", CFSTR("%@%@%@"), v8, v18, v12);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (objc_msgSend(v4, "hasSuffix:", CFSTR("‍➡️")))
    {
      objc_msgSend(v19, "stringByAppendingString:", CFSTR("‍➡️"));
      v27 = objc_claimAutoreleasedReturnValue();

      v19 = (void *)v27;
    }
    v9 = &off_1E66E3000;
LABEL_24:

    goto LABEL_29;
  }
  v6 = v5;
  if (v5 != 5)
  {
    objc_msgSend((id)objc_opt_class(), "_joiningStringForCoupleString:", v4);
    v29 = objc_claimAutoreleasedReturnValue();
    if (v29)
      v8 = (__CFString *)v29;
    else
      v8 = CFSTR("‍🤝‍");
    v30 = +[EMFEmojiCategory _isHandholdingCoupleEmoji:](EMFEmojiCategory, "_isHandholdingCoupleEmoji:", v4);
    v31 = (void *)objc_opt_class();
    if (v30)
      objc_msgSend(v31, "_skinToneVariantsForMultiPersonType:", v6);
    else
      objc_msgSend(v31, "_skinToneVariantsForCouple:joiner:", v6, v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_39;
  }
  objc_msgSend((id)objc_opt_class(), "_skinToneVariantsForMultiPersonType:", 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_40:

  return v7;
}

+ (id)_multiPersonStringForString:(id)a3 skinToneVariantSpecifier:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  __CFString *v16;
  __CFString *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  char v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  __CFString *v30;
  int v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  int v39;
  int v40;
  uint64_t v42;
  const __CFString *v43;
  uint64_t v44;
  const __CFString *v45;
  uint64_t v46;
  id v47;
  void *v48;
  void *v49;
  _QWORD v50[3];

  v50[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend((id)objc_opt_class(), "multiPersonTypeForString:", v6);
  if (v8)
  {
    v9 = v8;
    objc_msgSend((id)objc_opt_class(), "_joiningStringForCoupleString:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v7, "containsObject:", CFSTR("EMFSkinToneSpecifierTypeFitzpatrickSilhouette"));
    if (!v11)
      goto LABEL_12;
    objc_msgSend(v7, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("EMFSkinToneSpecifierTypeFitzpatrickSilhouette"));

    if ((v13 & 1) != 0)
    {
      objc_msgSend(v7, "lastObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("EMFSkinToneSpecifierTypeFitzpatrickSilhouette"));

      if ((v15 & 1) != 0)
      {
        if (v10)
          goto LABEL_12;
        v16 = CFSTR("EMFSkinToneSpecifierTypeFitzpatrick6");
LABEL_11:
        v50[0] = v16;
        v50[1] = v16;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 2);
        v19 = objc_claimAutoreleasedReturnValue();

        v7 = (id)v19;
LABEL_12:
        v20 = (void *)objc_opt_class();
        objc_msgSend(v7, "firstObject");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "_skinToneSuffixFromSpecifierType:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v7, "count") == 2)
        {
          v23 = (void *)objc_opt_class();
          objc_msgSend(v7, "lastObject");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "_skinToneSuffixFromSpecifierType:", v24);
          v25 = (id)objc_claimAutoreleasedReturnValue();

          if (!v10)
            goto LABEL_21;
        }
        else
        {
          v25 = v22;
          if (!v10)
            goto LABEL_21;
        }
        v26 = objc_msgSend(v10, "isEqualToString:", CFSTR("‍🤝‍"));
        if (v9 != 5 && (v26 & 1) == 0)
        {
          v27 = objc_msgSend(v22, "length");
          v28 = (void *)objc_opt_class();
          if (v9 == 4 || v27)
          {
            objc_msgSend(v28, "_tokenizedMultiPersonFromString:", v6);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            if ((unint64_t)objc_msgSend(v34, "count") <= 1)
            {

              v34 = &unk_1E6729190;
            }
            v48 = (void *)objc_opt_class();
            objc_msgSend(v34, "firstObject");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "_baseStringForEmojiString:", v49);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "lastObject");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "_baseStringForEmojiString:", v36);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "_coupleStringWithLeftPerson:leftVariant:joiningString:rightPerson:rightVariant:", v35, v22, v10, v37, v25);
            v30 = (__CFString *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            objc_msgSend(v28, "_baseStringForEmojiString:", v6);
            v29 = objc_claimAutoreleasedReturnValue();
LABEL_45:
            v30 = (__CFString *)v29;
          }
          goto LABEL_46;
        }
LABEL_21:
        v30 = 0;
        switch(v9)
        {
          case 1:
            v30 = CFSTR("👫");
            if (v22 && v25)
            {
              v31 = v11 | objc_msgSend(v22, "isEqualToString:", v25) ^ 1;
              v32 = (void *)MEMORY[0x1E0CB3940];
              if ((v31 & 1) == 0)
                goto LABEL_43;
              v45 = CFSTR("👨");
              v47 = v25;
              v43 = CFSTR("‍🤝‍");
              v33 = CFSTR("👩");
              goto LABEL_42;
            }
            break;
          case 2:
            v30 = CFSTR("👭");
            if (v22 && v25)
            {
              v38 = v11 | objc_msgSend(v22, "isEqualToString:", v25) ^ 1;
              v32 = (void *)MEMORY[0x1E0CB3940];
              if ((v38 & 1) == 0)
                goto LABEL_43;
              v47 = v25;
              v33 = CFSTR("👩");
              goto LABEL_37;
            }
            break;
          case 3:
            v30 = CFSTR("👬");
            if (v22 && v25)
            {
              v39 = v11 | objc_msgSend(v22, "isEqualToString:", v25) ^ 1;
              v32 = (void *)MEMORY[0x1E0CB3940];
              if ((v39 & 1) == 0)
                goto LABEL_43;
              v47 = v25;
              v33 = CFSTR("👨");
LABEL_37:
              v43 = CFSTR("‍🤝‍");
              v45 = v33;
              goto LABEL_42;
            }
            break;
          case 5:
            v30 = CFSTR("🤝");
            if (v22 && v25)
            {
              v40 = v11 | objc_msgSend(v22, "isEqualToString:", v25) ^ 1;
              v32 = (void *)MEMORY[0x1E0CB3940];
              if ((v40 & 1) != 0)
              {
                v45 = CFSTR("🫲");
                v47 = v25;
                v43 = CFSTR("‍");
                v33 = CFSTR("🫱");
LABEL_42:
                objc_msgSend(v32, "stringWithFormat:", CFSTR("%@%@%@%@%@"), v33, v22, v43, v45, v47);
              }
              else
              {
LABEL_43:
                objc_msgSend(v32, "stringWithFormat:", CFSTR("%@%@"), v30, v22, v42, v44, v46);
              }
              v29 = objc_claimAutoreleasedReturnValue();
              goto LABEL_45;
            }
            break;
          default:
            break;
        }
LABEL_46:
        v17 = v30;

        goto LABEL_47;
      }
      objc_msgSend(v7, "lastObject");
      v18 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v7, "firstObject");
      v18 = objc_claimAutoreleasedReturnValue();
    }
    v16 = (__CFString *)v18;
    if (!v18)
      goto LABEL_12;
    goto LABEL_11;
  }
  v17 = 0;
LABEL_47:

  return v17;
}

+ (id)_normalizeMultiPersonGroupToShortFormEncoding:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v12;
  void *v13;
  int v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v4 = a3;
  v5 = (void *)MEMORY[0x1B5E308D4]();
  v6 = objc_msgSend(a1, "multiPersonTypeForString:", v4);
  if (v6)
  {
    v7 = v6;
    if ((unint64_t)objc_msgSend(v4, "length") >= 3
      && objc_msgSend(v4, "rangeOfString:options:", CFSTR("‍❤️‍"), 2) == 0x7FFFFFFFFFFFFFFFLL
      && objc_msgSend(v4, "rangeOfString:options:", CFSTR("‍❤️‍💋‍"), 2) == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v7 >= 6 || ((0x17u >> (v7 - 1)) & 1) == 0)
      {
        v10 = v4;
LABEL_17:

        goto LABEL_9;
      }
      objc_msgSend(v8, "appendString:", off_1E66F9C50[v7 - 1]);
      objc_msgSend(a1, "_skinToneSpecifiersForString:", v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "count"))
      {
        objc_msgSend(v12, "firstObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("EMFSkinToneSpecifierTypeFitzpatrickNone"));

        if (!v14)
        {
          if (objc_msgSend(v12, "count") != 2
            || (objc_msgSend(v12, "objectAtIndexedSubscript:", 0),
                v16 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend(v12, "objectAtIndexedSubscript:", 1),
                v17 = (void *)objc_claimAutoreleasedReturnValue(),
                v17,
                v16,
                v16 != v17))
          {
            v15 = v4;
            goto LABEL_16;
          }
          objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "_skinToneSuffixFromSpecifierType:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "appendString:", v19);

        }
      }
      v15 = (id)objc_msgSend(v9, "copy");
LABEL_16:
      v10 = v15;

      goto LABEL_17;
    }
  }
  v10 = v4;
LABEL_9:
  objc_autoreleasePoolPop(v5);

  return v10;
}

+ (id)_normalizeMultiPersonGroupToLongFormEncoding:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1B5E308D4]();
  v6 = objc_msgSend(a1, "multiPersonTypeForString:", v4);
  if (v6)
  {
    v7 = v6;
    if ((unint64_t)objc_msgSend(v4, "length") <= 4
      && objc_msgSend(v4, "rangeOfString:options:", CFSTR("‍❤️‍"), 2) == 0x7FFFFFFFFFFFFFFFLL
      && objc_msgSend(v4, "rangeOfString:options:", CFSTR("‍❤️‍💋‍"), 2) == 0x7FFFFFFFFFFFFFFFLL)
    {
      v8 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
      v9 = v8;
      if (v7 >= 6 || ((0x17u >> (v7 - 1)) & 1) == 0)
      {
        v10 = v4;
LABEL_24:

        goto LABEL_9;
      }
      objc_msgSend(v8, "appendString:", off_1E66F9C78[v7 - 1]);
      objc_msgSend(a1, "_skinToneSpecifiersForString:", v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v12, "count")
        || (objc_msgSend(v12, "firstObject"),
            v13 = (void *)objc_claimAutoreleasedReturnValue(),
            v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("EMFSkinToneSpecifierTypeFitzpatrickNone")),
            v13,
            v14))
      {
        v10 = (id)objc_msgSend(v9, "copy");
LABEL_23:

        goto LABEL_24;
      }
      if (objc_msgSend(v12, "count") == 1)
      {
        objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_skinToneSuffixFromSpecifierType:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v25[0] = v16;
        v25[1] = v16;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (objc_msgSend(v12, "count") != 2)
        {
          v17 = 0;
          goto LABEL_19;
        }
        objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_skinToneSuffixFromSpecifierType:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = v18;
        objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_skinToneSuffixFromSpecifierType:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v24[1] = v20;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

      }
LABEL_19:
      if (v7 == 5)
        v21 = 7;
      else
        v21 = 10;
      objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "insertString:atIndex:", v22, 2);

      objc_msgSend(v17, "objectAtIndexedSubscript:", 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "insertString:atIndex:", v23, v21);

      v10 = (id)objc_msgSend(v9, "copy");
      goto LABEL_23;
    }
  }
  v10 = v4;
LABEL_9:
  objc_autoreleasePoolPop(v5);

  return v10;
}

@end
