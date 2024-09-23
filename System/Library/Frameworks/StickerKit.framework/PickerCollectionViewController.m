@implementation PickerCollectionViewController

- (void)viewDidLoad
{
  _TtC10StickerKit30PickerCollectionViewController *v2;

  v2 = self;
  sub_234633E3C();

}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  _TtC10StickerKit30PickerCollectionViewController *v5;

  v4 = a3;
  v5 = self;
  sub_23463795C();

}

- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC10StickerKit30PickerCollectionViewController *v8;

  sub_234715B64();
  v6 = sub_2347178BC();
  v7 = a3;
  v8 = self;
  sub_234637C1C(v6);

  swift_bridgeObjectRelease();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC10StickerKit30PickerCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = sub_234717754();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC10StickerKit30PickerCollectionViewController *)PickerCollectionViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC10StickerKit30PickerCollectionViewController)initWithCoder:(id)a3
{
  return (_TtC10StickerKit30PickerCollectionViewController *)PickerCollectionViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit30PickerCollectionViewController_dataSource));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit30PickerCollectionViewController_collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickerKit30PickerCollectionViewController_categoryBarController));
  swift_release();
  swift_release();
}

@end
