@implementation ScreenSharingBroadcasterSceneDelegate

- (UIWindow)window
{
  return (UIWindow *)sub_10015D0CC();
}

- (void)setWindow:(id)a3
{
  id v5;
  _TtC13InCallService37ScreenSharingBroadcasterSceneDelegate *v6;

  v5 = a3;
  v6 = self;
  sub_10015D140((uint64_t)a3);

}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC13InCallService37ScreenSharingBroadcasterSceneDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_10015D158(v8);

}

- (void)sceneDidDisconnect:(id)a3
{
  id v4;
  _TtC13InCallService37ScreenSharingBroadcasterSceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_10015D788();

}

- (_TtC13InCallService37ScreenSharingBroadcasterSceneDelegate)init
{
  return (_TtC13InCallService37ScreenSharingBroadcasterSceneDelegate *)sub_10015D87C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC13InCallService37ScreenSharingBroadcasterSceneDelegate_window));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC13InCallService37ScreenSharingBroadcasterSceneDelegate_cloneTerminatingWindow));
}

@end
