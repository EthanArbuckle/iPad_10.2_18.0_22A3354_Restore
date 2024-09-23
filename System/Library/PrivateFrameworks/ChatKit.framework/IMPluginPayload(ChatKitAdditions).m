@implementation IMPluginPayload(ChatKitAdditions)

- (id)cleansedCopy
{
  void *v1;
  void *v2;

  v1 = (void *)objc_msgSend(a1, "copy");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setMessageGUID:", v2);

  objc_msgSend(v1, "setDatasource:", 0);
  return v1;
}

- (uint64_t)__ck_photoCompositionMediaObjects
{
  return objc_msgSend(a1, "__ck_photoCompositionMediaObjectsWithKeyToTrasferGUIDMap:", 0);
}

- (id)__ck_photoCompositionMediaObjectsWithKeyToTrasferGUIDMap:()ChatKitAdditions
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(a1, "attachments", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v11, "mediaObjectFromPayloadWithKeyToTrasferGUIDMap:", v4);
          v12 = objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            v13 = (void *)v12;
            objc_msgSend(v5, "addObject:", v12);

          }
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)__ck_photoCompositionString
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  const __CFString *v19;
  void *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v14 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(a1, "attachments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v16;
    v6 = *MEMORY[0x1E0D362F8];
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v9 = v8;
          objc_msgSend(v9, "mediaObjectFromPayload");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10)
          {
            v19 = CFSTR("MediaObjectForTextAttachment");
            v20 = v10;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v6, v11);
            objc_msgSend(v14, "appendAttributedString:", v12);

          }
        }
        ++v7;
      }
      while (v4 != v7);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    }
    while (v4);
  }

  return v14;
}

- (id)__ck_superFormatStringTransferGUIDs:()ChatKitAdditions mediaObjects:
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  _QWORD *v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  int v41;
  uint64_t v42;
  void *v43;
  uint64_t v45;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;
  void *v58;
  _BYTE v59[128];
  _QWORD v60[2];
  _QWORD v61[4];

  v61[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  objc_msgSend(a1, "breadcrumbText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0CB3498]);
    v9 = *MEMORY[0x1E0D36318];
    v60[0] = *MEMORY[0x1E0D36320];
    objc_msgSend(a1, "breadcrumbText");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v60[1] = *MEMORY[0x1E0D36328];
    v61[0] = v10;
    v61[1] = &unk_1E2871038;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, v60, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v8, "initWithString:attributes:", v9, v11);

    objc_msgSend(v5, "appendAttributedString:", v12);
  }
  v48 = v5;
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  objc_msgSend(a1, "attachments");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v54;
    v50 = *MEMORY[0x1E0D362F8];
    v49 = *MEMORY[0x1E0D36430];
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v54 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v19 = v18;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(a1, "attributionInfo");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v20 = 0;
          }
          +[CKMediaObjectManager sharedInstance](CKMediaObjectManager, "sharedInstance");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v45) = objc_msgSend(a1, "shouldHideAttachments");
          objc_msgSend(v22, "mediaObjectWithFileURL:filename:transcoderUserInfo:attributionInfo:adaptiveImageGlyphContentIdentifier:adaptiveImageGlyphContentDescription:hideAttachment:", v19, 0, 0, v20, 0, 0, v45);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v21)
            goto LABEL_19;
LABEL_16:
          objc_msgSend(v52, "addObject:", v21);
          objc_msgSend(v21, "transferGUID");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "addObject:", v23);
          v24 = objc_alloc(MEMORY[0x1E0CB3498]);
          v57 = v49;
          v58 = v23;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = (void *)objc_msgSend(v24, "initWithString:attributes:", v50, v25);

          if (v26)
          {
            objc_msgSend(v48, "appendAttributedString:", v26);

          }
          goto LABEL_19;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v21 = 0;
          goto LABEL_19;
        }
        objc_msgSend(v18, "mediaObjectFromPayload");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
          goto LABEL_16;
LABEL_19:

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
    }
    while (v15);
  }

  objc_msgSend(a1, "text");
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = (_QWORD *)MEMORY[0x1E0D375F8];
  if (v27)
  {
    v29 = (void *)v27;
    objc_msgSend(a1, "pluginBundleID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "isEqualToString:", *v28);

    if ((v31 & 1) == 0)
    {
      objc_msgSend(a1, "text");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "appendAttributedString:", v32);

    }
  }
  objc_msgSend(a1, "url");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    v34 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(a1, "url");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "absoluteString");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)objc_msgSend(v34, "initWithString:", v36);
    objc_msgSend(v48, "appendAttributedString:", v37);

  }
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "isRichLinkImprovementsEnabled");

  if (v39)
  {
    objc_msgSend(a1, "pluginBundleID");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "isEqualToString:", *v28);

    if (v41)
    {
      v42 = objc_msgSend(v48, "length");
      objc_msgSend(v48, "addAttribute:value:range:", *MEMORY[0x1E0D381A0], MEMORY[0x1E0C9AAB0], 0, v42);
    }
  }
  if (a4)
    *a4 = (id)objc_msgSend(v52, "copy");
  if (a3)
    *a3 = (id)objc_msgSend(v51, "copy");
  objc_msgSend(v48, "__im_attributedStringByAssigningMessagePartNumbers");
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  return v43;
}

@end
