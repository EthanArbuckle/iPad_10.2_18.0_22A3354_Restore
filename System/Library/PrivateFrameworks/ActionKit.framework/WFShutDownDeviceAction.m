@implementation WFShutDownDeviceAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  WFShutDownDeviceAction *v5;

  v4 = a3;
  v5 = self;
  sub_22D3C4BB0();

}

- (NSString)iconSymbolName
{
  WFShutDownDeviceAction *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  sub_22D3C5424();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_22D666578();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (BOOL)setParameterState:(id)a3 forKey:(id)a4
{
  WFShutDownDeviceAction *v6;
  unsigned __int8 v7;

  sub_22D6665A8();
  swift_unknownObjectRetain();
  v6 = self;
  v7 = sub_22D3C5664((uint64_t)a3);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  return v7 & 1;
}

- (WFShutDownDeviceAction)initWithIdentifier:(id)a3 definition:(id)a4 serializedParameters:(id)a5
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
  return (WFShutDownDeviceAction *)sub_22D3C5754(v7, v9, a4, (uint64_t)a5);
}

- (WFShutDownDeviceAction)init
{
  return (WFShutDownDeviceAction *)sub_22D3C5910();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
