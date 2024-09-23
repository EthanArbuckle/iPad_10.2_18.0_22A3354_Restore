@implementation CCUIPagingViewController

- (CCUIPagingViewController)initWithModuleInstanceManager:(id)a3 moduleSettingsManager:(id)a4 controlIntentStore:(id)a5 controlDescriptorProvider:(id)a6 controlExtensionProvider:(id)a7
{
  id v10;
  char *v11;
  uint64_t v13;
  _BYTE v14[32];

  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v10 = a7;
  sub_1CFBFABE8();
  swift_unknownObjectRelease();
  sub_1CFBFABE8();
  swift_unknownObjectRelease();
  v11 = sub_1CFBE3994((uint64_t)v14, (uint64_t)&v13, (uint64_t)a5, (uint64_t)a6, v10);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  return (CCUIPagingViewController *)v11;
}

- (CCUIPagingViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1CFBE423C();
}

- (void)dealloc
{
  CCUIPagingViewController *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v2 = self;
  sub_1CFBD487C();
  v4 = v3;
  objc_msgSend(v3, sel_removeKeyObserver_, v2);

  v5 = *(Class *)((char *)&v2->super.super.super.isa + OBJC_IVAR___CCUIPagingViewController_apSubjectMonitorSubscription);
  if (v5)
  {
    objc_msgSend(v5, sel_invalidate);
    v6.receiver = v2;
    v6.super_class = (Class)type metadata accessor for PagingViewController();
    -[CCUIPagingViewController dealloc](&v6, sel_dealloc);
  }
  else
  {
    __break(1u);
  }
}

- (void).cxx_destruct
{
  sub_1CFBB85D8((uint64_t)self + OBJC_IVAR___CCUIPagingViewController_pagingDelegate);
  swift_unknownObjectWeakDestroy();

  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CCUIPagingViewController____lazy_storage___iconEditingSettings));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CCUIPagingViewController____lazy_storage___iconResizeHandleSettings));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CCUIPagingViewController____lazy_storage___smallIconResizeHandleSettings));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CCUIPagingViewController____lazy_storage___editingFeedbackGenerator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CCUIPagingViewController____lazy_storage___editingNotificationFeedbackGenerator));

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CCUIPagingViewController_controlExtensionProvider));

  sub_1CFBB85D8((uint64_t)self + OBJC_IVAR___CCUIPagingViewController_contextDelegate);
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CCUIPagingViewController_expandedViewControllers));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CCUIPagingViewController_expandedViewControllersDispatchGroup));
  swift_unknownObjectWeakDestroy();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CCUIPagingViewController_overrideIconImageViewControllersByDataSource));
  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___CCUIPagingViewController____lazy_storage___moduleContentMetrics));
}

- (CCUIPagingViewControllerDelegate)pagingDelegate
{
  return (CCUIPagingViewControllerDelegate *)sub_1CFBCEAA4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___CCUIPagingViewController_pagingDelegate);
}

- (void)setPagingDelegate:(id)a3
{
  uint64_t v4;
  CCUIPagingViewController *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;

  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  v4 = qword_1ED90AFE0;
  swift_unknownObjectRetain();
  v5 = self;
  if (v4 != -1)
    swift_once();
  v6 = sub_1CFBFA7A4();
  __swift_project_value_buffer(v6, (uint64_t)qword_1ED90AFC0);
  v7 = sub_1CFBFA78C();
  v8 = sub_1CFBFA9F0();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1CFB7D000, v7, v8, "Check for invalid control icon elements.", v9, 2u);
    MEMORY[0x1D17DBCE8](v9, -1, -1);
  }

  sub_1CFBD86DC();
  sub_1CFBD90B0();
  sub_1CFBD9B30();

  swift_unknownObjectRelease();
}

- (void)setContextDelegate:(id)a3
{
  CCUIPagingViewController *v4;

  swift_unknownObjectRetain();
  v4 = self;
  swift_dynamicCastObjCProtocolUnconditional();
  swift_unknownObjectWeakAssign();
  swift_unknownObjectRelease();

}

