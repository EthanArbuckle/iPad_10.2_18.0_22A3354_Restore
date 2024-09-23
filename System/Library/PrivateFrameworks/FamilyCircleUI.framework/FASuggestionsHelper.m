@implementation FASuggestionsHelper

+ (id)filterAndTrimMessagesHandleSuggestions:(id)a3 maxSuggestions:(unint64_t)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v5 = (void *)MEMORY[0x24BDD1758];
  v6 = a3;
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("iMessageHandle != nil"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "filteredArrayUsingPredicate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count") > a4)
  {
    objc_msgSend(v8, "subarrayWithRange:", 0, a4);
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }

  return v8;
}

@end
