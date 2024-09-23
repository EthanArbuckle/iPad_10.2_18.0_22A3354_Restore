@implementation MenstrualCyclesHeaderFooterView

- (_TtC24MenstrualCyclesAppPlugin31MenstrualCyclesHeaderFooterView)initWithReuseIdentifier:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3)
  {
    v3 = _sSo25HKMCDisplayTypeIdentifiera24MenstrualCyclesAppPluginE2idSSvg_0();
  }
  else
  {
    v3 = 0;
    v4 = 0;
  }
  return (_TtC24MenstrualCyclesAppPlugin31MenstrualCyclesHeaderFooterView *)sub_231A1E57C(v3, v4);
}

- (_TtC24MenstrualCyclesAppPlugin31MenstrualCyclesHeaderFooterView)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  id v7;
  id v8;
  _TtC24MenstrualCyclesAppPlugin31MenstrualCyclesHeaderFooterView *result;

  v5 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31MenstrualCyclesHeaderFooterView_configuration;
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((_QWORD *)v5 + 4) = 0;
  v6 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31MenstrualCyclesHeaderFooterView_label;
  v7 = objc_allocWithZone(MEMORY[0x24BEBD708]);
  v8 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v6) = (Class)objc_msgSend(v7, sel_init);

  result = (_TtC24MenstrualCyclesAppPlugin31MenstrualCyclesHeaderFooterView *)sub_231CA2A48();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_231A1EF28((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31MenstrualCyclesHeaderFooterView_configuration);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31MenstrualCyclesHeaderFooterView_label));
}

@end
