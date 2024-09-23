@implementation PKPeerPaymentMessagesContentRecipientBusinessViewController

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
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PKPeerPaymentMessagesContentRecipientBusinessViewController;
  -[PKPeerPaymentMessagesContentRecipientBusinessViewController viewDidLoad](&v14, "viewDidLoad");
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
  v12 = PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_MESSAGES_RECIPIENT_INVALID_BUSINESS"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  objc_msgSend(v11, "setText:", v13);

}

@end
