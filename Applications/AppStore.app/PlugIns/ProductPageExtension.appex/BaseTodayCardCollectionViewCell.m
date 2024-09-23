@implementation BaseTodayCardCollectionViewCell

- (_TtC20ProductPageExtension31BaseTodayCardCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension31BaseTodayCardCollectionViewCell *)sub_10035610C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension31BaseTodayCardCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100358A9C();
}

- (BOOL)_disableRasterizeInAnimations
{
  return 1;
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension31BaseTodayCardCollectionViewCell *v2;

  v2 = self;
  sub_1003566D0();

}

- (void)prepareForReuse
{
  _TtC20ProductPageExtension31BaseTodayCardCollectionViewCell *v2;

  v2 = self;
  sub_100356838();

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v8;
  _TtC20ProductPageExtension31BaseTodayCardCollectionViewCell *v9;
  _BYTE *v10;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v10 = sub_100356CC8((uint64_t)a4, x, y);

  return v10;
}

- (void).cxx_destruct
{
  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension31BaseTodayCardCollectionViewCell_itemLayoutContext, &qword_1008081F0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension31BaseTodayCardCollectionViewCell_shadowView));
  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension31BaseTodayCardCollectionViewCell_pageGrid, &qword_10082AF10);
  swift_weakDestroy((char *)self + OBJC_IVAR____TtC20ProductPageExtension31BaseTodayCardCollectionViewCell_impressionsCalculator);
  sub_100018908(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC20ProductPageExtension31BaseTodayCardCollectionViewCell_impressionsUpdateBlock), *(_QWORD *)&self->shadowView[OBJC_IVAR____TtC20ProductPageExtension31BaseTodayCardCollectionViewCell_impressionsUpdateBlock]);
}

@end
