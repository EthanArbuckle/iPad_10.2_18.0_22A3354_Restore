@implementation SiriAboutSearchSuggestionsModalViewController

- (SiriAboutSearchSuggestionsModalViewController)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  SiriAboutSearchSuggestionsModalViewController *v7;
  objc_super v9;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("ASSISTANT_SEARCH_SUGGESTIONS_PRIVACY_TITLE"), &stru_24D33E0B0, CFSTR("AssistantShared"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("ASSISTANT_SEARCH_SUGGESTIONS_PRIVACY_TEXT"), &stru_24D33E0B0, CFSTR("AssistantShared"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9.receiver = self;
  v9.super_class = (Class)SiriAboutSearchSuggestionsModalViewController;
  v7 = -[SiriModalTextViewController initWithTitleText:andBodyText:](&v9, sel_initWithTitleText_andBodyText_, v4, v6);

  return v7;
}

@end
