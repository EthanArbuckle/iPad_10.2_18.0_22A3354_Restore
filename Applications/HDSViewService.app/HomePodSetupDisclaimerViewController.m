@implementation HomePodSetupDisclaimerViewController

- (void)viewDidLoad
{
  _TtC14HDSViewService36HomePodSetupDisclaimerViewController *v2;

  v2 = self;
  sub_100012FD8();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  uint64_t Strong;
  uint64_t v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for HomePodSetupDisclaimerViewController(0);
  v4 = (char *)v7.receiver;
  -[HomePodSetupDisclaimerViewController viewDidAppear:](&v7, "viewDidAppear:", v3);
  Strong = swift_unknownObjectWeakLoadStrong(&v4[OBJC_IVAR____TtC14HDSViewService36HomePodSetupDisclaimerViewController_presenter]);
  if (Strong)
  {
    v6 = Strong;
    sub_10006EB30();

    swift_unknownObjectRelease(v6);
  }
  else
  {

  }
}

- (void)moreInfoButtonTapped:(id)a3
{
  id v4;
  _TtC14HDSViewService36HomePodSetupDisclaimerViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1000144A8();

}

- (_TtC14HDSViewService36HomePodSetupDisclaimerViewController)initWithContentView:(id)a3
{
  unsigned __int8 *v5;
  unsigned __int8 *v6;
  uint64_t v7;
  objc_super v9;

  v5 = &self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService36HomePodSetupDisclaimerViewController_presenter];
  *((_QWORD *)v5 + 1) = 0;
  swift_unknownObjectWeakInit(v5, 0);
  v6 = &self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService36HomePodSetupDisclaimerViewController_viewModel];
  v7 = type metadata accessor for HomePodSetupViewModel(0);
  (*(void (**)(unsigned __int8 *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  *(_QWORD *)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService36HomePodSetupDisclaimerViewController_termsManager] = 0;
  *(_QWORD *)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService36HomePodSetupDisclaimerViewController____lazy_storage___moreInfoButton] = 0;
  *(_QWORD *)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService36HomePodSetupDisclaimerViewController____lazy_storage___disclaimerLabel] = 0;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for HomePodSetupDisclaimerViewController(0);
  return -[HomePodSetupDisclaimerViewController initWithContentView:](&v9, "initWithContentView:", a3);
}

- (void).cxx_destruct
{
  sub_1000113B8((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService36HomePodSetupDisclaimerViewController_presenter]);
  sub_10001486C((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService36HomePodSetupDisclaimerViewController_viewModel]);

}

@end
