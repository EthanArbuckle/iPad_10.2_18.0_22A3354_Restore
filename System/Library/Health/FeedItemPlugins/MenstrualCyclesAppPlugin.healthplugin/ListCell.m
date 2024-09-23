@implementation ListCell

- (_TtC24MenstrualCyclesAppPlugin8ListCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v8;
  id v9;
  _TtC24MenstrualCyclesAppPlugin8ListCell *v10;
  char *v11;
  _TtC24MenstrualCyclesAppPlugin8ListCell *v12;
  void (*v13)(void);
  _TtC24MenstrualCyclesAppPlugin8ListCell *v14;
  objc_super v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin8ListCell_textLabel;
  v9 = objc_allocWithZone(MEMORY[0x24BEBD708]);
  v10 = self;
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v8) = (Class)objc_msgSend(v9, sel_init);
  v11 = (char *)v10 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin8ListCell_item;
  *((_QWORD *)v11 + 4) = 0;
  *(_OWORD *)v11 = 0u;
  *((_OWORD *)v11 + 1) = 0u;

  v16.receiver = v10;
  v16.super_class = (Class)type metadata accessor for ListCell();
  v12 = -[ListCell initWithFrame:](&v16, sel_initWithFrame_, x, y, width, height);
  v13 = *(void (**)(void))((*MEMORY[0x24BEE4EA0] & (uint64_t)v12->super.super.super.super.super.super.super.isa) + 0x60);
  v14 = v12;
  v13();

  return v14;
}

- (_TtC24MenstrualCyclesAppPlugin8ListCell)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC24MenstrualCyclesAppPlugin8ListCell *v8;
  char *v9;
  _TtC24MenstrualCyclesAppPlugin8ListCell *v10;
  objc_super v12;

  v5 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin8ListCell_textLabel;
  v6 = objc_allocWithZone(MEMORY[0x24BEBD708]);
  v7 = a3;
  v8 = self;
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  v9 = (char *)v8 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin8ListCell_item;
  *((_QWORD *)v9 + 4) = 0;
  *(_OWORD *)v9 = 0u;
  *((_OWORD *)v9 + 1) = 0u;

  v12.receiver = v8;
  v12.super_class = (Class)type metadata accessor for ListCell();
  v10 = -[ListCell initWithCoder:](&v12, sel_initWithCoder_, v7);

  return v10;
}

- (void)awakeFromNib
{
  _TtC24MenstrualCyclesAppPlugin8ListCell *v2;

  v2 = self;
  sub_231AA8CF0();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin8ListCell_textLabel));
  sub_2319B8DCC((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin8ListCell_item);
}

@end
