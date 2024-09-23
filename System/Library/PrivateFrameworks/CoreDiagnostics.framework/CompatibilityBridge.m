@implementation CompatibilityBridge

+ (BOOL)WriteJetsamMemoryReportWithVisibilityEndowmentSet:(id)a3 audioAssertionSet:(id)a4
{
  uint64_t v5;
  char v6;

  v5 = (uint64_t)a3;
  if (a3)
  {
    sub_2390F0B44();
    sub_2390F0B80();
    v5 = sub_2390F93B0();
  }
  if (a4)
  {
    sub_2390F0B44();
    sub_2390F0B80();
    a4 = (id)sub_2390F93B0();
  }
  v6 = _s15CoreDiagnostics19CompatibilityBridgeC23WriteJetsamMemoryReport22visibilityEndowmentSet014audioAssertionK0SbShySo8NSNumberCGSg_AJtFZ_0(v5, (uint64_t)a4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v6 & 1;
}

- (_TtC15CoreDiagnostics19CompatibilityBridge)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CompatibilityBridge();
  return -[CompatibilityBridge init](&v3, sel_init);
}

@end
