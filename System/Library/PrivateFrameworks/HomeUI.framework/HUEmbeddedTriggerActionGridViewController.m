@implementation HUEmbeddedTriggerActionGridViewController

- (id)triggerBuilder
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.super.super.super.super.super.super.super.isa
            + OBJC_IVAR___HUEmbeddedTriggerActionGridViewController_triggerBuilder);
  swift_beginAccess();
  return *v2;
}

- (void)setTriggerBuilder:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.super.super.super.super.super.super.super.super.isa
               + OBJC_IVAR___HUEmbeddedTriggerActionGridViewController_triggerBuilder);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (HUEmbeddedTriggerActionGridViewControllerDelegate)triggerActionGridDelegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___HUEmbeddedTriggerActionGridViewController_triggerActionGridDelegate;
  swift_beginAccess();
  return (HUEmbeddedTriggerActionGridViewControllerDelegate *)(id)MEMORY[0x1BCCC1DA8](v2);
}

- (void)setTriggerActionGridDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (HUEmbeddedTriggerActionGridViewController)initWithTriggerBuilder:(id)a3
{
  return (HUEmbeddedTriggerActionGridViewController *)EmbeddedTriggerActionGridViewController.init(triggerBuilder:)(a3);
}

- (void)reloadActions
{
  HUEmbeddedTriggerActionGridViewController *v2;
  id v3;
  HFItemManager *v4;

  v2 = self;
  v4 = -[HUItemCollectionViewController itemManager](v2, sel_itemManager);
  v3 = -[HFItemManager reloadAndUpdateAllItemsFromSenderSelector:](v4, sel_reloadAndUpdateAllItemsFromSenderSelector_, sub_1B93EB918());

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUEmbeddedTriggerActionGridViewController_triggerBuilder));
  sub_1B8E7A1E8((uint64_t)self + OBJC_IVAR___HUEmbeddedTriggerActionGridViewController_triggerActionGridDelegate);
}

@end
