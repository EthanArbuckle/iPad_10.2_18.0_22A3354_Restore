@implementation ClimateCompactStatusBarView

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate27ClimateCompactStatusBarView_cabin));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate27ClimateCompactStatusBarView_recirculation));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate27ClimateCompactStatusBarView_sync));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate27ClimateCompactStatusBarView_fanIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate27ClimateCompactStatusBarView_compressorIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate27ClimateCompactStatusBarView_syncIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate27ClimateCompactStatusBarView_recirculationIdicator));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate27ClimateCompactStatusBarView_resetIndicatorTimer));
  sub_100005118(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC7Climate27ClimateCompactStatusBarView_closeAction), *(_QWORD *)&self->super.temperatureIndicator[OBJC_IVAR____TtC7Climate27ClimateCompactStatusBarView_closeAction]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate27ClimateCompactStatusBarView_closeButton));
}

@end
