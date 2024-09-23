@implementation XPCMobileDocumentReaderSessionState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC7CoreIDV35XPCMobileDocumentReaderSessionState)initWithCoder:(id)a3
{
  return (_TtC7CoreIDV35XPCMobileDocumentReaderSessionState *)sub_20A1A4354((uint64_t)self, (uint64_t)a2, a3, (uint64_t (*)(void *))sub_20A1A6024);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC7CoreIDV35XPCMobileDocumentReaderSessionState *v5;

  v4 = a3;
  v5 = self;
  sub_20A1A3620(v4, (uint64_t)&OBJC_IVAR____TtC7CoreIDV35XPCMobileDocumentReaderSessionState_value, (uint64_t (*)(uint64_t))type metadata accessor for MobileDocumentReaderSession.State, &qword_2545DAFE0, (uint64_t)&protocol conformance descriptor for MobileDocumentReaderSession.State);

}

- (_TtC7CoreIDV35XPCMobileDocumentReaderSessionState)init
{
  _TtC7CoreIDV35XPCMobileDocumentReaderSessionState *result;

  result = (_TtC7CoreIDV35XPCMobileDocumentReaderSessionState *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_20A124284((uint64_t)self + OBJC_IVAR____TtC7CoreIDV35XPCMobileDocumentReaderSessionState_value, (uint64_t (*)(_QWORD))type metadata accessor for MobileDocumentReaderSession.State);
}

@end
