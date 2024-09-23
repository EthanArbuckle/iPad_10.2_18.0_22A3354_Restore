@implementation BlastDoorRelayGroupDisplayNameMutationEnvelope

- (NSString)description
{
  void *v2;

  sub_1AD29BCAC(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR___BlastDoorRelayGroupDisplayNameMutationEnvelope_relayGroupDisplayNameMutationEnvelope));
  sub_1AD63B798();
  v2 = (void *)sub_1AD63B744();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (BlastDoorGroupDisplayName)updatedName
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  objc_class *v7;
  char *v8;
  uint64_t *v9;
  BlastDoorRelayGroupDisplayNameMutationEnvelope *v10;
  objc_super v12;

  v2 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR___BlastDoorRelayGroupDisplayNameMutationEnvelope_relayGroupDisplayNameMutationEnvelope);
  v3 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR___BlastDoorRelayGroupDisplayNameMutationEnvelope_relayGroupDisplayNameMutationEnvelope);
  if (v3)
  {
    v5 = v2[2];
    v4 = v2[3];
    v6 = v2[1];
    v7 = (objc_class *)type metadata accessor for _ObjCGroupDisplayNameWrapper();
    v8 = (char *)objc_allocWithZone(v7);
    v9 = (uint64_t *)&v8[OBJC_IVAR___BlastDoorGroupDisplayName_groupDisplayName];
    *v9 = v3;
    v9[1] = v6;
    v9[2] = v5;
    v9[3] = v4;
    sub_1AD29BCAC(v3);
    v12.receiver = v8;
    v12.super_class = v7;
    v10 = -[BlastDoorRelayGroupDisplayNameMutationEnvelope init](&v12, sel_init);
  }
  else
  {
    v10 = 0;
  }
  return (BlastDoorGroupDisplayName *)v10;
}

- (BlastDoorRelayGroupDisplayNameMutationEnvelope)init
{
  BlastDoorRelayGroupDisplayNameMutationEnvelope *result;

  result = (BlastDoorRelayGroupDisplayNameMutationEnvelope *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD29A470(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR___BlastDoorRelayGroupDisplayNameMutationEnvelope_relayGroupDisplayNameMutationEnvelope));
}

@end
