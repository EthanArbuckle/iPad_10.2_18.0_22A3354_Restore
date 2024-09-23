@implementation XPCFinancialConnectionExtensionAuthorizationParams

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC12FinanceKitUI50XPCFinancialConnectionExtensionAuthorizationParams)initWithCoder:(id)a3
{
  id v4;
  _TtC12FinanceKitUI50XPCFinancialConnectionExtensionAuthorizationParams *v5;

  swift_getObjectType();
  sub_233937794(&qword_2560E0F18, type metadata accessor for XPCFinancialConnectionExtensionAuthorizationParams, (uint64_t)&protocol conformance descriptor for XPCFinancialConnectionExtensionAuthorizationParams);
  sub_233936084(&qword_2560E0F20, MEMORY[0x24BEE0D38], MEMORY[0x24BEE04E0]);
  sub_233936084(&qword_2560E0F30, MEMORY[0x24BEE0D08], MEMORY[0x24BEE04C0]);
  v4 = a3;
  v5 = (_TtC12FinanceKitUI50XPCFinancialConnectionExtensionAuthorizationParams *)sub_2339D04BC();
  swift_deallocPartialClassInstance();
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5;
  _TtC12FinanceKitUI50XPCFinancialConnectionExtensionAuthorizationParams *v6;

  swift_getObjectType();
  sub_233937794(&qword_2560E0F18, type metadata accessor for XPCFinancialConnectionExtensionAuthorizationParams, (uint64_t)&protocol conformance descriptor for XPCFinancialConnectionExtensionAuthorizationParams);
  sub_233936084(&qword_2560E0F20, MEMORY[0x24BEE0D38], MEMORY[0x24BEE04E0]);
  sub_233936084(&qword_2560E0F30, MEMORY[0x24BEE0D08], MEMORY[0x24BEE04C0]);
  v5 = a3;
  v6 = self;
  sub_2339D04C8();

}

- (_TtC12FinanceKitUI50XPCFinancialConnectionExtensionAuthorizationParams)init
{
  _TtC12FinanceKitUI50XPCFinancialConnectionExtensionAuthorizationParams *result;

  result = (_TtC12FinanceKitUI50XPCFinancialConnectionExtensionAuthorizationParams *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
