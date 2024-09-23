@implementation PKPeerPaymentMessagesContentRecipientInvalidViewController

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
  v10.super_class = (Class)PKPeerPaymentMessagesContentRecipientInvalidViewController;
  -[PKPeerPaymentMessagesContentRecipientInvalidViewController viewDidLoad](&v10, "viewDidLoad");
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
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesContentBaseViewController appController](self, "appController"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "recipientDisplayName"));

  if (v10 && objc_msgSend(v10, "length"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesContentBaseViewController contentView](self, "contentView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "label"));
    v6 = PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_MESSAGES_RECIPIENT_INVALID_FORMAT"), CFSTR("%@"), v10);
    v7 = objc_claimAutoreleasedReturnValue(v6);
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesContentBaseViewController contentView](self, "contentView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "label"));
    v8 = PKLocalizedPeerPaymentString(CFSTR("PEER_PAYMENT_MESSAGES_RECIPIENT_INVALID_NO_DISPLAY_NAME"));
    v7 = objc_claimAutoreleasedReturnValue(v8);
  }
  v9 = (void *)v7;
  objc_msgSend(v5, "setText:", v7);

}

@end
