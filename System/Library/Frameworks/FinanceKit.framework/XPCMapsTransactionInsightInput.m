@implementation XPCMapsTransactionInsightInput

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (XPCMapsTransactionInsightInput)initWithCoder:(id)a3
{
  XPCMapsTransactionInsightInput *v4;

  swift_getObjectType();
  v4 = (XPCMapsTransactionInsightInput *)sub_23316B920(a3);
  swift_deallocPartialClassInstance();
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  XPCMapsTransactionInsightInput *v5;

  v4 = a3;
  v5 = self;
  _s10FinanceKit27MapsTransactionInsightInputV3XPCC6encode4withySo7NSCoderC_tF_0(v4);

}

- (XPCMapsTransactionInsightInput)init
{
  XPCMapsTransactionInsightInput *result;

  result = (XPCMapsTransactionInsightInput *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_233168500((uint64_t)self + OBJC_IVAR___XPCMapsTransactionInsightInput_value, type metadata accessor for MapsTransactionInsightInput);
}

@end
