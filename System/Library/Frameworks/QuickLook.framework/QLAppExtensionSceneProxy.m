@implementation QLAppExtensionSceneProxy

- (void)crashWithReply:(id)a3
{
  void *v3;

  v3 = _Block_copy(a3);
  _Block_release(v3);
}

- (void)setAllowInteractiveTransitions:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549B97E0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = swift_allocObject();
  *(_BYTE *)(v11 + 16) = a3;
  *(_QWORD *)(v11 + 24) = v10;
  *(_QWORD *)(v11 + 32) = self;
  v12 = sub_20D5A6C78();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_2549B8808;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2549B8810;
  v14[5] = v13;
  swift_retain();
  sub_20D59F40C((uint64_t)v9, (uint64_t)&unk_2549B8818, (uint64_t)v14);
  swift_release();
}

- (void)setHostApplicationBundleIdentifier:(id)a3
{
  sub_20D573B7C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_20D571110);
}

- (void)configureWithNumberOfItems:(int64_t)a3 currentPreviewItemIndex:(unint64_t)a4 itemProvider:(id)a5 stateManager:(id)a6 fullScreen:(BOOL)a7
{
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_retain();
  sub_20D5711F0(a3, a4, (uint64_t)a5, (uint64_t)a6, a7);
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (void)configureWithNumberOfItems:(int64_t)a3 currentPreviewItemIndex:(unint64_t)a4 itemProvider:(id)a5 stateManager:(id)a6
{
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_retain();
  sub_20D571550(a3, a4, (uint64_t)a5, (uint64_t)a6);
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (void)setCurrentPreviewItemIndex:(int64_t)a3 animated:(BOOL)a4
{
  sub_20D5749A0((uint64_t)self, (uint64_t)a2, a3, a4, (void (*)(uint64_t, uint64_t))sub_20D57188C);
}

- (void)hostApplicationDidEnterBackground:(BOOL)a3
{
  sub_20D573B04((uint64_t)self, (uint64_t)a2, a3, (void (*)(uint64_t))sub_20D5718BC);
}

- (void)hostApplicationDidBecomeActive
{
  sub_20D5729B8((uint64_t)self, (uint64_t)a2, (void (*)(uint64_t))sub_20D5718EC);
}

- (void)toolbarButtonsForTraitCollection:(UITraitCollection *)a3 withCompletionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  UITraitCollection *v15;
  uint64_t v16;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549B97E0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_20D5A6C78();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_2549B87E8;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2549B87F0;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_20D59F40C((uint64_t)v9, (uint64_t)&unk_2549B87F8, (uint64_t)v14);
  swift_release();
}

- (void)toolbarButtonPressedWithIdentifier:(NSString *)a3 completionHandler:(id)a4
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
  uint64_t v16;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549B97E0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_20D5A6C78();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_2549B87C8;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2549B87D0;
  v14[5] = v13;
  v15 = a3;
  swift_retain();
  sub_20D59F40C((uint64_t)v9, (uint64_t)&unk_2549B87D8, (uint64_t)v14);
  swift_release();
}

- (void)shouldDisplayLockActivityWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549B97E0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_20D5A6C78();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_2549B87A8;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_2549B87B0;
  v12[5] = v11;
  swift_retain();
  sub_20D59F40C((uint64_t)v7, (uint64_t)&unk_2549B87B8, (uint64_t)v12);
  swift_release();
}

- (void)requestLockForCurrentItem
{
  sub_20D5729B8((uint64_t)self, (uint64_t)a2, (void (*)(uint64_t))sub_20D572988);
}

- (void)keyCommandsWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549B97E0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_20D5A6C78();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_2549B8788;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_2549B8790;
  v12[5] = v11;
  swift_retain();
  sub_20D59F40C((uint64_t)v7, (uint64_t)&unk_2549B8798, (uint64_t)v12);
  swift_release();
}

