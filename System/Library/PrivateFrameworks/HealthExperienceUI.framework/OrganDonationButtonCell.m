@implementation OrganDonationButtonCell

- (_TtC18HealthExperienceUI23OrganDonationButtonCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  char *v6;
  void *v7;
  char *v8;
  _TtC18HealthExperienceUI23OrganDonationButtonCell *v9;
  objc_super v11;

  if (a4)
  {
    _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
    v6 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI23OrganDonationButtonCell_item;
    *(_OWORD *)v6 = 0u;
    *((_OWORD *)v6 + 1) = 0u;
    *((_QWORD *)v6 + 4) = 0;
    v7 = (void *)sub_1A9A9580C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = 0;
    v8 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI23OrganDonationButtonCell_item;
    *(_OWORD *)v8 = 0u;
    *((_OWORD *)v8 + 1) = 0u;
    *((_QWORD *)v8 + 4) = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for OrganDonationButtonCell();
  v9 = -[OrganDonationButtonCell initWithStyle:reuseIdentifier:](&v11, sel_initWithStyle_reuseIdentifier_, a3, v7);

  return v9;
}

- (_TtC18HealthExperienceUI23OrganDonationButtonCell)initWithCoder:(id)a3
{
  char *v5;
  objc_class *v6;
  objc_super v8;

  v5 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI23OrganDonationButtonCell_item;
  v6 = (objc_class *)type metadata accessor for OrganDonationButtonCell();
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((_QWORD *)v5 + 4) = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return -[OrganDonationButtonCell initWithCoder:](&v8, sel_initWithCoder_, a3);
}

- (void)awakeFromNib
{
  _TtC18HealthExperienceUI23OrganDonationButtonCell *v2;

  v2 = self;
  sub_1A99AD1D0();

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  sub_1A99AD740(self, (uint64_t)a2, (uint64_t)a3, a4, 1, (SEL *)&selRef_touchesBegan_withEvent_);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  sub_1A99AD740(self, (uint64_t)a2, (uint64_t)a3, a4, 0, (SEL *)&selRef_touchesEnded_withEvent_);
}

- (void).cxx_destruct
{
  sub_1A961F39C((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI23OrganDonationButtonCell_item, (unint64_t *)&qword_1ED27B9E0, (unint64_t *)&qword_1ED27B9D0);
}

@end
