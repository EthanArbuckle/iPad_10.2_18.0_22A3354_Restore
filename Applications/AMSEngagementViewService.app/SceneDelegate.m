@implementation SceneDelegate

- (UIWindow)window
{
  id v2;

  sub_10000F4E4();
  return (UIWindow *)v2;
}

- (void)setWindow:(id)a3
{
  id v5;
  _TtC24AMSEngagementViewService13SceneDelegate *v6;

  v5 = a3;
  v6 = self;
  sub_10000F554((uint64_t)a3);

}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC24AMSEngagementViewService13SceneDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_10000F568((int)v8, (int)v11, v10);

}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtC24AMSEngagementViewService13SceneDelegate *v11;

  v7 = sub_100009218(0, &qword_10001E9B8, UIOpenURLContext_ptr);
  sub_100011B78(&qword_10001E9C0, &qword_10001E9B8, UIOpenURLContext_ptr);
  v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a4, v7, v8);
  v10 = a3;
  v11 = self;
  sub_10000F8B8((uint64_t)v11, v9);

  swift_bridgeObjectRelease(v9);
}

- (void)scene:(id)a3 continueUserActivity:(id)a4
{
  id v6;
  id v7;
  _TtC24AMSEngagementViewService13SceneDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_10000FCAC((uint64_t)v8, v7);

}

- (_TtC24AMSEngagementViewService13SceneDelegate)init
{
  return (_TtC24AMSEngagementViewService13SceneDelegate *)sub_1000119B8();
}

- (void).cxx_destruct
{

}

@end
