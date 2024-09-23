@implementation HUControlCenterModuleViewController

- (int64_t)kind
{
  return *(int64_t *)((char *)&self->super.super.super.super.super.super.super.isa
                           + OBJC_IVAR___HUControlCenterModuleViewController_kind);
}

- (HUControlCenterModuleViewControllerDelegate)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___HUControlCenterModuleViewController_delegate;
  swift_beginAccess();
  return (HUControlCenterModuleViewControllerDelegate *)(id)MEMORY[0x1BCCC1DA8](v2);
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (BOOL)allowsCharacteristicNotifications
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___HUControlCenterModuleViewController_allowsCharacteristicNotifications;
  swift_beginAccess();
  return *v2;
}

- (void)setAllowsCharacteristicNotifications:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___HUControlCenterModuleViewController_allowsCharacteristicNotifications;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)accessAllowedForCurrentLockState
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___HUControlCenterModuleViewController_accessAllowedForCurrentLockState;
  swift_beginAccess();
  return *v2;
}

- (void)setAccessAllowedForCurrentLockState:(BOOL)a3
{
  HUControlCenterModuleViewController *v4;

  v4 = self;
  HUControlCenterModuleViewController.accessAllowedForCurrentLockState.setter(a3);

}

- (HUControlCenterModuleViewController)initWithDelegate:(id)a3 ofKind:(int64_t)a4 itemManager:(id)a5 withPreviews:(id)a6
{
  unint64_t v6;

  v6 = (unint64_t)a6;
  if (a6)
  {
    type metadata accessor for HUControlCenterModulePreview(0);
    v6 = sub_1B93EDF4C();
  }
  swift_unknownObjectRetain();
  return (HUControlCenterModuleViewController *)HUControlCenterModuleViewController.init(delegate:of:itemManager:with:)((uint64_t)a3, a4, a5, v6);
}

- (HUControlCenterModuleViewController)initWithDelegate:(id)a3 ofKind:(int64_t)a4 withPreviews:(id)a5
{
  uint64_t v5;
  uint64_t v7;

  v5 = (uint64_t)a5;
  if (a5)
  {
    type metadata accessor for HUControlCenterModulePreview(0);
    v5 = sub_1B93EDF4C();
  }
  v7 = swift_unknownObjectRetain();
  return (HUControlCenterModuleViewController *)HUControlCenterModuleViewController.init(delegate:of:with:)(v7, a4, v5);
}

- (void)viewDidLoad
{
  HUControlCenterModuleViewController *v2;

  v2 = self;
  HUControlCenterModuleViewController.viewDidLoad()();

}

- (void)viewWillAppear:(BOOL)a3
{
  HUControlCenterModuleViewController *v4;

  v4 = self;
  HUControlCenterModuleViewController.viewWillAppear(_:)(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  HUControlCenterModuleViewController *v4;
  char v5;
  char v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HUControlCenterModuleViewController;
  v4 = self;
  -[HUControllableItemCollectionViewController viewDidAppear:](&v7, sel_viewDidAppear_, v3);
  v5 = sub_1B8F77FF8();
  v6 = *((_BYTE *)&v4->super.super.super.super.super.super.super.isa
       + OBJC_IVAR___HUControlCenterModuleViewController_moduleState);
  *((_BYTE *)&v4->super.super.super.super.super.super.super.isa
  + OBJC_IVAR___HUControlCenterModuleViewController_moduleState) = v5;
  sub_1B8F7725C(v6);
  sub_1B8F783C8();
  sub_1B8F78C74();

}

- (void)viewDidDisappear:(BOOL)a3
{
  HUControlCenterModuleViewController *v4;

  v4 = self;
  HUControlCenterModuleViewController.viewDidDisappear(_:)(a3);

}

- (void)dealloc
{
  HUControlCenterModuleViewController *v2;

  v2 = self;
  sub_1B8F77070();
}

- (void).cxx_destruct
{
  sub_1B8E7A1E8((uint64_t)self + OBJC_IVAR___HUControlCenterModuleViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUControlCenterModuleViewController____lazy_storage___layoutManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUControlCenterModuleViewController_presentedAccessoryControlsViewController));
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUControlCenterModuleViewController_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUControlCenterModuleViewController_supplementalView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUControlCenterModuleViewController_placeholderViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUControlCenterModuleViewController_errorViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR___HUControlCenterModuleViewController_contentMetrics));
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  HUControlCenterModuleViewController *v11;
  uint64_t v13;

  v6 = sub_1B93EB900();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B93EB8C4();
  v10 = a3;
  v11 = self;
  HUControlCenterModuleViewController.cellClass(for:indexPath:)(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  UICollectionViewCell *v6;
  HFItem *v7;
  HUControlCenterModuleViewController *v8;

  v6 = (UICollectionViewCell *)a3;
  v7 = (HFItem *)a4;
  v8 = self;
  HUControlCenterModuleViewController.configureCell(_:for:)(v6, v7);

}

