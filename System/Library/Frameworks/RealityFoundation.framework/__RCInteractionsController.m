@implementation __RCInteractionsController

+ (void)__invokeCustomTriggerWithNamed:(id)a3 onEntityNamed:(id)a4 inSceneNamed:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v7 = v6;
  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  specialized static __RCInteractionsController.__invokeCustomTrigger(named:onEntityNamed:inSceneNamed:)(v5, v7, v8, v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

+ (void)__registerCustomActionWithNamed:(id)a3 inSceneNamed:(id)a4 action:(id)a5
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = _Block_copy(a5);
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = v7;
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v11 = v10;
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = v5;
  specialized static __RCInteractionsController.__registerCustomAction(named:inSceneNamed:action:)(v6, v8, v9, v11, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSString) -> (), v12);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

- (_TtC17RealityFoundation26__RCInteractionsController)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for __RCInteractionsController();
  return -[__RCInteractionsController init](&v3, sel_init);
}

@end
