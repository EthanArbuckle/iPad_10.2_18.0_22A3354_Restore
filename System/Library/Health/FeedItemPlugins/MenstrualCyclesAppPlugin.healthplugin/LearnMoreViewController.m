@implementation LearnMoreViewController

- (_TtC24MenstrualCyclesAppPlugin23LearnMoreViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC24MenstrualCyclesAppPlugin23LearnMoreViewController *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin23LearnMoreViewController____lazy_storage___doneBarButtonItem) = 0;
  v4 = a3;

  result = (_TtC24MenstrualCyclesAppPlugin23LearnMoreViewController *)sub_231CA2A48();
  __break(1u);
  return result;
}

- (void)doneAndDismiss
{
  _TtC24MenstrualCyclesAppPlugin23LearnMoreViewController *v2;
  _TtC24MenstrualCyclesAppPlugin23LearnMoreViewController *v3;
  _TtC24MenstrualCyclesAppPlugin23LearnMoreViewController *v4;
  _TtC24MenstrualCyclesAppPlugin23LearnMoreViewController *v5;

  v5 = self;
  v2 = (_TtC24MenstrualCyclesAppPlugin23LearnMoreViewController *)-[LearnMoreViewController presentingViewController](v5, sel_presentingViewController);
  if (v2)
  {
    v3 = v2;
    -[LearnMoreViewController dismissViewControllerAnimated:completion:](v2, sel_dismissViewControllerAnimated_completion_, 1, 0);

    v4 = v3;
  }
  else
  {
    v4 = v5;
  }

}

- (_TtC24MenstrualCyclesAppPlugin23LearnMoreViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC24MenstrualCyclesAppPlugin23LearnMoreViewController *result;

  v4 = a4;
  result = (_TtC24MenstrualCyclesAppPlugin23LearnMoreViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin23LearnMoreViewController____lazy_storage___doneBarButtonItem));
}

@end
