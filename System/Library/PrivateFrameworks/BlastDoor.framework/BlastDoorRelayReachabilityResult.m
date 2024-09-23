@implementation BlastDoorRelayReachabilityResult

- (NSString)description
{
  void *v2;

  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1AD63B798();
  v2 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)service
{
  return (NSString *)sub_1AD4D24E8();
}

- (int64_t)error
{
  int64_t result;
  char v3;

  result = sub_1AD4DA0C0(self->relayReachabilityResult[OBJC_IVAR___BlastDoorRelayReachabilityResult_relayReachabilityResult + 8]- 2);
  if ((v3 & 1) != 0)
    __break(1u);
  return result;
}

- (NSArray)handleResults
{
  return (NSArray *)sub_1AD4C9C78(self, (uint64_t)a2, (void (*)(void))sub_1AD4C3690, (void (*)(void))type metadata accessor for _ObjCRelayReachabilityHandleResultWrapper);
}

- (BOOL)isFinal
{
  return self->relayReachabilityResult[OBJC_IVAR___BlastDoorRelayReachabilityResult_relayReachabilityResult + 24];
}

- (BOOL)allAreReachable
{
  return self->relayReachabilityResult[OBJC_IVAR___BlastDoorRelayReachabilityResult_relayReachabilityResult + 25];
}

- (BOOL)didCheckServer
{
  return self->relayReachabilityResult[OBJC_IVAR___BlastDoorRelayReachabilityResult_relayReachabilityResult + 26];
}

- (BlastDoorRelayReachabilityResult)init
{
  BlastDoorRelayReachabilityResult *result;

  result = (BlastDoorRelayReachabilityResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD4C572C();
}

@end
