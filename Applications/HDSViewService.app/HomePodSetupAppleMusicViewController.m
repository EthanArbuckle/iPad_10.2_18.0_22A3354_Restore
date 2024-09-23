@implementation HomePodSetupAppleMusicViewController

- (void)viewDidLoad
{
  _TtC14HDSViewService36HomePodSetupAppleMusicViewController *v2;

  v2 = self;
  sub_10005B94C();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC14HDSViewService36HomePodSetupAppleMusicViewController *v4;

  v4 = self;
  sub_10005BCFC(a3);

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
  v7.super_class = (Class)type metadata accessor for HomePodSetupAppleMusicViewController(0);
  v4 = (char *)v7.receiver;
  -[HomePodSetupAppleMusicViewController viewDidAppear:](&v7, "viewDidAppear:", v3);
  Strong = swift_unknownObjectWeakLoadStrong(&v4[OBJC_IVAR____TtC14HDSViewService36HomePodSetupAppleMusicViewController_presenter]);
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

- (_TtC14HDSViewService36HomePodSetupAppleMusicViewController)initWithContentView:(id)a3
{
  id v3;
  __n128 v4;
  __n128 v5;
  __n128 v6;
  __n128 v7;
  _TtC14HDSViewService36HomePodSetupAppleMusicViewController *result;

  v3 = a3;
  result = (_TtC14HDSViewService36HomePodSetupAppleMusicViewController *)_swift_stdlib_reportUnimplementedInitializer("HDSViewService.HomePodSetupAppleMusicViewController", 51, "init(contentView:)", 18, 0, v4, v5, v6, v7);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000113B8((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService36HomePodSetupAppleMusicViewController_presenter]);
  sub_10001486C((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService36HomePodSetupAppleMusicViewController_viewModel]);

  swift_bridgeObjectRelease(*(_QWORD *)&self->presenter[OBJC_IVAR____TtC14HDSViewService36HomePodSetupAppleMusicViewController_deviceGUID]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->presenter[OBJC_IVAR____TtC14HDSViewService36HomePodSetupAppleMusicViewController_deviceSerialNumber]);
}

- (void)cloudServiceSetupViewControllerDidDismiss:(id)a3
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  _TtC14HDSViewService36HomePodSetupAppleMusicViewController *v15;

  v4 = qword_1000D55D8;
  v5 = a3;
  v15 = self;
  if (v4 != -1)
    swift_once(&qword_1000D55D8, sub_10005B8BC);
  v7 = type metadata accessor for Logger(0, v6);
  v8 = sub_10001118C(v7, (uint64_t)qword_1000D7350);
  v9 = Logger.logObject.getter(v8);
  v11 = static os_log_type_t.default.getter(v9, v10);
  if (os_log_type_enabled(v9, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v11, "HomePodSetupAppleMusicViewController: SKCloudServiceSetupViewController dismissed.\n", v12, 2u);
    swift_slowDealloc(v12, -1, -1);
  }

  sub_10005CB48(v13, v14);
}

@end
