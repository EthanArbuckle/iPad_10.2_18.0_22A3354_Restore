@implementation AuthenticateAccountsFlowViewController

- (_TtC18SharingViewService38AuthenticateAccountsFlowViewController)init
{
  objc_class *ObjectType;
  _TtC18SharingViewService26BaseProxFlowViewController *v4;
  uint64_t (**v5)(uint64_t);
  id (**v6)();
  id (**v7)(uint64_t, uint64_t, uint64_t, uint64_t);
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType(self);
  v4 = (_TtC18SharingViewService26BaseProxFlowViewController *)((char *)&self->super
                                                              + OBJC_IVAR____TtC18SharingViewService38AuthenticateAccountsFlowViewController_presenter);
  *v4 = 0;
  v4[1] = 0;
  v5 = (uint64_t (**)(uint64_t))((char *)&self->super
                                        + OBJC_IVAR____TtC18SharingViewService38AuthenticateAccountsFlowViewController_interactorGenerator);
  *v5 = sub_10007E14C;
  v5[1] = 0;
  v6 = (id (**)())((char *)&self->super
                 + OBJC_IVAR____TtC18SharingViewService38AuthenticateAccountsFlowViewController_routerGenerator);
  *v6 = sub_10007E250;
  v6[1] = 0;
  v7 = (id (**)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)&self->super
                                                              + OBJC_IVAR____TtC18SharingViewService38AuthenticateAccountsFlowViewController_presenterGenerator);
  *v7 = sub_10007E280;
  v7[1] = 0;
  v9.receiver = self;
  v9.super_class = ObjectType;
  return -[BaseProxFlowViewController initWithNibName:bundle:](&v9, "initWithNibName:bundle:", 0, 0);
}

- (_TtC18SharingViewService38AuthenticateAccountsFlowViewController)initWithCoder:(id)a3
{
  _TtC18SharingViewService26BaseProxFlowViewController *v4;
  id v5;
  _TtC18SharingViewService38AuthenticateAccountsFlowViewController *result;

  v4 = (_TtC18SharingViewService26BaseProxFlowViewController *)((char *)&self->super
                                                              + OBJC_IVAR____TtC18SharingViewService38AuthenticateAccountsFlowViewController_presenter);
  *v4 = 0;
  v4[1] = 0;
  v5 = a3;

  result = (_TtC18SharingViewService38AuthenticateAccountsFlowViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100136660, "SharingViewService/AuthenticateAccountsFlowViewController.swift", 63, 2, 28, 0);
  __break(1u);
  return result;
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  void (*v6)(_QWORD);
  uint64_t v7;
  id v8;
  _TtC18SharingViewService38AuthenticateAccountsFlowViewController *v9;

  v6 = (void (*)(_QWORD))_Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_10017AB10, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = (void (*)(_QWORD))sub_10005B9E4;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  sub_10007E40C(a3, v6, v7);
  sub_100012F60((uint64_t)v6, v7);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC18SharingViewService38AuthenticateAccountsFlowViewController *v4;

  v4 = self;
  sub_10007E838(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC18SharingViewService38AuthenticateAccountsFlowViewController *v4;

  v4 = self;
  sub_10007E9F0(a3);

}

- (void)handleButtonActions:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _TtC18SharingViewService38AuthenticateAccountsFlowViewController *v10;

  if (a3)
  {
    v5 = sub_100069228();
    v6 = sub_10005B9EC();
    v7 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v5, v6);
    v8 = v7;
    v9 = *(uint64_t *)((char *)&self->super
                    + OBJC_IVAR____TtC18SharingViewService38AuthenticateAccountsFlowViewController_presenter);
    if (v9)
    {
      if (v7)
      {
        v10 = self;
        swift_unknownObjectRetain(v9);
        sub_1000DC378(v8);

        swift_bridgeObjectRelease(v8);
        swift_unknownObjectRelease(v9);
        return;
      }
      goto LABEL_8;
    }
LABEL_7:
    swift_bridgeObjectRelease(v8);
    return;
  }
  if (!*(_QWORD *)((char *)&self->super
                  + OBJC_IVAR____TtC18SharingViewService38AuthenticateAccountsFlowViewController_presenter))
  {
    v8 = 0;
    goto LABEL_7;
  }
LABEL_8:
  __break(1u);
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (_TtC18SharingViewService38AuthenticateAccountsFlowViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC18SharingViewService38AuthenticateAccountsFlowViewController *result;

  v4 = a4;
  result = (_TtC18SharingViewService38AuthenticateAccountsFlowViewController *)_swift_stdlib_reportUnimplementedInitializer("SharingViewService.AuthenticateAccountsFlowViewController", 57, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(_QWORD *)((char *)&self->super
                                       + OBJC_IVAR____TtC18SharingViewService38AuthenticateAccountsFlowViewController_presenter));
  swift_release(*(_QWORD *)&self->presenter[OBJC_IVAR____TtC18SharingViewService38AuthenticateAccountsFlowViewController_interactorGenerator]);
  swift_release(*(_QWORD *)&self->presenter[OBJC_IVAR____TtC18SharingViewService38AuthenticateAccountsFlowViewController_routerGenerator]);
  swift_release(*(_QWORD *)&self->presenter[OBJC_IVAR____TtC18SharingViewService38AuthenticateAccountsFlowViewController_presenterGenerator]);
}

@end
