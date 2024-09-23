@implementation HMDActionSetResponse

- (NSUUID)actionSetUUID
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  NSUUID *result;
  void *v8;
  __int128 v9;
  uint64_t v10;
  __int128 v11;

  v3 = sub_222596678();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = (NSUUID *)sub_22192DC94((uint64_t)self + OBJC_IVAR___HMDActionSetResponse_internalActionSetUUID, (uint64_t)&v9);
  if (v10)
  {
    sub_221903284(&v9, &v11);
    swift_dynamicCast();
    v8 = (void *)sub_222596630();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    return (NSUUID *)v8;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (BOOL)state
{
  return *((_BYTE *)&self->super.super.isa + OBJC_IVAR___HMDActionSetResponse_state);
}

- (HMDActionSetResponse)initWithActionSetUUID:(id)a3 state:(BOOL)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t *v10;
  uint64_t *boxed_opaque_existential_1;
  HMDActionSetResponse *v12;
  objc_super v14;

  v6 = sub_222596678();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_222596648();
  v10 = (uint64_t *)((char *)self + OBJC_IVAR___HMDActionSetResponse_internalActionSetUUID);
  v10[3] = v6;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v10);
  (*(void (**)(uint64_t *, char *, uint64_t))(v7 + 16))(boxed_opaque_existential_1, v9, v6);
  *((_BYTE *)&self->super.super.isa + OBJC_IVAR___HMDActionSetResponse_state) = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMDActionSetResponse;
  v12 = -[HMDActionSetResponse init](&v14, sel_init);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

+ (id)responsesFromSerializedResponses:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  sub_221917374(0, (unint64_t *)&unk_25573F0D0);
  v3 = sub_222596C6C();
  sub_22192DCDC(v3);
  v4 = swift_bridgeObjectRelease();
  type metadata accessor for HMDActionSetResponse(v4);
  v5 = (void *)sub_222596E28();
  swift_bridgeObjectRelease();
  return v5;
}

+ (id)serializeWithResponses:(id)a3
{
  unint64_t v3;
  void *v4;

  type metadata accessor for HMDActionSetResponse((uint64_t)a1);
  v3 = sub_222596E40();
  sub_22192E00C(v3);
  swift_bridgeObjectRelease();
  sub_221917374(0, (unint64_t *)&unk_25573F0D0);
  v4 = (void *)sub_222596C54();
  swift_bridgeObjectRelease();
  return v4;
}

- (id)serialize
{
  HMDActionSetResponse *v2;
  void *v3;

  v2 = self;
  sub_22192DA50();

  sub_221917374(0, (unint64_t *)&unk_25573F0D0);
  v3 = (void *)sub_222596C54();
  swift_bridgeObjectRelease();
  return v3;
}

- (HMDActionSetResponse)init
{
  HMDActionSetResponse *result;

  result = (HMDActionSetResponse *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_221917338((uint64_t)self + OBJC_IVAR___HMDActionSetResponse_internalActionSetUUID, &qword_2557410E0);
}

@end
