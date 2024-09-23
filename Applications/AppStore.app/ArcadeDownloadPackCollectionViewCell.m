@implementation ArcadeDownloadPackCollectionViewCell

- (_TtC8AppStore36ArcadeDownloadPackCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore36ArcadeDownloadPackCollectionViewCell *)sub_1004615F4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore36ArcadeDownloadPackCollectionViewCell)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = a3;
  sub_100461E10((uint64_t)v3, v4);
}

- (void)layoutSubviews
{
  objc_class *ObjectType;
  _TtC8AppStore36ArcadeDownloadPackCollectionViewCell *v4;
  void *v5;
  double v6;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v7.receiver = self;
  v7.super_class = ObjectType;
  v4 = self;
  -[ArcadeDownloadPackCollectionViewCell layoutSubviews](&v7, "layoutSubviews");
  v5 = *(Class *)((char *)&v4->super.super.super.super.super.isa
                + OBJC_IVAR____TtC8AppStore36ArcadeDownloadPackCollectionViewCell_cardView);
  *(_QWORD *)&v6 = LayoutMarginsAware<>.layoutFrame.getter(ObjectType).n128_u64[0];
  objc_msgSend(v5, "setFrame:", v6, v7.receiver, v7.super_class);

}

- (void).cxx_destruct
{
  sub_10008D294((uint64_t)self + OBJC_IVAR____TtC8AppStore36ArcadeDownloadPackCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore36ArcadeDownloadPackCollectionViewCell_cardView));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore36ArcadeDownloadPackCollectionViewCell_impressionsCalculator));
  sub_10003A350(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC8AppStore36ArcadeDownloadPackCollectionViewCell_impressionsUpdateBlock), *(_QWORD *)&self->cardView[OBJC_IVAR____TtC8AppStore36ArcadeDownloadPackCollectionViewCell_impressionsUpdateBlock]);
}

@end
