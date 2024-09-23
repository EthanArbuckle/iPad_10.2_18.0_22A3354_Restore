@implementation ICMediaActionMenu

- (BOOL)isCameraAvailable
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___ICMediaActionMenu_isCameraAvailable);
}

- (BOOL)isLiveTextAvailable
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___ICMediaActionMenu_isLiveTextAvailable);
}

- (BOOL)isPasswordProtected
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___ICMediaActionMenu_isPasswordProtected);
}

- (BOOL)isInSecureScreen
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___ICMediaActionMenu_isInSecureScreen);
}

- (UIView)presentingSourceView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                           + OBJC_IVAR___ICMediaActionMenu_presentingSourceView));
}

- (BOOL)hasSidecarMenuItems
{
  ICMediaActionMenu *v2;
  char v3;

  v2 = self;
  v3 = sub_1DD939FE0();

  return v3 & 1;
}

- (ICSidecarInsertMenuController)sidecarMenuController
{
  return (ICSidecarInsertMenuController *)sub_1DD9366A0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ICMediaActionMenu_sidecarMenuController);
}

- (void)setSidecarMenuController:(id)a3
{
  sub_1DD936740();
}

- (ICMediaActionMenu)initWithIsPasswordProtected:(BOOL)a3 isInSecureScreen:(BOOL)a4 presentingViewController:(id)a5 presentingBarButtonItem:(id)a6 presentingSourceView:(id)a7 sidecarMenuController:(id)a8 completion:(id)aBlock
{
  uint64_t (*v15)();
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;

  v15 = (uint64_t (*)())_Block_copy(aBlock);
  if (v15)
  {
    v16 = swift_allocObject();
    *(_QWORD *)(v16 + 16) = v15;
    v15 = sub_1DD93D20C;
  }
  else
  {
    v16 = 0;
  }
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  return (ICMediaActionMenu *)MediaActionMenu.init(isPasswordProtected:isInSecureScreen:presentingViewController:presentingBarButtonItem:presentingSourceView:sidecarMenuController:completion:)(a3, a4, v17, a6, a7, a8, (uint64_t)v15, v16);
}

- (ICMediaActionMenu)initWithIsCameraAvailable:(BOOL)a3 isLiveTextAvailable:(BOOL)a4 isPasswordProtected:(BOOL)a5 isInSecureScreen:(BOOL)a6 presentingViewController:(id)a7 presentingBarButtonItem:(id)a8 presentingSourceView:(id)a9 sidecarMenuController:(id)a10 completion:(id)aBlock
{
  uint64_t (*v14)();
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  ICMediaActionMenu *v20;

  v14 = (uint64_t (*)())_Block_copy(aBlock);
  if (v14)
  {
    v15 = swift_allocObject();
    *(_QWORD *)(v15 + 16) = v14;
    v14 = sub_1DD93D20C;
  }
  else
  {
    v15 = 0;
  }
  v16 = a7;
  v17 = a8;
  v18 = a9;
  v19 = a10;
  v20 = (ICMediaActionMenu *)sub_1DD93CCA4(a3, a4, a5, a6, (uint64_t)v16, a8, a9, (uint64_t)a10, (uint64_t)v14, v15);
  sub_1DD8FE450((uint64_t)v14);

  return v20;
}

+ (ICMediaActionMenu)menuWithIsCameraAvailable:(BOOL)a3 isLiveTextAvailable:(BOOL)a4 isPasswordProtected:(BOOL)a5 isInSecureScreen:(BOOL)a6 presentingViewController:(id)a7 presentingBarButtonItem:(id)a8 presentingSourceView:(id)a9 deferredChildren:(BOOL)a10 sidecarMenuController:(id)a11 completion:(id)a12
{
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t (*v17)();
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  id v25;

  v14 = _Block_copy(a12);
  if (v14)
  {
    v15 = v14;
    v16 = swift_allocObject();
    *(_QWORD *)(v16 + 16) = v15;
    v17 = sub_1DD93D20C;
  }
  else
  {
    v17 = 0;
    v16 = 0;
  }
  v18 = objc_allocWithZone((Class)type metadata accessor for MediaActionMenu());
  v19 = a7;
  v25 = a8;
  v20 = a9;
  v21 = a11;
  sub_1DD907DC8((uint64_t)v17);
  v22 = sub_1DD93CCA4(a3, a4, a5, a6, (uint64_t)v19, a8, a9, (uint64_t)a11, (uint64_t)v17, v16);
  sub_1DD8FE450((uint64_t)v17);
  sub_1DD93CE80();
  v23 = (void *)sub_1DD9D0E08();

  sub_1DD8FE450((uint64_t)v17);
  return (ICMediaActionMenu *)v23;
}

