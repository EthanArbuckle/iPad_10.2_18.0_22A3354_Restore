@implementation XPCOrders

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (XPCOrders)initWithCoder:(id)a3
{
  XPCOrders *v4;

  swift_getObjectType();
  v4 = (XPCOrders *)sub_23316AF84(a3);
  swift_deallocPartialClassInstance();
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  XPCOrders *v5;

  v4 = a3;
  v5 = self;
  _s10FinanceKit5OrderV8XPCArrayC6encode4withySo7NSCoderC_tF_0(v4);

}

- (XPCOrders)init
{
  XPCOrders *result;

  result = (XPCOrders *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
