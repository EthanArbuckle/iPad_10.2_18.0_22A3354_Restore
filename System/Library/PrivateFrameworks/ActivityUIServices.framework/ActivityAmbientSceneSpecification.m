@implementation ActivityAmbientSceneSpecification

- (NSString)uiSceneSessionRole
{
  return (NSString *)sub_22D814CE4(self, (uint64_t)a2, &qword_2540C61A8, (id *)&qword_2540C6198);
}

- (NSArray)defaultExtensions
{
  uint64_t v2;
  void *v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255D96F90);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_22D84E0F0;
  *(_QWORD *)(v2 + 32) = type metadata accessor for ActivityAmbientSceneExtension();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255D96F98);
  v3 = (void *)sub_22D84B634();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (_TtC18ActivityUIServices33ActivityAmbientSceneSpecification)init
{
  return (_TtC18ActivityUIServices33ActivityAmbientSceneSpecification *)sub_22D814D5C(self, (uint64_t)a2, type metadata accessor for ActivityAmbientSceneSpecification);
}

@end
