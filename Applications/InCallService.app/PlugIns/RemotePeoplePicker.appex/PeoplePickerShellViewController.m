@implementation PeoplePickerShellViewController

- (void)viewDidLoad
{
  _TtC18RemotePeoplePicker31PeoplePickerShellViewController *v2;

  v2 = self;
  PeoplePickerShellViewController.viewDidLoad()();

}

- (_TtC18RemotePeoplePicker31PeoplePickerShellViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3, a2);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC18RemotePeoplePicker31PeoplePickerShellViewController *)PeoplePickerShellViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC18RemotePeoplePicker31PeoplePickerShellViewController)initWithCoder:(id)a3
{
  return (_TtC18RemotePeoplePicker31PeoplePickerShellViewController *)PeoplePickerShellViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_connection));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_extensionViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController_activity));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController____lazy_storage___peoplePickerViewController));
  sub_100009A0C(*(id *)((char *)&self->super.super.super.isa
                      + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController____lazy_storage___sharePlayWelcomeViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController____lazy_storage___rootNavigationController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController____lazy_storage___spinnerView));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC18RemotePeoplePicker31PeoplePickerShellViewController____lazy_storage___callCreator));
}

- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  id v6;
  _TtC18RemotePeoplePicker31PeoplePickerShellViewController *v7;

  v6 = a3;
  v7 = self;
  PeoplePickerShellViewController.messageComposeViewController(_:didFinishWith:)(v6, a4);

}

@end
