@implementation EmojiSkinToneControlViewController

- (void)viewDidLoad
{
  _TtC10StickerKit34EmojiSkinToneControlViewController *v2;

  v2 = self;
  sub_23463B0E8();

}

- (_TtC10StickerKit34EmojiSkinToneControlViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_23463BD2C();
}

- (_TtC10StickerKit34EmojiSkinToneControlViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC10StickerKit34EmojiSkinToneControlViewController *result;

  v4 = a4;
  result = (_TtC10StickerKit34EmojiSkinToneControlViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_2345B0C20((uint64_t)self + OBJC_IVAR____TtC10StickerKit34EmojiSkinToneControlViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit34EmojiSkinToneControlViewController_collectionView));
  swift_bridgeObjectRelease();
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  unint64_t v4;
  id v7;
  _TtC10StickerKit34EmojiSkinToneControlViewController *v8;
  int64_t v9;

  v4 = *(unint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC10StickerKit34EmojiSkinToneControlViewController_colors);
  if (!(v4 >> 62))
    return *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  v7 = a3;
  v8 = self;
  swift_bridgeObjectRetain();
  v9 = sub_2347180CC();

  swift_bridgeObjectRelease();
  return v9;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC10StickerKit34EmojiSkinToneControlViewController *v11;
  void *v12;
  uint64_t v14;

  v6 = sub_234715B64();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_234715B1C();
  v10 = a3;
  v11 = self;
  v12 = (void *)EmojiSkinToneControlViewController.collectionView(_:cellForItemAt:)(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC10StickerKit34EmojiSkinToneControlViewController *v11;
  uint64_t v12;

  v6 = sub_234715B64();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_234715B1C();
  v10 = a3;
  v11 = self;
  sub_23463C02C();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5
{
  return 0.0;
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  UIEdgeInsets result;

  v5 = 0.0;
  v6 = 15.0;
  v7 = 0.0;
  v8 = 15.0;
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

@end
