@implementation HomePodSetupPINEntryViewController

- (void)viewDidLoad
{
  _TtC14HDSViewService34HomePodSetupPINEntryViewController *v2;

  v2 = self;
  sub_100051E5C();

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC14HDSViewService34HomePodSetupPINEntryViewController *v4;

  v4 = self;
  sub_10005267C(a3);

}

- (void)didCompleteTextEntry:(id)a3
{
  id v4;
  _TtC14HDSViewService34HomePodSetupPINEntryViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1000532AC(v4, (uint64_t)v5);

}

- (_TtC14HDSViewService34HomePodSetupPINEntryViewController)initWithContentView:(id)a3
{
  unsigned __int8 *v5;
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  uint64_t v8;
  objc_super v10;

  v5 = &self->PRXPasscodeEntryViewController_opaque[OBJC_IVAR____TtC14HDSViewService34HomePodSetupPINEntryViewController_presenter];
  *((_QWORD *)v5 + 1) = 0;
  swift_unknownObjectWeakInit(v5, 0);
  v6 = &self->PRXPasscodeEntryViewController_opaque[OBJC_IVAR____TtC14HDSViewService34HomePodSetupPINEntryViewController_activityIndicatorTitle];
  *(_QWORD *)v6 = 0;
  *((_QWORD *)v6 + 1) = 0xE000000000000000;
  v7 = &self->PRXPasscodeEntryViewController_opaque[OBJC_IVAR____TtC14HDSViewService34HomePodSetupPINEntryViewController_viewModel];
  v8 = type metadata accessor for HomePodSetupViewModel(0);
  (*(void (**)(unsigned __int8 *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for HomePodSetupPINEntryViewController(0);
  return -[HomePodSetupPINEntryViewController initWithContentView:](&v10, "initWithContentView:", a3);
}

- (void).cxx_destruct
{
  sub_1000113B8((uint64_t)&self->PRXPasscodeEntryViewController_opaque[OBJC_IVAR____TtC14HDSViewService34HomePodSetupPINEntryViewController_presenter]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->presenter[OBJC_IVAR____TtC14HDSViewService34HomePodSetupPINEntryViewController_activityIndicatorTitle]);
  sub_10001486C((uint64_t)&self->PRXPasscodeEntryViewController_opaque[OBJC_IVAR____TtC14HDSViewService34HomePodSetupPINEntryViewController_viewModel]);
}

@end
