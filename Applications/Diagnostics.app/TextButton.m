@implementation TextButton

- (UIButton)button
{
  return (UIButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                             + OBJC_IVAR____TtC11Diagnostics10TextButton_button));
}

- (_TtC11Diagnostics10TextButton)initWithCoder:(id)a3
{
  _TtC11Diagnostics10TextButton *result;

  result = (_TtC11Diagnostics10TextButton *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100112360, "Diagnostics/TextButton.swift", 28, 2, 31, 0);
  __break(1u);
  return result;
}

- (void)buttonActionWithSender:(id)a3
{
  void (*v4)(id);
  id v5;
  _TtC11Diagnostics10TextButton *v6;

  v4 = *(void (**)(id))&self->action[OBJC_IVAR____TtC11Diagnostics10TextButton_action + 24];
  v5 = a3;
  v6 = self;
  v4(v5);

}

- (_TtC11Diagnostics10TextButton)initWithFrame:(CGRect)a3
{
  _TtC11Diagnostics10TextButton *result;

  result = (_TtC11Diagnostics10TextButton *)_swift_stdlib_reportUnimplementedInitializer("Diagnostics.TextButton", 22, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)&self->action[OBJC_IVAR____TtC11Diagnostics10TextButton_action];
  v4 = *(void **)&self->action[OBJC_IVAR____TtC11Diagnostics10TextButton_action + 8];
  swift_release(*(_QWORD *)&self->action[OBJC_IVAR____TtC11Diagnostics10TextButton_action + 32]);

  swift_bridgeObjectRelease(v3);
}

@end
