@implementation MedicationsCurrentDayScheduleCompleteCell

- (_TtC26MedicationsHealthAppPlugin41MedicationsCurrentDayScheduleCompleteCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v8;
  objc_class *v9;
  _TtC26MedicationsHealthAppPlugin41MedicationsCurrentDayScheduleCompleteCell *v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC26MedicationsHealthAppPlugin41MedicationsCurrentDayScheduleCompleteCell____lazy_storage___gradientLayer) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC26MedicationsHealthAppPlugin41MedicationsCurrentDayScheduleCompleteCell____lazy_storage___scheduleCompleteView) = 0;
  v8 = (char *)self + OBJC_IVAR____TtC26MedicationsHealthAppPlugin41MedicationsCurrentDayScheduleCompleteCell_item;
  v9 = (objc_class *)type metadata accessor for MedicationsCurrentDayScheduleCompleteCell();
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((_QWORD *)v8 + 4) = 0;
  v12.receiver = self;
  v12.super_class = v9;
  v10 = -[MedicationsCurrentDayScheduleCompleteCell initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  sub_23180F968();

  return v10;
}

- (_TtC26MedicationsHealthAppPlugin41MedicationsCurrentDayScheduleCompleteCell)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC26MedicationsHealthAppPlugin41MedicationsCurrentDayScheduleCompleteCell *result;

  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC26MedicationsHealthAppPlugin41MedicationsCurrentDayScheduleCompleteCell____lazy_storage___gradientLayer) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC26MedicationsHealthAppPlugin41MedicationsCurrentDayScheduleCompleteCell____lazy_storage___scheduleCompleteView) = 0;
  v4 = (char *)self + OBJC_IVAR____TtC26MedicationsHealthAppPlugin41MedicationsCurrentDayScheduleCompleteCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  v5 = a3;

  result = (_TtC26MedicationsHealthAppPlugin41MedicationsCurrentDayScheduleCompleteCell *)sub_2318D6150();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  id v2;
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for MedicationsCurrentDayScheduleCompleteCell();
  v2 = v4.receiver;
  -[MedicationsCurrentDayScheduleCompleteCell layoutSubviews](&v4, sel_layoutSubviews);
  v3 = sub_23180F260();
  objc_msgSend(v2, sel_bounds, v4.receiver, v4.super_class);
  objc_msgSend(v3, sel_setFrame_);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC26MedicationsHealthAppPlugin41MedicationsCurrentDayScheduleCompleteCell____lazy_storage___gradientLayer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC26MedicationsHealthAppPlugin41MedicationsCurrentDayScheduleCompleteCell____lazy_storage___scheduleCompleteView));
  sub_2317FAF6C((uint64_t)self + OBJC_IVAR____TtC26MedicationsHealthAppPlugin41MedicationsCurrentDayScheduleCompleteCell_item);
}

@end
