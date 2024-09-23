@implementation ControlTemplateRequest

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return byte_1EE1EF0E2;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  byte_1EE1EF0E2 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC9WidgetKit22ControlTemplateRequest *v5;

  v4 = a3;
  v5 = self;
  sub_190A26350(v4);

}

- (_TtC9WidgetKit22ControlTemplateRequest)initWithCoder:(id)a3
{
  return (_TtC9WidgetKit22ControlTemplateRequest *)ControlTemplateRequest.init(coder:)(a3);
}

- (_TtC9WidgetKit22ControlTemplateRequest)init
{
  _TtC9WidgetKit22ControlTemplateRequest *result;

  result = (_TtC9WidgetKit22ControlTemplateRequest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_release();
}

@end
