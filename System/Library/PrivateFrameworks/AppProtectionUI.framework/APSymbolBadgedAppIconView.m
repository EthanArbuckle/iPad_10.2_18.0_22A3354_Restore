@implementation APSymbolBadgedAppIconView

+ (APSymbolBadgedAppIconViewMetrics)metricsForEducation
{
  APSymbolBadgedAppIconViewMetrics *result;

  sub_2362F54E0((__n128 *)retstr, (__n128)xmmword_236300B90);
  return result;
}

+ (APSymbolBadgedAppIconViewMetrics)metricsForExtensionShield
{
  APSymbolBadgedAppIconViewMetrics *result;

  sub_2362F54E0((__n128 *)retstr, (__n128)xmmword_236300BA0);
  return result;
}

- (APSymbolBadgedAppIconView)initWithApplicationIconImage:(id)a3 badgeImage:(id)a4 metrics:(APSymbolBadgedAppIconViewMetrics *)a5
{
  return (APSymbolBadgedAppIconView *)sub_2362F5F5C((uint64_t)self, (uint64_t)a2, a3, a4, (uint64_t)a5, (uint64_t (*)(void *, void *, _OWORD *))sub_2362F5534);
}

- (APSymbolBadgedAppIconView)initWithApplication:(id)a3 badgeImage:(id)a4 metrics:(APSymbolBadgedAppIconViewMetrics *)a5
{
  return (APSymbolBadgedAppIconView *)sub_2362F5F5C((uint64_t)self, (uint64_t)a2, a3, a4, (uint64_t)a5, (uint64_t (*)(void *, void *, _OWORD *))sub_2362F5898);
}

- (APSymbolBadgedAppIconView)initWithApplicationIconImage:(id)a3 symbolType:(id)a4 metrics:(APSymbolBadgedAppIconViewMetrics *)a5
{
  return (APSymbolBadgedAppIconView *)sub_2362F6D78((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t)a5, (uint64_t (*)(void *, uint64_t, uint64_t, _OWORD *))sub_2362F5FC0);
}

- (APSymbolBadgedAppIconView)initWithApplication:(id)a3 symbolType:(id)a4 metrics:(APSymbolBadgedAppIconViewMetrics *)a5
{
  return (APSymbolBadgedAppIconView *)sub_2362F6D78((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t)a5, (uint64_t (*)(void *, uint64_t, uint64_t, _OWORD *))sub_2362F6608);
}

- (APSymbolBadgedAppIconView)initWithCoder:(id)a3
{
  APSymbolBadgedAppIconView *result;

  result = (APSymbolBadgedAppIconView *)sub_2362FFAC4();
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  APSymbolBadgedAppIconView *v5;
  CGSize v6;
  double v7;
  double v8;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = APSymbolBadgedAppIconView.sizeThatFits(_:)((CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width));

  v7 = v6.width;
  v8 = v6.height;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[APSymbolBadgedAppIconView sizeThatFits:](self, sel_sizeThatFits_, 1000.0, 1000.0);
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)layoutSubviews
{
  APSymbolBadgedAppIconView *v2;

  v2 = self;
  APSymbolBadgedAppIconView.layoutSubviews()();

}

- (APSymbolBadgedAppIconView)initWithFrame:(CGRect)a3
{
  APSymbolBadgedAppIconView *result;

  result = (APSymbolBadgedAppIconView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
