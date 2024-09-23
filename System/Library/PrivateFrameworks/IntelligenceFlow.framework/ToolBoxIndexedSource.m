@implementation ToolBoxIndexedSource

+ (BOOL)supportsSecureCoding
{
  char v2;

  static ToolBoxIndexedSource.supportsSecureCoding.getter();
  return v2 & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static ToolBoxIndexedSource.supportsSecureCoding.setter(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC16IntelligenceFlow20ToolBoxIndexedSource *v5;

  v4 = a3;
  v5 = self;
  ToolBoxIndexedSource.encode(with:)((NSCoder)v4);

}

- (_TtC16IntelligenceFlow20ToolBoxIndexedSource)initWithCoder:(id)a3
{
  _TtC16IntelligenceFlow20ToolBoxIndexedSource *result;

  ToolBoxIndexedSource.init(coder:)(a3);
  return result;
}

- (_TtC16IntelligenceFlow20ToolBoxIndexedSource)init
{
  ToolBoxIndexedSource.init()();
}

@end
