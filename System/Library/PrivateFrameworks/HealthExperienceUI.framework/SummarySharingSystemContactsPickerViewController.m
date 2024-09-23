@implementation SummarySharingSystemContactsPickerViewController

- (void)viewDidLoad
{
  _TtC18HealthExperienceUI48SummarySharingSystemContactsPickerViewController *v2;

  v2 = self;
  sub_1A9828FB8();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SummarySharingSystemContactsPickerViewController();
  v4 = v5.receiver;
  -[OBBaseWelcomeController viewDidAppear:](&v5, sel_viewDidAppear_, v3);
  sub_1A982935C();

}

- (void)contactPickerDidCancel:(id)a3
{
  id v4;
  _TtC18HealthExperienceUI48SummarySharingSystemContactsPickerViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1A982A760(v4);

}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  id v6;
  id v7;
  _TtC18HealthExperienceUI48SummarySharingSystemContactsPickerViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1A982B718(v7);

}

- (void)summarySharingEntryStore:(id)a3 didUpdateReachabilityStatus:(id)a4 error:(id)a5
{
  uint64_t v8;
  id v9;
  _TtC18HealthExperienceUI48SummarySharingSystemContactsPickerViewController *v10;
  id v11;

  sub_1A9627620(0, (unint64_t *)&qword_1ED27E560);
  v8 = sub_1A9A95710();
  v9 = a3;
  v10 = self;
  v11 = a5;
  sub_1A982B820(v8);

  swift_bridgeObjectRelease();
}

- (_TtC18HealthExperienceUI48SummarySharingSystemContactsPickerViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC18HealthExperienceUI48SummarySharingSystemContactsPickerViewController *result;

  result = (_TtC18HealthExperienceUI48SummarySharingSystemContactsPickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC18HealthExperienceUI48SummarySharingSystemContactsPickerViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC18HealthExperienceUI48SummarySharingSystemContactsPickerViewController *result;

  v6 = a5;
  result = (_TtC18HealthExperienceUI48SummarySharingSystemContactsPickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self+ OBJC_IVAR____TtC18HealthExperienceUI48SummarySharingSystemContactsPickerViewController_healthExperienceStore);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI48SummarySharingSystemContactsPickerViewController_healthStore));
  sub_1A982B26C(*(id *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC18HealthExperienceUI48SummarySharingSystemContactsPickerViewController_state), *((_BYTE *)&self->super.super.super.super._responderFlags+ OBJC_IVAR____TtC18HealthExperienceUI48SummarySharingSystemContactsPickerViewController_state));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI48SummarySharingSystemContactsPickerViewController_sharingStore));
}

@end
