@implementation CKAppCardPresentationOverseer

- (CKBrowserViewControllerProtocol)browserViewController
{
  uint64_t v2;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___CKAppCardPresentationOverseer_container);
  if (v2)
    return (CKBrowserViewControllerProtocol *)objc_autoreleaseReturnValue(objc_retain(*(id *)(v2
                                                                                            + OBJC_IVAR____TtC7ChatKit30AppCardContainerViewController_remoteViewController)));
  else
    return (CKBrowserViewControllerProtocol *)0;
}

- (UIViewController)containerViewController
{
  return (UIViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR___CKAppCardPresentationOverseer_container));
}

- (CKAppCardPresentationOverseerDelegate)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___CKAppCardPresentationOverseer_delegate;
  swift_beginAccess();
  return (CKAppCardPresentationOverseerDelegate *)(id)MEMORY[0x193FF501C](v2);
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (double)appCardDismissPadding
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___CKAppCardPresentationOverseer_appCardDismissPadding);
  swift_beginAccess();
  return *v2;
}

- (void)setAppCardDismissPadding:(double)a3
{
  CKAppCardPresentationOverseer *v4;

  v4 = self;
  CKAppCardPresentationOverseer.appCardDismissPadding.setter(a3);

}

- (BOOL)presentationBegan
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___CKAppCardPresentationOverseer_presentationBegan;
  swift_beginAccess();
  return *v2;
}

- (void)setPresentationBegan:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___CKAppCardPresentationOverseer_presentationBegan;
  swift_beginAccess();
  *v4 = a3;
}

- (CKAppCardPresentationOverseer)initWithPresentingViewController:(id)a3 sendDelegate:(id)a4
{
  id v4;

  v4 = a3;
  swift_unknownObjectRetain();
  return (CKAppCardPresentationOverseer *)CKAppCardPresentationOverseer.init(presenting:sendDelegate:)(v4);
}

- (id)updateCurrentBrowserForPlugin:(id)a3 dataSource:(id)a4 pluginContext:(id)a5
{
  id v8;
  id v9;
  CKAppCardPresentationOverseer *v10;
  id v11;
  id v12;
  CKAppCardPresentationOverseer *v13;
  id v14;
  _OWORD v16[2];

  if (a5)
  {
    v8 = a3;
    v9 = a4;
    v10 = self;
    swift_unknownObjectRetain();
    sub_18E769194();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v16, 0, sizeof(v16));
    v11 = a3;
    v12 = a4;
    v13 = self;
  }
  v14 = CKAppCardPresentationOverseer.updateCurrentBrowser(for:dataSource:pluginContext:)(a3, (uint64_t)a4, (uint64_t)v16);

  sub_18E553930((uint64_t)v16);
  return v14;
}

- (BOOL)updateCurrentBrowserWithDataSource:(id)a3
{
  CKAppCardPresentationOverseer *v4;
  CKAppCardPresentationOverseer *v5;
  CKBrowserViewControllerProtocol *v6;
  CKAppCardPresentationOverseer *v7;
  BOOL v8;

  v4 = (CKAppCardPresentationOverseer *)a3;
  v5 = self;
  v6 = -[CKAppCardPresentationOverseer browserViewController](v5, sel_browserViewController);
  if (v6)
  {
    v7 = (CKAppCardPresentationOverseer *)v6;
    if ((-[CKBrowserViewControllerProtocol respondsToSelector:](v6, sel_respondsToSelector_, sel_canReplaceDataSource) & 1) != 0&& !-[CKAppCardPresentationOverseer canReplaceDataSource](v7, sel_canReplaceDataSource))
    {
      v8 = 0;
    }
    else
    {
      -[CKAppCardPresentationOverseer setBalloonPluginDataSource:](v7, sel_setBalloonPluginDataSource_, v4);
      v8 = 1;
    }

    v4 = v5;
  }
  else
  {
    v8 = 0;
    v7 = v5;
  }

  return v8;
}

- (BOOL)isPresentingInSendMenuPopover
{
  CKAppCardPresentationOverseer *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_18E54D114();

  if (v3)
  return v3 != 0;
}

