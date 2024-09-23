@implementation BlastDoorAPSQuickRelayPluginAllocation

- (NSString)description
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;

  v2 = *(_QWORD *)&self->aPSQuickRelayPluginAllocation[OBJC_IVAR___BlastDoorAPSQuickRelayPluginAllocation_aPSQuickRelayPluginAllocation
                                                     + 40];
  v3 = *(_QWORD *)&self->aPSQuickRelayPluginAllocation[OBJC_IVAR___BlastDoorAPSQuickRelayPluginAllocation_aPSQuickRelayPluginAllocation
                                                     + 48];
  v4 = *(_QWORD *)&self->aPSQuickRelayPluginAllocation[OBJC_IVAR___BlastDoorAPSQuickRelayPluginAllocation_aPSQuickRelayPluginAllocation
                                                     + 56];
  v5 = *(_QWORD *)&self->aPSQuickRelayPluginAllocation[OBJC_IVAR___BlastDoorAPSQuickRelayPluginAllocation_aPSQuickRelayPluginAllocation
                                                     + 64];
  swift_bridgeObjectRetain();
  sub_1AD00408C(v2, v3);
  sub_1AD00408C(v4, v5);
  sub_1AD63B798();
  v6 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (NSString)pluginName
{
  return (NSString *)sub_1AD4D4828((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorAPSQuickRelayPluginAllocation_aPSQuickRelayPluginAllocation);
}

- (BOOL)has_pluginStream
{
  return (self->aPSQuickRelayPluginAllocation[OBJC_IVAR___BlastDoorAPSQuickRelayPluginAllocation_aPSQuickRelayPluginAllocation
                                            + 16] & 1) == 0;
}

- (int64_t)pluginStream
{
  if (self->aPSQuickRelayPluginAllocation[OBJC_IVAR___BlastDoorAPSQuickRelayPluginAllocation_aPSQuickRelayPluginAllocation
                                         + 16])
    return 0;
  else
    return *(_QWORD *)&self->aPSQuickRelayPluginAllocation[OBJC_IVAR___BlastDoorAPSQuickRelayPluginAllocation_aPSQuickRelayPluginAllocation
                                                         + 8];
}

- (BOOL)has_participantId
{
  return (self->aPSQuickRelayPluginAllocation[OBJC_IVAR___BlastDoorAPSQuickRelayPluginAllocation_aPSQuickRelayPluginAllocation
                                            + 32] & 1) == 0;
}

- (unint64_t)participantId
{
  if (self->aPSQuickRelayPluginAllocation[OBJC_IVAR___BlastDoorAPSQuickRelayPluginAllocation_aPSQuickRelayPluginAllocation
                                         + 32])
    return 0;
  else
    return *(_QWORD *)&self->aPSQuickRelayPluginAllocation[OBJC_IVAR___BlastDoorAPSQuickRelayPluginAllocation_aPSQuickRelayPluginAllocation
                                                         + 24];
}

- (NSData)relaySessionKey
{
  return (NSData *)sub_1AD4A67FC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorAPSQuickRelayPluginAllocation_aPSQuickRelayPluginAllocation);
}

- (NSData)relayAccessToken
{
  return (NSData *)sub_1AD4A68BC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorAPSQuickRelayPluginAllocation_aPSQuickRelayPluginAllocation);
}

- (BlastDoorAPSQuickRelayPluginAllocation)init
{
  BlastDoorAPSQuickRelayPluginAllocation *result;

  result = (BlastDoorAPSQuickRelayPluginAllocation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v2 = *(_QWORD *)&self->aPSQuickRelayPluginAllocation[OBJC_IVAR___BlastDoorAPSQuickRelayPluginAllocation_aPSQuickRelayPluginAllocation
                                                     + 40];
  v3 = *(_QWORD *)&self->aPSQuickRelayPluginAllocation[OBJC_IVAR___BlastDoorAPSQuickRelayPluginAllocation_aPSQuickRelayPluginAllocation
                                                     + 48];
  v4 = *(_QWORD *)&self->aPSQuickRelayPluginAllocation[OBJC_IVAR___BlastDoorAPSQuickRelayPluginAllocation_aPSQuickRelayPluginAllocation
                                                     + 56];
  v5 = *(_QWORD *)&self->aPSQuickRelayPluginAllocation[OBJC_IVAR___BlastDoorAPSQuickRelayPluginAllocation_aPSQuickRelayPluginAllocation
                                                     + 64];
  swift_bridgeObjectRelease();
  sub_1AD004118(v2, v3);
  sub_1AD004118(v4, v5);
}

@end