- (BOOL)canReorderItemAtIndexPath:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;

  v3 = sub_1B93EB900();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B93EB8C4();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return 0;
}

- (void)itemManagerDidUpdate:(id)a3
{
  HFItemManager *v4;
  HUControlCenterModuleViewController *v5;

  v4 = (HFItemManager *)a3;
  v5 = self;
  HUControlCenterModuleViewController.itemManagerDidUpdate(_:)(v4);

}

- (id)layoutSectionForSection:(int64_t)a3 layoutEnvironment:(id)a4
{
  HUControlCenterModuleViewController *v7;
  void *v8;

  swift_unknownObjectRetain();
  v7 = self;
  v8 = HUControlCenterModuleViewController.layoutSection(forSection:layoutEnvironment:)(a3, a4);
  swift_unknownObjectRelease();

  return v8;
}

- (id)displayedItemsInSection:(id)a3
{
  HUControlCenterModuleViewController *v4;
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
  return 0;
}

- (CGSize)overrideContentSize
{
  HUControlCenterModuleViewController *v2;
  CGSize v3;
  double width;
  double height;
  CGSize result;

  v2 = self;
  v3 = HUControlCenterModuleViewController.overrideContentSize()();

  width = v3.width;
  height = v3.height;
  result.height = height;
  result.width = width;
  return result;
}

- (id)transform:(id)a3
{
  id v4;
  HUControlCenterModuleViewController *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1B8F82244(v4);

  return v6;
}

- (BOOL)presentationCoordinator:(id)a3 shouldBeginPresentationWithContext:(id)a4
{
  HUQuickControlPresentationCoordinator *v6;
  HUQuickControlPresentationContext *v7;
  HUControlCenterModuleViewController *v8;
  Swift::Bool v9;

  v6 = (HUQuickControlPresentationCoordinator *)a3;
  v7 = (HUQuickControlPresentationContext *)a4;
  v8 = self;
  v9 = HUControlCenterModuleViewController.presentationCoordinator(_:shouldBeginPresentationWith:)(v6, v7);

  return v9;
}

- (BOOL)presentationCoordinator:(id)a3 shouldBeginLongPressPresentationWithContext:(id)a4
{
  id v6;
  id v7;
  HUControlCenterModuleViewController *v8;
  id v9;
  BOOL v10;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = objc_msgSend(v7, sel_item);
  objc_opt_self();
  v10 = swift_dynamicCastObjCClass() == 0;

  return v10;
}

- (id)prepareToPerformToggleActionForItem:(id)a3 sourceItem:(id)a4
{
  id v6;
  id v7;
  HUControlCenterModuleViewController *v8;
  id v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = HUControlCenterModuleViewController.prepareToPerformToggleAction(for:sourceItem:)(v6, v7);

  return v9;
}

- (void)presentationCoordinatorSendTileInteractionEventOfType:(unint64_t)a3 withPresentationContext:(id)a4 presentationCoordinator:(id)a5
{
  id v8;
  id v9;
  HUControlCenterModuleViewController *v10;
  id v11;
  id v12;

  v8 = a4;
  v9 = a5;
  v10 = self;
  v11 = objc_msgSend(v8, sel_item);
  v12 = objc_msgSend(v8, sel_tappedArea);
  sub_1B8FDF3BC(v11, a3, v12);

}

