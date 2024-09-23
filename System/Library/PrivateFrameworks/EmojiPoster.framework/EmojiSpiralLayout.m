@implementation EmojiSpiralLayout

- (CGSize)collectionViewContentSize
{
  _TtC11EmojiPoster17EmojiSpiralLayout *v2;
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  v2 = self;
  v3 = -[EmojiSpiralLayout collectionView](v2, sel_collectionView);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, sel_bounds);
    v6 = v5;
    v8 = v7;

  }
  else
  {

    v8 = 0.0;
    v6 = 0.0;
  }
  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)prepareLayout
{
  id v2;
  void *v3;
  double v4;
  double v5;
  _TtC11EmojiPoster17EmojiSpiralLayout *v6;

  v6 = self;
  v2 = -[EmojiSpiralLayout collectionView](v6, sel_collectionView);
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v2, sel_bounds);
    v5 = v4;

    *(double *)((char *)&v6->super.super.isa + OBJC_IVAR____TtC11EmojiPoster17EmojiSpiralLayout_radius) = (v5 + 40.0) * 0.5;
  }

}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC11EmojiPoster17EmojiSpiralLayout *v8;
  id v9;
  uint64_t v11;

  v4 = sub_1DD2F9CB8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DD2F9C88();
  v8 = self;
  v9 = sub_1DD2CDC24();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v9;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  _TtC11EmojiPoster17EmojiSpiralLayout *v3;
  char *v4;
  void *v5;

  v3 = self;
  v4 = sub_1DD2CE2AC();

  if (v4)
  {
    sub_1DD2CE504();
    v5 = (void *)sub_1DD2F9EC8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  _TtC11EmojiPoster17EmojiSpiralLayout *v5;
  id v6;
  void *v7;
  CGFloat v8;
  CGFloat v9;
  BOOL v10;
  CGSize v12;
  CGSize v13;

  height = a3.size.height;
  width = a3.size.width;
  v5 = self;
  v6 = -[EmojiSpiralLayout collectionView](v5, sel_collectionView);
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v6, sel_bounds);
    v12.width = v8;
    v12.height = v9;
    v13.width = width;
    v13.height = height;
    v10 = CGSizeEqualToSize(v12, v13);

    return !v10;
  }
  else
  {

    return 0;
  }
}

- (_TtC11EmojiPoster17EmojiSpiralLayout)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC11EmojiPoster17EmojiSpiralLayout_radius) = (Class)0x3FF0000000000000;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC11EmojiPoster17EmojiSpiralLayout_startingAngle) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for EmojiSpiralLayout();
  return -[EmojiSpiralLayout init](&v3, sel_init);
}

- (_TtC11EmojiPoster17EmojiSpiralLayout)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC11EmojiPoster17EmojiSpiralLayout_radius) = (Class)0x3FF0000000000000;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC11EmojiPoster17EmojiSpiralLayout_startingAngle) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for EmojiSpiralLayout();
  return -[EmojiSpiralLayout initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
