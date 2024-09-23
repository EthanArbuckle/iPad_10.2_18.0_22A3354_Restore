@implementation SingleUseGKDaemonProxyDataUpdateDelegate

- (void)refreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4
{
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  _TtC8AppStoreP33_A0754A494B8127F1F0C89CD9C6374F4B40SingleUseGKDaemonProxyDataUpdateDelegate *v8;
  uint64_t v9;

  v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  if (*(_DWORD *)((char *)&self->super.isa
                 + OBJC_IVAR____TtC8AppStoreP33_A0754A494B8127F1F0C89CD9C6374F4B40SingleUseGKDaemonProxyDataUpdateDelegate_updateType) == a3)
  {
    v7 = *(uint64_t (**)(uint64_t))((char *)&self->super.isa
                                           + OBJC_IVAR____TtC8AppStoreP33_A0754A494B8127F1F0C89CD9C6374F4B40SingleUseGKDaemonProxyDataUpdateDelegate_updateBlock);
    v8 = self;
    v9 = v7(v6);
    (*(void (**)(uint64_t))((char *)&v8->super.isa
                                    + OBJC_IVAR____TtC8AppStoreP33_A0754A494B8127F1F0C89CD9C6374F4B40SingleUseGKDaemonProxyDataUpdateDelegate_cleanupBlock))(v9);

  }
  swift_bridgeObjectRelease(v6);
}

- (void)dealloc
{
  void *v3;
  _TtC8AppStoreP33_A0754A494B8127F1F0C89CD9C6374F4B40SingleUseGKDaemonProxyDataUpdateDelegate *v4;
  id v5;
  objc_super v6;

  v3 = (void *)objc_opt_self(GKDaemonProxy);
  v4 = self;
  v5 = objc_msgSend(v3, "daemonProxy");
  objc_msgSend(v5, "removeDataUpdateDelegate:", v4);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for SingleUseGKDaemonProxyDataUpdateDelegate();
  -[SingleUseGKDaemonProxyDataUpdateDelegate dealloc](&v6, "dealloc");
}

- (void).cxx_destruct
{
  swift_release(*(_QWORD *)&self->updateType[OBJC_IVAR____TtC8AppStoreP33_A0754A494B8127F1F0C89CD9C6374F4B40SingleUseGKDaemonProxyDataUpdateDelegate_updateBlock]);
  swift_release(*(_QWORD *)&self->updateType[OBJC_IVAR____TtC8AppStoreP33_A0754A494B8127F1F0C89CD9C6374F4B40SingleUseGKDaemonProxyDataUpdateDelegate_cleanupBlock]);
}

- (_TtC8AppStoreP33_A0754A494B8127F1F0C89CD9C6374F4B40SingleUseGKDaemonProxyDataUpdateDelegate)init
{
  _TtC8AppStoreP33_A0754A494B8127F1F0C89CD9C6374F4B40SingleUseGKDaemonProxyDataUpdateDelegate *result;

  result = (_TtC8AppStoreP33_A0754A494B8127F1F0C89CD9C6374F4B40SingleUseGKDaemonProxyDataUpdateDelegate *)_swift_stdlib_reportUnimplementedInitializer("AppStore.SingleUseGKDaemonProxyDataUpdateDelegate", 49, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
