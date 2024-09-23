@implementation FIUIDepthFormattedGoalPair

- (NSString)goalString
{
  return (NSString *)sub_2130D7A88();
}

- (void)setGoalString:(id)a3
{
  sub_2130D7B54((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___FIUIDepthFormattedGoalPair_goalString);
}

- (NSString)goalValue
{
  return (NSString *)sub_2130D7A88();
}

- (void)setGoalValue:(id)a3
{
  sub_2130D7B54((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___FIUIDepthFormattedGoalPair_goalValue);
}

- (FIUIDepthFormattedGoalPair)initWithGoalString:(id)a3 goalValue:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  objc_super v13;

  v5 = sub_213106328();
  v7 = v6;
  v8 = sub_213106328();
  v9 = (uint64_t *)((char *)self + OBJC_IVAR___FIUIDepthFormattedGoalPair_goalString);
  *v9 = v5;
  v9[1] = v7;
  v10 = (uint64_t *)((char *)self + OBJC_IVAR___FIUIDepthFormattedGoalPair_goalValue);
  *v10 = v8;
  v10[1] = v11;
  v13.receiver = self;
  v13.super_class = (Class)FIUIDepthFormattedGoalPair;
  return -[FIUIDepthFormattedGoalPair init](&v13, sel_init);
}

- (FIUIDepthFormattedGoalPair)init
{
  FIUIDepthFormattedGoalPair *result;

  result = (FIUIDepthFormattedGoalPair *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
