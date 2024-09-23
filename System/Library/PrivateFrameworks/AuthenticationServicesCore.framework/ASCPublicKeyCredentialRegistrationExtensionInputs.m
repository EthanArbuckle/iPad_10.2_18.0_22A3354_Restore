@implementation ASCPublicKeyCredentialRegistrationExtensionInputs

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC26AuthenticationServicesCore49ASCPublicKeyCredentialRegistrationExtensionInputs *v5;

  v4 = a3;
  v5 = self;
  sub_20E6672B8(v4);

}

- (_TtC26AuthenticationServicesCore49ASCPublicKeyCredentialRegistrationExtensionInputs)initWithCoder:(id)a3
{
  return (_TtC26AuthenticationServicesCore49ASCPublicKeyCredentialRegistrationExtensionInputs *)ASCPublicKeyCredentialRegistrationExtensionInputs.init(coder:)(a3);
}

- (_TtC26AuthenticationServicesCore49ASCPublicKeyCredentialRegistrationExtensionInputs)init
{
  char *v2;
  objc_super v4;

  *((_BYTE *)&self->super.isa
  + OBJC_IVAR____TtC26AuthenticationServicesCore49ASCPublicKeyCredentialRegistrationExtensionInputs_largeBlob) = 2;
  v2 = (char *)self
     + OBJC_IVAR____TtC26AuthenticationServicesCore49ASCPublicKeyCredentialRegistrationExtensionInputs_prf;
  *(_OWORD *)v2 = 0u;
  *((_OWORD *)v2 + 1) = 0u;
  *((_QWORD *)v2 + 4) = 0;
  *((_QWORD *)v2 + 5) = 1;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ASCPublicKeyCredentialRegistrationExtensionInputs();
  return -[ASCPublicKeyCredentialRegistrationExtensionInputs init](&v4, sel_init);
}

- (id)copyWithZone:(void *)a3
{
  _TtC26AuthenticationServicesCore49ASCPublicKeyCredentialRegistrationExtensionInputs *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  sub_20E667BD8(v6);

  __swift_project_boxed_opaque_existential_1Tm(v6, v6[3]);
  v4 = (void *)sub_20E6EA8D4();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v6);
  return v4;
}

- (BOOL)hasAtLeastOneExtension
{
  _BYTE *v3;
  char *v4;

  v3 = (char *)self
     + OBJC_IVAR____TtC26AuthenticationServicesCore49ASCPublicKeyCredentialRegistrationExtensionInputs_largeBlob;
  swift_beginAccess();
  if (*v3 != 2)
    return 1;
  v4 = (char *)self
     + OBJC_IVAR____TtC26AuthenticationServicesCore49ASCPublicKeyCredentialRegistrationExtensionInputs_prf;
  swift_beginAccess();
  return *((_QWORD *)v4 + 5) != 1;
}

- (int64_t)caBLEAuthenticatorMinimumRequirement
{
  unsigned __int8 *v3;
  int64_t v4;
  char *v5;

  v3 = (unsigned __int8 *)self
     + OBJC_IVAR____TtC26AuthenticationServicesCore49ASCPublicKeyCredentialRegistrationExtensionInputs_largeBlob;
  swift_beginAccess();
  v4 = *v3 != 2;
  v5 = (char *)self
     + OBJC_IVAR____TtC26AuthenticationServicesCore49ASCPublicKeyCredentialRegistrationExtensionInputs_prf;
  swift_beginAccess();
  if (*((_QWORD *)v5 + 5) == 1)
    return v4;
  else
    return 2;
}

- (id)cborForWebKit
{
  _TtC26AuthenticationServicesCore49ASCPublicKeyCredentialRegistrationExtensionInputs *v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;

  v2 = self;
  v3 = sub_20E667FC8();
  v5 = v4;

  if (v5 >> 60 == 15)
  {
    v6 = 0;
  }
  else
  {
    v6 = (void *)sub_20E6E9C68();
    sub_20E66AA28(v3, v5);
  }
  return v6;
}

- (void).cxx_destruct
{
  sub_20E66A9E8(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC26AuthenticationServicesCore49ASCPublicKeyCredentialRegistrationExtensionInputs_prf), *(_QWORD *)&self->largeBlob[OBJC_IVAR____TtC26AuthenticationServicesCore49ASCPublicKeyCredentialRegistrationExtensionInputs_prf], *(_QWORD *)&self->prf[OBJC_IVAR____TtC26AuthenticationServicesCore49ASCPublicKeyCredentialRegistrationExtensionInputs_prf+ 7], *(_QWORD *)&self->prf[OBJC_IVAR____TtC26AuthenticationServicesCore49ASCPublicKeyCredentialRegistrationExtensionInputs_prf+ 15], *(_QWORD *)&self->prf[OBJC_IVAR____TtC26AuthenticationServicesCore49ASCPublicKeyCredentialRegistrationExtensionInputs_prf+ 23], *(_QWORD *)&self->prf[OBJC_IVAR____TtC26AuthenticationServicesCore49ASCPublicKeyCredentialRegistrationExtensionInputs_prf+ 31]);
}

@end
