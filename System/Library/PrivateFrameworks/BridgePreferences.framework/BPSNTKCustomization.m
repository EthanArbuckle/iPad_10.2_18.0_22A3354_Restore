@implementation BPSNTKCustomization

- (id)facesViewController
{
  return 0;
}

- (id)galleryViewController
{
  return 0;
}

- (id)userNotificationCategories
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "set");
}

- (BOOL)handleUserNotificationResponse:(id)a3 fromNotificationCenter:(id)a4 withCompletionHandler:(id)a5
{
  return 0;
}

- (BOOL)handlePresentationOfNotification:(id)a3 fromNotificationCenter:(id)a4 withCompletionHandler:(id)a5
{
  return 0;
}

@end
