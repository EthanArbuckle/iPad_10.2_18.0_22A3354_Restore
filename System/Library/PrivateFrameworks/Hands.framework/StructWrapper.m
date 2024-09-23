@implementation StructWrapper

- (_TtC5Hands13StructWrapper)init
{
  _OWORD *v3;
  objc_class *v4;
  objc_super v6;

  v3 = (_OWORD *)((char *)self + OBJC_IVAR____TtC5Hands13StructWrapper_data);
  v4 = (objc_class *)type metadata accessor for StructWrapper();
  *v3 = 0u;
  v3[1] = 0u;
  v6.receiver = self;
  v6.super_class = v4;
  return -[StructWrapper init](&v6, sel_init);
}

- (_TtC5Hands13StructWrapper)initWithData:(id)a3
{
  _OWORD *v4;
  _TtC5Hands13StructWrapper *v5;
  _TtC5Hands13StructWrapper *v6;
  objc_super v8;
  _BYTE v9[32];
  _BYTE v10[32];

  swift_unknownObjectRetain();
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  v4 = (_OWORD *)((char *)self + OBJC_IVAR____TtC5Hands13StructWrapper_data);
  *v4 = 0u;
  v4[1] = 0u;
  outlined init with copy of Any((uint64_t)v10, (uint64_t)v9);
  swift_beginAccess();
  v5 = self;
  outlined assign with take of Any?((uint64_t)v9, (uint64_t)v4);
  swift_endAccess();

  v8.receiver = v5;
  v8.super_class = (Class)type metadata accessor for StructWrapper();
  v6 = -[StructWrapper init](&v8, sel_init);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v10);
  return v6;
}

- (void)updateWithData:(id)a3
{
  _TtC5Hands13StructWrapper *v4;
  _TtC5Hands13StructWrapper *v5;
  char *v6;
  _BYTE v7[32];
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  outlined init with copy of Any?((uint64_t)v8, (uint64_t)v7);
  v6 = (char *)self + OBJC_IVAR____TtC5Hands13StructWrapper_data;
  swift_beginAccess();
  outlined assign with take of Any?((uint64_t)v7, (uint64_t)v6);
  swift_endAccess();

  outlined destroy of Coordinate3DPB?((uint64_t)v8, &demangling cache variable for type metadata for Any?);
}

- (id)tryToSerializeToData
{
  _TtC5Hands13StructWrapper *v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  Class isa;

  v2 = self;
  v3 = StructWrapper.tryToSerializeToData()();
  v5 = v4;

  if (v5 >> 60 == 15)
  {
    isa = 0;
  }
  else
  {
    isa = Data._bridgeToObjectiveC()().super.isa;
    outlined consume of Data?(v3, v5);
  }
  return isa;
}

- (void).cxx_destruct
{
  outlined destroy of Coordinate3DPB?((uint64_t)self + OBJC_IVAR____TtC5Hands13StructWrapper_data, &demangling cache variable for type metadata for Any?);
}

@end
