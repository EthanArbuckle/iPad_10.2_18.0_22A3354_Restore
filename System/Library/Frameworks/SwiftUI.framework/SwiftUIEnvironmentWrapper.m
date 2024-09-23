@implementation SwiftUIEnvironmentWrapper

- (BOOL)isEqual:(id)a3
{
  SwiftUIEnvironmentWrapper *v4;
  SwiftUIEnvironmentWrapper *v5;
  char v6;
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
  v6 = EnvironmentWrapper.isEqual(_:)((uint64_t)v8);

  outlined destroy of ModifiedContent<ModifiedContent<TabItem.RootView, EditModeScopeModifier>, HitTestBindingModifier>((uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for Any?);
  return v6 & 1;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SwiftUIEnvironmentWrapper)initWithCoder:(id)a3
{
  type metadata accessor for EnvironmentWrapper();
  swift_deallocPartialClassInstance();
  return 0;
}

- (SwiftUIEnvironmentWrapper)init
{
  SwiftUIEnvironmentWrapper *result;

  result = (SwiftUIEnvironmentWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
