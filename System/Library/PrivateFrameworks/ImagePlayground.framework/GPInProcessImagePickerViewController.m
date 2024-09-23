@implementation GPInProcessImagePickerViewController

+ (BOOL)available
{
  return _sSo36GPInProcessImagePickerViewControllerC0C10PlaygroundE11isAvailableSbvgZ_0() & 1;
}

+ (BOOL)isAvailableOnCurrentDevice
{
  return objc_msgSend(a1, sel_isAvailable);
}

- (int64_t)style
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___GPInProcessImagePickerViewController_style);
  swift_beginAccess();
  return *v2;
}

- (void)setStyle:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR___GPInProcessImagePickerViewController_style);
  swift_beginAccess();
  *v4 = a3;
}

- (NSArray)selectedAssets
{
  void *v2;

  swift_beginAccess();
  type metadata accessor for GPExportablePhotoAsset(0);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_23EFD16E8();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setSelectedAssets:(id)a3
{
  uint64_t v4;
  uint64_t *v5;

  type metadata accessor for GPExportablePhotoAsset(0);
  v4 = sub_23EFD1700();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___GPInProcessImagePickerViewController_selectedAssets);
  swift_beginAccess();
  *v5 = v4;
  swift_bridgeObjectRelease();
}

- (GPImagePickerViewControllerDelegate)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___GPInProcessImagePickerViewController_delegate;
  swift_beginAccess();
  return (GPImagePickerViewControllerDelegate *)(id)MEMORY[0x242663B58](v2);
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (GPAppleConnectTokenProvider)appleConnectTokenProvider
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.super.isa
            + OBJC_IVAR___GPInProcessImagePickerViewController_appleConnectTokenProvider);
  swift_beginAccess();
  return (GPAppleConnectTokenProvider *)*v2;
}

- (void)setAppleConnectTokenProvider:(id)a3
{
  void **v5;
  void *v6;
  id v7;
  GPInProcessImagePickerViewController *v8;

  v5 = (void **)((char *)&self->super.super.super.isa
               + OBJC_IVAR___GPInProcessImagePickerViewController_appleConnectTokenProvider);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  v7 = a3;
  v8 = self;

  if (*v5)
    sub_23ECDFD88();

}

- (BOOL)isLoadingRecipe
{
  uint64_t v2;

  v2 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR___GPInProcessImagePickerViewController_imagePickerViewController);
  if (v2)
    return *(_BYTE *)(v2 + qword_256DDA310);
  else
    return 0;
}

- (void)setIsLoadingRecipe:(BOOL)a3
{
  GPInProcessImagePickerViewController *v4;

  v4 = self;
  GPInProcessImagePickerViewController.isLoadingRecipe.setter(a3);

}

- (GPRecipe)recipe
{
  uint64_t v2;

  v2 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR___GPInProcessImagePickerViewController_imagePickerViewController);
  if (v2)
    return (GPRecipe *)*(id *)(v2 + qword_256DDA318);
  else
    return (GPRecipe *)0;
}

- (void)setRecipe:(id)a3
{
  id v5;
  GPInProcessImagePickerViewController *v6;

  v5 = a3;
  v6 = self;
  GPInProcessImagePickerViewController.recipe.setter(a3);

}

- (GPInProcessImagePickerViewController)initWithStyle:(int64_t)a3
{
  return (GPInProcessImagePickerViewController *)GPInProcessImagePickerViewController.init(style:)(a3);
}

- (GPInProcessImagePickerViewController)initWithCoder:(id)a3
{
  return (GPInProcessImagePickerViewController *)GPInProcessImagePickerViewController.init(coder:)(a3);
}

- (void)closeComposingViewIfNeeded
{
  GPInProcessImagePickerViewController *v2;

  v2 = self;
  GPInProcessImagePickerViewController.closeComposingViewIfNeeded()();

}

- (void)delegate:(id)a3 didStageAssetWithIdentifier:(id)a4
{
  sub_23ECE05B4(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_23ECE1804);
}

- (void)delegate:(id)a3 didUnstageAssetWithIdentifier:(id)a4
{
  sub_23ECE05B4(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_23ECE19FC);
}

- (NSString)localizedCreateButtonTitle
{
  void *v2;

  if (*(_QWORD *)((char *)&self->super.super._responderFlags
                 + OBJC_IVAR___GPInProcessImagePickerViewController_localizedCreateButtonTitle))
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_23EFD14E4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (void)setLocalizedCreateButtonTitle:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  GPInProcessImagePickerViewController *v7;
  uint64_t v8;
  os_log_type_t v9;
  uint8_t *v10;
  NSObject *oslog;

  if (a3)
  {
    v4 = sub_23EFD1514();
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___GPInProcessImagePickerViewController_localizedCreateButtonTitle);
  *v6 = v4;
  v6[1] = v5;
  v7 = self;
  swift_bridgeObjectRelease();
  if (qword_256DCF370 != -1)
    swift_once();
  v8 = sub_23EFCEDB4();
  __swift_project_value_buffer(v8, (uint64_t)qword_256DD08E8);
  oslog = sub_23EFCED9C();
  v9 = sub_23EFD1A90();
  if (os_log_type_enabled(oslog, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_23ECD3000, oslog, v9, "Not implemented yet", v10, 2u);
    MEMORY[0x242663A74](v10, -1, -1);
  }

}

- (GPInProcessImagePickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  GPInProcessImagePickerViewController *result;

  v4 = a4;
  result = (GPInProcessImagePickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_23ECE2558((uint64_t)self + OBJC_IVAR___GPInProcessImagePickerViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___GPInProcessImagePickerViewController_appleConnectTokenProvider));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___GPInProcessImagePickerViewController_imagePickerViewController));
  swift_bridgeObjectRelease();
}

@end
