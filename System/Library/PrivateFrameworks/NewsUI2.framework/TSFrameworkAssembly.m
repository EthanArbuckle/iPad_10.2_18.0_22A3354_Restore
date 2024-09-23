@implementation TSFrameworkAssembly

- (TSFrameworkAssembly)initWithNewsAppConfigurationManager:(id)a3
{
  objc_class *ObjectType;
  TSFrameworkAssembly *v6;
  TSFrameworkAssembly *v7;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType();
  objc_allocWithZone((Class)type metadata accessor for FeatureAvailabilityProvider());
  swift_unknownObjectRetain_n();
  v6 = self;
  *(Class *)((char *)&v6->super.isa + OBJC_IVAR___TSFrameworkAssembly_featureAvailabilityProvider) = (Class)FeatureAvailabilityProvider.init(appConfigurationManager:)(a3);

  v9.receiver = v6;
  v9.super_class = ObjectType;
  v7 = -[TSFrameworkAssembly init](&v9, sel_init);
  swift_unknownObjectRelease();
  return v7;
}

- (TSFrameworkAssembly)init
{
  TSFrameworkAssembly *result;

  result = (TSFrameworkAssembly *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
