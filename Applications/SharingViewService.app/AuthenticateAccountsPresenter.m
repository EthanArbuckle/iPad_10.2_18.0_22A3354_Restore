@implementation AuthenticateAccountsPresenter

- (void)dealloc
{
  void *v3;
  _TtC18SharingViewService29AuthenticateAccountsPresenter *v4;
  id v5;
  NSString v6;
  objc_super v7;

  v3 = (void *)objc_opt_self(NSDistributedNotificationCenter);
  v4 = self;
  v5 = objc_msgSend(v3, "defaultCenter");
  v6 = String._bridgeToObjectiveC()();
  objc_msgSend(v5, "removeObserver:name:object:", v4, v6, 0);

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for AuthenticateAccountsPresenter();
  -[AuthenticateAccountsPresenter dealloc](&v7, "dealloc");
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)&self->authViewModel[OBJC_IVAR____TtC18SharingViewService29AuthenticateAccountsPresenter_authViewModel];
  swift_bridgeObjectRelease(*(_QWORD *)&self->authViewModel[OBJC_IVAR____TtC18SharingViewService29AuthenticateAccountsPresenter_authViewModel
                                                          + 16]);
  swift_bridgeObjectRelease(v3);
  swift_release(*(_QWORD *)&self->authViewModel[OBJC_IVAR____TtC18SharingViewService29AuthenticateAccountsPresenter_authViewModelDidUpdate]);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC18SharingViewService29AuthenticateAccountsPresenter_interactor));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC18SharingViewService29AuthenticateAccountsPresenter_router));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC18SharingViewService29AuthenticateAccountsPresenter_remoteViewControllerProxy));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC18SharingViewService29AuthenticateAccountsPresenter_inProgressCard, v4);
}

- (_TtC18SharingViewService29AuthenticateAccountsPresenter)init
{
  _TtC18SharingViewService29AuthenticateAccountsPresenter *result;

  result = (_TtC18SharingViewService29AuthenticateAccountsPresenter *)_swift_stdlib_reportUnimplementedInitializer("SharingViewService.AuthenticateAccountsPresenter", 48, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void)handleDeviceSetupWithNotification:(id)a3
{
  id v4;
  _TtC18SharingViewService29AuthenticateAccountsPresenter *v5;

  v4 = a3;
  v5 = self;
  sub_10006F1B0(v4);

}

- (void)proxCardFlowDidDismiss
{
  _TtC18SharingViewService29AuthenticateAccountsPresenter *v2;

  v2 = self;
  sub_1000DCA74();

}

@end
