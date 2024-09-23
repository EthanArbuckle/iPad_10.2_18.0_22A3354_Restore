@implementation WDContactConsolidationLearnMoreViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WDContactConsolidationLearnMoreViewController;
  -[WDContactConsolidationLearnMoreViewController viewDidLoad](&v7, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDContactConsolidationLearnMoreViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  WDBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("MEDICAL_ID_CONSOLIDATION_LEARN_MORE_TITLE"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDContactConsolidationLearnMoreViewController setTitle:](self, "setTitle:", v6);

  -[WDContactConsolidationLearnMoreViewController createTextView](self, "createTextView");
  -[WDContactConsolidationLearnMoreViewController createDismissButton](self, "createDismissButton");
}

- (void)viewWillAppear:(BOOL)a3
{
  double v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WDContactConsolidationLearnMoreViewController;
  -[WDContactConsolidationLearnMoreViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[UITextView contentInset](self->_textView, "contentInset");
  -[UITextView setContentOffset:](self->_textView, "setContentOffset:", 0.0, -v4);
}

- (void)createDismissButton
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = objc_alloc(MEMORY[0x24BDF6860]);
  WDBundle();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("DATA_COLLECTION_MORE_INFO_DONE_BUTTON"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithTitle:style:target:action:", v4, 0, self, sel_dismissButtonPressed_);
  -[WDContactConsolidationLearnMoreViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRightBarButtonItem:", v5);

}

- (void)dismissButtonPressed:(id)a3
{
  void *v4;
  _QWORD v5[5];

  -[WDContactConsolidationLearnMoreViewController navigationController](self, "navigationController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __70__WDContactConsolidationLearnMoreViewController_dismissButtonPressed___block_invoke;
  v5[3] = &unk_24D38D000;
  v5[4] = self;
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, v5);

}

void __70__WDContactConsolidationLearnMoreViewController_dismissButtonPressed___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(void);

  objc_msgSend(*(id *)(a1 + 32), "dismissHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "dismissHandler");
    v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v3[2]();

  }
}

- (void)createTextView
{
  UITextView *v3;
  void *v4;
  void *v5;
  void *v6;
  UITextView *textView;

  v3 = (UITextView *)objc_alloc_init(MEMORY[0x24BDF6EF8]);
  -[WDContactConsolidationLearnMoreViewController setView:](self, "setView:", v3);
  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setFont:](v3, "setFont:", v4);

  -[UITextView setEditable:](v3, "setEditable:", 0);
  WDBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("MEDICAL_ID_CONSOLIDATION_LEARN_MORE_BODY"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextView setText:](v3, "setText:", v6);

  textView = self->_textView;
  self->_textView = v3;

}

- (UITextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
  objc_storeStrong((id *)&self->_textView, a3);
}

- (id)dismissHandler
{
  return self->_dismissHandler;
}

- (void)setDismissHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 976);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dismissHandler, 0);
  objc_storeStrong((id *)&self->_textView, 0);
}

@end