+ (ICMediaActionMenu)menuWithIsPasswordProtected:(BOOL)a3 isInSecureScreen:(BOOL)a4 presentingViewController:(id)a5 presentingBarButtonItem:(id)a6 presentingSourceView:(id)a7 sidecarMenuController:(id)a8 completion:(id)aBlock
{
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  char v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  id v28;
  id v29;
  id v30;
  char v31;
  uint64_t (*v34)();

  v13 = _Block_copy(aBlock);
  if (v13)
  {
    v14 = v13;
    v15 = swift_allocObject();
    *(_QWORD *)(v15 + 16) = v14;
    v34 = sub_1DD93D20C;
  }
  else
  {
    v34 = 0;
    v15 = 0;
  }
  v16 = (void *)objc_opt_self();
  v17 = a5;
  v18 = a6;
  v30 = a7;
  v29 = a8;
  v31 = objc_msgSend(v16, sel_isCameraAvailable);
  v28 = a6;
  v19 = objc_msgSend((id)objc_opt_self(), sel_ic_isLiveTextAvailable);
  v20 = objc_allocWithZone((Class)type metadata accessor for MediaActionMenu());
  v21 = v17;
  v22 = v18;
  v23 = v30;
  v24 = v29;
  sub_1DD907DC8((uint64_t)v34);
  v25 = sub_1DD93CCA4(v31, v19, a3, a4, (uint64_t)v21, v28, a7, (uint64_t)a8, (uint64_t)v34, v15);
  sub_1DD8FE450((uint64_t)v34);

  sub_1DD93CE80();
  v26 = (void *)sub_1DD9D0E08();

  sub_1DD8FE450((uint64_t)v34);
  return (ICMediaActionMenu *)v26;
}

- (id)completion
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  _QWORD aBlock[6];

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___ICMediaActionMenu_completion);
  swift_beginAccess();
  if (!*v2)
    return 0;
  v3 = v2[1];
  aBlock[4] = *v2;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1DD93A314;
  aBlock[3] = &block_descriptor_45;
  v4 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  return v4;
}

- (void)setCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_1DD93D16C;
  }
  else
  {
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___ICMediaActionMenu_completion);
  swift_beginAccess();
  v7 = *v6;
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_1DD8FE450(v7);
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)sub_1DD9366A0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___ICMediaActionMenu_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  sub_1DD936740();
}

- (UIBarButtonItem)presentingBarButtonItem
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___ICMediaActionMenu_presentingBarButtonItem);
  swift_beginAccess();
  return (UIBarButtonItem *)*v2;
}

- (void)setPresentingBarButtonItem:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___ICMediaActionMenu_presentingBarButtonItem);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (id)menuSections
{
  uint64_t v3;
  ICMediaActionMenu *v4;
  void *v5;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDBFA2F0);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1DD9E8B80;
  v4 = self;
  *(_QWORD *)(v3 + 32) = sub_1DD93B544();
  sub_1DD9D22C0();

  sub_1DD7C0C74(0, (unint64_t *)&qword_1F03F69E0);
  v5 = (void *)sub_1DD9D229C();
  swift_bridgeObjectRelease();
  return v5;
}

- (void)willShowMenu
{
  char *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  ICMediaActionMenu *v8;

  v3 = (char *)self + OBJC_IVAR___ICMediaActionMenu_presentingViewController;
  swift_beginAccess();
  v4 = MEMORY[0x1DF0DF9A8](v3);
  if (v4)
  {
    v5 = (void *)v4;
    objc_opt_self();
    v6 = swift_dynamicCastObjCClass();
    if (v6)
    {
      v7 = (void *)v6;
      v8 = self;
      objc_msgSend(v7, sel_addNewNoteIfNeeded);

    }
  }
}

- (id)makeMenu
{
  ICMediaActionMenu *v3;
  void *v4;

  type metadata accessor for MediaActionMenu();
  sub_1DD93CE80();
  v3 = self;
  v4 = (void *)sub_1DD9D0E08();

  return v4;
}

- (ICMediaActionMenu)init
{
  ICMediaActionMenu *result;

  result = (ICMediaActionMenu *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_unknownObjectWeakDestroy();
  sub_1DD8FE450(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___ICMediaActionMenu_completion));
  swift_unknownObjectWeakDestroy();

}

@end
