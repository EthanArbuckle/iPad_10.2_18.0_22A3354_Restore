@implementation BaseTodayCardCollectionViewCell

- (_TtC22SubscribePageExtension31BaseTodayCardCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension31BaseTodayCardCollectionViewCell *)sub_1004F8F5C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension31BaseTodayCardCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1004FB8D4();
}

- (BOOL)_disableRasterizeInAnimations
{
  return 1;
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension31BaseTodayCardCollectionViewCell *v2;

  v2 = self;
  sub_1004F9520();

}

- (void)prepareForReuse
{
  _TtC22SubscribePageExtension31BaseTodayCardCollectionViewCell *v2;

  v2 = self;
  sub_1004F9688();

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v8;
  _TtC22SubscribePageExtension31BaseTodayCardCollectionViewCell *v9;
  _BYTE *v10;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v10 = sub_1004F9B18((uint64_t)a4, x, y);

  return v10;
}

- (void).cxx_destruct
{
  sub_100011088((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension31BaseTodayCardCollectionViewCell_itemLayoutContext, &qword_1007F4A50);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension31BaseTodayCardCollectionViewCell_shadowView));
  sub_100011088((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension31BaseTodayCardCollectionViewCell_pageGrid, &qword_1008027B0);
  swift_weakDestroy((char *)self + OBJC_IVAR____TtC22SubscribePageExtension31BaseTodayCardCollectionViewCell_impressionsCalculator);
  sub_100019310(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC22SubscribePageExtension31BaseTodayCardCollectionViewCell_impressionsUpdateBlock), *(_QWORD *)&self->shadowView[OBJC_IVAR____TtC22SubscribePageExtension31BaseTodayCardCollectionViewCell_impressionsUpdateBlock]);
}

@end
