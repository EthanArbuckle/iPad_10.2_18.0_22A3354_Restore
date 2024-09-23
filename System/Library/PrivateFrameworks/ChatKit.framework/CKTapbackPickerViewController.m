@implementation CKTapbackPickerViewController

- (CKTapbackPickerViewControllerDelegate)tapbackPickerViewControllerDelegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___CKTapbackPickerViewController_tapbackPickerViewControllerDelegate;
  swift_beginAccess();
  return (CKTapbackPickerViewControllerDelegate *)(id)MEMORY[0x193FF501C](v2);
}

- (void)setTapbackPickerViewControllerDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (CKTapbackPickerViewController)initWithChatItem:(id)a3
{
  return (CKTapbackPickerViewController *)TapbackPickerViewController.init(chatItem:)((uint64_t)a3);
}

- (CKTapbackPickerViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_18E5E1EDC();
}

- (void)loadView
{
  id v2;
  CKTapbackPickerViewController *v3;

  v3 = self;
  v2 = sub_18E5DFE18();
  -[CKTapbackPickerViewController setView:](v3, sel_setView_, v2);

}

- (void)viewDidLoad
{
  CKTapbackPickerViewController *v2;

  v2 = self;
  sub_18E5E02CC();

}

- (void)viewDidLayoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TapbackPickerViewController();
  v2 = v3.receiver;
  -[CKTapbackPickerViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  sub_18E645D58(0.0);

}

- (void)tapbackPickerCellCenterPointDidChange:(id)a3
{
  CKTapbackPickerViewController *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_18E5E1198(v5);

}

- (CKTapbackPickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  CKTapbackPickerViewController *result;

  v4 = a4;
  result = (CKTapbackPickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR___CKTapbackPickerViewController_contentProvider);
  sub_18E522F74((uint64_t)self + OBJC_IVAR___CKTapbackPickerViewController_tapbackPickerViewControllerDelegate);
  sub_18E522F74((uint64_t)self + OBJC_IVAR___CKTapbackPickerViewController_tapbackPickerViewControllerEmojiKeyboardCellDelegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_18E522F74((uint64_t)self + OBJC_IVAR___CKTapbackPickerViewController_gradientReferenceView);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CKTapbackPickerViewController____lazy_storage___collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CKTapbackPickerViewController____lazy_storage___collectionViewLayout));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CKTapbackPickerViewController____lazy_storage___collectionViewDataSource));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CKTapbackPickerViewController_collectionViewTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CKTapbackPickerViewController_collectionViewBottomConstraint));
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  CKTapbackPickerViewController *v11;
  uint64_t v12;

  v6 = sub_18E76644C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18E76641C();
  v10 = a3;
  v11 = self;
  TapbackPickerViewController.collectionView(_:didSelectItemAt:)(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  CKTapbackPickerViewController *v14;
  uint64_t v15;

  v8 = sub_18E76644C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18E76641C();
  v12 = a3;
  v13 = a4;
  v14 = self;
  sub_18E6BF2F8(v13, (uint64_t)v11);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  CKTapbackPickerViewController *v14;
  uint64_t v15;

  v8 = sub_18E76644C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18E76641C();
  v12 = a3;
  v13 = a4;
  v14 = self;
  sub_18E6BF470();

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  CKTapbackPickerViewController *v5;

  v4 = a3;
  v5 = self;
  TapbackPickerViewController.updateVisibleCellsForScrollPosition()();
  sub_18E5E101C();
  sub_18E5E0A90();

}

@end
