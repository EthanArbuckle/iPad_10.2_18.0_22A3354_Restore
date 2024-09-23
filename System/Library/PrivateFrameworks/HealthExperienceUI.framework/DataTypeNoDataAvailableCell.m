@implementation DataTypeNoDataAvailableCell

- (_TtC18HealthExperienceUI27DataTypeNoDataAvailableCell)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI27DataTypeNoDataAvailableCell *)DataTypeNoDataAvailableCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI27DataTypeNoDataAvailableCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1A984C43C();
}

- (BOOL)isHighlighted
{
  return sub_1A984B2B8(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  sub_1A984B300(self, (uint64_t)a2, a3, (const char **)&selRef_setHighlighted_);
}

- (BOOL)isSelected
{
  return sub_1A984B2B8(self, (uint64_t)a2, (SEL *)&selRef_isSelected);
}

- (void)setSelected:(BOOL)a3
{
  sub_1A984B300(self, (uint64_t)a2, a3, (const char **)&selRef_setSelected_);
}

- (void).cxx_destruct
{
  sub_1A961F39C((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI27DataTypeNoDataAvailableCell_item, (unint64_t *)&qword_1ED27B9E0, (unint64_t *)&qword_1ED27B9D0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI27DataTypeNoDataAvailableCell_mainTextLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI27DataTypeNoDataAvailableCell_disclosure));
  swift_bridgeObjectRelease();
}

@end
