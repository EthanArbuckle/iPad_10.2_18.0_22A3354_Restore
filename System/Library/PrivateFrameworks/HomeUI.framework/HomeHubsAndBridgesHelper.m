@implementation HomeHubsAndBridgesHelper

+ (id)createHomeHubsAndBridgesListViewHostingControllerWithHome:(id)a3
{
  id v4;

  v4 = objc_allocWithZone((Class)type metadata accessor for HomeHubsAndBridgesListViewHostingController(0));
  return HomeHubsAndBridgesListViewHostingController.init(home:)(a3);
}

+ (id)presentBridgeDetailViewForAccessory:(id)a3 withHome:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a3;
  v6 = a4;
  v7 = _s6HomeUI0A20HubsAndBridgesHelperC23presentBridgeDetailView3for4withSo8NAFutureCySo6NSNullCGSo11HMAccessoryC_So6HMHomeCtFZ_0(v5, v6);

  return v7;
}

- (_TtC6HomeUI24HomeHubsAndBridgesHelper)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for HomeHubsAndBridgesHelper();
  return -[HomeHubsAndBridgesHelper init](&v3, sel_init);
}

@end
