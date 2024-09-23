@implementation ImagePlaygroundViewController

- (UIImage)sourceImage
{
  return (UIImage *)sub_23ED55DDC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC15ImagePlayground29ImagePlaygroundViewController_sourceImage);
}

- (void)setSourceImage:(id)a3
{
  sub_23ED55E80((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC15ImagePlayground29ImagePlaygroundViewController_sourceImage, sub_23ED55144);
}

- (ImageGenerationViewControllerDelegate)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR____TtC15ImagePlayground29ImagePlaygroundViewController_delegate;
  swift_beginAccess();
  return (ImageGenerationViewControllerDelegate *)(id)MEMORY[0x242663B58](v2);
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (int64_t)style
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC15ImagePlayground29ImagePlaygroundViewController_style);
  swift_beginAccess();
  return *v2;
}

- (void)setStyle:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR____TtC15ImagePlayground29ImagePlaygroundViewController_style);
  swift_beginAccess();
  *v4 = a3;
}

- (_TtP15ImagePlayground44ImageGenerationViewControllerPrivateDelegate_)privateDelegate
{
  swift_beginAccess();
  return (_TtP15ImagePlayground44ImageGenerationViewControllerPrivateDelegate_ *)(id)swift_unknownObjectRetain();
}

- (void)setPrivateDelegate:(id)a3
{
  id *v4;

  v4 = (id *)((char *)&self->super.super.super.isa
            + OBJC_IVAR____TtC15ImagePlayground29ImagePlaygroundViewController_privateDelegate);
  swift_beginAccess();
  *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (NSArray)resultingAssets
{
  void *v2;

  swift_beginAccess();
  type metadata accessor for GPExportablePhotoAsset(0);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_23EFD16E8();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setResultingAssets:(id)a3
{
  uint64_t v4;
  uint64_t *v5;

  type metadata accessor for GPExportablePhotoAsset(0);
  v4 = sub_23EFD1700();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC15ImagePlayground29ImagePlaygroundViewController_resultingAssets);
  swift_beginAccess();
  *v5 = v4;
  swift_bridgeObjectRelease();
}

- (BOOL)sourceImageIsSketch
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC15ImagePlayground29ImagePlaygroundViewController_sourceImageIsSketch;
  swift_beginAccess();
  return *v2;
}

- (void)setSourceImageIsSketch:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR____TtC15ImagePlayground29ImagePlaygroundViewController_sourceImageIsSketch;
  swift_beginAccess();
  *v4 = a3;
}

- (NSString)localizedCreateButtonTitle
{
  char *v2;
  void *v3;

  v2 = (char *)self + OBJC_IVAR____TtC15ImagePlayground29ImagePlaygroundViewController_localizedCreateButtonTitle;
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
  v7 = (uint64_t *)((char *)self
                 + OBJC_IVAR____TtC15ImagePlayground29ImagePlaygroundViewController_localizedCreateButtonTitle);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (GPRecipe)recipe
{
  return (GPRecipe *)sub_23ED55DDC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC15ImagePlayground29ImagePlaygroundViewController_recipe);
}

- (void)setRecipe:(id)a3
{
  sub_23ED55E80((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC15ImagePlayground29ImagePlaygroundViewController_recipe, sub_23ED56000);
}

- (_TtC15ImagePlayground29ImagePlaygroundViewController)init
{
  return (_TtC15ImagePlayground29ImagePlaygroundViewController *)ImagePlaygroundViewController.init()();
}

- (_TtC15ImagePlayground29ImagePlaygroundViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_23ED59CE0();
}

- (void)viewDidLoad
{
  char *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ImagePlaygroundViewController(0);
  v2 = (char *)v3.receiver;
  -[ImagePlaygroundViewController viewDidLoad](&v3, sel_viewDidLoad);
  objc_msgSend(v2, sel_gp_addChildViewController_, *(_QWORD *)&v2[OBJC_IVAR____TtC15ImagePlayground29ImagePlaygroundViewController_imageEditionViewController], v3.receiver, v3.super_class);

}

- (BOOL)isModalInPresentation
{
  uint64_t v3;
  _TtC15ImagePlayground29ImagePlaygroundViewController *v4;
  char v5;

  v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC15ImagePlayground29ImagePlaygroundViewController_viewModel);
  swift_getKeyPath();
  sub_23ECDC608(&qword_256DD10E0, type metadata accessor for GPImageEditionView.ViewModel, (uint64_t)&unk_23EFD9F00);
  v4 = self;
  swift_retain();
  sub_23EFCE2A4();
  swift_release();
  v5 = *(_BYTE *)(v3 + 17);

  swift_release();
  return v5;
}

- (_TtC15ImagePlayground29ImagePlaygroundViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC15ImagePlayground29ImagePlaygroundViewController *result;

  v4 = a4;
  result = (_TtC15ImagePlayground29ImagePlaygroundViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ImagePlayground29ImagePlaygroundViewController_sourceImage));
  sub_23ECE2558((uint64_t)self + OBJC_IVAR____TtC15ImagePlayground29ImagePlaygroundViewController_delegate);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ImagePlayground29ImagePlaygroundViewController_recipe));
  swift_release();
  sub_23ECDE6DC((uint64_t)self + OBJC_IVAR____TtC15ImagePlayground29ImagePlaygroundViewController_imageEditionView, type metadata accessor for GPImageEditionView);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ImagePlayground29ImagePlaygroundViewController_imageEditionViewController));
  swift_release();
  swift_bridgeObjectRelease();
}

+ (BOOL)available
{
  return _sSo36GPInProcessImagePickerViewControllerC0C10PlaygroundE11isAvailableSbvgZ_0() & 1;
}

- (void)editorDidGenerateAssets:(id)a3
{
  uint64_t v4;
  _TtC15ImagePlayground29ImagePlaygroundViewController *v5;

  type metadata accessor for GPExportablePhotoAsset(0);
  v4 = sub_23EFD1700();
  v5 = self;
  ImagePlaygroundViewController.editorDidGenerateAssets(_:)((Swift::OpaquePointer)v4);

  swift_bridgeObjectRelease();
}

- (void)editorDidCancelWithRequiresShowingGrid:(BOOL)a3
{
  _TtC15ImagePlayground29ImagePlaygroundViewController *v4;

  v4 = self;
  ImagePlaygroundViewController.editorDidCancel(requiresShowingGrid:)(a3);

}

@end
