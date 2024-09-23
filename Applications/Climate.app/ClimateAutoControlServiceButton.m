@implementation ClimateAutoControlServiceButton

- (_TtC7Climate31ClimateAutoControlServiceButton)init
{
  _TtC7Climate31ClimateAutoControlServiceButton *result;

  result = (_TtC7Climate31ClimateAutoControlServiceButton *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD00000000000001FLL, 0x800000010008BB20, "Climate/ClimateAutoControlServiceButton.swift", 45, 2, 42, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate31ClimateAutoControlServiceButton_autoClimateControl));
}

- (void)autoClimateControlService:(void *)a3 didUpdateLevel:
{
  void (*v4)(void);
  id v5;
  _QWORD *v6;

  v4 = *(void (**)(void))((swift_isaMask & *a1) + 0x220);
  v5 = a3;
  v6 = a1;
  v4();

}

@end
