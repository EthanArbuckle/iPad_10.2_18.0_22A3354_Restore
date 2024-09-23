@implementation XPCMapsTransactionInsight

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (XPCMapsTransactionInsight)initWithCoder:(id)a3
{
  XPCMapsTransactionInsight *v4;

  swift_getObjectType();
  v4 = (XPCMapsTransactionInsight *)sub_23316ACE0(a3);
  swift_deallocPartialClassInstance();
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  XPCMapsTransactionInsight *v5;

  v4 = a3;
  v5 = self;
  _s10FinanceKit22MapsTransactionInsightV3XPCC6encode4withySo7NSCoderC_tF_0(v4);

}

- (XPCMapsTransactionInsight)init
{
  XPCMapsTransactionInsight *result;

  result = (XPCMapsTransactionInsight *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_233168500((uint64_t)self + OBJC_IVAR___XPCMapsTransactionInsight_value, type metadata accessor for MapsTransactionInsight);
}

@end
