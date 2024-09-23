@implementation AUGenericViewFloatParameterCell

- (UISlider)valueSlider
{
  return (UISlider *)(id)MEMORY[0x2199ADC10]((char *)self+ OBJC_IVAR____TtC12CoreAudioKit31AUGenericViewFloatParameterCell_valueSlider, a2);
}

- (void)setValueSlider:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (UILabel)unitLabel
{
  return (UILabel *)(id)MEMORY[0x2199ADC10]((char *)self+ OBJC_IVAR____TtC12CoreAudioKit31AUGenericViewFloatParameterCell_unitLabel, a2);
}

- (void)setUnitLabel:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (void)sliderValueChangedWithSender:(id)a3
{
  id v4;
  _TtC12CoreAudioKit31AUGenericViewFloatParameterCell *v5;

  v4 = a3;
  v5 = self;
  sub_213193168();

}

- (void)accessibilityIncrement
{
  _TtC12CoreAudioKit31AUGenericViewFloatParameterCell *v2;

  v2 = self;
  sub_2131922F8();

}

- (void)accessibilityDecrement
{
  _TtC12CoreAudioKit31AUGenericViewFloatParameterCell *v2;

  v2 = self;
  sub_213192474();

}

- (void)sliderTouchedWithSender:(id)a3
{
  id v4;
  _TtC12CoreAudioKit31AUGenericViewFloatParameterCell *v5;

  v4 = a3;
  v5 = self;
  sub_2131925F0(v4);

}

- (void)sliderReleasedWithSender:(id)a3
{
  id v4;
  _TtC12CoreAudioKit31AUGenericViewFloatParameterCell *v5;

  v4 = a3;
  v5 = self;
  sub_213192660(v4);

}

- (UIColor)tintColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AUGenericViewFloatParameterCell();
  return -[AUGenericViewParameterCellBase tintColor](&v3, sel_tintColor);
}

- (void)setTintColor:(id)a3
{
  _TtC12CoreAudioKit31AUGenericViewFloatParameterCell *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_2131935EC((uint64_t)a3);

}

- (_TtC12CoreAudioKit31AUGenericViewFloatParameterCell)initWithCoder:(id)a3
{
  objc_super v6;

  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AUGenericViewFloatParameterCell();
  return -[AUGenericViewParameterCellBase initWithCoder:](&v6, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
}

@end
