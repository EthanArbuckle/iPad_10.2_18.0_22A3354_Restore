@implementation DRPDropletAnimationCoordinator

- (UIViewSpringAnimationBehaviorDescribing)defaultBehaviorSettings
{
  DRPDropletAnimationCoordinator *v2;
  id v3;

  v2 = self;
  v3 = DRPDropletAnimationCoordinator.defaultBehaviorSettings.getter();

  return (UIViewSpringAnimationBehaviorDescribing *)v3;
}

- (void)setDefaultBehaviorSettings:(id)a3
{
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR___DRPDropletAnimationCoordinator____lazy_storage___defaultBehaviorSettings) = (Class)a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (void)applyViewConfiguration:(id)a3 animated:(BOOL)a4 tracking:(BOOL)a5 containerView:(id)a6 contextView:(id)a7
{
  DRPDropletViewConfiguration *v12;
  DRPDropletContainerView *v13;
  DRPDropletContextView *v14;
  DRPDropletAnimationCoordinator *v15;

  v12 = (DRPDropletViewConfiguration *)a3;
  v13 = (DRPDropletContainerView *)a6;
  v14 = (DRPDropletContextView *)a7;
  v15 = self;
  DRPDropletAnimationCoordinator.apply(_:animated:tracking:containerView:contextView:)(v12, a4, a5, v13, v14);

}

- (DRPDropletAnimationCoordinator)init
{
  uint64_t v3;
  void *v4;
  DRPDropletAnimationCoordinator *v5;
  void (**v6)(uint64_t, uint64_t, uint64_t, uint64_t, char, uint64_t, uint64_t, uint64_t, uint64_t);
  objc_super v8;

  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR___DRPDropletAnimationCoordinator____lazy_storage___defaultBehaviorSettings) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___DRPDropletAnimationCoordinator_id) = 0;
  v3 = OBJC_IVAR___DRPDropletAnimationCoordinator_appliedViewConfigurationMapTable;
  v4 = (void *)objc_opt_self();
  v5 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)objc_msgSend(v4, sel_weakToStrongObjectsMapTable);
  v6 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t, char, uint64_t, uint64_t, uint64_t, uint64_t))((char *)v5 + OBJC_IVAR___DRPDropletAnimationCoordinator_animateWithSettingsBlock);
  *v6 = sub_23A83ABA8;
  v6[1] = 0;

  v8.receiver = v5;
  v8.super_class = (Class)DRPDropletAnimationCoordinator;
  return -[DRPDropletAnimationCoordinator init](&v8, sel_init);
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___DRPDropletAnimationCoordinator_appliedViewConfigurationMapTable));
  swift_release();
}

@end
