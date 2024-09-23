@implementation PASVSPrimaryViewController

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  uint64_t (*v6)(uint64_t);
  uint64_t v7;
  id v8;
  _TtC14PASViewService26PASVSPrimaryViewController *v9;

  v6 = (uint64_t (*)(uint64_t))_Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_100019200, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = (uint64_t (*)(uint64_t))sub_100011B80;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  sub_10000E2C0(a3, v6, v7);
  sub_100011B4C((uint64_t)v6, v7);

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PASVSPrimaryViewController();
  v4 = v5.receiver;
  -[PASVSPrimaryViewController viewDidAppear:](&v5, "viewDidAppear:", v3);
  sub_10000F904();

}

- (void)didInvalidateForRemoteAlert
{
  _TtC14PASViewService26PASVSPrimaryViewController *v2;

  v2 = self;
  sub_100010358("PASVSPrimaryViewController didInvalidateForRemoteAlert");

}

- (_TtC14PASViewService26PASVSPrimaryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC14PASViewService26PASVSPrimaryViewController *)sub_10001053C(v5, v7, a4);
}

- (_TtC14PASViewService26PASVSPrimaryViewController)initWithCoder:(id)a3
{
  return (_TtC14PASViewService26PASVSPrimaryViewController *)sub_1000106F8(a3);
}

- (void).cxx_destruct
{

  sub_100006884((uint64_t)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_targetDevice], &qword_10001E2F0);
  swift_release(*(_QWORD *)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_flowController]);
  sub_100010F0C(*(_QWORD *)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_validationResult], *(_QWORD *)&self->device[OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_validationResult], *(_QWORD *)&self->targetDevice[OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_validationResult]);
  swift_release(*(_QWORD *)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController__extensionCache]);
  swift_release(*(_QWORD *)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController__deviceProvider]);
  sub_100011C68(*(_QWORD *)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_designatedExtension], *(void **)&self->device[OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_designatedExtension]);
  sub_100006884((uint64_t)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC14PASViewService26PASVSPrimaryViewController_sourceViewDetails], &qword_10001E580);
}

@end
