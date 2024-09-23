@implementation AURingModVisualizationView

- (UIColor)tintColor
{
  return (UIColor *)sub_21319AEBC(self, (uint64_t)a2, type metadata accessor for AURingModVisualizationView);
}

- (void)setTintColor:(id)a3
{
  sub_21319AF1C(self, (uint64_t)a2, a3, type metadata accessor for AURingModVisualizationView, &OBJC_IVAR____TtC12CoreAudioKit26AURingModVisualizationView_modShape, (SEL *)&selRef_setStrokeColor_);
}

- (void)layoutSubviews
{
  _TtC12CoreAudioKit26AURingModVisualizationView *v2;

  v2 = self;
  sub_2131995F8();

}

- (_TtC12CoreAudioKit26AURingModVisualizationView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v8;
  id v9;
  _TtC12CoreAudioKit26AURingModVisualizationView *v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(_DWORD *)((char *)&self->super.super.super.super.isa
            + OBJC_IVAR____TtC12CoreAudioKit26AURingModVisualizationView_freq1) = 1056964608;
  *(_DWORD *)((char *)&self->super.super.super.super.isa
            + OBJC_IVAR____TtC12CoreAudioKit26AURingModVisualizationView_freq2) = 1056964608;
  v8 = OBJC_IVAR____TtC12CoreAudioKit26AURingModVisualizationView_modShape;
  v9 = objc_allocWithZone(MEMORY[0x24BDE5758]);
  v10 = self;
  *(Class *)((char *)&self->super.super.super.super.isa + v8) = (Class)objc_msgSend(v9, sel_init);

  v12.receiver = v10;
  v12.super_class = (Class)type metadata accessor for AURingModVisualizationView();
  return -[AUVisualizationView initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
}

- (_TtC12CoreAudioKit26AURingModVisualizationView)initWithCoder:(id)a3
{
  return (_TtC12CoreAudioKit26AURingModVisualizationView *)sub_2131997C4(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit26AURingModVisualizationView_modShape));
}

@end
