@implementation CycleHistoryCell

- (_TtC24MenstrualCyclesAppPlugin16CycleHistoryCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v8;
  objc_class *v9;
  id v10;
  _TtC24MenstrualCyclesAppPlugin16CycleHistoryCell *v11;
  objc_class *v12;
  _TtC24MenstrualCyclesAppPlugin16CycleHistoryCell *v13;
  objc_super v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin16CycleHistoryCell_item;
  v9 = (objc_class *)type metadata accessor for CycleHistorySingleCycleView();
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((_QWORD *)v8 + 4) = 0;
  v10 = objc_allocWithZone(v9);
  v11 = self;
  v12 = (objc_class *)objc_msgSend(v10, sel_init);
  *(Class *)((char *)&v11->super.super.super.super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin16CycleHistoryCell_singleCycleView) = v12;

  v15.receiver = v11;
  v15.super_class = (Class)type metadata accessor for CycleHistoryCell();
  v13 = -[CycleHistoryCell initWithFrame:](&v15, sel_initWithFrame_, x, y, width, height);
  sub_231B7680C();

  return v13;
}

- (_TtC24MenstrualCyclesAppPlugin16CycleHistoryCell)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC24MenstrualCyclesAppPlugin16CycleHistoryCell *result;

  v4 = (char *)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin16CycleHistoryCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  v5 = a3;

  result = (_TtC24MenstrualCyclesAppPlugin16CycleHistoryCell *)sub_231CA2A48();
  __break(1u);
  return result;
}

- (BOOL)isHighlighted
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CycleHistoryCell();
  return -[CycleHistoryCell isHighlighted](&v3, sel_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  _TtC24MenstrualCyclesAppPlugin16CycleHistoryCell *v4;

  v4 = self;
  sub_231B76630(a3);

}

- (UIColor)backgroundColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CycleHistoryCell();
  return -[CycleHistoryCell backgroundColor](&v3, sel_backgroundColor);
}

- (void)setBackgroundColor:(id)a3
{
  _TtC24MenstrualCyclesAppPlugin16CycleHistoryCell *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_231B76D04((uint64_t)a3);

}

- (void).cxx_destruct
{
  sub_2319B8DCC((uint64_t)self + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin16CycleHistoryCell_item);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin16CycleHistoryCell_singleCycleView));
}

@end
