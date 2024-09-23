@implementation AAPrivacyValidation

+ (AAPrivacyValidation)default
{
  if (qword_1ED1CC070 != -1)
    swift_once();
  return (AAPrivacyValidation *)(id)qword_1ED1CC0A0;
}

- (BOOL)enabled
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___AAPrivacyValidation_enabled);
}

- (NSSet)denylistDescriptors
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A5F64370();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
}

- (id)withEnabled:(BOOL)a3
{
  objc_class *ObjectType;
  uint64_t v6;
  _BYTE *v7;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType();
  v6 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___AAPrivacyValidation_denylistDescriptors);
  v7 = objc_allocWithZone(ObjectType);
  v7[OBJC_IVAR___AAPrivacyValidation_enabled] = a3;
  *(_QWORD *)&v7[OBJC_IVAR___AAPrivacyValidation_denylistDescriptors] = v6;
  v9.receiver = v7;
  v9.super_class = ObjectType;
  swift_bridgeObjectRetain();
  return -[AAPrivacyValidation init](&v9, sel_init);
}

- (id)withDenylistDescriptors:(id)a3
{
  objc_class *ObjectType;
  uint64_t v5;
  _BYTE *v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  v5 = sub_1A5F6437C();
  LOBYTE(self) = *((_BYTE *)&self->super.isa + OBJC_IVAR___AAPrivacyValidation_enabled);
  v6 = objc_allocWithZone(ObjectType);
  v6[OBJC_IVAR___AAPrivacyValidation_enabled] = (_BYTE)self;
  *(_QWORD *)&v6[OBJC_IVAR___AAPrivacyValidation_denylistDescriptors] = v5;
  v8.receiver = v6;
  v8.super_class = ObjectType;
  return -[AAPrivacyValidation init](&v8, sel_init);
}

- (AAPrivacyValidation)init
{
  AAPrivacyValidation *result;

  result = (AAPrivacyValidation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
