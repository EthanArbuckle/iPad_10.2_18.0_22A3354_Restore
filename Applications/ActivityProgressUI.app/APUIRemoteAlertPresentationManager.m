@implementation APUIRemoteAlertPresentationManager

- (_TtC18ActivityProgressUI34APUIRemoteAlertPresentationManager)init
{
  uint64_t v3;
  _TtC18ActivityProgressUI34APUIRemoteAlertPresentationManager *v4;
  objc_super v6;

  v3 = OBJC_IVAR____TtC18ActivityProgressUI34APUIRemoteAlertPresentationManager_remoteAlertPresentationHandlesByID;
  v4 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)sub_100004D80((uint64_t)&_swiftEmptyArrayStorage);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for APUIRemoteAlertPresentationManager();
  return -[APUIRemoteAlertPresentationManager init](&v6, "init");
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC18ActivityProgressUI34APUIRemoteAlertPresentationManager_remoteAlertPresentationHandlesByID));
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  id v4;
  _TtC18ActivityProgressUI34APUIRemoteAlertPresentationManager *v5;

  v4 = a3;
  v5 = self;
  APUIRemoteAlertPresentationManager.remoteAlertHandleDidActivate(_:)(v4);

}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  id v4;
  _TtC18ActivityProgressUI34APUIRemoteAlertPresentationManager *v5;

  v4 = a3;
  v5 = self;
  APUIRemoteAlertPresentationManager.remoteAlertHandleDidDeactivate(_:)(v4);

}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v6;
  _TtC18ActivityProgressUI34APUIRemoteAlertPresentationManager *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = a4;
  APUIRemoteAlertPresentationManager.remoteAlertHandle(_:didInvalidateWithError:)(v6, (uint64_t)a4);

}

@end
