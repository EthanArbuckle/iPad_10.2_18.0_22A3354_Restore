@implementation PKPeerPaymentMessagesContentIMessageDisabledViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)PKPeerPaymentMessagesContentIMessageDisabledViewController;
  -[PKPeerPaymentMessagesContentIMessageDisabledViewController viewDidLoad](&v20, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesContentBaseViewController contentView](self, "contentView"));
  objc_msgSend(v3, "setVerticalPadding:", 18.0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesContentBaseViewController contentView](self, "contentView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "imageView"));
  v6 = PKUIScreenScale();
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[PKPeerPaymentTheme primaryTextColor](PKPeerPaymentTheme, "primaryTextColor"));
  v8 = PKUIApplePayLogo(90.0, 25.0, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v5, "setImage:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesContentBaseViewController contentView](self, "contentView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "label"));
  v12 = PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_MESSAGES_IMESSAGE_DISABLED_TITLE"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  objc_msgSend(v11, "setText:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesContentBaseViewController contentView](self, "contentView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "button"));
  v16 = PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_MESSAGES_IMESSAGE_DISABLED_ACTION"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  objc_msgSend(v15, "setTitle:forState:", v17, 0);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesContentBaseViewController contentView](self, "contentView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "button"));
  objc_msgSend(v19, "addTarget:action:forControlEvents:", self, "_openSettings", 0x2000);

}

- (void)_openSettings
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("prefs:root=MESSAGES")));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  objc_msgSend(v2, "openSensitiveURL:withOptions:", v3, 0);

}

@end
