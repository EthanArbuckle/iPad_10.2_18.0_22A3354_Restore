@implementation MUISearchResultsSuggesterRichLinksConfiguration

void __55___MUISearchResultsSuggesterRichLinksConfiguration_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_11;
  log_log_11 = (uint64_t)v1;

}

void __67___MUISearchResultsSuggesterRichLinksConfiguration_fetchAttributes__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[6];

  v8[5] = *MEMORY[0x1E0C80C00];
  +[MUISearchResultsSuggester dateAttributes](MUISearchResultsSuggester, "dateAttributes");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1EC48], "idAttributeKey");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1EC48], "titleAttributeKey", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v2;
  objc_msgSend(MEMORY[0x1E0D1EC48], "urlAttributeKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0CA6048];
  v8[2] = v3;
  v8[3] = v4;
  v8[4] = *MEMORY[0x1E0CA6030];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "arrayByAddingObjectsFromArray:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)fetchAttributes_fetchAttributes_0;
  fetchAttributes_fetchAttributes_0 = v6;

}

void __104___MUISearchResultsSuggesterRichLinksConfiguration_processSuggestionsResults_phraseManager_messageList___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
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
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _BYTE *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  objc_msgSend(v6, "searchableItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "attributeSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1EC48], "idAttributeKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "attributeForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 && (objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "containsObject:", v10) & 1) == 0)
  {
    v27 = a4;
    objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "addObject:", v10);
    objc_msgSend(v6, "objectID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc(MEMORY[0x1E0C99E98]);
    objc_msgSend(v7, "attributeSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D1EC48], "urlAttributeKey");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "attributeForKey:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v11, "initWithString:", v14);

    objc_msgSend(v7, "attributeSet");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D1EC48], "titleAttributeKey");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "attributeForKey:", v16);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "attributeSet");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "relatedUniqueIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "attributeSet");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "attributeForKey:", *MEMORY[0x1E0CA6048]);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "attributeSet");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "attributeForKey:", *MEMORY[0x1E0CA6030]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    +[_MUISearchResultsSuggesterRichLinksConfiguration log](_MUISearchResultsSuggesterRichLinksConfiguration, "log");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "attributeSet");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "relatedUniqueIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v33 = v24;
      v34 = 2112;
      v35 = v10;
      v36 = 2112;
      v37 = v29;
      _os_log_impl(&dword_1D5522000, v22, OS_LOG_TYPE_DEFAULT, "Creating rich link suggestion messageID: %@, richLinkID: %@ URL: %@", buf, 0x20u);

    }
    v25 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
    +[MUILinkSuggestion suggestionWithURL:title:richLinkID:authors:authorEmailAddresses:objectID:messageID:messageList:](MUILinkSuggestion, "suggestionWithURL:title:richLinkID:authors:authorEmailAddresses:objectID:messageID:messageList:", v18, a1[4]);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObject:", v26);

    if ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "count") >= 4)
      *v27 = 1;

  }
}

@end
