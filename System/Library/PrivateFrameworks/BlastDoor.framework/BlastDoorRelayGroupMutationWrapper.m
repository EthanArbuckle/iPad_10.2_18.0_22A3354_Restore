@implementation BlastDoorRelayGroupMutationWrapper

- (NSString)description
{
  return (NSString *)sub_1AD4D7F48((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___BlastDoorRelayGroupMutationWrapper_relayGroupMutation, (void (*)(void))sub_1AD28BEFC);
}

- (unint64_t)type
{
  return self->relayGroupMutation[OBJC_IVAR___BlastDoorRelayGroupMutationWrapper_relayGroupMutation + 24];
}

- (BlastDoorRelayGroupDisplayNameMutationEnvelope)displayName
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_class *v8;
  char *v9;
  uint64_t *v10;
  objc_super v11;

  v2 = (uint64_t *)((char *)self + OBJC_IVAR___BlastDoorRelayGroupMutationWrapper_relayGroupMutation);
  if (self->relayGroupMutation[OBJC_IVAR___BlastDoorRelayGroupMutationWrapper_relayGroupMutation + 24])
    return (BlastDoorRelayGroupDisplayNameMutationEnvelope *)0;
  v5 = v2[2];
  v4 = v2[3];
  v7 = *v2;
  v6 = v2[1];
  v8 = (objc_class *)type metadata accessor for _ObjCRelayGroupDisplayNameMutationEnvelopeWrapper();
  v9 = (char *)objc_allocWithZone(v8);
  v10 = (uint64_t *)&v9[OBJC_IVAR___BlastDoorRelayGroupDisplayNameMutationEnvelope_relayGroupDisplayNameMutationEnvelope];
  *v10 = v7;
  v10[1] = v6;
  v10[2] = v5;
  v10[3] = v4;
  sub_1AD29BCAC(v7);
  v11.receiver = v9;
  v11.super_class = v8;
  return (BlastDoorRelayGroupDisplayNameMutationEnvelope *)-[BlastDoorRelayGroupMutationWrapper init](&v11, sel_init);
}

- (BlastDoorRelayGroupParticipantMutationEnvelope)participant
{
  char *v2;
  uint64_t v3;
  char v4;
  objc_class *v5;
  char *v6;
  char *v7;
  BlastDoorRelayGroupMutationWrapper *v8;
  objc_super v10;

  v2 = (char *)self + OBJC_IVAR___BlastDoorRelayGroupMutationWrapper_relayGroupMutation;
  if (self->relayGroupMutation[OBJC_IVAR___BlastDoorRelayGroupMutationWrapper_relayGroupMutation + 24] == 1)
  {
    v3 = *((_QWORD *)v2 + 1);
    v4 = *v2;
    v5 = (objc_class *)type metadata accessor for _ObjCRelayGroupParticipantMutationEnvelopeWrapper();
    v6 = (char *)objc_allocWithZone(v5);
    v7 = &v6[OBJC_IVAR___BlastDoorRelayGroupParticipantMutationEnvelope_relayGroupParticipantMutationEnvelope];
    *v7 = v4 & 1;
    *((_QWORD *)v7 + 1) = v3;
    v10.receiver = v6;
    v10.super_class = v5;
    swift_bridgeObjectRetain();
    v8 = -[BlastDoorRelayGroupMutationWrapper init](&v10, sel_init);
  }
  else
  {
    v8 = 0;
  }
  return (BlastDoorRelayGroupParticipantMutationEnvelope *)v8;
}

- (BlastDoorRelayGroupMutationWrapper)init
{
  BlastDoorRelayGroupMutationWrapper *result;

  result = (BlastDoorRelayGroupMutationWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD4D83D0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BlastDoorRelayGroupMutationWrapper_relayGroupMutation, (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1AD28BF28);
}

@end
