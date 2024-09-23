@implementation TapUISceneActionHandler

- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6
{
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  _TtC22ProximityReaderSceneUI23TapUISceneActionHandler *v17;
  id v18;
  Class isa;

  v11 = sub_10000A654();
  v12 = sub_10000A690();
  v13 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v11, v12);
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = self;
  v18 = sub_10000BA28(v13, (uint64_t)v14, v15);

  swift_bridgeObjectRelease(v13);
  isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v18);
  return isa;
}

- (_TtC22ProximityReaderSceneUI23TapUISceneActionHandler)init
{
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC22ProximityReaderSceneUI23TapUISceneActionHandler_action) = 0;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return -[TapUISceneActionHandler init](&v5, "init");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22ProximityReaderSceneUI23TapUISceneActionHandler_action));
}

@end
