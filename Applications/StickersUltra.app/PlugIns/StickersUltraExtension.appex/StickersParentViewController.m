@implementation StickersParentViewController

- (void)dealloc
{
  void **v3;
  void *v4;
  _TtC22StickersUltraExtension28StickersParentViewController *v5;
  id v6;
  objc_super v7;
  _BYTE v8[24];

  v3 = (void **)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC22StickersUltraExtension28StickersParentViewController_imageAnalysisInteraction);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC22StickersUltraExtension28StickersParentViewController_imageAnalysisInteraction, v8, 1, 0);
  v4 = *v3;
  *v3 = 0;
  v5 = self;

  v6 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), "defaultCenter");
  objc_msgSend(v6, "removeObserver:", v5);

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for StickersParentViewController(0);
  -[BaseMessagesViewController dealloc](&v7, "dealloc");
}

- (void).cxx_destruct
{
  uint64_t v3;

  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension28StickersParentViewController_stickerProvidingViewController));
  sub_100029324(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC22StickersUltraExtension28StickersParentViewController_photoPickerDidDismissClosure), *(_QWORD *)(&self->super._snapshottingEnabled+ OBJC_IVAR____TtC22StickersUltraExtension28StickersParentViewController_photoPickerDidDismissClosure));
  swift_bridgeObjectRelease(*(_QWORD *)(&self->super._snapshottingEnabled
                                      + OBJC_IVAR____TtC22StickersUltraExtension28StickersParentViewController_thirdPartyAppIdentifier));
  swift_bridgeObjectRelease(*(_QWORD *)(&self->super._snapshottingEnabled
                                      + OBJC_IVAR____TtC22StickersUltraExtension28StickersParentViewController_puppetIdentifier));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC22StickersUltraExtension28StickersParentViewController_stickerStripViewModel), v3);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension28StickersParentViewController__isAddingStickerMu));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension28StickersParentViewController_rootNavigationController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension28StickersParentViewController_visualEffectViewBackground));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension28StickersParentViewController_mainController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension28StickersParentViewController_stickerCollectionViewControllerPresentedViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension28StickersParentViewController_stickerPackStripHostHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension28StickersParentViewController_contentControllerTopAnchorConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension28StickersParentViewController_stickerPackStripTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension28StickersParentViewController____lazy_storage___stickerPackStripHost));
  sub_10002E2B4((uint64_t)self+ OBJC_IVAR____TtC22StickersUltraExtension28StickersParentViewController____lazy_storage___stickerPackStrip, (uint64_t *)&unk_10009B820);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22StickersUltraExtension28StickersParentViewController_imageAnalysisInteraction));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC22StickersUltraExtension28StickersParentViewController_traitRegistration));
  swift_bridgeObjectRelease(*(_QWORD *)(&self->super._snapshottingEnabled
                                      + OBJC_IVAR____TtC22StickersUltraExtension28StickersParentViewController__VKStickerInfoKeyStickerIDs));
}

- (void)viewDidLoad
{
  _TtC22StickersUltraExtension28StickersParentViewController *v2;

  v2 = self;
  sub_10001A20C();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  id v6;
  _TtC22StickersUltraExtension28StickersParentViewController *v7;

  v7 = self;
  v4 = a3;
  v5 = -[StickersParentViewController traitCollection](v7, "traitCollection");
  v6 = objc_msgSend(v5, "_presentationSemanticContext");

  if (!v4 || v6 != objc_msgSend(v4, "_presentationSemanticContext"))
  {
    (*(void (**)(void))((swift_isaMask & (uint64_t)v7->super.super.super.super.super.isa) + 0x310))();
    sub_10001A978();
  }

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC22StickersUltraExtension28StickersParentViewController *v4;

  v4 = self;
  sub_10001B090(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  _TtC22StickersUltraExtension28StickersParentViewController *v6;
  uint64_t v7;
  objc_super v8;

  v3 = a3;
  v5 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC22StickersUltraExtension28StickersParentViewController_traitRegistration);
  v6 = self;
  if (v5)
  {
    v7 = swift_unknownObjectRetain(v5);
    UIViewController.unregisterForTraitChanges(_:)(v7);
    swift_unknownObjectRelease(v5);
  }
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for StickersParentViewController(0);
  -[StickersParentViewController viewWillDisappear:](&v8, "viewWillDisappear:", v3);

}

