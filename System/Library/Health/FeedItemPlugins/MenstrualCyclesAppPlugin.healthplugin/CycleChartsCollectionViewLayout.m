@implementation CycleChartsCollectionViewLayout

- (CGSize)collectionViewContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *(double *)((char *)&self->super.super.isa
                 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31CycleChartsCollectionViewLayout_contentSize);
  v3 = *(double *)((char *)&self->super._collectionView
                 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31CycleChartsCollectionViewLayout_contentSize);
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _TtC24MenstrualCyclesAppPlugin31CycleChartsCollectionViewLayout *v7;
  uint64_t v8;
  void *v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  v8 = sub_2319C8C20(x, y, width, height);

  if (v8)
  {
    sub_23190ACE4(0, (unint64_t *)&qword_255F42898);
    v9 = (void *)sub_231CA1D94();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC24MenstrualCyclesAppPlugin31CycleChartsCollectionViewLayout *v8;
  id v9;
  uint64_t v11;

  v4 = sub_231C9D438();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231C9D3E4();
  v8 = self;
  v9 = sub_2319C99FC((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v9;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _TtC24MenstrualCyclesAppPlugin31CycleChartsCollectionViewLayout *v12;
  char *v13;
  uint64_t v15;

  v5 = sub_231C9D438();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _sSo25HKMCDisplayTypeIdentifiera24MenstrualCyclesAppPluginE2idSSvg_0();
  v11 = v10;
  sub_231C9D3E4();
  v12 = self;
  v13 = sub_2319CA41C(v9, v11, (uint64_t)v8);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v13;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  return 1;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3
{
  double v3;
  uint64_t v4;
  double v5;
  CGPoint result;

  v3 = a3.x
     + *(double *)((char *)&self->super.super.isa
                 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31CycleChartsCollectionViewLayout_axisColumnWidthAdjustment);
  v4 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31CycleChartsCollectionViewLayout_headerHeightAdjustment;
  v5 = a3.y
     + *(double *)((char *)&self->super.super.isa
                 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31CycleChartsCollectionViewLayout_headerHeightAdjustment);
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31CycleChartsCollectionViewLayout_axisColumnWidthAdjustment) = 0;
  *(Class *)((char *)&self->super.super.isa + v4) = 0;
  result.y = v5;
  result.x = v3;
  return result;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4
{
  double y;
  double x;
  _TtC24MenstrualCyclesAppPlugin31CycleChartsCollectionViewLayout *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v6 = self;
  sub_2319CBFA4(x, y);
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.y = v12;
  result.x = v11;
  return result;
}

- (void)prepareLayout
{
  _BYTE *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[CycleChartsCollectionViewLayout prepareLayout](&v3, sel_prepareLayout);
  if ((v2[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31CycleChartsCollectionViewLayout_pendingScrollToSectionIndex + 8] & 1) == 0)
    sub_2319CC234(*(_QWORD *)&v2[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31CycleChartsCollectionViewLayout_pendingScrollToSectionIndex]);

}

- (_TtC24MenstrualCyclesAppPlugin31CycleChartsCollectionViewLayout)init
{
  return (_TtC24MenstrualCyclesAppPlugin31CycleChartsCollectionViewLayout *)sub_2319CB060();
}

- (_TtC24MenstrualCyclesAppPlugin31CycleChartsCollectionViewLayout)initWithCoder:(id)a3
{
  return (_TtC24MenstrualCyclesAppPlugin31CycleChartsCollectionViewLayout *)sub_2319CB13C(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
