@implementation RibbonBarItemCollectionViewCell

- (_TtC8AppStore31RibbonBarItemCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore31RibbonBarItemCollectionViewCell *)sub_1005C17A4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore31RibbonBarItemCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1005C349C();
}

- (void)layoutSubviews
{
  _TtC8AppStore31RibbonBarItemCollectionViewCell *v2;

  v2 = self;
  sub_1005C1ED0();

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)setIsAccessibilityElement:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v4;

  v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  -[RibbonBarItemCollectionViewCell setIsAccessibilityElement:](&v4, "setIsAccessibilityElement:", v3);
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitButton;
}

- (void)setAccessibilityTraits:(unint64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  -[RibbonBarItemCollectionViewCell setAccessibilityTraits:](&v4, "setAccessibilityTraits:", a3);
}

- (void).cxx_destruct
{
  sub_10008D294((uint64_t)self + OBJC_IVAR____TtC8AppStore31RibbonBarItemCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31RibbonBarItemCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31RibbonBarItemCollectionViewCell_shadowView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31RibbonBarItemCollectionViewCell_roundedCornerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31RibbonBarItemCollectionViewCell_artworkView));
}

@end
