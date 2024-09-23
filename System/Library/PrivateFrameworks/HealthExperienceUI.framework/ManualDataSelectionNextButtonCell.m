@implementation ManualDataSelectionNextButtonCell

- (_TtC18HealthExperienceUI33ManualDataSelectionNextButtonCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v8;
  _QWORD *v9;
  objc_class *ButtonCell;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI33ManualDataSelectionNextButtonCell_item;
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((_QWORD *)v8 + 4) = 0;
  v9 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC18HealthExperienceUI33ManualDataSelectionNextButtonCell_didTapAction);
  ButtonCell = (objc_class *)type metadata accessor for ManualDataSelectionNextButtonCell();
  *v9 = 0;
  v9[1] = 0;
  v12.receiver = self;
  v12.super_class = ButtonCell;
  return -[ManualDataSelectionNextButtonCell initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
}

- (_TtC18HealthExperienceUI33ManualDataSelectionNextButtonCell)initWithCoder:(id)a3
{
  char *v5;
  _QWORD *v6;
  objc_class *ButtonCell;
  objc_super v9;

  v5 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI33ManualDataSelectionNextButtonCell_item;
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((_QWORD *)v5 + 4) = 0;
  v6 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC18HealthExperienceUI33ManualDataSelectionNextButtonCell_didTapAction);
  ButtonCell = (objc_class *)type metadata accessor for ManualDataSelectionNextButtonCell();
  *v6 = 0;
  v6[1] = 0;
  v9.receiver = self;
  v9.super_class = ButtonCell;
  return -[ManualDataSelectionNextButtonCell initWithCoder:](&v9, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  sub_1A9618418((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI33ManualDataSelectionNextButtonCell_item);
  sub_1A9642C9C(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                           + OBJC_IVAR____TtC18HealthExperienceUI33ManualDataSelectionNextButtonCell_didTapAction));
}

@end
