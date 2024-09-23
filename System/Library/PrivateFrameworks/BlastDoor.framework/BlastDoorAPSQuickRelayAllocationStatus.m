@implementation BlastDoorAPSQuickRelayAllocationStatus

- (NSString)description
{
  void *v2;

  sub_1AD00408C(*(_QWORD *)&self->aPSQuickRelayAllocationStatus[OBJC_IVAR___BlastDoorAPSQuickRelayAllocationStatus_aPSQuickRelayAllocationStatus+ 24], *(_QWORD *)&self->aPSQuickRelayAllocationStatus[OBJC_IVAR___BlastDoorAPSQuickRelayAllocationStatus_aPSQuickRelayAllocationStatus+ 32]);
  swift_bridgeObjectRetain();
  sub_1AD63B798();
  v2 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (BOOL)has_participantId
{
  return (self->aPSQuickRelayAllocationStatus[OBJC_IVAR___BlastDoorAPSQuickRelayAllocationStatus_aPSQuickRelayAllocationStatus] & 1) == 0;
}

- (unint64_t)participantId
{
  if (self->aPSQuickRelayAllocationStatus[OBJC_IVAR___BlastDoorAPSQuickRelayAllocationStatus_aPSQuickRelayAllocationStatus])
    return 0;
  else
    return *(unint64_t *)((char *)&self->super.isa
                               + OBJC_IVAR___BlastDoorAPSQuickRelayAllocationStatus_aPSQuickRelayAllocationStatus);
}

- (BOOL)has_allocationStatus
{
  return (self->aPSQuickRelayAllocationStatus[OBJC_IVAR___BlastDoorAPSQuickRelayAllocationStatus_aPSQuickRelayAllocationStatus
                                            + 16] & 1) == 0;
}

- (int64_t)allocationStatus
{
  if (self->aPSQuickRelayAllocationStatus[OBJC_IVAR___BlastDoorAPSQuickRelayAllocationStatus_aPSQuickRelayAllocationStatus
                                         + 16])
    return 0;
  else
    return *(_QWORD *)&self->aPSQuickRelayAllocationStatus[OBJC_IVAR___BlastDoorAPSQuickRelayAllocationStatus_aPSQuickRelayAllocationStatus
                                                         + 8];
}

- (NSData)token
{
  unint64_t v2;
  void *v3;
  uint64_t v4;

  v2 = *(_QWORD *)&self->aPSQuickRelayAllocationStatus[OBJC_IVAR___BlastDoorAPSQuickRelayAllocationStatus_aPSQuickRelayAllocationStatus
                                                     + 32];
  if (v2 >> 60 == 15)
  {
    v3 = 0;
  }
  else
  {
    v4 = *(_QWORD *)&self->aPSQuickRelayAllocationStatus[OBJC_IVAR___BlastDoorAPSQuickRelayAllocationStatus_aPSQuickRelayAllocationStatus
                                                       + 24];
    sub_1AD0040A0(v4, v2);
    v3 = (void *)sub_1AD63AFA0();
    sub_1AD004118(v4, v2);
  }
  return (NSData *)v3;
}

- (NSString)destinationId
{
  return (NSString *)sub_1AD4CFD0C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorAPSQuickRelayAllocationStatus_aPSQuickRelayAllocationStatus);
}

- (BlastDoorAPSQuickRelayAllocationStatus)init
{
  BlastDoorAPSQuickRelayAllocationStatus *result;

  result = (BlastDoorAPSQuickRelayAllocationStatus *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD004118(*(_QWORD *)&self->aPSQuickRelayAllocationStatus[OBJC_IVAR___BlastDoorAPSQuickRelayAllocationStatus_aPSQuickRelayAllocationStatus+ 24], *(_QWORD *)&self->aPSQuickRelayAllocationStatus[OBJC_IVAR___BlastDoorAPSQuickRelayAllocationStatus_aPSQuickRelayAllocationStatus+ 32]);
  swift_bridgeObjectRelease();
}

@end
