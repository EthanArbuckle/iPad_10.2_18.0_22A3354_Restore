@implementation QLGradientView

- (BOOL)reversed
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC9QuickLook14QLGradientView_reversed;
  swift_beginAccess();
  return *v2;
}

- (void)setReversed:(BOOL)a3
{
  _TtC9QuickLook14QLGradientView *v4;

  v4 = self;
  sub_20D583044(a3);

}

- (_TtC9QuickLook14QLGradientView)init
{
  uint64_t v3;
  id v4;
  _TtC9QuickLook14QLGradientView *v5;
  _TtC9QuickLook14QLGradientView *v6;
  objc_super v8;

  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC9QuickLook14QLGradientView_reversed) = 0;
  v3 = OBJC_IVAR____TtC9QuickLook14QLGradientView_gradientLayer;
  v4 = objc_allocWithZone(MEMORY[0x24BDE56B8]);
  v5 = self;
  *(Class *)((char *)&self->super.super.super.isa + v3) = (Class)objc_msgSend(v4, sel_init);

  v8.receiver = v5;
  v8.super_class = (Class)type metadata accessor for QLGradientView();
  v6 = -[QLGradientView initWithFrame:](&v8, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  sub_20D583408();

  return v6;
}

- (_TtC9QuickLook14QLGradientView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC9QuickLook14QLGradientView *result;

  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC9QuickLook14QLGradientView_reversed) = 0;
  v5 = OBJC_IVAR____TtC9QuickLook14QLGradientView_gradientLayer;
  v6 = objc_allocWithZone(MEMORY[0x24BDE56B8]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  result = (_TtC9QuickLook14QLGradientView *)sub_20D5A6E94();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for QLGradientView();
  v2 = (char *)v4.receiver;
  -[QLGradientView layoutSubviews](&v4, sel_layoutSubviews);
  v3 = *(void **)&v2[OBJC_IVAR____TtC9QuickLook14QLGradientView_gradientLayer];
  objc_msgSend(v2, sel_bounds, v4.receiver, v4.super_class);
  objc_msgSend(v3, sel_setFrame_);

}

- (_TtC9QuickLook14QLGradientView)initWithFrame:(CGRect)a3
{
  _TtC9QuickLook14QLGradientView *result;

  result = (_TtC9QuickLook14QLGradientView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
