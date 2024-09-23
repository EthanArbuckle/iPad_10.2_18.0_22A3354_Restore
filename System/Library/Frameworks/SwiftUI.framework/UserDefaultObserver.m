@implementation UserDefaultObserver

- (void)dealloc
{
  objc_class *ObjectType;
  char *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _TtC7SwiftUIP33_F2BB00CEA25D2617C18DE8984EB64B5319UserDefaultObserver *v9;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (char *)self + OBJC_IVAR____TtC7SwiftUIP33_F2BB00CEA25D2617C18DE8984EB64B5319UserDefaultObserver_state;
  v5 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC7SwiftUIP33_F2BB00CEA25D2617C18DE8984EB64B5319UserDefaultObserver_state);
  if (v5)
  {
    v6 = *((_QWORD *)v4 + 1);
    v7 = *((_QWORD *)v4 + 2);
    self;
    v8 = v5;
    swift_bridgeObjectRetain();
    UserDefaultObserver.unobserve(oldDefaults:key:)(v8, v6, v7);

    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = self;
  }
  v10.receiver = self;
  v10.super_class = ObjectType;
  -[UserDefaultObserver dealloc](&v10, sel_dealloc);
}

- (void).cxx_destruct
{
  outlined consume of UserDefaultObserver.State(*(void **)((char *)&self->super.isa
                                                         + OBJC_IVAR____TtC7SwiftUIP33_F2BB00CEA25D2617C18DE8984EB64B5319UserDefaultObserver_state));
  outlined destroy of UserDefaultObserver.Target((uint64_t)self + OBJC_IVAR____TtC7SwiftUIP33_F2BB00CEA25D2617C18DE8984EB64B5319UserDefaultObserver_target);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _TtC7SwiftUIP33_F2BB00CEA25D2617C18DE8984EB64B5319UserDefaultObserver *v14;
  id v15;
  _TtC7SwiftUIP33_F2BB00CEA25D2617C18DE8984EB64B5319UserDefaultObserver *v16;
  _OWORD v17[2];

  if (a3)
  {
    v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v12 = v11;
    if (a4)
      goto LABEL_3;
LABEL_6:
    memset(v17, 0, sizeof(v17));
    v15 = a5;
    v16 = self;
    if (!a5)
      goto LABEL_7;
    goto LABEL_4;
  }
  v10 = 0;
  v12 = 0;
  if (!a4)
    goto LABEL_6;
LABEL_3:
  swift_unknownObjectRetain();
  v13 = a5;
  v14 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  if (a5)
  {
LABEL_4:
    type metadata accessor for NSKeyValueChangeKey(0);
    lazy protocol witness table accessor for type NSAttributedStringKey and conformance NSAttributedStringKey((unint64_t *)&lazy protocol witness table cache variable for type NSKeyValueChangeKey and conformance NSKeyValueChangeKey, (uint64_t (*)(uint64_t))type metadata accessor for NSKeyValueChangeKey, (uint64_t)&protocol conformance descriptor for NSKeyValueChangeKey);
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  }
LABEL_7:
  specialized UserDefaultObserver.observeValue(forKeyPath:of:change:context:)(v10, v12, (uint64_t)v17, a6);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  outlined destroy of Any?((uint64_t)v17);
}

- (void)userDefaultsDidChange:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC7SwiftUIP33_F2BB00CEA25D2617C18DE8984EB64B5319UserDefaultObserver *v9;
  uint64_t v10;

  v4 = type metadata accessor for Notification();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4, v6);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  v9 = self;
  UserDefaultObserver.userDefaultsDidChange(_:)();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

- (_TtC7SwiftUIP33_F2BB00CEA25D2617C18DE8984EB64B5319UserDefaultObserver)init
{
  _TtC7SwiftUIP33_F2BB00CEA25D2617C18DE8984EB64B5319UserDefaultObserver *result;

  result = (_TtC7SwiftUIP33_F2BB00CEA25D2617C18DE8984EB64B5319UserDefaultObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
