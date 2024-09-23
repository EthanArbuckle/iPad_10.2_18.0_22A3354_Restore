@implementation NewFactorTypeTableViewCell

- (_TtC24MenstrualCyclesAppPlugin26NewFactorTypeTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  if (a4)
  {
    a4 = (id)_sSo25HKMCDisplayTypeIdentifiera24MenstrualCyclesAppPluginE2idSSvg_0();
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (_TtC24MenstrualCyclesAppPlugin26NewFactorTypeTableViewCell *)sub_231A6BCD0(a3, (uint64_t)a4, v6);
}

- (_TtC24MenstrualCyclesAppPlugin26NewFactorTypeTableViewCell)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC24MenstrualCyclesAppPlugin26NewFactorTypeTableViewCell *result;

  v5 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin26NewFactorTypeTableViewCell_titleLabel;
  v6 = objc_allocWithZone(MEMORY[0x24BEBD708]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin26NewFactorTypeTableViewCell_isChecked) = 0;

  result = (_TtC24MenstrualCyclesAppPlugin26NewFactorTypeTableViewCell *)sub_231CA2A48();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin26NewFactorTypeTableViewCell_checkMarkImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin26NewFactorTypeTableViewCell_titleLabel));
}

@end
