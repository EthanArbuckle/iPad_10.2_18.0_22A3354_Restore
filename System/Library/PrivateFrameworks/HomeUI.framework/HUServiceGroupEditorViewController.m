@implementation HUServiceGroupEditorViewController

- (HUPresentationDelegate)presentationDelegate
{
  return (HUPresentationDelegate *)sub_1B8E7AFF8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___HUServiceGroupEditorViewController_presentationDelegate);
}

- (void)setPresentationDelegate:(id)a3
{
  sub_1B8E7B098();
}

- (HUServiceGroupEditorViewControllerDelegate)serviceGroupEditorDelegate
{
  return (HUServiceGroupEditorViewControllerDelegate *)sub_1B8E7AFF8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___HUServiceGroupEditorViewController_serviceGroupEditorDelegate);
}

- (void)setServiceGroupEditorDelegate:(id)a3
{
  sub_1B8E7B098();
}

+ (id)forCreatingNewServiceGroupWithServices:(id)a3 inHome:(id)a4
{
  unint64_t v5;
  id v6;
  void *v7;

  sub_1B8E23A60(0, (unint64_t *)&qword_1EF2082C0);
  v5 = sub_1B93EDF4C();
  v6 = a4;
  v7 = (void *)_s6HomeUI32ServiceGroupEditorViewControllerC014forCreatingNewcD04with2inACXDSaySo9HMServiceCG_So6HMHomeCtFZ_0(v5, (uint64_t)v6);

  swift_bridgeObjectRelease();
  return v7;
}

- (HUServiceGroupEditorViewController)initWithServiceGroupBuilder:(id)a3
{
  return (HUServiceGroupEditorViewController *)ServiceGroupEditorViewController.init(serviceGroupBuilder:)(a3);
}

- (void)viewDidLoad
{
  HUServiceGroupEditorViewController *v2;

  v2 = self;
  sub_1B8E7B550();

}

- (void)viewDidAppear:(BOOL)a3
{
  HUServiceGroupEditorViewController *v4;

  v4 = self;
  sub_1B8E7B784(a3);

}

- (void)doneWithSender:(id)a3
{
  HUServiceGroupEditorViewController *v4;
  _BYTE v5[32];

  swift_unknownObjectRetain();
  v4 = self;
  sub_1B93EE69C();
  swift_unknownObjectRelease();
  sub_1B8E7BB68((uint64_t)v5);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
}

- (void)cancelWithSender:(id)a3
{
  HUServiceGroupEditorViewController *v4;
  char *v5;
  void *v6;
  HUServiceGroupEditorViewController *v7;
  _BYTE v8[32];

  swift_unknownObjectRetain();
  v4 = self;
  sub_1B93EE69C();
  swift_unknownObjectRelease();
  v5 = (char *)v4 + OBJC_IVAR___HUServiceGroupEditorViewController_presentationDelegate;
  swift_beginAccess();
  v6 = (void *)MEMORY[0x1BCCC1DA8](v5);
  if (v6)
  {
    v7 = (HUServiceGroupEditorViewController *)objc_msgSend(v6, sel_finishPresentation_animated_, v4, 1);

    swift_unknownObjectRelease();
    v4 = v7;
  }

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
}

- (id)layoutSectionForSection:(int64_t)a3 layoutEnvironment:(id)a4
{
  HUServiceGroupEditorViewController *v7;
  char *v8;

  swift_unknownObjectRetain();
  v7 = self;
  v8 = sub_1B8E7C4B4(a3, (uint64_t)a4);
  swift_unknownObjectRelease();

  return v8;
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  HUServiceGroupEditorViewController *v11;
  uint64_t v13;

  v6 = sub_1B93EB900();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B93EB8C4();
  v10 = a3;
  v11 = self;
  sub_1B8E7C7D4(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return (Class)swift_getObjCClassFromMetadata();
}

- (id)buildItemModuleControllerForModule:(id)a3
{
  id v4;
  HUServiceGroupEditorViewController *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = (void *)sub_1B8E7DC40(v4);

  return v6;
}

- (BOOL)shouldManageTextFieldForItem:(id)a3
{
  return 1;
}

- (void)textDidChange:(id)a3 forTextField:(id)a4 item:(id)a5
{
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  id v11;
  id v12;
  HUServiceGroupEditorViewController *v13;

  v8 = sub_1B93EDDB4();
  v9 = (uint64_t *)((char *)self + OBJC_IVAR___HUServiceGroupEditorViewController_editingName);
  *v9 = v8;
  v9[1] = v10;
  v11 = a4;
  v12 = a5;
  v13 = self;
  sub_1B93ECF74();
  swift_bridgeObjectRelease();
  sub_1B8E7B8A0();

  swift_bridgeObjectRelease();
}

- (void)textFieldDidEndEditing:(id)a3 item:(id)a4
{
  id v6;
  id v7;
  HUServiceGroupEditorViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1B8E7DE2C(v6);

}

- (void)itemManagerDidUpdate:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ServiceGroupEditorViewController();
  v4 = a3;
  v5 = v6.receiver;
  -[HUItemCollectionViewController itemManagerDidUpdate:](&v6, sel_itemManagerDidUpdate_, v4);
  sub_1B8E7B8A0();

}

