@implementation CSSuggestion(MailUIPredicates)

- (id)mui_messageListSearchPredicate
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "suggestionTokens");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "ef_compactMap:", &__block_literal_global_0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

@end
