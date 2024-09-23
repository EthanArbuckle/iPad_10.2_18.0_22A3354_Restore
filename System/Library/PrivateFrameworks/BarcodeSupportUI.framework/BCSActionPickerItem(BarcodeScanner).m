@implementation BCSActionPickerItem(BarcodeScanner)

- (void)performActionInExternalApp
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "actionURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openURL:options:completionHandler:", v2, MEMORY[0x24BDBD1B8], 0);

}

@end