- (void)traitStyleDidChange
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  _TtC22StickersUltraExtension28StickersParentViewController *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;

  v3 = type metadata accessor for UITraitOverrides(0);
  __chkstk_darwin();
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC22StickersUltraExtension28StickersParentViewController_rootNavigationController);
  v7 = self;
  v8 = v6;
  v9 = -[StickersParentViewController traitCollection](v7, "traitCollection");
  v10 = objc_msgSend(v9, "userInterfaceStyle");

  UIViewController.traitOverrides.getter();
  UIMutableTraits.userInterfaceStyle.setter(v10, v3, &protocol witness table for UITraitOverrides);
  UIViewController.traitOverrides.setter(v5);

}

- (UIEdgeInsets)additionalSafeAreaInsets
{
  _TtC22StickersUltraExtension28StickersParentViewController *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  UIEdgeInsets result;

  v2 = self;
  v3 = sub_10001B4C8();
  v5 = v4;
  v7 = v6;
  v9 = v8;

  v10 = v3;
  v11 = v5;
  v12 = v7;
  v13 = v9;
  result.right = v13;
  result.bottom = v12;
  result.left = v11;
  result.top = v10;
  return result;
}

- (void)_setPluginIdentifierToShow:(NSString *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  NSString *v15;
  _TtC22StickersUltraExtension28StickersParentViewController *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v7 = sub_10000A66C(&qword_10009BA60);
  __chkstk_darwin(v7);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_10008BA58, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_10008BA80, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_10009BB00;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_10008BAA8, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_10009BB08;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  v17 = sub_100028ED0((uint64_t)v9, (uint64_t)&unk_10009BB10, (uint64_t)v14);
  swift_release(v17, v18);
}

- (void)requestStickerExtensionMetadataDictionary:(id)a3
{
  void *v4;
  _TtC22StickersUltraExtension28StickersParentViewController *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_10002A01C((uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);

}

- (void)handleCloseButton
{
  uint64_t (*v2)(void);
  _QWORD *v3;
  void *v4;
  _TtC22StickersUltraExtension28StickersParentViewController *v5;

  v2 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.super.super.super.super.isa) + 0x100);
  v5 = self;
  v3 = (_QWORD *)v2();
  if (v3)
  {
    v4 = v3;
    (*(void (**)(void))((swift_isaMask & *v3) + 0x150))();

  }
  -[StickersParentViewController dismiss](v5, "dismiss");

}

- (void)requestPresentationWithStickerType:(id)a3 identifier:(id)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _TtC22StickersUltraExtension28StickersParentViewController *v11;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v8 = v7;
  if (a4)
  {
    v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    a4 = v10;
  }
  else
  {
    v9 = 0;
  }
  v11 = self;
  sub_10001C6C4(v6, v8, v9, (unint64_t)a4);

  swift_bridgeObjectRelease(v8);
  swift_bridgeObjectRelease(a4);
}

