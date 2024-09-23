@implementation VideoCardCollectionViewCell

- (_TtC22SubscribePageExtension27VideoCardCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension27VideoCardCollectionViewCell *)sub_10054B160(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension27VideoCardCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10054BBF4();
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension27VideoCardCollectionViewCell *v2;

  v2 = self;
  sub_10054B600();

}

- (void)prepareForReuse
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[VideoCardCollectionViewCell prepareForReuse](&v3, "prepareForReuse");
  sub_1004FD3E0(0);

}

- (void).cxx_destruct
{
  sub_100028A60((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension27VideoCardCollectionViewCell_itemLayoutContext);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension27VideoCardCollectionViewCell_videoCardView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension27VideoCardCollectionViewCell_avatarShowcase));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension27VideoCardCollectionViewCell_shadowView));
}

@end
