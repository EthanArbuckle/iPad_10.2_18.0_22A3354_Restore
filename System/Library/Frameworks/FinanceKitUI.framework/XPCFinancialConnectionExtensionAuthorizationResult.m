@implementation XPCFinancialConnectionExtensionAuthorizationResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (XPCFinancialConnectionExtensionAuthorizationResult)initWithCoder:(id)a3
{
  id v4;
  XPCFinancialConnectionExtensionAuthorizationResult *v5;

  swift_getObjectType();
  sub_233937794(&qword_2560E1110, type metadata accessor for FinancialConnectionExtensionAuthorizationResult.XPC, (uint64_t)&unk_2339E6158);
  sub_2339377D0();
  sub_233937814();
  v4 = a3;
  v5 = (XPCFinancialConnectionExtensionAuthorizationResult *)sub_2339D04BC();
  swift_deallocPartialClassInstance();
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5;
  XPCFinancialConnectionExtensionAuthorizationResult *v6;

  swift_getObjectType();
  sub_233937794(&qword_2560E1110, type metadata accessor for FinancialConnectionExtensionAuthorizationResult.XPC, (uint64_t)&unk_2339E6158);
  sub_2339377D0();
  sub_233937814();
  v5 = a3;
  v6 = self;
  sub_2339D04C8();

}

- (XPCFinancialConnectionExtensionAuthorizationResult)init
{
  XPCFinancialConnectionExtensionAuthorizationResult *result;

  result = (XPCFinancialConnectionExtensionAuthorizationResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