- (id)defaultMessagesChildViewControllerForPresentationContext:(unint64_t)a3
{
  _QWORD *v4;
  id v5;
  id result;
  id v7;
  id v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for StickersParentViewController(0);
  v4 = v9.receiver;
  v5 = -[BaseMessagesViewController defaultMessagesChildViewControllerForPresentationContext:](&v9, "defaultMessagesChildViewControllerForPresentationContext:", a3);
  result = objc_msgSend(v5, "view", v9.receiver, v9.super_class);
  if (result)
  {
    v7 = result;
    v8 = objc_msgSend((id)objc_opt_self(UIColor), "clearColor");
    objc_msgSend(v7, "setBackgroundColor:", v8);

    (*(void (**)(BOOL))((swift_isaMask & *v4) + 0x288))(a3 == 0);
    return v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)willBecomeActiveWithConversation:(id)a3
{
  id v4;
  _TtC22StickersUltraExtension28StickersParentViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10001D014(v4);

}

- (void)willTransitionToPresentationStyle:(unint64_t)a3
{
  _TtC22StickersUltraExtension28StickersParentViewController *v4;

  v4 = self;
  sub_10001D3EC(a3);

}

- (void)didTransitionToPresentationStyle:(unint64_t)a3
{
  _TtC22StickersUltraExtension28StickersParentViewController *v4;

  v4 = self;
  sub_10001D828(a3);

}

- (void)_addStickerToStoreWithRepresentations:(id)a3 completionHandler:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _TtC22StickersUltraExtension28StickersParentViewController *v10;
  Class isa;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[5];
  uint64_t v18;

  v6 = _Block_copy(a4);
  v7 = sub_10000D5F4(0, &qword_10009B880, _UIStickerRepresentation_ptr);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  v9 = swift_allocObject(&unk_10008B9E0, 24, 7);
  *(_QWORD *)(v9 + 16) = v6;
  v10 = self;
  isa = Array._bridgeToObjectiveC()().super.isa;
  v12 = swift_allocObject(&unk_10008BA08, 32, 7);
  *(_QWORD *)(v12 + 16) = sub_10002D938;
  *(_QWORD *)(v12 + 24) = v9;
  v17[4] = sub_10002951C;
  v18 = v12;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 1107296256;
  v17[2] = sub_10001DCC8;
  v17[3] = &unk_10008BA20;
  v13 = _Block_copy(v17);
  v14 = v18;
  swift_retain(v9);
  swift_release(v14, v15);
  -[StickersParentViewController _addStickerToStoreWithRepresentations:completionWithStickerIDs:](v10, "_addStickerToStoreWithRepresentations:completionWithStickerIDs:", isa, v13);
  _Block_release(v13);

  swift_bridgeObjectRelease(v8);
  swift_release(v9, v16);

}

- (void)_addStickerToStoreWithRepresentations:(id)a3 completionWithStickerIDs:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _TtC22StickersUltraExtension28StickersParentViewController *v9;

  v6 = _Block_copy(a4);
  v7 = sub_10000D5F4(0, &qword_10009B880, _UIStickerRepresentation_ptr);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  _Block_copy(v6);
  v9 = self;
  sub_10002A57C(v8, (char *)v9, (void (**)(const void *, _QWORD, void *, CGFloat, double, double, double))v6);
  _Block_release(v6);
  _Block_release(v6);

  swift_bridgeObjectRelease(v8);
}

- (void)_addStickerToStoreWithRepresentations:(id)a3 sourceRect:(CGRect)a4 completion:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, _QWORD, uint64_t, uint64_t (*)(), uint64_t, double, double, double, double);
  _TtC22StickersUltraExtension28StickersParentViewController *v16;
  uint64_t v17;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = _Block_copy(a5);
  v12 = sub_10000D5F4(0, &qword_10009B880, _UIStickerRepresentation_ptr);
  v13 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v12);
  v14 = swift_allocObject(&unk_10008B940, 24, 7);
  *(_QWORD *)(v14 + 16) = v11;
  v15 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t (*)(), uint64_t, double, double, double, double))((swift_isaMask & (uint64_t)self->super.super.super.super.super.isa) + 0x330);
  v16 = self;
  v15(v13, 0, 1, sub_10002E330, v14, x, y, width, height);

  swift_bridgeObjectRelease(v13);
  swift_release(v14, v17);
}

- (void)_addStickerToStoreWithRepresentations:(id)a3 sourceRect:(CGRect)a4 effect:(int64_t)a5 completion:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, int64_t, _QWORD, uint64_t (*)(), uint64_t, double, double, double, double);
  _TtC22StickersUltraExtension28StickersParentViewController *v18;
  uint64_t v19;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v13 = _Block_copy(a6);
  v14 = sub_10000D5F4(0, &qword_10009B880, _UIStickerRepresentation_ptr);
  v15 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v14);
  v16 = swift_allocObject(&unk_10008B918, 24, 7);
  *(_QWORD *)(v16 + 16) = v13;
  v17 = *(void (**)(uint64_t, int64_t, _QWORD, uint64_t (*)(), uint64_t, double, double, double, double))((swift_isaMask & (uint64_t)self->super.super.super.super.super.isa) + 0x330);
  v18 = self;
  v17(v15, a5, 0, sub_10002E330, v16, x, y, width, height);

  swift_bridgeObjectRelease(v15);
  swift_release(v16, v19);
}

