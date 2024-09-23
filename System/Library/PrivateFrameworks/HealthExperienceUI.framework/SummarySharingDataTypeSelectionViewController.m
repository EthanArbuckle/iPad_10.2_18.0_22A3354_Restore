@implementation SummarySharingDataTypeSelectionViewController

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SummarySharingDataTypeSelectionViewController(0);
  v2 = v3.receiver;
  -[CompoundDataSourceCollectionViewController viewDidLoad](&v3, sel_viewDidLoad);
  sub_1A981CFEC();
  sub_1A981D0E0();

}

- (_TtC18HealthExperienceUI45SummarySharingDataTypeSelectionViewController)initWithCoder:(id)a3
{
  id v5;
  _TtC18HealthExperienceUI45SummarySharingDataTypeSelectionViewController *result;

  *(_QWORD *)((char *)&self->super.super.super.super._responderFlags
            + OBJC_IVAR____TtC18HealthExperienceUI45SummarySharingDataTypeSelectionViewController_delegate) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI45SummarySharingDataTypeSelectionViewController_cancellables) = (Class)MEMORY[0x1E0DEE9D8];
  v5 = a3;

  result = (_TtC18HealthExperienceUI45SummarySharingDataTypeSelectionViewController *)sub_1A9A96970();
  __break(1u);
  return result;
}

- (void)cancel
{
  -[SummarySharingDataTypeSelectionViewController dismissViewControllerAnimated:completion:](self, sel_dismissViewControllerAnimated_completion_, 1, 0);
}

- (void)done
{
  _TtC18HealthExperienceUI45SummarySharingDataTypeSelectionViewController *v2;

  v2 = self;
  sub_1A981D330();

}

- (_TtC18HealthExperienceUI45SummarySharingDataTypeSelectionViewController)initWithCollectionViewLayout:(id)a3
{
  id v3;
  _TtC18HealthExperienceUI45SummarySharingDataTypeSelectionViewController *result;

  v3 = a3;
  result = (_TtC18HealthExperienceUI45SummarySharingDataTypeSelectionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self+ OBJC_IVAR____TtC18HealthExperienceUI45SummarySharingDataTypeSelectionViewController_healthExperienceStore);
  sub_1A961AEDC((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI45SummarySharingDataTypeSelectionViewController_delegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1A9623874((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI45SummarySharingDataTypeSelectionViewController_selectionFlow, type metadata accessor for SummarySharingSelectionFlow);
  swift_release();
  sub_1A961ACEC(*(void **)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC18HealthExperienceUI45SummarySharingDataTypeSelectionViewController_selectedContact));
  swift_release();
  swift_bridgeObjectRelease();
}

@end
