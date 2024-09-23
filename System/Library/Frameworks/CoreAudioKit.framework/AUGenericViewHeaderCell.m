@implementation AUGenericViewHeaderCell

- (UILabel)auNameLabel
{
  return (UILabel *)(id)MEMORY[0x2199ADC10]((char *)self+ OBJC_IVAR____TtC12CoreAudioKit23AUGenericViewHeaderCell_auNameLabel, a2);
}

- (void)setAuNameLabel:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (UILabel)auVersionLabel
{
  return (UILabel *)(id)MEMORY[0x2199ADC10]((char *)self+ OBJC_IVAR____TtC12CoreAudioKit23AUGenericViewHeaderCell_auVersionLabel, a2);
}

- (void)setAuVersionLabel:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (UILabel)auManufacturerLabel
{
  return (UILabel *)(id)MEMORY[0x2199ADC10]((char *)self+ OBJC_IVAR____TtC12CoreAudioKit23AUGenericViewHeaderCell_auManufacturerLabel, a2);
}

- (void)setAuManufacturerLabel:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (_TtC12CoreAudioKit23AUGenericViewHeaderCell)initWithCoder:(id)a3
{
  return (_TtC12CoreAudioKit23AUGenericViewHeaderCell *)sub_21318376C(a3);
}

- (_TtC12CoreAudioKit23AUGenericViewHeaderCell)initWithFrame:(CGRect)a3
{
  _TtC12CoreAudioKit23AUGenericViewHeaderCell *result;

  result = (_TtC12CoreAudioKit23AUGenericViewHeaderCell *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit23AUGenericViewHeaderCell_audioUnit));
}

@end