- (id)listContentConfigurationForSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v14;
  HUServiceGroupEditorViewController *v15;
  void *v16;
  void *v17;
  objc_class *v18;
  id v19;
  HUServiceGroupEditorViewController *v20;
  objc_super v22;

  v5 = sub_1B93EB900();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1B93EDDB4();
  v11 = v10;
  sub_1B93EB8C4();
  if (v9 == sub_1B93EDDB4() && v11 == v12)
  {
    v20 = self;
    swift_bridgeObjectRelease();
  }
  else
  {
    v14 = sub_1B93EEB10();
    v15 = self;
    swift_bridgeObjectRelease();
    if ((v14 & 1) == 0)
    {
      v16 = (void *)sub_1B93EDD84();
      v17 = (void *)sub_1B93EB8B8();
      v18 = (objc_class *)type metadata accessor for ServiceGroupEditorViewController();
      v22.receiver = v15;
      v22.super_class = v18;
      v19 = -[HUItemCollectionViewController listContentConfigurationForSupplementaryElementOfKind:atIndexPath:](&v22, sel_listContentConfigurationForSupplementaryElementOfKind_atIndexPath_, v16, v17);

      swift_bridgeObjectRelease();
      goto LABEL_11;
    }
  }
  if (qword_1EF207730 != -1)
    swift_once();
  v19 = (id)qword_1EF2096C0;

  swift_bridgeObjectRelease();
LABEL_11:
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v19;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  HUServiceGroupEditorViewController *v11;
  void *v12;
  objc_class *v13;
  objc_super v14;

  v6 = sub_1B93EB900();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B93EB8C4();
  v10 = a3;
  v11 = self;
  v12 = (void *)sub_1B93EB8B8();
  v13 = (objc_class *)type metadata accessor for ServiceGroupEditorViewController();
  v14.receiver = v11;
  v14.super_class = v13;
  -[HUItemCollectionViewController collectionView:didSelectItemAtIndexPath:](&v14, sel_collectionView_didSelectItemAtIndexPath_, v10, v12);

  sub_1B8E7B8A0();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  HUServiceGroupEditorViewController *v11;
  uint64_t v13;

  v6 = sub_1B93EB900();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B93EB8C4();
  v10 = a3;
  v11 = self;
  LOBYTE(self) = sub_1B8E7E030();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return self & 1;
}

- (id)displayedItemsInSection:(id)a3
{
  HUServiceGroupEditorViewController *v4;
  HFItemManager *v5;
  HFItemManager *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;

  sub_1B93EDDB4();
  v4 = self;
  v5 = -[HUItemCollectionViewController itemManager](v4, sel_itemManager);
  v6 = -[HUItemCollectionViewController itemManager](v4, sel_itemManager);
  v7 = (void *)sub_1B93EDD84();
  v8 = -[HFItemManager sectionIndexForDisplayedSectionIdentifier:](v6, sel_sectionIndexForDisplayedSectionIdentifier_, v7);

  v9 = -[HFItemManager displayedItemsInSection:](v5, sel_displayedItemsInSection_, v8);
  sub_1B8E23A60(0, (unint64_t *)&qword_1ED57F910);
  sub_1B93EDF4C();

  swift_bridgeObjectRelease();
  v10 = (void *)sub_1B93EDF34();
  swift_bridgeObjectRelease();
  return v10;
}

- (BOOL)shouldShowHeaderForSection:(id)a3
{
  HUServiceGroupEditorViewController *v4;
  BOOL v5;

  sub_1B93EDDB4();
  v4 = self;
  v5 = sub_1B8E7D0C8();

  swift_bridgeObjectRelease();
  return v5;
}

- (HUServiceGroupEditorViewController)initWithItemManager:(id)a3 collectionViewLayout:(id)a4
{
  id v5;
  id v6;
  HUServiceGroupEditorViewController *result;

  v5 = a3;
  v6 = a4;
  result = (HUServiceGroupEditorViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (id)initUsingCompositionalLayoutWithItemManager:(id)a3
{
  id v3;
  id result;

  v3 = a3;
  result = (id)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1B8E7A1E8((uint64_t)self + OBJC_IVAR___HUServiceGroupEditorViewController_presentationDelegate);
  sub_1B8E7A1E8((uint64_t)self + OBJC_IVAR___HUServiceGroupEditorViewController_serviceGroupEditorDelegate);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUServiceGroupEditorViewController____lazy_storage___collectionLayoutManager));
}

@end
