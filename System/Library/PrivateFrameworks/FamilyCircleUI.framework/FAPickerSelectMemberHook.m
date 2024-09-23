@implementation FAPickerSelectMemberHook

- (RUIServerHookDelegate)delegate
{
  swift_beginAccess();
  return (RUIServerHookDelegate *)(id)swift_unknownObjectRetain();
}

- (void)setDelegate:(id)a3
{
  id *v4;

  v4 = (id *)((char *)&self->super.isa + OBJC_IVAR___FAPickerSelectMemberHook_delegate);
  swift_beginAccess();
  *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (id)activateAction
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  _QWORD aBlock[6];

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___FAPickerSelectMemberHook_activateAction);
  swift_beginAccess();
  if (!*v2)
    return 0;
  v3 = v2[1];
  aBlock[4] = *v2;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_20DE913E0;
  aBlock[3] = &block_descriptor_17;
  v4 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  return v4;
}

- (void)setActivateAction:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_20DF1D954;
  }
  else
  {
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___FAPickerSelectMemberHook_activateAction);
  swift_beginAccess();
  v7 = *v6;
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_20DEDDAB4(v7);
}

- (BOOL)shouldMatchElement:(id)a3
{
  FAPickerSelectMemberHook *v4;
  FAPickerSelectMemberHook *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;

  v4 = (FAPickerSelectMemberHook *)a3;
  v5 = self;
  v6 = -[FAPickerSelectMemberHook name](v4, sel_name);
  if (v6)
  {
    v7 = v6;
    v8 = sub_20E07D5D4();
    v10 = v9;

    if (v8 == 0xD000000000000014 && v10 == 0x800000020E09F5B0)
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
  FAPickerSelectMemberHook *v5;
  char v6;

  v4 = a3;
  v5 = self;
  v6 = sub_20DF1C040(v4);

  return v6 & 1;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
  void (**v9)(void *, uint64_t, _QWORD);
  id v10;
  id v11;
  FAPickerSelectMemberHook *v12;
  void (**v13)(id);
  void (*v14)(id);

  v9 = (void (**)(void *, uint64_t, _QWORD))_Block_copy(a6);
  v10 = a3;
  v11 = a5;
  v12 = self;
  sub_20DF1C75C(v11);
  v13 = (void (**)(id))((char *)v12 + OBJC_IVAR___FAPickerSelectMemberHook_activateAction);
  swift_beginAccess();
  v14 = *v13;
  if (*v13)
  {
    swift_retain();
    v14(v11);
    sub_20DEDDAB4((uint64_t)v14);
  }
  v9[2](v9, 1, 0);
  _Block_release(v9);

}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  void (**v6)(void *, uint64_t, _QWORD);
  id v7;
  FAPickerSelectMemberHook *v8;

  v6 = (void (**)(void *, uint64_t, _QWORD))_Block_copy(a4);
  v7 = a3;
  v8 = self;
  sub_20DF1C75C(v7);
  v6[2](v6, 1, 0);
  _Block_release(v6);

}

- (FAPickerSelectMemberHook)init
{
  _QWORD *v3;
  objc_class *v4;
  objc_super v6;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___FAPickerSelectMemberHook_delegate) = 0;
  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR___FAPickerSelectMemberHook_activateAction);
  v4 = (objc_class *)type metadata accessor for FAPickerSelectMemberHook();
  *v3 = 0;
  v3[1] = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return -[FAPickerSelectMemberHook init](&v6, sel_init);
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  sub_20DEDDAB4(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___FAPickerSelectMemberHook_activateAction));
}

@end