- (void)_addStickerToStoreWithUISticker:(id)a3 sourceRect:(CGRect)a4 completion:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  void *v11;
  char *v12;
  _TtC22StickersUltraExtension28StickersParentViewController *v13;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = _Block_copy(a5);
  _Block_copy(v11);
  v12 = (char *)a3;
  v13 = self;
  sub_10002AEA4(v12, v13, (void (**)(const void *, _QWORD, void *))v11, x, y, width, height);
  _Block_release(v11);
  _Block_release(v11);

}

- (void)_prepareForAddStickerFromSubjectLift
{
  _TtC22StickersUltraExtension28StickersParentViewController *v2;

  v2 = self;
  sub_100020098();

}

- (void)_addStickerAnimationDidFinishWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC22StickersUltraExtension28StickersParentViewController *v6;
  uint64_t v7;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_10008B8C8, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_100020508((uint64_t)sub_10002D8E4, v5);

  swift_release(v5, v7);
}

- (void)_didRemoveStickerPreview
{
  _TtC22StickersUltraExtension28StickersParentViewController *v2;

  v2 = self;
  sub_100020784();

}

- (void)_animatedStickerCreationProgressChanged:(id)a3 progress:(double)a4
{
  uint64_t v6;
  uint64_t (*v7)(void);
  _TtC22StickersUltraExtension28StickersParentViewController *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  v7 = *(uint64_t (**)(void))((swift_isaMask & (uint64_t)self->super.super.super.super.super.isa) + 0x100);
  v8 = self;
  v9 = (_QWORD *)v7();
  if (v9
    && (v10 = v9, v11 = (void *)(*(uint64_t (**)(void))((swift_isaMask & *v9) + 0x118))(), v10, v11))
  {
    v12 = v11;
    dispatch thunk of StickerCollectionViewController.updateStickerViewWithProgress(_:progress:)(v6, a4);

    swift_bridgeObjectRelease(v6);
  }
  else
  {

    swift_bridgeObjectRelease(v6);
  }
}

- (_TtC22StickersUltraExtension28StickersParentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC22StickersUltraExtension28StickersParentViewController *)sub_10002421C(v5, v7, a4);
}

- (_TtC22StickersUltraExtension28StickersParentViewController)initWithCoder:(id)a3
{
  return (_TtC22StickersUltraExtension28StickersParentViewController *)sub_1000244D4(a3);
}

- (_TtC22StickersUltraExtension28StickersParentViewController)initWithShouldBeSheetPresentationControllerDelegate:(BOOL)a3
{
  return (_TtC22StickersUltraExtension28StickersParentViewController *)sub_100024748(a3);
}

- (void)stickerCollectionViewController:(id)a3 requestsMSStickerFromSticker:(id)a4 completionHandler:(id)a5
{
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _TtC22StickersUltraExtension28StickersParentViewController *v12;
  uint64_t v13;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject(&unk_10008B8A0, 24, 7);
  *(_QWORD *)(v9 + 16) = v8;
  v10 = a3;
  v11 = a4;
  v12 = self;
  Sticker.asMSSticker(completionHandler:)((void (*)(id, _QWORD))sub_10002E32C, v9);

  swift_release(v9, v13);
}

- (void)stickerCollectionViewController:(id)a3 requestsDisplayStickerFor:(id)a4 completionHandler:(id)a5
{
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _TtC22StickersUltraExtension28StickersParentViewController *v12;
  uint64_t v13;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject(&unk_10008B878, 24, 7);
  *(_QWORD *)(v9 + 16) = v8;
  v10 = a3;
  v11 = a4;
  v12 = self;
  Sticker.asDisplaySticker(completionHandler:)((uint64_t)sub_10002D7C8, v9);

  swift_release(v9, v13);
}

