@implementation SliderView.Coordinator

- (void)valueChanged:(id)a3
{
  UISlider *v4;
  _TtCV5CAFUI10SliderView11Coordinator *v5;

  v4 = (UISlider *)a3;
  v5 = self;
  SliderView.Coordinator.valueChanged(_:)(v4);

}

- (void)sliderTapped:(id)a3
{
  id v4;
  _TtCV5CAFUI10SliderView11Coordinator *v5;

  v4 = a3;
  v5 = self;
  SliderView.Coordinator.sliderTapped(_:)((UITapGestureRecognizer)v4);

}

- (void)trackingEnter:(id)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtCV5CAFUI10SliderView11Coordinator_isTracking) = 1;
}

- (void)trackingExit:(id)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtCV5CAFUI10SliderView11Coordinator_isTracking) = 0;
}

- (_TtCV5CAFUI10SliderView11Coordinator)init
{
  _TtCV5CAFUI10SliderView11Coordinator *result;

  result = (_TtCV5CAFUI10SliderView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();

}

@end
