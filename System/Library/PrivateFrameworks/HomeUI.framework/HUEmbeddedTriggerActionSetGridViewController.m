@implementation HUEmbeddedTriggerActionSetGridViewController

- (id)triggerBuilder
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.super.super.super.super.super.super.super.isa
            + OBJC_IVAR___HUEmbeddedTriggerActionSetGridViewController_triggerBuilder);
  swift_beginAccess();
  return *v2;
}

- (void)setTriggerBuilder:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.super.super.super.super.super.super.super.super.isa
               + OBJC_IVAR___HUEmbeddedTriggerActionSetGridViewController_triggerBuilder);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (HUEmbeddedTriggerActionSetGridViewControllerDelegate)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___HUEmbeddedTriggerActionSetGridViewController_delegate;
  swift_beginAccess();
  return (HUEmbeddedTriggerActionSetGridViewControllerDelegate *)(id)MEMORY[0x1BCCC1DA8](v2);
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (HUEmbeddedTriggerActionSetGridViewController)initWithTriggerBuilder:(id)a3
{
  id v5;
  HUEmbeddedTriggerActionSetGridViewController *v6;

  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.super.super.super.super.super.isa
           + OBJC_IVAR___HUEmbeddedTriggerActionSetGridViewController_triggerBuilder) = (Class)a3;
  v5 = a3;
  v6 = (HUEmbeddedTriggerActionSetGridViewController *)sub_1B8EA5E44((uint64_t)objc_msgSend(v5, sel_triggerActionSets), objc_msgSend(v5, sel_home), (char *)self);

  return v6;
}

- (void)reloadActions
{
  HUEmbeddedTriggerActionSetGridViewController *v2;
  id v3;
  HFItemManager *v4;

  v2 = self;
  v4 = -[HUItemCollectionViewController itemManager](v2, sel_itemManager);
  v3 = -[HFItemManager reloadAndUpdateAllItemsFromSenderSelector:](v4, sel_reloadAndUpdateAllItemsFromSenderSelector_, sub_1B93EB918());

}

- (void)sceneEditor:(id)a3 removeActionSetBuilderFromTrigger:(id)a4
{
  char *v7;
  uint64_t v8;
  void *v9;
  void **v10;
  void *v11;
  id v12;
  id v13;
  HUEmbeddedTriggerActionSetGridViewController *v14;
  id v15;

  v7 = (char *)self + OBJC_IVAR___HUEmbeddedTriggerActionSetGridViewController_delegate;
  swift_beginAccess();
  v8 = MEMORY[0x1BCCC1DA8](v7);
  if (v8)
  {
    v9 = (void *)v8;
    v10 = (void **)((char *)&self->super.super.super.super.super.super.super.super.super.isa
                  + OBJC_IVAR___HUEmbeddedTriggerActionSetGridViewController_triggerBuilder);
    swift_beginAccess();
    v11 = *v10;
    v12 = a3;
    v13 = a4;
    v14 = self;
    v15 = v11;
    objc_msgSend(v9, sel_triggerActionSetGridViewController_didUpdate_, v14, v15);

    swift_unknownObjectRelease();
  }
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUEmbeddedTriggerActionSetGridViewController_triggerBuilder));
  sub_1B8E7A1E8((uint64_t)self + OBJC_IVAR___HUEmbeddedTriggerActionSetGridViewController_delegate);
}

@end
