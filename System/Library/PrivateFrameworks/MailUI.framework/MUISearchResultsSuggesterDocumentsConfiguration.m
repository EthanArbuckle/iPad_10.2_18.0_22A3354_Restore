@implementation MUISearchResultsSuggesterDocumentsConfiguration

void __55___MUISearchResultsSuggesterDocumentsConfiguration_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_6;
  log_log_6 = (uint64_t)v1;

}

void __75___MUISearchResultsSuggesterDocumentsConfiguration_documentTypeFilterQuery__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;
  uint64_t v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CEC5A0];
  v15[0] = *MEMORY[0x1E0CEC570];
  v15[1] = v0;
  v15[2] = *MEMORY[0x1E0CEC5F0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 3);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __75___MUISearchResultsSuggesterDocumentsConfiguration_documentTypeFilterQuery__block_invoke_2;
  v13[3] = &unk_1E99E30D8;
  v4 = v2;
  v14 = v4;
  objc_msgSend(v1, "enumerateObjectsUsingBlock:", v13);
  v8 = v3;
  v9 = 3221225472;
  v10 = __75___MUISearchResultsSuggesterDocumentsConfiguration_documentTypeFilterQuery__block_invoke_3;
  v11 = &unk_1E99E3100;
  v12 = v4;
  v5 = v4;
  objc_msgSend(&unk_1E9A017D8, "enumerateObjectsUsingBlock:", &v8);
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(" || "), v8, v9, v10, v11);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)documentTypeFilterQuery_documentQueryString;
  documentTypeFilterQuery_documentQueryString = v6;

}

void __75___MUISearchResultsSuggesterDocumentsConfiguration_documentTypeFilterQuery__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a2, "identifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("(kMDItemContentTypeTree = '%@*')"), v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v4);

}

void __75___MUISearchResultsSuggesterDocumentsConfiguration_documentTypeFilterQuery__block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(kMDItemContentTypeTree = '%@*')"), a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __67___MUISearchResultsSuggesterDocumentsConfiguration_fetchAttributes__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[6];

  v6[5] = *MEMORY[0x1E0C80C00];
  +[MUISearchResultsSuggester dateAttributes](MUISearchResultsSuggester, "dateAttributes");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = *MEMORY[0x1E0CA6158];
  v6[0] = *MEMORY[0x1E0CA6108];
  v6[1] = v1;
  v2 = *MEMORY[0x1E0CA6030];
  v6[2] = *MEMORY[0x1E0CA6048];
  v6[3] = v2;
  v6[4] = *MEMORY[0x1E0CA68D8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "arrayByAddingObjectsFromArray:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)fetchAttributes_fetchAttributes;
  fetchAttributes_fetchAttributes = v4;

}

id __104___MUISearchResultsSuggesterDocumentsConfiguration_processSuggestionsResults_phraseManager_messageList___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  __CFString *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "searchableItem");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "attributeSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByDeletingPathExtension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[MUISearchResultsSuggester dateForSuggestionResult:](MUISearchResultsSuggester, "dateForSuggestionResult:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subject");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = &stru_1E99EB1C8;
  if (v9)
    v11 = (__CFString *)v9;
  v12 = v11;

  objc_msgSend(v4, "contentURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[_MUISearchResultsSuggesterDocumentsConfiguration log](_MUISearchResultsSuggesterDocumentsConfiguration, "log");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v13)
  {
    v32 = v12;
    v34 = v8;
    v16 = v7;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "searchableItem");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "uniqueIdentifier");
      v31 = a1;
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "userSharedReceivedDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "firstObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "subject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v38 = v18;
      v39 = 2112;
      v40 = v13;
      v41 = 2112;
      v42 = v16;
      v43 = 2112;
      v44 = v20;
      v45 = 2112;
      v46 = v21;
      _os_log_impl(&dword_1D5522000, v15, OS_LOG_TYPE_DEFAULT, "Creating Document suggestion ID: %@ fileURL: %@ name: %@ date: %@ subject: %@", buf, 0x34u);

      a1 = v31;
    }

    objc_msgSend(v4, "authorNames");
    v15 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "authorEmailAddresses");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectID");
    v23 = v3;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v16;
    v25 = v16;
    v12 = v32;
    v8 = v34;
    +[MUIDocumentSuggestion suggestionWithFileURL:name:date:subject:authors:authorEmailAddresses:objectID:messageList:](MUIDocumentSuggestion, "suggestionWithFileURL:name:date:subject:authors:authorEmailAddresses:objectID:messageList:", v13, v25, v34, v32, v15, v22, v24, *(_QWORD *)(a1 + 32));
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = v23;
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "searchableItem");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "uniqueIdentifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "userSharedReceivedDate");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "firstObject");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "subject");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v38 = v28;
      v39 = 2112;
      v40 = v7;
      v41 = 2112;
      v42 = v29;
      v43 = 2112;
      v44 = v30;
      _os_log_error_impl(&dword_1D5522000, v15, OS_LOG_TYPE_ERROR, "Skipping  document suggestion with ID: %@ name: %@ date: %@ subject: %@ because there is no file URL.", buf, 0x2Au);

    }
    v26 = 0;
  }

  return v26;
}

@end
