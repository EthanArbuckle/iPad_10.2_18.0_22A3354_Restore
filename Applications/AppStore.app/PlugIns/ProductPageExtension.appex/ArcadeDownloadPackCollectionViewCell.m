@implementation ArcadeDownloadPackCollectionViewCell

- (_TtC20ProductPageExtension36ArcadeDownloadPackCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension36ArcadeDownloadPackCollectionViewCell *)sub_100566F98(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension36ArcadeDownloadPackCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1005677B4();
}

- (void)layoutSubviews
{
  objc_class *ObjectType;
  _TtC20ProductPageExtension36ArcadeDownloadPackCollectionViewCell *v4;
  void *v5;
  double v6;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  v7.receiver = self;
  v7.super_class = ObjectType;
  v4 = self;
  -[ArcadeDownloadPackCollectionViewCell layoutSubviews](&v7, "layoutSubviews");
  v5 = *(Class *)((char *)&v4->super.super.super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension36ArcadeDownloadPackCollectionViewCell_cardView);
  v6 = LayoutMarginsAware<>.layoutFrame.getter(ObjectType);
  objc_msgSend(v5, "setFrame:", v6, v7.receiver, v7.super_class);

}

- (void).cxx_destruct
{
  sub_1000119FC((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension36ArcadeDownloadPackCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension36ArcadeDownloadPackCollectionViewCell_cardView));
  swift_release();
  sub_100018908(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC20ProductPageExtension36ArcadeDownloadPackCollectionViewCell_impressionsUpdateBlock), *(_QWORD *)&self->cardView[OBJC_IVAR____TtC20ProductPageExtension36ArcadeDownloadPackCollectionViewCell_impressionsUpdateBlock]);
}

@end
