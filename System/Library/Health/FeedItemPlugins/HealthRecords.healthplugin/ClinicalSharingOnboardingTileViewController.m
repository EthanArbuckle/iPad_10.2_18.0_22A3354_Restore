@implementation ClinicalSharingOnboardingTileViewController

- (void)viewDidLoad
{
  _TtC13HealthRecords43ClinicalSharingOnboardingTileViewController *v2;

  v2 = self;
  sub_2311C6630();

}

- (void)didAddAccount:(id)a3
{
  id v4;
  _TtC13HealthRecords43ClinicalSharingOnboardingTileViewController *v5;

  v4 = a3;
  v5 = self;
  sub_2311C6CE0();

}

- (_TtC13HealthRecords43ClinicalSharingOnboardingTileViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = sub_23126409C();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC13HealthRecords43ClinicalSharingOnboardingTileViewController *)sub_2311C6EDC(v5, v7, a4);
}

- (_TtC13HealthRecords43ClinicalSharingOnboardingTileViewController)initWithCoder:(id)a3
{
  return (_TtC13HealthRecords43ClinicalSharingOnboardingTileViewController *)sub_2311C7054(a3);
}

- (void).cxx_destruct
{
  sub_231178970((uint64_t)self + OBJC_IVAR____TtC13HealthRecords43ClinicalSharingOnboardingTileViewController_context, (unint64_t *)&qword_2541548B0, (unint64_t *)&qword_2541548A0);
  swift_bridgeObjectRelease();
  sub_231178970((uint64_t)self+ OBJC_IVAR____TtC13HealthRecords43ClinicalSharingOnboardingTileViewController____lazy_storage___factory, &qword_255EB7C98, (unint64_t *)&unk_255EB8F80);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13HealthRecords43ClinicalSharingOnboardingTileViewController_profile));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13HealthRecords43ClinicalSharingOnboardingTileViewController____lazy_storage___label));
}

@end
