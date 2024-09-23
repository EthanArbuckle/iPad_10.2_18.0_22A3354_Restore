@implementation PlaceholderTextCollectionViewCell

- (_TtC18HealthExperienceUI33PlaceholderTextCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI33PlaceholderTextCollectionViewCell *)sub_1A97CBD80(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI33PlaceholderTextCollectionViewCell)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC18HealthExperienceUI33PlaceholderTextCollectionViewCell *result;

  v4 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI33PlaceholderTextCollectionViewCell_item;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI33PlaceholderTextCollectionViewCell____lazy_storage___label) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI33PlaceholderTextCollectionViewCell____lazy_storage___spinnerZeroWidthConstraint) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI33PlaceholderTextCollectionViewCell____lazy_storage___spinnerToLabelWidthConstraint) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI33PlaceholderTextCollectionViewCell____lazy_storage___spinner) = 0;
  v5 = a3;

  result = (_TtC18HealthExperienceUI33PlaceholderTextCollectionViewCell *)sub_1A9A96970();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1A9618418((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI33PlaceholderTextCollectionViewCell_item);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI33PlaceholderTextCollectionViewCell_subview));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI33PlaceholderTextCollectionViewCell____lazy_storage___label));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI33PlaceholderTextCollectionViewCell____lazy_storage___spinnerZeroWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI33PlaceholderTextCollectionViewCell____lazy_storage___spinnerToLabelWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI33PlaceholderTextCollectionViewCell____lazy_storage___spinner));
}

@end
