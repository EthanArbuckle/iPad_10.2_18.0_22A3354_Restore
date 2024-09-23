@implementation UpsellBreakoutSizingTraitEnvironment

- (UITraitCollection)traitCollection
{
  return (UITraitCollection *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                      + OBJC_IVAR____TtC20ProductPageExtensionP33_18AA49E3A0089529D9EAA38FB165277F36UpsellBreakoutSizingTraitEnvironment_traitCollection));
}

- (void)setTraitCollection:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC20ProductPageExtensionP33_18AA49E3A0089529D9EAA38FB165277F36UpsellBreakoutSizingTraitEnvironment_traitCollection);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC20ProductPageExtensionP33_18AA49E3A0089529D9EAA38FB165277F36UpsellBreakoutSizingTraitEnvironment_traitCollection) = (Class)a3;
  v3 = a3;

}

- (CGSize)pageContainerSize
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtC20ProductPageExtensionP33_18AA49E3A0089529D9EAA38FB165277F36UpsellBreakoutSizingTraitEnvironment_pageTraits), "pageContainerSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (UIEdgeInsets)pageMarginInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtC20ProductPageExtensionP33_18AA49E3A0089529D9EAA38FB165277F36UpsellBreakoutSizingTraitEnvironment_pageTraits), "pageMarginInsets");
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (_TtP20ProductPageExtension20PageTraitEnvironment_)snapshotPageTraitEnvironment
{
  return (_TtP20ProductPageExtension20PageTraitEnvironment_ *)(id)swift_unknownObjectRetain(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC20ProductPageExtensionP33_18AA49E3A0089529D9EAA38FB165277F36UpsellBreakoutSizingTraitEnvironment_pageTraits));
}

- (_TtC20ProductPageExtensionP33_18AA49E3A0089529D9EAA38FB165277F36UpsellBreakoutSizingTraitEnvironment)init
{
  _TtC20ProductPageExtensionP33_18AA49E3A0089529D9EAA38FB165277F36UpsellBreakoutSizingTraitEnvironment *result;

  result = (_TtC20ProductPageExtensionP33_18AA49E3A0089529D9EAA38FB165277F36UpsellBreakoutSizingTraitEnvironment *)_swift_stdlib_reportUnimplementedInitializer("ProductPageExtension.UpsellBreakoutSizingTraitEnvironment", 57, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC20ProductPageExtensionP33_18AA49E3A0089529D9EAA38FB165277F36UpsellBreakoutSizingTraitEnvironment_pageTraits));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC20ProductPageExtensionP33_18AA49E3A0089529D9EAA38FB165277F36UpsellBreakoutSizingTraitEnvironment_traitCollection));
}

@end
