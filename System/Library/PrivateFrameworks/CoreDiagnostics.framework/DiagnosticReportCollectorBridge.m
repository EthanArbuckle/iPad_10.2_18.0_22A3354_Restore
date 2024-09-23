@implementation DiagnosticReportCollectorBridge

+ (id)ExcResourceReportPaths
{
  void *v2;

  if ((unint64_t)ExcResourceReportPaths()())
  {
    v2 = (void *)sub_2390F9380();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (_TtC15CoreDiagnostics31DiagnosticReportCollectorBridge)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DiagnosticReportCollectorBridge();
  return -[DiagnosticReportCollectorBridge init](&v3, sel_init);
}

@end
