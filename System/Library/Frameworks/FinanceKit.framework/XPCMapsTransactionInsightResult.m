@implementation XPCMapsTransactionInsightResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (XPCMapsTransactionInsightResult)initWithCoder:(id)a3
{
  XPCMapsTransactionInsightResult *v4;

  swift_getObjectType();
  v4 = (XPCMapsTransactionInsightResult *)sub_23316BBC4(a3);
  swift_deallocPartialClassInstance();
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  XPCMapsTransactionInsightResult *v5;

  v4 = a3;
  v5 = self;
  _s10FinanceKit28MapsTransactionInsightResultO3XPCC6encode4withySo7NSCoderC_tF_0(v4);

}

- (XPCMapsTransactionInsightResult)init
{
  XPCMapsTransactionInsightResult *result;

  result = (XPCMapsTransactionInsightResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_233168500((uint64_t)self + OBJC_IVAR___XPCMapsTransactionInsightResult_value, type metadata accessor for MapsTransactionInsightResult);
}

@end
