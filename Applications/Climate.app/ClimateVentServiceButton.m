@implementation ClimateVentServiceButton

- (_TtC7Climate24ClimateVentServiceButton)init
{
  _QWORD *v2;
  _TtC7Climate24ClimateVentServiceButton *result;

  *(_DWORD *)((char *)&self->super.super.super.super.super.super.super.isa
            + OBJC_IVAR____TtC7Climate24ClimateVentServiceButton_currentValue) = 0;
  v2 = (Class *)((char *)&self->super.super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC7Climate24ClimateVentServiceButton_defaultSymbolName);
  *v2 = 0xD000000000000012;
  v2[1] = 0x800000010008DDC0;

  result = (_TtC7Climate24ClimateVentServiceButton *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD00000000000001FLL, 0x800000010008BB20, "Climate/ClimateVentServiceButton.swift", 38, 2, 140, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Climate24ClimateVentServiceButton_vent));
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.super.action[OBJC_IVAR____TtC7Climate24ClimateVentServiceButton_defaultSymbolName]);
}

- (void)ventService:(id)a3 didUpdateCombinations:(id)a4
{
  void *v5;
  id v6;
  unsigned int v7;
  _TtC7Climate24ClimateVentServiceButton *v8;

  v5 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC7Climate24ClimateVentServiceButton_vent);
  v6 = a3;
  v8 = self;
  v7 = objc_msgSend(v5, "currentIndex");
  *(_DWORD *)((char *)&v8->super.super.super.super.super.super.super.isa
            + OBJC_IVAR____TtC7Climate24ClimateVentServiceButton_currentValue) = v7;
  sub_100048C9C();
  sub_100048C9C();

}

- (void)ventService:(id)a3 didUpdateCurrentIndex:(unsigned int)a4
{
  id v5;
  _TtC7Climate24ClimateVentServiceButton *v6;

  *(_DWORD *)((char *)&self->super.super.super.super.super.super.super.isa
            + OBJC_IVAR____TtC7Climate24ClimateVentServiceButton_currentValue) = a4;
  v5 = a3;
  v6 = self;
  sub_100048C9C();
  sub_100048C9C();

}

- (void)ventService:(id)a3 didUpdateOn:(BOOL)a4
{
  id v5;
  _TtC7Climate24ClimateVentServiceButton *v6;

  v5 = a3;
  v6 = self;
  sub_100048C9C();

}

@end
