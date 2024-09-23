@implementation NSAttributedString(RichLinks)

- (id)__ck_attributedStringByApplyingRichLinkInteraction:()RichLinks toRichLinkItems:stringDidChange:
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v8 = a4;
  v9 = a1;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__30;
  v26 = __Block_byref_object_dispose__30;
  v27 = 0;
  v27 = (id)objc_msgSend(v9, "mutableCopy");
  v10 = objc_msgSend(v9, "length");
  v11 = *MEMORY[0x1E0DC10F8];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __116__NSAttributedString_RichLinks____ck_attributedStringByApplyingRichLinkInteraction_toRichLinkItems_stringDidChange___block_invoke;
  v16[3] = &unk_1E2750278;
  v12 = v8;
  v17 = v12;
  v20 = a3;
  v13 = v9;
  v18 = v13;
  v19 = &v22;
  v21 = a5;
  objc_msgSend(v13, "enumerateAttribute:inRange:options:usingBlock:", v11, 0, v10, 0, v16);
  v14 = (void *)objc_msgSend((id)v23[5], "copy");

  _Block_object_dispose(&v22, 8);
  return v14;
}

- (id)ck_attributedStringByPostProcessingURLTextForRichLinks
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t, uint64_t);
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, uint64_t, uint64_t);
  void *v15;
  id v16;

  IMAttributedStringByRemovingTrackingInformation();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_msgSend(v0, "mutableCopy");
  v2 = MEMORY[0x1E0C809B0];
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __87__NSAttributedString_RichLinks__ck_attributedStringByPostProcessingURLTextForRichLinks__block_invoke;
  v15 = &unk_1E27502A0;
  v16 = v1;
  IMRichLinkUtilitiesEnumerateRichLinksInAttributedString();
  v3 = objc_msgSend(v16, "length");
  v7 = v2;
  v8 = 3221225472;
  v9 = __87__NSAttributedString_RichLinks__ck_attributedStringByPostProcessingURLTextForRichLinks__block_invoke_2;
  v10 = &unk_1E274EF20;
  v11 = v16;
  v4 = v16;
  objc_msgSend(v4, "enumerateAttribute:inRange:options:usingBlock:", CFSTR("EmbeddedRichLinkConfiguration"), 0, v3, 0, &v7);
  v5 = (void *)objc_msgSend(v4, "copy", v7, v8, v9, v10);

  return v5;
}

- (id)ck_linkPreviewTextAttachmentsInRange:()RichLinks
{
  NSRange v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  NSRange v18;
  NSRange v19;

  v19.length = objc_msgSend(a1, "length");
  v18.location = a3;
  v18.length = a4;
  v19.location = 0;
  v7 = NSIntersectionRange(v18, v19);
  if (!v7.length)
    return MEMORY[0x1E0C9AA60];
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__30;
  v16 = __Block_byref_object_dispose__30;
  v17 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0DC10F8];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __70__NSAttributedString_RichLinks__ck_linkPreviewTextAttachmentsInRange___block_invoke;
  v11[3] = &unk_1E274EED0;
  v11[4] = &v12;
  objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v8, v7.location, v7.length, 0, v11);
  v9 = (void *)objc_msgSend((id)v13[5], "copy");
  _Block_object_dispose(&v12, 8);

  return v9;
}

- (uint64_t)__ck_rangeOfRichLinkItem:()RichLinks
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void *v16;
  __int128 v17;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3010000000;
  v16 = &unk_18E8EEE6F;
  v17 = xmmword_18E7C9230;
  v5 = objc_msgSend(a1, "length");
  v6 = *MEMORY[0x1E0DC10F8];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58__NSAttributedString_RichLinks____ck_rangeOfRichLinkItem___block_invoke;
  v10[3] = &unk_1E2750250;
  v7 = v4;
  v11 = v7;
  v12 = &v13;
  objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v6, 0, v5, 0, v10);
  v8 = v14[4];

  _Block_object_dispose(&v13, 8);
  return v8;
}

@end
