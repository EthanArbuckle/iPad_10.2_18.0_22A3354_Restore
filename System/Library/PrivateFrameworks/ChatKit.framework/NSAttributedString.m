@implementation NSAttributedString

void __94__NSAttributedString_CKUtilities____ck_bigEmojiStyleWithSingleBigEmojiSupported_mediaObjects___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  int IsSingleEmoji;
  int v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  int v21;
  char v22;
  char v23;
  id v24;

  v24 = a2;
  IsSingleEmoji = CEMStringIsSingleEmoji();
  v11 = objc_msgSend(v24, "isEqualToString:", *MEMORY[0x1E0D362F8]);
  if (v11)
    v12 = objc_msgSend(*(id *)(a1 + 32), "__ck_hasAdaptiveImageGlyphAtIndex:", a3);
  else
    v12 = 0;
  objc_msgSend(v24, "stringByTrimmingCharactersInSet:", *(_QWORD *)(a1 + 40));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "length");

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "__ck_fileTransferGUIDAtIndex:", a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
      v16 = 0;
    else
      v16 = v12;
    if (v16 == 1)
    {
      if (*(_QWORD *)(a1 + 48))
      {
        objc_msgSend(*(id *)(a1 + 32), "__ck_adaptiveImageGlyphAtIndex:", a3);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = *(void **)(a1 + 32);
        v19 = *(_QWORD *)(a1 + 48);
        objc_msgSend(v17, "contentIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "_fileTransferForMediaObjectInMediaObjects:matchingAdaptiveGlyphContentIdentifier:", v19, v20);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v15 = 0;
      }
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_fileTransferGUIDIsForGenmojiOrAnimojiSticker:", v15);

  }
  if (IsSingleEmoji)
    v21 = 1;
  else
    v21 = v12;
  if (v21 == 1)
  {
    if (IsSingleEmoji)
      v22 = 0;
    else
      v22 = v12;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v22;
    if (++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) <= *(_QWORD *)(a1 + 88))
      goto LABEL_28;
LABEL_27:
    *a7 = 1;
    goto LABEL_28;
  }
  if (v14)
    v23 = v11;
  else
    v23 = 1;
  if ((v23 & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
    goto LABEL_27;
  }
LABEL_28:

}

void __65__NSAttributedString_TextEffects__ck_actionForIMTextStyle_range___block_invoke(uint64_t a1, void *a2, NSUInteger a3, NSUInteger a4)
{
  id v7;
  char isKindOfClass;
  uint64_t v9;
  NSRange v10;
  id v11;
  NSRange v12;

  v7 = a2;
  if (v7)
  {
    v11 = v7;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v7 = v11;
    if ((isKindOfClass & 1) != 0)
    {
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v10.location = *(_QWORD *)(v9 + 32);
      if (v10.location == 0x7FFFFFFFFFFFFFFFLL)
      {
        *(_QWORD *)(v9 + 32) = a3;
        *(_QWORD *)(v9 + 40) = a4;
      }
      else
      {
        v10.length = *(_QWORD *)(v9 + 40);
        v12.location = a3;
        v12.length = a4;
        *(NSRange *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = NSUnionRange(v10, v12);
        v7 = v11;
      }
    }
  }

}

void __116__NSAttributedString_RichLinks____ck_attributedStringByApplyingRichLinkInteraction_toRichLinkItems_stringDidChange___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL8 v11;
  void *v12;
  void *v13;
  _BOOL8 v14;
  __CFString *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE *v23;
  int v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = v7;
    if (!objc_msgSend(*(id *)(a1 + 32), "containsObject:", v8))
    {
LABEL_17:

      goto LABEL_18;
    }
    v9 = *(_QWORD *)(a1 + 56);
    if (v9 == 2)
    {
      objc_msgSend(v8, "urlText");
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v14 = 0;
      if (v15)
      {
LABEL_8:
        v16 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "__ck_rangeOfRichLinkItem:", v8);
        if (v16 == 0x7FFFFFFFFFFFFFFFLL)
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              v19 = objc_msgSend(*(id *)(a1 + 32), "count");
              v24 = 134217984;
              v25 = v19;
              _os_log_impl(&dword_18DFCD000, v18, OS_LOG_TYPE_INFO, "String inconsistency! While traversing a string with {%ld} targeted rich links, the text attachment was not found in the output string.", (uint8_t *)&v24, 0xCu);
            }

          }
        }
        else
        {
          v20 = v16;
          v21 = v17 + v14;
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "removeAttribute:range:", *MEMORY[0x1E0DC10F8], v16, v21);
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "replaceCharactersInRange:withString:", v20, v21, v15);
          v22 = -[__CFString length](v15, "length");
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addAttribute:value:range:", *MEMORY[0x1E0D381A0], MEMORY[0x1E0C9AAA0], v20, v22);
          v23 = *(_BYTE **)(a1 + 64);
          if (v23)
            *v23 = 1;
        }
      }
    }
    else
    {
      if (!v9)
      {
        v10 = a3 + a4;
        v11 = v10 + 1 <= (unint64_t)objc_msgSend(*(id *)(a1 + 40), "length");
        objc_msgSend(*(id *)(a1 + 40), "string");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "rangeOfCharacterFromSet:options:range:", v13, 12, v10, v11) != 0x7FFFFFFFFFFFFFFFLL;

        v15 = &stru_1E276D870;
        goto LABEL_8;
      }
      v15 = 0;
    }

    goto LABEL_17;
  }