- (UIScrollView)scrollView
{
  CCUIPagingViewController *v2;
  UIScrollView *result;
  id v4;
  id v5;

  v2 = self;
  -[CCUIPagingViewController loadViewIfNeeded](v2, sel_loadViewIfNeeded);
  result = *(UIScrollView **)((char *)&v2->super.super.super.isa
                            + OBJC_IVAR___CCUIPagingViewController___rootFolderController);
  if (result)
  {
    v4 = -[UIScrollView folderView](result, sel_folderView);
    v5 = objc_msgSend(v4, sel_scrollView);

    return (UIScrollView *)v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (UIView)pageControl
{
  return (UIView *)sub_1CFBCF298(self, (uint64_t)a2, (SEL *)&selRef_pageControl);
}

- (UIView)editingAccessoryView
{
  CCUIPagingViewController *v2;
  UIView *result;
  UIView *v4;

  v2 = self;
  -[CCUIPagingViewController loadViewIfNeeded](v2, sel_loadViewIfNeeded);
  result = *(UIView **)((char *)&v2->super.super.super.isa + OBJC_IVAR___CCUIPagingViewController_addButton);
  if (result)
  {
    v4 = result;

    return v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (unint64_t)pageCount
{
  CCUIPagingViewController *v2;
  unint64_t result;
  id v4;

  v2 = self;
  -[CCUIPagingViewController loadViewIfNeeded](v2, sel_loadViewIfNeeded);
  result = *(unint64_t *)((char *)&v2->super.super.super.isa
                               + OBJC_IVAR___CCUIPagingViewController___rootFolderController);
  if (result)
  {
    v4 = objc_msgSend((id)result, sel_iconListViewCount);

    return (unint64_t)v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (CGSize)contentLayoutSize
{
  CCUIPagingViewController *v2;
  double v3;
  double v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  v2 = self;
  -[CCUIPagingViewController loadViewIfNeeded](v2, sel_loadViewIfNeeded);
  v5 = *(Class *)((char *)&v2->super.super.super.isa + OBJC_IVAR___CCUIPagingViewController___rootFolderController);
  if (v5)
  {
    v6 = objc_msgSend(v5, sel_folderView);
    sub_1CFBEC974();
    v8 = v7;
    v10 = v9;

    v3 = v8;
    v4 = v10;
  }
  else
  {
    __break(1u);
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (UIEdgeInsets)additionalContentInsets
{
  CCUIPagingViewController *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  char *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  UIEdgeInsets result;

  v2 = self;
  -[CCUIPagingViewController loadViewIfNeeded](v2, sel_loadViewIfNeeded);
  v7 = *(Class *)((char *)&v2->super.super.super.isa + OBJC_IVAR___CCUIPagingViewController___rootFolderController);
  if (v7)
  {
    v8 = (char *)objc_msgSend(v7, sel_folderView);
    v9 = *(double *)&v8[OBJC_IVAR____TtC15ControlCenterUI18IconListFolderView_additionalLayoutInsets];
    v10 = *(double *)&v8[OBJC_IVAR____TtC15ControlCenterUI18IconListFolderView_additionalLayoutInsets + 8];
    v11 = *(double *)&v8[OBJC_IVAR____TtC15ControlCenterUI18IconListFolderView_additionalLayoutInsets + 16];
    v12 = *(double *)&v8[OBJC_IVAR____TtC15ControlCenterUI18IconListFolderView_additionalLayoutInsets + 24];

    v3 = v9;
    v4 = v10;
    v5 = v11;
    v6 = v12;
  }
  else
  {
    __break(1u);
  }
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (void)setAdditionalContentInsets:(UIEdgeInsets)a3
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  CCUIPagingViewController *v7;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v7 = self;
  sub_1CFBCE4E8(top, left, bottom, right);

}

- (CGPoint)additionalContentOffset
{
  CCUIPagingViewController *v2;
  double v3;
  double v4;
  void *v5;
  char *v6;
  double v7;
  double v8;
  CGPoint result;

  v2 = self;
  -[CCUIPagingViewController loadViewIfNeeded](v2, sel_loadViewIfNeeded);
  v5 = *(Class *)((char *)&v2->super.super.super.isa + OBJC_IVAR___CCUIPagingViewController___rootFolderController);
  if (v5)
  {
    v6 = (char *)objc_msgSend(v5, sel_folderView);
    v7 = *(double *)&v6[OBJC_IVAR____TtC15ControlCenterUI18IconListFolderView_additionalLayoutOffset];
    v8 = *(double *)&v6[OBJC_IVAR____TtC15ControlCenterUI18IconListFolderView_additionalLayoutOffset + 8];

    v3 = v7;
    v4 = v8;
  }
  else
  {
    __break(1u);
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (void)setAdditionalContentOffset:(CGPoint)a3
{
  double y;
  double x;
  CCUIPagingViewController *v5;

  y = a3.y;
  x = a3.x;
  v5 = self;
  sub_1CFBCE8A0(x, y);

}

- (UILongPressGestureRecognizer)longPressToEditGestureRecognizer
{
  return (UILongPressGestureRecognizer *)sub_1CFBCEAA4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___CCUIPagingViewController_longPressToEditGestureRecognizer);
}

- (void)setLongPressToEditGestureRecognizer:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  CCUIPagingViewController *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;

  swift_beginAccess();
  v5 = swift_unknownObjectWeakAssign();
  v6 = MEMORY[0x1D17DBD84](v5);
  if (v6)
  {
    v7 = (void *)v6;
    v8 = a3;
    v9 = self;
    sub_1CFBD487C();
    v11 = v10;
    objc_msgSend(v10, sel_longPressToEditDuration);
    v13 = v12;

    objc_msgSend(v7, sel_setMinimumPressDuration_, v13);
  }
}

- (BOOL)canDismissPresentedContent
{
  CCUIPagingViewController *v2;
  char v3;

  v2 = self;
  v3 = sub_1CFBCEEAC();

  return v3 & 1;
}

- (UIView)topmostContentView
{
  CCUIPagingViewController *v2;
  UIView *result;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v2 = self;
  result = (UIView *)-[CCUIPagingViewController loadViewIfNeeded](v2, sel_loadViewIfNeeded);
  v4 = *(Class *)((char *)&v2->super.super.super.isa + OBJC_IVAR___CCUIPagingViewController___rootFolderController);
  if (v4)
  {
    v5 = v4;
    sub_1CFBC2370();
    v7 = v6;

    return (UIView *)v7;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (BOOL)interpretsLocationAsContent:(CGPoint)a3 in:(id)a4
{
  double y;
  double x;
  id v7;
  CCUIPagingViewController *v8;
  BOOL result;
  void *v10;
  id v11;
  char v12;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = self;
  result = -[CCUIPagingViewController loadViewIfNeeded](v8, sel_loadViewIfNeeded);
  v10 = *(Class *)((char *)&v8->super.super.super.isa + OBJC_IVAR___CCUIPagingViewController___rootFolderController);
  if (v10)
  {
    v11 = v10;
    v12 = sub_1CFBC2954(v7, x, y);

    return v12 & 1;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (id)queryAllTopLevelBlockingGestureRecognizers
{
  CCUIPagingViewController *v2;
  id result;
  void *v4;
  id v5;
  void *v6;

  v2 = self;
  result = -[CCUIPagingViewController loadViewIfNeeded](v2, sel_loadViewIfNeeded);
  v4 = *(Class *)((char *)&v2->super.super.super.isa + OBJC_IVAR___CCUIPagingViewController___rootFolderController);
  if (v4)
  {
    v5 = v4;
    sub_1CFBC2B04();

    sub_1CFBBAA24(0, (unint64_t *)&unk_1ED90ADF0);
    v6 = (void *)sub_1CFBFA8F4();
    swift_bridgeObjectRelease();
    return v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (CCUIInteractivePaging)interactivePagingCoordinator
{
  return (CCUIInteractivePaging *)sub_1CFBCF298(self, (uint64_t)a2, (SEL *)&selRef_folderView);
}

- (void)scrollToDefaultPageAnimated:(BOOL)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  CCUIPagingViewController *v8;

  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_1CFBE7EF8;
  }
  else
  {
    v7 = 0;
  }
  v8 = self;
  sub_1CFBCF350(a3, v6, v7);
  sub_1CFBB8538((uint64_t)v6);

}

- (void)willBecomeActive
{
  CCUIPagingViewController *v2;

  v2 = self;
  sub_1CFBCF504();

}

- (void)willResignActive
{
  CCUIPagingViewController *v2;

  v2 = self;
  sub_1CFBCF55C();

}

- (void)displayWillTurnOff
{
  CCUIPagingViewController *v2;

  v2 = self;
  sub_1CFBCF6D4();

}

- (unint64_t)moduleRowCount
{
  CCUIPagingViewController *v2;
  unint64_t result;
  CCUIPagingViewController *v4;
  CCUIPagingViewController *v5;
  id v6;

  v2 = self;
  -[CCUIPagingViewController loadViewIfNeeded](v2, sel_loadViewIfNeeded);
  result = *(unint64_t *)((char *)&v2->super.super.super.isa
                               + OBJC_IVAR___CCUIPagingViewController___rootFolderController);
  if (result)
  {
    v4 = (CCUIPagingViewController *)objc_msgSend((id)result, sel_currentIconListModel);
    if (v4)
    {
      v5 = v4;
      v6 = -[CCUIPagingViewController numberOfUsedRows](v4, sel_numberOfUsedRows);

      v2 = v5;
    }
    else
    {
      v6 = 0;
    }

    return (unint64_t)v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (id)moduleViewForIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  CCUIPagingViewController *v7;
  id v8;

  v4 = sub_1CFBFA894();
  v6 = v5;
  v7 = self;
  v8 = sub_1CFBCF940(v4, v6);

  swift_bridgeObjectRelease();
  return v8;
}

- (int64_t)expandedModuleCount
{
  void *v2;
  CCUIPagingViewController *v3;
  id v4;
  unint64_t v5;
  int64_t v6;

  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CCUIPagingViewController_expandedViewControllers);
  v3 = self;
  v4 = objc_msgSend(v2, sel_allObjects);
  sub_1CFBBAA24(0, &qword_1ED90AF10);
  v5 = sub_1CFBFA900();

  if (v5 >> 62)
  {
    swift_bridgeObjectRetain();
    v6 = sub_1CFBFAD2C();

    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);

  }
  swift_bridgeObjectRelease();
  return v6;
}

- (BOOL)isModuleExpandedForIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  CCUIPagingViewController *v8;
  id v9;
  unint64_t v10;

  v4 = sub_1CFBFA894();
  v6 = v5;
  v7 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CCUIPagingViewController_expandedViewControllers);
  v8 = self;
  v9 = objc_msgSend(v7, sel_allObjects);
  sub_1CFBBAA24(0, &qword_1ED90AF10);
  v10 = sub_1CFBFA900();

  swift_bridgeObjectRetain();
  LOBYTE(v4) = sub_1CFBE32E4(v10, v4, v6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  return v4 & 1;
}

- (void)expandModuleWithIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  CCUIPagingViewController *v7;

  v4 = sub_1CFBFA894();
  v6 = v5;
  v7 = self;
  sub_1CFBCFEF4(v4, v6);

  swift_bridgeObjectRelease();
}

- (void)expandModuleWithIdentifier:(id)a3 uniqueIdentifier:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CCUIPagingViewController *v14;
  uint64_t v15;

  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED90AF90);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1CFBFA894();
  v11 = v10;
  if (a4)
  {
    sub_1CFBFA6C0();
    v12 = sub_1CFBFA6D8();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v8, 0, 1, v12);
  }
  else
  {
    v13 = sub_1CFBFA6D8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v8, 1, 1, v13);
  }
  v14 = self;
  sub_1CFBD0120(v9, v11, (uint64_t)v8);

  swift_bridgeObjectRelease();
  sub_1CFBE7CCC((uint64_t)v8, (uint64_t *)&unk_1ED90AF90);
}

- (void)enumerateDisplayedModuleViewsWithBlock:(id)a3
{
  void *v4;
  CCUIPagingViewController *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_1CFBE4580((void (*)(void *, uint64_t))v5, (uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);

}

- (void)dismissExpandedModuleAnimated:(BOOL)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  CCUIPagingViewController *v8;

  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_1CFBE7EF8;
  }
  else
  {
    v7 = 0;
  }
  v8 = self;
  sub_1CFBD0C6C(a3, v6, v7);
  sub_1CFBB8538((uint64_t)v6);

}

- (void)dismissPresentedContentAnimated:(BOOL)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  CCUIPagingViewController *v8;

  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_1CFBE78C8;
  }
  else
  {
    v7 = 0;
  }
  v8 = self;
  sub_1CFBD13D4(a3, v6, v7);
  sub_1CFBB8538((uint64_t)v6);

}

- (SBHIconModel)iconModel
{
  return (SBHIconModel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                 + OBJC_IVAR___CCUIPagingViewController_iconModel));
}

- (void)addIfNecessaryAndScrollToControlMatchingDescriptor:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  CCUIPagingViewController *v7;

  v4 = a4;
  v6 = a3;
  v7 = self;
  sub_1CFBD188C(v6, v4);

}

