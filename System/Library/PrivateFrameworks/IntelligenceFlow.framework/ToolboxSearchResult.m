@implementation ToolboxSearchResult

+ (BOOL)supportsSecureCoding
{
  char v2;

  static ToolboxSearchResult.supportsSecureCoding.getter();
  return v2 & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static ToolboxSearchResult.supportsSecureCoding.setter(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC16IntelligenceFlow19ToolboxSearchResult *v5;

  v4 = a3;
  v5 = self;
  ToolboxSearchResult.encode(with:)((NSCoder)v4);

}

- (_TtC16IntelligenceFlow19ToolboxSearchResult)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  return (_TtC16IntelligenceFlow19ToolboxSearchResult *)ToolboxSearchResult.init(coder:)();
}

- (_TtC16IntelligenceFlow19ToolboxSearchResult)init
{
  ToolboxSearchResult.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
