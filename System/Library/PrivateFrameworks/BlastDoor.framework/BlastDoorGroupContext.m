@implementation BlastDoorGroupContext

- (NSString)description
{
  uint64_t v2;
  void *v3;
  __int128 v5;

  v2 = *(_QWORD *)&self->groupContext[OBJC_IVAR___BlastDoorGroupContext_groupContext + 32];
  v5 = *(_OWORD *)&self->groupContext[OBJC_IVAR___BlastDoorGroupContext_groupContext + 40];
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  sub_1AD003E48(v2, v5);
  swift_bridgeObjectRetain();
  sub_1AD63B798();
  v3 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSArray)participantDestinationIdentifiers
{
  return (NSArray *)sub_1AD4CD8FC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorGroupContext_groupContext);
}

- (NSString)groupID
{
  return (NSString *)sub_1AD4D34F8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorGroupContext_groupContext);
}

- (NSString)currentGroupName
{
  return (NSString *)sub_1AD4D3644((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorGroupContext_groupContext);
}

- (BOOL)has_groupParticipantVersion
{
  return (self->groupContext[OBJC_IVAR___BlastDoorGroupContext_groupContext + 72] & 1) == 0;
}

- (unint64_t)groupParticipantVersion
{
  if (self->groupContext[OBJC_IVAR___BlastDoorGroupContext_groupContext + 72])
    return 0;
  else
    return *(_QWORD *)&self->groupContext[OBJC_IVAR___BlastDoorGroupContext_groupContext + 64];
}

- (BOOL)has_groupProtocolVersion
{
  return (self->groupContext[OBJC_IVAR___BlastDoorGroupContext_groupContext + 88] & 1) == 0;
}

- (unint64_t)groupProtocolVersion
{
  if (self->groupContext[OBJC_IVAR___BlastDoorGroupContext_groupContext + 88])
    return 0;
  else
    return *(_QWORD *)&self->groupContext[OBJC_IVAR___BlastDoorGroupContext_groupContext + 80];
}

- (BlastDoorGroupContext)init
{
  BlastDoorGroupContext *result;

  result = (BlastDoorGroupContext *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)&self->groupContext[OBJC_IVAR___BlastDoorGroupContext_groupContext + 32];
  v3 = *(_QWORD *)&self->groupContext[OBJC_IVAR___BlastDoorGroupContext_groupContext + 40];
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  sub_1AD003F24(v2, v3);
  swift_bridgeObjectRelease();
}

@end
