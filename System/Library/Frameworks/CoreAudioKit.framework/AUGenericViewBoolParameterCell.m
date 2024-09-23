@implementation AUGenericViewBoolParameterCell

- (UISwitch)valueSwitch
{
  return (UISwitch *)(id)MEMORY[0x2199ADC10]((char *)self+ OBJC_IVAR____TtC12CoreAudioKit30AUGenericViewBoolParameterCell_valueSwitch, a2);
}

- (void)setValueSwitch:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (UIColor)tintColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AUGenericViewBoolParameterCell();
  return -[AUGenericViewParameterCellBase tintColor](&v3, sel_tintColor);
}

- (void)setTintColor:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AUGenericViewBoolParameterCell();
  v4 = a3;
  v5 = v6.receiver;
  -[AUGenericViewParameterCellBase setTintColor:](&v6, sel_setTintColor_, v4);
  sub_2131C0B04();

}

- (BOOL)accessibilityActivate
{
  _TtC12CoreAudioKit30AUGenericViewBoolParameterCell *v2;

  v2 = self;
  sub_2131C0C60();

  return 1;
}

- (void)switchValueChangedWithSender:(id)a3
{
  id v4;
  _TtC12CoreAudioKit30AUGenericViewBoolParameterCell *v5;

  v4 = a3;
  v5 = self;
  sub_2131C1244();

}

- (_TtC12CoreAudioKit30AUGenericViewBoolParameterCell)initWithCoder:(id)a3
{
  objc_super v6;

  swift_unknownObjectWeakInit();
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AUGenericViewBoolParameterCell();
  return -[AUGenericViewParameterCellBase initWithCoder:](&v6, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
}

@end
