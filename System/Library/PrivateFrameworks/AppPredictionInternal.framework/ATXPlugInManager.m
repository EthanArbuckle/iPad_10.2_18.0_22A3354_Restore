@implementation ATXPlugInManager

+ (void)setPlugInName:(id)a3 isEnabled:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a4;
  v5 = sub_1C9E45CF4();
  _s21AppPredictionInternal16ATXPlugInManagerC07setPlugE04name9isEnabledySS_SbtFZ_0(v5, v6, v4);
  swift_bridgeObjectRelease();
}

- (_TtC21AppPredictionInternal16ATXPlugInManager)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[ATXPlugInManager init](&v3, sel_init);
}

@end
