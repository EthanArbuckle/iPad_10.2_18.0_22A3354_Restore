@implementation NDAnalyticsUploadFrameworkAssembly

- (NDAnalyticsUploadFrameworkAssembly)init
{
  objc_class *ObjectType;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = OBJC_IVAR___NDAnalyticsUploadFrameworkAssembly_assemblies;
  __swift_instantiateConcreteTypeFromMangledName(&qword_253DAA048);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_214691460;
  v6 = type metadata accessor for TelemetryAssembly();
  v7 = swift_allocObject();
  *(_QWORD *)(v5 + 56) = v6;
  *(_QWORD *)(v5 + 64) = sub_21467F438();
  *(_QWORD *)(v5 + 32) = v7;
  *(Class *)((char *)&self->super.isa + v4) = (Class)v5;
  v9.receiver = self;
  v9.super_class = ObjectType;
  return -[NDAnalyticsUploadFrameworkAssembly init](&v9, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
