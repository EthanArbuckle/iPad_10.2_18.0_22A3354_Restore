@implementation ASAuthorizationPublicKeyCredentialPRFAssertionOutput

- (NSData)first
{
  uint64_t *v2;
  unint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = (uint64_t *)((char *)self + OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFAssertionOutput_first);
  swift_beginAccess();
  v4 = *v2;
  v3 = v2[1];
  sub_20E52F7E4(v4, v3);
  v5 = (void *)sub_20E556DA4();
  sub_20E52F4EC(v4, v3);
  return (NSData *)v5;
}

- (void)setFirst:(id)a3
{
  id v4;
  ASAuthorizationPublicKeyCredentialPRFAssertionOutput *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  unint64_t v11;

  v4 = a3;
  v5 = self;
  v6 = sub_20E556DBC();
  v8 = v7;

  v9 = (uint64_t *)((char *)v5 + OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFAssertionOutput_first);
  swift_beginAccess();
  v10 = *v9;
  v11 = v9[1];
  *v9 = v6;
  v9[1] = v8;
  sub_20E52F4EC(v10, v11);

}

- (NSData)second
{
  return (NSData *)sub_20E53AE80((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFAssertionOutput_second);
}

- (void)setSecond:(id)a3
{
  sub_20E53AF88((char *)self, (uint64_t)a2, a3, &OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFAssertionOutput_second);
}

- (ASAuthorizationPublicKeyCredentialPRFAssertionOutput)init
{
  ASAuthorizationPublicKeyCredentialPRFAssertionOutput *result;

  result = (ASAuthorizationPublicKeyCredentialPRFAssertionOutput *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_20E53B558((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFAssertionOutput_first, (void (*)(_QWORD, _QWORD))sub_20E52F4EC, &OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFAssertionOutput_second);
}

@end
