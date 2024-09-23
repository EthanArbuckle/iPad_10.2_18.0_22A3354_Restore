@implementation OrganDonationRegisteredBodyCell

- (_TtC18HealthExperienceUI31OrganDonationRegisteredBodyCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v8;
  _TtC18HealthExperienceUI31OrganDonationRegisteredBodyCell *v9;
  uint64_t v10;
  char *v11;
  _TtC18HealthExperienceUI31OrganDonationRegisteredBodyCell *v12;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = OBJC_IVAR____TtC18HealthExperienceUI31OrganDonationRegisteredBodyCell_bodyText;
  v9 = self;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v8) = (Class)sub_1A9902D68();
  v10 = OBJC_IVAR____TtC18HealthExperienceUI31OrganDonationRegisteredBodyCell_learnMoreButton;
  *(Class *)((char *)&v9->super.super.super.super.super.isa + v10) = (Class)sub_1A9902EB4();
  v11 = (char *)v9 + OBJC_IVAR____TtC18HealthExperienceUI31OrganDonationRegisteredBodyCell_item;
  *((_QWORD *)v11 + 4) = 0;
  *(_OWORD *)v11 = 0u;
  *((_OWORD *)v11 + 1) = 0u;

  v14.receiver = v9;
  v14.super_class = (Class)type metadata accessor for OrganDonationRegisteredBodyCell();
  v12 = -[OrganDonationRegisteredBodyCell initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  sub_1A9903254();

  return v12;
}

- (_TtC18HealthExperienceUI31OrganDonationRegisteredBodyCell)initWithCoder:(id)a3
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  char *v7;
  _TtC18HealthExperienceUI31OrganDonationRegisteredBodyCell *result;

  v4 = OBJC_IVAR____TtC18HealthExperienceUI31OrganDonationRegisteredBodyCell_bodyText;
  v5 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v4) = (Class)sub_1A9902D68();
  v6 = OBJC_IVAR____TtC18HealthExperienceUI31OrganDonationRegisteredBodyCell_learnMoreButton;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v6) = (Class)sub_1A9902EB4();
  v7 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI31OrganDonationRegisteredBodyCell_item;
  *((_QWORD *)v7 + 4) = 0;
  *(_OWORD *)v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;

  result = (_TtC18HealthExperienceUI31OrganDonationRegisteredBodyCell *)sub_1A9A96970();
  __break(1u);
  return result;
}

- (void)tappedLearnMore
{
  objc_msgSend((id)objc_opt_self(), sel_openDonateLifeMicroSiteInSafari);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI31OrganDonationRegisteredBodyCell_bodyText));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI31OrganDonationRegisteredBodyCell_learnMoreButton));
  sub_1A9618418((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI31OrganDonationRegisteredBodyCell_item);
}

@end
