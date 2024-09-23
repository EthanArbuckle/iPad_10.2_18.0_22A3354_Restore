@implementation WFLockScreenAction

- (void)runWithInput:(WFContentCollection *)a3 completionHandler:(id)a4
{
  void *v6;
  _QWORD *v7;
  WFContentCollection *v8;
  WFLockScreenAction *v9;

  v6 = _Block_copy(a4);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  v9 = self;
  sub_22D3DC654((uint64_t)&unk_255D80348, (uint64_t)v7);
}

- (NSArray)disabledOnPlatforms
{
  WFLockScreenAction *v2;
  void *v3;

  v2 = self;
  sub_22D36D540();

  type metadata accessor for WFExecutionPlatform(0);
  v3 = (void *)sub_22D66668C();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (WFLockScreenAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5
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
  return (WFLockScreenAction *)sub_22D36D64C(v7, v9, a4, (uint64_t)a5);
}

- (WFLockScreenAction)init
{
  return (WFLockScreenAction *)sub_22D36D7B0();
}

@end
