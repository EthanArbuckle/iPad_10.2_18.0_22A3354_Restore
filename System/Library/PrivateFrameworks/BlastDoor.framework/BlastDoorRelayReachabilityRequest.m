@implementation BlastDoorRelayReachabilityRequest

- (NSString)description
{
  return (NSString *)sub_1AD4AB274((uint64_t)self, (uint64_t)a2, (uint64_t (*)(_QWORD))type metadata accessor for RelayReachabilityRequest, &OBJC_IVAR___BlastDoorRelayReachabilityRequest_relayReachabilityRequest);
}

- (NSArray)handles
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t (*v6)(_QWORD);
  void *v7;
  NSArray *result;
  uint64_t v9;

  v3 = type metadata accessor for RelayReachabilityRequest();
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD0D3D2C((uint64_t)self + OBJC_IVAR___BlastDoorRelayReachabilityRequest_relayReachabilityRequest, (uint64_t)v5, v6);
  if (*((_QWORD *)v5 + 2))
  {
    swift_bridgeObjectRetain();
    sub_1AD066230((uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for RelayReachabilityRequest);
    v7 = (void *)sub_1AD63B990();
    swift_bridgeObjectRelease();
    return (NSArray *)v7;
  }
  else
  {
    result = (NSArray *)sub_1AD63BE28();
    __break(1u);
  }
  return result;
}

- (NSString)serviceName
{
  return (NSString *)sub_1AD4C2C3C();
}

- (BlastDoorRelayReachabilityContext)context
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  objc_class *v8;
  id v9;
  BlastDoorRelayReachabilityRequest *v10;
  BlastDoorRelayReachabilityRequest *v11;
  objc_super v13;

  v3 = type metadata accessor for RelayReachabilityContext();
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (char *)self + OBJC_IVAR___BlastDoorRelayReachabilityRequest_relayReachabilityRequest;
  v7 = type metadata accessor for RelayReachabilityRequest();
  sub_1AD0D3D2C((uint64_t)&v6[*(int *)(v7 + 24)], (uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for RelayReachabilityContext);
  v8 = (objc_class *)type metadata accessor for _ObjCRelayReachabilityContextWrapper(0);
  v9 = objc_allocWithZone(v8);
  sub_1AD0D3D2C((uint64_t)v5, (uint64_t)v9 + OBJC_IVAR___BlastDoorRelayReachabilityContext_relayReachabilityContext, (uint64_t (*)(_QWORD))type metadata accessor for RelayReachabilityContext);
  v13.receiver = v9;
  v13.super_class = v8;
  v10 = self;
  v11 = -[BlastDoorRelayReachabilityRequest init](&v13, sel_init);
  sub_1AD066230((uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for RelayReachabilityContext);

  return (BlastDoorRelayReachabilityContext *)v11;
}

- (BlastDoorRelayReachabilityRequest)init
{
  BlastDoorRelayReachabilityRequest *result;

  result = (BlastDoorRelayReachabilityRequest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD066230((uint64_t)self + OBJC_IVAR___BlastDoorRelayReachabilityRequest_relayReachabilityRequest, (uint64_t (*)(_QWORD))type metadata accessor for RelayReachabilityRequest);
}

@end