- (void)viewDidLoad
{
  CCUIPagingViewController *v2;

  v2 = self;
  sub_1CFBD2E70();

}

- (void)viewWillAppear:(BOOL)a3
{
  CCUIPagingViewController *v4;

  v4 = self;
  sub_1CFBD3EAC(a3);

}

- (void)viewIsAppearing:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PagingViewController();
  v4 = v5.receiver;
  -[CCUIPagingViewController viewIsAppearing:](&v5, sel_viewIsAppearing_, v3);
  sub_1CFBD7D3C();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for PagingViewController();
  v4 = v7.receiver;
  -[CCUIPagingViewController viewDidAppear:](&v7, sel_viewDidAppear_, v3);
  v5 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance, v7.receiver, v7.super_class);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, sel_incrementUserInvocationCount);

  }
  else
  {
    __break(1u);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  CCUIPagingViewController *v4;

  v4 = self;
  sub_1CFBD41B0(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  CCUIPagingViewController *v4;

  v4 = self;
  sub_1CFBD446C(a3);

}

- (void)viewWillLayoutSubviews
{
  CCUIPagingViewController *v2;

  v2 = self;
  sub_1CFBD473C();

}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)ccui_shouldPropagateAppearanceCalls
{
  return 1;
}

- (BOOL)isEditing
{
  return *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR___CCUIPagingViewController__isEditing);
}

