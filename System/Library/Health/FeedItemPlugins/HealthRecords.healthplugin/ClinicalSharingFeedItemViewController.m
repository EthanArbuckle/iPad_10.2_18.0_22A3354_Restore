@implementation ClinicalSharingFeedItemViewController

- (void)viewDidLoad
{
  _TtC13HealthRecords37ClinicalSharingFeedItemViewController *v2;

  v2 = self;
  sub_231219820();

}

- (_TtC13HealthRecords37ClinicalSharingFeedItemViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC13HealthRecords37ClinicalSharingFeedItemViewController *)sub_23121CB9C(v5, v7, a4);
}

- (_TtC13HealthRecords37ClinicalSharingFeedItemViewController)initWithCoder:(id)a3
{
  return (_TtC13HealthRecords37ClinicalSharingFeedItemViewController *)sub_23121CDC0(a3);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_23121E068((uint64_t)self + OBJC_IVAR____TtC13HealthRecords37ClinicalSharingFeedItemViewController____lazy_storage___factory, &qword_255EB7C98, (unint64_t *)&unk_255EB8F80, MEMORY[0x24BE497B0]);
  swift_bridgeObjectRelease();
  sub_23121E068((uint64_t)self + OBJC_IVAR____TtC13HealthRecords37ClinicalSharingFeedItemViewController_context, (unint64_t *)&qword_2541548B0, (unint64_t *)&qword_2541548A0, MEMORY[0x24BE443C0]);
  v3 = (char *)self + OBJC_IVAR____TtC13HealthRecords37ClinicalSharingFeedItemViewController_preferredIconSize;
  v4 = sub_231262674();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  sub_23121DE80((uint64_t)self + OBJC_IVAR____TtC13HealthRecords37ClinicalSharingFeedItemViewController_clinicalSharingFeedItemData, (uint64_t)&qword_255EB9900, (uint64_t)type metadata accessor for ClinicalSharingFeedItemData, (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))sub_2311735E0);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13HealthRecords37ClinicalSharingFeedItemViewController_authStore));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13HealthRecords37ClinicalSharingFeedItemViewController____lazy_storage___iconView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13HealthRecords37ClinicalSharingFeedItemViewController____lazy_storage___titleView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13HealthRecords37ClinicalSharingFeedItemViewController____lazy_storage___subtitleView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13HealthRecords37ClinicalSharingFeedItemViewController____lazy_storage___disclosureIndicator));
}

- (void)sharingRecipientAuthorizationStore:(id)a3 didAddSharingAuthorizations:(id)a4
{
  id v5;
  _TtC13HealthRecords37ClinicalSharingFeedItemViewController *v6;

  v5 = a3;
  v6 = self;
  sub_23121BE64();

}

@end
