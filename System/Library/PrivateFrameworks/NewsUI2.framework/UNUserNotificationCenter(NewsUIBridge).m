@implementation UNUserNotificationCenter(NewsUIBridge)

- (void)ts_replaceContentForRequestWithIdentifier:()NewsUIBridge replacementContent:completionHandler:
{
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v7 = (void *)MEMORY[0x1E0CEC7A0];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v7, "currentNotificationCenter");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "replaceContentForRequestWithIdentifier:replacementContent:completionHandler:", v10, v9, v8);

}

@end
