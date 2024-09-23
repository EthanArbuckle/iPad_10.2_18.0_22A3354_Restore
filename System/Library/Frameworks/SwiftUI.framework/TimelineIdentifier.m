@implementation TimelineIdentifier

- (_TtC7SwiftUI18TimelineIdentifier)init
{
  objc_class *ObjectType;
  _TtC7SwiftUI18TimelineIdentifier *v4;
  objc_super v6;
  objc_class *v7;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  UniqueID.init()();
  *(Class *)((char *)&v4->super.isa + OBJC_IVAR____TtC7SwiftUI18TimelineIdentifier_identifier) = v7;

  v6.receiver = v4;
  v6.super_class = ObjectType;
  return -[TimelineIdentifier init](&v6, sel_init);
}

- (BOOL)isEqual:(id)a3
{
  _TtC7SwiftUI18TimelineIdentifier *v4;
  _TtC7SwiftUI18TimelineIdentifier *v5;
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
  v6 = TimelineIdentifier.isEqual(_:)((uint64_t)v8);

  outlined destroy of ModifiedContent<ModifiedContent<TabItem.RootView, EditModeScopeModifier>, HitTestBindingModifier>((uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for Any?);
  return v6;
}

- (int64_t)hash
{
  Hasher.init()();
  Hasher._combine(_:)(*(Swift::UInt *)((char *)&self->super.isa + OBJC_IVAR____TtC7SwiftUI18TimelineIdentifier_identifier));
  return Hasher.finalize()();
}

@end
