@implementation GPInProcessGenerationProgressViewController

- (GPInProcessGenerationProgressViewController)init
{
  return (GPInProcessGenerationProgressViewController *)GPInProcessGenerationProgressViewController.init()();
}

- (GPInProcessGenerationProgressViewController)initWithCoder:(id)a3
{
  return (GPInProcessGenerationProgressViewController *)GPInProcessGenerationProgressViewController.init(coder:)(a3);
}

+ (BOOL)available
{
  return _sSo36GPInProcessImagePickerViewControllerC0C10PlaygroundE11isAvailableSbvgZ_0() & 1;
}

- (BOOL)isAnimating
{
  uint64_t v3;
  GPInProcessGenerationProgressViewController *v4;
  char v5;

  v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR___GPInProcessGenerationProgressViewController_viewModel);
  swift_getKeyPath();
  sub_23ECDC608((unint64_t *)&qword_256DDF2D0, (uint64_t (*)(uint64_t))type metadata accessor for AnimatedEffectsViewModel, (uint64_t)&unk_23EFD63B8);
  v4 = self;
  sub_23EFCE2A4();
  swift_release();
  v5 = *(_BYTE *)(v3 + 18);

  return (v5 & 1) == 0;
}

- (void)setIsAnimating:(BOOL)a3
{
  GPInProcessGenerationProgressViewController *v4;

  swift_getKeyPath();
  sub_23ECDC608((unint64_t *)&qword_256DDF2D0, (uint64_t (*)(uint64_t))type metadata accessor for AnimatedEffectsViewModel, (uint64_t)&unk_23EFD63B8);
  v4 = self;
  sub_23EFCE298();

  swift_release();
}

- (BOOL)isShowingError
{
  return (*(_BYTE **)((char *)&self->super.super.super.isa
                    + OBJC_IVAR___GPInProcessGenerationProgressViewController_viewModel))[48];
}

- (void)setIsShowingError:(BOOL)a3
{
  GPInProcessGenerationProgressViewController *v3;

  (*(_BYTE **)((char *)&self->super.super.super.isa + OBJC_IVAR___GPInProcessGenerationProgressViewController_viewModel))[48] = a3;
  v3 = self;
  sub_23ED12798();

}

- (float)progress
{
  float *v2;

  v2 = (float *)((char *)self + OBJC_IVAR___GPInProcessGenerationProgressViewController_progress);
  swift_beginAccess();
  return *v2;
}

- (void)setProgress:(float)a3
{
  float *v5;
  uint64_t v6;
  GPInProcessGenerationProgressViewController *v7;

  v5 = (float *)((char *)self + OBJC_IVAR___GPInProcessGenerationProgressViewController_progress);
  swift_beginAccess();
  *v5 = a3;
  v6 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR___GPInProcessGenerationProgressViewController_viewModel);
  v7 = self;
  sub_23ED113B8(LODWORD(a3), 1, v6);

}

- (double)transitionToImageDuration
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___GPInProcessGenerationProgressViewController_transitionToImageDuration);
  swift_beginAccess();
  return *v2;
}

- (void)setTransitionToImageDuration:(double)a3
{
  GPInProcessGenerationProgressViewController *v4;

  v4 = self;
  GPInProcessGenerationProgressViewController.transitionToImageDuration.setter(a3);

}

- (void)transitionToGeneratingState
{
  uint64_t v2;
  GPInProcessGenerationProgressViewController *v3;

  v2 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR___GPInProcessGenerationProgressViewController_viewModel);
  *(_BYTE *)(v2 + 49) = 1;
  v3 = self;
  sub_23ED12908();
  sub_23ED113B8(0, 1, v2);

}

- (void)transitionToFinalImage
{
  uint64_t v2;
  GPInProcessGenerationProgressViewController *v3;

  v2 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR___GPInProcessGenerationProgressViewController_viewModel);
  v3 = self;
  sub_23ED120D8(0x200000003uLL, 1, v2);

}

- (void)transitionToFinalImage:(id)a3
{
  uint64_t v5;
  id v6;
  GPInProcessGenerationProgressViewController *v7;

  v5 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR___GPInProcessGenerationProgressViewController_viewModel);
  swift_getKeyPath();
  sub_23ECDC608((unint64_t *)&qword_256DDF2D0, (uint64_t (*)(uint64_t))type metadata accessor for AnimatedEffectsViewModel, (uint64_t)&unk_23EFD63B8);
  v6 = a3;
  v7 = self;
  sub_23EFCE298();
  swift_release();
  sub_23ED120D8(0x200000003uLL, 1, v5);

}

- (void)viewDidLoad
{
  GPInProcessGenerationProgressViewController *v2;

  v2 = self;
  GPInProcessGenerationProgressViewController.viewDidLoad()();

}

- (GPInProcessGenerationProgressViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  GPInProcessGenerationProgressViewController *result;

  v4 = a4;
  result = (GPInProcessGenerationProgressViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___GPInProcessGenerationProgressViewController_generationViewController));
  swift_release();
}

@end