- (BOOL)hasDetailsActionForPresentationCoordinator:(id)a3 item:(id)a4
{
  return 0;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)wantsConfigurationIntent
{
  return 1;
}

- (INIntent)defaultConfigurationIntent
{
  HUControlCenterModuleViewController *v2;
  id v3;

  v2 = self;
  v3 = HUControlCenterModuleViewController.defaultConfigurationIntent.getter();

  return (INIntent *)v3;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  HUControlCenterModuleViewController *v6;

  v6 = self;
  HUControlCenterModuleViewController.setEditing(_:animated:)(a3, a4);

}

- (void)setConfigurationIntent:(id)a3
{
  id v4;
  HUControlCenterModuleViewController *v5;

  v4 = a3;
  v5 = self;
  HUControlCenterModuleViewController.setConfigurationIntent(_:)((INIntent)v4);

}

- (double)preferredExpandedContentHeight
{
  HUControlCenterModuleViewController *v2;
  uint64_t v3;
  double v4;
  CGRect v6;
  CGRect v7;

  v2 = self;
  CCUIScreenBounds();
  CGRectGetWidth(v6);
  CCUIScreenBounds();
  CGRectGetHeight(v7);

  CGSizeMake(v3);
  return v4;
}

- (double)preferredExpandedContentWidth
{
  HUControlCenterModuleViewController *v2;
  uint64_t v3;
  double result;
  CGRect v5;
  CGRect v6;

  v2 = self;
  CCUIScreenBounds();
  CGRectGetWidth(v5);
  CCUIScreenBounds();
  CGRectGetHeight(v6);

  CGSizeMake(v3);
  return result;
}

- (BOOL)providesOwnPlatter
{
  return 1;
}

- (BOOL)shouldPerformHoverInteraction
{
  return 0;
}

- (BOOL)shouldPerformClickInteraction
{
  return 0;
}

- (BOOL)shouldUseCompactContentFrameForExpandedContent
{
  return 1;
}

- (void)willTransitionToExpandedContentMode:(BOOL)a3
{
  HUControlCenterModuleViewController *v4;

  v4 = self;
  HUControlCenterModuleViewController.willTransition(toExpandedContentMode:)(a3);

}

- (BOOL)interpretsLocationAsContent:(CGPoint)a3 inView:(id)a4
{
  CGFloat y;
  CGFloat x;
  UIView *v7;
  HUControlCenterModuleViewController *v8;

  y = a3.y;
  x = a3.x;
  v7 = (UIView *)a4;
  v8 = self;
  LOBYTE(self) = HUControlCenterModuleViewController.interpretsLocationAsContent(_:in:)((CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x), v7);

  return self & 1;
}

- (void)dismissPresentedContentAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void (*v6)(void);
  uint64_t v7;
  HUControlCenterModuleViewController *v8;

  v4 = a3;
  v6 = (void (*)(void))_Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v6;
    v6 = (void (*)(void))sub_1B8F07950;
  }
  else
  {
    v7 = 0;
  }
  v8 = self;
  HUControlCenterModuleViewController.dismissPresentedContent(animated:completion:)(v4, v6, v7);
  sub_1B8E6FE50((uint64_t)v6);

}

- (BOOL)canDismissPresentedContent
{
  HUControlCenterModuleViewController *v2;
  id v3;

  if (*(Class *)((char *)&self->super.super.super.super.super.super.super.isa
                + OBJC_IVAR___HUControlCenterModuleViewController_presentedAccessoryControlsViewController))
    return 1;
  v2 = self;
  v3 = -[HUControlCenterModuleViewController presentedViewController](v2, sel_presentedViewController);

  if (v3)
  {

    return 1;
  }
  return 0;
}

- (double)compactContinuousCornerRadius
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___HUControlCenterModuleViewController_compactContinuousCornerRadius);
  swift_beginAccess();
  return *v2;
}

- (void)setCompactContinuousCornerRadius:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___HUControlCenterModuleViewController_compactContinuousCornerRadius);
  swift_beginAccess();
  *v4 = a3;
}

