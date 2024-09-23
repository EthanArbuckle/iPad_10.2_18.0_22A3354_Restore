@implementation NotifyMeButtonPresenter

- (void)userNotificationsDidChangeNotification:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  __n128 v9;
  uint64_t v10;

  v5 = type metadata accessor for Notification(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  swift_retain(self);
  sub_1002E6D0C();
  v9 = swift_release(self);
  (*(void (**)(char *, uint64_t, __n128))(v6 + 8))(v8, v5, v9);
}

- (void)appEnteredWhileAppeared
{
  swift_retain(self);
  sub_1002E5630();
  swift_release(self);
}

- (void)appExitedWhileAppeared
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = OBJC_IVAR____TtC8AppStore23NotifyMeButtonPresenter_displayTimeReachedTimer;
  v4 = *(void **)&self->_TtCs12_SwiftObject_opaque[OBJC_IVAR____TtC8AppStore23NotifyMeButtonPresenter_displayTimeReachedTimer];
  swift_retain(self);
  if (v4)
  {
    objc_msgSend(v4, "invalidate");
    v5 = *(id *)&self->_TtCs12_SwiftObject_opaque[v3];
  }
  else
  {
    v5 = 0;
  }
  *(_QWORD *)&self->_TtCs12_SwiftObject_opaque[v3] = 0;
  swift_release(self);

}

- (void)displayTimeReached
{
  unsigned __int8 *v3;
  uint64_t Strong;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t ObjectType;
  void (*v9)(uint64_t, uint64_t, uint64_t, uint64_t);
  _BYTE v10[24];

  v3 = &self->_TtCs12_SwiftObject_opaque[OBJC_IVAR____TtC8AppStore23NotifyMeButtonPresenter_view];
  swift_beginAccess(&self->_TtCs12_SwiftObject_opaque[OBJC_IVAR____TtC8AppStore23NotifyMeButtonPresenter_view], v10, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v3);
  if (Strong)
  {
    v6 = Strong;
    v7 = *((_QWORD *)v3 + 1);
    ObjectType = swift_getObjectType(Strong, v5);
    v9 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 40);
    swift_retain(self);
    v9(1, 1, ObjectType, v7);
    swift_release(self);
    swift_unknownObjectRelease(v6);
  }
}

@end
