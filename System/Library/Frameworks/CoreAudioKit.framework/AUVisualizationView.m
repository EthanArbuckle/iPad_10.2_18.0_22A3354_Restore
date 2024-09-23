@implementation AUVisualizationView

- (UIColor)tintColor
{
  return (UIColor *)sub_21319AEBC(self, (uint64_t)a2, type metadata accessor for AUVisualizationView);
}

- (void)setTintColor:(id)a3
{
  char *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for AUVisualizationView();
  v4 = (char *)v11.receiver;
  v5 = a3;
  -[AUVisualizationView setTintColor:](&v11, sel_setTintColor_, v5);
  v6 = *(void **)&v4[OBJC_IVAR____TtC12CoreAudioKit19AUVisualizationView_mixLayer];
  v7 = objc_msgSend(v4, sel_tintColor, v11.receiver, v11.super_class);
  if (v7)
  {
    v8 = v7;
    v9 = objc_msgSend(v7, sel_colorWithAlphaComponent_, 0.25);

    v10 = objc_msgSend(v9, sel_CGColor);
    objc_msgSend(v6, sel_setBackgroundColor_, v10);

  }
  else
  {
    __break(1u);
  }
}

- (_TtC12CoreAudioKit19AUVisualizationView)initWithFrame:(CGRect)a3
{
  return (_TtC12CoreAudioKit19AUVisualizationView *)sub_213197B68(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12CoreAudioKit19AUVisualizationView)initWithCoder:(id)a3
{
  return (_TtC12CoreAudioKit19AUVisualizationView *)sub_213197C88(a3);
}

- (void)layoutSubviews
{
  _TtC12CoreAudioKit19AUVisualizationView *v2;

  v2 = self;
  sub_213197EBC();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit19AUVisualizationView_mixLayer));
}

@end
