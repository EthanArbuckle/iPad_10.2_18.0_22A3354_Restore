@implementation _UISticker(ChatKit)

- (uint64_t)_ck_shouldInsertInCompositionAsAdaptiveImageGlyph
{
  NSObject *v2;
  int v4;
  NSObject *v5;

  if (objc_msgSend(a1, "isAnimated"))
  {
    IMLogHandleForCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      -[_UISticker(ChatKit) _ck_shouldInsertInCompositionAsAdaptiveImageGlyph].cold.1();

    return 0;
  }
  else
  {
    v4 = objc_msgSend(a1, "hasLiveEffect");
    if (v4)
    {
      IMLogHandleForCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        -[_UISticker(ChatKit) _ck_shouldInsertInCompositionAsAdaptiveImageGlyph].cold.2();

    }
    return v4 ^ 1u;
  }
}

- (uint64_t)_ck_shouldInsertInTapbackAsAdaptiveImageGlyph
{
  NSObject *v2;
  unint64_t v3;
  uint64_t v4;

  if (objc_msgSend(a1, "isAnimated"))
  {
    IMLogHandleForCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      -[_UISticker(ChatKit) _ck_shouldInsertInTapbackAsAdaptiveImageGlyph].cold.1();
LABEL_10:
    v4 = 0;
    goto LABEL_11;
  }
  if (objc_msgSend(a1, "hasLiveEffect"))
  {
    IMLogHandleForCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      -[_UISticker(ChatKit) _ck_shouldInsertInTapbackAsAdaptiveImageGlyph].cold.2();
    goto LABEL_10;
  }
  v3 = objc_msgSend(a1, "_ck_stickerType");
  if (v3 < 5)
  {
    IMLogHandleForCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      -[_UISticker(ChatKit) _ck_shouldInsertInTapbackAsAdaptiveImageGlyph].cold.4();
    goto LABEL_10;
  }
  if (v3 != 5)
    return 0;
  IMLogHandleForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    -[_UISticker(ChatKit) _ck_shouldInsertInTapbackAsAdaptiveImageGlyph].cold.3();
  v4 = 1;
LABEL_11:

  return v4;
}

- (uint64_t)_ck_stickerType
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "searchText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  if (!v3)
  {
    objc_msgSend(a1, "externalURI");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length"))
    {
      if (objc_msgSend(v5, "hasPrefix:", CFSTR("sticker:///user/")))
      {
        objc_msgSend(a1, "__ck_representationWithRole:", CFSTR("com.apple.stickers.role.stillVariant_40"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6)
          v4 = 5;
        else
          v4 = 1;

        goto LABEL_16;
      }
      if ((objc_msgSend(v5, "hasPrefix:", CFSTR("sticker:///memoji/")) & 1) != 0)
      {
        v4 = 3;
LABEL_16:

        return v4;
      }
      if ((objc_msgSend(v5, "hasPrefix:", CFSTR("sticker:///emoji/")) & 1) != 0)
      {
        v4 = 4;
        goto LABEL_16;
      }
      if ((objc_msgSend(v5, "hasPrefix:", CFSTR("sticker:///third_party/")) & 1) != 0)
      {
        v4 = 2;
        goto LABEL_16;
      }
    }
    v4 = 0;
    goto LABEL_16;
  }
  return 5;
}

- (id)__ck_representationWithRole:()ChatKit
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "representations");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "role", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_ck_plainStringEmojiText
{
  void *v1;
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(a1, "externalURI");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "hasPrefix:", CFSTR("sticker:///emoji/identifier/")))
  {
    objc_msgSend(v1, "substringFromIndex:", objc_msgSend(CFSTR("sticker:///emoji/identifier/"), "length"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "length"))
    {
      objc_msgSend(MEMORY[0x1E0D1F268], "emojiTokenWithString:localeData:", v2, 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = 0;
      if (objc_msgSend(v3, "isValid"))
        v4 = v2;

    }
    else
    {
      v4 = 0;
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_ck_shouldInsertInCompositionAsAdaptiveImageGlyph
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_18DFCD000, v0, v1, "Not inserting as adaptive image glyph in composition because sticker has a live effect", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_ck_shouldInsertInTapbackAsAdaptiveImageGlyph
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_18DFCD000, v0, v1, "Not inserting as adaptive image glyph in tapback due to non-genmoji sticker type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
