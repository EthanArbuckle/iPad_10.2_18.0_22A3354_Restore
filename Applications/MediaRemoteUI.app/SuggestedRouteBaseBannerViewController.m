@implementation SuggestedRouteBaseBannerViewController

- (_TtC13MediaRemoteUI38SuggestedRouteBaseBannerViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC13MediaRemoteUI38SuggestedRouteBaseBannerViewController *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC13MediaRemoteUI38SuggestedRouteBaseBannerViewController_activityRouteView) = 0;
  v4 = a3;

  result = (_TtC13MediaRemoteUI38SuggestedRouteBaseBannerViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001000392B0, "MediaRemoteUI/SuggestedRouteBaseBannerViewController.swift", 58, 2, 56, 0);
  __break(1u);
  return result;
}

- (void)nowPlayingController:(id)a3 endpointController:(id)a4 didChangeRoute:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC13MediaRemoteUI38SuggestedRouteBaseBannerViewController *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_10001F0F0();

}

- (void)nowPlayingController:(id)a3 metadataController:(id)a4 didChangeArtwork:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  _TtC13MediaRemoteUI38SuggestedRouteBaseBannerViewController *v12;
  id v13;
  id v14;
  uint64_t KeyPath;
  uint64_t v16;
  void (*v17)(_BYTE *, _QWORD);
  uint64_t v18;
  void *v19;
  _BYTE v20[32];

  v8 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC13MediaRemoteUI38SuggestedRouteBaseBannerViewController_controller);
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = self;
  v13 = objc_msgSend(v8, "metadataController");
  v14 = objc_msgSend(v13, "artwork");

  KeyPath = swift_getKeyPath(&unk_1000344C0);
  v16 = swift_getKeyPath(&unk_1000344E8);
  v17 = (void (*)(_BYTE *, _QWORD))static Published.subscript.modify(v20, v12, KeyPath, v16);
  v19 = *(void **)(v18 + 104);
  *(_QWORD *)(v18 + 104) = v14;

  v17(v20, 0);
  swift_release(KeyPath);
  swift_release(v16);
}

- (void)nowPlayingController:(id)a3 metadataController:(id)a4 didChangeNowPlayingInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC13MediaRemoteUI38SuggestedRouteBaseBannerViewController *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_10001F450();

}

- (BOOL)nowPlayingControllerShouldAutomaticallyUpdateResponse:(id)a3
{
  return 1;
}

- (void)actionButtonTappedWithSender:(id)a3
{
  id v4;
  _TtC13MediaRemoteUI38SuggestedRouteBaseBannerViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10001FF94();

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC13MediaRemoteUI38SuggestedRouteBaseBannerViewController__suggestedRoute;
  v4 = sub_100006CE8(&qword_100059730);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI38SuggestedRouteBaseBannerViewController_endpointController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI38SuggestedRouteBaseBannerViewController_controller));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI38SuggestedRouteBaseBannerViewController_activityRouteView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI38SuggestedRouteBaseBannerViewController_routeTextFormatter));
}

@end
