@implementation XPCTransactions

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (XPCTransactions)initWithCoder:(id)a3
{
  XPCTransactions *v4;

  swift_getObjectType();
  v4 = (XPCTransactions *)sub_23316A814(a3);
  swift_deallocPartialClassInstance();
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  XPCTransactions *v5;

  v4 = a3;
  v5 = self;
  _s10FinanceKit11TransactionV8XPCArrayC6encode4withySo7NSCoderC_tF_0(v4);

}

- (XPCTransactions)init
{
  XPCTransactions *result;

  result = (XPCTransactions *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
