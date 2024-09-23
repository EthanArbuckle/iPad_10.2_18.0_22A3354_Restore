@implementation BlastDoorRelayGroupParticipantMutationEnvelope

- (NSString)description
{
  return (NSString *)sub_1AD4C1C68();
}

- (int64_t)type
{
  return *((unsigned __int8 *)&self->super.isa
         + OBJC_IVAR___BlastDoorRelayGroupParticipantMutationEnvelope_relayGroupParticipantMutationEnvelope);
}

- (NSArray)changedParticipants
{
  return (NSArray *)sub_1AD4C9C78(self, (uint64_t)a2, (void (*)(void))sub_1AD4C1D00, (void (*)(void))type metadata accessor for _ObjCRelayGroupParticipantMutationWrapper);
}

- (BlastDoorRelayGroupParticipantMutationEnvelope)init
{
  BlastDoorRelayGroupParticipantMutationEnvelope *result;

  result = (BlastDoorRelayGroupParticipantMutationEnvelope *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
