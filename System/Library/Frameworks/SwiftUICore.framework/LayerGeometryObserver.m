@implementation LayerGeometryObserver

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  _TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D421LayerGeometryObserver *v14;
  id v15;
  _TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D421LayerGeometryObserver *v16;
  uint64_t v17;
  objc_class *v18;
  _OWORD v19[2];

  if (a3)
  {
    v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v12 = v11;
    if (a4)
    {
LABEL_3:
      swift_unknownObjectRetain();
      v13 = a5;
      v14 = self;
      _bridgeAnyObjectToAny(_:)();
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    v10 = 0;
    v12 = 0;
    if (a4)
      goto LABEL_3;
  }
  memset(v19, 0, sizeof(v19));
  v15 = a5;
  v16 = self;
LABEL_6:
  v17 = MEMORY[0x24BEE4AD8];
  if (a5)
  {
    type metadata accessor for NSKeyValueChangeKey(0);
    lazy protocol witness table accessor for type AGNamedTraceEventID and conformance AGNamedTraceEventID(&lazy protocol witness table cache variable for type NSKeyValueChangeKey and conformance NSKeyValueChangeKey, (uint64_t (*)(uint64_t))type metadata accessor for NSKeyValueChangeKey, (uint64_t)&protocol conformance descriptor for NSKeyValueChangeKey);
    v18 = (objc_class *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  }
  else
  {
    v18 = 0;
  }
  LayerGeometryObserver.observeValue(forKeyPath:of:change:context:)(v10, v12, (uint64_t)v19, v18, a6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of Any?((uint64_t)v19, (uint64_t)&lazy cache variable for type metadata for Any?, v17 + 8, (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))type metadata accessor for MutableBox<CachedEnvironment>);
}

- (_TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D421LayerGeometryObserver)init
{
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D421LayerGeometryObserver_observedLayers) = (Class)MEMORY[0x24BEE4AF8];
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D421LayerGeometryObserver_ancestor) = 0;
  swift_unknownObjectWeakInit();
  v5.receiver = self;
  v5.super_class = ObjectType;
  return -[LayerGeometryObserver init](&v5, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D421LayerGeometryObserver_ancestor));
  swift_unknownObjectWeakDestroy();
}

@end