- (void)setEditing:(BOOL)a3
{
  CCUIPagingViewController *v4;

  v4 = self;
  sub_1CFBD5458(a3);

}

- (void)resetEndEditingTimerIfNecessary
{
  CCUIPagingViewController *v2;

  v2 = self;
  _s15ControlCenterUI20PagingViewControllerC15iconDragManager_0gE0011willAnimateH16LiftWithAnimator7sessionySo06SBIconhI0C_So0pE0CSo15UIDragAnimating_pSo0Q7Session_ptF_0();

}

- (void)changeGridSizeClassOfIcon:(id)a3 toGridSizeClass:(id)a4
{
  id v6;
  id v7;
  CCUIPagingViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1CFBDBE2C((uint64_t)v6, (uint64_t)v7);

}

- (CCUIPagingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  CCUIPagingViewController *result;

  v4 = a4;
  result = (CCUIPagingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  char *v6;
  void *v7;
  id v8;
  CCUIPagingViewController *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;

  if (a4)
    sub_1CFBFA894();
  v6 = (char *)self + OBJC_IVAR___CCUIPagingViewController_longPressToEditGestureRecognizer;
  swift_beginAccess();
  v7 = (void *)MEMORY[0x1D17DBD84](v6);
  v8 = a3;
  if (v7)
  {
    v9 = self;
    sub_1CFBD487C();
    v11 = v10;
    objc_msgSend(v10, sel_longPressToEditDuration);
    v13 = v12;

    objc_msgSend(v7, sel_setMinimumPressDuration_, v13);
    swift_bridgeObjectRelease();

  }
  else
  {
    swift_bridgeObjectRelease();
  }

}

- (CGSize)controlCenterGridSizeForContentModuleContainerViewController:(id)a3
{
  id v4;
  CCUIPagingViewController *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  v4 = a3;
  v5 = self;
  _s15ControlCenterUI20PagingViewControllerC07controlB8GridSize3forSo6CGSizeVSo026CCUIContentModuleContainereF0C_tF_0();
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (id)compactModeSourceViewForContentModuleContainerViewController:(id)a3
{
  id v4;
  CCUIPagingViewController *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = _s15ControlCenterUI20PagingViewControllerC017compactModeSourceE03forSo6UIViewCSgSo026CCUIContentModuleContainereF0C_tF_0(v4);

  return v6;
}

- (CGRect)compactModeFrameForContentModuleContainerViewController:(id)a3
{
  CCUIContentModuleContainerViewController *v4;
  CCUIPagingViewController *v5;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v10;
  double v11;
  double v12;
  double v13;
  __C::CGRect v14;
  CGRect result;

  v4 = (CCUIContentModuleContainerViewController *)a3;
  v5 = self;
  v14 = PagingViewController.compactModeFrame(for:)(v4);
  x = v14.origin.x;
  y = v14.origin.y;
  width = v14.size.width;
  height = v14.size.height;

  v10 = x;
  v11 = y;
  v12 = width;
  v13 = height;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (BOOL)contentModuleContainerViewController:(id)a3 canBeginInteractionWithModule:(id)a4
{
  id v5;
  CCUIPagingViewController *v6;
  BOOL v7;
  id v8;
  unint64_t v9;
  uint64_t v10;

  v5 = a3;
  swift_unknownObjectRetain();
  v6 = self;
  if (-[CCUIPagingViewController isEditing](v6, sel_isEditing))
  {
    swift_unknownObjectRelease();

    v7 = 0;
  }
  else
  {
    v8 = objc_msgSend(*(id *)((char *)&v6->super.super.super.isa + OBJC_IVAR___CCUIPagingViewController_expandedViewControllers), sel_allObjects);
    sub_1CFBBAA24(0, &qword_1ED90AF10);
    v9 = sub_1CFBFA900();

    if (v9 >> 62)
    {
      swift_bridgeObjectRetain();
      v10 = sub_1CFBFAD2C();
      swift_unknownObjectRelease();

      swift_bridgeObjectRelease();
    }
    else
    {
      v10 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_unknownObjectRelease();

    }
    swift_bridgeObjectRelease();
    v7 = v10 == 0;
  }

  return v7;
}

- (void)contentModuleContainerViewController:(id)a3 willOpenExpandedModule:(id)a4
{
  sub_1CFBDD124(self, (uint64_t)a2, a3, (uint64_t)a4, _s15ControlCenterUI20PagingViewControllerC022contentModuleContainereF0_016willOpenExpandedH0ySo011CCUIContenthieF0C_So0mH0_ptF_0);
}

- (void)contentModuleContainerViewController:(id)a3 didOpenExpandedModule:(id)a4
{
  char *v6;
  uint64_t v7;
  void *v8;
  id v9;
  CCUIPagingViewController *v10;

  v6 = (char *)self + OBJC_IVAR___CCUIPagingViewController_pagingDelegate;
  swift_beginAccess();
  v7 = MEMORY[0x1D17DBD84](v6);
  if (v7)
  {
    v8 = (void *)v7;
    v9 = a3;
    swift_unknownObjectRetain();
    v10 = self;
    objc_msgSend(v8, sel_pagingViewController_didExpand_, v10, v9);

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
  }
}

- (void)contentModuleContainerViewController:(id)a3 willCloseExpandedModule:(id)a4
{
  void *v5;
  id v6;
  CCUIPagingViewController *v7;
  char *v8;
  void *v9;

  v5 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CCUIPagingViewController_expandedViewControllers);
  v6 = a3;
  swift_unknownObjectRetain();
  v7 = self;
  objc_msgSend(v5, sel_removeObject_, v6);
  v8 = (char *)v7 + OBJC_IVAR___CCUIPagingViewController_pagingDelegate;
  swift_beginAccess();
  v9 = (void *)MEMORY[0x1D17DBD84](v8);
  if (v9)
  {
    objc_msgSend(v9, sel_pagingViewController_willClose_, v7, v6);
    swift_unknownObjectRelease();
  }
  sub_1CFBD78A8(0, v6);

  swift_unknownObjectRelease();
}

- (void)contentModuleContainerViewController:(id)a3 didCloseExpandedModule:(id)a4
{
  sub_1CFBDD124(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(id))_s15ControlCenterUI20PagingViewControllerC022contentModuleContainereF0_016didCloseExpandedH0ySo011CCUIContenthieF0C_So0mH0_ptF_0);
}

- (void)contentModuleContainerViewController:(id)a3 willPresentViewController:(id)a4
{
  sub_1CFBDD260((char *)self, (uint64_t)a2, a3, a4, (SEL *)&selRef_pagingViewController_willPresent_, 1);
}

- (void)contentModuleContainerViewController:(id)a3 willDismissViewController:(id)a4
{
  sub_1CFBDD260((char *)self, (uint64_t)a2, a3, a4, (SEL *)&selRef_pagingViewController_willDismiss_, 0);
}

- (void)contentModuleContainerViewControllerDismissPresentedContent:(id)a3
{
  id v4;
  CCUIPagingViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1CFBD13D4(1, 0, 0);

}

- (unint64_t)viewMap:(id)a3 maxRecycledViewsOfClass:(Class)a4
{
  return *(unint64_t *)((char *)&self->super.super.super.isa
                             + OBJC_IVAR___CCUIPagingViewController_maximumNumberOfIconViewsInHierarchy);
}

- (id)recycledViewsContainerProviderForViewMap:(id)a3
{
  id v4;
  CCUIPagingViewController *v5;
  id result;
  id v7;
  id v8;
  void *v9;

  v4 = a3;
  v5 = self;
  result = -[CCUIPagingViewController view](v5, sel_view);
  if (result)
  {
    v7 = result;
    v8 = objc_msgSend(result, sel_window);

    if (v8)
    {
      v9 = (void *)swift_dynamicCastObjCProtocolConditional();

      if (!v9)
    }
    else
    {

      v9 = 0;
    }
    return v9;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (Class)controllerClassForFolder:(id)a3
{
  type metadata accessor for IconListFolderController();
  return (Class)swift_getObjCClassFromMetadata();
}

- (BOOL)folderController:(id)a3 canChangeCurrentPageIndexToIndex:(int64_t)a4
{
  return 1;
}

- (BOOL)folderControllerShouldClose:(id)a3 withPinchGesture:(id)a4
{
  return 0;
}

- (void)folderControllerWillBeginScrolling:(id)a3
{
  id v4;
  void *v5;
  CCUIPagingViewController *v6;

  v4 = a3;
  v6 = self;
  sub_1CFBD65BC(0x63537265646C6F66, 0xEF676E696C6C6F72);
  v5 = *(Class *)((char *)&v6->super.super.super.isa + OBJC_IVAR___CCUIPagingViewController_iconDragManager);
  if (v5)
  {
    objc_msgSend(v5, sel_noteFolderBeganScrolling);

  }
  else
  {
    __break(1u);
  }
}

- (void)folderControllerDidEndScrolling:(id)a3
{
  _QWORD **v5;
  uint64_t v6;
  char v7;
  unint64_t v8;
  id v9;
  CCUIPagingViewController *v10;
  id v11;
  CCUIPagingViewController *v12;

  v5 = (_QWORD **)((char *)self + OBJC_IVAR___CCUIPagingViewController_endEditingTimerSuppressionReasons);
  swift_beginAccess();
  v6 = sub_1CFBD66C8(0x63537265646C6F66, 0xEF676E696C6C6F72, *v5);
  if ((v7 & 1) != 0)
  {
    v11 = a3;
    v12 = self;
  }
  else
  {
    v8 = v6;
    swift_beginAccess();
    v9 = a3;
    v10 = self;
    sub_1CFBD67AC(v8);
    swift_endAccess();
    swift_bridgeObjectRelease();
  }
  _s15ControlCenterUI20PagingViewControllerC15iconDragManager_0gE0011willAnimateH16LiftWithAnimator7sessionySo06SBIconhI0C_So0pE0CSo15UIDragAnimating_pSo0Q7Session_ptF_0();

}

- (id)draggingDelegateForFolderController:(id)a3
{
  id result;

  result = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CCUIPagingViewController_iconDragManager);
  if (result)
    return result;
  __break(1u);
  return result;
}

- (id)customImageViewControllerForIconView:(id)a3
{
  id v4;
  CCUIPagingViewController *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = PagingViewController.customImageViewController(for:)(v4);

  return v6;
}

- (id)draggingDelegateForIconView:(id)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                 + OBJC_IVAR___CCUIPagingViewController_iconDragManager));
}