- (void)keyCommandWasPerformed:(id)a3
{
  sub_20D57578C((uint64_t)self, (uint64_t)a2, a3, (void (*)(id))sub_20D572F70);
}

- (void)setAppearance:(id)a3 animated:(BOOL)a4
{
  id v5;

  v5 = a3;
  swift_retain();
  sub_20D572FA0((uint64_t)v5, a4);
  swift_release();

}

- (void)notifyFirstTimeAppearanceWithActions:(unint64_t)a3
{
  swift_retain();
  sub_20D573014(a3);
  swift_release();
}

- (void)notifyStateRestorationUserInfo:(id)a3
{
  void *v3;

  if (a3)
    v3 = (void *)sub_20D5A6AA4();
  else
    v3 = 0;
  swift_retain();
  sub_20D573270(v3);
  swift_release();
  swift_bridgeObjectRelease();
}

- (void)previewItemDisplayState:(id)a3 wasAppliedToItemAtIndex:(unint64_t)a4
{
  sub_20D574C54((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(_BYTE *, uint64_t))sub_20D57350C);
}

- (void)startTransitionWithSourceViewProvider:(QLTransitionContext *)a3 transitionController:(QLTransitionControllerProtocol *)a4 presenting:(BOOL)a5 useInteractiveTransition:(BOOL)a6 completionHandler:(id)a7
{
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  QLTransitionContext *v21;
  uint64_t v22;

  v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549B97E0);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = _Block_copy(a7);
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = a3;
  *(_QWORD *)(v17 + 24) = a4;
  *(_BYTE *)(v17 + 32) = a5;
  *(_BYTE *)(v17 + 33) = a6;
  *(_QWORD *)(v17 + 40) = v16;
  *(_QWORD *)(v17 + 48) = self;
  v18 = sub_20D5A6C78();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v15, 1, 1, v18);
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_2549B8768;
  v19[5] = v17;
  v20 = (_QWORD *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  v20[4] = &unk_2549B8770;
  v20[5] = v19;
  v21 = a3;
  swift_unknownObjectRetain();
  swift_retain();
  sub_20D59F40C((uint64_t)v15, (uint64_t)asc_2549B8778, (uint64_t)v20);
  swift_release();
}

- (void)tearDownTransition:(BOOL)a3
{
  sub_20D573B04((uint64_t)self, (uint64_t)a2, a3, (void (*)(uint64_t))sub_20D573AD4);
}

- (void)setLoadingString:(id)a3
{
  sub_20D573B7C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_20D573B44);
}

- (void)overrideParentApplicationDisplayIdentifierWithIdentifier:(id)a3
{
  sub_20D573B7C((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_20D573BD4);
}

- (void)preparePreviewCollectionForInvalidationWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549B97E0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_20D5A6C78();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_2549B8748;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_2549B8750;
  v12[5] = v11;
  swift_retain();
  sub_20D59F40C((uint64_t)v7, (uint64_t)asc_2549B8758, (uint64_t)v12);
  swift_release();
}

- (void)invalidateServiceWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549B97E0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_20D5A6C78();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_2549B8728;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_2549B8730;
  v12[5] = v11;
  swift_retain();
  sub_20D59F40C((uint64_t)v7, (uint64_t)asc_2549B8738, (uint64_t)v12);
  swift_release();
}

- (void)hostViewControlerTransitionToState:(unint64_t)a3 animated:(BOOL)a4
{
  sub_20D5749A0((uint64_t)self, (uint64_t)a2, a3, a4, (void (*)(uint64_t, uint64_t))sub_20D574750);
}

- (void)setPreviewItemDisplayState:(id)a3 onItemAtIndex:(unint64_t)a4
{
  sub_20D574C54((uint64_t)self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(_BYTE *, uint64_t))sub_20D5749E8);
}

- (void)prepareForActionSheetPresentationWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549B97E0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = sub_20D5A6C78();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_2549B8708;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_2549B8710;
  v12[5] = v11;
  swift_retain();
  sub_20D59F40C((uint64_t)v7, (uint64_t)&unk_2549B8718, (uint64_t)v12);
  swift_release();
}

- (void)actionSheetDidDismiss
{
  sub_20D5729B8((uint64_t)self, (uint64_t)a2, (void (*)(uint64_t))sub_20D57513C);
}

- (void)documentMenuActionWillBegin
{
  sub_20D5729B8((uint64_t)self, (uint64_t)a2, (void (*)(uint64_t))sub_20D57535C);
}

- (void)hostViewControllerBackgroundColorChanged:(id)a3
{
  sub_20D57578C((uint64_t)self, (uint64_t)a2, a3, (void (*)(id))sub_20D575570);
}

- (void)saveIntoPhotoLibraryMediaWithURLWrapper:(id)a3 previewItemType:(unint64_t)a4 completionHandler:(id)a5
{
  void *v7;
  uint64_t v8;
  id v9;

  v7 = _Block_copy(a5);
  if (v7)
  {
    v8 = swift_allocObject();
    *(_QWORD *)(v8 + 16) = v7;
    v7 = sub_20D57772C;
  }
  else
  {
    v8 = 0;
  }
  v9 = a3;
  swift_retain();
  sub_20D5757D8((uint64_t)v9, a4, v7, v8);
  sub_20D57771C((uint64_t)v7);
  swift_release();

}

- (void)setIsContentManaged:(BOOL)a3
{
  sub_20D573B04((uint64_t)self, (uint64_t)a2, a3, (void (*)(uint64_t))sub_20D575BAC);
}

- (void)saveCurrentPreviewEditsSynchronously:(BOOL)a3 withCompletionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549B97E0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = swift_allocObject();
  *(_BYTE *)(v11 + 16) = a3;
  *(_QWORD *)(v11 + 24) = v10;
  *(_QWORD *)(v11 + 32) = self;
  v12 = sub_20D5A6C78();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_2549B86E8;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = asc_2549B86F0;
  v14[5] = v13;
  swift_retain();
  sub_20D59F40C((uint64_t)v9, (uint64_t)&unk_2549B86F8, (uint64_t)v14);
  swift_release();
}

- (void)getPreviewCollectionUUIDWithCompletionHandlerWithCompletionHandler:(id)a3
{
  void *v3;
  uint64_t v4;

  v3 = _Block_copy(a3);
  _Block_copy(v3);
  v4 = swift_retain();
  sub_20D5774D4(v4, (void (**)(_QWORD, _QWORD))v3);
  _Block_release(v3);
  _Block_release(v3);
  swift_release();
}

- (void)setNotificationCenter:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)objc_opt_self();
  swift_unknownObjectRetain();
  swift_retain();
  v5 = objc_msgSend(v4, sel_sharedInstance);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, sel_setRemoteNotificationCenter_, a3);
    swift_unknownObjectRelease();
    swift_release();

  }
  else
  {
    swift_unknownObjectRelease();
    swift_release();
  }
}

- (void)getNetworkObserverWithCompletionBlock:(id)a3
{
  void (**v3)(void *, id);
  void *v4;
  id v5;

  v3 = (void (**)(void *, id))_Block_copy(a3);
  v4 = (void *)objc_opt_self();
  swift_retain();
  v5 = objc_msgSend(v4, sel_sharedInstance);
  v3[2](v3, v5);

  _Block_release(v3);
  swift_release();
}

- (void)preparePreviewCollectionForInvalidationWithCompletionHandlerWithCompletionHandler:(id)a3
{
  void *v3;
  uint64_t v4;

  v3 = _Block_copy(a3);
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v3;
  swift_retain();
  QLAppExtensionSceneProxy.preparePreviewCollectionForInvalidationWithCompletionHandler(completionHandler:)((uint64_t)sub_20D5774C8, v4);
  swift_release();
  swift_release();
}

@end
