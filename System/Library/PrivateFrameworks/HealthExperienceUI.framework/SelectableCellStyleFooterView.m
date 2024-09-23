@implementation SelectableCellStyleFooterView

- (_TtC18HealthExperienceUI29SelectableCellStyleFooterView)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI29SelectableCellStyleFooterView *)SelectableCellStyleFooterView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI29SelectableCellStyleFooterView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1A96F4D68();
}

- (void)didSelect
{
  _TtC18HealthExperienceUI29SelectableCellStyleFooterView *v2;

  v2 = self;
  sub_1A96F4470();

}

- (void).cxx_destruct
{
  sub_1A9618418((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI29SelectableCellStyleFooterView_item);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI29SelectableCellStyleFooterView_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI29SelectableCellStyleFooterView_titleLabel));
}

@end
