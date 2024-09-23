@implementation UNNotificationContentValueTransformer

+ (NSArray)allowedTopLevelClasses
{
  uint64_t v2;
  void *v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254247DC0);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_233623D60;
  *(_QWORD *)(v2 + 32) = sub_2335E0164();
  __swift_instantiateConcreteTypeFromMangledName(qword_254247FC0);
  v3 = (void *)sub_23361E3D8();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (UNNotificationContentValueTransformer)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[UNNotificationContentValueTransformer init](&v3, sel_init);
}

@end
