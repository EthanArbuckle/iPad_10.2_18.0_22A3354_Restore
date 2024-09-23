@implementation BEProcessCapability

+ (id)mediaPlaybackAndCaptureWithEnvironment:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  objc_super v12;

  v4 = type metadata accessor for ProcessCapability(0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23306DB80((uint64_t)a3 + OBJC_IVAR___BEMediaEnvironment_inner, (uint64_t)v6, type metadata accessor for MediaEnvironment);
  swift_storeEnumTagMultiPayload();
  v7 = (objc_class *)type metadata accessor for BEProcessCapability(0);
  v8 = objc_allocWithZone(v7);
  sub_23306DB80((uint64_t)v6, (uint64_t)v8 + OBJC_IVAR___BEProcessCapability_inner, type metadata accessor for ProcessCapability);
  v12.receiver = v8;
  v12.super_class = v7;
  v9 = a3;
  v10 = objc_msgSendSuper2(&v12, sel_init);
  sub_23306DAA8((uint64_t)v6, type metadata accessor for ProcessCapability);

  return v10;
}

+ (id)background
{
  return sub_23306FE90();
}

+ (id)foreground
{
  return sub_23306FE90();
}

+ (id)suspended
{
  return sub_23306FE90();
}

- (id)requestWithError:(id *)a3
{
  BEProcessCapability *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD v8[5];
  _QWORD v9[2];

  v8[3] = &type metadata for Process;
  v8[4] = &off_2504493D8;
  v3 = self;
  sub_23306EF84(v8, 0, 0, v9);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
  v4 = v9[0];
  v5 = v9[1];
  type metadata accessor for _BEProcessCapabilityGrant();
  v6 = (_QWORD *)swift_allocObject();
  v6[2] = v4;
  v6[3] = v5;

  return v6;
}

- (BEProcessCapability)init
{
  BEProcessCapability *result;

  result = (BEProcessCapability *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_23306DAA8((uint64_t)self + OBJC_IVAR___BEProcessCapability_inner, type metadata accessor for ProcessCapability);
}

@end
