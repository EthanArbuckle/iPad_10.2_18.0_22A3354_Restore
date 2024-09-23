@implementation LPCustomizationPickerViewController

- (UIImage)mask
{
  LPCustomizationPickerViewController *v3;
  id *v4;
  id v5;

  sub_1A0D2BC7C();
  sub_1A0D2BC70();
  sub_1A0D2BC4C();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v3 = self;
  sub_1A0D2BC70();
  sub_1A0D2BC4C();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v4 = (id *)((char *)&v3->super.super.super.super.isa + OBJC_IVAR___LPCustomizationPickerViewController_mask);
  swift_beginAccess();
  v5 = *v4;
  swift_release();

  swift_release();
  return (UIImage *)v5;
}

- (void)setMask:(id)a3
{
  id v5;
  LPCustomizationPickerViewController *v6;
  void **v7;
  void *v8;

  sub_1A0D2BC7C();
  sub_1A0D2BC70();
  sub_1A0D2BC4C();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v5 = a3;
  v6 = self;
  sub_1A0D2BC70();
  sub_1A0D2BC4C();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v7 = (void **)((char *)&v6->super.super.super.super.isa + OBJC_IVAR___LPCustomizationPickerViewController_mask);
  swift_beginAccess();
  v8 = *v7;
  *v7 = v5;
  swift_release();

  swift_release();
}

- (LPCustomizationPickerViewControllerDelegate)customizationDelegate
{
  LPCustomizationPickerViewController *v3;
  char *v4;
  void *v5;

  sub_1A0D2BC7C();
  sub_1A0D2BC70();
  sub_1A0D2BC4C();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v3 = self;
  sub_1A0D2BC70();
  sub_1A0D2BC4C();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v4 = (char *)v3 + OBJC_IVAR___LPCustomizationPickerViewController_customizationDelegate;
  swift_beginAccess();
  v5 = (void *)MEMORY[0x1A1B031EC](v4);
  swift_release();

  swift_release();
  return (LPCustomizationPickerViewControllerDelegate *)v5;
}

- (void)setCustomizationDelegate:(id)a3
{
  LPCustomizationPickerViewController *v4;

  sub_1A0D2BC7C();
  sub_1A0D2BC70();
  sub_1A0D2BC4C();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  swift_unknownObjectRetain();
  v4 = self;
  sub_1A0D2BC70();
  sub_1A0D2BC4C();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  swift_release();

  swift_release();
  swift_unknownObjectRelease();
}

- (LPCustomizationPickerViewController)initWithSource:(id)a3
{
  LPCustomizationPickerViewController *v4;

  sub_1A0D2BC7C();
  sub_1A0D2BC70();
  sub_1A0D2BC4C();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v4 = (LPCustomizationPickerViewController *)sub_1A0D25248((uint64_t)a3);
  swift_release();
  return v4;
}

- (LPCustomizationPickerViewController)initWithCoder:(id)a3
{
  id v4;

  sub_1A0D2BC7C();
  sub_1A0D2BC70();
  sub_1A0D2BC4C();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v4 = a3;
  _sSo35LPCustomizationPickerViewControllerC16LinkPresentationE5coderABSgSo7NSCoderC_tcfc_0();
}

- (void)viewDidLoad
{
  sub_1A0D26FB8(self, (uint64_t)a2, 124, LPCustomizationPickerViewController.viewDidLoad());
}

- (void)viewDidLayoutSubviews
{
  sub_1A0D26FB8(self, (uint64_t)a2, 142, LPCustomizationPickerViewController.viewDidLayoutSubviews());
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  LPCustomizationPickerViewController *v5;
  id *v6;
  objc_super v7;

  v3 = a3;
  sub_1A0D2BC7C();
  sub_1A0D2BC70();
  sub_1A0D2BC4C();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v5 = self;
  sub_1A0D2BC70();
  sub_1A0D2BC4C();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v7.receiver = v5;
  v7.super_class = (Class)LPCustomizationPickerViewController;
  -[LPCustomizationPickerViewController viewDidDisappear:](&v7, sel_viewDidDisappear_, v3);
  v6 = (id *)((char *)&v5->super.super.super.super.isa + OBJC_IVAR___LPCustomizationPickerViewController_source);
  swift_beginAccess();
  objc_msgSend(*v6, sel_setAlpha_, 1.0);
  swift_release();

  swift_release();
}

- (void)handleTapGestureForLinkView:(id)a3
{
  id v5;
  LPCustomizationPickerViewController *v6;

  sub_1A0D2BC7C();
  sub_1A0D2BC70();
  sub_1A0D2BC4C();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v5 = a3;
  v6 = self;
  sub_1A0D272A8(v5);
  swift_release();

}

- (void)handleTapGestureForScrollView:(id)a3
{
  id v5;
  LPCustomizationPickerViewController *v6;

  sub_1A0D2BC7C();
  sub_1A0D2BC70();
  sub_1A0D2BC4C();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v5 = a3;
  v6 = self;
  sub_1A0D28968();
  swift_release();

}

- (LPCustomizationPickerViewController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  LPCustomizationPickerViewController *result;

  sub_1A0D2BC7C();
  sub_1A0D2BC70();
  sub_1A0D2BC4C();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  result = (LPCustomizationPickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (LPCustomizationPickerViewController)initWithRootViewController:(id)a3
{
  id v4;
  LPCustomizationPickerViewController *result;

  sub_1A0D2BC7C();
  sub_1A0D2BC70();
  sub_1A0D2BC4C();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v4 = a3;
  result = (LPCustomizationPickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (LPCustomizationPickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;
  LPCustomizationPickerViewController *result;

  sub_1A0D2BC7C();
  sub_1A0D2BC70();
  sub_1A0D2BC4C();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v5 = a4;
  result = (LPCustomizationPickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___LPCustomizationPickerViewController_source));

  sub_1A0D283DC((uint64_t)self + OBJC_IVAR___LPCustomizationPickerViewController_customizationDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___LPCustomizationPickerViewController_titleLabel));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___LPCustomizationPickerViewController____lazy_storage___stackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___LPCustomizationPickerViewController____lazy_storage___scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___LPCustomizationPickerViewController____lazy_storage___innerRootViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___LPCustomizationPickerViewController____lazy_storage___blurBackground));
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v9;
  id v10;
  id v11;
  LPCustomizationPickerViewController *v12;
  id v13;

  sub_1A0D2BC7C();
  sub_1A0D2BC70();
  sub_1A0D2BC4C();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = self;
  v13 = _sSo35LPCustomizationPickerViewControllerC16LinkPresentationE09animationD012forPresented10presenting6sourceSo06UIViewD21AnimatedTransitioning_pSgSo0lD0C_A2KtF_0(v9);
  swift_release();

  return v13;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v5;
  LPCustomizationPickerViewController *v6;
  id v7;

  sub_1A0D2BC7C();
  sub_1A0D2BC70();
  sub_1A0D2BC4C();
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor();
  v5 = a3;
  v6 = self;
  v7 = LPCustomizationPickerViewController.animationController(forDismissed:)(v5);
  swift_release();

  return v7;
}

@end
