@implementation AppEventFormattedDatePresenter

- (void)update
{
  swift_retain(self);
  sub_1004E1298();
  swift_release();
}

- (void)appEnteredWhileAppeared
{
  swift_retain(self);
  sub_1004E1298();
  swift_release();
}

- (void)appExitedWhileAppeared
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = OBJC_IVAR____TtC20ProductPageExtension30AppEventFormattedDatePresenter_updateTimer;
  v4 = *(void **)&self->_TtCs12_SwiftObject_opaque[OBJC_IVAR____TtC20ProductPageExtension30AppEventFormattedDatePresenter_updateTimer];
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
