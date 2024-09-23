@implementation HKSleepApneaEventAxis

- (HKSleepApneaEventAxis)initWithDisplayType:(id)a3
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  HKSleepApneaEventAxis *v11;
  objc_super v13;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___HKSleepApneaEventAxis_displayType) = (Class)a3;
  v5 = objc_allocWithZone((Class)HKNumericAxisConfiguration);
  v6 = a3;
  v7 = objc_msgSend(v5, sel_init);
  v8 = (void *)objc_opt_self();
  v9 = v7;
  v10 = objc_msgSend(v8, sel_preferredAxisStyle);
  objc_msgSend(v9, sel_setPreferredStyle_, v10);

  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for SleepApneaEventAxis();
  v11 = -[HKNumericAxis initWithConfiguration:](&v13, sel_initWithConfiguration_, v9);

  return v11;
}

- (id)findAxisLabelsInModelRange:(id)a3 zoomScale:(double)a4
{
  id v5;
  HKSleepApneaEventAxis *v6;
  uint64_t v7;
  void *v8;

  v5 = a3;
  v6 = self;
  v7 = sub_1D7AEB368(v5);

  if (v7)
  {
    sub_1D7AEB688();
    v8 = (void *)sub_1D7B4A4A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (HKSleepApneaEventAxis)initWithConfiguration:(id)a3
{
  id v3;
  HKSleepApneaEventAxis *result;

  v3 = a3;
  result = (HKSleepApneaEventAxis *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
