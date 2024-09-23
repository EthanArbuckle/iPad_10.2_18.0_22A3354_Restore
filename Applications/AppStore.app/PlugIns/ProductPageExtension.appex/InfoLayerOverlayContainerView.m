@implementation InfoLayerOverlayContainerView

- (_TtC20ProductPageExtension29InfoLayerOverlayContainerView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension29InfoLayerOverlayContainerView *)sub_1004BF0C8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension29InfoLayerOverlayContainerView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1004BF7D4();
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension29InfoLayerOverlayContainerView *v2;

  v2 = self;
  sub_1004BF2F8();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  _TtC20ProductPageExtension29InfoLayerOverlayContainerView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  width = a3.width;
  v4 = self;
  v5 = sub_1004BF600(width);
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension29InfoLayerOverlayContainerView_overlayView));
}

@end
