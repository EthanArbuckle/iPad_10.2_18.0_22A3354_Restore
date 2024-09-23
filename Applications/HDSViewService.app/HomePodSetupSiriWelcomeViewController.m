@implementation HomePodSetupSiriWelcomeViewController

- (void)viewDidLoad
{
  _TtC14HDSViewService37HomePodSetupSiriWelcomeViewController *v2;

  v2 = self;
  sub_10005E7C0();

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
  v7.super_class = (Class)type metadata accessor for HomePodSetupSiriWelcomeViewController(0);
  v4 = (char *)v7.receiver;
  -[HomePodSetupSiriWelcomeViewController viewDidAppear:](&v7, "viewDidAppear:", v3);
  Strong = swift_unknownObjectWeakLoadStrong(&v4[OBJC_IVAR____TtC14HDSViewService37HomePodSetupSiriWelcomeViewController_presenter]);
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
  _BOOL8 v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  os_log_type_t v10;
  uint8_t *v11;
  objc_super v12;

  v3 = a3;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for HomePodSetupSiriWelcomeViewController(0);
  v4 = v12.receiver;
  -[HomePodSetupSiriWelcomeViewController viewWillDisappear:](&v12, "viewWillDisappear:", v3);
  if (qword_1000D55E8 != -1)
    swift_once(&qword_1000D55E8, sub_10005E730);
  v6 = type metadata accessor for Logger(0, v5);
  v7 = sub_10001118C(v6, (uint64_t)qword_1000D74A0);
  v8 = Logger.logObject.getter(v7);
  v10 = static os_log_type_t.default.getter(v8, v9);
  if (os_log_type_enabled(v8, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v10, "HomePodSetupSiriWelcome: viewWillDisappear was called.", v11, 2u);
    swift_slowDealloc(v11, -1, -1);
  }

}

- (_TtC14HDSViewService37HomePodSetupSiriWelcomeViewController)initWithContentView:(id)a3
{
  unsigned __int8 *v5;
  unsigned __int8 *v6;
  uint64_t v7;
  objc_super v9;

  v5 = &self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService37HomePodSetupSiriWelcomeViewController_presenter];
  *((_QWORD *)v5 + 1) = 0;
  swift_unknownObjectWeakInit(v5, 0);
  v6 = &self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService37HomePodSetupSiriWelcomeViewController_viewModel];
  v7 = type metadata accessor for HomePodSetupViewModel(0);
  (*(void (**)(unsigned __int8 *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for HomePodSetupSiriWelcomeViewController(0);
  return -[HomePodSetupSiriWelcomeViewController initWithContentView:](&v9, "initWithContentView:", a3);
}

- (void).cxx_destruct
{
  sub_1000113B8((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService37HomePodSetupSiriWelcomeViewController_presenter]);
  sub_10000DC40((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService37HomePodSetupSiriWelcomeViewController_viewModel], (uint64_t *)&unk_1000D6EC0);
}

@end
