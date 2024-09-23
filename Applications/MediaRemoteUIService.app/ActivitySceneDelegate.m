@implementation ActivitySceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC20MediaRemoteUIService21ActivitySceneDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_100003F98(v8);

}

- (void)sceneDidDisconnect:(id)a3
{
  id v4;
  _TtC20MediaRemoteUIService21ActivitySceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_100002B1C(v4);

}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4;
  _TtC20MediaRemoteUIService21ActivitySceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_100002C8C(v4);

}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4;
  _TtC20MediaRemoteUIService21ActivitySceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_100002E88(v4);

}

- (_TtC20MediaRemoteUIService21ActivitySceneDelegate)init
{
  return (_TtC20MediaRemoteUIService21ActivitySceneDelegate *)sub_100003084();
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;

  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC20MediaRemoteUIService21ActivitySceneDelegate_groupSessionLowPowerScene, a2);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC20MediaRemoteUIService21ActivitySceneDelegate_groupSessionLowPowerWindow));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC20MediaRemoteUIService21ActivitySceneDelegate_groupSessionNearbyScene, v3);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC20MediaRemoteUIService21ActivitySceneDelegate_groupSessionNearbyViewController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC20MediaRemoteUIService21ActivitySceneDelegate_groupSessionNearbyWindow));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC20MediaRemoteUIService21ActivitySceneDelegate_routeRecommendationScene, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC20MediaRemoteUIService21ActivitySceneDelegate_routeRecommendationWindow));
}

@end
