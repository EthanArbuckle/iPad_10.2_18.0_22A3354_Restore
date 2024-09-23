@implementation EnrollStateDispatchWorkItemsManager

- (void)submitWorkItemFor:(int)a3 startState:(int)a4 work:(id)a5
{
  void *v8;
  uint64_t v9;
  _TtC14BiometricKitUI35EnrollStateDispatchWorkItemsManager *v10;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  v10 = self;
  sub_1DB2D5B68(a3, a4, sub_1DB2D66AC, v9);

  swift_release();
}

- (void)removeAllWorkItems
{
  _TtC14BiometricKitUI35EnrollStateDispatchWorkItemsManager *v2;

  v2 = self;
  sub_1DB2D5F8C();

}

- (_TtC14BiometricKitUI35EnrollStateDispatchWorkItemsManager)init
{
  return (_TtC14BiometricKitUI35EnrollStateDispatchWorkItemsManager *)sub_1DB2D6128();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14BiometricKitUI35EnrollStateDispatchWorkItemsManager_pendingOperations));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14BiometricKitUI35EnrollStateDispatchWorkItemsManager_stateQueue));
}

@end
