@implementation BlastDoorAPSQuickRelayPluginRequest

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

- (NSString)pluginName
{
  return (NSString *)sub_1AD4D4828((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorAPSQuickRelayPluginRequest_aPSQuickRelayPluginRequest);
}

- (NSString)pluginConfig
{
  return (NSString *)sub_1AD4D4898((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorAPSQuickRelayPluginRequest_aPSQuickRelayPluginRequest);
}

- (BOOL)has_pluginStream
{
  return (self->aPSQuickRelayPluginRequest[OBJC_IVAR___BlastDoorAPSQuickRelayPluginRequest_aPSQuickRelayPluginRequest
                                         + 32] & 1) == 0;
}

- (int64_t)pluginStream
{
  if (self->aPSQuickRelayPluginRequest[OBJC_IVAR___BlastDoorAPSQuickRelayPluginRequest_aPSQuickRelayPluginRequest + 32])
    return 0;
  else
    return *(_QWORD *)&self->aPSQuickRelayPluginRequest[OBJC_IVAR___BlastDoorAPSQuickRelayPluginRequest_aPSQuickRelayPluginRequest
                                                      + 24];
}

- (BOOL)has_pluginDevMode
{
  return self->aPSQuickRelayPluginRequest[OBJC_IVAR___BlastDoorAPSQuickRelayPluginRequest_aPSQuickRelayPluginRequest
                                        + 33] != 2;
}

- (BOOL)pluginDevMode
{
  return self->aPSQuickRelayPluginRequest[OBJC_IVAR___BlastDoorAPSQuickRelayPluginRequest_aPSQuickRelayPluginRequest
                                        + 33] & 1;
}

- (BlastDoorAPSQuickRelayPluginRequest)init
{
  BlastDoorAPSQuickRelayPluginRequest *result;

  result = (BlastDoorAPSQuickRelayPluginRequest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD4D496C();
}

@end
