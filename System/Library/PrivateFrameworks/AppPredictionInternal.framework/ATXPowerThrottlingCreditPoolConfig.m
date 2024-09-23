@implementation ATXPowerThrottlingCreditPoolConfig

- (ATXPowerThrottlingCreditPoolConfig)initWithIdentifier:(id)a3 maxCredits:(int64_t)a4 secondsToReplenishOneCredit:(int64_t)a5 loggingSubsystem:(id)a6 loggingCategory:(id)a7
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  objc_super v22;

  v10 = sub_1C9E45CF4();
  v12 = v11;
  v13 = sub_1C9E45CF4();
  v15 = v14;
  v16 = sub_1C9E45CF4();
  v17 = (uint64_t *)((char *)self + OBJC_IVAR___ATXPowerThrottlingCreditPoolConfig_identifier);
  *v17 = v10;
  v17[1] = v12;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ATXPowerThrottlingCreditPoolConfig_maxCredits) = (Class)a4;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ATXPowerThrottlingCreditPoolConfig_secondsToReplenishOneCredit) = (Class)a5;
  v18 = (uint64_t *)((char *)self + OBJC_IVAR___ATXPowerThrottlingCreditPoolConfig_loggingSubsystem);
  *v18 = v13;
  v18[1] = v15;
  v19 = (uint64_t *)((char *)self + OBJC_IVAR___ATXPowerThrottlingCreditPoolConfig_loggingCategory);
  *v19 = v16;
  v19[1] = v20;
  v22.receiver = self;
  v22.super_class = (Class)type metadata accessor for PowerThrottlingCreditPool.Config();
  return -[ATXPowerThrottlingCreditPoolConfig init](&v22, sel_init);
}

- (ATXPowerThrottlingCreditPoolConfig)init
{
  ATXPowerThrottlingCreditPoolConfig *result;

  result = (ATXPowerThrottlingCreditPoolConfig *)_swift_stdlib_reportUnimplementedInitializer();
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
