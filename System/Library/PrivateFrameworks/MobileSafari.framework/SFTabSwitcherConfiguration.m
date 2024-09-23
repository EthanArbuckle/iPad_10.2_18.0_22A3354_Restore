@implementation SFTabSwitcherConfiguration

- (id)borrowedCapsuleViewProvider
{
  return sub_18B988B74((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFTabSwitcherConfiguration_borrowedCapsuleViewProvider, (uint64_t)sub_18B988AF4, (uint64_t)&block_descriptor_292);
}

- (void)setBorrowedCapsuleViewProvider:(id)a3
{
  void *v4;
  uint64_t v5;
  _QWORD *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = (Class *)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherConfiguration_borrowedCapsuleViewProvider);
  *v6 = sub_18B999020;
  v6[1] = v5;
  swift_release();
}

- (id)borrowedContentViewProvider
{
  return sub_18B988B74((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFTabSwitcherConfiguration_borrowedContentViewProvider, (uint64_t)sub_18B988AF4, (uint64_t)&block_descriptor_286);
}

- (void)setBorrowedContentViewProvider:(id)a3
{
  void *v4;
  uint64_t v5;
  id (**v6)();

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = (id (**)())((char *)self + OBJC_IVAR___SFTabSwitcherConfiguration_borrowedContentViewProvider);
  *v6 = sub_18B998D40;
  v6[1] = (id (*)())v5;
  swift_release();
}

- (id)canAddItemPredicate
{
  return sub_18B988B74((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFTabSwitcherConfiguration_canAddItemPredicate, (uint64_t)sub_18B988C68, (uint64_t)&block_descriptor_280);
}

- (void)setCanAddItemPredicate:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t (**v6)();

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = (uint64_t (**)())((char *)self + OBJC_IVAR___SFTabSwitcherConfiguration_canAddItemPredicate);
  *v6 = sub_18B999028;
  v6[1] = (uint64_t (*)())v5;
  swift_release();
}

- (id)didScrollToPageObserver
{
  return sub_18B988B74((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFTabSwitcherConfiguration_didScrollToPageObserver, (uint64_t)sub_18B94E394, (uint64_t)&block_descriptor_273);
}

- (void)setDidScrollToPageObserver:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t (**v6)();

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = (uint64_t (**)())((char *)self + OBJC_IVAR___SFTabSwitcherConfiguration_didScrollToPageObserver);
  *v6 = sub_18B9503E0;
  v6[1] = (uint64_t (*)())v5;
  swift_release();
}

- (id)dismissHandler
{
  return sub_18B988B74((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFTabSwitcherConfiguration_dismissHandler, (uint64_t)sub_18B94E394, (uint64_t)&block_descriptor_266_0);
}

- (void)setDismissHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t (**v6)();

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = (uint64_t (**)())((char *)self + OBJC_IVAR___SFTabSwitcherConfiguration_dismissHandler);
  *v6 = sub_18B9503E0;
  v6[1] = (uint64_t (*)())v5;
  swift_release();
}

- (id)dragItemProvider
{
  return sub_18B988B74((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFTabSwitcherConfiguration_dragItemProvider, (uint64_t)sub_18B988E2C, (uint64_t)&block_descriptor_259);
}

- (void)setDragItemProvider:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t (**v6)(uint64_t);

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = (uint64_t (**)(uint64_t))((char *)self + OBJC_IVAR___SFTabSwitcherConfiguration_dragItemProvider);
  *v6 = sub_18B998D38;
  v6[1] = (uint64_t (*)(uint64_t))v5;
  swift_release();
}

- (id)dropDestinationProvider
{
  return sub_18B988B74((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFTabSwitcherConfiguration_dropDestinationProvider, (uint64_t)sub_18B988F94, (uint64_t)&block_descriptor_253);
}

- (void)setDropDestinationProvider:(id)a3
{
  void *v4;
  uint64_t v5;
  id (**v6)();

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = (id (**)())((char *)self + OBJC_IVAR___SFTabSwitcherConfiguration_dropDestinationProvider);
  *v6 = sub_18B912CD4;
  v6[1] = (id (*)())v5;
  swift_release();
}

- (id)dropHandler
{
  return sub_18B988B74((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFTabSwitcherConfiguration_dropHandler, (uint64_t)sub_18B94E394, (uint64_t)&block_descriptor_247);
}

- (void)setDropHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t (**v6)();

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = (uint64_t (**)())((char *)self + OBJC_IVAR___SFTabSwitcherConfiguration_dropHandler);
  *v6 = sub_18B9503E0;
  v6[1] = (uint64_t (*)())v5;
  swift_release();
}

- (id)dropOperationProvider
{
  return sub_18B988B74((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFTabSwitcherConfiguration_dropOperationProvider, (uint64_t)sub_18B9890F8, (uint64_t)&block_descriptor_241_0);
}

- (void)setDropOperationProvider:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t (**v6)();

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = (uint64_t (**)())((char *)self + OBJC_IVAR___SFTabSwitcherConfiguration_dropOperationProvider);
  *v6 = sub_18B998C8C;
  v6[1] = (uint64_t (*)())v5;
  swift_release();
}

- (id)itemAddHandler
{
  return sub_18B988B74((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFTabSwitcherConfiguration_itemAddHandler, (uint64_t)sub_18B94E394, (uint64_t)&block_descriptor_235);
}

- (void)setItemAddHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t (**v6)();

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = (uint64_t (**)())((char *)self + OBJC_IVAR___SFTabSwitcherConfiguration_itemAddHandler);
  *v6 = sub_18B9503E0;
  v6[1] = (uint64_t (*)())v5;
  swift_release();
}

- (id)itemCloseHandler
{
  return sub_18B988B74((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFTabSwitcherConfiguration_itemCloseHandler, (uint64_t)sub_18B989268, (uint64_t)&block_descriptor_228);
}

- (void)setItemCloseHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  void (**v6)(uint64_t);

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = (void (**)(uint64_t))((char *)self + OBJC_IVAR___SFTabSwitcherConfiguration_itemCloseHandler);
  *v6 = sub_18B998D30;
  v6[1] = (void (*)(uint64_t))v5;
  swift_release();
}

- (id)itemCopyHandler
{
  return sub_18B988B74((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFTabSwitcherConfiguration_itemCopyHandler, (uint64_t)sub_18B9893DC, (uint64_t)&block_descriptor_222);
}

- (void)setItemCopyHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  void (**v6)(uint64_t);

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = (void (**)(uint64_t))((char *)self + OBJC_IVAR___SFTabSwitcherConfiguration_itemCopyHandler);
  *v6 = sub_18B998D28;
  v6[1] = (void (*)(uint64_t))v5;
  swift_release();
}

- (id)itemMoveHandler
{
  return sub_18B988B74((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFTabSwitcherConfiguration_itemMoveHandler, (uint64_t)sub_18B989500, (uint64_t)&block_descriptor_216);
}

- (void)setItemMoveHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  void (**v6)(uint64_t, uint64_t);

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = (void (**)(uint64_t, uint64_t))((char *)self + OBJC_IVAR___SFTabSwitcherConfiguration_itemMoveHandler);
  *v6 = sub_18B998D20;
  v6[1] = (void (*)(uint64_t, uint64_t))v5;
  swift_release();
}

- (id)itemPinHandler
{
  return sub_18B988B74((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFTabSwitcherConfiguration_itemPinHandler, (uint64_t)sub_18B989660, (uint64_t)&block_descriptor_210);
}

- (void)setItemPinHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  void (**v6)(uint64_t, char);

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = (void (**)(uint64_t, char))((char *)self + OBJC_IVAR___SFTabSwitcherConfiguration_itemPinHandler);
  *v6 = sub_18B998D18;
  v6[1] = (void (*)(uint64_t, char))v5;
  swift_release();
}

- (id)itemSelectionHandler
{
  return sub_18B988B74((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFTabSwitcherConfiguration_itemSelectionHandler, (uint64_t)sub_18B94E394, (uint64_t)&block_descriptor_204);
}

- (void)setItemSelectionHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t (**v6)();

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = (uint64_t (**)())((char *)self + OBJC_IVAR___SFTabSwitcherConfiguration_itemSelectionHandler);
  *v6 = sub_18B8928C8;
  v6[1] = (uint64_t (*)())v5;
  swift_release();
}

- (id)pageInsertionHandler
{
  return sub_18B988B74((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFTabSwitcherConfiguration_pageInsertionHandler, (uint64_t)sub_18B94E394, (uint64_t)&block_descriptor_198);
}

- (void)setPageInsertionHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t (**v6)();

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = (uint64_t (**)())((char *)self + OBJC_IVAR___SFTabSwitcherConfiguration_pageInsertionHandler);
  *v6 = sub_18B9503E0;
  v6[1] = (uint64_t (*)())v5;
  swift_release();
}

- (id)pageRetitleHandler
{
  return sub_18B988B74((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFTabSwitcherConfiguration_pageRetitleHandler, (uint64_t)sub_18B9898A0, (uint64_t)&block_descriptor_191);
}

- (void)setPageRetitleHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  void (**v6)(uint64_t);

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = (void (**)(uint64_t))((char *)self + OBJC_IVAR___SFTabSwitcherConfiguration_pageRetitleHandler);
  *v6 = sub_18B998CC8;
  v6[1] = (void (*)(uint64_t))v5;
  swift_release();
}

- (id)pageTitleMenuProvider
{
  return sub_18B988B74((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFTabSwitcherConfiguration_pageTitleMenuProvider, (uint64_t)sub_18B989994, (uint64_t)&block_descriptor_185);
}

- (void)setPageTitleMenuProvider:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t (**v6)(uint64_t, uint64_t);

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = (uint64_t (**)(uint64_t, uint64_t))((char *)self
                                                 + OBJC_IVAR___SFTabSwitcherConfiguration_pageTitleMenuProvider);
  *v6 = sub_18B998CC0;
  v6[1] = (uint64_t (*)(uint64_t, uint64_t))v5;
  swift_release();
}

- (id)profileMenuProvider
{
  return sub_18B988B74((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFTabSwitcherConfiguration_profileMenuProvider, (uint64_t)sub_18B989B54, (uint64_t)&block_descriptor_179);
}

- (void)setProfileMenuProvider:(id)a3
{
  void *v4;
  uint64_t v5;
  id (**v6)();

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = (id (**)())((char *)self + OBJC_IVAR___SFTabSwitcherConfiguration_profileMenuProvider);
  *v6 = sub_18B998CA0;
  v6[1] = (id (*)())v5;
  swift_release();
}

- (id)recentlyClosedMenuProvider
{
  return sub_18B988B74((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFTabSwitcherConfiguration_recentlyClosedMenuProvider, (uint64_t)sub_18B988AF4, (uint64_t)&block_descriptor_173);
}

- (void)setRecentlyClosedMenuProvider:(id)a3
{
  void *v4;
  uint64_t v5;
  _QWORD *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = (Class *)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherConfiguration_recentlyClosedMenuProvider);
  *v6 = sub_18B999020;
  v6[1] = v5;
  swift_release();
}

- (id)relinquishBorrowedCapsuleView
{
  return sub_18B988B74((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFTabSwitcherConfiguration_relinquishBorrowedCapsuleView, (uint64_t)sub_18B94E394, (uint64_t)&block_descriptor_167);
}

- (void)setRelinquishBorrowedCapsuleView:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t (**v6)();

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = (uint64_t (**)())((char *)self + OBJC_IVAR___SFTabSwitcherConfiguration_relinquishBorrowedCapsuleView);
  *v6 = sub_18B9503E0;
  v6[1] = (uint64_t (*)())v5;
  swift_release();
}

- (id)relinquishBorrowedContentView
{
  return sub_18B988B74((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFTabSwitcherConfiguration_relinquishBorrowedContentView, (uint64_t)sub_18B989D50, (uint64_t)&block_descriptor_160);
}

- (void)setRelinquishBorrowedContentView:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t (**v6)();

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = (uint64_t (**)())((char *)self + OBJC_IVAR___SFTabSwitcherConfiguration_relinquishBorrowedContentView);
  *v6 = sub_18B998C8C;
  v6[1] = (uint64_t (*)())v5;
  swift_release();
}

- (id)showPagePickerSheet
{
  return sub_18B988B74((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFTabSwitcherConfiguration_showPagePickerSheet, (uint64_t)sub_18B989E38, (uint64_t)&block_descriptor_154);
}

- (void)setShowPagePickerSheet:(id)a3
{
  void *v4;
  uint64_t v5;
  _QWORD *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = (Class *)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherConfiguration_showPagePickerSheet);
  *v6 = sub_18B998E14;
  v6[1] = v5;
  swift_release();
}

- (id)steadyStateObserver
{
  return sub_18B988B74((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFTabSwitcherConfiguration_steadyStateObserver, (uint64_t)sub_18B8B36A8, (uint64_t)&block_descriptor_147);
}

- (void)setSteadyStateObserver:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t (**v6)(char);

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = (uint64_t (**)(char))((char *)self + OBJC_IVAR___SFTabSwitcherConfiguration_steadyStateObserver);
  *v6 = sub_18B999024;
  v6[1] = (uint64_t (*)(char))v5;
  swift_release();
}

- (id)tabOverviewVisibilityObserver
{
  return sub_18B988B74((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFTabSwitcherConfiguration_tabOverviewVisibilityObserver, (uint64_t)sub_18B8B36A8, (uint64_t)&block_descriptor_140);
}

- (void)setTabOverviewVisibilityObserver:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t (**v6)(char);

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = (uint64_t (**)(char))((char *)self
                                     + OBJC_IVAR___SFTabSwitcherConfiguration_tabOverviewVisibilityObserver);
  *v6 = sub_18B999024;
  v6[1] = (uint64_t (*)(char))v5;
  swift_release();
}

- (id)toggleSidebarHandler
{
  return sub_18B988B74((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFTabSwitcherConfiguration_toggleSidebarHandler, (uint64_t)sub_18BA5AA30, (uint64_t)&block_descriptor_133);
}

- (void)setToggleSidebarHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  _QWORD *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = (Class *)((char *)&self->super.isa + OBJC_IVAR___SFTabSwitcherConfiguration_toggleSidebarHandler);
  *v6 = sub_18B92A178;
  v6[1] = v5;
  swift_release();
}

- (id)validateDismissal
{
  return sub_18B988B74((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFTabSwitcherConfiguration_validateDismissal, (uint64_t)sub_18B988C68, (uint64_t)&block_descriptor_126);
}

- (void)setValidateDismissal:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t (**v6)();

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = (uint64_t (**)())((char *)self + OBJC_IVAR___SFTabSwitcherConfiguration_validateDismissal);
  *v6 = sub_18B998C6C;
  v6[1] = (uint64_t (*)())v5;
  swift_release();
}

- (id)visibilityObserver
{
  return sub_18B988B74((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFTabSwitcherConfiguration_visibilityObserver, (uint64_t)sub_18B8B36A8, (uint64_t)&block_descriptor_120);
}

- (void)setVisibilityObserver:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t (**v6)(char);

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = (uint64_t (**)(char))((char *)self + OBJC_IVAR___SFTabSwitcherConfiguration_visibilityObserver);
  *v6 = sub_18B998C58;
  v6[1] = (uint64_t (*)(char))v5;
  swift_release();
}

- (id)willScrollToPageObserver
{
  return sub_18B988B74((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SFTabSwitcherConfiguration_willScrollToPageObserver, (uint64_t)sub_18B94E394, (uint64_t)&block_descriptor_114);
}

- (void)setWillScrollToPageObserver:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t (**v6)();

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = (uint64_t (**)())((char *)self + OBJC_IVAR___SFTabSwitcherConfiguration_willScrollToPageObserver);
  *v6 = sub_18B9503E0;
  v6[1] = (uint64_t (*)())v5;
  swift_release();
}

- (SFTabSwitcherConfiguration)init
{
  return (SFTabSwitcherConfiguration *)SFTabSwitcherConfiguration.init()();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
}

@end
