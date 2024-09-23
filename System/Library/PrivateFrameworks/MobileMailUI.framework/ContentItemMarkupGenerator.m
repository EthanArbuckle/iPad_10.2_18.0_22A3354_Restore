@implementation ContentItemMarkupGenerator

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__ContentItemMarkupGenerator_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken != -1)
    dispatch_once(&log_onceToken, block);
  return (OS_os_log *)(id)log_log;
}

void __33__ContentItemMarkupGenerator_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.mobilemail", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log;
  log_log = (uint64_t)v1;

}

+ (id)markupStringForDisplayForContentItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  _QWORD v20[3];
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isAvailableLocally");
  if ((objc_msgSend(a1, "isDisplayableInlineContentItem:", v4) & v7) == 1)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x1E0CEC570];
    if (objc_msgSend(v5, "conformsToType:", *MEMORY[0x1E0CEC570]))
    {
      objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("rgb(254,254,254)"), CFSTR("background-color"));
      objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("none"), CFSTR("-apple-color-filter"));
    }
    if (objc_msgSend(MEMORY[0x1E0DC3708], "mf_isPad"))
    {
      if (objc_msgSend(v5, "conformsToType:", v9))
        objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("100%"), CFSTR("max-width"));
      objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("1px 0px 1px 0px"), CFSTR("padding"));
    }
    v21[0] = v8;
    v20[0] = CFSTR("style");
    v20[1] = CFSTR("src");
    v10 = (void *)MFCreateURLForContentID();
    v20[2] = CFSTR("id");
    v21[1] = v10;
    v21[2] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D1EEC8], "htmlSnippetWithTag:includeTrailingTag:attributes:", CFSTR("img"), 0, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "attachmentElementMarkupStringForContentItem:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  +[ContentItemMarkupGenerator log](ContentItemMarkupGenerator, "log");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "ef_publicDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543618;
    v17 = v14;
    v18 = 2112;
    v19 = v12;
    _os_log_impl(&dword_1D56AF000, v13, OS_LOG_TYPE_DEFAULT, "Content Item %{public}@ generated snippet: %@", (uint8_t *)&v16, 0x16u);

  }
  return v12;
}

+ (id)attachmentElementMarkupStringForContentItem:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  __CFString *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint8_t v28[16];
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[ContentItemMarkupGenerator log](ContentItemMarkupGenerator, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "contentID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v30 = v5;
    _os_log_impl(&dword_1D56AF000, v4, OS_LOG_TYPE_DEFAULT, "Start to set up markup string for content item: %@", buf, 0xCu);

  }
  objc_msgSend(v3, "displayName");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "type");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("id"));

  objc_msgSend(v3, "contentID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("src"));

  if (v6)
    v11 = v6;
  else
    v11 = CFSTR("---");
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("title"));
  objc_msgSend(v7, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, CFSTR("type"));

  MFLookupLocalizedString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, CFSTR("_mf_downloadingStatus"));

  MFLookupLocalizedString();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, CFSTR("_mf_downloadableStatus"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", _os_feature_enabled_impl());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, CFSTR("_mf_show_save"));

  if (objc_msgSend(v3, "isAvailableLocally"))
  {
    objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_1E9A14538, CFSTR("_mf_state"));
    if (_os_feature_enabled_impl())
      objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("save"), CFSTR("save"));
  }
  else
  {
    objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_1E9A14550, CFSTR("_mf_state"));
    MFLookupLocalizedString();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, CFSTR("action"));

  }
  if ((objc_msgSend(v7, "conformsToType:", *MEMORY[0x1E0CEC6A8]) & 1) != 0)
    v17 = 1;
  else
    v17 = objc_msgSend(v7, "conformsToType:", *MEMORY[0x1E0CEC6A0]);
  if ((objc_msgSend(v3, "isAvailableLocally") & v17 & 1) != 0)
  {
    +[ContentItemMarkupGenerator log](ContentItemMarkupGenerator, "log");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "ef_publicDescription");
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(0, "ef_publicDescription");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[ContentItemMarkupGenerator attachmentElementMarkupStringForContentItem:].cold.2(v19, v20, buf, v18);
    }

  }
  v21 = objc_msgSend(v3, "storageByteCount");
  if (!objc_msgSend(v3, "exchangeEventUID"))
  {
    if (v21)
    {
      objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", v21, 0);
      v22 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v22, CFSTR("subtitle"));
    }
    else
    {
      v24 = objc_msgSend(v3, "dataTransferByteCount");
      if (v24)
      {
        objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", v24, 1);
        v22 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v22, CFSTR("subtitle"));
      }
      else
      {
        +[ContentItemMarkupGenerator log](ContentItemMarkupGenerator, "log");
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v3, "ef_publicDescription");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          +[ContentItemMarkupGenerator attachmentElementMarkupStringForContentItem:].cold.1(v25, v28, v22);
        }
      }
    }
    goto LABEL_26;
  }
  if (objc_msgSend(v3, "exchangeEventUID") == -1)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v22 = objc_claimAutoreleasedReturnValue();
    -[NSObject localizedStringForKey:value:table:](v22, "localizedStringForKey:value:table:", CFSTR("UNAVAILABLE"), &stru_1E9A04480, CFSTR("Main"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v23, CFSTR("subtitle"));

LABEL_26:
  }
  objc_msgSend(MEMORY[0x1E0D1EEC8], "htmlSnippetWithTag:includeTrailingTag:attributes:", CFSTR("attachment"), 1, v8);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

+ (BOOL)isDisplayableImageContentItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  objc_msgSend(v3, "uniformTypeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "type");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "conformsToType:", *MEMORY[0x1E0CEC530]) & 1) != 0
      || (objc_msgSend(v5, "conformsToType:", *MEMORY[0x1E0CEC580]) & 1) != 0
      || (objc_msgSend(v5, "conformsToType:", *MEMORY[0x1E0CEC4F8]) & 1) != 0)
    {
      v6 = 1;
    }
    else
    {
      v6 = objc_msgSend(v5, "conformsToType:", *MEMORY[0x1E0CEC520]);
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)isPDFContentItem:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "conformsToType:", *MEMORY[0x1E0CEC570]);

  return v4;
}

+ (void)attachmentElementMarkupStringForContentItem:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1D56AF000, log, OS_LOG_TYPE_ERROR, "content item %{public}@ had neither a storage or data transfer byte count", buf, 0xCu);

}

+ (void)attachmentElementMarkupStringForContentItem:(uint8_t *)buf .cold.2(__CFString *a1, void *a2, uint8_t *buf, os_log_t log)
{
  const __CFString *v6;

  v6 = CFSTR("non-extended-content-item");
  if (a1)
    v6 = a1;
  *(_DWORD *)buf = 138543618;
  *(_QWORD *)(buf + 4) = v6;
  *((_WORD *)buf + 6) = 2114;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1D56AF000, log, OS_LOG_TYPE_ERROR, "error creating pass from content item %{public}@: %{public}@", buf, 0x16u);

}

@end
