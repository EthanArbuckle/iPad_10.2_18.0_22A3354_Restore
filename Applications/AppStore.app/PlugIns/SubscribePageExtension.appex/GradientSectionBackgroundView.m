@implementation GradientSectionBackgroundView

- (_TtC22SubscribePageExtension29GradientSectionBackgroundView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v8;
  id v9;
  _TtC22SubscribePageExtension29GradientSectionBackgroundView *v10;
  _TtC22SubscribePageExtension29GradientSectionBackgroundView *v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = OBJC_IVAR____TtC22SubscribePageExtension29GradientSectionBackgroundView_gradientView;
  v9 = objc_allocWithZone((Class)type metadata accessor for GradientView());
  v10 = self;
  *(Class *)((char *)&self->super.super.super.super.isa + v8) = (Class)objc_msgSend(v9, "init");

  v13.receiver = v10;
  v13.super_class = (Class)type metadata accessor for GradientSectionBackgroundView();
  v11 = -[GradientSectionBackgroundView initWithFrame:](&v13, "initWithFrame:", x, y, width, height);
  -[GradientSectionBackgroundView addSubview:](v11, "addSubview:", *(Class *)((char *)&v11->super.super.super.super.isa+ OBJC_IVAR____TtC22SubscribePageExtension29GradientSectionBackgroundView_gradientView));
  return v11;
}

- (_TtC22SubscribePageExtension29GradientSectionBackgroundView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC22SubscribePageExtension29GradientSectionBackgroundView *result;

  v5 = OBJC_IVAR____TtC22SubscribePageExtension29GradientSectionBackgroundView_gradientView;
  v6 = objc_allocWithZone((Class)type metadata accessor for GradientView());
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");

  result = (_TtC22SubscribePageExtension29GradientSectionBackgroundView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/GradientSectionBackgroundView.swift", 58, 2, 29, 0);
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
  v3 = *(void **)&v2[OBJC_IVAR____TtC22SubscribePageExtension29GradientSectionBackgroundView_gradientView];
  objc_msgSend(v2, "bounds", v4.receiver, v4.super_class);
  objc_msgSend(v3, "setFrame:");

}

- (void)prepareForReuse
{
  id v2;
  unint64_t v3;
  uint64_t v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for GradientSectionBackgroundView();
  v2 = v6.receiver;
  -[GradientSectionBackgroundView prepareForReuse](&v6, "prepareForReuse");
  v3 = sub_1000117FC();
  v5 = (void *)static UIColor.defaultBackground.getter(v3, v4);
  objc_msgSend(v2, "setBackgroundColor:", v5, v6.receiver, v6.super_class);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension29GradientSectionBackgroundView_gradientView));
}

@end
