@implementation ModifyControlStateRequest

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return byte_1EE1EF0E0;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  byte_1EE1EF0E0 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC9WidgetKit25ModifyControlStateRequest *v5;

  v4 = a3;
  v5 = self;
  sub_190A24ED0(v4);

}

- (_TtC9WidgetKit25ModifyControlStateRequest)initWithCoder:(id)a3
{
  return (_TtC9WidgetKit25ModifyControlStateRequest *)ModifyControlStateRequest.init(coder:)(a3);
}

- (_TtC9WidgetKit25ModifyControlStateRequest)init
{
  _TtC9WidgetKit25ModifyControlStateRequest *result;

  result = (_TtC9WidgetKit25ModifyControlStateRequest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_release();
}

@end
