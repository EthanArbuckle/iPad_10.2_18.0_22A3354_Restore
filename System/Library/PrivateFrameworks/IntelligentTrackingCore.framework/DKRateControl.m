@implementation DKRateControl

- (_TtC23IntelligentTrackingCore13DKRateControl)init
{
  return (_TtC23IntelligentTrackingCore13DKRateControl *)DKRateControl.init()();
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC23IntelligentTrackingCore13DKRateControl_logger;
  v3 = sub_2401544C0();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
