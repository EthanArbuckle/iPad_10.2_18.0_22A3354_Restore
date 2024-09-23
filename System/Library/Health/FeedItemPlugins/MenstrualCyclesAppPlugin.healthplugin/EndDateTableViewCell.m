@implementation EndDateTableViewCell

- (void)dateXButtonPressedWithSender:(id)a3 event:(id)a4
{
  id v6;
  id v7;
  _TtC24MenstrualCyclesAppPlugin20EndDateTableViewCell *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_2319B3634();

}

- (_TtC24MenstrualCyclesAppPlugin20EndDateTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC24MenstrualCyclesAppPlugin20EndDateTableViewCell *)sub_2319B323C(a3, (uint64_t)a4, v6);
}

- (_TtC24MenstrualCyclesAppPlugin20EndDateTableViewCell)initWithCoder:(id)a3
{
  char *v5;
  id v6;
  _TtC24MenstrualCyclesAppPlugin20EndDateTableViewCell *result;

  v5 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin20EndDateTableViewCell_item;
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((_QWORD *)v5 + 4) = 0;
  *(_QWORD *)((char *)&self->super.super.super.super._responderFlags
            + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin20EndDateTableViewCell_delegate) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin20EndDateTableViewCell____lazy_storage___xMarkButton) = 0;
  v6 = a3;

  result = (_TtC24MenstrualCyclesAppPlugin20EndDateTableViewCell *)sub_231CA2A48();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_2319604AC((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin20EndDateTableViewCell_item, (unint64_t *)&qword_255F4A910, (unint64_t *)&qword_255F48990);
  sub_23190C114((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin20EndDateTableViewCell_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin20EndDateTableViewCell____lazy_storage___xMarkButton));
}

@end
