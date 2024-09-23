@implementation VideoCardCollectionViewCell

- (_TtC8AppStore27VideoCardCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore27VideoCardCollectionViewCell *)sub_1001806C8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore27VideoCardCollectionViewCell)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = a3;
  sub_100181260((uint64_t)v3, v4);
}

- (void)layoutSubviews
{
  _TtC8AppStore27VideoCardCollectionViewCell *v2;

  v2 = self;
  sub_100180C14();

}

- (void)prepareForReuse
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[VideoCardCollectionViewCell prepareForReuse](&v3, "prepareForReuse");
  sub_1001C6538(0);

}

- (void).cxx_destruct
{
  sub_10008D294((uint64_t)self + OBJC_IVAR____TtC8AppStore27VideoCardCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore27VideoCardCollectionViewCell_videoCardView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore27VideoCardCollectionViewCell_avatarShowcase));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore27VideoCardCollectionViewCell_shadowView));
}

@end
