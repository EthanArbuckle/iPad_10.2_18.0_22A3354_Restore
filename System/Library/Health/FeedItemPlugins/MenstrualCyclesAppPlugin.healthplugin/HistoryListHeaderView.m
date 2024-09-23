@implementation HistoryListHeaderView

- (_TtC24MenstrualCyclesAppPlugin21HistoryListHeaderView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v8;
  id v9;
  _TtC24MenstrualCyclesAppPlugin21HistoryListHeaderView *v10;
  _TtC24MenstrualCyclesAppPlugin21HistoryListHeaderView *v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin21HistoryListHeaderView_headerLabel;
  v9 = objc_allocWithZone(MEMORY[0x24BEBD708]);
  v10 = self;
  *(Class *)((char *)&self->super.super.super.super.isa + v8) = (Class)objc_msgSend(v9, sel_init);

  v13.receiver = v10;
  v13.super_class = (Class)type metadata accessor for HistoryListHeaderView();
  v11 = -[HistoryListHeaderView initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  sub_231C67600();

  return v11;
}

- (_TtC24MenstrualCyclesAppPlugin21HistoryListHeaderView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC24MenstrualCyclesAppPlugin21HistoryListHeaderView *result;

  v5 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin21HistoryListHeaderView_headerLabel;
  v6 = objc_allocWithZone(MEMORY[0x24BEBD708]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  result = (_TtC24MenstrualCyclesAppPlugin21HistoryListHeaderView *)sub_231CA2A48();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin21HistoryListHeaderView_headerLabel));
}

@end
