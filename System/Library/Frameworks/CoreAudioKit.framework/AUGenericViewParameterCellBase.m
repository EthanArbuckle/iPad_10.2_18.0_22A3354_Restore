@implementation AUGenericViewParameterCellBase

- (UILabel)parameterName
{
  return (UILabel *)(id)MEMORY[0x2199ADC10]((char *)self+ OBJC_IVAR____TtC12CoreAudioKit30AUGenericViewParameterCellBase_parameterName, a2);
}

- (void)setParameterName:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (UILabel)valueLabel
{
  return (UILabel *)(id)MEMORY[0x2199ADC10]((char *)self+ OBJC_IVAR____TtC12CoreAudioKit30AUGenericViewParameterCellBase_valueLabel, a2);
}

- (void)setValueLabel:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (NSLayoutConstraint)parameterWidthConstraint
{
  return (NSLayoutConstraint *)(id)MEMORY[0x2199ADC10]((char *)self+ OBJC_IVAR____TtC12CoreAudioKit30AUGenericViewParameterCellBase_parameterWidthConstraint, a2);
}

- (void)setParameterWidthConstraint:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (NSLayoutConstraint)valueStackWidthConstraint
{
  return (NSLayoutConstraint *)(id)MEMORY[0x2199ADC10]((char *)self+ OBJC_IVAR____TtC12CoreAudioKit30AUGenericViewParameterCellBase_valueStackWidthConstraint, a2);
}

- (void)setValueStackWidthConstraint:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (UIColor)tintColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AUGenericViewParameterCellBase();
  return -[AUGenericViewParameterCellBase tintColor](&v3, sel_tintColor);
}

- (void)setTintColor:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AUGenericViewParameterCellBase();
  v4 = a3;
  v5 = v6.receiver;
  -[AUGenericViewParameterCellBase setTintColor:](&v6, sel_setTintColor_, v4);
  sub_2131A5A04();

}

- (_TtC12CoreAudioKit30AUGenericViewParameterCellBase)initWithCoder:(id)a3
{
  return (_TtC12CoreAudioKit30AUGenericViewParameterCellBase *)sub_2131A5B04(a3);
}

- (_TtC12CoreAudioKit30AUGenericViewParameterCellBase)initWithFrame:(CGRect)a3
{
  _TtC12CoreAudioKit30AUGenericViewParameterCellBase *result;

  result = (_TtC12CoreAudioKit30AUGenericViewParameterCellBase *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  sub_2131A63E8((uint64_t)self + OBJC_IVAR____TtC12CoreAudioKit30AUGenericViewParameterCellBase_owner);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit30AUGenericViewParameterCellBase_param));
}

@end
