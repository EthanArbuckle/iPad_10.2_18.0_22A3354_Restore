@implementation ASAuthorizationPublicKeyCredentialPRFRegistrationOutput

- (BOOL)isSupported
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFRegistrationOutput_isSupported;
  swift_beginAccess();
  return *v2;
}

- (void)setIsSupported:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFRegistrationOutput_isSupported;
  swift_beginAccess();
  *v4 = a3;
}

- (NSData)first
{
  return (NSData *)sub_20E53AE80((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFRegistrationOutput_first);
}

- (void)setFirst:(id)a3
{
  sub_20E53AF88((char *)self, (uint64_t)a2, a3, &OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFRegistrationOutput_first);
}

- (NSData)second
{
  return (NSData *)sub_20E53AE80((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFRegistrationOutput_second);
}

- (void)setSecond:(id)a3
{
  sub_20E53AF88((char *)self, (uint64_t)a2, a3, &OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFRegistrationOutput_second);
}

- (ASAuthorizationPublicKeyCredentialPRFRegistrationOutput)init
{
  ASAuthorizationPublicKeyCredentialPRFRegistrationOutput *result;

  result = (ASAuthorizationPublicKeyCredentialPRFRegistrationOutput *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_20E53B558((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFRegistrationOutput_first, (void (*)(_QWORD, _QWORD))sub_20E52F530, &OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFRegistrationOutput_second);
}

@end
