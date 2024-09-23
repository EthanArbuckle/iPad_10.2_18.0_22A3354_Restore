@implementation HomePodSetupFileTransferViewController

- (_TtC14HDSViewService38HomePodSetupFileTransferViewController)initWithContentView:(id)a3
{
  id v4;

  v4 = a3;
  return (_TtC14HDSViewService38HomePodSetupFileTransferViewController *)sub_10000F21C(a3);
}

- (void)viewDidLoad
{
  _TtC14HDSViewService38HomePodSetupFileTransferViewController *v2;

  v2 = self;
  sub_10000F3CC();

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
  v7.super_class = (Class)type metadata accessor for HomePodSetupFileTransferViewController(0);
  v4 = (char *)v7.receiver;
  -[HomePodSetupFileTransferViewController viewDidAppear:](&v7, "viewDidAppear:", v3);
  Strong = swift_unknownObjectWeakLoadStrong(&v4[OBJC_IVAR____TtC14HDSViewService38HomePodSetupFileTransferViewController_presenter]);
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

- (void).cxx_destruct
{
  sub_1000113B8((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService38HomePodSetupFileTransferViewController_presenter]);
  sub_10000DC40((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService38HomePodSetupFileTransferViewController_viewModel], (uint64_t *)&unk_1000D6EC0);
  swift_bridgeObjectRelease(*(_QWORD *)&self->presenter[OBJC_IVAR____TtC14HDSViewService38HomePodSetupFileTransferViewController_bodyText]);

  swift_bridgeObjectRelease(*(_QWORD *)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService38HomePodSetupFileTransferViewController_images]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->presenter[OBJC_IVAR____TtC14HDSViewService38HomePodSetupFileTransferViewController_estimatedSecondsText]);
}

@end
