@implementation WFSetOrientationLockAction

- (NSArray)disabledOnPlatforms
{
  WFSetOrientationLockAction *v2;
  void *v3;

  v2 = self;
  sub_22D3AC48C();

  type metadata accessor for WFExecutionPlatform(0);
  v3 = (void *)sub_22D66668C();
  swift_bridgeObjectRelease();
  return (NSArray *)v3;
}

- (WFSetOrientationLockAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5 schema:(id)a6 intent:(id)a7 resolvedIntentDescriptor:(id)a8 stringLocalizer:(id)a9
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;

  v14 = sub_22D6665A8();
  v16 = v15;
  if (a5)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255D80020);
    a5 = (id)sub_22D6664B8();
  }
  v17 = a8;
  v18 = a9;
  v19 = a7;
  v20 = a6;
  v21 = a4;
  return (WFSetOrientationLockAction *)sub_22D3AC598(v14, v16, a4, (uint64_t)a5, a6, a7, v17, a9);
}

@end
