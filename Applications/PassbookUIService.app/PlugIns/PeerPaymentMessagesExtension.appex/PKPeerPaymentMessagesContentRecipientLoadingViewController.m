@implementation PKPeerPaymentMessagesContentRecipientLoadingViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKPeerPaymentMessagesContentRecipientLoadingViewController;
  -[PKPeerPaymentMessagesContentRecipientLoadingViewController viewDidLoad](&v5, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PKPeerPaymentMessagesContentBaseViewController contentView](self, "contentView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "activityIndicator"));
  objc_msgSend(v4, "startAnimating");

}

@end
