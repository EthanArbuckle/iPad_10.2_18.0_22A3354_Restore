@implementation XPCTransactionInsight

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (XPCTransactionInsight)initWithCoder:(id)a3
{
  XPCTransactionInsight *v4;

  swift_getObjectType();
  v4 = (XPCTransactionInsight *)sub_23316B134(a3);
  swift_deallocPartialClassInstance();
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  XPCTransactionInsight *v5;

  v4 = a3;
  v5 = self;
  _s10FinanceKit11TransactionV7InsightO3XPCC6encode4withySo7NSCoderC_tF_0(v4);

}

- (XPCTransactionInsight)init
{
  XPCTransactionInsight *result;

  result = (XPCTransactionInsight *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_233168500((uint64_t)self + OBJC_IVAR___XPCTransactionInsight_value, type metadata accessor for Transaction.Insight);
}

@end
