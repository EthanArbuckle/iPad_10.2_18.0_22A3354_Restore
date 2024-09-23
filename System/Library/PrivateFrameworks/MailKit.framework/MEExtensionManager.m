@implementation MEExtensionManager

+ (void)reloadContentBlockerWithIdentifier:(NSString *)identifier completionHandler:(void *)completionHandler
{
  void (**v4)(id, _QWORD);

  v4 = completionHandler;
  notify_post((const char *)objc_msgSend(CFSTR("MEContentBlockerMangerReload"), "UTF8String"));
  v4[2](v4, 0);

}

+ (void)reloadVisibleMessagesWithCompletionHandler:(void *)completionHandler
{
  void (**v3)(id, _QWORD);

  v3 = completionHandler;
  notify_post((const char *)objc_msgSend(CFSTR("MEVisibleMessagesReload"), "UTF8String"));
  v3[2](v3, 0);

}

@end
