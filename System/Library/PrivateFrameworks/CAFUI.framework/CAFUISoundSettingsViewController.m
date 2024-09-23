@implementation CAFUISoundSettingsViewController

- (_TtC5CAFUI32CAFUISoundSettingsViewController)initWithCoder:(id)a3
{
  CAFUISoundSettingsViewController.init(coder:)(a3);
}

- (void)viewDidLoad
{
  char *v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for CAFUISoundSettingsViewController();
  v2 = (char *)v4.receiver;
  -[CAFUISoundSettingsViewController viewDidLoad](&v4, sel_viewDidLoad);
  v3 = *(void **)&v2[OBJC_IVAR____TtC5CAFUI32CAFUISoundSettingsViewController_segmentedControl];
  if (v3)
    objc_msgSend(v3, sel_addTarget_action_forControlEvents_, v2, sel_segmentedControlChangedWithSender_, 4096, v4.receiver, v4.super_class);
  CAFUISoundSettingsViewController.updateBarButtons()();
  CAFUISoundSettingsViewController.changePage(index:animated:)(0, 1);

}

- (void)segmentedControlChangedWithSender:(id)a3
{
  id v4;
  _TtC5CAFUI32CAFUISoundSettingsViewController *v5;

  v4 = a3;
  v5 = self;
  CAFUISoundSettingsViewController.changePage(index:animated:)((uint64_t)objc_msgSend(v4, sel_selectedSegmentIndex), 0);

}

- (_TtC5CAFUI32CAFUISoundSettingsViewController)initWithTransitionStyle:(int64_t)a3 navigationOrientation:(int64_t)a4 options:(id)a5
{
  _TtC5CAFUI32CAFUISoundSettingsViewController *result;

  result = (_TtC5CAFUI32CAFUISoundSettingsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI32CAFUISoundSettingsViewController_segmentedControl));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI32CAFUISoundSettingsViewController_audioLogo));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI32CAFUISoundSettingsViewController_resetButton));
  swift_bridgeObjectRelease();
}

@end
