@implementation AXRemoteViewServiceAdaptor

+ (void)presentRemoteNearbyDevicesViewControllerWithPresentationHandler:(id)a3 dismissalHandler:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  +[AXRemoteUIAlertManager sharedInstance](AXRemoteUIAlertManager, "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentRemoteUIAlertWithIdentifier:viewControllerClassName:userInfo:presentationHandler:dismissalHandler:", CFSTR("com.apple.AXRemoteViewService"), CFSTR("NearbyDevicesRemoteViewController"), MEMORY[0x24BDBD1B8], v6, v5);

}

+ (void)presentRemoteNearbyDevicesViewControllerWithConnectionHandler:(id)a3 dismissalHandler:(id)a4
{
  id v4;

  v4 = +[_AXRemoteNearbyDevicesViewController presentNearbyDevicesViewControllerWithConnectionHandler:dismissalHandler:](_AXRemoteNearbyDevicesViewController, "presentNearbyDevicesViewControllerWithConnectionHandler:dismissalHandler:", a3, a4);
}

@end
