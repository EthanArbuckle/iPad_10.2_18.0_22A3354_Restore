@implementation ShareSheetSceneSession

- (void)dealloc
{
  _TtC16SharingUIService22ShareSheetSceneSession *v2;

  v2 = self;
  sub_10000F1D0();
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_rootViewController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16SharingUIService22ShareSheetSceneSession_contentViewController));

}

- (_TtC16SharingUIService22ShareSheetSceneSession)init
{
  _TtC16SharingUIService22ShareSheetSceneSession *result;

  result = (_TtC16SharingUIService22ShareSheetSceneSession *)_swift_stdlib_reportUnimplementedInitializer("SharingUIService.ShareSheetSceneSession", 39, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void)activityContentViewControllerDidUpdateDataSource:(id)a3
{
  id v4;
  _TtC16SharingUIService22ShareSheetSceneSession *v5;

  v4 = a3;
  v5 = self;
  sub_1000112E8();

}

- (void)activityContentViewControllerDidUpdateHeaderMetadata:(id)a3
{
  id v4;
  _TtC16SharingUIService22ShareSheetSceneSession *v5;

  v4 = a3;
  v5 = self;
  sub_10000FC40(v4);

}

- (void)sheetInteractionController:(id)a3 didReceiveDraggingEvent:(id)a4
{
  id v6;
  id v7;
  _TtC16SharingUIService22ShareSheetSceneSession *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1000113C4((uint64_t)v7);

}

@end
