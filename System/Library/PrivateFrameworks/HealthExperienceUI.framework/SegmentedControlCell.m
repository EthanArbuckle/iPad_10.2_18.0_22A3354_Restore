@implementation SegmentedControlCell

- (_TtC18HealthExperienceUI20SegmentedControlCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v8;
  uint64_t v9;
  id v10;
  _TtC18HealthExperienceUI20SegmentedControlCell *v11;
  void *v12;
  objc_class *v13;
  _TtC18HealthExperienceUI20SegmentedControlCell *v14;
  objc_super v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI20SegmentedControlCell_item;
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((_QWORD *)v8 + 4) = 0;
  v9 = OBJC_IVAR____TtC18HealthExperienceUI20SegmentedControlCell_segmentedControl;
  v10 = objc_allocWithZone(MEMORY[0x1E0DC3C58]);
  v11 = self;
  v12 = (void *)sub_1A9A95A58();
  v13 = (objc_class *)objc_msgSend(v10, sel_initWithItems_, v12);

  *(Class *)((char *)&self->super.super.super.super.super.isa + v9) = v13;
  v16.receiver = v11;
  v16.super_class = (Class)type metadata accessor for SegmentedControlCell();
  v14 = -[SegmentedControlCell initWithFrame:](&v16, sel_initWithFrame_, x, y, width, height);
  sub_1A998EE90();

  return v14;
}

- (_TtC18HealthExperienceUI20SegmentedControlCell)initWithCoder:(id)a3
{
  return (_TtC18HealthExperienceUI20SegmentedControlCell *)SegmentedControlCell.init(coder:)(a3);
}

- (void)segmentedControlChanged:(id)a3
{
  id v4;
  _TtC18HealthExperienceUI20SegmentedControlCell *v5;

  v4 = a3;
  v5 = self;
  sub_1A998F1F0(v4);

}

- (void).cxx_destruct
{
  sub_1A9618418((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI20SegmentedControlCell_item);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI20SegmentedControlCell_segmentedControl));
}

@end
