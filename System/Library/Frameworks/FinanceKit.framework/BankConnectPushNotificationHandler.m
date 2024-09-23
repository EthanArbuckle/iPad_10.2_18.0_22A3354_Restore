@implementation BankConnectPushNotificationHandler

+ (id)makeHandler
{
  uint64_t v2;
  objc_class *v3;
  char *v4;
  objc_super v6;

  if (qword_254245080 != -1)
    swift_once();
  v2 = *((_QWORD *)off_254245078 + 2);
  v3 = (objc_class *)type metadata accessor for BankConnectPushNotificationHandler();
  v4 = (char *)objc_allocWithZone(v3);
  *(_QWORD *)&v4[OBJC_IVAR____TtC10FinanceKit34BankConnectPushNotificationHandler_store] = v2;
  v6.receiver = v4;
  v6.super_class = v3;
  swift_retain();
  return objc_msgSendSuper2(&v6, sel_init);
}

- (void)handlePushNotificationWithPayload:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  _TtC10FinanceKit34BankConnectPushNotificationHandler *v6;
  NSObject *v7;
  os_activity_scope_state_s state;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = sub_23361E06C();
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v5 = qword_254246ED0;
  v6 = self;
  if (v5 != -1)
    swift_once();
  v7 = _os_activity_create(&dword_233151000, "bankConnect/notificationHandler", (os_activity_t)qword_254246EC8, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v7, &state);
  sub_2331E15A8((uint64_t)v6, v4);
  os_activity_scope_leave(&state);

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
}

- (_TtC10FinanceKit34BankConnectPushNotificationHandler)init
{
  _TtC10FinanceKit34BankConnectPushNotificationHandler *result;

  result = (_TtC10FinanceKit34BankConnectPushNotificationHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
