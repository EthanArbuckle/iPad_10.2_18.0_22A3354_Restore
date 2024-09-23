@implementation ActivityWidgetRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC9WidgetKit21ActivityWidgetRequest)initWithCoder:(id)a3
{
  return (_TtC9WidgetKit21ActivityWidgetRequest *)ActivityWidgetRequest.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC9WidgetKit21ActivityWidgetRequest *v5;

  v4 = a3;
  v5 = self;
  sub_19097EB88(v4);

}

- (_TtC9WidgetKit21ActivityWidgetRequest)init
{
  _TtC9WidgetKit21ActivityWidgetRequest *result;

  result = (_TtC9WidgetKit21ActivityWidgetRequest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC9WidgetKit21ActivityWidgetRequest_descriptor;
  v4 = sub_190A46204();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_1908B53FC(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9WidgetKit21ActivityWidgetRequest_defaultPayload), *(_QWORD *)&self->_anon_0[OBJC_IVAR____TtC9WidgetKit21ActivityWidgetRequest_defaultPayload]);
  sub_1908B5150((uint64_t)self + OBJC_IVAR____TtC9WidgetKit21ActivityWidgetRequest_metrics, type metadata accessor for ActivityMetricsDefinition);
  swift_bridgeObjectRelease();

  swift_release();
  sub_190969C68(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9WidgetKit21ActivityWidgetRequest_jindoEnvironment), *(void **)&self->_anon_0[OBJC_IVAR____TtC9WidgetKit21ActivityWidgetRequest_jindoEnvironment]);
}

@end
