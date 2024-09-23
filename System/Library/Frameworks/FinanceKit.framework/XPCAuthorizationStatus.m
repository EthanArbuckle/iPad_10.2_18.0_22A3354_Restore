@implementation XPCAuthorizationStatus

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (XPCAuthorizationStatus)initWithCoder:(id)a3
{
  XPCAuthorizationStatus *v4;

  swift_getObjectType();
  v4 = (XPCAuthorizationStatus *)sub_23316A9F8(a3);
  swift_deallocPartialClassInstance();
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  XPCAuthorizationStatus *v5;

  v4 = a3;
  v5 = self;
  _s10FinanceKit19AuthorizationStatusO3XPCC6encode4withySo7NSCoderC_tF_0(v4);

}

- (XPCAuthorizationStatus)init
{
  XPCAuthorizationStatus *result;

  result = (XPCAuthorizationStatus *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
