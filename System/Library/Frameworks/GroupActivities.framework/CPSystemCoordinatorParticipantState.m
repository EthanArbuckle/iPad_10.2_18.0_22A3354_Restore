@implementation CPSystemCoordinatorParticipantState

- (BOOL)isEqual:(id)a3
{
  return @objc SystemCoordinatorState.isEqual(_:)(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))SystemCoordinatorState.ParticipantState.isEqual(_:));
}

- (int64_t)hash
{
  CPSystemCoordinatorParticipantState *v2;
  Swift::Int v3;

  v2 = self;
  v3 = SystemCoordinatorState.ParticipantState.hash.getter();

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  CPSystemCoordinatorParticipantState *v5;

  v4 = a3;
  v5 = self;
  SystemCoordinatorState.ParticipantState.encode(with:)((NSCoder)v4);

}

- (CPSystemCoordinatorParticipantState)initWithCoder:(id)a3
{
  id v3;
  CPSystemCoordinatorParticipantState *v4;

  v3 = a3;
  v4 = (CPSystemCoordinatorParticipantState *)specialized SystemCoordinatorState.ParticipantState.init(coder:)(v3);

  return v4;
}

- (NSString)description
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1A0F13B30;
  *(_QWORD *)(v3 + 32) = swift_getKeyPath();
  *(_QWORD *)(v3 + 40) = swift_getKeyPath();
  *(_QWORD *)(v3 + 48) = swift_getKeyPath();
  *(_QWORD *)(v3 + 56) = swift_getKeyPath();
  specialized Array._endMutation()();
  v4 = specialized String.init<A>(describing:in:)(v3, self);
  v5 = (void *)MEMORY[0x1A1B048B4](v4);
  swift_bridgeObjectRelease();
  return (NSString *)v5;
}

- (CPSystemCoordinatorParticipantState)init
{
  CPSystemCoordinatorParticipantState *result;

  result = (CPSystemCoordinatorParticipantState *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

}

@end
