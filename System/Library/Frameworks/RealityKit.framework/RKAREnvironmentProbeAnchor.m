@implementation RKAREnvironmentProbeAnchor

- (_TtC10RealityKit26RKAREnvironmentProbeAnchor)initWithAnchor:(id)a3
{
  return (_TtC10RealityKit26RKAREnvironmentProbeAnchor *)RKAREnvironmentProbeAnchor.init(anchor:)(a3);
}

- (_TtC10RealityKit26RKAREnvironmentProbeAnchor)initWithCoder:(id)a3
{
  return (_TtC10RealityKit26RKAREnvironmentProbeAnchor *)RKAREnvironmentProbeAnchor.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC10RealityKit26RKAREnvironmentProbeAnchor *v5;

  v4 = a3;
  v5 = self;
  RKAREnvironmentProbeAnchor.encode(with:)((NSCoder)v4);

}

- (void)initWithTransform:extent:
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

- (void)initWithName:transform:extent:
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

- (void)initWithTransform:
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

- (void)initWithName:transform:
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

- (void)initWithIdentifier:transform:
{
  uint64_t v0;

  v0 = type metadata accessor for UUID();
  MEMORY[0x1E0C80A78](v0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

- (void)initWithIdentifier:transform:name:
{
  uint64_t v0;

  v0 = type metadata accessor for UUID();
  MEMORY[0x1E0C80A78](v0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

- (void)initWithIdentifier:(uint64_t)a3 transform:name:hiddenFromPublicDelegate:
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for UUID?);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    v7 = type metadata accessor for UUID();
    v8 = 0;
  }
  else
  {
    v7 = type metadata accessor for UUID();
    v8 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, v8, 1);
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

- (void)initWithIdentifier:transform:extent:
{
  uint64_t v0;

  v0 = type metadata accessor for UUID();
  MEMORY[0x1E0C80A78](v0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

- (void).cxx_destruct
{
  outlined destroy of weak __ARViewDelegatePrivate?((uint64_t)self + OBJC_IVAR____TtC10RealityKit26RKAREnvironmentProbeAnchor_delegate);
}

@end
