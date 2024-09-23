@implementation DataTypeDetailViewController

- (void)addDataTapped:(id)a3
{
  _TtC18HealthExperienceUI28DataTypeDetailViewController *v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE v7[32];
  _BYTE v8[32];

  swift_unknownObjectRetain();
  v4 = self;
  sub_1A9A96670();
  swift_unknownObjectRelease();
  sub_1A96238B0((uint64_t)v8, (uint64_t)v7);
  sub_1A96DCF14();
  if (swift_dynamicCast())
    v5 = v6;
  else
    v5 = 0;
  (*(void (**)(uint64_t, uint64_t))((*MEMORY[0x1E0DEEDD8] & (uint64_t)v4->super.super.super.super.super.isa)
                                           + 0x2C0))(1, v5);

  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
}

- (void)addDataKeyCommandFired
{
  _TtC18HealthExperienceUI28DataTypeDetailViewController *v2;
  id v3;

  v2 = self;
  v3 = sub_1A99340D8();
  (*(void (**)(uint64_t, id))((*MEMORY[0x1E0DEEDD8] & (uint64_t)v2->super.super.super.super.super.isa) + 0x2C0))(1, v3);

}

- (void)shareButtonTapped:(id)a3
{
  _TtC18HealthExperienceUI28DataTypeDetailViewController *v4;
  uint64_t v5;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1A9A96670();
  swift_unknownObjectRelease();
  sub_1A96DC580();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (_TtC18HealthExperienceUI28DataTypeDetailViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s18HealthExperienceUI28DataTypeDetailViewControllerC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)viewDidLoad
{
  _TtC18HealthExperienceUI28DataTypeDetailViewController *v2;

  v2 = self;
  sub_1A9934F24();

}

- (void)viewWillAppear:(BOOL)a3
{
  sub_1A9935420(self, (uint64_t)a2, a3, (const char **)&selRef_viewWillAppear_, (void (*)(char *))sub_1A99D7830);
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DataTypeDetailViewController();
  v4 = v5.receiver;
  -[CompoundDataSourceCollectionViewController viewDidAppear:](&v5, sel_viewDidAppear_, v3);
  objc_msgSend(v4, sel_becomeFirstResponder, v5.receiver, v5.super_class);

}

- (void)viewDidDisappear:(BOOL)a3
{
  sub_1A9935420(self, (uint64_t)a2, a3, (const char **)&selRef_viewDidDisappear_, (void (*)(char *))sub_1A99D7C08);
}

- (void)scrollViewDidScroll:(id)a3
{
  _TtC18HealthExperienceUI28DataTypeDetailViewController *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_1A9937488();

}

- (void)restoreUserActivityState:(id)a3
{
  _TtC18HealthExperienceUI28DataTypeDetailViewController *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_1A993553C(v5);

}

- (_TtC18HealthExperienceUI28DataTypeDetailViewController)initWithCollectionViewLayout:(id)a3
{
  id v3;
  _TtC18HealthExperienceUI28DataTypeDetailViewController *result;

  v3 = a3;
  result = (_TtC18HealthExperienceUI28DataTypeDetailViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1A976B28C((id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI28DataTypeDetailViewController_context));
  sub_1A9761AD0((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI28DataTypeDetailViewController_chartImageProvider, (uint64_t)&qword_1ED26F740, (uint64_t)&qword_1ED26F480, (uint64_t)&protocol descriptor for ChartImageProviding, (uint64_t (*)(_QWORD))sub_1A961F3D8);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI28DataTypeDetailViewController_restorationUserActivity));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI28DataTypeDetailViewController_hkType));
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI28DataTypeDetailViewController____lazy_storage___addDataButton));
}

- (void)onInternalSettingsGesture
{
  _TtC18HealthExperienceUI28DataTypeDetailViewController *v2;

  v2 = self;
  DataTypeDetailViewController.onInternalSettingsGesture()();

}

- (NSString)description
{
  _TtC18HealthExperienceUI28DataTypeDetailViewController *v2;
  void *v3;

  v2 = self;
  DataTypeDetailViewController.description.getter();

  v3 = (void *)sub_1A9A9580C();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)ttrButtonTapped
{
  _TtC18HealthExperienceUI28DataTypeDetailViewController *v2;

  v2 = self;
  sub_1A9933F60();
  sub_1A9892AB4();

  swift_release();
}

@end
