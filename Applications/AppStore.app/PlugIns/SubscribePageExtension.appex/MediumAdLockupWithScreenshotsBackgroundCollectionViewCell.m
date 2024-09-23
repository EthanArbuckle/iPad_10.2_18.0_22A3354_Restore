@implementation MediumAdLockupWithScreenshotsBackgroundCollectionViewCell

- (_TtC22SubscribePageExtension57MediumAdLockupWithScreenshotsBackgroundCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension57MediumAdLockupWithScreenshotsBackgroundCollectionViewCell *)sub_1003A2D38(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension57MediumAdLockupWithScreenshotsBackgroundCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1003A398C();
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = (char *)v4.receiver;
  -[MediumAdLockupWithScreenshotsBackgroundCollectionViewCell layoutSubviews](&v4, "layoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtC22SubscribePageExtension57MediumAdLockupWithScreenshotsBackgroundCollectionViewCell_mediumAdLockupWithScreenshotsBackgroundView];
  objc_msgSend(v2, "bounds", v4.receiver, v4.super_class);
  objc_msgSend(v3, "setFrame:");

}

- (void)prepareForReuse
{
  char *v2;
  char *v3;
  uint64_t v4;
  char v5[24];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v2 = (char *)v6.receiver;
  -[MediumAdLockupWithScreenshotsBackgroundCollectionViewCell prepareForReuse](&v6, "prepareForReuse");
  v3 = &v2[OBJC_IVAR____TtC22SubscribePageExtension57MediumAdLockupWithScreenshotsBackgroundCollectionViewCell_impressionsCalculator];
  swift_beginAccess(&v2[OBJC_IVAR____TtC22SubscribePageExtension57MediumAdLockupWithScreenshotsBackgroundCollectionViewCell_impressionsCalculator], v5, 1, 0);
  v4 = *(_QWORD *)v3;
  *(_QWORD *)v3 = 0;

  swift_release(v4);
}

- (void).cxx_destruct
{
  sub_100011088((uint64_t)self+ OBJC_IVAR____TtC22SubscribePageExtension57MediumAdLockupWithScreenshotsBackgroundCollectionViewCell_itemLayoutContext, &qword_1007F4A50);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension57MediumAdLockupWithScreenshotsBackgroundCollectionViewCell_mediumAdLockupWithScreenshotsBackgroundView));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC22SubscribePageExtension57MediumAdLockupWithScreenshotsBackgroundCollectionViewCell_impressionsCalculator));
  sub_100019310(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC22SubscribePageExtension57MediumAdLockupWithScreenshotsBackgroundCollectionViewCell_impressionsUpdateBlock), *(_QWORD *)&self->mediumAdLockupWithScreenshotsBackgroundView[OBJC_IVAR____TtC22SubscribePageExtension57MediumAdLockupWithScreenshotsBackgroundCollectionViewCell_impressionsUpdateBlock]);
}

@end