- (id)stickerCollectionViewController:(id)a3 requestsMSStickerFromURL:(id)a4 externalURI:(id)a5 localizedDescription:(id)a6 error:(id *)a7
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  _TtC22StickersUltraExtension28StickersParentViewController *v23;
  id v24;
  id *v26;

  v26 = a7;
  v12 = type metadata accessor for URL(0);
  v13 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = (char *)&v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v18 = v17;
  v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
  v21 = v20;
  v22 = a3;
  v23 = self;
  v24 = sub_10002B848((uint64_t)v15, v16, v18, v19, v21);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  swift_bridgeObjectRelease(v18);
  swift_bridgeObjectRelease(v21);

  return v24;
}

- (void)stickerCollectionViewController:(id)a3 performTransitionForView:(id)a4 withImage:(id)a5 bounds:(CGRect)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v13;
  id v14;
  id v15;
  _TtC22StickersUltraExtension28StickersParentViewController *v16;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = self;
  sub_10002B9E8(v14, v15, x, y, width, height);

}

- (void)stickerCollectionViewController:(id)a3 didSelectSticker:(id)a4
{
  id v6;
  id v7;
  _TtC22StickersUltraExtension28StickersParentViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_100024DB8();

}

- (void)stickerCollectionViewController:(id)a3 didSelectSticker:(id)a4 withFrame:(CGRect)a5
{
  uint64_t v8;
  _TtC22StickersUltraExtension28StickersParentViewController *v9;
  id v10;
  id v11;
  uint64_t v12;
  CGRect v13;
  char v14;

  v13 = a5;
  v14 = 0;
  v8 = swift_allocObject(&unk_10008B850, 57, 7);
  *(_QWORD *)(v8 + 16) = self;
  sub_1000292DC((uint64_t)&v13, v8 + 24);
  v9 = self;
  v10 = a3;
  v11 = a4;
  Sticker.asMSSticker(completionHandler:)(sub_10002E480, v8);
  swift_release(v8, v12);
  sub_100024DB8();

}

- (void)stickerCollectionViewControllerPrepareForNewSticker:(id)a3 fromPhotoPicker:(BOOL)a4
{
  id v6;
  _TtC22StickersUltraExtension28StickersParentViewController *v7;

  v6 = a3;
  v7 = self;
  sub_1000255AC(v6, a4);

}

- (void)setPhotoPickerDidDismissClosure:(id)a3
{
  void *v4;
  uint64_t v5;
  void (*v6)(uint64_t (*)(), uint64_t, __n128);
  _TtC22StickersUltraExtension28StickersParentViewController *v7;
  __n128 v8;
  uint64_t v9;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_10008B828, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  v6 = *(void (**)(uint64_t (*)(), uint64_t, __n128))((swift_isaMask & (uint64_t)self->super.super.super.super.super.isa)
                                                             + 0x120);
  v7 = self;
  v8 = swift_retain(v5);
  v6(sub_10002D794, v5, v8);

  swift_release(v5, v9);
}

- (void)stickerCollectionViewControllerRequestsMoreStickers:(id)a3
{
  -[StickersParentViewController requestPresentationStyle:](self, "requestPresentationStyle:", 1);
}

- (BOOL)isExpanded
{
  return -[StickersParentViewController presentationStyle](self, "presentationStyle") == (id)1;
}

- (void)stickerCollectionViewController:(id)a3 isPresenting:(id)a4
{
  id v6;
  id v7;
  _TtC22StickersUltraExtension28StickersParentViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_10002BB98(v7);

}

- (void)stickerCollectionViewController:(id)a3 isDonePresenting:(id)a4
{
  id v6;
  id v7;
  _TtC22StickersUltraExtension28StickersParentViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_10002BC78();

}

- (void)startEditingPayload:(id)a3 dismiss:(BOOL)a4
{
  id v6;
  _TtC22StickersUltraExtension28StickersParentViewController *v7;

  v6 = a3;
  v7 = self;
  sub_10002C7DC(a3);

}

