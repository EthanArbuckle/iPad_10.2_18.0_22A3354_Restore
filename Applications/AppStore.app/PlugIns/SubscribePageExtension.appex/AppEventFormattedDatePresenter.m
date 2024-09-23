@implementation AppEventFormattedDatePresenter

- (void)update
{
  swift_retain(self);
  sub_1001EFE40();
  swift_release(self);
}

- (void)appEnteredWhileAppeared
{
  swift_retain(self);
  sub_1001EFE40();
  swift_release(self);
}

- (void)appExitedWhileAppeared
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = OBJC_IVAR____TtC22SubscribePageExtension30AppEventFormattedDatePresenter_updateTimer;
  v4 = *(void **)&self->_TtCs12_SwiftObject_opaque[OBJC_IVAR____TtC22SubscribePageExtension30AppEventFormattedDatePresenter_updateTimer];
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

@end
