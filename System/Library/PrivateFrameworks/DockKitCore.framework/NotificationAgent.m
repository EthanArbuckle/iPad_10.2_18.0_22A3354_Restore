@implementation NotificationAgent

- (BOOL)registerWithCallback:(id)a3
{
  void *v4;
  uint64_t v5;
  NotificationAgent *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  LOBYTE(self) = sub_23A6789F8((uint64_t)sub_23A679C00, v5);

  swift_release();
  return self & 1;
}

- (BOOL)isTracking
{
  NotificationAgent *v2;
  char v3;

  v2 = self;
  v3 = sub_23A678DB0();

  return v3 & 1;
}

- (void)deregister
{
  NotificationAgent *v2;

  v2 = self;
  sub_23A678FC4();

}

- (void)dealloc
{
  NotificationAgent *v2;

  v2 = self;
  NotificationAgent.__deallocating_deinit();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR___NotificationAgent_logger;
  v4 = sub_23A690D14();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_23A61BE00(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___NotificationAgent_callback));
  swift_release();
}

- (void)stateEventWithInfo:(id)a3 connectedState:(int64_t)a4 dockState:(int64_t)a5 trackingButtonState:(int64_t)a6
{
  id v10;
  NotificationAgent *v11;

  v10 = a3;
  v11 = self;
  sub_23A6791AC(v10, a4, a5, (char *)a6);

}

- (NotificationAgent)init
{
  return (NotificationAgent *)NotificationAgent.init()();
}

@end
