@implementation GPInProcessMagicPaperViewController

- (GPInProcessMagicPaperViewControllerDelegate)delegate
{
  return (GPInProcessMagicPaperViewControllerDelegate *)(id)MEMORY[0x242663B58]((char *)self+ OBJC_IVAR___GPInProcessMagicPaperViewController_delegate, a2);
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectWeakAssign();
}

+ (BOOL)available
{
  return _sSo36GPInProcessImagePickerViewControllerC0C10PlaygroundE11isAvailableSbvgZ_0() & 1;
}

- (GPAppleConnectTokenProvider)appleConnectTokenProvider
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.super.isa
            + OBJC_IVAR___GPInProcessMagicPaperViewController_appleConnectTokenProvider);
  swift_beginAccess();
  return (GPAppleConnectTokenProvider *)*v2;
}

- (void)setAppleConnectTokenProvider:(id)a3
{
  void **v5;
  void *v6;
  id v7;
  GPInProcessMagicPaperViewController *v8;

  v5 = (void **)((char *)&self->super.super.super.isa
               + OBJC_IVAR___GPInProcessMagicPaperViewController_appleConnectTokenProvider);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  v7 = a3;
  v8 = self;

  if (*v5)
    sub_23ED37DF4();

}

- (id)initForMagicWandDrawingInFrame:(CGRect)a3
{
  id result;

  sub_23ED39A8C();
  return result;
}

- (id)initForEditingInFrame:(CGRect)a3
{
  return sub_23ED37F80(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (GPInProcessMagicPaperViewController)initWithCoder:(id)a3
{
  return (GPInProcessMagicPaperViewController *)GPInProcessMagicPaperViewController.init(coder:)(a3);
}

- (void)setState:(id)a3
{
  GPMagicPaperState *v4;
  GPInProcessMagicPaperViewController *v5;

  v4 = (GPMagicPaperState *)a3;
  v5 = self;
  GPInProcessMagicPaperViewController.setState(_:)(v4);

}

- (void)startSelectionWithPath:(const CGPath *)a3 atPencilLocation:(CGPoint)a4
{
  const CGPath *v5;
  GPInProcessMagicPaperViewController *v6;

  v5 = a3;
  v6 = self;
  sub_23ED39B4C();

}

- (void)updateSelectionWithPath:(const CGPath *)a3 atPencilLocation:(CGPoint)a4
{
  void **v6;
  void *v7;
  const CGPath *v8;
  GPInProcessMagicPaperViewController *v9;
  id v10;

  v6 = (void **)((char *)&self->super.super.super.isa
               + OBJC_IVAR___GPInProcessMagicPaperViewController_magicViewController);
  swift_beginAccess();
  v7 = *v6;
  if (*v6)
  {
    v8 = a3;
    v9 = self;
    v10 = v7;
    sub_23EE8782C();

  }
}

- (void)finishSelectionWithPath:(const CGPath *)a3 atPencilLocation:(CGPoint)a4
{
  const CGPath *v5;
  GPInProcessMagicPaperViewController *v6;

  v5 = a3;
  v6 = self;
  sub_23ED3850C((uint64_t)v5);

}

- (GPRecipe)recipe
{
  _QWORD *v2;

  v2 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR___GPInProcessMagicPaperViewController_magicViewController);
  swift_beginAccess();
  if (*v2)
    return (GPRecipe *)*(id *)(*v2 + qword_256DDB7A8);
  else
    return (GPRecipe *)0;
}

- (void)setRecipe:(id)a3
{
  id v5;
  GPInProcessMagicPaperViewController *v6;

  v5 = a3;
  v6 = self;
  sub_23ED38A0C(a3);

}

- (double)magicViewFullHeightForKeyboardScrolling
{
  _QWORD *v2;
  double result;
  uint64_t v4;

  v2 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR___GPInProcessMagicPaperViewController_magicViewController);
  swift_beginAccess();
  result = 0.0;
  if (*v2)
  {
    v4 = *(_QWORD *)(*v2 + qword_256DDB7A0);
    if (v4)
      return *(double *)(v4 + OBJC_IVAR____TtC15ImagePlayground14MagicViewModel_magicViewFullHeightForKeyboardScrolling);
  }
  return result;
}

- (GPInProcessMagicPaperViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  GPInProcessMagicPaperViewController *result;

  v4 = a4;
  result = (GPInProcessMagicPaperViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_23ECE2558((uint64_t)self + OBJC_IVAR___GPInProcessMagicPaperViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___GPInProcessMagicPaperViewController_appleConnectTokenProvider));
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___GPInProcessMagicPaperViewController_magicViewController));
}

@end
