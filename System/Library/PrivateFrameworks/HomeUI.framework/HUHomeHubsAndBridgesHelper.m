@implementation HUHomeHubsAndBridgesHelper

+ (id)presentBridgeDetailViewForAccessory:(id)a3 withHome:(id)a4
{
  return +[HomeHubsAndBridgesHelper presentBridgeDetailViewForAccessory:withHome:](_TtC6HomeUI24HomeHubsAndBridgesHelper, "presentBridgeDetailViewForAccessory:withHome:", a3, a4);
}

+ (id)serviceDetailVCWithItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[HUViewControllerRegistry sharedInstance](HUViewControllerRegistry, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v4, "viewControllerClassForIdentifier:", CFSTR("serviceLikeItemDetails"))), "initWithServiceLikeItem:", v3);

  return v5;
}

@end
