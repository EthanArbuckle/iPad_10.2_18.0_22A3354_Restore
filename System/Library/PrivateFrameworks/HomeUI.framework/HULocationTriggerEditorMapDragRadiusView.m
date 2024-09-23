@implementation HULocationTriggerEditorMapDragRadiusView

- (MKMapView)mapView
{
  return (MKMapView *)sub_1B8E7AFF8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___HULocationTriggerEditorMapDragRadiusView_mapView);
}

- (void)setMapView:(id)a3
{
  sub_1B8E7B098();
}

- (HULocationTriggerEditorMapDragRadiusViewDelegate)delegate
{
  return (HULocationTriggerEditorMapDragRadiusViewDelegate *)sub_1B8E7AFF8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___HULocationTriggerEditorMapDragRadiusView_delegate);
}

- (void)setDelegate:(id)a3
{
  sub_1B8E7B098();
}

- (unint64_t)proximity
{
  unint64_t *v2;

  v2 = (unint64_t *)((char *)self + OBJC_IVAR___HULocationTriggerEditorMapDragRadiusView_proximity);
  swift_beginAccess();
  return *v2;
}

- (void)setProximity:(unint64_t)a3
{
  HULocationTriggerEditorMapDragRadiusView *v4;

  v4 = self;
  LocationTriggerEditorMapDragRadiusView.proximity.setter(a3);

}

- (HULocationTriggerEditorMapDragRadiusView)initWithFrame:(CGRect)a3 radiusInMeters:(double)a4 delegate:(id)a5
{
  double height;
  double width;
  double y;
  double x;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  swift_unknownObjectRetain();
  return (HULocationTriggerEditorMapDragRadiusView *)LocationTriggerEditorMapDragRadiusView.init(frame:radiusInMeters:delegate:)(x, y, width, height, a4);
}

- (HULocationTriggerEditorMapDragRadiusView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s6HomeUI38LocationTriggerEditorMapDragRadiusViewC5coderACSgSo7NSCoderC_tcfc_0();
}

- (HULocationTriggerEditorMapDragRadiusView)initWithFrame:(CGRect)a3
{
  HULocationTriggerEditorMapDragRadiusView *result;

  result = (HULocationTriggerEditorMapDragRadiusView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  sub_1B8E7A1E8((uint64_t)self + OBJC_IVAR___HULocationTriggerEditorMapDragRadiusView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___HULocationTriggerEditorMapDragRadiusView_radiusSlider));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___HULocationTriggerEditorMapDragRadiusView_radiusLabel));
}

- (void)dragHandleDidMove:(id)a3
{
  id v4;
  float v5;
  HULocationTriggerEditorMapDragRadiusView *v6;

  if (a3)
  {
    v6 = self;
    v4 = a3;
    objc_msgSend(v4, sel_value);
    *(double *)((char *)&v6->super.super.super.isa
              + OBJC_IVAR___HULocationTriggerEditorMapDragRadiusView_normalizedSliderValue) = v5;
    sub_1B8FB3680();

  }
}

- (void)drawRect:(CGRect)a3
{
  HULocationTriggerEditorMapDragRadiusView *v3;

  v3 = self;
  _s6HomeUI38LocationTriggerEditorMapDragRadiusViewC4drawyySo6CGRectVF_0();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  HULocationTriggerEditorMapDragRadiusView *v5;

  if (a3)
  {
    v5 = self;
    v4 = a3;
    sub_1B8FB3474((uint64_t)objc_msgSend(v4, sel_userInterfaceStyle));

  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                 + OBJC_IVAR___HULocationTriggerEditorMapDragRadiusView_radiusSlider));
}

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  id v6;
  HULocationTriggerEditorMapDragRadiusView *v7;
  id v8;

  v6 = a3;
  swift_unknownObjectRetain();
  v7 = self;
  v8 = sub_1B8FB437C((uint64_t)a4);

  swift_unknownObjectRelease();
  return v8;
}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
  -[HULocationTriggerEditorMapDragRadiusView setNeedsDisplay](self, sel_setNeedsDisplay, a3, a4);
}

@end