- (BOOL)icon:(id)a3 canReceiveGrabbedIcon:(id)a4
{
  return 0;
}

- (BOOL)iconViewDisplaysLabel:(id)a3
{
  return 0;
}

- (BOOL)iconViewDisplaysResizeHandle:(id)a3
{
  id v4;
  CCUIPagingViewController *v5;
  id v6;
  void *v7;
  unsigned __int8 v8;

  v4 = a3;
  v5 = self;
  v6 = objc_msgSend(v4, sel_icon);
  if (v6)
  {
    v7 = v6;
    v8 = objc_msgSend(v6, sel_isPlaceholder);

    return v8 ^ 1;
  }
  else
  {

    return 1;
  }
}

- (SBIconResizeHandleMetrics)resizeHandleMetricsForIconView:(SEL)a3
{
  id v6;
  CCUIPagingViewController *v7;
  double v8;
  int64_t v9;
  SBIconResizeHandleMetrics *result;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _OWORD v14[2];
  double v15;
  int64_t v16;
  __int128 v17;
  __int128 v18;

  v6 = a4;
  v7 = self;
  PagingViewController.resizeHandleMetrics(for:)(v6, (uint64_t)v14);
  v8 = v15;
  v9 = v16;

  v11 = v14[1];
  v12 = v17;
  v13 = v18;
  *(_OWORD *)&retstr->var0 = v14[0];
  *(_OWORD *)&retstr->var2 = v11;
  retstr->var4 = v8;
  retstr->var5 = v9;
  *(_OWORD *)&retstr->var6.top = v12;
  *(_OWORD *)&retstr->var6.bottom = v13;
  return result;
}

