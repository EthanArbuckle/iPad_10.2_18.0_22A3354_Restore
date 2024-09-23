@implementation PKPeerPaymentMessagesContentAccountLockedViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSString *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSString *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)PKPeerPaymentMessagesContentAccountLockedViewController;
  -[PKPeerPaymentMessagesContentAccountLockedViewController viewDidLoad](&v24, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesContentBaseViewController contentView](self, "contentView"));
  objc_msgSend(v3, "setVerticalPadding:", 18.0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesContentBaseViewController contentView](self, "contentView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "imageView"));
  v6 = PKUIScreenScale();
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[PKPeerPaymentTheme primaryTextColor](PKPeerPaymentTheme, "primaryTextColor"));
  v8 = PKUIApplePayLogo(90.0, 25.0, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v5, "setImage:", v9);

  v10 = PKDeviceSpecificLocalizedStringKeyForKey(CFSTR("PEER_PAYMENT_MESSAGES_ACCOUNT_LOCKED_ACTION"), 0);
  v11 = (NSString *)objc_claimAutoreleasedReturnValue(v10);
  v12 = PKLocalizedPeerPaymentString(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  v14 = PKDeviceSpecificLocalizedStringKeyForKey(CFSTR("PEER_PAYMENT_MESSAGES_ACCOUNT_LOCKED_TITLE"), 0);
  v15 = (NSString *)objc_claimAutoreleasedReturnValue(v14);
  v16 = PKLocalizedPeerPaymentString(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesContentBaseViewController contentView](self, "contentView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "label"));
  objc_msgSend(v19, "setText:", v17);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesContentBaseViewController contentView](self, "contentView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "button"));
  objc_msgSend(v21, "setTitle:forState:", v13, 0);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesContentBaseViewController contentView](self, "contentView"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "button"));
  objc_msgSend(v23, "addTarget:action:forControlEvents:", self, "_openWallet", 0x2000);

}

- (void)_openWallet
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesContentBaseViewController appController](self, "appController"));
  objc_msgSend(v3, "handleAction:sender:completion:", 5, self, 0);

}

@end
