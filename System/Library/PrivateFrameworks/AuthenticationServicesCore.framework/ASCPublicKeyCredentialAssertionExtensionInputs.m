@implementation ASCPublicKeyCredentialAssertionExtensionInputs

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC26AuthenticationServicesCore46ASCPublicKeyCredentialAssertionExtensionInputs *v5;

  v4 = a3;
  v5 = self;
  sub_20E68CFFC(v4);

}

- (_TtC26AuthenticationServicesCore46ASCPublicKeyCredentialAssertionExtensionInputs)initWithCoder:(id)a3
{
  return (_TtC26AuthenticationServicesCore46ASCPublicKeyCredentialAssertionExtensionInputs *)ASCPublicKeyCredentialAssertionExtensionInputs.init(coder:)(a3);
}

- (_TtC26AuthenticationServicesCore46ASCPublicKeyCredentialAssertionExtensionInputs)init
{
  char *v2;
  objc_super v4;

  *(_OWORD *)((char *)&self->super.isa
            + OBJC_IVAR____TtC26AuthenticationServicesCore46ASCPublicKeyCredentialAssertionExtensionInputs_largeBlob) = xmmword_20E6EF320;
  v2 = (char *)self + OBJC_IVAR____TtC26AuthenticationServicesCore46ASCPublicKeyCredentialAssertionExtensionInputs_prf;
  *(_OWORD *)v2 = 0u;
  *((_OWORD *)v2 + 1) = 0u;
  *((_QWORD *)v2 + 4) = 1;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ASCPublicKeyCredentialAssertionExtensionInputs();
  return -[ASCPublicKeyCredentialAssertionExtensionInputs init](&v4, sel_init);
}

- (BOOL)hasAtLeastOneExtension
{
  char *v3;
  char *v4;

  v3 = (char *)self
     + OBJC_IVAR____TtC26AuthenticationServicesCore46ASCPublicKeyCredentialAssertionExtensionInputs_largeBlob;
  swift_beginAccess();
  if (*((_QWORD *)v3 + 1) >> 60 != 11)
    return 1;
  v4 = (char *)self + OBJC_IVAR____TtC26AuthenticationServicesCore46ASCPublicKeyCredentialAssertionExtensionInputs_prf;
  swift_beginAccess();
  return *((_QWORD *)v4 + 4) != 1;
}

- (int64_t)caBLEAuthenticatorMinimumRequirement
{
  char *v3;
  int64_t v4;
  char *v5;

  v3 = (char *)self
     + OBJC_IVAR____TtC26AuthenticationServicesCore46ASCPublicKeyCredentialAssertionExtensionInputs_largeBlob;
  swift_beginAccess();
  v4 = *((_QWORD *)v3 + 1) >> 60 != 11;
  v5 = (char *)self + OBJC_IVAR____TtC26AuthenticationServicesCore46ASCPublicKeyCredentialAssertionExtensionInputs_prf;
  swift_beginAccess();
  if (*((_QWORD *)v5 + 4) == 1)
    return v4;
  else
    return 2;
}

- (id)cborForWebKit
{
  _TtC26AuthenticationServicesCore46ASCPublicKeyCredentialAssertionExtensionInputs *v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;

  v2 = self;
  v3 = sub_20E68DAF0();
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
  sub_20E690834(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC26AuthenticationServicesCore46ASCPublicKeyCredentialAssertionExtensionInputs_largeBlob), *(_QWORD *)&self->largeBlob[OBJC_IVAR____TtC26AuthenticationServicesCore46ASCPublicKeyCredentialAssertionExtensionInputs_largeBlob]);
  sub_20E690848(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC26AuthenticationServicesCore46ASCPublicKeyCredentialAssertionExtensionInputs_prf), *(_QWORD *)&self->largeBlob[OBJC_IVAR____TtC26AuthenticationServicesCore46ASCPublicKeyCredentialAssertionExtensionInputs_prf], *(_QWORD *)&self->largeBlob[OBJC_IVAR____TtC26AuthenticationServicesCore46ASCPublicKeyCredentialAssertionExtensionInputs_prf+ 8], *(_QWORD *)&self->prf[OBJC_IVAR____TtC26AuthenticationServicesCore46ASCPublicKeyCredentialAssertionExtensionInputs_prf], *(_QWORD *)&self->prf[OBJC_IVAR____TtC26AuthenticationServicesCore46ASCPublicKeyCredentialAssertionExtensionInputs_prf+ 8], (void (*)(void))sub_20E692464);
}

@end
