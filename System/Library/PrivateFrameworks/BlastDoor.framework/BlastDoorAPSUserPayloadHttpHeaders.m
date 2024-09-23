@implementation BlastDoorAPSUserPayloadHttpHeaders

- (NSString)description
{
  void *v2;

  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1AD63B798();
  v2 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (NSString)adhocServiceOverride
{
  return (NSString *)sub_1AD4D4828((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorAPSUserPayloadHttpHeaders_aPSUserPayloadHttpHeaders);
}

- (NSString)responseIdentifierString
{
  return (NSString *)sub_1AD4D4898((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorAPSUserPayloadHttpHeaders_aPSUserPayloadHttpHeaders);
}

- (NSString)strictTransportSecurity
{
  return (NSString *)sub_1AD4CFC9C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorAPSUserPayloadHttpHeaders_aPSUserPayloadHttpHeaders);
}

- (NSString)traceId
{
  return (NSString *)sub_1AD4CFD0C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorAPSUserPayloadHttpHeaders_aPSUserPayloadHttpHeaders);
}

- (NSString)splunkHint
{
  return (NSString *)sub_1AD4BB0E0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorAPSUserPayloadHttpHeaders_aPSUserPayloadHttpHeaders);
}

- (NSString)asHttpHeader
{
  void *v2;

  if (*(_QWORD *)&self->aPSUserPayloadHttpHeaders[OBJC_IVAR___BlastDoorAPSUserPayloadHttpHeaders_aPSUserPayloadHttpHeaders
                                                 + 80])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1AD63B744();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (BlastDoorAPSUserPayloadHttpHeaders)init
{
  BlastDoorAPSUserPayloadHttpHeaders *result;

  result = (BlastDoorAPSUserPayloadHttpHeaders *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
