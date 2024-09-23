@implementation SGContactSuggestionHelpers

+ (id)viewControllerForUpdatingContact:(id)a3 additionalContact:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0C974D8], "viewControllerForUpdatingContact:withPropertiesFromContact:", a3, a4);
}

+ (id)retrieveContactStore
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0C97298]);
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setIncludeSuggestedContacts:", 1);
  v4 = (void *)objc_msgSend(v2, "initWithConfiguration:", v3);

  return v4;
}

+ (id)contactFromSuggestedContact:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C97200], "contactFromSuggestion:", a3);
}

+ (id)formattedStringForPhone:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;

  if (a3)
  {
    v3 = (objc_class *)MEMORY[0x1E0C97398];
    v4 = a3;
    v5 = (void *)objc_msgSend([v3 alloc], "initWithStringValue:", v4);

    objc_msgSend(v5, "formattedStringValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

@end
