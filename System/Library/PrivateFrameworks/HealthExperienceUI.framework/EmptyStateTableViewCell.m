@implementation EmptyStateTableViewCell

- (_TtC18HealthExperienceUI23EmptyStateTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  if (a4)
  {
    a4 = (id)_sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (_TtC18HealthExperienceUI23EmptyStateTableViewCell *)sub_1A96319E4(a3, (uint64_t)a4, v6);
}

- (_TtC18HealthExperienceUI23EmptyStateTableViewCell)initWithCoder:(id)a3
{
  char *v5;
  objc_class *v6;
  objc_super v8;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI23EmptyStateTableViewCell____lazy_storage___emptyStateCellView) = 0;
  v5 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI23EmptyStateTableViewCell_item;
  v6 = (objc_class *)type metadata accessor for EmptyStateTableViewCell();
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((_QWORD *)v5 + 4) = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return -[EmptyStateTableViewCell initWithCoder:](&v8, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI23EmptyStateTableViewCell____lazy_storage___emptyStateCellView));
  sub_1A9618418((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI23EmptyStateTableViewCell_item);
}

@end
