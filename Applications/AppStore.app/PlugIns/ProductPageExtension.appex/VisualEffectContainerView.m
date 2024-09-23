@implementation VisualEffectContainerView

- (_TtC20ProductPageExtension25VisualEffectContainerView)initWithCoder:(id)a3
{
  _TtC20ProductPageExtension25VisualEffectContainerView *result;

  result = (_TtC20ProductPageExtension25VisualEffectContainerView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/VisualEffectContainerView.swift", 52, 2, 29, 0);
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  void *v4;
  _TtC20ProductPageExtension25VisualEffectContainerView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;
  CGRect v14;

  width = a3.width;
  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension25VisualEffectContainerView_embeddedView);
  v5 = self;
  objc_msgSend(v4, "sizeThatFits:", width, 1.79769313e308);
  v7 = v6;
  v9 = v8;
  -[VisualEffectContainerView bounds](v5, "bounds");
  v10 = CGRectGetWidth(v14);

  if (v10 >= v7)
    v11 = v7;
  else
    v11 = v10;
  v12 = v9;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension25VisualEffectContainerView *v2;

  v2 = self;
  sub_100319A40();

}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  JUMeasurements result;

  objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC20ProductPageExtension25VisualEffectContainerView_embeddedView), "measurementsWithFitting:in:", a4, a3.width, a3.height);
  result.var3 = v7;
  result.var2 = v6;
  result.var1 = v5;
  result.var0 = v4;
  return result;
}

- (_TtC20ProductPageExtension25VisualEffectContainerView)initWithEffect:(id)a3
{
  id v3;
  _TtC20ProductPageExtension25VisualEffectContainerView *result;

  v3 = a3;
  result = (_TtC20ProductPageExtension25VisualEffectContainerView *)_swift_stdlib_reportUnimplementedInitializer("ProductPageExtension.VisualEffectContainerView", 46, "init(effect:)", 13, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension25VisualEffectContainerView_embeddedView));
}

@end
