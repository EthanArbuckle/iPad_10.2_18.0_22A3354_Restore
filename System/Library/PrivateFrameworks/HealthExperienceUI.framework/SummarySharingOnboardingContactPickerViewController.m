@implementation SummarySharingOnboardingContactPickerViewController

- (_TtC18HealthExperienceUI51SummarySharingOnboardingContactPickerViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1A9838ADC();
}

- (void)viewDidLoad
{
  _TtC18HealthExperienceUI51SummarySharingOnboardingContactPickerViewController *v2;

  v2 = self;
  sub_1A9831B74();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC18HealthExperienceUI51SummarySharingOnboardingContactPickerViewController *v4;

  v4 = self;
  sub_1A9832838(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC18HealthExperienceUI51SummarySharingOnboardingContactPickerViewController *v4;

  v4 = self;
  sub_1A9832A64(a3);

}

- (void)cancelButtonTapped:(id)a3
{
  _TtC18HealthExperienceUI51SummarySharingOnboardingContactPickerViewController *v4;
  uint64_t v5;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1A9A96670();
  swift_unknownObjectRelease();
  sub_1A9832D28();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (_TtC18HealthExperienceUI51SummarySharingOnboardingContactPickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC18HealthExperienceUI51SummarySharingOnboardingContactPickerViewController *result;

  v4 = a4;
  result = (_TtC18HealthExperienceUI51SummarySharingOnboardingContactPickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self+ OBJC_IVAR____TtC18HealthExperienceUI51SummarySharingOnboardingContactPickerViewController_healthExperienceStore);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI51SummarySharingOnboardingContactPickerViewController_healthStore));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI51SummarySharingOnboardingContactPickerViewController_sharingEntryStore));
  swift_release();
  v3 = (char *)self
     + OBJC_IVAR____TtC18HealthExperienceUI51SummarySharingOnboardingContactPickerViewController__reachabilityQueryState;
  sub_1A961D9E8(0, &qword_1EEB18110, (uint64_t)&type metadata for QueryState, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0C96198]);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI51SummarySharingOnboardingContactPickerViewController____lazy_storage___searchController));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI51SummarySharingOnboardingContactPickerViewController_resultsTableViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI51SummarySharingOnboardingContactPickerViewController____lazy_storage___splashView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI51SummarySharingOnboardingContactPickerViewController____lazy_storage___splashContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI51SummarySharingOnboardingContactPickerViewController_resultsTableView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI51SummarySharingOnboardingContactPickerViewController_searchManager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI51SummarySharingOnboardingContactPickerViewController_currentSearchTaskID));
  swift_bridgeObjectRelease();
}

- (void)summarySharingEntryStore:(id)a3 didUpdateReachabilityStatus:(id)a4 error:(id)a5
{
  uint64_t v8;
  id v9;
  _TtC18HealthExperienceUI51SummarySharingOnboardingContactPickerViewController *v10;
  id v11;

  sub_1A9627620(0, (unint64_t *)&qword_1ED27E560);
  v8 = sub_1A9A95710();
  v9 = a3;
  v10 = self;
  v11 = a5;
  sub_1A9838CD4(v8);

  swift_bridgeObjectRelease();
}

- (void)consumeAutocompleteSearchResults:(id)a3 taskID:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  _TtC18HealthExperienceUI51SummarySharingOnboardingContactPickerViewController *v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  _TtC18HealthExperienceUI51SummarySharingOnboardingContactPickerViewController *v12;
  id v13;

  if (!a3)
  {
    *((_BYTE *)&self->super.super.super.isa
    + OBJC_IVAR____TtC18HealthExperienceUI51SummarySharingOnboardingContactPickerViewController_foundSearchResults) = 1;
    goto LABEL_6;
  }
  v6 = sub_1A9A95A70();
  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC18HealthExperienceUI51SummarySharingOnboardingContactPickerViewController_foundSearchResults) = 1;
  if (!v6)
  {
LABEL_6:
    v12 = self;
    v13 = a4;
    goto LABEL_7;
  }
  v7 = v6;
  v8 = self;
  v9 = a4;
  v10 = sub_1A98317A8(v7);
  if (!v10)
  {
LABEL_7:
    swift_bridgeObjectRelease();
    v11 = MEMORY[0x1E0DEE9D8];
    goto LABEL_8;
  }
  v11 = v10;
LABEL_8:
  sub_1A9834504(v11);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)finishedSearchingForAutocompleteResults
{
  _TtC18HealthExperienceUI51SummarySharingOnboardingContactPickerViewController *v2;

  v2 = self;
  sub_1A98355E4();

}

- (void)autocompleteResultsController:(id)a3 tintColorForRecipient:(id)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _TtC18HealthExperienceUI51SummarySharingOnboardingContactPickerViewController *v12;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_1A9838EFC(v11, (void (*)(void))sub_1A983A270, v9);

  swift_release();
}

- (id)autocompleteResultsController:(id)a3 preferredRecipientForRecipient:(id)a4
{
  id v6;
  id v7;
  _TtC18HealthExperienceUI51SummarySharingOnboardingContactPickerViewController *v8;
  id v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1A98393F0(v7);

  return v9;
}

- (void)autocompleteResultsController:(id)a3 didSelectRecipient:(id)a4 atIndex:(int64_t)a5
{
  id v7;
  id v8;
  _TtC18HealthExperienceUI51SummarySharingOnboardingContactPickerViewController *v9;

  v7 = a3;
  v8 = a4;
  v9 = self;
  sub_1A9839A30(v8);

}

@end
