@implementation LocalizedStringTransformer

+ (NSArray)allowedTopLevelClasses
{
  uint64_t v2;
  void *v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254247DC0);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_233623D60;
  *(_QWORD *)(v2 + 32) = type metadata accessor for LocalizedString();
  __swift_instantiateConcreteTypeFromMangledName(qword_254247FC0);
  v3 = (void *)sub_23361E3D8();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (_TtC10FinanceKit26LocalizedStringTransformer)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[LocalizedStringTransformer init](&v3, sel_init);
}

@end
