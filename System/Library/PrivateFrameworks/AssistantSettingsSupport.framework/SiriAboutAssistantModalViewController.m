@implementation SiriAboutAssistantModalViewController

- (SiriAboutAssistantModalViewController)init
{
  void *v3;
  const __CFString *v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;
  void *v9;
  SiriAboutAssistantModalViewController *v10;
  objc_super v12;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = CFSTR("AssistantShared");
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("ASSISTANT_ABOUT_TITLE"), &stru_24D33E0B0, CFSTR("AssistantShared"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_opt_class();
  if (MGGetSInt32Answer() == 2)
  {
    objc_msgSend(CFSTR("ASSISTANT_ABOUT_TEXT"), "stringByAppendingString:", CFSTR("_SIDE_BUTTON"));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_class();
    v4 = CFSTR("AssistantSettings-D22");
  }
  else
  {
    v7 = CFSTR("ASSISTANT_ABOUT_TEXT");
  }
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", v7, &stru_24D33E0B0, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v12.receiver = self;
  v12.super_class = (Class)SiriAboutAssistantModalViewController;
  v10 = -[SiriModalTextViewController initWithTitleText:andBodyText:](&v12, sel_initWithTitleText_andBodyText_, v5, v9);

  return v10;
}

@end
