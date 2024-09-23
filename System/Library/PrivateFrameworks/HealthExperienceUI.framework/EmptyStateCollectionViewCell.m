@implementation EmptyStateCollectionViewCell

- (_TtC18HealthExperienceUI28EmptyStateCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI28EmptyStateCollectionViewCell *)sub_1A97E76C4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI28EmptyStateCollectionViewCell)initWithCoder:(id)a3
{
  char *v5;
  objc_class *v6;
  objc_super v8;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI28EmptyStateCollectionViewCell____lazy_storage___emptyStateCellView) = 0;
  v5 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI28EmptyStateCollectionViewCell_item;
  v6 = (objc_class *)type metadata accessor for EmptyStateCollectionViewCell();
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((_QWORD *)v5 + 4) = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return -[EmptyStateCollectionViewCell initWithCoder:](&v8, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI28EmptyStateCollectionViewCell____lazy_storage___emptyStateCellView));
  sub_1A9618418((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI28EmptyStateCollectionViewCell_item);
}

@end
