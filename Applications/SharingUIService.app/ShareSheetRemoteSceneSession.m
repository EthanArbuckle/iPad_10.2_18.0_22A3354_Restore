@implementation ShareSheetRemoteSceneSession

- (void)dealloc
{
  _TtC16SharingUIService28ShareSheetRemoteSceneSession *v2;

  v2 = self;
  sub_100007C3C();
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_fbsScene));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_windowScene));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_uiSession));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_rootViewController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_contentViewController));

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_sceneSettingsObservables));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_activeCloudShareRequest));
}

- (_UIHostedWindowScene)hostedWindowScene
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_windowScene);
  v3 = objc_opt_self(_UIHostedWindowScene, a2);
  v4 = (void *)swift_dynamicCastObjCClass(v2, v3);
  if (v4)
    v5 = v2;
  return (_UIHostedWindowScene *)v4;
}

- (_TtC16SharingUIService28ShareSheetRemoteSceneSession)init
{
  _TtC16SharingUIService28ShareSheetRemoteSceneSession *result;

  result = (_TtC16SharingUIService28ShareSheetRemoteSceneSession *)_swift_stdlib_reportUnimplementedInitializer("SharingUIService.ShareSheetRemoteSceneSession", 45, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void)activityContentViewControllerDidUpdateDataSource:(id)a3
{
  id v5;
  id v6;
  _TtC16SharingUIService28ShareSheetRemoteSceneSession *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;

  v5 = objc_allocWithZone((Class)SHSheetAction);
  v6 = a3;
  v7 = self;
  v8 = objc_msgSend(v5, "initWithType:", 10);
  v9 = *(Class *)((char *)&v7->super.isa + OBJC_IVAR____TtC16SharingUIService28ShareSheetRemoteSceneSession_windowScene);
  v11 = objc_opt_self(_UIHostedWindowScene, v10);
  v13 = (id)swift_dynamicCastObjCClass(v9, v11);
  if (v13)
    v12 = v9;
  objc_msgSend(v13, "sendAction:", v8);

}

- (void)activityContentViewControllerDidUpdateHeaderMetadata:(id)a3
{
  id v4;
  _TtC16SharingUIService28ShareSheetRemoteSceneSession *v5;

  v4 = a3;
  v5 = self;
  sub_1000084EC(v4);

}

- (void)addParticipantsViewController:(id)a3 failedToSaveShareWithError:(id)a4
{
  id v6;
  _TtC16SharingUIService28ShareSheetRemoteSceneSession *v7;
  id v8;

  v6 = a3;
  v8 = a4;
  v7 = self;
  sub_10000A64C((uint64_t)v8);

}

- (void)addParticipantsViewController:(id)a3 completedSharingWithShareURL:(id)a4 ckShare:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  _TtC16SharingUIService28ShareSheetRemoteSceneSession *v15;
  uint64_t v16;

  v9 = type metadata accessor for URL(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin();
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v13 = a3;
  v14 = a5;
  v15 = self;
  sub_10000A904((uint64_t)v12, v14);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

@end
