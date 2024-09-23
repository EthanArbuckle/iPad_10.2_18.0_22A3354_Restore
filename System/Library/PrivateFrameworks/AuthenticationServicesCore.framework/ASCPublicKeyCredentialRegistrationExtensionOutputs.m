@implementation ASCPublicKeyCredentialRegistrationExtensionOutputs

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC26AuthenticationServicesCore50ASCPublicKeyCredentialRegistrationExtensionOutputs *v5;

  v4 = a3;
  v5 = self;
  sub_20E6927E8(v4);

}

- (_TtC26AuthenticationServicesCore50ASCPublicKeyCredentialRegistrationExtensionOutputs)initWithCoder:(id)a3
{
  return (_TtC26AuthenticationServicesCore50ASCPublicKeyCredentialRegistrationExtensionOutputs *)ASCPublicKeyCredentialRegistrationExtensionOutputs.init(coder:)(a3);
}

- (NSString)description
{
  _TtC26AuthenticationServicesCore50ASCPublicKeyCredentialRegistrationExtensionOutputs *v2;
  void *v3;

  v2 = self;
  sub_20E692BDC();

  v3 = (void *)sub_20E6EA1C0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC26AuthenticationServicesCore50ASCPublicKeyCredentialRegistrationExtensionOutputs)init
{
  char *v3;
  uint64_t v4;
  objc_super v6;

  *((_BYTE *)&self->super.isa
  + OBJC_IVAR____TtC26AuthenticationServicesCore50ASCPublicKeyCredentialRegistrationExtensionOutputs_largeBlob) = 2;
  v3 = (char *)self
     + OBJC_IVAR____TtC26AuthenticationServicesCore50ASCPublicKeyCredentialRegistrationExtensionOutputs_prf;
  v4 = type metadata accessor for ASCPublicKeyCredentialRegistrationExtensionOutputs.PRF(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v3, 1, 1, v4);
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ASCPublicKeyCredentialRegistrationExtensionOutputs(0);
  return -[ASCPublicKeyCredentialRegistrationExtensionOutputs init](&v6, sel_init);
}

- (void).cxx_destruct
{
  sub_20E67BD44((uint64_t)self + OBJC_IVAR____TtC26AuthenticationServicesCore50ASCPublicKeyCredentialRegistrationExtensionOutputs_prf, &qword_254A2EDB0);
}

@end
