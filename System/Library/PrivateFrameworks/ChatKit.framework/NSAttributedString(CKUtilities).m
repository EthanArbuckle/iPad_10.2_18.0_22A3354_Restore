@implementation NSAttributedString(CKUtilities)

- (uint64_t)containsAttribute:()CKUtilities
{
  id v4;
  uint64_t v5;

  v4 = a3;
  v5 = objc_msgSend(a1, "attribute:existsInRange:", v4, 0, objc_msgSend(a1, "length"));

  return v5;
}

- (uint64_t)__ck_bigEmojiStyle
{
  return objc_msgSend(a1, "__ck_bigEmojiStyleWithSingleBigEmojiSupported:", 1);
}

- (uint64_t)__ck_bigEmojiStyleWithSingleBigEmojiSupported:()CKUtilities
{
  return objc_msgSend(a1, "__ck_bigEmojiStyleWithSingleBigEmojiSupported:mediaObjects:", a3, 0);
}

- (uint64_t)__ck_bigEmojiStyleWithSingleBigEmojiSupported:()CKUtilities mediaObjects:
{
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  _QWORD v16[5];
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t *v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;

  v6 = a4;
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "maximumEmojiCountForMultipleBigEmojiFont");
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "string");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __94__NSAttributedString_CKUtilities____ck_bigEmojiStyleWithSingleBigEmojiSupported_mediaObjects___block_invoke;
  v16[3] = &unk_1E274E390;
  v16[4] = a1;
  v12 = v9;
  v17 = v12;
  v19 = &v28;
  v13 = v6;
  v18 = v13;
  v20 = &v24;
  v21 = &v36;
  v22 = &v32;
  v23 = v8;
  objc_msgSend(v10, "enumerateSubstringsInRange:options:usingBlock:", 0, v11, 2, v16);
  if (*((_BYTE *)v33 + 24))
  {
    v14 = 0;
  }
  else if (v37[3] == 1 && a3)
  {
    if (*((_BYTE *)v25 + 24))
    {
      if (*((_BYTE *)v29 + 24))
        v14 = 1;
      else
        v14 = 3;
    }
    else
    {
      v14 = 1;
    }
  }
  else
  {
    v14 = 2 * (v37[3] - 1 < v8);
  }

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);

  return v14;
}

- (id)_fileTransferForMediaObjectInMediaObjects:()CKUtilities matchingAdaptiveGlyphContentIdentifier:
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  id v20;
  uint8_t buf;
  _BYTE v22[15];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "length"))
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v24;
      v20 = v5;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v24 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v12, "transfer", v20);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "adaptiveImageGlyphContentIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v14, "length") && objc_msgSend(v14, "isEqualToString:", v6))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v16 = v12;

              goto LABEL_18;
            }
            IMLogHandleForCategory();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
              -[NSAttributedString(CKUtilities) _fileTransferForMediaObjectInMediaObjects:matchingAdaptiveGlyphContentIdentifier:].cold.1(&buf, v22, v15);

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v9)
          continue;
        break;
      }
      v16 = 0;
LABEL_18:
      v5 = v20;
    }
    else
    {
      v16 = 0;
    }

    objc_msgSend(v16, "transfer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "guid");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (BOOL)_fileTransferGUIDIsForGenmojiOrAnimojiSticker:()CKUtilities
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;

  v3 = (void *)MEMORY[0x1E0D35820];
  v4 = a3;
  objc_msgSend(v3, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transferForGUID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "stickerUserInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0D39310]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D375B8]) & 1) != 0
      || (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D37560]) & 1) != 0
      || objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D375C8]);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (uint64_t)__ck_isOnlyAdaptiveImageGlyphs
{
  uint64_t v2;
  unint64_t v3;
  uint64_t result;
  uint64_t v5;
  unint64_t v6;
  char v7;

  v2 = objc_msgSend(a1, "length");
  if (!v2)
    return 1;
  v3 = v2;
  result = objc_msgSend(a1, "__ck_hasAdaptiveImageGlyphAtIndex:", 0);
  if ((_DWORD)result)
  {
    v5 = 1;
    do
    {
      v6 = v5;
      if (v3 == v5)
        break;
      v7 = objc_msgSend(a1, "__ck_hasAdaptiveImageGlyphAtIndex:", v5);
      v5 = v6 + 1;
    }
    while ((v7 & 1) != 0);
    return v6 >= v3;
  }
  return result;
}

- (BOOL)__ck_hasAdaptiveImageGlyphAtIndex:()CKUtilities
{
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC10F8], a3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(a1, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC10F0], a3, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = 1;
    }
    else
    {
      objc_msgSend(a1, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D36408], a3, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v8 != 0;

    }
  }

  return v6;
}

- (id)__ck_adaptiveImageGlyphAtIndex:()CKUtilities
{
  void *v3;
  id v4;

  objc_msgSend(a1, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0DC10F0], a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v4 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;

  return v4;
}

- (id)__ck_fileTransferGUIDAtIndex:()CKUtilities
{
  void *v3;
  id v4;

  objc_msgSend(a1, "attribute:atIndex:effectiveRange:", *MEMORY[0x1E0D36430], a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v4 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;

  return v4;
}

- (id)__ck_attributedStringByRemovingAllAttributesExcept:()CKUtilities
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v5, "__ck_removeAllAttributesExcept:", v4);

  v6 = (void *)objc_msgSend(v5, "copy");
  return v6;
}

- (id)__ck_attributedStringByTrimmingCharactersInSet:()CKUtilities
{
  id v4;
  void *v5;
  unint64_t i;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  objc_msgSend(a1, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i < objc_msgSend(v5, "length"); ++i)
  {
    if (!objc_msgSend(v4, "characterIsMember:", (unsigned __int16)(char)objc_msgSend(v5, "characterAtIndex:", i)))break;
  }
  v7 = objc_msgSend(v5, "length");
  do
    v8 = v7--;
  while (v7 >= 0
       && (objc_msgSend(v4, "characterIsMember:", (unsigned __int16)(char)objc_msgSend(v5, "characterAtIndex:", v7)) & 1) != 0);
  if ((uint64_t)i <= v7)
  {
    objc_msgSend(a1, "attributedSubstringFromRange:", i, v8 - i);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", &stru_1E276D870);
  }
  v10 = (void *)v9;

  return v10;
}

- (void)_fileTransferForMediaObjectInMediaObjects:()CKUtilities matchingAdaptiveGlyphContentIdentifier:.cold.1(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_18DFCD000, log, OS_LOG_TYPE_ERROR, "Found media object matching adaptive image glyph content identifier, but not of the correct media object class", buf, 2u);
}

@end
