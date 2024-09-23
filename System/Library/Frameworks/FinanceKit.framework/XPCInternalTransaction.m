@implementation XPCInternalTransaction

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (XPCInternalTransaction)initWithCoder:(id)a3
{
  XPCInternalTransaction *v4;

  swift_getObjectType();
  v4 = (XPCInternalTransaction *)sub_23316B67C(a3);
  swift_deallocPartialClassInstance();
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  XPCInternalTransaction *v5;

  v4 = a3;
  v5 = self;
  _s10FinanceKit19InternalTransactionV3XPCC6encode4withySo7NSCoderC_tF_0(v4);

}

- (XPCInternalTransaction)init
{
  XPCInternalTransaction *result;

  result = (XPCInternalTransaction *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_233168500((uint64_t)self + OBJC_IVAR___XPCInternalTransaction_value, type metadata accessor for InternalTransaction);
}

@end
