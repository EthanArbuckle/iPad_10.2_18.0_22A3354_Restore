@implementation GPInProcessImageEditionViewController

+ (BOOL)available
{
  return _sSo36GPInProcessImagePickerViewControllerC0C10PlaygroundE11isAvailableSbvgZ_0() & 1;
}

- (int64_t)style
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR___GPInProcessImageEditionViewController_style);
  swift_beginAccess();
  return *v2;
}

- (void)setStyle:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR___GPInProcessImageEditionViewController_style);
  swift_beginAccess();
  *v4 = a3;
}

- (NSArray)generatedAssets
{
  void *v2;

  swift_beginAccess();
  type metadata accessor for GPExportablePhotoAsset(0);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_23EFD16E8();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setGeneratedAssets:(id)a3
{
  uint64_t v4;
  uint64_t *v5;

  type metadata accessor for GPExportablePhotoAsset(0);
  v4 = sub_23EFD1700();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___GPInProcessImageEditionViewController_generatedAssets);
  swift_beginAccess();
  *v5 = v4;
  swift_bridgeObjectRelease();
}

- (UIImage)sourceImage
{
  return (UIImage *)sub_23ED7564C((uint64_t)self, (uint64_t)a2, &qword_256DE14C0);
}

- (void)setSourceImage:(id)a3
{
  id v5;
  GPInProcessImageEditionViewController *v6;

  v5 = a3;
  v6 = self;
  GPInProcessImageEditionViewController.sourceImage.setter(a3);

}

- (BOOL)isLoadingRecipe
{
  uint64_t v2;

  v2 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR___GPInProcessImageEditionViewController_imageEditionViewController);
  if (v2)
    return *(_BYTE *)(v2 + qword_256DE14B0);
  else
    return 0;
}

- (void)setIsLoadingRecipe:(BOOL)a3
{
  GPInProcessImageEditionViewController *v4;

  v4 = self;
  GPInProcessImageEditionViewController.isLoadingRecipe.setter(a3);

}

- (GPRecipe)recipe
{
  return (GPRecipe *)sub_23ED7564C((uint64_t)self, (uint64_t)a2, &qword_256DE14B8);
}

- (void)setRecipe:(id)a3
{
  id v5;
  GPInProcessImageEditionViewController *v6;

  v5 = a3;
  v6 = self;
  GPInProcessImageEditionViewController.recipe.setter(a3);

}

- (BOOL)sourceImageIsSketch
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___GPInProcessImageEditionViewController_sourceImageIsSketch;
  swift_beginAccess();
  return *v2;
}

- (void)setSourceImageIsSketch:(BOOL)a3
{
  BOOL *v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;

  v4 = (BOOL *)self + OBJC_IVAR___GPInProcessImageEditionViewController_sourceImageIsSketch;
  swift_beginAccess();
  *v4 = a3;
  if (qword_256DCF370 != -1)
    swift_once();
  v5 = sub_23EFCEDB4();
  __swift_project_value_buffer(v5, (uint64_t)qword_256DD08E8);
  v6 = sub_23EFCED9C();
  v7 = sub_23EFD1A90();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_23ECD3000, v6, v7, "Not implemented yet", v8, 2u);
    MEMORY[0x242663A74](v8, -1, -1);
  }

}

- (NSString)localizedCreateButtonTitle
{
  char *v2;
  void *v3;

  v2 = (char *)self + OBJC_IVAR___GPInProcessImageEditionViewController_localizedCreateButtonTitle;
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
  GPInProcessImageEditionViewController *v8;
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
  v7 = (uint64_t *)((char *)self + OBJC_IVAR___GPInProcessImageEditionViewController_localizedCreateButtonTitle);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  v8 = self;
  swift_bridgeObjectRelease();
  if (qword_256DCF370 != -1)
    swift_once();
  v9 = sub_23EFCEDB4();
  __swift_project_value_buffer(v9, (uint64_t)qword_256DD08E8);
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

- (GPImageEditionViewControllerDelegate)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___GPInProcessImageEditionViewController_delegate;
  swift_beginAccess();
  return (GPImageEditionViewControllerDelegate *)(id)MEMORY[0x242663B58](v2);
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
            + OBJC_IVAR___GPInProcessImageEditionViewController_appleConnectTokenProvider);
  swift_beginAccess();
  return (GPAppleConnectTokenProvider *)*v2;
}

- (void)setAppleConnectTokenProvider:(id)a3
{
  void **v5;
  void *v6;
  id v7;
  GPInProcessImageEditionViewController *v8;

  v5 = (void **)((char *)&self->super.super.super.isa
               + OBJC_IVAR___GPInProcessImageEditionViewController_appleConnectTokenProvider);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  v7 = a3;
  v8 = self;

  if (*v5)
    sub_23ED76160();

}

- (GPInProcessImageEditionViewController)init
{
  return (GPInProcessImageEditionViewController *)GPInProcessImageEditionViewController.init()();
}

- (GPInProcessImageEditionViewController)initWithStyle:(int64_t)a3
{
  return (GPInProcessImageEditionViewController *)GPInProcessImageEditionViewController.init(style:)(a3);
}

- (GPInProcessImageEditionViewController)initWithCoder:(id)a3
{
  return (GPInProcessImageEditionViewController *)GPInProcessImageEditionViewController.init(coder:)(a3);
}

- (GPInProcessImageEditionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  GPInProcessImageEditionViewController *result;

  v4 = a4;
  result = (GPInProcessImageEditionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23ECE2558((uint64_t)self + OBJC_IVAR___GPInProcessImageEditionViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___GPInProcessImageEditionViewController_appleConnectTokenProvider));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___GPInProcessImageEditionViewController_imageEditionViewController));
}

@end