- (CCUIModuleContentMetrics)contentMetrics
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.super.super.super.super.super.isa
            + OBJC_IVAR___HUControlCenterModuleViewController_contentMetrics);
  swift_beginAccess();
  return (CCUIModuleContentMetrics *)*v2;
}

- (void)setContentMetrics:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.super.super.super.super.super.super.isa
               + OBJC_IVAR___HUControlCenterModuleViewController_contentMetrics);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (unint64_t)contentRenderingMode
{
  return *((unsigned __int8 *)&self->super.super.super.super.super.super.super.isa
         + OBJC_IVAR___HUControlCenterModuleViewController_isPreviewMode);
}

- (void)setContentRenderingMode:(unint64_t)a3
{
  HUControlCenterModuleViewController *v4;

  v4 = self;
  HUControlCenterModuleViewController.contentRenderingMode.setter(a3);

}

- (int64_t)gridSizeClass
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___HUControlCenterModuleViewController_gridSizeClass);
  swift_beginAccess();
  return *v2;
}

- (void)setGridSizeClass:(int64_t)a3
{
  int64_t *v5;
  HUControlCenterModuleViewController *v6;

  v5 = (int64_t *)((char *)self + OBJC_IVAR___HUControlCenterModuleViewController_gridSizeClass);
  swift_beginAccess();
  *v5 = a3;
  v6 = self;
  sub_1B8F7F0F0();

}

- (void)applyGridSizeClass:(int64_t)a3 completionBlock:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  HUControlCenterModuleViewController *v15;
  uint64_t v16;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED57F900);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_1B93EE090();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EF20E5C0;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EF20E5C8;
  v14[5] = v13;
  v15 = self;
  sub_1B901BAB4((uint64_t)v9, (uint64_t)&unk_1EF20E5D0, (uint64_t)v14);
  swift_release();
}

- (id)presentAccessoryControlsForItem:(id)a3
{
  id v4;
  HUControlCenterModuleViewController *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = HUControlCenterModuleViewController.presentAccessoryControls(for:)(v4);

  return v6;
}

- (void)accessoryControlViewControllerFor:(HFAccessoryRepresentableItem *)a3 tileItem:(HFItem *)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  HFAccessoryRepresentableItem *v17;
  HFItem *v18;
  HUControlCenterModuleViewController *v19;
  uint64_t v20;

  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED57F900);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_1B93EE090();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EF20E5A0;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1EF209370;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_1B901BAB4((uint64_t)v11, (uint64_t)&unk_1EF20E5B0, (uint64_t)v16);
  swift_release();
}

- (void)willDismissWithViewController:(id)a3
{
  UIViewController *v4;
  HUControlCenterModuleViewController *v5;

  v4 = (UIViewController *)a3;
  v5 = self;
  HUControlCenterModuleViewController.willDismiss(viewController:)(v4);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  HUControlCenterModuleViewController *v6;

  swift_unknownObjectRetain();
  v6 = self;
  HUControlCenterModuleViewController.viewWillTransition(to:with:)(a4);
  swift_unknownObjectRelease();

}

- (void)homeKitDispatcher:(id)a3 manager:(id)a4 didChangeHome:(id)a5
{
  id v8;
  id v9;
  id v10;
  HUControlCenterModuleViewController *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_1B8F82710(a5);

}

- (NSString)debugDescription
{
  return (NSString *)sub_1B8F819EC(self, (uint64_t)a2, (void (*)(void))HUControlCenterModuleViewController.debugDescription.getter);
}

- (NSString)fullDescription
{
  return (NSString *)sub_1B8F819EC(self, (uint64_t)a2, (void (*)(void))HUControlCenterModuleViewController.fullDescription.getter);
}

- (HUControlCenterModuleViewController)initWithItemManager:(id)a3 collectionViewLayout:(id)a4
{
  id v5;
  id v6;
  HUControlCenterModuleViewController *result;

  v5 = a3;
  v6 = a4;
  result = (HUControlCenterModuleViewController *)_swift_stdlib_reportUnimplementedInitializer();
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

@end
