@implementation CameraScannerFlowViewController

- (_TtC18HealthExperienceUI31CameraScannerFlowViewController)init
{
  return (_TtC18HealthExperienceUI31CameraScannerFlowViewController *)CameraScannerFlowViewController.init()();
}

- (_TtC18HealthExperienceUI31CameraScannerFlowViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s18HealthExperienceUI31CameraScannerFlowViewControllerC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)viewDidLoad
{
  _TtC18HealthExperienceUI31CameraScannerFlowViewController *v2;

  v2 = self;
  sub_1A9A11808();

}

- (void)viewDidAppear:(BOOL)a3
{
  sub_1A9A11CF8(self, (uint64_t)a2, a3, (const char **)&selRef_viewDidAppear_, (uint64_t)&unk_1E559C858, (uint64_t)sub_1A9A137D4, (uint64_t)&block_descriptor_67);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  _QWORD *v4;
  id v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CameraScannerFlowViewController();
  v4 = v6.receiver;
  v5 = -[CameraScannerFlowViewController viewWillAppear:](&v6, sel_viewWillAppear_, v3);
  (*(void (**)(id))((*MEMORY[0x1E0DEEDD8] & *v4) + 0x120))(v5);

}

- (void)viewWillDisappear:(BOOL)a3
{
  sub_1A9A11CF8(self, (uint64_t)a2, a3, (const char **)&selRef_viewWillDisappear_, (uint64_t)&unk_1E559C808, (uint64_t)sub_1A9A137CC, (uint64_t)&block_descriptor_60_0);
}

- (void)viewDidLayoutSubviews
{
  _TtC18HealthExperienceUI31CameraScannerFlowViewController *v2;

  v2 = self;
  sub_1A9A11DF8();

}

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)onClose
{
  -[CameraScannerFlowViewController dismissViewControllerAnimated:completion:](self, sel_dismissViewControllerAnimated_completion_, 1, 0);
}

- (void)tapToRadarButtonTappedWithSender:(id)a3
{
  _TtC18HealthExperienceUI31CameraScannerFlowViewController *v4;
  uint64_t v5;

  swift_unknownObjectRetain();
  v4 = self;
  sub_1A9A96670();

  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (_TtC18HealthExperienceUI31CameraScannerFlowViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC18HealthExperienceUI31CameraScannerFlowViewController *result;

  v4 = a4;
  result = (_TtC18HealthExperienceUI31CameraScannerFlowViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI31CameraScannerFlowViewController_loadingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI31CameraScannerFlowViewController_introductionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI31CameraScannerFlowViewController____lazy_storage___dataScannerViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI31CameraScannerFlowViewController____lazy_storage___closeButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI31CameraScannerFlowViewController____lazy_storage___tapToRadarButton));
}

@end
