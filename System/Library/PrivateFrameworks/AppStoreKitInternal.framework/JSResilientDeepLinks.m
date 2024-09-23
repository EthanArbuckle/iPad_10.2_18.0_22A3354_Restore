@implementation JSResilientDeepLinks

- (BOOL)isResilientDeepLink:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC19AppStoreKitInternal20JSResilientDeepLinks *v7;

  v4 = sub_1D892ADB4();
  v6 = v5;
  v7 = self;
  LOBYTE(v4) = sub_1D86736B4(v4, v6);

  swift_bridgeObjectRelease();
  return v4 & 1;
}

- (BOOL)hasResilientDeepLinks
{
  _TtC19AppStoreKitInternal20JSResilientDeepLinks *v2;
  uint64_t v3;
  char v4;

  v2 = self;
  v3 = swift_retain();
  v4 = _s19AppStoreKitInternal27ResilientDeepLinkControllerO03haseF5Links3bagSbAA14ASKBagContractC_tFZ_0(v3);

  swift_release();
  return v4 & 1;
}

- (void)removeDeepLink:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = sub_1D892ADB4();
  sub_1D8586B30(v3, v4);
  swift_bridgeObjectRelease();
}

- (void)removeAllDeepLinks
{
  _TtC19AppStoreKitInternal20JSResilientDeepLinks *v3;
  _QWORD v4[5];

  sub_1D8929CD4();
  swift_allocObject();
  v3 = self;
  sub_1D8929CBC();
  v4[3] = &type metadata for ResilientDeepLinkController.DeepLinkPreferenceKey;
  v4[4] = sub_1D8586AA8();
  v4[0] = 0xD000000000000014;
  v4[1] = 0x80000001D89836E0;
  sub_1D8929CA4();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
  swift_allocObject();
  sub_1D8929CBC();
  sub_1D8929CB0();

  swift_release();
}

- (_TtC19AppStoreKitInternal20JSResilientDeepLinks)init
{
  _TtC19AppStoreKitInternal20JSResilientDeepLinks *result;

  result = (_TtC19AppStoreKitInternal20JSResilientDeepLinks *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
