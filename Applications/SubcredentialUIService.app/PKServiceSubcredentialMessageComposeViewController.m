@implementation PKServiceSubcredentialMessageComposeViewController

- (PKServiceSubcredentialMessageComposeViewController)init
{
  PKServiceSubcredentialMessageComposeViewController *v2;
  MFMessageComposeViewController *v3;
  MFMessageComposeViewController *messageComposeViewController;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKServiceSubcredentialMessageComposeViewController;
  v2 = -[PKServiceSubcredentialMessageComposeViewController init](&v6, "init");
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

- (void)setSharingRequest:(id)a3 completionHandler:(id)a4
{
  id v5;
  _QWORD v6[5];
  id v7;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100002008;
  v6[3] = &unk_100004118;
  v6[4] = self;
  v7 = a4;
  v5 = v7;
  +[PKSharingMessageExtensionMessageBuilder messageFromSharingRequest:completionHandler:](PKSharingMessageExtensionMessageBuilder, "messageFromSharingRequest:completionHandler:", a3, v6);

}

- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  id v6;

  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue(-[PKServiceSubcredentialMessageComposeViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v6, "messageComposeViewControllerDidFinishWithResult:", a4 == 1);

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
}

@end
