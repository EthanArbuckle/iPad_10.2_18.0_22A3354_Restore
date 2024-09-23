@implementation DatePickerTableViewCell

- (_TtC24MenstrualCyclesAppPlugin23DatePickerTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v4;
  uint64_t v5;

  if (a4)
  {
    v4 = _sSo25HKMCDisplayTypeIdentifiera24MenstrualCyclesAppPluginE2idSSvg_0();
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  return (_TtC24MenstrualCyclesAppPlugin23DatePickerTableViewCell *)sub_231960100(v4, v5);
}

- (void)prepareForReuse
{
  char *v2;
  uint64_t v3;
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v2 = (char *)v6.receiver;
  -[DatePickerTableViewCell prepareForReuse](&v6, sel_prepareForReuse);
  v3 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin23DatePickerTableViewCell_datePicker;
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin23DatePickerTableViewCell_datePicker], sel_removeFromSuperview, v6.receiver, v6.super_class);
  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD520]), sel_init);
  v5 = *(void **)&v2[v3];
  *(_QWORD *)&v2[v3] = v4;

  sub_23195FA08();
}

- (_TtC24MenstrualCyclesAppPlugin23DatePickerTableViewCell)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD *v9;
  _TtC24MenstrualCyclesAppPlugin23DatePickerTableViewCell *result;

  v5 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin23DatePickerTableViewCell_item;
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((_QWORD *)v5 + 4) = 0;
  v6 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin23DatePickerTableViewCell_datePicker;
  v7 = objc_allocWithZone(MEMORY[0x24BEBD520]);
  v8 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v6) = (Class)objc_msgSend(v7, sel_init);
  *(_QWORD *)((char *)&self->super.super.super._responderFlags
            + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin23DatePickerTableViewCell_delegate) = 0;
  swift_unknownObjectWeakInit();
  v9 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin23DatePickerTableViewCell_selectedItemUniqueIdentifier);
  *v9 = 0;
  v9[1] = 0;

  result = (_TtC24MenstrualCyclesAppPlugin23DatePickerTableViewCell *)sub_231CA2A48();
  __break(1u);
  return result;
}

- (void)datePickerChangedWithPicker:(id)a3
{
  id v4;
  _TtC24MenstrualCyclesAppPlugin23DatePickerTableViewCell *v5;

  v4 = a3;
  v5 = self;
  sub_231960224();

}

- (void).cxx_destruct
{
  sub_2319604AC((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin23DatePickerTableViewCell_item, (unint64_t *)&qword_255F4A910, (unint64_t *)&qword_255F48990);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin23DatePickerTableViewCell_datePicker));
  sub_23190C114((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin23DatePickerTableViewCell_delegate);
  swift_bridgeObjectRelease();
}

@end
