@implementation FAPrivacyDisclosureAcknowledgmentHook

- (RUIServerHookDelegate)delegate
{
  swift_beginAccess();
  return (RUIServerHookDelegate *)(id)swift_unknownObjectRetain();
}

- (void)setDelegate:(id)a3
{
  id *v4;

  v4 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC14FamilyCircleUI37FAPrivacyDisclosureAcknowledgmentHook_delegate);
  swift_beginAccess();
  *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (BOOL)shouldMatchElement:(id)a3
{
  _TtC14FamilyCircleUI37FAPrivacyDisclosureAcknowledgmentHook *v4;
  _TtC14FamilyCircleUI37FAPrivacyDisclosureAcknowledgmentHook *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;

  v4 = (_TtC14FamilyCircleUI37FAPrivacyDisclosureAcknowledgmentHook *)a3;
  v5 = self;
  v6 = -[FAPrivacyDisclosureAcknowledgmentHook name](v4, sel_name);
  if (v6)
  {
    v7 = v6;
    v8 = sub_20E07D5D4();
    v10 = v9;

    if (v8 == 0xD00000000000001FLL && v10 == 0x800000020E0A62A0)
    {

      swift_bridgeObjectRelease();
      v11 = 1;
    }
    else
    {
      v11 = sub_20E07E018();

      swift_bridgeObjectRelease();
    }
  }
  else
  {

    v11 = 0;
    v4 = v5;
  }

  return v11 & 1;
}

- (BOOL)shouldMatchModel:(id)a3
{
  id v4;
  _TtC14FamilyCircleUI37FAPrivacyDisclosureAcknowledgmentHook *v5;
  char v6;

  v4 = a3;
  v5 = self;
  v6 = sub_20E031914(v4);

  return v6 & 1;
}

- (void)processElement:(RUIElement *)a3 attributes:(NSDictionary *)a4 objectModel:(RUIObjectModel *)a5 completion:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  RUIElement *v19;
  NSDictionary *v20;
  RUIObjectModel *v21;
  _TtC14FamilyCircleUI37FAPrivacyDisclosureAcknowledgmentHook *v22;
  uint64_t v23;

  v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253D2DF60);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  v16 = sub_20E07D85C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_254A02F10;
  v17[5] = v15;
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_254A02F18;
  v18[5] = v17;
  v19 = a3;
  v20 = a4;
  v21 = a5;
  v22 = self;
  sub_20E032A2C((uint64_t)v13, (uint64_t)&unk_254A02F20, (uint64_t)v18);
  swift_release();
}

- (void)processObjectModel:(RUIObjectModel *)a3 completion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  RUIObjectModel *v15;
  _TtC14FamilyCircleUI37FAPrivacyDisclosureAcknowledgmentHook *v16;
  uint64_t v17;

  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253D2DF60);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = sub_20E07D85C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_254A02F00;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2549F6A10;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_20E032A2C((uint64_t)v9, (uint64_t)&unk_2549F7C60, (uint64_t)v14);
  swift_release();
}

- (_TtC14FamilyCircleUI37FAPrivacyDisclosureAcknowledgmentHook)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14FamilyCircleUI37FAPrivacyDisclosureAcknowledgmentHook_delegate) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FAPrivacyDisclosureAcknowledgmentHook();
  return -[FAPrivacyDisclosureAcknowledgmentHook init](&v3, sel_init);
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

@end
