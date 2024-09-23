@implementation UtilityServiceAddress

- (NSString)addressLine1
{
  return (NSString *)sub_23EBABEB4();
}

- (NSString)addressLine2
{
  return (NSString *)sub_23EBB78E4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC19HomeUtilityServices21UtilityServiceAddress_addressLine2);
}

- (NSString)addressLine3
{
  return (NSString *)sub_23EBB78E4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC19HomeUtilityServices21UtilityServiceAddress_addressLine3);
}

- (NSString)city
{
  return (NSString *)sub_23EBABEB4();
}

- (NSString)state
{
  return (NSString *)sub_23EBABEB4();
}

- (NSString)postalCode
{
  return (NSString *)sub_23EBABEB4();
}

- (NSString)country
{
  return (NSString *)sub_23EBABEB4();
}

- (_TtC19HomeUtilityServices21UtilityServiceAddress)initWithAddressLine1:(id)a3 addressLine2:(id)a4 addressLine3:(id)a5 city:(id)a6 state:(id)a7 postalCode:(id)a8 country:(id)a9
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  objc_super v40;

  v12 = sub_23EC2E780();
  v38 = v13;
  v39 = v12;
  if (!a4)
  {
    v37 = 0;
    v15 = 0;
    if (a5)
      goto LABEL_3;
LABEL_5:
    v16 = 0;
    goto LABEL_6;
  }
  v37 = sub_23EC2E780();
  v15 = v14;
  if (!a5)
    goto LABEL_5;
LABEL_3:
  v16 = sub_23EC2E780();
  a5 = v17;
LABEL_6:
  v18 = sub_23EC2E780();
  v20 = v19;
  v21 = sub_23EC2E780();
  v23 = v22;
  v24 = sub_23EC2E780();
  v26 = v25;
  v27 = sub_23EC2E780();
  v28 = (uint64_t *)((char *)self + OBJC_IVAR____TtC19HomeUtilityServices21UtilityServiceAddress_addressLine1);
  *v28 = v39;
  v28[1] = v38;
  v29 = (uint64_t *)((char *)self + OBJC_IVAR____TtC19HomeUtilityServices21UtilityServiceAddress_addressLine2);
  *v29 = v37;
  v29[1] = v15;
  v30 = (uint64_t *)((char *)self + OBJC_IVAR____TtC19HomeUtilityServices21UtilityServiceAddress_addressLine3);
  *v30 = v16;
  v30[1] = (uint64_t)a5;
  v31 = (uint64_t *)((char *)self + OBJC_IVAR____TtC19HomeUtilityServices21UtilityServiceAddress_city);
  *v31 = v18;
  v31[1] = v20;
  v32 = (uint64_t *)((char *)self + OBJC_IVAR____TtC19HomeUtilityServices21UtilityServiceAddress_state);
  *v32 = v21;
  v32[1] = v23;
  v33 = (uint64_t *)((char *)self + OBJC_IVAR____TtC19HomeUtilityServices21UtilityServiceAddress_postalCode);
  *v33 = v24;
  v33[1] = v26;
  v34 = (uint64_t *)((char *)self + OBJC_IVAR____TtC19HomeUtilityServices21UtilityServiceAddress_country);
  *v34 = v27;
  v34[1] = v35;
  v40.receiver = self;
  v40.super_class = (Class)type metadata accessor for UtilityServiceAddress();
  return -[UtilityServiceAddress init](&v40, sel_init);
}

- (_TtC19HomeUtilityServices21UtilityServiceAddress)init
{
  _TtC19HomeUtilityServices21UtilityServiceAddress *result;

  result = (_TtC19HomeUtilityServices21UtilityServiceAddress *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (id)data
{
  _TtC19HomeUtilityServices21UtilityServiceAddress *v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;

  v2 = self;
  v3 = sub_23EBEB7EC();
  v5 = v4;

  if (v5 >> 60 == 15)
  {
    v6 = 0;
  }
  else
  {
    v6 = (void *)sub_23EC2E2B8();
    sub_23EBA4CE0(v3, v5);
  }
  return v6;
}

@end