- (BOOL)isPresentingInSheetController
{
  CKAppCardPresentationOverseer *v2;
  void *v3;
  id v4;

  v2 = self;
  if (-[CKAppCardPresentationOverseer isPresentingInSendMenuPopover](v2, sel_isPresentingInSendMenuPopover)
    || (v3 = *(Class *)((char *)&v2->super.isa + OBJC_IVAR___CKAppCardPresentationOverseer_container)) == 0)
  {

    return 0;
  }
  else
  {
    v4 = objc_msgSend(v3, sel_modalPresentationStyle);

    return v4 == (id)1;
  }
}

- (void)extensionRemoteConnectionWasInterruptedWithNotification:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  CKAppCardPresentationOverseer *v8;
  uint64_t v9;

  v4 = sub_18E765F3C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18E765F18();
  v8 = self;
  sub_18E54D2A8();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)presentCardWithStyle:(unint64_t)a3 animated:(BOOL)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  CKAppCardPresentationOverseer *v17;
  uint64_t v18;

  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECF63C60);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = a3;
  *(_BYTE *)(v13 + 24) = a4;
  *(_QWORD *)(v13 + 32) = v12;
  *(_QWORD *)(v13 + 40) = self;
  v14 = sub_18E768BA0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EE1097D0;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1EE1097D8;
  v16[5] = v15;
  v17 = self;
  sub_18E691CC8((uint64_t)v11, (uint64_t)&unk_1EE1097E0, (uint64_t)v16);
  swift_release();
}

- (void)presentPopoverFromView:(UIView *)a3 sourceRect:(CGRect)a4 completion:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void *v15;
  CGFloat *v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  UIView *v20;
  CKAppCardPresentationOverseer *v21;
  uint64_t v22;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECF63C60);
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = _Block_copy(a5);
  v16 = (CGFloat *)swift_allocObject();
  *((_QWORD *)v16 + 2) = a3;
  v16[3] = x;
  v16[4] = y;
  v16[5] = width;
  v16[6] = height;
  *((_QWORD *)v16 + 7) = v15;
  *((_QWORD *)v16 + 8) = self;
  v17 = sub_18E768BA0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v14, 1, 1, v17);
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_1EE1097B0;
  v18[5] = v16;
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_1EE1097B8;
  v19[5] = v18;
  v20 = a3;
  v21 = self;
  sub_18E691CC8((uint64_t)v14, (uint64_t)&unk_1EE1097C0, (uint64_t)v19);
  swift_release();
}

- (void)updatePopoverLocation:(CGRect)a3 completion:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  CGFloat *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  CKAppCardPresentationOverseer *v18;
  uint64_t v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECF63C60);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a4);
  v14 = (CGFloat *)swift_allocObject();
  v14[2] = x;
  v14[3] = y;
  v14[4] = width;
  v14[5] = height;
  *((_QWORD *)v14 + 6) = v13;
  *((_QWORD *)v14 + 7) = self;
  v15 = sub_18E768BA0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v12, 1, 1, v15);
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1EE109790;
  v16[5] = v14;
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_1EE109798;
  v17[5] = v16;
  v18 = self;
  sub_18E691CC8((uint64_t)v12, (uint64_t)&unk_1EE1097A0, (uint64_t)v17);
  swift_release();
}

- (void)fadeOutCardWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  CKAppCardPresentationOverseer *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  CKAppCardPresentationOverseer.fadeOutCard(completion:)((uint64_t)sub_18E5228F4, v5);

  swift_release();
}

- (void)dismissCardAnimated:(BOOL)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  CKAppCardPresentationOverseer *v15;
  uint64_t v16;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECF63C60);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = swift_allocObject();
  *(_BYTE *)(v11 + 16) = a3;
  *(_QWORD *)(v11 + 24) = v10;
  *(_QWORD *)(v11 + 32) = self;
  v12 = sub_18E768BA0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EE109770;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EE109778;
  v14[5] = v13;
  v15 = self;
  sub_18E691CC8((uint64_t)v9, (uint64_t)&unk_1EE109780, (uint64_t)v14);
  swift_release();
}

- (void)dismissCardAnimated:(BOOL)a3 overrideExceptions:(BOOL)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  CKAppCardPresentationOverseer *v17;
  uint64_t v18;

  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECF63C60);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = swift_allocObject();
  *(_BYTE *)(v13 + 16) = a3;
  *(_BYTE *)(v13 + 17) = a4;
  *(_QWORD *)(v13 + 24) = v12;
  *(_QWORD *)(v13 + 32) = self;
  v14 = sub_18E768BA0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EE109750;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1EE109758;
  v16[5] = v15;
  v17 = self;
  sub_18E691CC8((uint64_t)v11, (uint64_t)&unk_1EE109760, (uint64_t)v16);
  swift_release();
}

