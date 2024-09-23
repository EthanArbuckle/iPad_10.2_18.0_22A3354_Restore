@implementation BlastDoorRelayReachabilityHandleResult

- (NSString)description
{
  void *v2;

  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1AD63B798();
  v2 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)handleID
{
  return (NSString *)sub_1AD4C3120((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorRelayReachabilityHandleResult_relayReachabilityHandleResult);
}

- (NSString)service
{
  return (NSString *)sub_1AD4C324C();
}

- (BOOL)isReachable
{
  return self->relayReachabilityHandleResult[OBJC_IVAR___BlastDoorRelayReachabilityHandleResult_relayReachabilityHandleResult
                                           + 40];
}

- (BlastDoorRelayReachabilityHandleResult)init
{
  BlastDoorRelayReachabilityHandleResult *result;

  result = (BlastDoorRelayReachabilityHandleResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
}

@end
