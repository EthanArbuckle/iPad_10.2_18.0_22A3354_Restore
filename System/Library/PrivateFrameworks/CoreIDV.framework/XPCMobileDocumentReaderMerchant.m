@implementation XPCMobileDocumentReaderMerchant

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC7CoreIDV31XPCMobileDocumentReaderMerchant)initWithCoder:(id)a3
{
  return (_TtC7CoreIDV31XPCMobileDocumentReaderMerchant *)sub_20A1A47E0((uint64_t)self, (uint64_t)a2, a3, (uint64_t (*)(void *))sub_20A1A6738);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC7CoreIDV31XPCMobileDocumentReaderMerchant *v5;

  v4 = a3;
  v5 = self;
  _s7CoreIDV31XPCMobileDocumentReaderMerchantC6encode4withySo7NSCoderC_tF_0(v4);

}

- (_TtC7CoreIDV31XPCMobileDocumentReaderMerchant)init
{
  _TtC7CoreIDV31XPCMobileDocumentReaderMerchant *result;

  result = (_TtC7CoreIDV31XPCMobileDocumentReaderMerchant *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v2;
  unint64_t v3;

  v2 = *(_QWORD *)&self->value[OBJC_IVAR____TtC7CoreIDV31XPCMobileDocumentReaderMerchant_value + 8];
  v3 = *(_QWORD *)&self->value[OBJC_IVAR____TtC7CoreIDV31XPCMobileDocumentReaderMerchant_value + 16];
  swift_bridgeObjectRelease();
  sub_20A127EE4(v2, v3);
  swift_bridgeObjectRelease();
}

@end
