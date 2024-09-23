@implementation CKTextForPersistentText

void __CKTextForPersistentText_block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char isKindOfClass;
  void *v14;
  void *v15;
  void **v16;
  const __CFString **v17;
  void *v18;
  uint64_t v19;
  const __CFString *v20;
  void *v21;
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "attribute:atIndex:effectiveRange:", CFSTR("CKCompositionTranscoderUserInfo"), a3, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "attribute:atIndex:effectiveRange:", CFSTR("CKCompositionAttributionInfo"), a3, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "attribute:atIndex:effectiveRange:", CFSTR("CKCompositionAdaptiveImageGlyphContentIdentifier"), a3, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "attribute:atIndex:effectiveRange:", CFSTR("CKCompositionAdaptiveImageGlyphContentDescription"), a3, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v19) = *(_BYTE *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 40), "mediaObjectWithFileURL:filename:transcoderUserInfo:attributionInfo:adaptiveImageGlyphContentIdentifier:adaptiveImageGlyphContentDescription:hideAttachment:", v7, 0, v8, v9, v10, v11, v19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v14 = *(void **)(a1 + 32);
      if ((isKindOfClass & 1) != 0)
      {
        v22 = CFSTR("AdaptiveImageGlyphMediaObject");
        v23[0] = v12;
        v15 = (void *)MEMORY[0x1E0C99D80];
        v16 = (void **)v23;
        v17 = &v22;
      }
      else
      {
        v20 = CFSTR("MediaObjectForTextAttachment");
        v21 = v12;
        v15 = (void *)MEMORY[0x1E0C99D80];
        v16 = &v21;
        v17 = &v20;
      }
      objc_msgSend(v15, "dictionaryWithObjects:forKeys:count:", v16, v17, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setAttributes:range:", v18, a3, a4);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "setAttributes:range:", 0, a3, a4);
    }

  }
  else if ((objc_msgSend(*(id *)(a1 + 48), "containsAttribute:", *MEMORY[0x1E0D381F0]) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setAttributes:range:", 0, a3, a4);
  }

}

void __CKTextForPersistentText_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(a1 + 32);
    v11 = CFSTR("EmbeddedRichLinkConfiguration");
    v12[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAttributes:range:", v10, a3, a4);

  }
}

@end
