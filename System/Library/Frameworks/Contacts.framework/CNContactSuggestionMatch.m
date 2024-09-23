@implementation CNContactSuggestionMatch

+ (void)fetchLinkedIdentifiersForContactSuggestionMatches:(id)a3 fromSuggestionService:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "_cn_map:", &__block_literal_global_4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    objc_msgSend(v6, "cnContactMatchesForRecordIds:error:", v7, &v15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v15;
    if (v8)
    {
      if (objc_msgSend(v8, "count"))
      {
        v10 = 0;
        do
        {
          objc_msgSend(v8, "objectAtIndexedSubscript:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "count") == 1)
          {
            objc_msgSend(v5, "objectAtIndexedSubscript:", v10);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setMainStoreLinkedIdentifier:", v13);

          }
          ++v10;
        }
        while (v10 < objc_msgSend(v8, "count"));
      }
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "os_log");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        +[CNContactSuggestionMatch fetchLinkedIdentifiersForContactSuggestionMatches:fromSuggestionService:].cold.1((uint64_t)v7, (uint64_t)v9, v14);

    }
  }

}

+ (id)os_log
{
  if (os_log_cn_once_token_0_0 != -1)
    dispatch_once(&os_log_cn_once_token_0_0, &__block_literal_global_2);
  return (id)os_log_cn_once_object_0_0;
}

void __34__CNContactSuggestionMatch_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "suggestion-match");
  v1 = (void *)os_log_cn_once_object_0_0;
  os_log_cn_once_object_0_0 = (uint64_t)v0;

}

+ (id)suggestionFromContactMatch:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v5, "setContactMatch:", v4);

  return v5;
}

- (void)setContactMatch:(id)a3
{
  void *v5;
  SGContactMatch *v6;

  v6 = (SGContactMatch *)a3;
  if (self->_contactMatch != v6)
  {
    objc_storeStrong((id *)&self->_contactMatch, a3);
    -[SGContactMatch contact](v6, "contact");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactSuggestionMatch setContact:](self, "setContact:", v5);

  }
}

id __100__CNContactSuggestionMatch_fetchLinkedIdentifiersForContactSuggestionMatches_fromSuggestionService___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "contact");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recordId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (SGContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (SGContactMatch)contactMatch
{
  return self->_contactMatch;
}

- (NSString)mainStoreLinkedIdentifier
{
  return self->_mainStoreLinkedIdentifier;
}

- (void)setMainStoreLinkedIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_mainStoreLinkedIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainStoreLinkedIdentifier, 0);
  objc_storeStrong((id *)&self->_contactMatch, 0);
  objc_storeStrong((id *)&self->_contact, 0);
}

+ (void)fetchLinkedIdentifiersForContactSuggestionMatches:(os_log_t)log fromSuggestionService:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_18F8BD000, log, OS_LOG_TYPE_ERROR, "Error retrieving contact matches for suggestions record ID: %@, %@", (uint8_t *)&v3, 0x16u);
}

@end
