@implementation ArcadeDownloadPackCollectionViewCell

- (_TtC22SubscribePageExtension36ArcadeDownloadPackCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension36ArcadeDownloadPackCollectionViewCell *)sub_10056EE0C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension36ArcadeDownloadPackCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10056F628();
}

- (void)layoutSubviews
{
  objc_class *ObjectType;
  _TtC22SubscribePageExtension36ArcadeDownloadPackCollectionViewCell *v4;
  void *v5;
  double v6;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  v7.receiver = self;
  v7.super_class = ObjectType;
  v4 = self;
  -[ArcadeDownloadPackCollectionViewCell layoutSubviews](&v7, "layoutSubviews");
  v5 = *(Class *)((char *)&v4->super.super.super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension36ArcadeDownloadPackCollectionViewCell_cardView);
  v6 = LayoutMarginsAware<>.layoutFrame.getter(ObjectType);
  objc_msgSend(v5, "setFrame:", v6, v7.receiver, v7.super_class);

}

- (void).cxx_destruct
{
  sub_100028A60((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension36ArcadeDownloadPackCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension36ArcadeDownloadPackCollectionViewCell_cardView));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension36ArcadeDownloadPackCollectionViewCell_impressionsCalculator));
  sub_100019310(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC22SubscribePageExtension36ArcadeDownloadPackCollectionViewCell_impressionsUpdateBlock), *(_QWORD *)&self->cardView[OBJC_IVAR____TtC22SubscribePageExtension36ArcadeDownloadPackCollectionViewCell_impressionsUpdateBlock]);
}

@end