- (void)startEditingPayload:(id)a3 dismiss:(BOOL)a4 forPlugin:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtC22StickersUltraExtension28StickersParentViewController *v11;

  if (a5)
  {
    v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
    v9 = v8;
  }
  else
  {
    v7 = 0;
    v9 = 0;
  }
  v10 = a3;
  v11 = self;
  sub_10002CA90(a3, v7, v9);

  swift_bridgeObjectRelease(v9);
}

- (void)openURL:(NSURL *)a3 pluginID:(NSString *)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  NSURL *v17;
  NSString *v18;
  _TtC22StickersUltraExtension28StickersParentViewController *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v9 = sub_10000A66C(&qword_10009BA60);
  __chkstk_darwin(v9);
  v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject(&unk_10008B7B0, 48, 7);
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject(&unk_10008B7D8, 48, 7);
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_10009BAD0;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject(&unk_10008B800, 48, 7);
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_10009BAD8;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  v20 = sub_100028ED0((uint64_t)v11, (uint64_t)&unk_10009BAE0, (uint64_t)v16);
  swift_release(v20, v21);
}

- (void)openURL:(NSURL *)a3 applicationIdentifier:(NSString *)a4 pluginID:(NSString *)a5 completionHandler:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  NSURL *v19;
  NSString *v20;
  NSString *v21;
  _TtC22StickersUltraExtension28StickersParentViewController *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v11 = sub_10000A66C(&qword_10009BA60);
  __chkstk_darwin(v11);
  v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  v15 = (_QWORD *)swift_allocObject(&unk_10008B738, 56, 7);
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  v16 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (_QWORD *)swift_allocObject(&unk_10008B760, 48, 7);
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_10009BAB0;
  v17[5] = v15;
  v18 = (_QWORD *)swift_allocObject(&unk_10008B788, 48, 7);
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_10009BAB8;
  v18[5] = v17;
  v19 = a3;
  v20 = a4;
  v21 = a5;
  v22 = self;
  v23 = sub_100028ED0((uint64_t)v13, (uint64_t)&unk_10009BAC0, (uint64_t)v18);
  swift_release(v23, v24);
}

- (void)dismissAndReloadInputViews:(BOOL)a3
{
  -[StickersParentViewController dismiss](self, "dismiss", a3);
}

- (void)requestPresentationStyleExpanded:(BOOL)a3
{
  -[StickersParentViewController requestPresentationStyle:](self, "requestPresentationStyle:", a3);
}

- (void)presentAlertWithTitle:(NSString *)a3 message:(NSString *)a4 buttonTitle:(NSString *)a5 completion:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  NSString *v19;
  NSString *v20;
  NSString *v21;
  _TtC22StickersUltraExtension28StickersParentViewController *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v11 = sub_10000A66C(&qword_10009BA60);
  __chkstk_darwin(v11);
  v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  v15 = (_QWORD *)swift_allocObject(&unk_10008B698, 56, 7);
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  v16 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (_QWORD *)swift_allocObject(&unk_10008B6C0, 48, 7);
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_10009BA70;
  v17[5] = v15;
  v18 = (_QWORD *)swift_allocObject(&unk_10008B6E8, 48, 7);
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_10009BA80;
  v18[5] = v17;
  v19 = a3;
  v20 = a4;
  v21 = a5;
  v22 = self;
  v23 = sub_100028ED0((uint64_t)v13, (uint64_t)&unk_10009BA90, (uint64_t)v18);
  swift_release(v23, v24);
}

- (id)dragControllerTranscriptDelegate
{
  return 0;
}

- (void)commitSticker:(id)a3 stickerFrame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  _TtC22StickersUltraExtension28StickersParentViewController *v11;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a3;
  v11 = self;
  sub_100028628(a3, x, y, width, height);

}

- (void)commitSticker:(id)a3 withDragTarget:(id)a4 draggedSticker:(id)a5
{
  id v9;
  id v10;
  id v11;
  _TtC22StickersUltraExtension28StickersParentViewController *v12;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = self;
  sub_10002CCFC(a3);

}

@end
