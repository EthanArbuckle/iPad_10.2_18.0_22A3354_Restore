@implementation ASCPublicKeyCredentialAssertionExtensionOutputs

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC26AuthenticationServicesCore47ASCPublicKeyCredentialAssertionExtensionOutputs *v5;

  v4 = a3;
  v5 = self;
  sub_20E6E2840(v4);

}

- (_TtC26AuthenticationServicesCore47ASCPublicKeyCredentialAssertionExtensionOutputs)initWithCoder:(id)a3
{
  return (_TtC26AuthenticationServicesCore47ASCPublicKeyCredentialAssertionExtensionOutputs *)ASCPublicKeyCredentialAssertionExtensionOutputs.init(coder:)(a3);
}

- (_TtC26AuthenticationServicesCore47ASCPublicKeyCredentialAssertionExtensionOutputs)init
{
  char *v3;
  char *v4;
  uint64_t v5;
  objc_super v7;

  v3 = (char *)self
     + OBJC_IVAR____TtC26AuthenticationServicesCore47ASCPublicKeyCredentialAssertionExtensionOutputs_largeBlob;
  *(_QWORD *)v3 = 0;
  *((_QWORD *)v3 + 1) = 0;
  v3[16] = -1;
  v4 = (char *)self + OBJC_IVAR____TtC26AuthenticationServicesCore47ASCPublicKeyCredentialAssertionExtensionOutputs_prf;
  v5 = type metadata accessor for ASCPublicKeyCredentialAssertionExtensionOutputs.PRF(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v4, 1, 1, v5);
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for ASCPublicKeyCredentialAssertionExtensionOutputs(0);
  return -[ASCPublicKeyCredentialAssertionExtensionOutputs init](&v7, sel_init);
}

- (NSString)description
{
  _TtC26AuthenticationServicesCore47ASCPublicKeyCredentialAssertionExtensionOutputs *v2;
  void *v3;

  v2 = self;
  sub_20E6E2D40();

  v3 = (void *)sub_20E6EA1C0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void).cxx_destruct
{
  sub_20E6B74A4(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC26AuthenticationServicesCore47ASCPublicKeyCredentialAssertionExtensionOutputs_largeBlob), *(_QWORD *)&self->largeBlob[OBJC_IVAR____TtC26AuthenticationServicesCore47ASCPublicKeyCredentialAssertionExtensionOutputs_largeBlob], self->largeBlob[OBJC_IVAR____TtC26AuthenticationServicesCore47ASCPublicKeyCredentialAssertionExtensionOutputs_largeBlob+ 8]);
  sub_20E67BD44((uint64_t)self + OBJC_IVAR____TtC26AuthenticationServicesCore47ASCPublicKeyCredentialAssertionExtensionOutputs_prf, &qword_254A2EDB8);
}

@end
