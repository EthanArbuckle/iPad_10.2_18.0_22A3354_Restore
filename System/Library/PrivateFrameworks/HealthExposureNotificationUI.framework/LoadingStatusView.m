@implementation LoadingStatusView

- (_TtC28HealthExposureNotificationUI17LoadingStatusView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  _TtC28HealthExposureNotificationUI17LoadingStatusView *result;

  v5 = OBJC_IVAR____TtC28HealthExposureNotificationUI17LoadingStatusView_spinnerView;
  v6 = objc_allocWithZone(MEMORY[0x24BEBD398]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithActivityIndicatorStyle_, 101);
  v8 = OBJC_IVAR____TtC28HealthExposureNotificationUI17LoadingStatusView_statusLabel;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD708]), sel_init);

  result = (_TtC28HealthExposureNotificationUI17LoadingStatusView *)sub_21CD768EC();
  __break(1u);
  return result;
}

- (_TtC28HealthExposureNotificationUI17LoadingStatusView)initWithFrame:(CGRect)a3
{
  _TtC28HealthExposureNotificationUI17LoadingStatusView *result;

  result = (_TtC28HealthExposureNotificationUI17LoadingStatusView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI17LoadingStatusView_spinnerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI17LoadingStatusView_statusLabel));
}

@end
