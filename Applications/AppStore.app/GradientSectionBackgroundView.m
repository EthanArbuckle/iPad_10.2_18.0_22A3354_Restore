@implementation GradientSectionBackgroundView

- (_TtC8AppStore29GradientSectionBackgroundView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v8;
  id v9;
  _TtC8AppStore29GradientSectionBackgroundView *v10;
  _TtC8AppStore29GradientSectionBackgroundView *v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = OBJC_IVAR____TtC8AppStore29GradientSectionBackgroundView_gradientView;
  v9 = objc_allocWithZone((Class)type metadata accessor for GradientView());
  v10 = self;
  *(Class *)((char *)&self->super.super.super.super.isa + v8) = (Class)objc_msgSend(v9, "init");

  v13.receiver = v10;
  v13.super_class = (Class)type metadata accessor for GradientSectionBackgroundView();
  v11 = -[GradientSectionBackgroundView initWithFrame:](&v13, "initWithFrame:", x, y, width, height);
  -[GradientSectionBackgroundView addSubview:](v11, "addSubview:", *(Class *)((char *)&v11->super.super.super.super.isa+ OBJC_IVAR____TtC8AppStore29GradientSectionBackgroundView_gradientView));
  return v11;
}

- (_TtC8AppStore29GradientSectionBackgroundView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC8AppStore29GradientSectionBackgroundView *result;

  v5 = OBJC_IVAR____TtC8AppStore29GradientSectionBackgroundView_gradientView;
  v6 = objc_allocWithZone((Class)type metadata accessor for GradientView());
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");

  result = (_TtC8AppStore29GradientSectionBackgroundView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/GradientSectionBackgroundView.swift", 44, 2, 29, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for GradientSectionBackgroundView();
  v2 = (char *)v4.receiver;
  -[GradientSectionBackgroundView layoutSubviews](&v4, "layoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtC8AppStore29GradientSectionBackgroundView_gradientView];
  objc_msgSend(v2, "bounds", v4.receiver, v4.super_class);
  objc_msgSend(v3, "setFrame:");

}

- (void)prepareForReuse
{
  id v2;
  unint64_t v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for GradientSectionBackgroundView();
  v2 = v5.receiver;
  -[GradientSectionBackgroundView prepareForReuse](&v5, "prepareForReuse");
  v3 = sub_1000520B8();
  v4 = (void *)static UIColor.defaultBackground.getter(v3);
  objc_msgSend(v2, "setBackgroundColor:", v4, v5.receiver, v5.super_class);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore29GradientSectionBackgroundView_gradientView));
}

@end
