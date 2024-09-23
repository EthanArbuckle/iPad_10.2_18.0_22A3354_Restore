@implementation AAPrivacyValidationProvider

- (AAPrivacyValidation)privacyValidation
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___AAPrivacyValidationProvider_bridgedPrivacyValidation);
  swift_beginAccess();
  return (AAPrivacyValidation *)*v2;
}

- (void)setPrivacyValidation:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___AAPrivacyValidationProvider_bridgedPrivacyValidation);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (AAPrivacyValidationProvider)initWithPrivacyValidation:(id)a3
{
  objc_class *ObjectType;
  id v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AAPrivacyValidationProvider_bridgedPrivacyValidation) = (Class)a3;
  v8.receiver = self;
  v8.super_class = ObjectType;
  v6 = a3;
  return -[AAPrivacyValidationProvider init](&v8, sel_init);
}

- (AAPrivacyValidationProvider)init
{
  AAPrivacyValidationProvider *result;

  result = (AAPrivacyValidationProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
