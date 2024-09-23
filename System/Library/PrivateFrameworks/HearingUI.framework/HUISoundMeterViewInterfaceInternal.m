@implementation HUISoundMeterViewInterfaceInternal

- (HUISoundMeterViewInterfaceInternal)initWithConfigurationType:(int64_t)a3
{
  return (HUISoundMeterViewInterfaceInternal *)HUISoundMeterViewInterface.init(configurationType:)(a3);
}

- (id)soundMeterViewController
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR___HUISoundMeterViewInterfaceInternal_viewController));
}

- (void)updateViewsWithSlowLeq:(double)a3 fastLeq:(double)a4 thresholdLevel:(unint64_t)a5
{
  HUISoundMeterViewInterfaceInternal *v5;

  v5 = self;
  sub_21A989A70();

}

- (HUISoundMeterViewInterfaceInternal)init
{
  HUISoundMeterViewInterfaceInternal *result;

  result = (HUISoundMeterViewInterfaceInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_release();
  sub_21A987060((uint64_t)self + OBJC_IVAR___HUISoundMeterViewInterfaceInternal_soundMeterView);
  v3 = (char *)self + OBJC_IVAR___HUISoundMeterViewInterfaceInternal_logger;
  v4 = sub_21A98B1DC();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
