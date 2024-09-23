@implementation HUContainedSpeakersViewController

- (BOOL)requiresPresentingViewControllerDismissal
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___HUContainedSpeakersViewController_requiresPresentingViewControllerDismissal;
  swift_beginAccess();
  return *v2;
}

- (void)setRequiresPresentingViewControllerDismissal:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___HUContainedSpeakersViewController_requiresPresentingViewControllerDismissal;
  swift_beginAccess();
  *v4 = a3;
}

- (HUPresentationDelegate)presentationDelegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___HUContainedSpeakersViewController_presentationDelegate;
  swift_beginAccess();
  return (HUPresentationDelegate *)(id)MEMORY[0x1BCCC1DA8](v2);
}

- (void)setPresentationDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (HUContainedSpeakersViewController)initWithMediaItem:(id)a3
{
  id v5;
  id v6;
  char *v7;
  HUContainedSpeakersViewController *v8;
  objc_super v10;

  *((_BYTE *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR___HUContainedSpeakersViewController_requiresPresentingViewControllerDismissal) = 0;
  swift_unknownObjectWeakInit();
  v5 = objc_allocWithZone((Class)type metadata accessor for ContainedSpeakersItemManager());
  v6 = a3;
  v7 = sub_1B8F15F68(v6);
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for ContainedSpeakersViewController();
  v8 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v10, sel_initWithItemManager_tableViewStyle_, v7, 2);

  return v8;
}

- (void)viewDidLoad
{
  HUContainedSpeakersViewController *v2;

  v2 = self;
  sub_1B8F62CD0();

}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  HUContainedSpeakersViewController *v11;
  uint64_t v12;
  uint64_t v14;

  v6 = sub_1B93EB900();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B93EB8C4();
  v10 = a3;
  v11 = self;
  v12 = sub_1B8F62E18(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  if (v12)
    return (Class)swift_getObjCClassFromMetadata();
  else
    return 0;
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  HUContainedSpeakersViewController *v14;
  void *v15;
  objc_class *v16;
  objc_super v17;

  v8 = sub_1B93EB900();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B93EB8C4();
  v12 = a3;
  v13 = a4;
  v14 = self;
  v15 = (void *)sub_1B93EB8B8();
  v16 = (objc_class *)type metadata accessor for ContainedSpeakersViewController();
  v17.receiver = v14;
  v17.super_class = v16;
  -[HUItemTableViewController setupCell:forItem:indexPath:](&v17, sel_setupCell_forItem_indexPath_, v12, v13, v15);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (id)buildItemModuleControllerForModule:(id)a3
{
  id v4;
  HUContainedSpeakersViewController *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = (void *)sub_1B8F6312C(v4);

  return v6;
}

- (id)contentConfigurationForHeaderViewAtSectionIndex:(int64_t)a3
{
  HUContainedSpeakersViewController *v4;
  id v5;

  v4 = self;
  v5 = sub_1B8F63340(a3);

  return v5;
}

- (void)itemManagerDidUpdate:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ContainedSpeakersViewController();
  v4 = a3;
  v5 = v8.receiver;
  -[HUItemTableViewController itemManagerDidUpdate:](&v8, sel_itemManagerDidUpdate_, v4);
  v6 = objc_msgSend(v5, sel_itemManager, v8.receiver, v8.super_class);
  v7 = objc_msgSend(v6, sel_home);

  objc_msgSend(v7, sel_hf_currentUserIsAdministrator);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  HUContainedSpeakersViewController *v11;
  uint64_t v12;

  v6 = sub_1B93EB900();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B93EB8C4();
  v10 = a3;
  v11 = self;
  sub_1B8F6356C(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (id)finishPresentation:(id)a3 animated:(BOOL)a4
{
  id v6;
  HUContainedSpeakersViewController *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = sub_1B8F63824(v6, a4);

  return v8;
}

- (HUContainedSpeakersViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4
{
  id v4;
  HUContainedSpeakersViewController *result;

  v4 = a3;
  result = (HUContainedSpeakersViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1B8E7A1E8((uint64_t)self + OBJC_IVAR___HUContainedSpeakersViewController_presentationDelegate);
}

- (void)editWithSender:(id)a3
{
  HUContainedSpeakersViewController *v4;
  HFItemManager *v5;
  HMHome *v6;
  uint64_t v7;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1B93EE69C();
  swift_unknownObjectRelease();
  v5 = -[HUItemTableViewController itemManager](v4, sel_itemManager);
  v6 = -[HFItemManager home](v5, sel_home);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v7);
}

@end
