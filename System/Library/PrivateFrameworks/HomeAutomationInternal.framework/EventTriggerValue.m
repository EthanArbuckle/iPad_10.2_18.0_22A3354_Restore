@implementation EventTriggerValue

- (_TtC22HomeAutomationInternal17EventTriggerValue)initWithCoder:(id)a3
{
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _TtC22HomeAutomationInternal17EventTriggerValue *result;

  v4 = (char *)self + OBJC_IVAR____TtC22HomeAutomationInternal17EventTriggerValue_offset;
  v5 = sub_220C95BBC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v4, 1, 1, v5);
  v6 = (char *)self + OBJC_IVAR____TtC22HomeAutomationInternal17EventTriggerValue_recurringDate;
  v7 = sub_220C95D84();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);

  result = (_TtC22HomeAutomationInternal17EventTriggerValue *)sub_220C9930C();
  __break(1u);
  return result;
}

- (_TtC22HomeAutomationInternal17EventTriggerValue)initWithIdentifier:(id)a3 displayString:(id)a4 pronunciationHint:(id)a5
{
  _TtC22HomeAutomationInternal17EventTriggerValue *result;

  result = (_TtC22HomeAutomationInternal17EventTriggerValue *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_2208761D8((uint64_t)self + OBJC_IVAR____TtC22HomeAutomationInternal17EventTriggerValue_offset, &qword_255604280);
  sub_2208761D8((uint64_t)self + OBJC_IVAR____TtC22HomeAutomationInternal17EventTriggerValue_recurringDate, &qword_255607DB0);
}

@end
