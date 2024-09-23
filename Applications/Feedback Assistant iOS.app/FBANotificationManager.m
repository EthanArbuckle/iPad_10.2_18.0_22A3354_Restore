@implementation FBANotificationManager

- (void)requestPermission
{
  void *v3;
  _TtC18Feedback_Assistant22FBANotificationManager *v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[5];
  uint64_t v11;

  v3 = (void *)objc_opt_self(UNUserNotificationCenter);
  v4 = self;
  v5 = objc_msgSend(v3, "currentNotificationCenter");
  v6 = swift_allocObject(&unk_1000E7E30, 24, 7);
  *(_QWORD *)(v6 + 16) = v5;
  v10[4] = sub_10004BB38;
  v11 = v6;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 1107296256;
  v10[2] = sub_10004B098;
  v10[3] = &unk_1000E7E48;
  v7 = _Block_copy(v10);
  v8 = v11;
  v9 = v5;
  swift_release(v8);
  objc_msgSend(v9, "getNotificationSettingsWithCompletionHandler:", v7);
  _Block_release(v7);

}

- (NSString)apnsToken
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->apnsToken[OBJC_IVAR____TtC18Feedback_Assistant22FBANotificationManager_apnsToken];
  if (v2)
  {
    swift_bridgeObjectRetain(*(_QWORD *)&self->apnsToken[OBJC_IVAR____TtC18Feedback_Assistant22FBANotificationManager_apnsToken]);
    v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v2);
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (void)setApnsToken:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;

  if (a3)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC18Feedback_Assistant22FBANotificationManager_apnsToken);
  v7 = *(_QWORD *)&self->apnsToken[OBJC_IVAR____TtC18Feedback_Assistant22FBANotificationManager_apnsToken];
  *v6 = v4;
  v6[1] = v5;
  swift_bridgeObjectRelease(v7);
}

+ (_TtC18Feedback_Assistant22FBANotificationManager)sharedManager
{
  if (qword_100115E08 != -1)
    swift_once(&qword_100115E08, sub_100079F44);
  return (_TtC18Feedback_Assistant22FBANotificationManager *)(id)qword_100119F58;
}

- (_TtC18Feedback_Assistant22FBANotificationManager)init
{
  _QWORD *v3;
  objc_class *v4;
  objc_super v6;

  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18Feedback_Assistant22FBANotificationManager_apnsToken);
  v4 = (objc_class *)type metadata accessor for FBANotificationManager();
  *v3 = 0;
  v3[1] = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return -[FBANotificationManager init](&v6, "init");
}

- (void)saveToken:(id)a3
{
  id v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  _TtC18Feedback_Assistant22FBANotificationManager *v9;

  v5 = a3;
  v9 = self;
  v6 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v8 = v7;

  sub_100079FFC(v6, v8);
  sub_100050694(v6, v8);

}

- (void)registerAPNSWithParticipantID:(id)a3 api:(id)a4
{
  id v6;
  id v7;
  _TtC18Feedback_Assistant22FBANotificationManager *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_10007A250(v6, v7);

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->apnsToken[OBJC_IVAR____TtC18Feedback_Assistant22FBANotificationManager_apnsToken]);
}

@end
