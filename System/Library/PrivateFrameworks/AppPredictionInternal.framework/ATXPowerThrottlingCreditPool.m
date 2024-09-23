@implementation ATXPowerThrottlingCreditPool

- (ATXPowerThrottlingCreditPool)initWithConfig:(id)a3
{
  id v3;
  ATXPowerThrottlingCreditPool *v4;

  v3 = a3;
  v4 = (ATXPowerThrottlingCreditPool *)sub_1C9DFBC50(v3);

  return v4;
}

- (void)consumeCredits:(int64_t)a3 toRun:(id)a4
{
  void *v6;
  ATXPowerThrottlingCreditPool *v7;
  _QWORD v8[4];

  v6 = _Block_copy(a4);
  v8[2] = v6;
  v7 = self;
  sub_1C9DFB2A0(a3, (uint64_t)sub_1C9DFC07C, (uint64_t)v8);
  _Block_release(v6);

}

- (ATXPowerThrottlingCreditPool)init
{
  ATXPowerThrottlingCreditPool *result;

  result = (ATXPowerThrottlingCreditPool *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_release();

  v3 = (char *)self + OBJC_IVAR___ATXPowerThrottlingCreditPool_logger;
  v4 = sub_1C9E45BF8();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

}

@end
