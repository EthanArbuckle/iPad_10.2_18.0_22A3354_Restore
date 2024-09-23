@implementation HomePodSetupAutomation

+ (_TtC14HDSViewService22HomePodSetupAutomation)shared
{
  if (qword_1000D5530 != -1)
    swift_once(&qword_1000D5530, sub_100036860);
  return (_TtC14HDSViewService22HomePodSetupAutomation *)(id)qword_1000DB5C8;
}

- (BOOL)hasAutomationStepResults
{
  if ((*(_QWORD **)((char *)&self->super.isa
                   + OBJC_IVAR____TtC14HDSViewService22HomePodSetupAutomation_automationStepResults))[2])
    return 1;
  else
    return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC14HDSViewService22HomePodSetupAutomation_alwaysSelectDefault);
}

- (_TtC14HDSViewService22HomePodSetupAutomation)init
{
  return (_TtC14HDSViewService22HomePodSetupAutomation *)HomePodSetupAutomation.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC14HDSViewService22HomePodSetupAutomation_automationStepResults));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14HDSViewService22HomePodSetupAutomation____lazy_storage___userDefaults));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC14HDSViewService22HomePodSetupAutomation_forcedStateSequence));
  swift_bridgeObjectRelease(*(_QWORD *)&self->automationStepResults[OBJC_IVAR____TtC14HDSViewService22HomePodSetupAutomation_forcedPasscode]);
}

@end
