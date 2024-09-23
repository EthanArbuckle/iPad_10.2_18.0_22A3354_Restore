@implementation XPCMobileDocumentReaderDeviceEngagementType

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC7CoreIDV43XPCMobileDocumentReaderDeviceEngagementType)initWithCoder:(id)a3
{
  return (_TtC7CoreIDV43XPCMobileDocumentReaderDeviceEngagementType *)sub_20A1A47E0((uint64_t)self, (uint64_t)a2, a3, (uint64_t (*)(void *))sub_20A1A6BA8);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC7CoreIDV43XPCMobileDocumentReaderDeviceEngagementType *v5;

  v4 = a3;
  v5 = self;
  _s7CoreIDV43XPCMobileDocumentReaderDeviceEngagementTypeC6encode4withySo7NSCoderC_tF_0(v4);

}

- (_TtC7CoreIDV43XPCMobileDocumentReaderDeviceEngagementType)init
{
  _TtC7CoreIDV43XPCMobileDocumentReaderDeviceEngagementType *result;

  result = (_TtC7CoreIDV43XPCMobileDocumentReaderDeviceEngagementType *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_20A127EE4(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7CoreIDV43XPCMobileDocumentReaderDeviceEngagementType_value), *(_QWORD *)&self->value[OBJC_IVAR____TtC7CoreIDV43XPCMobileDocumentReaderDeviceEngagementType_value]);
}

@end
