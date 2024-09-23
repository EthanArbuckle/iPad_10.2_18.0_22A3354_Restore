@implementation APEducationFlowViewController

- (APEducationViewControllerDelegate)delegate
{
  return (APEducationViewControllerDelegate *)(id)MEMORY[0x23B7EFDEC]((char *)self+ OBJC_IVAR___APEducationFlowViewController_delegate, a2);
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (BOOL)wantsAnimatedPresentation
{
  return 0;
}

- (id)initForApplication:(id)a3
{
  return sub_2362FC9F0(a3);
}

- (APEducationFlowViewController)initWithCoder:(id)a3
{
  id v5;
  APEducationFlowViewController *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___APEducationFlowViewController_initialAlertController) = 0;
  swift_unknownObjectWeakInit();
  v5 = a3;

  result = (APEducationFlowViewController *)sub_2362FFAC4();
  __break(1u);
  return result;
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v3;

  v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR___APEducationFlowViewController_initialAlertController);
  if (v3)
    -[APEducationFlowViewController presentViewController:animated:completion:](self, sel_presentViewController_animated_completion_, v3, 1, 0);
  else
    __break(1u);
}

- (APEducationFlowViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  APEducationFlowViewController *result;

  v4 = a4;
  result = (APEducationFlowViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___APEducationFlowViewController_initialAlertController));
  sub_2362F5438((uint64_t)self + OBJC_IVAR___APEducationFlowViewController_delegate);
}

@end
