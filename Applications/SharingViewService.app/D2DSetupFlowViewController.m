@implementation D2DSetupFlowViewController

- (_TtC18SharingViewService26D2DSetupFlowViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC18SharingViewService26D2DSetupFlowViewController *)sub_10008D24C(v5, v7, a4);
}

- (_TtC18SharingViewService26D2DSetupFlowViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10008F950();
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  uint64_t (*v6)(uint64_t);
  uint64_t v7;
  id v8;
  _TtC18SharingViewService26D2DSetupFlowViewController *v9;

  v6 = (uint64_t (*)(uint64_t))_Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_10017B208, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = (uint64_t (*)(uint64_t))sub_10005B9E4;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  sub_10008D60C(a3, v6);
  sub_100012F60((uint64_t)v6, v7);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC18SharingViewService26D2DSetupFlowViewController *v4;

  v4 = self;
  sub_10008E7E4(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC18SharingViewService26D2DSetupFlowViewController *v4;

  v4 = self;
  sub_10008EA98(a3, (uint64_t)v4);

}

- (void)handleButtonActions:(id)a3
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _TtC18SharingViewService26D2DSetupFlowViewController *v9;
  uint64_t v10;

  if (a3)
  {
    v5 = sub_100013194(0, (unint64_t *)&qword_1001A5BC0, SBUIRemoteAlertButtonAction_ptr);
    v6 = sub_10005B9EC();
    v7 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v5, v6);
  }
  else
  {
    v7 = 0;
  }
  v8 = *(uint64_t *)((char *)&self->super + OBJC_IVAR____TtC18SharingViewService26D2DSetupFlowViewController_router);
  if (v8)
  {
    v9 = self;
    swift_unknownObjectRetain(v8);
    sub_1000887A8(v7, v10);

    swift_unknownObjectRelease(v8);
  }
  swift_bridgeObjectRelease(v7);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(_QWORD *)((char *)&self->super
                                       + OBJC_IVAR____TtC18SharingViewService26D2DSetupFlowViewController_interactor));
  swift_unknownObjectRelease(*(_QWORD *)((char *)&self->super
                                       + OBJC_IVAR____TtC18SharingViewService26D2DSetupFlowViewController_router));
  swift_unknownObjectRelease(*(_QWORD *)((char *)&self->super
                                       + OBJC_IVAR____TtC18SharingViewService26D2DSetupFlowViewController_presenter));
  swift_release(*(_QWORD *)&self->interactor[OBJC_IVAR____TtC18SharingViewService26D2DSetupFlowViewController_interactorGenerator]);
  swift_release(*(_QWORD *)&self->interactor[OBJC_IVAR____TtC18SharingViewService26D2DSetupFlowViewController_routerGenerator]);
  swift_release(*(_QWORD *)&self->interactor[OBJC_IVAR____TtC18SharingViewService26D2DSetupFlowViewController_presenterGenerator]);
  objc_release(*(id *)((char *)&self->super
                     + OBJC_IVAR____TtC18SharingViewService26D2DSetupFlowViewController_svsAssertion));
  objc_release(*(id *)((char *)&self->super
                     + OBJC_IVAR____TtC18SharingViewService26D2DSetupFlowViewController_remoteAlertHandle));
}

@end
