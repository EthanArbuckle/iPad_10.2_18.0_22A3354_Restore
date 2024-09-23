@implementation HomePodSetupSiriVoiceSelectionViewController

- (void)viewDidLoad
{
  _TtC14HDSViewService44HomePodSetupSiriVoiceSelectionViewController *v2;

  v2 = self;
  sub_100050A94();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC14HDSViewService44HomePodSetupSiriVoiceSelectionViewController *v4;

  v4 = self;
  sub_100051124(a3, (SEL *)&selRef_viewWillAppear_, "HomePod Setup %@ viewWillAppear");

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
  v7.super_class = (Class)type metadata accessor for HomePodSetupSiriVoiceSelectionViewController(0);
  v4 = (char *)v7.receiver;
  -[HomePodSetupSiriVoiceSelectionViewController viewDidAppear:](&v7, "viewDidAppear:", v3);
  Strong = swift_unknownObjectWeakLoadStrong(&v4[OBJC_IVAR____TtC14HDSViewService44HomePodSetupSiriVoiceSelectionViewController_presenter]);
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

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC14HDSViewService44HomePodSetupSiriVoiceSelectionViewController *v4;

  v4 = self;
  sub_100051124(a3, (SEL *)&selRef_viewDidDisappear_, "HomePod Setup %@ viewDidDisappear");

}

- (_TtC14HDSViewService44HomePodSetupSiriVoiceSelectionViewController)initWithContentView:(id)a3
{
  id v3;
  __n128 v4;
  __n128 v5;
  __n128 v6;
  __n128 v7;
  _TtC14HDSViewService44HomePodSetupSiriVoiceSelectionViewController *result;

  v3 = a3;
  result = (_TtC14HDSViewService44HomePodSetupSiriVoiceSelectionViewController *)_swift_stdlib_reportUnimplementedInitializer("HDSViewService.HomePodSetupSiriVoiceSelectionViewController", 59, "init(contentView:)", 18, 0, v4, v5, v6, v7);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000113B8((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService44HomePodSetupSiriVoiceSelectionViewController_presenter]);

  sub_10001486C((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService44HomePodSetupSiriVoiceSelectionViewController_viewModel]);
}

- (void)voiceSelectionController:(id)a3 didSelectVoice:(id)a4
{
  id v6;
  id v7;
  _TtC14HDSViewService44HomePodSetupSiriVoiceSelectionViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_100051A60(v7, (uint64_t)v8);

}

- (void)voiceSelectionControllerRequestsDismissal:(id)a3
{
  id v4;
  uint64_t v5;
  _TtC14HDSViewService44HomePodSetupSiriVoiceSelectionViewController *v6;

  v4 = a3;
  v6 = self;
  sub_100051CC8((uint64_t)v6, v5);

}

@end
