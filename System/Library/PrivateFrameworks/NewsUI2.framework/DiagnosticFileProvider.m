@implementation DiagnosticFileProvider

- (id)diagnosticFiles
{
  void *v2;

  sub_1D6315380();
  sub_1D6E15BE4();
  v2 = (void *)sub_1D6E26D68();
  swift_bridgeObjectRelease();
  return v2;
}

- (id)diagnosticData
{
  sub_1D6E1A0CC();
  return (id)sub_1D6E26D68();
}

- (_TtC7NewsUI222DiagnosticFileProvider)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[DiagnosticFileProvider init](&v3, sel_init);
}

@end
