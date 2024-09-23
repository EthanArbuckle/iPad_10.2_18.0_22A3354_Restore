@implementation BaseTodayCardCollectionViewCell

- (void)layoutSubviews
{
  _TtC8AppStore31BaseTodayCardCollectionViewCell *v2;

  v2 = self;
  sub_10003D454();

}

- (_TtC8AppStore31BaseTodayCardCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore31BaseTodayCardCollectionViewCell *)sub_100040A4C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (BOOL)_disableRasterizeInAnimations
{
  return 1;
}

- (_TtC8AppStore31BaseTodayCardCollectionViewCell)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = a3;
  sub_10041C894((uint64_t)v3, v4);
}

- (void)prepareForReuse
{
  _TtC8AppStore31BaseTodayCardCollectionViewCell *v2;

  v2 = self;
  sub_10041A940();

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v8;
  _TtC8AppStore31BaseTodayCardCollectionViewCell *v9;
  _BYTE *v10;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v10 = sub_10041ADD0((uint64_t)a4, x, y);

  return v10;
}

- (void).cxx_destruct
{
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore31BaseTodayCardCollectionViewCell_itemLayoutContext, &qword_10082D9A0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore31BaseTodayCardCollectionViewCell_shadowView));
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore31BaseTodayCardCollectionViewCell_pageGrid, (uint64_t *)&unk_10082C3F0);
  swift_weakDestroy((char *)self + OBJC_IVAR____TtC8AppStore31BaseTodayCardCollectionViewCell_impressionsCalculator);
  sub_10003A350(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC8AppStore31BaseTodayCardCollectionViewCell_impressionsUpdateBlock), *(_QWORD *)&self->shadowView[OBJC_IVAR____TtC8AppStore31BaseTodayCardCollectionViewCell_impressionsUpdateBlock]);
}

@end
