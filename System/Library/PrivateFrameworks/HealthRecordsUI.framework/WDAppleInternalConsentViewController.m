@implementation WDAppleInternalConsentViewController

- (WDAppleInternalConsentViewController)initWithPresentingViewController:(id)a3 completionBlock:(id)a4
{
  id v7;
  id v8;
  WDAppleInternalConsentViewController *v9;
  WDAppleInternalConsentViewController *v10;
  uint64_t v11;
  id completionBlock;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)WDAppleInternalConsentViewController;
  v9 = -[HKTitledBuddyViewController init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    -[WDAppleInternalConsentViewController setTitle:](v9, "setTitle:", &stru_1E74EA150);
    objc_storeStrong((id *)&v10->_actionViewController, a3);
    v11 = objc_msgSend(v8, "copy");
    completionBlock = v10->_completionBlock;
    v10->_completionBlock = (id)v11;

  }
  return v10;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  UIBarButtonItem *v5;
  UIBarButtonItem *navigationCancelButton;
  UIBarButtonItem *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WDAppleInternalConsentViewController;
  -[HKTitledBuddyViewController viewDidLoad](&v9, sel_viewDidLoad);
  -[WDAppleInternalConsentViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  -[WDAppleInternalConsentViewController setEdgesForExtendedLayout:](self, "setEdgesForExtendedLayout:", 14);
  v5 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancelButtonTapped_);
  navigationCancelButton = self->_navigationCancelButton;
  self->_navigationCancelButton = v5;

  v7 = self->_navigationCancelButton;
  -[WDAppleInternalConsentViewController navigationItem](self, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLeftBarButtonItem:", v7);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WDAppleInternalConsentViewController;
  -[HKTitledBuddyViewController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  -[WDAppleInternalConsentViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "navigationBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBarTintColor:", v6);

}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WDAppleInternalConsentViewController;
  -[WDAppleInternalConsentViewController viewWillDisappear:](&v3, sel_viewWillDisappear_, a3);
}

- (BOOL)shouldCustomizeNavigationBar
{
  return 0;
}

- (id)titleString
{
  return (id)HRLocalizedLegalString(CFSTR("APPLE_INTERNAL_TITLE"), a2);
}

- (id)bodyString
{
  return (id)HRLocalizedLegalString(CFSTR("APPLE_INTERNAL_CONSENT_BODY"), a2);
}

- (int64_t)bodyTextAlignment
{
  return 4;
}

- (void)updateBodyTextAttributesWithMutableString:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:variant:", *MEMORY[0x1E0DC4A88], 1024);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = objc_msgSend(&unk_1E75130E0, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    v9 = *MEMORY[0x1E0DC1138];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(&unk_1E75130E0);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10);
        -[WDAppleInternalConsentViewController bodyString](self, "bodyString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "rangeOfString:", v11);
        v15 = v14;

        objc_msgSend(v4, "addAttribute:value:range:", v9, v5, v13, v15);
        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(&unk_1E75130E0, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

}

- (id)bottomAnchoredButtons
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  HRLocalizedLegalString(CFSTR("APPLE_INTERNAL_CONSENT_UNDERSTAND"), a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)buttonAtIndexTapped:(int64_t)a3
{
  if (a3 == 1)
  {
    -[WDAppleInternalConsentViewController declineButtonTapped:](self, "declineButtonTapped:", 0);
  }
  else if (!a3)
  {
    -[WDAppleInternalConsentViewController acceptButtonTapped:](self, "acceptButtonTapped:");
  }
}

- (void)cancelButtonTapped:(id)a3
{
  (*((void (**)(void))self->_completionBlock + 2))();
}

- (void)acceptButtonTapped:(id)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", 1, CFSTR("WDInternalHealthRecordsConsentScreenShownKey"));

  (*((void (**)(void))self->_completionBlock + 2))();
}

- (void)declineButtonTapped:(id)a3
{
  (*((void (**)(void))self->_completionBlock + 2))();
}

- (UIViewController)actionViewController
{
  return self->_actionViewController;
}

- (void)setActionViewController:(id)a3
{
  objc_storeStrong((id *)&self->_actionViewController, a3);
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1048);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_actionViewController, 0);
  objc_storeStrong((id *)&self->_navigationCancelButton, 0);
}

@end
