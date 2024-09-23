@implementation ClimateFanButton

- (_TtC7Climate16ClimateFanButton)init
{
  _TtC7Climate16ClimateFanButton *result;

  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC7Climate16ClimateFanButton_autoModeGlyph) = 0;
  *(_WORD *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC7Climate16ClimateFanButton____lazy_storage___currentValue) = 256;
  *((_BYTE *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC7Climate16ClimateFanButton_wasPreviousValueInAutoMode) = 0;

  result = (_TtC7Climate16ClimateFanButton *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD00000000000001FLL, 0x800000010008BB20, "Climate/ClimateFanButton.swift", 30, 2, 115, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  void *v3;
  void *v4;
  void *v5;

  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate16ClimateFanButton_autoModeGlyph));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC7Climate16ClimateFanButton_progressColors);
  v4 = *(void **)&self->super.action[OBJC_IVAR____TtC7Climate16ClimateFanButton_progressColors];
  v5 = *(void **)&self->super.action[OBJC_IVAR____TtC7Climate16ClimateFanButton_progressColors + 8];
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.popoverDelegate[OBJC_IVAR____TtC7Climate16ClimateFanButton_progressColors]);

  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate16ClimateFanButton_fan));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate16ClimateFanButton_progressCircle));
}

@end
