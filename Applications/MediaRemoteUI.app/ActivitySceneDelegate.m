@implementation ActivitySceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC13MediaRemoteUI21ActivitySceneDelegate *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_1000163B8(v8);

}

- (void)sceneDidDisconnect:(id)a3
{
  id v4;
  _TtC13MediaRemoteUI21ActivitySceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_100014D04(v4, (uint64_t)v5);

}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4;
  _TtC13MediaRemoteUI21ActivitySceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_1000150B4(v4);

}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4;
  _TtC13MediaRemoteUI21ActivitySceneDelegate *v5;

  v4 = a3;
  v5 = self;
  sub_100015138(v4);

}

- (_TtC13MediaRemoteUI21ActivitySceneDelegate)init
{
  return (_TtC13MediaRemoteUI21ActivitySceneDelegate *)sub_100015BE0();
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_routeRecommendationWindow));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_nowPlayingElementProvider));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_mirroringElementProvider));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_nowPlayingScene);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_screenMirroringScene);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_nowPlayingBannerScene);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_nowPlayingBannerWindow));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_nowPlayingBannerViewController);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_coversheetScene);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC13MediaRemoteUI21ActivitySceneDelegate_routeRecommendationScene);
}

- (BOOL)lockscreenViewController:(id)a3 didSelectArtworkView:(id)a4
{
  uint64_t v6;
  id v7;
  id v8;
  _TtC13MediaRemoteUI21ActivitySceneDelegate *v9;
  char v10;

  v6 = qword_1000589E0;
  v7 = a3;
  v8 = a4;
  v9 = self;
  if (v6 != -1)
    swift_once(&qword_1000589E0, sub_100026454);
  v10 = sub_100027638();

  return v10 & 1;
}

- (void)lockscreenViewController:(id)a3 didUpdatePreferredContentSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  _TtC13MediaRemoteUI21ActivitySceneDelegate *v8;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  v8 = self;
  sub_100015E8C(v7, (uint64_t)v8, width, height);

}

- (void)lockscreenViewController:(id)a3 didUpdateRestrictedRects:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC13MediaRemoteUI21ActivitySceneDelegate *v10;

  v7 = sub_100008314(0, &qword_100059B40, NSValue_ptr);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v7);
  v9 = a3;
  v10 = self;
  sub_100016034(v9, v8);

  swift_bridgeObjectRelease(v8);
}

@end
