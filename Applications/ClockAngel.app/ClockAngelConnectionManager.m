@implementation ClockAngelConnectionManager

- (_TtC10ClockAngel27ClockAngelConnectionManager)init
{
  _TtC10ClockAngel27ClockAngelConnectionManager *result;

  sub_100047980();
  return result;
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v8;
  id v9;
  _TtC10ClockAngel27ClockAngelConnectionManager *v10;

  v8 = a3;
  v9 = a4;
  swift_unknownObjectRetain(a5);
  v10 = self;
  sub_10004B1EC(v9);

  swift_unknownObjectRelease(a5);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ClockAngel27ClockAngelConnectionManager_publicListener));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ClockAngel27ClockAngelConnectionManager_connectionManagerQueue));
  sub_100010630(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC10ClockAngel27ClockAngelConnectionManager_reloadLayout), *(_QWORD *)&self->publicListener[OBJC_IVAR____TtC10ClockAngel27ClockAngelConnectionManager_reloadLayout]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ClockAngel27ClockAngelConnectionManager____lazy_storage___interface));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ClockAngel27ClockAngelConnectionManager____lazy_storage___timerManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ClockAngel27ClockAngelConnectionManager____lazy_storage___alarmManager));
}

- (void)startTimerSessionWithId:(id)a3 title:(id)a4 estimatedEndDate:(id)a5 duartion:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  id v21;
  _TtC10ClockAngel27ClockAngelConnectionManager *v22;
  uint64_t v23;

  v11 = type metadata accessor for Date(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v17 = v16;
  v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v20 = v19;
  static Date._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v21 = a6;
  v22 = self;
  sub_100048438(v15, v17, v18, v20, (uint64_t)v14, v21);

  swift_bridgeObjectRelease(v17);
  swift_bridgeObjectRelease(v20);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

- (void)pauseTimerSessionWithId:(id)a3 title:(id)a4 duration:(id)a5 remaining:(id)a6 timeRemainingString:(id)a7 remainingPortion:(id)a8
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  _TtC10ClockAngel27ClockAngelConnectionManager *v25;
  uint64_t v26;

  v26 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v15 = v14;
  v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v18 = v17;
  v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(a7);
  v21 = v20;
  v22 = a5;
  v23 = a6;
  v24 = a8;
  v25 = self;
  sub_1000487A0(v26, v15, v16, v18, v22, v23, v19, v21, v24);

  swift_bridgeObjectRelease(v15);
  swift_bridgeObjectRelease(v18);
  swift_bridgeObjectRelease(v21);
}

- (void)updateTimerSessionWithId:(id)a3 title:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _TtC10ClockAngel27ClockAngelConnectionManager *v12;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v8 = v7;
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = v10;
  v12 = self;
  sub_10004B4CC(v6, v8, v9, v11);

  swift_bridgeObjectRelease(v8);
  swift_bridgeObjectRelease(v11);
}

- (void)stopTimerSessionWithId:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC10ClockAngel27ClockAngelConnectionManager *v7;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = self;
  sub_100048B5C(v4, v6);

  swift_bridgeObjectRelease(v6);
}

- (void)warmUp
{
  void *v3;
  _TtC10ClockAngel27ClockAngelConnectionManager *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  Swift::String v8;
  NSString v9;

  v3 = (void *)objc_opt_self(MTSessionUtilities);
  v4 = self;
  v5 = -[ClockAngelConnectionManager description](v4, "description");
  static String._unconditionallyBridgeFromObjectiveC(_:)(v5);
  v7 = v6;

  v8._countAndFlagsBits = 0x676E696D72617720;
  v8._object = (void *)0xEB00000000707520;
  String.append(_:)(v8);
  v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v7);
  objc_msgSend(v3, "logInfo:", v9);

}

- (void)alertTimerWithActivityId:(id)a3 timerId:(id)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _TtC10ClockAngel27ClockAngelConnectionManager *v13;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v8 = v7;
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = v10;
  v12 = qword_1000AECE0;
  v13 = self;
  if (v12 != -1)
    swift_once(&qword_1000AECE0, sub_1000415B8);
  sub_1000415F0(v6, v8, v9, v11);

  swift_bridgeObjectRelease(v8);
  swift_bridgeObjectRelease(v11);
}

- (void)endAlertingSession
{
  _TtC10ClockAngel27ClockAngelConnectionManager *v2;

  v2 = self;
  sub_10001E5B4(38, 0xD000000000000024, (void *)0x8000000100088070);

}

- (id)alertingSessionId
{
  uint64_t v2;
  uint64_t v3;
  NSString v4;

  sub_10004B660();
  v3 = v2;
  v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  return v4;
}

- (void)alertAlarm:(id)a3 activityId:(id)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  _TtC10ClockAngel27ClockAngelConnectionManager *v11;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v8 = v7;
  v9 = qword_1000AECE0;
  v10 = a3;
  v11 = self;
  if (v9 != -1)
    swift_once(&qword_1000AECE0, sub_1000415B8);
  sub_100041924(v10, v6, v8);

  swift_bridgeObjectRelease(v8);
}

- (void)startAlarmSnoozeSessionWithId:(id)a3 estimatedEndDate:(id)a4 title:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _TtC10ClockAngel27ClockAngelConnectionManager *v15;
  uint64_t v16;

  v8 = type metadata accessor for Date(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v14 = v13;
  static Date._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v15 = self;
  sub_10004B6D8(v12, v14);

  swift_bridgeObjectRelease(v14);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)startAlarmSnoozeSessionWithAlarm:(id)a3
{
  id v4;
  _TtC10ClockAngel27ClockAngelConnectionManager *v5;

  v4 = a3;
  v5 = self;
  sub_1000490C8(v4);

}

- (void)stopAlarmSnoozeSessionWithId:(id)a3
{
  _TtC10ClockAngel27ClockAngelConnectionManager *v3;

  v3 = self;
  sub_10001E5B4(37, 0xD000000000000023, (void *)0x8000000100087F80);

}

- (void)removeAlarms:(id)a3
{
  uint64_t v4;
  _TtC10ClockAngel27ClockAngelConnectionManager *v5;

  v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, (char *)&type metadata for Any + 8);
  v5 = self;
  sub_10004935C(v4);

  swift_bridgeObjectRelease(v4);
}

- (void)updateAlarmEntry:(id)a3
{
  uint64_t v4;
  id v5;
  _TtC10ClockAngel27ClockAngelConnectionManager *v6;
  id v7;

  v4 = qword_1000AECC8;
  v5 = a3;
  v6 = self;
  if (v4 != -1)
    swift_once(&qword_1000AECC8, sub_10001EE18);
  v7 = v5;
  dispatch thunk of DataStore.updateEntry(_:)(&v7);

}

@end
