@implementation WFSetHotspotPasswordAction

- (void)runWithInput:(WFContentCollection *)a3 completionHandler:(id)a4
{
  void *v6;
  _QWORD *v7;
  WFContentCollection *v8;
  WFSetHotspotPasswordAction *v9;

  v6 = _Block_copy(a4);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  v9 = self;
  sub_22D3DC654((uint64_t)&unk_255D80C58, (uint64_t)v7);
}

- (id)localizedDescriptionNoteWithContext:(id)a3
{
  id v4;
  WFSetHotspotPasswordAction *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  v5 = self;
  sub_22D398C80(v4);
  v7 = v6;

  if (v7)
  {
    v8 = (void *)sub_22D666578();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)contentDestinationWithError:(id *)a3
{
  WFSetHotspotPasswordAction *v3;
  id v4;

  v3 = self;
  v4 = sub_22D398F58();

  return v4;
}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  WFSetHotspotPasswordAction *v15;
  void *v16;

  if (a3)
  {
    v6 = sub_22D6665A8();
    v8 = v7;
  }
  else
  {
    v6 = 0;
    v8 = 0;
  }
  v9 = sub_22D6665A8();
  v11 = v10;
  v12 = sub_22D6665A8();
  v14 = v13;
  v15 = self;
  sub_22D399020(v6, v8, v9, v11, v12, v14);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v16 = (void *)sub_22D666578();
  swift_bridgeObjectRelease();
  return v16;
}

- (WFSetHotspotPasswordAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v7 = sub_22D6665A8();
  v9 = v8;
  if (a5)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255D80020);
    a5 = (id)sub_22D6664B8();
  }
  v10 = a4;
  return (WFSetHotspotPasswordAction *)sub_22D399268(v7, v9, a4, (uint64_t)a5);
}

- (WFSetHotspotPasswordAction)init
{
  return (WFSetHotspotPasswordAction *)sub_22D3993CC();
}

@end
