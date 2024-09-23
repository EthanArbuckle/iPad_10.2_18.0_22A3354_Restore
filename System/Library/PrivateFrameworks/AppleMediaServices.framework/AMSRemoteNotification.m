@implementation AMSRemoteNotification

+ (void)handleNotification:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "_sharedPushHandler");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleNotification:", v4);

}

+ (BOOL)shouldHandleNotification:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  objc_msgSend(a1, "_sharedPushHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldHandleNotification:", v4);

  return v6;
}

+ (id)_sharedPushHandler
{
  if (_sharedPushHandler_onceToken != -1)
    dispatch_once(&_sharedPushHandler_onceToken, &__block_literal_global_114);
  return 0;
}

@end
