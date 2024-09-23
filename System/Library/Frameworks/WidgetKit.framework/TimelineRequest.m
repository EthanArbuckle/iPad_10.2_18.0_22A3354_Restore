@implementation TimelineRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC9WidgetKit15TimelineRequest)initWithCoder:(id)a3
{
  return (_TtC9WidgetKit15TimelineRequest *)TimelineRequest.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC9WidgetKit15TimelineRequest *v5;

  v4 = a3;
  v5 = self;
  sub_1909FE2D0(v4);

}

- (_TtC9WidgetKit15TimelineRequest)init
{
  _TtC9WidgetKit15TimelineRequest *result;

  result = (_TtC9WidgetKit15TimelineRequest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_release();
}

@end
