@implementation MedicationEditCell

- (_TtC26MedicationsHealthAppPlugin18MedicationEditCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v4;
  uint64_t v5;

  if (a4)
  {
    v4 = sub_2318D55BC();
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  return (_TtC26MedicationsHealthAppPlugin18MedicationEditCell *)sub_2317ED3BC(v4, v5);
}

- (_TtC26MedicationsHealthAppPlugin18MedicationEditCell)initWithCoder:(id)a3
{
  char *v4;
  _QWORD *v5;
  id v6;
  _TtC26MedicationsHealthAppPlugin18MedicationEditCell *result;

  v4 = (char *)self + OBJC_IVAR____TtC26MedicationsHealthAppPlugin18MedicationEditCell_viewModel;
  v4[16] = 0;
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = 0;
  v5 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC26MedicationsHealthAppPlugin18MedicationEditCell_leadingAccessoryActionHandler);
  *v5 = 0;
  v5[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC26MedicationsHealthAppPlugin18MedicationEditCell____lazy_storage___leadingAccessoryView) = 0;
  v6 = a3;

  result = (_TtC26MedicationsHealthAppPlugin18MedicationEditCell *)sub_2318D6150();
  __break(1u);
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  _TtC26MedicationsHealthAppPlugin18MedicationEditCell *v8;
  id v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  id v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  id v23;
  void *v24;
  objc_super v26;
  CGPoint v27;
  CGRect v28;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = self;
  v9 = sub_2317EB6CC();
  -[MedicationEditCell convertPoint:toCoordinateSpace:](v8, sel_convertPoint_toCoordinateSpace_, v9, x, y);
  v11 = v10;
  v13 = v12;

  v14 = sub_2317EB6CC();
  objc_msgSend(v14, sel_bounds);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  v28.origin.x = v16;
  v28.origin.y = v18;
  v28.size.width = v20;
  v28.size.height = v22;
  v27.x = v11;
  v27.y = v13;
  if (CGRectContainsPoint(v28, v27))
  {
    v23 = sub_2317EB6CC();
  }
  else
  {
    v26.receiver = v8;
    v26.super_class = (Class)type metadata accessor for MedicationEditCell();
    v23 = -[MedicationEditCell hitTest:withEvent:](&v26, sel_hitTest_withEvent_, v7, x, y);
  }
  v24 = v23;

  return v24;
}

- (void).cxx_destruct
{
  sub_2317EE324(*(void **)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC26MedicationsHealthAppPlugin18MedicationEditCell_viewModel), *(void **)((char *)&self->super.super.super._responderFlags+ OBJC_IVAR____TtC26MedicationsHealthAppPlugin18MedicationEditCell_viewModel));
  sub_2317CD52C(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC26MedicationsHealthAppPlugin18MedicationEditCell_leadingAccessoryActionHandler));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC26MedicationsHealthAppPlugin18MedicationEditCell____lazy_storage___leadingAccessoryView));
}

@end
