@implementation ShareSheetSceneActionHandler

- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6
{
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  _TtC16SharingUIService28ShareSheetSceneActionHandler *v17;
  uint64_t v18;
  uint64_t v19;
  Class isa;

  v11 = sub_10000ABC0(0, &qword_10003FA80, BSAction_ptr);
  v12 = sub_1000104A0();
  v13 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v11, v12);
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = self;
  sub_100011018(v13);
  v19 = v18;

  swift_bridgeObjectRelease(v13);
  isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v19);
  return isa;
}

- (_TtC16SharingUIService28ShareSheetSceneActionHandler)init
{
  _TtC16SharingUIService28ShareSheetSceneActionHandler *result;

  result = (_TtC16SharingUIService28ShareSheetSceneActionHandler *)_swift_stdlib_reportUnimplementedInitializer("SharingUIService.ShareSheetSceneActionHandler", 45, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(_QWORD *)&self->handler[OBJC_IVAR____TtC16SharingUIService28ShareSheetSceneActionHandler_handler]);
}

@end
