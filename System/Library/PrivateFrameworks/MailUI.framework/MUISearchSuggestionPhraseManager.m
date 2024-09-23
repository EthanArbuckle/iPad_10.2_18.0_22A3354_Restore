@implementation MUISearchSuggestionPhraseManager

+ (MUISearchSuggestionPhraseManager)phraseManagerWithPhrase:(id)a3 updatedSuggestion:(id)a4 filterQuery:(id)a5 inputLanguages:(id)a6 customFlags:(id)a7 feedbackQueryID:(int64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;

  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v19 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPhrase:selectedSuggestions:vipManager:updatedSuggestion:scopeIdentifierForPeopleSuggestions:inputLanguages:implicitSuggestions:filterQuery:excludedMailboxes:customFlags:feedbackQueryID:", v18, 0, 0, v17, 0, v15, 0, v16, 0, v14, a8);

  return (MUISearchSuggestionPhraseManager *)v19;
}

- (MUISearchSuggestionPhraseManager)initWithPhrase:(id)a3 selectedSuggestions:(id)a4 vipManager:(id)a5 updatedSuggestion:(id)a6 scopeIdentifierForPeopleSuggestions:(id)a7 inputLanguages:(id)a8 implicitSuggestions:(id)a9 filterQuery:(id)a10 excludedMailboxes:(id)a11 customFlags:(id)a12 feedbackQueryID:(int64_t)a13
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  MUISearchSuggestionPhraseManager *v26;
  uint64_t v27;
  NSString *phrase;
  uint64_t v29;
  NSArray *selectedSuggestions;
  id v31;
  uint64_t v32;
  NSString *scopeIdentifierForPeopleSuggestions;
  uint64_t v34;
  NSArray *inputLanguages;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  NSString *filterQuery;
  uint64_t v42;
  void *v43;
  void *v44;
  unsigned int v45;
  id v47;
  id obj;
  id v49;
  id v51;
  id v52;
  objc_super v53;

  v18 = a3;
  v19 = a4;
  obj = a5;
  v52 = a5;
  v49 = a6;
  v51 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v24 = a11;
  v25 = a12;
  v53.receiver = self;
  v53.super_class = (Class)MUISearchSuggestionPhraseManager;
  v26 = -[MUISearchSuggestionPhraseManager init](&v53, sel_init);
  if (v26)
  {
    v47 = v25;
    v27 = objc_msgSend(v18, "copy");
    phrase = v26->_phrase;
    v26->_phrase = (NSString *)v27;

    v29 = objc_msgSend(v19, "copy");
    selectedSuggestions = v26->_selectedSuggestions;
    v26->_selectedSuggestions = (NSArray *)v29;

    objc_storeStrong((id *)&v26->_vipManager, obj);
    objc_storeStrong((id *)&v26->_updatedSuggestion, v49);
    v31 = v20;
    v32 = objc_msgSend(v20, "copy");
    scopeIdentifierForPeopleSuggestions = v26->_scopeIdentifierForPeopleSuggestions;
    v26->_scopeIdentifierForPeopleSuggestions = (NSString *)v32;

    v34 = objc_msgSend(v21, "copy");
    inputLanguages = v26->_inputLanguages;
    v26->_inputLanguages = (NSArray *)v34;

    v36 = objc_msgSend(v22, "copy");
    v37 = (void *)v36;
    v38 = (void *)MEMORY[0x1E0C9AA60];
    if (v36)
      v39 = (void *)v36;
    else
      v39 = (void *)MEMORY[0x1E0C9AA60];
    objc_storeStrong((id *)&v26->_implicitSuggestions, v39);

    v40 = objc_msgSend(v23, "copy");
    filterQuery = v26->_filterQuery;
    v26->_filterQuery = (NSString *)v40;

    v42 = objc_msgSend(v24, "copy");
    v43 = (void *)v42;
    if (v42)
      v44 = (void *)v42;
    else
      v44 = v38;
    objc_storeStrong((id *)&v26->_excludedMailboxes, v44);

    do
      v45 = __ldaxr((unsigned int *)&makeSignpostID_nextSignpostID);
    while (__stlxr(v45 + 1, (unsigned int *)&makeSignpostID_nextSignpostID));
    v26->_signpostID = v45 | 0xE508EB2E00000000;
    objc_storeStrong((id *)&v26->_customFlags, a12);
    v25 = v47;
    v26->_feedbackQueryID = a13;
    v20 = v31;
  }

  return v26;
}

- (BOOL)hasPhraseOrSuggestions
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;

  -[MUISearchSuggestionPhraseManager phrase](self, "phrase");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = 1;
  }
  else
  {
    -[MUISearchSuggestionPhraseManager updatedSuggestion](self, "updatedSuggestion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "suggestionTokens");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v6, "count") != 0;

  }
  return v4;
}

- (unsigned)phraseKind
{
  return !-[MUISearchSuggestionPhraseManager hasPhraseOrSuggestions](self, "hasPhraseOrSuggestions");
}

- (id)spotlightQueryStrings
{
  -[MUISearchSuggestionPhraseManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MUISearchSuggestionPhraseManager spotlightQueryStrings]", "MUISearchSuggestionPhraseManager.m", 60, "0");
}

- (NSString)phrase
{
  return self->_phrase;
}

- (NSArray)selectedSuggestions
{
  return self->_selectedSuggestions;
}

- (EMVIPManager)vipManager
{
  return self->_vipManager;
}

- (CSSuggestion)updatedSuggestion
{
  return self->_updatedSuggestion;
}

- (NSString)scopeIdentifierForPeopleSuggestions
{
  return self->_scopeIdentifierForPeopleSuggestions;
}

- (NSArray)inputLanguages
{
  return self->_inputLanguages;
}

- (NSDictionary)customFlags
{
  return self->_customFlags;
}

- (NSArray)implicitSuggestions
{
  return self->_implicitSuggestions;
}

- (NSString)filterQuery
{
  return self->_filterQuery;
}

- (NSArray)excludedMailboxes
{
  return self->_excludedMailboxes;
}

- (unint64_t)signpostID
{
  return self->_signpostID;
}

- (int64_t)feedbackQueryID
{
  return self->_feedbackQueryID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excludedMailboxes, 0);
  objc_storeStrong((id *)&self->_filterQuery, 0);
  objc_storeStrong((id *)&self->_implicitSuggestions, 0);
  objc_storeStrong((id *)&self->_customFlags, 0);
  objc_storeStrong((id *)&self->_inputLanguages, 0);
  objc_storeStrong((id *)&self->_scopeIdentifierForPeopleSuggestions, 0);
  objc_storeStrong((id *)&self->_updatedSuggestion, 0);
  objc_storeStrong((id *)&self->_vipManager, 0);
  objc_storeStrong((id *)&self->_selectedSuggestions, 0);
  objc_storeStrong((id *)&self->_phrase, 0);
}

@end
