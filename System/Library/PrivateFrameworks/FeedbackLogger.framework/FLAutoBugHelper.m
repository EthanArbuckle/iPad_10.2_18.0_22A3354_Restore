@implementation FLAutoBugHelper

- (FLAutoBugHelper)initWithAutoBugCapture:(id)a3 bundleID:(id)a4 eventValue:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  unint64_t v12;
  unint64_t v13;

  v7 = sub_1B514BF00();
  v9 = v8;
  v10 = a3;
  if (a5)
  {
    v11 = a5;
    a5 = (id)sub_1B514BC9C();
    v13 = v12;

  }
  else
  {
    v13 = 0xF000000000000000;
  }
  return (FLAutoBugHelper *)sub_1B5132B84(a3, v7, v9, (uint64_t)a5, v13);
}

- (void)triggerABCWithSubtype:(id)a3
{
  FLAutoBugHelper *v4;

  sub_1B514BF00();
  v4 = self;
  sub_1B5132CE0();

  swift_bridgeObjectRelease();
}

- (void)triggerABCWithSubtype:(id)a3 additionalEventName:(id)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  FLAutoBugHelper *v8;

  v5 = sub_1B514BF00();
  v7 = v6;
  sub_1B514BF00();
  v8 = self;
  sub_1B5132DDC(v5, v7);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (FLAutoBugHelper)init
{
  FLAutoBugHelper.init()();
}

- (void).cxx_destruct
{

  sub_1B5133028(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___FLAutoBugHelper_eventValue), *(_QWORD *)&self->autoBugCapture[OBJC_IVAR___FLAutoBugHelper_eventValue]);
  swift_bridgeObjectRelease();
}

@end
