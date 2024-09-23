@implementation HomePodSetupIconContentViewController

- (_TtC14HDSViewService37HomePodSetupIconContentViewController)initWithContentView:(id)a3
{
  id v4;

  v4 = a3;
  return (_TtC14HDSViewService37HomePodSetupIconContentViewController *)sub_100038E18(a3);
}

- (void)viewDidLoad
{
  _TtC14HDSViewService37HomePodSetupIconContentViewController *v2;

  v2 = self;
  sub_100038FA0();

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
  v7.super_class = (Class)type metadata accessor for HomePodSetupIconContentViewController(0);
  v4 = (char *)v7.receiver;
  -[HomePodSetupIconContentViewController viewDidAppear:](&v7, "viewDidAppear:", v3);
  Strong = swift_unknownObjectWeakLoadStrong(&v4[OBJC_IVAR____TtC14HDSViewService37HomePodSetupIconContentViewController_presenter]);
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

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC14HDSViewService37HomePodSetupIconContentViewController *v4;

  v4 = self;
  sub_10003B220(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC14HDSViewService37HomePodSetupIconContentViewController *v4;

  v4 = self;
  sub_10003B740(a3);

}

- (void).cxx_destruct
{
  sub_1000113B8((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService37HomePodSetupIconContentViewController_presenter]);

  sub_10000DC40((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService37HomePodSetupIconContentViewController_viewModel], (uint64_t *)&unk_1000D6EC0);
  swift_bridgeObjectRelease(*(_QWORD *)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService37HomePodSetupIconContentViewController_images]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->presenter[OBJC_IVAR____TtC14HDSViewService37HomePodSetupIconContentViewController_bodyText]);

}

@end
