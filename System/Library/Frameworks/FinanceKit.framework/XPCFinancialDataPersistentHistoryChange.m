@implementation XPCFinancialDataPersistentHistoryChange

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (XPCFinancialDataPersistentHistoryChange)initWithCoder:(id)a3
{
  XPCFinancialDataPersistentHistoryChange *v4;

  swift_getObjectType();
  v4 = (XPCFinancialDataPersistentHistoryChange *)sub_23316A234(a3);
  swift_deallocPartialClassInstance();
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  XPCFinancialDataPersistentHistoryChange *v5;

  v4 = a3;
  v5 = self;
  sub_233169588(v4);

}

- (XPCFinancialDataPersistentHistoryChange)init
{
  XPCFinancialDataPersistentHistoryChange *result;

  result = (XPCFinancialDataPersistentHistoryChange *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
