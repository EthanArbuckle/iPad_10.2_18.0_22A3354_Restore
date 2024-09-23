@implementation NotificationAgent

- (_TtC8SOSBuddy17NotificationAgent)init
{
  return (_TtC8SOSBuddy17NotificationAgent *)sub_1000749B4();
}

- (void)dealloc
{
  _TtC8SOSBuddy17NotificationAgent *v2;

  v2 = self;
  sub_100074C9C();
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC8SOSBuddy17NotificationAgent_didFinishPostNotificationRequest));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8SOSBuddy17NotificationAgent_didReceiveAction));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC8SOSBuddy17NotificationAgent__currentNotifications));
  sub_100025CBC(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8SOSBuddy17NotificationAgent__pendingContent), *(_QWORD *)&self->didFinishPostNotificationRequest[OBJC_IVAR____TtC8SOSBuddy17NotificationAgent__pendingContent], *(_QWORD *)&self->didReceiveAction[OBJC_IVAR____TtC8SOSBuddy17NotificationAgent__pendingContent], *(_QWORD *)&self->_currentNotifications[OBJC_IVAR____TtC8SOSBuddy17NotificationAgent__pendingContent], *(_QWORD *)&self->_pendingContent[OBJC_IVAR____TtC8SOSBuddy17NotificationAgent__pendingContent], *(_QWORD *)&self->_pendingContent[OBJC_IVAR____TtC8SOSBuddy17NotificationAgent__pendingContent + 8]);
}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
  void *v8;
  id v9;
  id v10;
  _TtC8SOSBuddy17NotificationAgent *v11;

  v8 = _Block_copy(a5);
  _Block_copy(v8);
  v9 = a3;
  v10 = a4;
  v11 = self;
  sub_100077700(v10, (uint64_t)v8);
  _Block_release(v8);
  _Block_release(v8);

}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  void *v8;
  id v9;
  id v10;
  _TtC8SOSBuddy17NotificationAgent *v11;

  v8 = _Block_copy(a5);
  _Block_copy(v8);
  v9 = a3;
  v10 = a4;
  v11 = self;
  sub_100077900(v10, (uint64_t)v11, (uint64_t)v8);
  _Block_release(v8);
  _Block_release(v8);

}

@end
