@implementation CycleDeviationAnalyticsEvent

- (NSString)eventName
{
  void *v2;

  _s24MenstrualCyclesAppPlugin30PDFHorizontallySequentialItemsV7contentSay18HealthExperienceUI13PDFRenderable_pGvg_0();
  v2 = (void *)sub_231CA1BD8();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setEventName:(id)a3
{
  uint64_t v4;

  *(_QWORD *)self->eventName = _sSo25HKMCDisplayTypeIdentifiera24MenstrualCyclesAppPluginE2idSSvg_0();
  *(_QWORD *)&self->eventName[8] = v4;
  swift_retain();
  swift_release();
  swift_bridgeObjectRelease();
}

- (BOOL)isEventSubmissionIHAGated
{
  return 1;
}

- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  void *v4;

  sub_231B94880(MEMORY[0x24BEE4AF8]);
  v4 = (void *)sub_231CA1A94();
  swift_bridgeObjectRelease();
  return v4;
}

- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;

  v4 = a3;
  swift_retain();
  sub_231C42E90(v4);
  swift_release();

  v5 = (void *)sub_231CA1A94();
  swift_bridgeObjectRelease();
  return v5;
}

@end
