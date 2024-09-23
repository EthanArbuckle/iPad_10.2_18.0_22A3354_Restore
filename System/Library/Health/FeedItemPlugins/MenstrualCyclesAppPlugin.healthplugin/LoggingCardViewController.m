@implementation LoggingCardViewController

- (_TtC24MenstrualCyclesAppPlugin25LoggingCardViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC24MenstrualCyclesAppPlugin25LoggingCardViewController *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25LoggingCardViewController____lazy_storage___footerView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25LoggingCardViewController_alphaValue) = (Class)0x3FF0000000000000;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25LoggingCardViewController_footerHeightConstraint) = 0;
  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25LoggingCardViewController_flashedScrollIndicatorOnLoad) = 0;
  v4 = a3;

  result = (_TtC24MenstrualCyclesAppPlugin25LoggingCardViewController *)sub_231CA2A48();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC24MenstrualCyclesAppPlugin25LoggingCardViewController *v2;

  v2 = self;
  sub_23193013C();

}

- (void)respondToContentSizeChanges
{
  void *v2;
  double v3;
  double v4;
  _TtC24MenstrualCyclesAppPlugin25LoggingCardViewController *v5;

  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25LoggingCardViewController_tableView);
  v5 = self;
  objc_msgSend(v2, sel_contentSize);
  sub_23192F828(v3, v4);

}

- (void)infoButtonTapped:(id)a3
{
  id v4;
  _TtC24MenstrualCyclesAppPlugin25LoggingCardViewController *v5;

  v4 = a3;
  v5 = self;
  sub_231931214();

}

- (_TtC24MenstrualCyclesAppPlugin25LoggingCardViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC24MenstrualCyclesAppPlugin25LoggingCardViewController *result;

  v4 = a4;
  result = (_TtC24MenstrualCyclesAppPlugin25LoggingCardViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25LoggingCardViewController_displayType));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25LoggingCardViewController_headerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25LoggingCardViewController_tableView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25LoggingCardViewController____lazy_storage___footerView));
  objc_release(*(id *)((char *)&self->super._navigationItem
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25LoggingCardViewController_configuration));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin25LoggingCardViewController_footerHeightConstraint));
}

@end
