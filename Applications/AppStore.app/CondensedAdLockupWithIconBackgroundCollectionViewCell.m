@implementation CondensedAdLockupWithIconBackgroundCollectionViewCell

- (_TtC8AppStore53CondensedAdLockupWithIconBackgroundCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore53CondensedAdLockupWithIconBackgroundCollectionViewCell *)sub_100468468(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore53CondensedAdLockupWithIconBackgroundCollectionViewCell)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = a3;
  sub_100469174((uint64_t)v3, v4);
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType(self, a2);
  v2 = (char *)v4.receiver;
  -[CondensedAdLockupWithIconBackgroundCollectionViewCell layoutSubviews](&v4, "layoutSubviews");
  v3 = *(void **)&v2[OBJC_IVAR____TtC8AppStore53CondensedAdLockupWithIconBackgroundCollectionViewCell_condensedAdLockupWithIconBackgroundView];
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
  v6.super_class = (Class)swift_getObjectType(self, a2);
  v2 = (char *)v6.receiver;
  -[CondensedAdLockupWithIconBackgroundCollectionViewCell prepareForReuse](&v6, "prepareForReuse");
  ArtworkView.image.setter(0);
  v3 = &v2[OBJC_IVAR____TtC8AppStore53CondensedAdLockupWithIconBackgroundCollectionViewCell_impressionsCalculator];
  swift_beginAccess(&v2[OBJC_IVAR____TtC8AppStore53CondensedAdLockupWithIconBackgroundCollectionViewCell_impressionsCalculator], v5, 1, 0);
  v4 = *(_QWORD *)v3;
  *(_QWORD *)v3 = 0;

  swift_release(v4);
}

- (void).cxx_destruct
{
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore53CondensedAdLockupWithIconBackgroundCollectionViewCell_itemLayoutContext, &qword_10082D9A0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore53CondensedAdLockupWithIconBackgroundCollectionViewCell_condensedAdLockupWithIconBackgroundView));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC8AppStore53CondensedAdLockupWithIconBackgroundCollectionViewCell_impressionsCalculator));
  sub_10003A350(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC8AppStore53CondensedAdLockupWithIconBackgroundCollectionViewCell_impressionsUpdateBlock), *(_QWORD *)&self->condensedAdLockupWithIconBackgroundView[OBJC_IVAR____TtC8AppStore53CondensedAdLockupWithIconBackgroundCollectionViewCell_impressionsUpdateBlock]);
}

@end
