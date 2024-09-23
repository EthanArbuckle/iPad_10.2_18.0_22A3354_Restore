@implementation WidgetLocalizations

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  swift_retain();
  sub_190992530(v3);

  swift_release();
}

- (_TtC9WidgetKit19WidgetLocalizations)initWithCoder:(id)a3
{
  WidgetLocalizations.init(coder:)(a3);
  return 0;
}

@end
