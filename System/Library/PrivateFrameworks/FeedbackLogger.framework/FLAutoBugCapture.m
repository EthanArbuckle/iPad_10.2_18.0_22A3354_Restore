@implementation FLAutoBugCapture

- (FLAutoBugCapture)init
{
  return (FLAutoBugCapture *)sub_1B5130DAC();
}

- (void)triggerABCWithSubtype:(id)a3 bundleID:(id)a4 eventName:(id)a5 eventValue:(id)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  FLAutoBugCapture *v17;
  id v18;
  unint64_t v19;
  unint64_t v20;

  v9 = sub_1B514BF00();
  v11 = v10;
  v12 = sub_1B514BF00();
  v14 = v13;
  if (a5)
  {
    v15 = sub_1B514BF00();
    a5 = v16;
  }
  else
  {
    v15 = 0;
  }
  v17 = self;
  if (a6)
  {
    v18 = a6;
    a6 = (id)sub_1B514BC9C();
    v20 = v19;

  }
  else
  {
    v20 = 0xF000000000000000;
  }
  sub_1B5130FD4(v9, v11, v12, v14, v15, (uint64_t)a5, (uint64_t)a6, v20);
  sub_1B5133028((uint64_t)a6, v20);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{

}

@end
