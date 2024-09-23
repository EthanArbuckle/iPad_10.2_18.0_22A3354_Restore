@implementation GPImagePickerViewController

+ (BOOL)available
{
  return _sSo36GPInProcessImagePickerViewControllerC0C10PlaygroundE11isAvailableSbvgZ_0() & 1;
}

+ (BOOL)isAvailableOnCurrentDevice
{
  return _sSo36GPInProcessImagePickerViewControllerC0C10PlaygroundE11isAvailableSbvgZ_0() & 1;
}

- (int64_t)style
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___GPImagePickerViewController_style);
  swift_beginAccess();
  return *v2;
}

- (void)setStyle:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR___GPImagePickerViewController_style);
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
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___GPImagePickerViewController_selectedAssets);
  swift_beginAccess();
  *v5 = v4;
  swift_bridgeObjectRelease();
}

- (NSString)localizedCreateButtonTitle
{
  char *v2;
  void *v3;

  v2 = (char *)self + OBJC_IVAR___GPImagePickerViewController_localizedCreateButtonTitle;
  swift_beginAccess();
  if (!*((_QWORD *)v2 + 1))
    return (NSString *)0;
  swift_bridgeObjectRetain();
  v3 = (void *)sub_23EFD14E4();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)setLocalizedCreateButtonTitle:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  GPImagePickerViewController *v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;

  if (a3)
  {
    v4 = sub_23EFD1514();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___GPImagePickerViewController_localizedCreateButtonTitle);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  v8 = self;
  swift_bridgeObjectRelease();
  if (qword_256DCF3B8 != -1)
    swift_once();
  v9 = sub_23EFCEDB4();
  __swift_project_value_buffer(v9, (uint64_t)qword_256DD09C0);
  v10 = sub_23EFCED9C();
  v11 = sub_23EFD1A90();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_23ECD3000, v10, v11, "Not implemented yet", v12, 2u);
    MEMORY[0x242663A74](v12, -1, -1);
  }

}

- (BOOL)isLoadingRecipe
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___GPImagePickerViewController_isLoadingRecipe;
  swift_beginAccess();
  return *v2;
}

- (void)setIsLoadingRecipe:(BOOL)a3
{
  BOOL *v5;
  GPImagePickerViewController *v6;

  v5 = (BOOL *)self + OBJC_IVAR___GPImagePickerViewController_isLoadingRecipe;
  swift_beginAccess();
  *v5 = a3;
  (*(_BYTE **)((char *)&self->super.super.super.isa + OBJC_IVAR___GPImagePickerViewController_connectionManager))[56] = a3;
  v6 = self;
  sub_23ED937A0();

}

- (GPRecipe)recipe
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR___GPImagePickerViewController_recipe);
  swift_beginAccess();
  return (GPRecipe *)*v2;
}

- (void)setRecipe:(id)a3
{
  void **v5;
  void *v6;
  id v7;
  GPImagePickerViewController *v8;

  v5 = (void **)((char *)&self->super.super.super.isa + OBJC_IVAR___GPImagePickerViewController_recipe);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  v7 = a3;
  v8 = self;

  sub_23EF54F0C();
}

- (GPImagePickerViewControllerDelegate)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___GPImagePickerViewController_delegate;
  swift_beginAccess();
  return (GPImagePickerViewControllerDelegate *)(id)MEMORY[0x242663B58](v2);
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (GPImagePickerViewController)initWithStyle:(int64_t)a3
{
  return (GPImagePickerViewController *)GPImagePickerViewController.init(style:)(a3);
}

- (GPImagePickerViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _sSo27GPImagePickerViewControllerC15ImagePlaygroundE5coderABSgSo7NSCoderC_tcfc_0();
}

- (void)viewDidLoad
{
  GPImagePickerViewController *v2;
  void *v3;
  _BYTE v4[32];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GPImagePickerViewController;
  v2 = self;
  -[GPImagePickerViewController viewDidLoad](&v5, sel_viewDidLoad);
  sub_23ECDDC40((uint64_t)v2 + OBJC_IVAR___GPImagePickerViewController__imagePickerViewController, (uint64_t)v4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256DE0888);
  swift_dynamicCast();
  -[UIViewController gp_addChildViewController:](v2, sel_gp_addChildViewController_, v3);

}

- (BOOL)isModalInPresentation
{
  uint64_t v3;
  GPImagePickerViewController *v4;
  char v5;

  v3 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___GPImagePickerViewController_viewModel);
  swift_getKeyPath();
  sub_23ECDC608(&qword_256DE0898, type metadata accessor for GPImagePickerView.ViewModel, (uint64_t)&unk_23EFE94B4);
  v4 = self;
  swift_retain();
  sub_23EFCE2A4();
  swift_release();
  v5 = *(_BYTE *)(v3 + 18);

  swift_release();
  return v5;
}

- (GPImagePickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  GPImagePickerViewController *result;

  v4 = a4;
  result = (GPImagePickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_23ECE2558((uint64_t)self + OBJC_IVAR___GPImagePickerViewController_delegate);
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___GPImagePickerViewController__imagePickerView);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___GPImagePickerViewController__imagePickerViewController);
}

@end
