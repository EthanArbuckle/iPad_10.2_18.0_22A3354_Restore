@implementation PlaceholderRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC9WidgetKit18PlaceholderRequest)initWithCoder:(id)a3
{
  return (_TtC9WidgetKit18PlaceholderRequest *)PlaceholderRequest.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC9WidgetKit18PlaceholderRequest *v5;

  v4 = a3;
  v5 = self;
  sub_190A292B4(v4);

}

- (_TtC9WidgetKit18PlaceholderRequest)init
{
  _TtC9WidgetKit18PlaceholderRequest *result;

  result = (_TtC9WidgetKit18PlaceholderRequest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  swift_release();

}

@end
