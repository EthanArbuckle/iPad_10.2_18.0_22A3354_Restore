@implementation NSAttributedString(TextEffects)

- (id)ck_attributedStringByApplyingTextEffectType:()TextEffects range:
{
  void *v8;
  void *v9;

  v8 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v8, "ck_applyTextEffectType:range:", a3, a4, a5);
  v9 = (void *)objc_msgSend(v8, "copy");

  return v9;
}

- (id)ck_attributedStringByApplyingTextStyle:()TextEffects range:
{
  void *v8;
  void *v9;

  v8 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v8, "ck_addTextStyle:options:range:", a3, 3, a4, a5);
  v9 = (void *)objc_msgSend(v8, "copy");

  return v9;
}

- (BOOL)ck_attributedStringHasTextEffectType:()TextEffects inRange:
{
  unint64_t v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  uint64_t v15;
  unint64_t v16;

  if (a4 >= objc_msgSend(a1, "length"))
  {
    objc_msgSend(a1, "length");
    return 0;
  }
  else
  {
    v9 = objc_msgSend(a1, "length");
    v10 = 0;
    if (objc_msgSend(a1, "length") && a4 + a5 <= v9)
    {
      v15 = 0;
      v16 = 0;
      objc_msgSend(a1, "attributesAtIndex:longestEffectiveRange:inRange:", a4, &v15, a4, a5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", *MEMORY[0x1E0D393F0]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12
         && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
         && objc_msgSend(v12, "unsignedIntegerValue") == a3;
      v10 = v16 >= a5 && v13;

    }
  }
  return v10;
}

- (uint64_t)ck_activeTextEffectTypeInRange:()TextEffects
{
  return objc_msgSend(a1, "ck_activeTextEffectTypeInRange:ignoreRangeLengthCheck:", a3, a4, 0);
}

- (id)ck_attributedStringByTogglingTextEffectNamed:()TextEffects range:
{
  id v8;
  void *v9;
  void *v10;

  v8 = a3;
  v9 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v9, "ck_toggleTextEffectNamed:range:getAdded:", v8, a4, a5, 0);

  v10 = (void *)objc_msgSend(v9, "copy");
  return v10;
}

- (id)ck_attributedStringByConverting:()TextEffects range:
{
  id v8;
  void *v9;
  void *v10;

  v8 = a3;
  v9 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v9, "ck_convertAttributesUsingConversionHandler:range:", v8, a4, a5);

  v10 = (void *)objc_msgSend(v9, "copy");
  return v10;
}

- (BOOL)ck_actionForIMTextStyle:()TextEffects range:
{
  void *v8;
  NSRange v9;
  _BOOL8 v11;
  _QWORD v13[5];
  uint64_t v14;
  NSRange *v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  NSRange v19;

  IMTextStyleAttributeNameFromStyle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v14 = 0;
    v15 = (NSRange *)&v14;
    v16 = 0x3010000000;
    v17 = &unk_18E8EEE6F;
    v18 = xmmword_18E7C9230;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __65__NSAttributedString_TextEffects__ck_actionForIMTextStyle_range___block_invoke;
    v13[3] = &unk_1E274EED0;
    v13[4] = &v14;
    objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v8, a4, a5, 0, v13);
    v19.location = a4;
    v19.length = a5;
    v9 = NSIntersectionRange(v15[2], v19);
    v11 = v9.location == a4 && v9.length == a5;
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (uint64_t)ck_activeTextStylesInRange:()TextEffects
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  if (!objc_msgSend(a1, "length"))
    return 0;
  objc_msgSend(a1, "attributesAtIndex:effectiveRange:", a3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1248]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = 4;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D39440]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = 4;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0DC11A8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 |= 8uLL;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D39428]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 |= 8uLL;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1138]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "fontDescriptor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v7 |= __rbit32(objc_msgSend(v13, "symbolicTraits")) >> 30;

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D393E8]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_opt_class();
    v7 |= objc_opt_isKindOfClass() & 1;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D39420]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 |= 2uLL;
  }

  return v7;
}

- (BOOL)ck_hasTextStyle:()TextEffects range:
{
  return (objc_msgSend(a1, "ck_activeTextStylesInRange:", a4, a5) & a3) != 0;
}

@end
