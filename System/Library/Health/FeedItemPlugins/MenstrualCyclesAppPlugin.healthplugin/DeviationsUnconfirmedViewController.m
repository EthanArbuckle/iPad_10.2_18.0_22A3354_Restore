@implementation DeviationsUnconfirmedViewController

- (void)viewDidLoad
{
  id v2;
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = v4.receiver;
  -[OBBaseWelcomeController viewDidLoad](&v4, sel_viewDidLoad);
  v3 = objc_msgSend(v2, sel_navigationItem, v4.receiver, v4.super_class);
  objc_msgSend(v3, sel_setHidesBackButton_, 1);

  sub_231A66A3C();
  sub_231A66C68();

}

- (void)primaryButtonTapped
{
  _TtC24MenstrualCyclesAppPlugin35DeviationsUnconfirmedViewController *v2;

  v2 = self;
  sub_231A66FF4();

}

- (_TtC24MenstrualCyclesAppPlugin35DeviationsUnconfirmedViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC24MenstrualCyclesAppPlugin35DeviationsUnconfirmedViewController *result;

  result = (_TtC24MenstrualCyclesAppPlugin35DeviationsUnconfirmedViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC24MenstrualCyclesAppPlugin35DeviationsUnconfirmedViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC24MenstrualCyclesAppPlugin35DeviationsUnconfirmedViewController *result;

  v6 = a5;
  result = (_TtC24MenstrualCyclesAppPlugin35DeviationsUnconfirmedViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_23190C114((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin35DeviationsUnconfirmedViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin35DeviationsUnconfirmedViewController____lazy_storage___learnMoreButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin35DeviationsUnconfirmedViewController_linkButtonHorizontalConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin35DeviationsUnconfirmedViewController____lazy_storage___contentStack));
}

@end
