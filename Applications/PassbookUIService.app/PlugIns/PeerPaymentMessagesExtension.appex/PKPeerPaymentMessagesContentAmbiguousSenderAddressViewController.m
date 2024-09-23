@implementation PKPeerPaymentMessagesContentAmbiguousSenderAddressViewController

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
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)PKPeerPaymentMessagesContentAmbiguousSenderAddressViewController;
  -[PKPeerPaymentMessagesContentAmbiguousSenderAddressViewController viewDidLoad](&v22, "viewDidLoad");
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
  v12 = PKPrimaryAppleAccountFormattedUsername();
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_MESSAGES_AMBIGUOUS_SENDER_ADDRESS_FORMAT"), CFSTR("%@"), v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  objc_msgSend(v11, "setText:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesContentBaseViewController contentView](self, "contentView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "button"));
  v18 = PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_MESSAGES_AMBIGUOUS_SENDER_ADDRESS_ACTION"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  objc_msgSend(v17, "setTitle:forState:", v19, 0);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesContentBaseViewController contentView](self, "contentView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "button"));
  objc_msgSend(v21, "addTarget:action:forControlEvents:", self, "_openSettings", 0x2000);

}

- (void)_openSettings
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("prefs:root=MESSAGES&path=MADRID_ACCOUNTS_BUTTON")));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  objc_msgSend(v2, "openSensitiveURL:withOptions:", v3, 0);

}

@end
