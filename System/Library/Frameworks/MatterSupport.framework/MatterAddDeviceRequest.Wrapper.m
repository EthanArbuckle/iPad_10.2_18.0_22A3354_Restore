@implementation MatterAddDeviceRequest.Wrapper

- (MTSDeviceSetupTopology)topology
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[3];

  sub_234507DD0(0, &qword_25615ECD8);
  v4 = *(_QWORD *)&self->wrappedRequest[OBJC_IVAR____TtCV13MatterSupport22MatterAddDeviceRequestP33_1A83A92E88F6D049FA318E551745945D7Wrapper_wrappedRequest];
  v3 = *(_QWORD *)&self->wrappedRequest[OBJC_IVAR____TtCV13MatterSupport22MatterAddDeviceRequestP33_1A83A92E88F6D049FA318E551745945D7Wrapper_wrappedRequest
                                      + 8];
  v5 = *(_QWORD *)&self->wrappedRequest[OBJC_IVAR____TtCV13MatterSupport22MatterAddDeviceRequestP33_1A83A92E88F6D049FA318E551745945D7Wrapper_wrappedRequest
                                      + 16];
  v7[0] = v4;
  v7[1] = v3;
  v7[2] = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return (MTSDeviceSetupTopology *)sub_23450A2F8((uint64_t)v7);
}

- (NSString)ecosystemName
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_23452BC14();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (BOOL)shouldScanNetworks
{
  char *v2;

  v2 = (char *)self
     + OBJC_IVAR____TtCV13MatterSupport22MatterAddDeviceRequestP33_1A83A92E88F6D049FA318E551745945D7Wrapper_wrappedRequest;
  return v2[*(int *)(type metadata accessor for MatterAddDeviceRequest(0) + 32)];
}

- (NSData)serializedAsData
{
  _TtCV13MatterSupport22MatterAddDeviceRequestP33_1A83A92E88F6D049FA318E551745945D7Wrapper *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;

  sub_23452BAD0();
  swift_allocObject();
  v3 = self;
  sub_23452BAC4();
  type metadata accessor for MatterAddDeviceRequest(0);
  sub_234506620(&qword_25615E9D0, type metadata accessor for MatterAddDeviceRequest, (uint64_t)&protocol conformance descriptor for MatterAddDeviceRequest);
  v4 = sub_23452BAB8();
  v6 = v5;

  swift_release();
  v7 = (void *)sub_23452BAF4();
  sub_2345011D4(v4, v6);
  return (NSData *)v7;
}

- (MTRSetupPayload)setupPayload
{
  return (MTRSetupPayload *)objc_retainAutoreleaseReturnValue(*(id *)&self->wrappedRequest[OBJC_IVAR____TtCV13MatterSupport22MatterAddDeviceRequestP33_1A83A92E88F6D049FA318E551745945D7Wrapper_wrappedRequest
                                                                                         + 24]);
}

- (BOOL)shouldShowDeviceWithUUID:(id)a3 vendorID:(id)a4 productID:(id)a5 serialNumber:(id)a6 rootPublicKey:(id)a7 nodeID:(id)a8
{
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  _TtCV13MatterSupport22MatterAddDeviceRequestP33_1A83A92E88F6D049FA318E551745945D7Wrapper *v25;
  id v26;
  unint64_t v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v31;

  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615ECC8);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v31 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_23452BB24();
    v18 = sub_23452BB30();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v17, 0, 1, v18);
  }
  else
  {
    v19 = sub_23452BB30();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v17, 1, 1, v19);
  }
  if (a6)
  {
    v20 = sub_23452BC20();
    a6 = v21;
  }
  else
  {
    v20 = 0;
  }
  v22 = a4;
  v23 = a5;
  v24 = a8;
  v25 = self;
  if (a7)
  {
    v26 = a7;
    a7 = (id)sub_23452BB00();
    v28 = v27;

  }
  else
  {
    v28 = 0xF000000000000000;
  }
  v29 = sub_234505B74((uint64_t)v17, (uint64_t)v22, (uint64_t)v23, v20, (uint64_t)a6, (uint64_t)a7, v28, (uint64_t)v24);
  sub_234506660((uint64_t)a7, v28);

  swift_bridgeObjectRelease();
  sub_23450822C((uint64_t)v17, &qword_25615ECC8);
  return v29;
}

- (NSString)description
{
  return (NSString *)sub_234505F94((uint64_t)self, (uint64_t)a2, (void (*)(char *, uint64_t))MEMORY[0x24BEE09F0]);
}

- (NSString)debugDescription
{
  return (NSString *)sub_234505F94((uint64_t)self, (uint64_t)a2, MEMORY[0x24BEE0A10]);
}

- (int64_t)hash
{
  _TtCV13MatterSupport22MatterAddDeviceRequestP33_1A83A92E88F6D049FA318E551745945D7Wrapper *v3;
  int64_t v4;

  sub_23452BF8C();
  v3 = self;
  MatterAddDeviceRequest.hash(into:)();
  v4 = sub_23452BFC8();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  _TtCV13MatterSupport22MatterAddDeviceRequestP33_1A83A92E88F6D049FA318E551745945D7Wrapper *v4;
  _TtCV13MatterSupport22MatterAddDeviceRequestP33_1A83A92E88F6D049FA318E551745945D7Wrapper *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_23452BD64();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = sub_234506098((uint64_t)v8);

  sub_23450822C((uint64_t)v8, &qword_25615ECD0);
  return v6 & 1;
}

- (_TtCV13MatterSupport22MatterAddDeviceRequestP33_1A83A92E88F6D049FA318E551745945D7Wrapper)init
{
  _TtCV13MatterSupport22MatterAddDeviceRequestP33_1A83A92E88F6D049FA318E551745945D7Wrapper *result;

  result = (_TtCV13MatterSupport22MatterAddDeviceRequestP33_1A83A92E88F6D049FA318E551745945D7Wrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_234507C68((uint64_t)self+ OBJC_IVAR____TtCV13MatterSupport22MatterAddDeviceRequestP33_1A83A92E88F6D049FA318E551745945D7Wrapper_wrappedRequest, type metadata accessor for MatterAddDeviceRequest);
}

@end
