@implementation ExportViewController

- (_TtC13FTMInternal_420ExportViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1001CF00C();
}

- (void)viewDidLoad
{
  _TtC13FTMInternal_420ExportViewController *v2;

  v2 = self;
  sub_1001CDA2C();

}

- (void)didTapDismissWithSender:(id)a3
{
  id v5;
  id v6;
  _TtC13FTMInternal_420ExportViewController *v7;
  id v8;

  v5 = objc_allocWithZone((Class)UIImpactFeedbackGenerator);
  v6 = a3;
  v7 = self;
  v8 = objc_msgSend(v5, "initWithStyle:", 1);
  objc_msgSend(v8, "impactOccurred");
  -[ExportViewController dismissViewControllerAnimated:completion:](v7, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (_TtC13FTMInternal_420ExportViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC13FTMInternal_420ExportViewController *result;

  v4 = a4;
  result = (_TtC13FTMInternal_420ExportViewController *)_swift_stdlib_reportUnimplementedInitializer("FTMInternal_4.ExportViewController", 34, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_420ExportViewController____lazy_storage___exportOptionsLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_420ExportViewController_dismissButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_420ExportViewController____lazy_storage___loadingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_420ExportViewController_containerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_420ExportViewController_persistanceStore));
}

@end
