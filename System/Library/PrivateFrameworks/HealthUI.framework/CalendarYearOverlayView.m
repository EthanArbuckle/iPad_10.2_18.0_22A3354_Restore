@implementation CalendarYearOverlayView

- (_TtC8HealthUI23CalendarYearOverlayView)initWithFrame:(CGRect)a3
{
  return (_TtC8HealthUI23CalendarYearOverlayView *)CalendarYearOverlayView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8HealthUI23CalendarYearOverlayView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s8HealthUI23CalendarYearOverlayViewC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  id v5;
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CalendarYearOverlayView();
  v4 = a3;
  v5 = v7.receiver;
  -[CalendarYearOverlayView applyLayoutAttributes:](&v7, sel_applyLayoutAttributes_, v4);
  v6 = objc_msgSend(v5, sel_layer, v7.receiver, v7.super_class);
  objc_msgSend(v6, sel_setZPosition_, (double)(uint64_t)objc_msgSend(v4, sel_zIndex));

  objc_msgSend(v5, sel_frame);
  objc_msgSend(v5, sel_setFrame_);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8HealthUI23CalendarYearOverlayView_background));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8HealthUI23CalendarYearOverlayView_label));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8HealthUI23CalendarYearOverlayView_gradient));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8HealthUI23CalendarYearOverlayView_animator));
  sub_1D7AA79D0((uint64_t)self + OBJC_IVAR____TtC8HealthUI23CalendarYearOverlayView_displayDate);
}

@end
