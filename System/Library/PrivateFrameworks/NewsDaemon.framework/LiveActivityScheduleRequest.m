@implementation LiveActivityScheduleRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC10NewsDaemon27LiveActivityScheduleRequest *v5;

  v4 = a3;
  v5 = self;
  LiveActivityScheduleRequest.encode(with:)((NSCoder)v4);

}

- (_TtC10NewsDaemon27LiveActivityScheduleRequest)initWithCoder:(id)a3
{
  return (_TtC10NewsDaemon27LiveActivityScheduleRequest *)LiveActivityScheduleRequest.init(coder:)(a3);
}

- (_TtC10NewsDaemon27LiveActivityScheduleRequest)init
{
  _TtC10NewsDaemon27LiveActivityScheduleRequest *result;

  result = (_TtC10NewsDaemon27LiveActivityScheduleRequest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1D710BDC8((uint64_t)self + OBJC_IVAR____TtC10NewsDaemon27LiveActivityScheduleRequest_options);
}

@end
