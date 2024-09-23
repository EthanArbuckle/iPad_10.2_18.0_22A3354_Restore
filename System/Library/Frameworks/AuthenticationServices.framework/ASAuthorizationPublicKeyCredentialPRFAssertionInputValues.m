@implementation ASAuthorizationPublicKeyCredentialPRFAssertionInputValues

- (NSData)saltInput1
{
  uint64_t v2;
  unint64_t v3;
  void *v4;

  v2 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFAssertionInputValues_saltInput1);
  v3 = *(_QWORD *)&self->saltInput1[OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFAssertionInputValues_saltInput1];
  sub_20E52F7E4(v2, v3);
  v4 = (void *)sub_20E556DA4();
  sub_20E52F4EC(v2, v3);
  return (NSData *)v4;
}

- (NSData)saltInput2
{
  uint64_t *v2;
  unint64_t v3;
  void *v4;
  uint64_t v5;

  v2 = (uint64_t *)((char *)self + OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFAssertionInputValues_saltInput2);
  v3 = *(_QWORD *)&self->saltInput1[OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFAssertionInputValues_saltInput2];
  if (v3 >> 60 == 15)
  {
    v4 = 0;
  }
  else
  {
    v5 = *v2;
    sub_20E52F7E4(*v2, v3);
    v4 = (void *)sub_20E556DA4();
    sub_20E52F530(v5, v3);
  }
  return (NSData *)v4;
}

- (ASAuthorizationPublicKeyCredentialPRFAssertionInputValues)initWithSaltInput1:(id)a3 saltInput2:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t *v14;
  uint64_t *v15;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v8 = sub_20E556DBC();
  v10 = v9;

  if (v7)
  {
    v11 = sub_20E556DBC();
    v13 = v12;

  }
  else
  {
    v11 = 0;
    v13 = 0xF000000000000000;
  }
  v14 = (uint64_t *)((char *)self + OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFAssertionInputValues_saltInput1);
  *v14 = v8;
  v14[1] = v10;
  v15 = (uint64_t *)((char *)self + OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFAssertionInputValues_saltInput2);
  *v15 = v11;
  v15[1] = v13;
  v17.receiver = self;
  v17.super_class = (Class)ASAuthorizationPublicKeyCredentialPRFAssertionInputValues;
  return -[ASAuthorizationPublicKeyCredentialPRFAssertionInputValues init](&v17, sel_init);
}

- (ASAuthorizationPublicKeyCredentialPRFAssertionInputValues)init
{
  ASAuthorizationPublicKeyCredentialPRFAssertionInputValues *result;

  result = (ASAuthorizationPublicKeyCredentialPRFAssertionInputValues *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_20E53B558((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFAssertionInputValues_saltInput1, (void (*)(_QWORD, _QWORD))sub_20E52F4EC, &OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFAssertionInputValues_saltInput2);
}

@end
