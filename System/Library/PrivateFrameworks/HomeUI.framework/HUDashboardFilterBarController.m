@implementation HUDashboardFilterBarController

- (BOOL)canReorderItemAtIndexPath:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  HUDashboardFilterBarController *v10;
  char v11;
  uint64_t v13;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED57E7B0);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_1B93EB8C4();
    v8 = sub_1B93EB900();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    v9 = sub_1B93EB900();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = self;
  v11 = sub_1B8E35334();

  sub_1B8E26870((uint64_t)v7, &qword_1ED57E7B0);
  return v11 & 1;
}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  id v6;
  id v7;
  HUDashboardFilterBarController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1B8E35D4C(v6, (uint64_t)v7);

}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;

  v4 = sub_1B93EB900();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B93EB8C4();
  type metadata accessor for DashboardFilterCategoryCell();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)diffableDataItemManager:(id)a3 willUpdateItems:(id)a4 addItems:(id)a5 removeItems:(id)a6 isInitialLoad:(BOOL)a7
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  HUDashboardFilterBarController *v14;

  sub_1B8E23A60(0, (unint64_t *)&qword_1ED57F910);
  sub_1B8E48724((unint64_t *)&qword_1ED57F920, (unint64_t *)&qword_1ED57F910);
  v10 = sub_1B93EE0FC();
  v11 = sub_1B93EE0FC();
  v12 = sub_1B93EE0FC();
  v13 = a3;
  v14 = self;
  sub_1B8E38708((uint64_t)v13, v10, v11, v12, a7);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)viewDidLayoutSubviews
{
  HUDashboardFilterBarController *v2;

  v2 = self;
  sub_1B8E5391C();

}

- (HUDashboardFilterBarController)init
{
  return (HUDashboardFilterBarController *)DashboardFilterBarController.init()();
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (id)compositionalLayoutConfigurationForTraitCollection:(id)a3
{
  void *v5;
  id v6;
  HUDashboardFilterBarController *v7;
  id v8;

  v5 = (void *)objc_opt_self();
  v6 = a3;
  v7 = self;
  v8 = objc_msgSend(v5, sel_defaultConfiguration);
  objc_msgSend(v8, sel_setContentInsetsReference_, 3);

  return v8;
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DashboardFilterBarController();
  v4 = v6.receiver;
  -[HUItemCollectionViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, v3);
  v5 = objc_msgSend(v4, sel_presentedViewController, v6.receiver, v6.super_class);

  if (v5)
    objc_msgSend(v4, sel_dismissViewControllerAnimated_completion_, v3, 0);

}

- (double)intrinsicHeight
{
  HUDashboardFilterBarController *v2;
  double v3;
  double v4;

  v2 = self;
  sub_1B8E5848C();
  v4 = v3;

  return v4;
}

- (id)layoutSectionForSection:(int64_t)a3 layoutEnvironment:(id)a4
{
  HUDashboardFilterBarController *v5;
  id v6;

  swift_unknownObjectRetain();
  v5 = self;
  v6 = sub_1B8E6F3A0();
  swift_unknownObjectRelease();

  return v6;
}

- (void)viewDidLoad
{
  HUDashboardFilterBarController *v2;

  v2 = self;
  sub_1B8E6F758();

}

- (void)viewIsAppearing:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  uint64_t inited;
  uint64_t v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for DashboardFilterBarController();
  v4 = v7.receiver;
  -[HUDashboardFilterBarController viewIsAppearing:](&v7, sel_viewIsAppearing_, v3);
  sub_1B8FC6C38();
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1B9438C30;
  *(_QWORD *)(inited + 32) = sub_1B93ECEB4();
  v6 = sub_1B8FAAF6C(inited);
  swift_setDeallocating();
  MEMORY[0x1BCCC0044](v6, sel_handleTraitChanges);

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
}

- (HUDashboardFilterBarDelegate)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___HUDashboardFilterBarController_delegate;
  swift_beginAccess();
  return (HUDashboardFilterBarDelegate *)(id)MEMORY[0x1BCCC1DA8](v2);
}

