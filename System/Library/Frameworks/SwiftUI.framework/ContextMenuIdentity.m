@implementation ContextMenuIdentity

- (id)copyWithZone:(void *)a3
{
  objc_class *ObjectType;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType();
  v5 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7SwiftUI19ContextMenuIdentity_base);
  v6 = (char *)objc_allocWithZone(ObjectType);
  v7 = &v6[OBJC_IVAR____TtC7SwiftUI19ContextMenuIdentity_sourceIndexPath];
  v8 = type metadata accessor for IndexPath();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  *(_QWORD *)&v6[OBJC_IVAR____TtC7SwiftUI19ContextMenuIdentity_base] = v5;
  v10.receiver = v6;
  v10.super_class = ObjectType;
  swift_retain();
  return -[ContextMenuIdentity init](&v10, sel_init);
}

- (BOOL)isEqual:(id)a3
{
  _TtC7SwiftUI19ContextMenuIdentity *v4;
  _TtC7SwiftUI19ContextMenuIdentity *v5;
  BOOL v6;
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
  v6 = ContextMenuIdentity.isEqual(_:)((uint64_t)v8);

  outlined destroy of Any?((uint64_t)v8);
  return v6;
}

- (int64_t)hash
{
  Hasher.init()();
  Hasher._combine(_:)(*(Swift::UInt *)((char *)&self->super.isa + OBJC_IVAR____TtC7SwiftUI19ContextMenuIdentity_base));
  return Hasher.finalize()();
}

- (NSString)description
{
  _TtC7SwiftUI19ContextMenuIdentity *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = ContextMenuIdentity.description.getter();
  v5 = v4;

  v6 = (void *)MEMORY[0x18D75CC88](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (_TtC7SwiftUI19ContextMenuIdentity)init
{
  _TtC7SwiftUI19ContextMenuIdentity *result;

  result = (_TtC7SwiftUI19ContextMenuIdentity *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  outlined destroy of IndexPath?((uint64_t)self + OBJC_IVAR____TtC7SwiftUI19ContextMenuIdentity_sourceIndexPath);
}

@end
