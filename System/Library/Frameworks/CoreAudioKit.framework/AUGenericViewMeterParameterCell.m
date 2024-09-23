@implementation AUGenericViewMeterParameterCell

- (_TtC12CoreAudioKit11AUMeterView)meter
{
  return (_TtC12CoreAudioKit11AUMeterView *)(id)MEMORY[0x2199ADC10]((char *)self+ OBJC_IVAR____TtC12CoreAudioKit31AUGenericViewMeterParameterCell_meter, a2);
}

- (void)setMeter:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (UILabel)unitLabel
{
  return (UILabel *)(id)MEMORY[0x2199ADC10]((char *)self+ OBJC_IVAR____TtC12CoreAudioKit31AUGenericViewMeterParameterCell_unitLabel, a2);
}

- (void)setUnitLabel:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (UILabel)minLabel
{
  return (UILabel *)(id)MEMORY[0x2199ADC10]((char *)self+ OBJC_IVAR____TtC12CoreAudioKit31AUGenericViewMeterParameterCell_minLabel, a2);
}

- (void)setMinLabel:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (UILabel)maxLabel
{
  return (UILabel *)(id)MEMORY[0x2199ADC10]((char *)self+ OBJC_IVAR____TtC12CoreAudioKit31AUGenericViewMeterParameterCell_maxLabel, a2);
}

- (void)setMaxLabel:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (NSLayoutConstraint)minWidthConstraint
{
  return (NSLayoutConstraint *)(id)MEMORY[0x2199ADC10]((char *)self+ OBJC_IVAR____TtC12CoreAudioKit31AUGenericViewMeterParameterCell_minWidthConstraint, a2);
}

- (void)setMinWidthConstraint:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (UIColor)tintColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AUGenericViewMeterParameterCell();
  return -[AUGenericViewParameterCellBase tintColor](&v3, sel_tintColor);
}

- (void)setTintColor:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AUGenericViewMeterParameterCell();
  v4 = a3;
  v5 = v6.receiver;
  -[AUGenericViewParameterCellBase setTintColor:](&v6, sel_setTintColor_, v4);
  sub_21319C7FC();

}

- (_TtC12CoreAudioKit31AUGenericViewMeterParameterCell)initWithCoder:(id)a3
{
  return (_TtC12CoreAudioKit31AUGenericViewMeterParameterCell *)sub_21319CA30(a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
}

@end
