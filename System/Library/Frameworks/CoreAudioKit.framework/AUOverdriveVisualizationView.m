@implementation AUOverdriveVisualizationView

- (UIColor)tintColor
{
  return (UIColor *)sub_21319AEBC(self, (uint64_t)a2, type metadata accessor for AUOverdriveVisualizationView);
}

- (void)setTintColor:(id)a3
{
  sub_21319AF1C(self, (uint64_t)a2, a3, type metadata accessor for AUOverdriveVisualizationView, &OBJC_IVAR____TtC12CoreAudioKit28AUOverdriveVisualizationView_overdriveShape, (SEL *)&selRef_setStrokeColor_);
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for AUOverdriveVisualizationView();
  v2 = (char *)v7.receiver;
  -[AUVisualizationView layoutSubviews](&v7, sel_layoutSubviews);
  v3 = *(void **)&v2[OBJC_IVAR____TtC12CoreAudioKit28AUOverdriveVisualizationView_overdriveShape];
  objc_msgSend(v2, sel_frame, v7.receiver, v7.super_class);
  v5 = v4 * 0.5;
  objc_msgSend(v2, sel_frame);
  objc_msgSend(v3, sel_setPosition_, v5, v6 * 0.5);
  sub_21319A744();

}

- (_TtC12CoreAudioKit28AUOverdriveVisualizationView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v8;
  id v9;
  _TtC12CoreAudioKit28AUOverdriveVisualizationView *v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = OBJC_IVAR____TtC12CoreAudioKit28AUOverdriveVisualizationView_overdriveShape;
  v9 = objc_allocWithZone(MEMORY[0x24BDE5758]);
  v10 = self;
  *(Class *)((char *)&self->super.super.super.super.isa + v8) = (Class)objc_msgSend(v9, sel_init);
  *(_DWORD *)((char *)&v10->super.super.super.super.isa
            + OBJC_IVAR____TtC12CoreAudioKit28AUOverdriveVisualizationView_linear) = 1065353216;
  *(_DWORD *)((char *)&v10->super.super.super.super.isa
            + OBJC_IVAR____TtC12CoreAudioKit28AUOverdriveVisualizationView_square) = 1065353216;
  *(_DWORD *)((char *)&v10->super.super.super.super.isa
            + OBJC_IVAR____TtC12CoreAudioKit28AUOverdriveVisualizationView_cubic) = 1065353216;

  v12.receiver = v10;
  v12.super_class = (Class)type metadata accessor for AUOverdriveVisualizationView();
  return -[AUVisualizationView initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
}

- (_TtC12CoreAudioKit28AUOverdriveVisualizationView)initWithCoder:(id)a3
{
  return (_TtC12CoreAudioKit28AUOverdriveVisualizationView *)sub_21319AD84(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit28AUOverdriveVisualizationView_overdriveShape));
}

@end
