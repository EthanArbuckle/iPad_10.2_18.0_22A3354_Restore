@implementation InAppBlendedBackgroundView

- (_TtC20ProductPageExtensionP33_AF8B3EA06286D4AB02CD0CCCFC27CE8F26InAppBlendedBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtensionP33_AF8B3EA06286D4AB02CD0CCCFC27CE8F26InAppBlendedBackgroundView *)sub_1004BD9D8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtensionP33_AF8B3EA06286D4AB02CD0CCCFC27CE8F26InAppBlendedBackgroundView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1004BE304();
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtensionP33_AF8B3EA06286D4AB02CD0CCCFC27CE8F26InAppBlendedBackgroundView *v2;

  v2 = self;
  sub_1004BDF18();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtensionP33_AF8B3EA06286D4AB02CD0CCCFC27CE8F26InAppBlendedBackgroundView_topLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtensionP33_AF8B3EA06286D4AB02CD0CCCFC27CE8F26InAppBlendedBackgroundView_bottomLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtensionP33_AF8B3EA06286D4AB02CD0CCCFC27CE8F26InAppBlendedBackgroundView_blurView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtensionP33_AF8B3EA06286D4AB02CD0CCCFC27CE8F26InAppBlendedBackgroundView_shadowView));
}

@end
