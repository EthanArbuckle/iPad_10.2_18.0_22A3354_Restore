@implementation FeedItemSuggestedActionViewController

- (_TtC18HealthExperienceUI37FeedItemSuggestedActionViewController)initWithCoder:(id)a3
{
  id v5;
  _TtC18HealthExperienceUI37FeedItemSuggestedActionViewController *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI37FeedItemSuggestedActionViewController_dataSourceAdaptor) = 0;
  *(_QWORD *)((char *)&self->super.super.super._responderFlags
            + OBJC_IVAR____TtC18HealthExperienceUI37FeedItemSuggestedActionViewController_suggestedActionDelegate) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI37FeedItemSuggestedActionViewController____lazy_storage___dataSource) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI37FeedItemSuggestedActionViewController____lazy_storage___layout) = 0;
  v5 = a3;

  result = (_TtC18HealthExperienceUI37FeedItemSuggestedActionViewController *)sub_1A9A96970();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC18HealthExperienceUI37FeedItemSuggestedActionViewController *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v7;

  swift_getObjectType();
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for FeedItemSuggestedActionViewController();
  v3 = self;
  -[FeedItemSuggestedActionViewController viewDidLoad](&v7, sel_viewDidLoad);
  sub_1A967A524();
  sub_1A961ADFC();
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1A9AA1EA0;
  v5 = sub_1A9A94360();
  v6 = MEMORY[0x1E0DC29B0];
  *(_QWORD *)(v4 + 32) = v5;
  *(_QWORD *)(v4 + 40) = v6;
  sub_1A9A95F80();

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)viewWillLayoutSubviews
{
  _TtC18HealthExperienceUI37FeedItemSuggestedActionViewController *v2;

  v2 = self;
  sub_1A967A400();

}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  _TtC18HealthExperienceUI37FeedItemSuggestedActionViewController *v14;
  uint64_t v15;

  v8 = sub_1A9A921DC();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9A9217C();
  v12 = a3;
  v13 = a4;
  v14 = self;
  sub_1A967AA74();

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (_TtC18HealthExperienceUI37FeedItemSuggestedActionViewController)initWithCollectionViewLayout:(id)a3
{
  id v3;
  _TtC18HealthExperienceUI37FeedItemSuggestedActionViewController *result;

  v3 = a3;
  result = (_TtC18HealthExperienceUI37FeedItemSuggestedActionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC18HealthExperienceUI37FeedItemSuggestedActionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC18HealthExperienceUI37FeedItemSuggestedActionViewController *result;

  v4 = a4;
  result = (_TtC18HealthExperienceUI37FeedItemSuggestedActionViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI37FeedItemSuggestedActionViewController_suggestedAction;
  v4 = sub_1A9A92D4C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI37FeedItemSuggestedActionViewController_pinnedContentManager);
  sub_1A961AEDC((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI37FeedItemSuggestedActionViewController_suggestedActionDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI37FeedItemSuggestedActionViewController____lazy_storage___dataSource));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI37FeedItemSuggestedActionViewController____lazy_storage___layout));
}

@end