- (BOOL)isPresentingCard
{
  void *v2;
  CKAppCardPresentationOverseer *v3;
  id v4;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CKAppCardPresentationOverseer_container);
  if (!v2)
    return 0;
  v3 = self;
  v4 = objc_msgSend(v2, sel_presentingViewController);

  if (!v4)
    return 0;

  return 1;
}

- (BOOL)presentedAppBypassesSendMenu
{
  CKAppCardPresentationOverseer *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = CKAppCardPresentationOverseer.presentedAppBypassesSendMenu.getter();

  return v3 & 1;
}

- (BOOL)isExpanded
{
  void *v2;
  CKAppCardPresentationOverseer *v3;
  id v4;
  uint64_t v5;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CKAppCardPresentationOverseer_container);
  if (!v2)
    return 0;
  v3 = self;
  v4 = v2;
  v5 = sub_18E5F7B24();

  return v5 == 1;
}

- (void)requestPresentationStyle:(unint64_t)a3 animated:(BOOL)a4
{
  CKAppCardPresentationOverseer *v6;

  v6 = self;
  CKAppCardPresentationOverseer.request(_:animated:)(a3, a4);

}

- (void)requestPresentationStyle:(unint64_t)a3
{
  -[CKAppCardPresentationOverseer requestPresentationStyle:animated:](self, sel_requestPresentationStyle_animated_, a3, 0);
}

- (void)checkForTouchInExtensionWithCompletion:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  CKAppCardPresentationOverseer *v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECF63C60);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_18E768BA0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1EE109730;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EE108D18;
  v12[5] = v11;
  v13 = self;
  sub_18E691CC8((uint64_t)v7, (uint64_t)&unk_1EE109740, (uint64_t)v12);
  swift_release();
}

- (BOOL)shouldAnimatePresentationForPresentationStyle:(unint64_t)a3
{
  CKAppCardPresentationOverseer *v4;

  v4 = self;
  LOBYTE(a3) = CKAppCardPresentationOverseer.shouldAnimatePresentation(for:)(a3);

  return a3 & 1;
}

- (BOOL)shouldAnimateDismissal
{
  CKAppCardPresentationOverseer *v2;
  char v3;

  v2 = self;
  v3 = CKAppCardPresentationOverseer.shouldAnimateDismissal.getter();

  return v3 & 1;
}

- (CKAppCardPresentationOverseer)init
{
  CKAppCardPresentationOverseer *result;

  result = (CKAppCardPresentationOverseer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_18E553930((uint64_t)self + OBJC_IVAR___CKAppCardPresentationOverseer_pluginContext);
  sub_18E522F74((uint64_t)self + OBJC_IVAR___CKAppCardPresentationOverseer_delegate);

  swift_unknownObjectWeakDestroy();
  sub_18E522F74((uint64_t)self + OBJC_IVAR___CKAppCardPresentationOverseer_sendDelegate);
  swift_release();
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4;
  CKAppCardPresentationOverseer *v5;

  v4 = a3;
  v5 = self;
  _sSo29CKAppCardPresentationOverseerC7ChatKitE32presentationControllerDidDismissyySo014UIPresentationH0CF_0();

}

- (void)sheetPresentationControllerDidChangeSelectedDetentIdentifier:(id)a3
{
  UISheetPresentationController *v4;
  CKAppCardPresentationOverseer *v5;

  v4 = (UISheetPresentationController *)a3;
  v5 = self;
  CKAppCardPresentationOverseer.sheetPresentationControllerDidChangeSelectedDetentIdentifier(_:)(v4);

}

- (void)_sheetPresentationControllerDidInvalidateCurrentPresentedViewFrame:(id)a3
{
  UISheetPresentationController *v4;
  CKAppCardPresentationOverseer *v5;

  v4 = (UISheetPresentationController *)a3;
  v5 = self;
  CKAppCardPresentationOverseer._sheetPresentationControllerDidInvalidateCurrentPresentedViewFrame(_:)(v4);

}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return -1;
}

@end
