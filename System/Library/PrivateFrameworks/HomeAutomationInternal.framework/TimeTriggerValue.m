@implementation TimeTriggerValue

- (_TtC22HomeAutomationInternal16TimeTriggerValue)initWithCoder:(id)a3
{
  char *v4;
  uint64_t v5;
  _TtC22HomeAutomationInternal16TimeTriggerValue *result;

  v4 = (char *)self + OBJC_IVAR____TtC22HomeAutomationInternal16TimeTriggerValue_recurringDate;
  v5 = sub_220C95D84();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v4, 1, 1, v5);

  result = (_TtC22HomeAutomationInternal16TimeTriggerValue *)sub_220C9930C();
  __break(1u);
  return result;
}

- (_TtC22HomeAutomationInternal16TimeTriggerValue)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
{
  _TtC22HomeAutomationInternal16TimeTriggerValue *result;

  result = (_TtC22HomeAutomationInternal16TimeTriggerValue *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC22HomeAutomationInternal16TimeTriggerValue_triggerDate;
  v4 = sub_220C95BBC();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_2208761D8((uint64_t)self + OBJC_IVAR____TtC22HomeAutomationInternal16TimeTriggerValue_recurringDate, &qword_255607DB0);
}

- (NSString)description
{
  return (NSString *)sub_2208DB9D8(self, (uint64_t)a2, (void (*)(void))TimeTriggerValue.description.getter);
}

@end
