@implementation SiriFooterView

- (SiriFooterView)initWithSpecifier:(id)a3
{
  id v4;
  SiriFooterView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SiriFooterView;
  v5 = -[PSFooterHyperlinkView initWithSpecifier:](&v14, sel_initWithSpecifier_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("ASSISTANT_ABOUT"), &stru_24D33E0B0, CFSTR("AssistantShared"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75A68]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSFooterHyperlinkView setText:](v5, "setText:", v8);

    -[PSFooterHyperlinkView text](v5, "text");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "rangeOfString:", v7);
    -[PSFooterHyperlinkView setLinkRange:](v5, "setLinkRange:", v10, v11);

    objc_msgSend(v4, "target");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSFooterHyperlinkView setTarget:](v5, "setTarget:", v12);

    -[PSFooterHyperlinkView setAction:](v5, "setAction:", sel_showAboutAssistantSheet_);
  }

  return v5;
}

@end