- (id)resizeGestureHandlerForIconView:(id)a3
{
  id v4;
  CCUIPagingViewController *v5;
  _QWORD *v6;

  v4 = a3;
  v5 = self;
  v6 = PagingViewController.resizeGestureHandler(for:)(v4);

  return v6;
}

- (int64_t)closeBoxTypeForIconView:(id)a3
{
  return 1;
}

- (id)gridSizeClassDomainForIconView:(id)a3
{
  return objc_msgSend((id)objc_opt_self(), sel_controlCenterDomain);
}

- (void)iconTapped:(id)a3
{
  id v4;
  CCUIPagingViewController *v5;

  v4 = a3;
  v5 = self;
  PagingViewController.iconTapped(_:)(v4);

}

- (void)iconCloseBoxTapped:(id)a3
{
  CCUIPagingViewController *v4;
  CCUIPagingViewController *v5;
  CCUIPagingViewController *v6;
  CCUIPagingViewController *v7;

  v4 = (CCUIPagingViewController *)a3;
  v7 = self;
  if (-[CCUIPagingViewController isEditing](v7, sel_isEditing))
  {
    v5 = (CCUIPagingViewController *)-[CCUIPagingViewController icon](v4, sel_icon);
    if (v5)
    {
      v6 = v5;
      sub_1CFBD6888((uint64_t)v5);
      _s15ControlCenterUI20PagingViewControllerC15iconDragManager_0gE0011willAnimateH16LiftWithAnimator7sessionySo06SBIconhI0C_So0pE0CSo15UIDragAnimating_pSo0Q7Session_ptF_0();

      v4 = v7;
      v7 = v6;
    }
  }

}

- (BOOL)iconView:(id)a3 supportsConfigurationForDataSource:(id)a4
{
  id v5;
  CCUIPagingViewController *v6;
  char v7;

  v5 = a3;
  swift_unknownObjectRetain();
  v6 = self;
  v7 = sub_1CFBE554C();

  swift_unknownObjectRelease();
  return v7 & 1;
}

- (id)iconView:(id)a3 configurationInteractionForDataSource:(id)a4
{
  id v5;
  CCUIPagingViewController *v6;
  id v7;

  v5 = a3;
  swift_unknownObjectRetain();
  v6 = self;
  v7 = PagingViewController.iconView(_:configurationInteractionFor:)(v5);

  swift_unknownObjectRelease();
  return v7;
}

