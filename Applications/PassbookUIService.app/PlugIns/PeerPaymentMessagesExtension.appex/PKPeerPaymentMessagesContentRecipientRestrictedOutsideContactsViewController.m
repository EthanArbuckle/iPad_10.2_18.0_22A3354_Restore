@implementation PKPeerPaymentMessagesContentRecipientRestrictedOutsideContactsViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PKPeerPaymentMessagesContentRecipientRestrictedOutsideContactsViewController;
  -[PKPeerPaymentMessagesContentRecipientRestrictedOutsideContactsViewController viewDidLoad](&v10, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesContentBaseViewController contentView](self, "contentView"));
  objc_msgSend(v3, "setVerticalPadding:", 18.0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesContentBaseViewController contentView](self, "contentView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "imageView"));
  v6 = PKUIScreenScale();
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[PKPeerPaymentTheme primaryTextColor](PKPeerPaymentTheme, "primaryTextColor"));
  v8 = PKUIApplePayLogo(90.0, 25.0, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v5, "setImage:", v9);

}

- (void)reloadContent
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesContentBaseViewController contentView](self, "contentView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "label"));
  v3 = PKLocalizedPeerPaymentLexingtonString(CFSTR("PEER_PAYMENT_MESSAGES_RECIPIENT_CONTACTS_RESTRICTED_MESSAGE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  objc_msgSend(v2, "setText:", v4);

}

@end
