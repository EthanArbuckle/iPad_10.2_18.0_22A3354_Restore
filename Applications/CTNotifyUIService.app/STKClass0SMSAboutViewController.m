@implementation STKClass0SMSAboutViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  void *v3;
  id v4;
  double Width;
  UITextView *v6;
  UITextView *aboutContentView;
  UITextView *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  objc_super v14;
  CGRect v15;
  CGRect v16;

  v14.receiver = self;
  v14.super_class = (Class)STKClass0SMSAboutViewController;
  -[STKClass0SMSAboutViewController viewDidLoad](&v14, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STKClass0SMSAboutViewController view](self, "view"));
  v4 = objc_alloc((Class)UITextView);
  objc_msgSend(v3, "frame");
  Width = CGRectGetWidth(v15);
  objc_msgSend(v3, "frame");
  v6 = (UITextView *)objc_msgSend(v4, "initWithFrame:", 0.0, 0.0, Width, CGRectGetHeight(v16));
  aboutContentView = self->_aboutContentView;
  self->_aboutContentView = v6;

  -[UITextView setAdjustsFontForContentSizeCategory:](self->_aboutContentView, "setAdjustsFontForContentSizeCategory:", 1);
  -[UITextView setAutoresizingMask:](self->_aboutContentView, "setAutoresizingMask:", 18);
  -[UITextView setTextContainerInset:](self->_aboutContentView, "setTextContainerInset:", 10.0, 10.0, 10.0, 10.0);
  v8 = self->_aboutContentView;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[STKClass0SMSAboutViewController formattedAboutText](self, "formattedAboutText"));
  -[UITextView setAttributedText:](v8, "setAttributedText:", v9);

  -[UITextView setScrollEnabled:](self->_aboutContentView, "setScrollEnabled:", 0);
  -[UITextView setEditable:](self->_aboutContentView, "setEditable:", 0);
  -[UITextView setSelectable:](self->_aboutContentView, "setSelectable:", 0);
  objc_msgSend(v3, "addSubview:", self->_aboutContentView);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("CLASS0SMS_ABOUT_TITLE"), &stru_100014540, CFSTR("SIMToolkitUI")));
  -[STKClass0SMSAboutViewController setTitle:](self, "setTitle:", v11);

  v12 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, self, "doneButtonTapped:");
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[STKClass0SMSAboutViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v13, "setRightBarButtonItem:", v12);

}

- (void)doneButtonTapped:(id)a3
{
  -[STKClass0SMSAboutViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (id)formattedAboutText
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  id v22;
  uint64_t v23;
  id v24;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("CLASS0SMS_CLASS_0_SMS"), &stru_100014540, CFSTR("SIMToolkitUI")));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("CLASS0SMS_FLASH_SMS"), &stru_100014540, CFSTR("SIMToolkitUI")));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CTNotifyUIService")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("CLASS0SMS_ABOUT_BODY"), &stru_100014540, CFSTR("SIMToolkitUI")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v3, v5));

  v9 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithString:", v8);
  v10 = objc_msgSend(v8, "rangeOfString:", v3);
  v21 = v11;
  v22 = v10;
  v12 = objc_msgSend(v8, "rangeOfString:", v5);
  v23 = v13;
  v24 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontMetrics metricsForTextStyle:](UIFontMetrics, "metricsForTextStyle:", UIFontTextStyleBody));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 14.0));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "scaledFontForFont:", v15));

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontMetrics metricsForTextStyle:](UIFontMetrics, "metricsForTextStyle:", UIFontTextStyleBody));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 14.0));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "scaledFontForFont:", v18));

  objc_msgSend(v9, "beginEditing");
  objc_msgSend(v9, "addAttribute:value:range:", NSFontAttributeName, v16, 0, objc_msgSend(v8, "length"));
  objc_msgSend(v9, "addAttribute:value:range:", NSFontAttributeName, v19, v22, v21);
  objc_msgSend(v9, "addAttribute:value:range:", NSFontAttributeName, v19, v24, v23);
  objc_msgSend(v9, "endEditing");

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aboutContentView, 0);
}

@end