LABEL_18:

}

void __87__NSAttributedString_RichLinks__ck_attributedStringByPostProcessingURLTextForRichLinks__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7;

  if (a2)
  {
    +[CKEmbeddedRichLinkConfiguration richLinkConfigurationWithURL:](CKEmbeddedRichLinkConfiguration, "richLinkConfigurationWithURL:", a2);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", CFSTR("EmbeddedRichLinkConfiguration"), v7, a3, a4);

  }
}

uint64_t __87__NSAttributedString_RichLinks__ck_attributedStringByPostProcessingURLTextForRichLinks__block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "replaceCharactersInRange:withString:", a3, a4, *MEMORY[0x1E0D362F8]);
  return result;
}

void __70__NSAttributedString_RichLinks__ck_linkPreviewTextAttachmentsInRange___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v3);

}

uint64_t __58__NSAttributedString_RichLinks____ck_rangeOfRichLinkItem___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t v5;

  if (a2)
  {
    if (*(_QWORD *)(result + 32) == a2)
    {
      v5 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
      *(_QWORD *)(v5 + 32) = a3;
      *(_QWORD *)(v5 + 40) = a4;
      *a5 = 1;
    }
  }
  return result;
}

void __99__NSAttributedString_MentionsHelper__ck_textKit1_enumerateAllAutomaticConfirmedMentionsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __99__NSAttributedString_MentionsHelper__ck_textKit2_enumerateAllAutomaticConfirmedMentionsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __109__NSAttributedString_CKMessageEntryRichTextViewHelper__ck_enumerateAllMentionAnimationIdentifiersUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  char isKindOfClass;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v7 = a2;
  if (v7)
  {
    v12 = v7;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v7 = v12;
    if ((isKindOfClass & 1) != 0)
    {
      v9 = v12;
      if (objc_msgSend(v9, "length"))
      {
        v10 = *(_QWORD *)(a1 + 32);
        v11 = (void *)objc_msgSend(v9, "copy");
        (*(void (**)(uint64_t, void *, uint64_t, uint64_t))(v10 + 16))(v10, v11, a3, a4);

      }
      v7 = v12;
    }
  }

}

void __86__NSAttributedString_CompositionSanitizing__ck_defaultAllowedAttributesForComposition__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[15];

  v10[14] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = *MEMORY[0x1E0DC10F0];
  v10[0] = *MEMORY[0x1E0DC10F8];
  v10[1] = v1;
  v10[2] = CFSTR("com.apple.messages.mapattribute");
  v10[3] = CFSTR("com.apple.MobileSMS.PluginPayload");
  v2 = *MEMORY[0x1E0D393F0];
  v10[4] = CFSTR("com.apple.MobileSMS.appendedURL");
  v10[5] = v2;
  v3 = *MEMORY[0x1E0D39420];
  v10[6] = *MEMORY[0x1E0D393E8];
  v10[7] = v3;
  v4 = *MEMORY[0x1E0D39428];
  v10[8] = *MEMORY[0x1E0D39440];
  v10[9] = v4;
  v5 = *MEMORY[0x1E0DC11A8];
  v10[10] = *MEMORY[0x1E0DC1248];
  v10[11] = v5;
  v6 = *MEMORY[0x1E0D381F0];
  v10[12] = *MEMORY[0x1E0DC1138];
  v10[13] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)ck_defaultAllowedAttributesForComposition_sAttributes;
  ck_defaultAllowedAttributesForComposition_sAttributes = v8;

}

@end
