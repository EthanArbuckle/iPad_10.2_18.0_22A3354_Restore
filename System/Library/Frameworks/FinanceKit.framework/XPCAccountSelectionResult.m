@implementation XPCAccountSelectionResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (XPCAccountSelectionResult)initWithCoder:(id)a3
{
  XPCAccountSelectionResult *v4;

  swift_getObjectType();
  v4 = (XPCAccountSelectionResult *)sub_23316AB68(a3);
  swift_deallocPartialClassInstance();
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  XPCAccountSelectionResult *v5;

  v4 = a3;
  v5 = self;
  _s10FinanceKit22AccountSelectionResultO3XPCC6encode4withySo7NSCoderC_tF_0(v4);

}

- (XPCAccountSelectionResult)init
{
  XPCAccountSelectionResult *result;

  result = (XPCAccountSelectionResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_23316C050(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___XPCAccountSelectionResult_value));
}

@end
