@implementation XPCMobileDocumentReaderIdentityKeyResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC7CoreIDV42XPCMobileDocumentReaderIdentityKeyResponse)initWithCoder:(id)a3
{
  return (_TtC7CoreIDV42XPCMobileDocumentReaderIdentityKeyResponse *)sub_20A1A5160((uint64_t)self, (uint64_t)a2, a3, (void (*)(uint64_t))sub_20A1A7E14, (uint64_t)&type metadata for MobileDocumentReaderIdentityKeyResponse, (uint64_t (*)(uint64_t))type metadata accessor for XPCMobileDocumentReaderIdentityKeyResponse, &OBJC_IVAR____TtC7CoreIDV42XPCMobileDocumentReaderIdentityKeyResponse_value);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC7CoreIDV42XPCMobileDocumentReaderIdentityKeyResponse *v5;

  v4 = a3;
  v5 = self;
  sub_20A1A3A90(v4, (uint64_t)&OBJC_IVAR____TtC7CoreIDV42XPCMobileDocumentReaderIdentityKeyResponse_value, (void (*)(void))sub_20A1A7E5C);

}

- (_TtC7CoreIDV42XPCMobileDocumentReaderIdentityKeyResponse)init
{
  _TtC7CoreIDV42XPCMobileDocumentReaderIdentityKeyResponse *result;

  result = (_TtC7CoreIDV42XPCMobileDocumentReaderIdentityKeyResponse *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
