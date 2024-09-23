@implementation CategoryViewController

- (NSString)sidebarSelectionIdentifier
{
  _TtC18HealthExperienceUI22CategoryViewController *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  sub_1A990D28C();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1A9A9580C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (_TtC18HealthExperienceUI22CategoryViewController)initWithCoder:(id)a3
{
  _QWORD *v5;
  id v6;
  id v7;
  _TtC18HealthExperienceUI22CategoryViewController *result;

  v5 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC18HealthExperienceUI22CategoryViewController_gradientView);
  type metadata accessor for CategoryGradientView();
  v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v7 = a3;
  *v5 = objc_msgSend(v6, sel_init);
  v5[1] = &protocol witness table for CategoryGradientView;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI22CategoryViewController_gradientSubscriber) = 0;

  result = (_TtC18HealthExperienceUI22CategoryViewController *)sub_1A9A96970();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC18HealthExperienceUI22CategoryViewController *v2;

  v2 = self;
  sub_1A990DAB4();

}

- (void)viewIsAppearing:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for CategoryViewController();
  v4 = v9.receiver;
  -[CompoundDataSourceCollectionViewController viewIsAppearing:](&v9, sel_viewIsAppearing_, v3);
  v5 = (uint64_t)v4 + OBJC_IVAR____TtC18HealthExperienceUI22CategoryViewController_gradientColorProvider;
  swift_beginAccess();
  sub_1A961C0DC(v5, (uint64_t)v8);
  v6 = v8[4];
  __swift_project_boxed_opaque_existential_1(v8, v8[3]);
  v7 = objc_msgSend(v4, sel_traitCollection);
  (*(void (**)(void))(v6 + 16))();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
}

- (void)viewWillLayoutSubviews
{
  _TtC18HealthExperienceUI22CategoryViewController *v2;

  v2 = self;
  sub_1A990DD10();

}

- (void)observedTraitsDidChangeWithTraitEnvironment:(id)a3 previousTraitCollection:(id)a4
{
  id v7;
  _TtC18HealthExperienceUI22CategoryViewController *v8;

  swift_unknownObjectRetain();
  v7 = a4;
  v8 = self;
  sub_1A97AE664(a3, (uint64_t)v7);
  swift_unknownObjectRelease();

}

- (void)restoreUserActivityState:(id)a3
{
  id v4;
  _TtC18HealthExperienceUI22CategoryViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1A990E5B0(v4);

}

- (_TtC18HealthExperienceUI22CategoryViewController)initWithCollectionViewLayout:(id)a3
{
  id v3;
  _TtC18HealthExperienceUI22CategoryViewController *result;

  v3 = a3;
  result = (_TtC18HealthExperienceUI22CategoryViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI22CategoryViewController_healthExperienceStore);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI22CategoryViewController_providedHealthStore));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI22CategoryViewController_pinnedContentManager);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI22CategoryViewController_gradientView));
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI22CategoryViewController_gradientColorProvider);
  swift_release();
}

@end