- (NSString)contextTypeDescriptionForAnalytics
{
  char *v2;
  void *v3;

  v2 = (char *)self + OBJC_IVAR___HUDashboardFilterBarController_contextTypeDescriptionForAnalytics;
  swift_beginAccess();
  if (!*((_QWORD *)v2 + 1))
    return (NSString *)0;
  sub_1B93ECF74();
  v3 = (void *)sub_1B93EDD84();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)setContextTypeDescriptionForAnalytics:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;

  if (a3)
  {
    v4 = sub_1B93EDDB4();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___HUDashboardFilterBarController_contextTypeDescriptionForAnalytics);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (void)resetAnimated:(BOOL)a3
{
  id v4;
  void *v5;
  id v6;
  HUDashboardFilterBarController *v7;
  uint64_t v8;
  HUDashboardFilterBarController *v9;
  HUDashboardFilterBarController *v10;

  v10 = self;
  v4 = -[HUDashboardFilterBarController collectionView](v10, sel_collectionView);
  if (v4)
  {
    v5 = v4;
    v6 = objc_msgSend(v4, sel_indexPathsForSelectedItems);

    v7 = v10;
    if (v6)
    {
      sub_1B93EB900();
      v8 = sub_1B93EDF4C();

      v9 = v10;
      sub_1B8FC755C(v8, v9, a3);
      swift_bridgeObjectRelease();

      v7 = v10;
    }

  }
  else
  {
    __break(1u);
  }
}

- (void)updateWithContext:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  HUDashboardFilterBarController *v7;

  v4 = a4;
  v6 = a3;
  v7 = self;
  sub_1B8E444D0((uint64_t)v6, v4);

}

- (id)collectionView:(id)a3 contextMenuConfigurationForItemAtIndexPath:(id)a4 point:(CGPoint)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  HUDashboardFilterBarController *v12;
  id v13;
  uint64_t v15;

  v7 = sub_1B93EB900();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B93EB8C4();
  v11 = a3;
  v12 = self;
  v13 = sub_1B8FC774C(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (BOOL)_hasTapActionForItem:(id)a3
{
  objc_opt_self();
  return swift_dynamicCastObjCClass() != 0;
}

- (id)_performTapActionForItem:(id)a3 tappedArea:(id)a4
{
  id v6;
  id v7;
  HUDashboardFilterBarController *v8;
  id v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1B8FC4C78(v6, (uint64_t)v7);

  return v9;
}

- (id)reorderableItemListForSection:(int64_t)a3
{
  HUDashboardFilterBarController *v3;
  HFItemManager *v4;
  HUDashboardFilterBarController *v5;
  id v6;

  v3 = self;
  v4 = -[HUItemCollectionViewController itemManager](v3, sel_itemManager);
  v5 = -[HFItemManager home](v4, sel_home);

  if (v5)
  {
    v6 = -[HUDashboardFilterBarController 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](v5, sel_hf_reorderableAccessoryCategoriesList);

    v3 = v5;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)presentationCoordinator:(id)a3 shouldBeginLongPressPresentationWithContext:(id)a4
{
  return 0;
}

- (HUDashboardFilterBarController)initWithItemManager:(id)a3 collectionViewLayout:(id)a4
{
  id v5;
  id v6;
  HUDashboardFilterBarController *result;

  v5 = a3;
  v6 = a4;
  result = (HUDashboardFilterBarController *)_swift_stdlib_reportUnimplementedInitializer();
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
  sub_1B8E7A1E8((uint64_t)self + OBJC_IVAR___HUDashboardFilterBarController_delegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUDashboardFilterBarController____lazy_storage___heightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUDashboardFilterBarController____lazy_storage___blurGroupingEffectView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUDashboardFilterBarController__layoutOptions));
}

- (void)handleTraitChanges
{
  HUDashboardFilterBarController *v2;

  v2 = self;
  sub_1B8FC6088();

}

@end
