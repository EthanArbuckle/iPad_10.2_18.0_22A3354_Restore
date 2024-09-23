@implementation MultipleItemsCardStackCell

- (_TtC18HealthExperienceUI26MultipleItemsCardStackCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v8;
  id v9;
  _TtC18HealthExperienceUI26MultipleItemsCardStackCell *v10;
  objc_class *v11;
  _TtC18HealthExperienceUI26MultipleItemsCardStackCell *v12;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI26MultipleItemsCardStackCell_item;
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((_QWORD *)v8 + 4) = 0;
  v9 = objc_allocWithZone(MEMORY[0x1E0DC3F10]);
  v10 = self;
  v11 = (objc_class *)objc_msgSend(v9, sel_init);
  *(Class *)((char *)&v10->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI26MultipleItemsCardStackCell_cardStackView) = v11;

  v14.receiver = v10;
  v14.super_class = (Class)type metadata accessor for MultipleItemsCardStackCell();
  v12 = -[MultipleItemsCardStackCell initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  sub_1A97ECB70();

  return v12;
}

- (_TtC18HealthExperienceUI26MultipleItemsCardStackCell)initWithCoder:(id)a3
{
  return (_TtC18HealthExperienceUI26MultipleItemsCardStackCell *)sub_1A97EC868(a3);
}

- (void).cxx_destruct
{
  sub_1A9618418((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI26MultipleItemsCardStackCell_item);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI26MultipleItemsCardStackCell_cardStackView));
}

@end
