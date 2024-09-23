@implementation CKPersistentTextForText

void __CKPersistentTextForText_block_invoke(void **a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  const __CFString *v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PluginDisplayContainer"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("MediaObjectForTextAttachment"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AdaptiveImageGlyphMediaObject"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("EmbeddedRichLinkConfiguration"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 || (v9 = v10) != 0)
  {
    v28 = v11;
    v29 = v8;
    CKWriteMediaObjectToFileLocation(v9, a1[4], a1[5]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = a1[6];
    v32 = CFSTR("CKCompositionFileURL");
    v33[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAttributes:range:", v14, a3, a4);

    objc_msgSend(v9, "transcoderUserInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
      objc_msgSend(a1[6], "addAttribute:value:range:", CFSTR("CKCompositionTranscoderUserInfo"), v15, a3, a4);
    objc_msgSend(v9, "transfer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "attributionInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
      objc_msgSend(a1[6], "addAttribute:value:range:", CFSTR("CKCompositionAttributionInfo"), v17, a3, a4);
    objc_msgSend(v10, "transfer", v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "adaptiveImageGlyphContentIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
      objc_msgSend(a1[6], "addAttribute:value:range:", CFSTR("CKCompositionAdaptiveImageGlyphContentIdentifier"), v19, a3, a4);
    objc_msgSend(v18, "adaptiveImageGlyphContentDescription");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
      objc_msgSend(a1[6], "addAttribute:value:range:", CFSTR("CKCompositionAdaptiveImageGlyphContentDescription"), v20, a3, a4);

    v11 = v28;
    v8 = v29;
    v10 = v27;
  }
  else
  {
    if (v11)
    {
      CKWriteRichLinkObjectToFileLocation(v11, a1[4], a1[5]);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = a1[6];
      v30 = CFSTR("CKCompositionInlineRichLinkItemFileURL");
      v31 = v21;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = a4;
      v25 = v10;
      v26 = (void *)v23;
      objc_msgSend(v22, "setAttributes:range:", v23, a3, v24);

      v10 = v25;
    }
    else if (!v8 && (objc_msgSend(a1[6], "containsAttribute:", *MEMORY[0x1E0D381F0]) & 1) == 0)
    {
      objc_msgSend(a1[6], "setAttributes:range:", 0, a3, a4);
    }
    v9 = 0;
  }

}

@end
