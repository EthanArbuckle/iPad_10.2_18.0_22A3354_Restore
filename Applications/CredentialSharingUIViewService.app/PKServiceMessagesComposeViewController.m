@implementation PKServiceMessagesComposeViewController

- (PKServiceMessagesComposeViewController)init
{
  PKServiceMessagesComposeViewController *v2;
  MFMessageComposeViewController *v3;
  MFMessageComposeViewController *messageComposeViewController;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKServiceMessagesComposeViewController;
  v2 = -[PKServiceMessagesComposeViewController init](&v6, "init");
  if (v2)
  {
    v3 = (MFMessageComposeViewController *)objc_alloc_init((Class)MFMessageComposeViewController);
    messageComposeViewController = v2->_messageComposeViewController;
    v2->_messageComposeViewController = v3;

    -[MFMessageComposeViewController setMessageComposeDelegate:](v2->_messageComposeViewController, "setMessageComposeDelegate:", v2);
  }
  return v2;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)loadView
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PKServiceMessagesComposeViewController;
  -[PKServiceMessagesComposeViewController loadView](&v2, "loadView");
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKServiceMessagesComposeViewController;
  -[PKServiceMessagesComposeViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v4, "viewDidMoveToWindow:shouldAppearOrDisappear:", a3, a4);
}

- (void)_hostApplicationDidEnterBackground
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PKServiceMessagesComposeViewController;
  -[PKServiceMessagesComposeViewController _hostApplicationDidEnterBackground](&v2, "_hostApplicationDidEnterBackground");
}

- (void)setDisplayPropertiesWithScreenSize:(CGSize)a3 scale:(double)a4
{
  double height;
  double width;
  uint64_t Object;
  NSObject *v8;
  NSString *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  double v14;
  CGSize v15;

  height = a3.height;
  width = a3.width;
  Object = PKLogFacilityTypeGetObject(0, a2);
  v8 = objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v15.width = width;
    v15.height = height;
    v9 = NSStringFromCGSize(v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = 138543618;
    v12 = v10;
    v13 = 2048;
    v14 = a4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Setting display properties with screenSize=%{public}@ scale=%.f", (uint8_t *)&v11, 0x16u);

  }
  PKSetDisplayProperties(width, height, a4);
}

- (void)setRecipientAddresses:(id)a3
{
  objc_storeStrong((id *)&self->_recipientAddresses, a3);
}

- (void)setConfiguration:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  MFMessageComposeViewController *messageComposeViewController;
  id v9;
  _QWORD v10[5];
  id v11;
  id location;

  v6 = a3;
  v7 = a4;
  messageComposeViewController = self->_messageComposeViewController;
  v9 = objc_initWeak(&location, messageComposeViewController);
  -[MFMessageComposeViewController setRecipients:](messageComposeViewController, "setRecipients:", self->_recipientAddresses);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100001D04;
  v10[3] = &unk_100004150;
  objc_copyWeak(&v11, &location);
  v10[4] = self;
  +[PKSharingMessageExtensionMessageBuilder messageFromConfiguration:completionHandler:](PKSharingMessageExtensionMessageBuilder, "messageFromConfiguration:completionHandler:", v6, v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

- (void)setPartialShareInvite:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  MFMessageComposeViewController *messageComposeViewController;
  id v9;
  _QWORD v10[5];
  id v11;
  id location;

  v6 = a3;
  v7 = a4;
  messageComposeViewController = self->_messageComposeViewController;
  v9 = objc_initWeak(&location, messageComposeViewController);
  -[MFMessageComposeViewController setRecipients:](messageComposeViewController, "setRecipients:", self->_recipientAddresses);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100001E98;
  v10[3] = &unk_100004150;
  objc_copyWeak(&v11, &location);
  v10[4] = self;
  +[PKSharingMessageExtensionMessageBuilder messageFromInvitation:completionHandler:](PKSharingMessageExtensionMessageBuilder, "messageFromInvitation:completionHandler:", v6, v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[PKServiceMessagesComposeViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy", a3));
  objc_msgSend(v5, "messageComposeViewControllerDidFinishWithResult:", a4 == 1);

}

- (MFMessageComposeViewController)messageComposeViewController
{
  return self->_messageComposeViewController;
}

- (void)setMessageComposeViewController:(id)a3
{
  objc_storeStrong((id *)&self->_messageComposeViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageComposeViewController, 0);
  objc_storeStrong((id *)&self->_recipientAddresses, 0);
}

@end
