@implementation HomePodSetupStereoViewController

- (void)viewDidLoad
{
  _TtC14HDSViewService32HomePodSetupStereoViewController *v2;

  v2 = self;
  sub_100062AE8();

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
  v7.super_class = (Class)type metadata accessor for HomePodSetupStereoViewController(0);
  v4 = (char *)v7.receiver;
  -[HomePodSetupStereoViewController viewDidAppear:](&v7, "viewDidAppear:", v3);
  Strong = swift_unknownObjectWeakLoadStrong(&v4[OBJC_IVAR____TtC14HDSViewService32HomePodSetupStereoViewController_presenter]);
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

- (_TtC14HDSViewService32HomePodSetupStereoViewController)initWithContentView:(id)a3
{
  unsigned __int8 *v5;
  unsigned __int8 *v6;
  uint64_t v7;
  objc_super v9;

  v5 = &self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService32HomePodSetupStereoViewController_presenter];
  *((_QWORD *)v5 + 1) = 0;
  swift_unknownObjectWeakInit(v5, 0);
  v6 = &self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService32HomePodSetupStereoViewController_viewModel];
  v7 = type metadata accessor for HomePodSetupViewModel(0);
  (*(void (**)(unsigned __int8 *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService32HomePodSetupStereoViewController_isConfigured] = 0;
  *(_QWORD *)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService32HomePodSetupStereoViewController_bodyLabel] = 0;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for HomePodSetupStereoViewController(0);
  return -[HomePodSetupStereoViewController initWithContentView:](&v9, "initWithContentView:", a3);
}

- (void).cxx_destruct
{
  sub_1000113B8((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService32HomePodSetupStereoViewController_presenter]);
  sub_10000DC40((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService32HomePodSetupStereoViewController_viewModel], (uint64_t *)&unk_1000D6EC0);

}

@end
