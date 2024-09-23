@implementation EMCSLoggingAdditions

+ (id)publicDescriptionForSuggestion:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = objc_opt_class();
  v6 = objc_msgSend(v3, "suggestionKind");
  v7 = (void *)MEMORY[0x1E0D1EF48];
  objc_msgSend(v3, "userQueryString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "partiallyRedactedStringForString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@: kind: %ld, %@"), v5, v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)publicDescriptionForSuggestionArray:(id)a3
{
  objc_msgSend(a3, "ef_map:", &__block_literal_global_8);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __60__EMCSLoggingAdditions_publicDescriptionForSuggestionArray___block_invoke(uint64_t a1, uint64_t a2)
{
  +[EMCSLoggingAdditions publicDescriptionForSuggestion:](EMCSLoggingAdditions, "publicDescriptionForSuggestion:", a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)publicDescriptionForSnippetHints:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = objc_opt_class();
  objc_msgSend(v3, "attribute");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0D1EF48];
  objc_msgSend(v3, "tokens");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "partiallyRedactedStringFromArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@: attribtue: %@, tokens: %@"), v5, v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)publicDescriptionForSnippetHintsArray:(id)a3
{
  objc_msgSend(a3, "ef_map:", &__block_literal_global_7);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __62__EMCSLoggingAdditions_publicDescriptionForSnippetHintsArray___block_invoke(uint64_t a1, uint64_t a2)
{
  +[EMCSLoggingAdditions publicDescriptionForSnippetHints:](EMCSLoggingAdditions, "publicDescriptionForSnippetHints:", a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
