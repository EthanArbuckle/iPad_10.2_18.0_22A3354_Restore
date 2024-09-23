@implementation FinanciaDataConnectionInfo

- (_TtC10FinanceKit26FinanciaDataConnectionInfo)init
{
  _QWORD *v3;
  objc_class *v4;
  objc_super v6;

  v3 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC10FinanceKit26FinanciaDataConnectionInfo_applicationIdentifier);
  v4 = (objc_class *)type metadata accessor for FinanciaDataConnectionInfo();
  *v3 = 0;
  v3[1] = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return -[FinanciaDataConnectionInfo init](&v6, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
