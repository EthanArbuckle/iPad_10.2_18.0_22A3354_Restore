@implementation OrganDonationRegisteredHeaderCell

- (_TtC18HealthExperienceUI33OrganDonationRegisteredHeaderCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v8;
  _TtC18HealthExperienceUI33OrganDonationRegisteredHeaderCell *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  _TtC18HealthExperienceUI33OrganDonationRegisteredHeaderCell *v13;
  objc_super v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = OBJC_IVAR____TtC18HealthExperienceUI33OrganDonationRegisteredHeaderCell_organDonationLogoImage;
  v9 = self;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v8) = (Class)sub_1A9902010();
  v10 = OBJC_IVAR____TtC18HealthExperienceUI33OrganDonationRegisteredHeaderCell_title;
  *(Class *)((char *)&v9->super.super.super.super.super.isa + v10) = (Class)sub_1A9902138();
  v11 = OBJC_IVAR____TtC18HealthExperienceUI33OrganDonationRegisteredHeaderCell_subtitle;
  *(Class *)((char *)&v9->super.super.super.super.super.isa + v11) = (Class)sub_1A9902280();
  v12 = (char *)v9 + OBJC_IVAR____TtC18HealthExperienceUI33OrganDonationRegisteredHeaderCell_item;
  *((_QWORD *)v12 + 4) = 0;
  *(_OWORD *)v12 = 0u;
  *((_OWORD *)v12 + 1) = 0u;

  v15.receiver = v9;
  v15.super_class = (Class)type metadata accessor for OrganDonationRegisteredHeaderCell();
  v13 = -[OrganDonationRegisteredHeaderCell initWithFrame:](&v15, sel_initWithFrame_, x, y, width, height);
  sub_1A990259C();

  return v13;
}

- (_TtC18HealthExperienceUI33OrganDonationRegisteredHeaderCell)initWithCoder:(id)a3
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC18HealthExperienceUI33OrganDonationRegisteredHeaderCell *result;

  v4 = OBJC_IVAR____TtC18HealthExperienceUI33OrganDonationRegisteredHeaderCell_organDonationLogoImage;
  v5 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v4) = (Class)sub_1A9902010();
  v6 = OBJC_IVAR____TtC18HealthExperienceUI33OrganDonationRegisteredHeaderCell_title;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v6) = (Class)sub_1A9902138();
  v7 = OBJC_IVAR____TtC18HealthExperienceUI33OrganDonationRegisteredHeaderCell_subtitle;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v7) = (Class)sub_1A9902280();
  v8 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI33OrganDonationRegisteredHeaderCell_item;
  *((_QWORD *)v8 + 4) = 0;
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;

  result = (_TtC18HealthExperienceUI33OrganDonationRegisteredHeaderCell *)sub_1A9A96970();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI33OrganDonationRegisteredHeaderCell_organDonationLogoImage));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI33OrganDonationRegisteredHeaderCell_title));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI33OrganDonationRegisteredHeaderCell_subtitle));
  sub_1A9618418((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI33OrganDonationRegisteredHeaderCell_item);
}

@end
