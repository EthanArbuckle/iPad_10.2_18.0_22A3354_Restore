@implementation PingBasedOnlineNetworkTransitionOperation

- (void)performOperation
{
  _TtC8NewsCore41PingBasedOnlineNetworkTransitionOperation *v2;

  v2 = self;
  sub_1A1C4D31C();

}

- (BOOL)canRetryWithError:(id)a3 retryAfter:(id *)a4
{
  id v6;
  _TtC8NewsCore41PingBasedOnlineNetworkTransitionOperation *v7;

  v6 = a3;
  v7 = self;
  LOBYTE(a4) = sub_1A1C4EB04(a4);

  return a4 & 1;
}

- (void)resetForRetry
{
  uint64_t v2;
  _QWORD *v3;
  os_unfair_lock_s *v4;
  _TtC8NewsCore41PingBasedOnlineNetworkTransitionOperation *v5;

  v2 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC8NewsCore41PingBasedOnlineNetworkTransitionOperation_probeLock);
  v3 = (_QWORD *)(v2 + 16);
  v4 = (os_unfair_lock_s *)(v2 + 24);
  v5 = self;
  os_unfair_lock_lock(v4);
  sub_1A1C4E2B8(v3);
  os_unfair_lock_unlock(v4);

}

- (unint64_t)maxRetries
{
  return -1;
}

- (void)cancel
{
  uint64_t v2;
  uint64_t *v3;
  os_unfair_lock_s *v4;
  _TtC8NewsCore41PingBasedOnlineNetworkTransitionOperation *v5;
  objc_super v6;
  BOOL v7;

  v2 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC8NewsCore41PingBasedOnlineNetworkTransitionOperation_probeLock);
  v3 = (uint64_t *)(v2 + 16);
  v4 = (os_unfair_lock_s *)(v2 + 24);
  v5 = self;
  os_unfair_lock_lock(v4);
  sub_1A1C4E34C(v3, &v7);
  os_unfair_lock_unlock(v4);
  v6.receiver = v5;
  v6.super_class = (Class)type metadata accessor for PingBasedOnlineNetworkTransitionOperation();
  -[FCOperation cancel](&v6, sel_cancel);

}

- (_TtC8NewsCore41PingBasedOnlineNetworkTransitionOperation)init
{
  _TtC8NewsCore41PingBasedOnlineNetworkTransitionOperation *result;

  result = (_TtC8NewsCore41PingBasedOnlineNetworkTransitionOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsCore41PingBasedOnlineNetworkTransitionOperation_log));
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
}

@end