- (id)iconView:(id)a3 containerViewForConfigurationInteraction:(id)a4
{
  id v5;
  CCUIPagingViewController *v6;
  id result;
  id v8;

  v5 = a3;
  swift_unknownObjectRetain();
  v6 = self;
  result = -[CCUIPagingViewController view](v6, sel_view);
  if (result)
  {
    v8 = result;

    swift_unknownObjectRelease();
    return v8;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (CGRect)iconView:(id)a3 contentBoundingRectForConfigurationInteraction:(id)a4
{
  id v5;
  CCUIPagingViewController *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  v5 = a3;
  swift_unknownObjectRetain();
  v6 = self;
  v7 = -[CCUIPagingViewController view](v6, sel_view);
  if (v7)
  {
    v12 = v7;
    objc_msgSend(v7, sel_bounds);
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;

    swift_unknownObjectRelease();
    v8 = v14;
    v9 = v16;
    v10 = v18;
    v11 = v20;
  }
  else
  {
    __break(1u);
  }
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (double)verticalMarginPercentageForConfigurationOfIconView:(id)a3
{
  return 0.2;
}

- (void)iconView:(id)a3 configurationDidUpdateWithInteraction:(id)a4
{
  id v6;
  CCUIPagingViewController *v7;

  v6 = a3;
  swift_unknownObjectRetain();
  v7 = self;
  PagingViewController.iconView(_:configurationDidUpdateWith:)(v6, a4);

  swift_unknownObjectRelease();
}

- (void)iconView:(id)a3 configurationWillBeginWithInteraction:(id)a4
{
  id v5;
  CCUIPagingViewController *v6;

  v5 = a3;
  swift_unknownObjectRetain();
  v6 = self;
  sub_1CFBD65BC(0xD00000000000001FLL, 0x80000001CFC05FC0);
  swift_unknownObjectWeakAssign();

  swift_unknownObjectRelease();
}

- (void)iconView:(id)a3 configurationDidEndWithInteraction:(id)a4
{
  id v5;
  CCUIPagingViewController *v6;

  v5 = a3;
  swift_unknownObjectRetain();
  v6 = self;
  _s15ControlCenterUI20PagingViewControllerC04iconE0_23configurationDidEndWithySo06SBIconE0C_So07SBHIconE24ConfigurationInteraction_ptF_0();

  swift_unknownObjectRelease();
}

- (BOOL)iconDragManager:(id)a3 canBeginIconDragForIconView:(id)a4
{
  return -[CCUIPagingViewController isEditing](self, sel_isEditing, a3, a4);
}

- (BOOL)iconDragManager:(id)a3 canAcceptDropInSession:(id)a4 inIconListView:(id)a5
{
  return 1;
}

- (id)iconDragManager:(id)a3 dragItemsForIconView:(id)a4
{
  id v6;
  id v7;
  CCUIPagingViewController *v8;
  id result;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  v8 = self;
  result = objc_msgSend(v7, sel_icon);
  if (result)
  {
    v10 = result;
    v11 = (void *)sub_1CFBFA870();
    v12 = (id)SBHIconDragItemWithIconAndIconView();

    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFBF1DF0);
    v13 = swift_allocObject();
    *(_OWORD *)(v13 + 16) = xmmword_1CFC02270;
    *(_QWORD *)(v13 + 32) = v12;
    sub_1CFBFA918();

    sub_1CFBBAA24(0, &qword_1EFBF1758);
    v14 = (void *)sub_1CFBFA8F4();
    swift_bridgeObjectRelease();
    return v14;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (BOOL)iconDragManager:(id)a3 doesIconViewRepresentRealIconPosition:(id)a4
{
  return 1;
}

- (void)iconDragManager:(id)a3 iconView:(id)a4 willAnimateDragLiftWithAnimator:(id)a5 session:(id)a6
{
  id v8;
  id v9;
  CCUIPagingViewController *v10;

  v8 = a3;
  v9 = a4;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v10 = self;
  _s15ControlCenterUI20PagingViewControllerC15iconDragManager_0gE0011willAnimateH16LiftWithAnimator7sessionySo06SBIconhI0C_So0pE0CSo15UIDragAnimating_pSo0Q7Session_ptF_0();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

}

- (void)iconDragManagerIconDraggingDidChange:(id)a3
{
  id v4;
  CCUIPagingViewController *v5;

  v4 = a3;
  v5 = self;
  _s15ControlCenterUI20PagingViewControllerC15iconDragManager_0gE0011willAnimateH16LiftWithAnimator7sessionySo06SBIconhI0C_So0pE0CSo15UIDragAnimating_pSo0Q7Session_ptF_0();

}

- (void)iconDragManager:(id)a3 iconView:(id)a4 willBeginDragSession:(id)a5
{
  id v7;
  id v8;
  CCUIPagingViewController *v9;

  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR___CCUIPagingViewController_allowsIconAdornments) = 0;
  v7 = a3;
  v8 = a4;
  swift_unknownObjectRetain();
  v9 = self;
  sub_1CFBD6FF4();

  swift_unknownObjectRelease();
}

- (void)iconDragManagerUserActiveIconDraggingDidChange:(id)a3
{
  id v4;
  CCUIPagingViewController *v5;

  v4 = a3;
  v5 = self;
  if ((objc_msgSend(v4, sel_isTrackingUserActiveIconDrags) & 1) == 0)
  {
    *((_BYTE *)&v5->super.super.super.isa + OBJC_IVAR___CCUIPagingViewController_allowsIconAdornments) = 1;
    sub_1CFBD6FF4();
  }

}

- (id)windowForIconDragPreviewsForIconDragManager:(id)a3 forWindowScene:(id)a4
{
  id v6;
  id v7;
  CCUIPagingViewController *v8;
  id v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1CFBE585C(v7);

  return v9;
}

- (id)iconDragManager:(id)a3 dragPreviewForIconView:(id)a4
{
  id v6;
  id v7;
  CCUIPagingViewController *v8;
  char *v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1CFBE596C(v7);

  return v9;
}

- (id)rootViewForIconDragManager:(id)a3
{
  id v4;
  CCUIPagingViewController *v5;
  id result;
  id v7;

  v4 = a3;
  v5 = self;
  -[CCUIPagingViewController loadViewIfNeeded](v5, sel_loadViewIfNeeded);
  result = *(Class *)((char *)&v5->super.super.super.isa + OBJC_IVAR___CCUIPagingViewController___rootFolderController);
  if (result)
  {
    result = objc_msgSend(result, sel_view);
    if (result)
    {
      v7 = result;

      return v7;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

- (BOOL)iconDragManager:(id)a3 canAddDragItemsToSession:(id)a4 fromIconView:(id)a5
{
  return 0;
}

- (BOOL)allowsNestedFoldersForIconDragManager:(id)a3
{
  return 0;
}

- (id)rootFolderForIconDragManager:(id)a3
{
  id v4;
  CCUIPagingViewController *v5;
  id result;

  v4 = a3;
  v5 = self;
  -[CCUIPagingViewController loadViewIfNeeded](v5, sel_loadViewIfNeeded);
  result = *(Class *)((char *)&v5->super.super.super.isa + OBJC_IVAR___CCUIPagingViewController___rootFolderController);
  if (result)
  {
    result = objc_msgSend(result, sel_folder);
    if (result)
    {

      objc_opt_self();
      return (id)swift_dynamicCastObjCClassUnconditional();
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

- (id)iconListViewForIndexPath:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  CCUIPagingViewController *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v13;

  v4 = sub_1CFBFA714();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CFBFA708();
  v8 = self;
  v9 = sub_1CFBD7B94();
  v11 = v10;

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v11;
}

- (unint64_t)listGridCellInfoOptionsForIconDragManager:(id)a3
{
  id v4;
  CCUIPagingViewController *v5;
  unint64_t result;
  void *v7;
  id v8;

  v4 = a3;
  v5 = self;
  result = (unint64_t)-[CCUIPagingViewController loadViewIfNeeded](v5, sel_loadViewIfNeeded);
  v7 = *(Class *)((char *)&v5->super.super.super.isa + OBJC_IVAR___CCUIPagingViewController___rootFolderController);
  if (v7)
  {
    v8 = objc_msgSend((id)objc_opt_self(), sel_gridCellInfoOptionsWithInterfaceOrientation_reversedLayout_, objc_msgSend(v7, sel_orientation), 0);

    return (unint64_t)v8;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (id)iconViewQueryableForIconDragManager:(void *)a3
{
  id v4;
  char *v5;
  id result;
  id v7;

  v4 = a3;
  v5 = a1;
  objc_msgSend(v5, sel_loadViewIfNeeded);
  result = *(id *)&v5[OBJC_IVAR___CCUIPagingViewController___rootFolderController];
  if (result)
  {
    v7 = result;

    return v7;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (BOOL)allowsSnappingIconsToGridForIconDragManager:(id)a3
{
  return 1;
}

- (BOOL)iconDragManager:(id)a3 canSnapIconsToGridInLocation:(id)a4
{
  return 1;
}

- (void)layoutIconListsWithAnimationType:(int64_t)a3 forceRelayout:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  CCUIPagingViewController *v7;

  v4 = a4;
  v7 = self;
  -[CCUIPagingViewController loadViewIfNeeded](v7, sel_loadViewIfNeeded);
  v6 = *(Class *)((char *)&v7->super.super.super.isa + OBJC_IVAR___CCUIPagingViewController___rootFolderController);
  if (v6)
  {
    objc_msgSend(v6, sel_layoutIconListsWithAnimationType_forceRelayout_, a3, v4);

  }
  else
  {
    __break(1u);
  }
}

- (BOOL)rootFolder:(id)a3 canBounceIcon:(id)a4
{
  void *v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CCUIPagingViewController_iconDragManager);
  if (v4)
    LOBYTE(v4) = objc_msgSend(v4, sel_isIconDragging, a3, a4);
  else
    __break(1u);
  return (char)v4;
}

- (void)folder:(id)a3 didAddIcons:(id)a4 removedIcons:(id)a5
{
  uint64_t v6;
  id v9;
  CCUIPagingViewController *v10;

  v6 = (uint64_t)a4;
  if (a4)
  {
    sub_1CFBBAA24(0, &qword_1ED90AE70);
    sub_1CFBE40FC(&qword_1EFBF1750, &qword_1ED90AE70);
    v6 = sub_1CFBFA984();
  }
  if (a5)
  {
    sub_1CFBBAA24(0, &qword_1ED90AE70);
    sub_1CFBE40FC(&qword_1EFBF1750, &qword_1ED90AE70);
    a5 = (id)sub_1CFBFA984();
  }
  v9 = a3;
  v10 = self;
  sub_1CFBE5A38(v6, (uint64_t)a5);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)controlsGalleryViewController:(id)a3 didFinishWithResult:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  CCUIPagingViewController *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = a5;
  sub_1CFBE5B7C(a4, a5);

}

- (void)controlsGalleryViewControllerWillPresent:(id)a3
{
  id v4;
  CCUIPagingViewController *v5;

  v4 = a3;
  v5 = self;
  _s15ControlCenterUI20PagingViewControllerC015controlsGalleryeF11WillPresentyySo013CCUISControlsheF0CF_0();

}

- (void)controlsGalleryViewControllerWillDismiss:(id)a3
{
  id v4;
  CCUIPagingViewController *v5;

  v4 = a3;
  v5 = self;
  _s15ControlCenterUI20PagingViewControllerC015controlsGalleryeF11WillDismissyySo013CCUISControlsheF0CF_0();

}

- (void)controlsGalleryViewControllerDidDismiss:(id)a3
{
  id v4;
  CCUIPagingViewController *v5;

  v4 = a3;
  v5 = self;
  _s15ControlCenterUI20PagingViewControllerC015controlsGalleryeF10DidDismissyySo013CCUISControlsheF0CF_0();

}

- (id)customApplicationWidgetCollectionsForControlsGalleryViewController:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  CCUIPagingViewController *v7;
  id v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v15;

  v15 = MEMORY[0x1E0DEE9D8];
  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CCUIPagingViewController_moduleInstanceManager);
  v5 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CCUIPagingViewController_moduleSettingsManager);
  v6 = a3;
  v7 = self;
  v8 = objc_msgSend(v4, sel_loadableModuleIdentifiers);
  v9 = sub_1CFBFA984();

  v10 = v7;
  v11 = v4;
  v12 = v5;
  sub_1CFBE4F8C(v9, v10, v11, v12, &v15);

  swift_bridgeObjectRelease();
  sub_1CFBBAA24(0, (unint64_t *)&unk_1EFBF1740);
  v13 = (void *)sub_1CFBFA8F4();
  swift_bridgeObjectRelease();
  return v13;
}

- (id)controlsGalleryViewController:(id)a3 customImageViewControllerForWidgetIcon:(id)a4 withPrimaryAction:(id)a5 contentMetrics:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  CCUIPagingViewController *v14;
  id v15;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = self;
  v15 = sub_1CFBE6288(v11, (uint64_t)v12, (uint64_t)v13);

  return v15;
}

- (id)controlsGalleryViewController:(id)a3 widgetIconForGalleryItem:(id)a4
{
  uint64_t v6;
  void *v7;
  id v8;
  CCUIPagingViewController *v9;
  id v10;
  void *v11;

  objc_opt_self();
  v6 = swift_dynamicCastObjCClass();
  if (v6)
  {
    v7 = (void *)v6;
    swift_unknownObjectRetain_n();
    v8 = a3;
    v9 = self;
    objc_msgSend(v7, sel_preferredGallerySizeClass);
    v10 = (id)SBHIconGridSizeClassForCCUIGridSizeClass();
    sub_1CFBBAA24(0, (unint64_t *)&unk_1EFBF0BD0);
    v11 = (void *)sub_1CFBFA9A8();
    objc_msgSend(v11, sel_addIconDataSource_, v7);
    objc_msgSend(v11, sel_setGridSizeClass_, v10);

    swift_unknownObjectRelease_n();
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (void)controlsGalleryViewController:(id)a3 didFinishWithWidgetIcon:(id)a4
{
  id v6;
  id v7;
  CCUIPagingViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1CFBE6A14(v7);

}

- (void)handleIconElementRequest:(id)a3 completionHandler:(id)a4
{
  sub_1CFBE2400((char *)self, (int)a2, a3, a4, sub_1CFBF32B0);
}

- (void)requestIconElementStateForRequest:(id)a3 completionHandler:(id)a4
{
  sub_1CFBE2400((char *)self, (int)a2, a3, a4, (void (*)(id, uint64_t, void *))sub_1CFBF347C);
}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  CCUIPagingViewController *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_1CFBE7150((uint64_t)&unk_1E8CFF2B0, (uint64_t)sub_1CFBE7990, (uint64_t)&block_descriptor_197);
  swift_unknownObjectRelease();

}

- (void)extensionsDidChangeForExtensionProvider:(id)a3
{
  id v4;
  CCUIPagingViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1CFBE7150((uint64_t)&unk_1E8CFF1E8, (uint64_t)sub_1CFBE7960, (uint64_t)&block_descriptor_180);

}

@end
