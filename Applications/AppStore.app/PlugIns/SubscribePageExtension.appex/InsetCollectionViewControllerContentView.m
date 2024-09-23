@implementation InsetCollectionViewControllerContentView

- (unint64_t)edgesInsettingLayoutMarginsFromSafeArea
{
  objc_super v3;

  if (*((_BYTE *)&self->super.super.super.isa
       + OBJC_IVAR____TtC22SubscribePageExtensionP33_D5EB93F8F29FA420E99B1898AD0B2EE640InsetCollectionViewControllerContentView_insetLayoutMarginsFromTopSafeAreaInset) != 1)
    return 14;
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[InsetCollectionViewControllerContentView edgesInsettingLayoutMarginsFromSafeArea](&v3, "edgesInsettingLayoutMarginsFromSafeArea");
}

- (void)setEdgesInsettingLayoutMarginsFromSafeArea:(unint64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  -[InsetCollectionViewControllerContentView setEdgesInsettingLayoutMarginsFromSafeArea:](&v4, "setEdgesInsettingLayoutMarginsFromSafeArea:", a3);
}

- (unint64_t)_edgesPropagatingSafeAreaInsetsToSubviews
{
  if (*((_BYTE *)&self->super.super.super.isa
       + OBJC_IVAR____TtC22SubscribePageExtensionP33_D5EB93F8F29FA420E99B1898AD0B2EE640InsetCollectionViewControllerContentView_insetLayoutMarginsFromTopSafeAreaInset))
    return 15;
  else
    return 14;
}

- (_TtC22SubscribePageExtensionP33_D5EB93F8F29FA420E99B1898AD0B2EE640InsetCollectionViewControllerContentView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectWeakInit((char *)self+ OBJC_IVAR____TtC22SubscribePageExtensionP33_D5EB93F8F29FA420E99B1898AD0B2EE640InsetCollectionViewControllerContentView_collectionView, 0);
  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC22SubscribePageExtensionP33_D5EB93F8F29FA420E99B1898AD0B2EE640InsetCollectionViewControllerContentView_insetLayoutMarginsFromTopSafeAreaInset) = 1;
  v10.receiver = self;
  v10.super_class = ObjectType;
  return -[InsetCollectionViewControllerContentView initWithFrame:](&v10, "initWithFrame:", x, y, width, height);
}

- (_TtC22SubscribePageExtensionP33_D5EB93F8F29FA420E99B1898AD0B2EE640InsetCollectionViewControllerContentView)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  double v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  *(_QWORD *)&v6 = swift_unknownObjectWeakInit((char *)self+ OBJC_IVAR____TtC22SubscribePageExtensionP33_D5EB93F8F29FA420E99B1898AD0B2EE640InsetCollectionViewControllerContentView_collectionView, 0).n128_u64[0];
  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC22SubscribePageExtensionP33_D5EB93F8F29FA420E99B1898AD0B2EE640InsetCollectionViewControllerContentView_insetLayoutMarginsFromTopSafeAreaInset) = 1;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return -[InsetCollectionViewControllerContentView initWithCoder:](&v8, "initWithCoder:", a3, v6);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self+ OBJC_IVAR____TtC22SubscribePageExtensionP33_D5EB93F8F29FA420E99B1898AD0B2EE640InsetCollectionViewControllerContentView_collectionView);
}

@end
