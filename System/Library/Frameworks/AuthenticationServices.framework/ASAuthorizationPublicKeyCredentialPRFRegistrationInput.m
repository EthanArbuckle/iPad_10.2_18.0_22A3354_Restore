@implementation ASAuthorizationPublicKeyCredentialPRFRegistrationInput

+ (ASAuthorizationPublicKeyCredentialPRFRegistrationInput)checkForSupport
{
  return (ASAuthorizationPublicKeyCredentialPRFRegistrationInput *)objc_msgSend(objc_allocWithZone((Class)ASAuthorizationPublicKeyCredentialPRFRegistrationInput), sel_initWithInputValues_, 0);
}

- (BOOL)shouldCheckForSupport
{
  return *((_BYTE *)&self->super.isa
         + OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFRegistrationInput_shouldCheckForSupport);
}

- (ASAuthorizationPublicKeyCredentialPRFAssertionInputValues)inputValues
{
  return (ASAuthorizationPublicKeyCredentialPRFAssertionInputValues *)*(id *)((char *)&self->super.isa + OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFRegistrationInput_inputValues);
}

- (ASAuthorizationPublicKeyCredentialPRFRegistrationInput)initWithInputValues:(id)a3
{
  id v3;
  objc_super v5;

  *((_BYTE *)&self->super.isa + OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFRegistrationInput_shouldCheckForSupport) = 1;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFRegistrationInput_inputValues) = (Class)a3;
  v5.receiver = self;
  v5.super_class = (Class)ASAuthorizationPublicKeyCredentialPRFRegistrationInput;
  v3 = a3;
  return -[ASAuthorizationPublicKeyCredentialPRFRegistrationInput init](&v5, sel_init);
}

- (ASAuthorizationPublicKeyCredentialPRFRegistrationInput)init
{
  ASAuthorizationPublicKeyCredentialPRFRegistrationInput *result;

  result = (ASAuthorizationPublicKeyCredentialPRFRegistrationInput *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFRegistrationInput_inputValues));
}

@end
