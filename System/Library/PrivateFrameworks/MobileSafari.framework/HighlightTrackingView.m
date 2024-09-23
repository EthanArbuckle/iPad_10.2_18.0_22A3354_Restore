@implementation HighlightTrackingView

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC12MobileSafari21HighlightTrackingView *v8;

  sub_18BA81D14();
  sub_18BA4A7D0();
  v6 = sub_18BAC10C0();
  v7 = a4;
  v8 = self;
  sub_18BA81868(v6, (uint64_t)a4);

  swift_bridgeObjectRelease();
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  sub_18BA819FC(self, (uint64_t)a2, (uint64_t)a3, a4, (SEL *)&selRef_touchesCancelled_withEvent_);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  sub_18BA819FC(self, (uint64_t)a2, (uint64_t)a3, a4, (SEL *)&selRef_touchesEnded_withEvent_);
}

- (_TtC12MobileSafari21HighlightTrackingView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _QWORD *v8;
  objc_class *v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC12MobileSafari21HighlightTrackingView_touchForHighlight) = 0;
  v8 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC12MobileSafari21HighlightTrackingView_touchForHighlightDidChange);
  v9 = (objc_class *)type metadata accessor for HighlightTrackingView();
  *v8 = 0;
  v8[1] = 0;
  v11.receiver = self;
  v11.super_class = v9;
  return -[HighlightTrackingView initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (_TtC12MobileSafari21HighlightTrackingView)initWithCoder:(id)a3
{
  _QWORD *v5;
  objc_class *v6;
  objc_super v8;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC12MobileSafari21HighlightTrackingView_touchForHighlight) = 0;
  v5 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC12MobileSafari21HighlightTrackingView_touchForHighlightDidChange);
  v6 = (objc_class *)type metadata accessor for HighlightTrackingView();
  *v5 = 0;
  v5[1] = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return -[HighlightTrackingView initWithCoder:](&v8, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari21HighlightTrackingView_touchForHighlight));
  sub_18B8D1DAC(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC12MobileSafari21HighlightTrackingView_touchForHighlightDidChange));
}

@end
