@implementation SummarySharingSelectableDataTypeCell

- (void)switchUpdated
{
  _TtC18HealthExperienceUI36SummarySharingSelectableDataTypeCell *v2;

  v2 = self;
  sub_1A98772B8();

}

- (_TtC18HealthExperienceUI36SummarySharingSelectableDataTypeCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v8;
  id v9;
  _TtC18HealthExperienceUI36SummarySharingSelectableDataTypeCell *v10;
  uint64_t v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = OBJC_IVAR____TtC18HealthExperienceUI36SummarySharingSelectableDataTypeCell_selectionSwitch;
  v9 = objc_allocWithZone(MEMORY[0x1E0DC3D18]);
  v10 = self;
  *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v8) = (Class)objc_msgSend(v9, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v11 = OBJC_IVAR____TtC18HealthExperienceUI36SummarySharingSelectableDataTypeCell_font;
  *(Class *)((char *)&v10->super.super.super.super.super.super.super.isa + v11) = (Class)sub_1A98FF028((void *)*MEMORY[0x1E0DC4A88], *MEMORY[0x1E0DC1440], 0, 0x8000, 0, 0, 1);

  v13.receiver = v10;
  v13.super_class = (Class)type metadata accessor for SummarySharingSelectableDataTypeCell();
  return -[IconWithNameCell initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
}

- (_TtC18HealthExperienceUI36SummarySharingSelectableDataTypeCell)initWithCoder:(id)a3
{
  return (_TtC18HealthExperienceUI36SummarySharingSelectableDataTypeCell *)SummarySharingSelectableDataTypeCell.init(coder:)(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI36SummarySharingSelectableDataTypeCell_selectionSwitch));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI36SummarySharingSelectableDataTypeCell_font));
}

@end
