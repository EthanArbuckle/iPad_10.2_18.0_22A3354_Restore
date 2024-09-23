@implementation HKMCAdjacentFlowAnalyzer.ChangeSetDay

- (int64_t)dayIndex
{
  int64_t v2;

  swift_retain();
  v2 = sub_231CA1A28();
  swift_release();
  return v2;
}

- (BOOL)hasFlow
{
  return *((_BYTE *)&self->super.isa
         + OBJC_IVAR____TtCE24MenstrualCyclesAppPluginCSo24HKMCAdjacentFlowAnalyzer12ChangeSetDay_shouldShowMenstruationFlow);
}

- (BOOL)hasConfirmedNoFlow
{
  return objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtCE24MenstrualCyclesAppPluginCSo24HKMCAdjacentFlowAnalyzer12ChangeSetDay_cycleDay+ *(int *)(type metadata accessor for CycleDay() + 20)), sel_menstruationLevel) == (id)5;
}

- (BOOL)isFetched
{
  return objc_msgSend(*(id *)((char *)&self->super.isa+ OBJC_IVAR____TtCE24MenstrualCyclesAppPluginCSo24HKMCAdjacentFlowAnalyzer12ChangeSetDay_cycleDay+ *(int *)(type metadata accessor for CycleDay() + 20)), sel_isFetched);
}

@end
