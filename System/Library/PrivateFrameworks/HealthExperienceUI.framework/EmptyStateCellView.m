@implementation EmptyStateCellView

- (_TtC18HealthExperienceUI18EmptyStateCellView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v7;
  _TtC18HealthExperienceUI18EmptyStateCellView *v8;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI18EmptyStateCellView_item;
  *(_OWORD *)v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  *((_QWORD *)v7 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI18EmptyStateCellView____lazy_storage___label) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI18EmptyStateCellView____lazy_storage___spinner) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI18EmptyStateCellView____lazy_storage___stackView) = 0;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for EmptyStateCellView();
  v8 = -[EmptyStateCellView initWithFrame:](&v10, sel_initWithFrame_, x, y, width, height);
  sub_1A9A281BC();

  return v8;
}

- (_TtC18HealthExperienceUI18EmptyStateCellView)initWithCoder:(id)a3
{
  return (_TtC18HealthExperienceUI18EmptyStateCellView *)sub_1A9A28110(a3);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  _TtC18HealthExperienceUI18EmptyStateCellView *v5;

  v4 = a3;
  v5 = self;
  sub_1A9A28644();

}

- (void).cxx_destruct
{
  sub_1A961F39C((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI18EmptyStateCellView_item, (unint64_t *)&qword_1ED27B9E0, (unint64_t *)&qword_1ED27B9D0);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI18EmptyStateCellView____lazy_storage___label));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI18EmptyStateCellView____lazy_storage___spinner));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI18EmptyStateCellView____lazy_storage___stackView));
}

@end
