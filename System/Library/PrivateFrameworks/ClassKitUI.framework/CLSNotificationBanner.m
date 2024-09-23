@implementation CLSNotificationBanner

+ (void)showBannerWithTitle:(id)a3 message:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  CLSNotificationBannerView *v10;
  const char *v11;
  const char *v12;
  id v13;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = [CLSNotificationBannerView alloc];
  v13 = (id)objc_msgSend_initWithTitle_message_(v10, v11, (uint64_t)v9, v8);

  objc_msgSend_showWithCompletionHandler_(v13, v12, (uint64_t)v7);
}

@end
