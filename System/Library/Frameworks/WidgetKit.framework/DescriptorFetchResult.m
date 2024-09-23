@implementation DescriptorFetchResult

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC9WidgetKit21DescriptorFetchResult *v5;

  v4 = a3;
  v5 = self;
  sub_1908B2790(v4);

}

- (_TtC9WidgetKit21DescriptorFetchResult)initWithCoder:(id)a3
{
  return (_TtC9WidgetKit21DescriptorFetchResult *)DescriptorFetchResult.init(coder:)(a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC9WidgetKit21DescriptorFetchResult)init
{
  _TtC9WidgetKit21DescriptorFetchResult *result;

  result = (_TtC9WidgetKit21DescriptorFetchResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
