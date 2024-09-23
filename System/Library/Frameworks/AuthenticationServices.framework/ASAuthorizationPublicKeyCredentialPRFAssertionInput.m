@implementation ASAuthorizationPublicKeyCredentialPRFAssertionInput

- (ASAuthorizationPublicKeyCredentialPRFAssertionInputValues)inputValues
{
  return (ASAuthorizationPublicKeyCredentialPRFAssertionInputValues *)*(id *)((char *)&self->super.isa + OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFAssertionInput_inputValues);
}

- (NSDictionary)perCredentialInputValues
{
  void *v2;

  if (*(Class *)((char *)&self->super.isa
                + OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFAssertionInput_perCredentialInputValues))
  {
    type metadata accessor for ASAuthorizationPublicKeyCredentialPRFAssertionInputValues((uint64_t)self);
    sub_20E53B6FC();
    swift_bridgeObjectRetain();
    v2 = (void *)sub_20E557284();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSDictionary *)v2;
}

- (ASAuthorizationPublicKeyCredentialPRFAssertionInput)initWithInputValues:(id)a3 perCredentialInputValues:(id)a4
{
  objc_class *v6;
  id v7;
  objc_super v9;

  if (a4)
  {
    type metadata accessor for ASAuthorizationPublicKeyCredentialPRFAssertionInputValues((uint64_t)self);
    sub_20E53B6FC();
    v6 = (objc_class *)sub_20E557290();
  }
  else
  {
    v6 = 0;
  }
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFAssertionInput_inputValues) = (Class)a3;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFAssertionInput_perCredentialInputValues) = v6;
  v9.receiver = self;
  v9.super_class = (Class)ASAuthorizationPublicKeyCredentialPRFAssertionInput;
  v7 = a3;
  return -[ASAuthorizationPublicKeyCredentialPRFAssertionInput init](&v9, sel_init);
}

- (ASAuthorizationPublicKeyCredentialPRFAssertionInput)init
{
  ASAuthorizationPublicKeyCredentialPRFAssertionInput *result;

  result = (ASAuthorizationPublicKeyCredentialPRFAssertionInput *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFAssertionInput_inputValues));
  swift_bridgeObjectRelease();
}

@end
