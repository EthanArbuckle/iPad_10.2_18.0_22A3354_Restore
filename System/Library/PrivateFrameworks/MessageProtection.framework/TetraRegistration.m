@implementation TetraRegistration

- (NSData)serializedECDHPublicKey
{
  _TtC17MessageProtection17TetraRegistration *v2;
  NSData *result;
  unint64_t v4;
  NSData *v5;
  unint64_t v6;
  Class isa;

  v2 = self;
  result = (NSData *)P256.KeyAgreement.PublicKey.compactRepresentation.getter();
  if (v4 >> 60 == 15)
  {
    __break(1u);
  }
  else
  {
    v5 = result;
    v6 = v4;
    isa = Data._bridgeToObjectiveC()().super.isa;
    outlined consume of Data?((uint64_t)v5, v6);

    return (NSData *)isa;
  }
  return result;
}

- (_TtC17MessageProtection22Kyber1024ObjCPublicKey)kyberPublicKey
{
  return (_TtC17MessageProtection22Kyber1024ObjCPublicKey *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC17MessageProtection17TetraRegistration_kyberPublicKey);
}

- (NSData)signature
{
  uint64_t v2;
  unint64_t v3;
  Class isa;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC17MessageProtection17TetraRegistration_signature);
  v3 = *(_QWORD *)&self->_anon_0[OBJC_IVAR____TtC17MessageProtection17TetraRegistration_signature];
  outlined copy of Data._Representation(v2, v3);
  isa = Data._bridgeToObjectiveC()().super.isa;
  outlined consume of Data._Representation(v2, v3);
  return (NSData *)isa;
}

- (double)timestamp
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC17MessageProtection17TetraRegistration_timestamp);
}

- (unsigned)tetraVersion
{
  return *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR____TtC17MessageProtection17TetraRegistration_tetraVersion);
}

- (TetraPublicSigningKeyWrapper)signingPublicKey
{
  return (TetraPublicSigningKeyWrapper *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                 + OBJC_IVAR____TtC17MessageProtection17TetraRegistration_signingPublicKey));
}

- (_TtC17MessageProtection17TetraRegistration)initWithTetraRegistrationData:(id)a3 ecdhPublicKey:(id)a4 version:(unsigned int)a5 timestamp:(double)a6 signedBy:(id)a7 isEncrypting:(BOOL)a8 error:(id *)a9
{
  return (_TtC17MessageProtection17TetraRegistration *)TetraRegistration.init(tetraRegistrationData:ecdhPublicKey:version:timestamp:signedBy:isEncrypting:)(a3, a4, a5, a7, a8, a6);
}

- (_TtC17MessageProtection17TetraRegistration)initWithKyberPublicKey:(id)a3 ecdhPublicKey:(id)a4 timestamp:(double)a5 version:(unsigned int)a6 signedBy:(id)a7
{
  uint64_t v8;
  id v11;
  id v12;
  id v13;
  _TtC17MessageProtection17TetraRegistration *v14;

  v8 = *(_QWORD *)&a6;
  v11 = a3;
  v12 = a4;
  v13 = a7;
  v14 = (_TtC17MessageProtection17TetraRegistration *)specialized TetraRegistration.init(kyberPublicKey:ecdhPublicKey:timestamp:version:signedBy:)(v11, v12, v8, v13, a5);

  return v14;
}

- (NSData)registrationData
{
  _TtC17MessageProtection17TetraRegistration *v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  Class isa;

  v2 = self;
  v3 = TetraRegistration.registrationData.getter();
  v5 = v4;

  isa = Data._bridgeToObjectiveC()().super.isa;
  outlined consume of Data._Representation(v3, v5);
  return (NSData *)isa;
}

- (_TtC17MessageProtection17TetraRegistration)init
{
  _TtC17MessageProtection17TetraRegistration *result;

  result = (_TtC17MessageProtection17TetraRegistration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC17MessageProtection17TetraRegistration_ecdhPublicKey;
  v4 = type metadata accessor for P256.KeyAgreement.PublicKey();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  outlined consume of Data._Representation(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC17MessageProtection17TetraRegistration_signature), *(_QWORD *)&self->_anon_0[OBJC_IVAR____TtC17MessageProtection17TetraRegistration_signature]);
}

@end
