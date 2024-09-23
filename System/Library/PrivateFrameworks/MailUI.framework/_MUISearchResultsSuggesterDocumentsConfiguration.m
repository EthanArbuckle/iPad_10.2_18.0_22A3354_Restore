@implementation _MUISearchResultsSuggesterDocumentsConfiguration

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55___MUISearchResultsSuggesterDocumentsConfiguration_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_6 != -1)
    dispatch_once(&log_onceToken_6, block);
  return (OS_os_log *)(id)log_log_6;
}

- (NSArray)categories
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  +[MUISearchSuggestionCategory documentCategory](MUISearchSuggestionCategory, "documentCategory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

+ (id)documentTypeFilterQuery
{
  objc_opt_self();
  if (documentTypeFilterQuery_onceToken != -1)
    dispatch_once(&documentTypeFilterQuery_onceToken, &__block_literal_global_27);
  return (id)documentTypeFilterQuery_documentQueryString;
}

- (NSString)logIdentifier
{
  return (NSString *)CFSTR("Documents");
}

- (id)suggestionFilterQueryWithPhraseManager:(id)a3 senderFilterQuery:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;

  v5 = a4;
  objc_msgSend(a3, "phrase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3940];
  +[MUISearchResultsSuggester dateQueryString](MUISearchResultsSuggester, "dateQueryString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[_MUISearchResultsSuggesterDocumentsConfiguration documentTypeFilterQuery]();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("(%@) && (%@) && (%@)"), CFSTR("(kMDItemAccountIdentifier = '*') && (kMDItemRelatedUniqueIdentifier = '*') && (kMDItemContentURL = '*')"), v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@) && ((kMDItemDisplayName = '%@*'cdw) || (kMDItemTextContent = '%@*'cdw))"), v10, v6, v6);
    v11 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v11;
  }
  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(v10, "stringByAppendingFormat:", CFSTR(" && (%@)"), v5);
    v12 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v12;
  }

  return v10;
}

- (NSArray)fetchAttributes
{
  if (fetchAttributes_onceToken != -1)
    dispatch_once(&fetchAttributes_onceToken, &__block_literal_global_27);
  return (NSArray *)(id)fetchAttributes_fetchAttributes;
}

- (id)processSuggestionsResults:(id)a3 phraseManager:(id)a4 messageList:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v6 = a5;
  +[MUISearchResultsSuggester suggestionResultsSortedByDate:](MUISearchResultsSuggester, "suggestionResultsSortedByDate:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ef_prefix:", 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "ef_prefix:", 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __104___MUISearchResultsSuggesterDocumentsConfiguration_processSuggestionsResults_phraseManager_messageList___block_invoke;
  v13[3] = &unk_1E99E3148;
  v14 = v6;
  v10 = v6;
  objc_msgSend(v9, "ef_compactMap:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (unint64_t)maxItemCount
{
  return 3;
}

@end
