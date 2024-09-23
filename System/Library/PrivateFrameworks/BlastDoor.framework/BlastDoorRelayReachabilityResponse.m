@implementation BlastDoorRelayReachabilityResponse

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

- (BlastDoorRelayReachabilityResult)result
{
  uint64_t v2;
  uint64_t v3;
  unsigned __int8 v4;
  uint64_t v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  objc_class *v9;
  char *v10;
  char *v11;
  objc_super v13;

  v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorRelayReachabilityResponse_relayReachabilityResponse);
  v2 = *(_QWORD *)&self->relayReachabilityResponse[OBJC_IVAR___BlastDoorRelayReachabilityResponse_relayReachabilityResponse];
  v4 = self->relayReachabilityResponse[OBJC_IVAR___BlastDoorRelayReachabilityResponse_relayReachabilityResponse + 8];
  v5 = *(_QWORD *)&self->relayReachabilityResponse[OBJC_IVAR___BlastDoorRelayReachabilityResponse_relayReachabilityResponse
                                                 + 16];
  v6 = self->relayReachabilityResponse[OBJC_IVAR___BlastDoorRelayReachabilityResponse_relayReachabilityResponse + 24];
  v7 = self->relayReachabilityResponse[OBJC_IVAR___BlastDoorRelayReachabilityResponse_relayReachabilityResponse + 25];
  v8 = self->relayReachabilityResponse[OBJC_IVAR___BlastDoorRelayReachabilityResponse_relayReachabilityResponse + 26];
  v9 = (objc_class *)type metadata accessor for _ObjCRelayReachabilityResultWrapper();
  v10 = (char *)objc_allocWithZone(v9);
  v11 = &v10[OBJC_IVAR___BlastDoorRelayReachabilityResult_relayReachabilityResult];
  *(_QWORD *)v11 = v3;
  *((_QWORD *)v11 + 1) = v2;
  v11[16] = v4;
  *((_QWORD *)v11 + 3) = v5;
  v11[32] = v6;
  v11[33] = v7;
  v11[34] = v8;
  v13.receiver = v10;
  v13.super_class = v9;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return (BlastDoorRelayReachabilityResult *)-[BlastDoorRelayReachabilityResponse init](&v13, sel_init);
}

- (BlastDoorRelayReachabilityResponse)init
{
  BlastDoorRelayReachabilityResponse *result;

  result = (BlastDoorRelayReachabilityResponse *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD4C572C();
}

@end
