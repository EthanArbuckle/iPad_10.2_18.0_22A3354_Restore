@implementation RGBCaptureSessionManager

- (_TtC9CoreIDVUI24RGBCaptureSessionManager)init
{
  _TtC9CoreIDVUI24RGBCaptureSessionManager *result;

  result = (_TtC9CoreIDVUI24RGBCaptureSessionManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI24RGBCaptureSessionManager_navigationController));

  swift_release();
  sub_213F4CF1C((uint64_t)self + OBJC_IVAR____TtC9CoreIDVUI24RGBCaptureSessionManager_config, &qword_254D5DF78);
  sub_213F87070((uint64_t)self + OBJC_IVAR____TtC9CoreIDVUI24RGBCaptureSessionManager_passingIMQResult, type metadata accessor for RGBCaptureIMQResult);
  sub_213F4CF1C((uint64_t)self + OBJC_IVAR____TtC9CoreIDVUI24RGBCaptureSessionManager_lastResult, &qword_254D5C8E8);
  sub_213F7FB0C((uint64_t)self + OBJC_IVAR____TtC9CoreIDVUI24RGBCaptureSessionManager_delegate);
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC9CoreIDVUI24RGBCaptureSessionManager_featureFlagProvider;
  v4 = sub_213FF78EC();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
