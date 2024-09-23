@implementation Readiness

+ (BOOL)supportsSecureCoding
{
  char v2;

  static Readiness.supportsSecureCoding.getter();
  return v2 & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static Readiness.supportsSecureCoding.setter(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC16IntelligenceFlow9Readiness *v5;

  v4 = a3;
  v5 = self;
  Readiness.encode(with:)((NSCoder)v4);

}

- (_TtC16IntelligenceFlow9Readiness)initWithCoder:(id)a3
{
  id v3;
  _TtC16IntelligenceFlow9Readiness *result;

  v3 = a3;
  Readiness.init(coder:)();
  return result;
}

- (_TtC16IntelligenceFlow9Readiness)init
{
  Readiness.init()();
}

- (void).cxx_destruct
{

}

@end
