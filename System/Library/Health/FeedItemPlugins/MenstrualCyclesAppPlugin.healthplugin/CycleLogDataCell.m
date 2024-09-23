@implementation CycleLogDataCell

- (_TtC24MenstrualCyclesAppPlugin16CycleLogDataCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v7;
  _TtC24MenstrualCyclesAppPlugin16CycleLogDataCell *v8;
  uint64_t *v9;
  _TtC24MenstrualCyclesAppPlugin16CycleLogDataCell *v10;
  uint64_t v12[5];
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin16CycleLogDataCell_item;
  *(_OWORD *)v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  *((_QWORD *)v7 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin16CycleLogDataCell____lazy_storage___accessoryImageView) = 0;
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for CycleLogDataCell();
  v8 = -[CycleLogDataCell initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  v12[3] = sub_231C9FD18();
  v12[4] = MEMORY[0x24BEBC5F0];
  v9 = sub_23192CCCC(v12);
  v10 = v8;
  sub_231C527EC((uint64_t)v9);
  MEMORY[0x2348ED1F4](v12);

  return v10;
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC24MenstrualCyclesAppPlugin16CycleLogDataCell *v8;
  uint64_t v9;

  v4 = sub_231C9FB5C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_231C9FB50();
  v8 = self;
  sub_231C52AF8((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC24MenstrualCyclesAppPlugin16CycleLogDataCell)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC24MenstrualCyclesAppPlugin16CycleLogDataCell *result;

  v4 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin16CycleLogDataCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin16CycleLogDataCell____lazy_storage___accessoryImageView) = 0;
  v5 = a3;

  result = (_TtC24MenstrualCyclesAppPlugin16CycleLogDataCell *)sub_231CA2A48();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_231945C64((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin16CycleLogDataCell_item, (uint64_t)&qword_255F4A910, (uint64_t)&qword_255F48990, MEMORY[0x24BE41798], (uint64_t (*)(_QWORD))sub_2319604E8);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin16CycleLogDataCell____lazy_storage___accessoryImageView));
}

@end
