@implementation XPCMobileDocumentReaderConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC7CoreIDV36XPCMobileDocumentReaderConfiguration)initWithCoder:(id)a3
{
  return (_TtC7CoreIDV36XPCMobileDocumentReaderConfiguration *)sub_20A1A47E0((uint64_t)self, (uint64_t)a2, a3, (uint64_t (*)(void *))sub_20A1A62D8);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC7CoreIDV36XPCMobileDocumentReaderConfiguration *v5;

  v4 = a3;
  v5 = self;
  _s7CoreIDV36XPCMobileDocumentReaderConfigurationC6encode4withySo7NSCoderC_tF_0(v4);

}

- (_TtC7CoreIDV36XPCMobileDocumentReaderConfiguration)init
{
  _TtC7CoreIDV36XPCMobileDocumentReaderConfiguration *result;

  result = (_TtC7CoreIDV36XPCMobileDocumentReaderConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
