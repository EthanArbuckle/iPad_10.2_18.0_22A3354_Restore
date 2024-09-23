@implementation BlastDoorRelayReachabilityContext

- (NSString)description
{
  return (NSString *)sub_1AD4AB274((uint64_t)self, (uint64_t)a2, (uint64_t (*)(_QWORD))type metadata accessor for RelayReachabilityContext, &OBJC_IVAR___BlastDoorRelayReachabilityContext_relayReachabilityContext);
}

- (NSString)chatIdentifier
{
  return (NSString *)sub_1AD4C2054((uint64_t)self, (uint64_t)a2, (uint64_t (*)(_QWORD))type metadata accessor for RelayReachabilityContext, &OBJC_IVAR___BlastDoorRelayReachabilityContext_relayReachabilityContext);
}

- (int64_t)chatStyle
{
  return sub_1AD4C5D4C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorRelayReachabilityContext_relayReachabilityContext);
}

- (NSString)senderLastAddressedHandle
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t (*v6)(_QWORD);
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSString *result;
  uint64_t v11;

  v3 = type metadata accessor for RelayReachabilityContext();
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AD0D3D2C((uint64_t)self + OBJC_IVAR___BlastDoorRelayReachabilityContext_relayReachabilityContext, (uint64_t)v5, v6);
  v7 = *((_QWORD *)v5 + 8);
  if (v7 == 1)
  {
    result = (NSString *)sub_1AD63BE28();
    __break(1u);
  }
  else
  {
    v8 = *((_QWORD *)v5 + 7);
    swift_bridgeObjectRetain();
    sub_1AD066230((uint64_t)v5, (uint64_t (*)(_QWORD))type metadata accessor for RelayReachabilityContext);
    if (v7)
    {
      v9 = (void *)sub_1AD63B744();
      sub_1AD003F24(v8, v7);
    }
    else
    {
      v9 = 0;
    }
    return (NSString *)v9;
  }
  return result;
}

- (NSUUID)senderLastAddressedSIMID
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v12;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED2E7140);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (char *)self + OBJC_IVAR___BlastDoorRelayReachabilityContext_relayReachabilityContext;
  v7 = type metadata accessor for RelayReachabilityContext();
  sub_1ACFF64C0((uint64_t)&v6[*(int *)(v7 + 28)], (uint64_t)v5, &qword_1ED2E7140);
  v8 = sub_1AD63B084();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v5, 1, v8) != 1)
  {
    v10 = (void *)sub_1AD63B060();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v5, v8);
  }
  return (NSUUID *)v10;
}

- (NSString)lastUsedServiceName
{
  return (NSString *)sub_1AD4C2594((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorRelayReachabilityContext_relayReachabilityContext, (uint64_t (*)(_QWORD))type metadata accessor for RelayReachabilityContext);
}

- (NSString)serviceOfLastMessage
{
  char *v2;
  void *v3;

  v2 = (char *)self + OBJC_IVAR___BlastDoorRelayReachabilityContext_relayReachabilityContext;
  if (*(_QWORD *)&v2[*(int *)(type metadata accessor for RelayReachabilityContext() + 36) + 8])
  {
    swift_bridgeObjectRetain();
    v3 = (void *)sub_1AD63B744();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (BOOL)conversationWasDowngraded
{
  return sub_1AD4C271C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorRelayReachabilityContext_relayReachabilityContext, (uint64_t (*)(_QWORD))type metadata accessor for RelayReachabilityContext);
}

- (BOOL)hasConversationHistory
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorRelayReachabilityContext_relayReachabilityContext;
  return v2[*(int *)(type metadata accessor for RelayReachabilityContext() + 44)];
}

- (BOOL)shouldForceServerStatusRefresh
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorRelayReachabilityContext_relayReachabilityContext;
  return v2[*(int *)(type metadata accessor for RelayReachabilityContext() + 48)];
}

- (BOOL)forceMMS
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorRelayReachabilityContext_relayReachabilityContext;
  return v2[*(int *)(type metadata accessor for RelayReachabilityContext() + 52)];
}

- (BOOL)isForPendingConversation
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR___BlastDoorRelayReachabilityContext_relayReachabilityContext;
  return v2[*(int *)(type metadata accessor for RelayReachabilityContext() + 56)];
}

- (BlastDoorRelayReachabilityContext)init
{
  BlastDoorRelayReachabilityContext *result;

  result = (BlastDoorRelayReachabilityContext *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD066230((uint64_t)self + OBJC_IVAR___BlastDoorRelayReachabilityContext_relayReachabilityContext, (uint64_t (*)(_QWORD))type metadata accessor for RelayReachabilityContext);
}

@end
