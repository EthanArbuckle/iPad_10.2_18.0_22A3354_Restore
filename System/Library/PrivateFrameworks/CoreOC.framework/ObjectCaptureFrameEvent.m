@implementation ObjectCaptureFrameEvent

- (NSString)description
{
  _TtC6CoreOC23ObjectCaptureFrameEvent *v2;
  void *v3;

  v2 = self;
  sub_23928036C();

  v3 = (void *)sub_2393522CC();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC6CoreOC23ObjectCaptureFrameEvent)initWithCoder:(id)a3
{
  return (_TtC6CoreOC23ObjectCaptureFrameEvent *)ObjectCaptureFrameEvent.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC6CoreOC23ObjectCaptureFrameEvent *v5;

  v4 = a3;
  v5 = self;
  sub_239281994(v4);

}

- (_TtC6CoreOC23ObjectCaptureFrameEvent)init
{
  _TtC6CoreOC23ObjectCaptureFrameEvent *result;

  result = (_TtC6CoreOC23ObjectCaptureFrameEvent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
