@implementation CKAskToNotificationManager

+ (CKAskToNotificationManager)sharedManager
{
  if (qword_10000CAB8 != -1)
    swift_once(&qword_10000CAB8, sub_1000025F8);
  return (CKAskToNotificationManager *)(id)qword_10000CAC0;
}

- (id)notificationActionsFromNotification:(id)a3
{
  id v4;
  CKAskToNotificationManager *v5;
  id v6;
  NSArray v7;
  uint64_t v8;

  v4 = a3;
  v5 = self;
  v6 = sub_100002BB4(v4);

  if (v6)
  {
    sub_1000060F0(0, &qword_10000CA18, UNNotificationAction_ptr);
    v7.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v6, v8);
  }
  else
  {
    v7.super.isa = 0;
  }
  return v7.super.isa;
}

- (void)handleResponse:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  CKAskToNotificationManager *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_100005478(v7, (uint64_t)v8, (void (**)(const void *, _QWORD))v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (CKAskToNotificationManager)init
{
  uint64_t v3;
  CKAskToNotificationManager *v4;
  uint64_t v5;
  objc_super v7;

  v3 = OBJC_IVAR___CKAskToNotificationManager_actionIdentifierToResponsePayloadMap;
  v4 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)sub_10000277C((uint64_t)&_swiftEmptyArrayStorage, v5);

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for AskToNotificationManager();
  return -[CKAskToNotificationManager init](&v7, "init");
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___CKAskToNotificationManager_actionIdentifierToResponsePayloadMap), a2);
}

@end
