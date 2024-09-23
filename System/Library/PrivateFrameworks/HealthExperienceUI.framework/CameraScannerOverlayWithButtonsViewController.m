@implementation CameraScannerOverlayWithButtonsViewController

- (void)viewDidLoad
{
  _TtC18HealthExperienceUI45CameraScannerOverlayWithButtonsViewController *v2;

  v2 = self;
  sub_1A97104DC();

}

- (void)hxui_primaryFooterButtonTapped
{
  _TtC18HealthExperienceUI45CameraScannerOverlayWithButtonsViewController *v2;

  v2 = self;
  sub_1A971068C(&OBJC_IVAR____TtC18HealthExperienceUI45CameraScannerOverlayWithButtonsViewController_actionHandler, "[%{public}s] Primary button pressed without a handler");

}

- (void)hxui_secondaryFooterButtonTapped
{
  _TtC18HealthExperienceUI45CameraScannerOverlayWithButtonsViewController *v2;

  v2 = self;
  sub_1A971068C(&OBJC_IVAR____TtC18HealthExperienceUI45CameraScannerOverlayWithButtonsViewController_cancelHandler, "[%{public}s] Cancel button pressed without a handler");

}

- (_TtC18HealthExperienceUI45CameraScannerOverlayWithButtonsViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  _TtC18HealthExperienceUI45CameraScannerOverlayWithButtonsViewController *result;

  result = (_TtC18HealthExperienceUI45CameraScannerOverlayWithButtonsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC18HealthExperienceUI45CameraScannerOverlayWithButtonsViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6;
  _TtC18HealthExperienceUI45CameraScannerOverlayWithButtonsViewController *result;

  v6 = a5;
  result = (_TtC18HealthExperienceUI45CameraScannerOverlayWithButtonsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI45CameraScannerOverlayWithButtonsViewController_primaryButtonImage));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI45CameraScannerOverlayWithButtonsViewController_primaryButton));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI45CameraScannerOverlayWithButtonsViewController_cancelButton));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI45CameraScannerOverlayWithButtonsViewController_contentHeaderView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI45CameraScannerOverlayWithButtonsViewController_topPaddingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI45CameraScannerOverlayWithButtonsViewController_customContentView));
  sub_1A9642C9C(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                           + OBJC_IVAR____TtC18HealthExperienceUI45CameraScannerOverlayWithButtonsViewController_actionHandler));
  sub_1A9642C9C(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                           + OBJC_IVAR____TtC18HealthExperienceUI45CameraScannerOverlayWithButtonsViewController_cancelHandler));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI45CameraScannerOverlayWithButtonsViewController_overlayView));
}

@end
