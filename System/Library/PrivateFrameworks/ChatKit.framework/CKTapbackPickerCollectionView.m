@implementation CKTapbackPickerCollectionView

- (CKTapbackPickerCollectionView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_18E733B54();
}

- (CKTapbackPickerCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  return (CKTapbackPickerCollectionView *)sub_18E733730(a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  CKTapbackPickerCollectionView *v7;
  char v8;

  if (a3)
  {
    v4 = sub_18E768984();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  v8 = sub_18E73391C(v4, v6);

  swift_bridgeObjectRelease();
  return v8 & 1;
}

- (CGPoint)contentOffset
{
  double v2;
  double v3;
  objc_super v4;
  CGPoint result;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for TapbackPickerCollectionView();
  -[CKTapbackPickerCollectionView contentOffset](&v4, sel_contentOffset);
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setContentOffset:(CGPoint)a3
{
  double y;
  double x;
  char *v5;
  objc_super v6;

  y = a3.y;
  x = a3.x;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for TapbackPickerCollectionView();
  v5 = (char *)v6.receiver;
  -[CKTapbackPickerCollectionView setContentOffset:](&v6, sel_setContentOffset_, x, y);
  if (MEMORY[0x193FF501C](&v5[OBJC_IVAR___CKTapbackPickerCollectionView_scrollDelegate]))
  {
    sub_18E6B7A60(1);

    swift_unknownObjectRelease();
  }
  else
  {

  }
}

- (void).cxx_destruct
{
  sub_18E522F74((uint64_t)self + OBJC_IVAR___CKTapbackPickerCollectionView_scrollDelegate);
}

@end
