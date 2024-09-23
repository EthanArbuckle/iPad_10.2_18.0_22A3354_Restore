@implementation ScreenViewModelTrackingViewController

- (void)viewIsAppearing:(BOOL)a3
{
  _TtC27ActionButtonConfigurationUI37ScreenViewModelTrackingViewController *v4;

  v4 = self;
  sub_235E446A4(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC27ActionButtonConfigurationUI37ScreenViewModelTrackingViewController *v4;

  v4 = self;
  sub_235E4474C(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC27ActionButtonConfigurationUI37ScreenViewModelTrackingViewController *v4;

  v4 = self;
  sub_235E447F4(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC27ActionButtonConfigurationUI37ScreenViewModelTrackingViewController *v4;

  v4 = self;
  sub_235E4489C(a3);

}

- (void)presentationController:(id)a3 willPresentWithAdaptiveStyle:(int64_t)a4 transitionCoordinator:(id)a5
{
  id v8;
  _TtC27ActionButtonConfigurationUI37ScreenViewModelTrackingViewController *v9;

  v8 = a3;
  swift_unknownObjectRetain();
  v9 = self;
  sub_235E44DDC(a4, a5);

  swift_unknownObjectRelease();
}

- (void)presentationControllerWillDismiss:(id)a3
{
  id v4;
  _TtC27ActionButtonConfigurationUI37ScreenViewModelTrackingViewController *v5;

  v4 = a3;
  v5 = self;
  sub_235E439D8(v4);

}

- (_TtC27ActionButtonConfigurationUI37ScreenViewModelTrackingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _TtC27ActionButtonConfigurationUI37ScreenViewModelTrackingViewController *v9;
  objc_super v11;

  if (a3)
  {
    sub_235E6104C();
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC27ActionButtonConfigurationUI37ScreenViewModelTrackingViewController_viewModel) = 0;
    v6 = a4;
    v7 = (void *)sub_235E61028();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC27ActionButtonConfigurationUI37ScreenViewModelTrackingViewController_viewModel) = 0;
    v8 = a4;
    v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for ScreenViewModelTrackingViewController();
  v9 = -[ScreenViewModelTrackingViewController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, v7, a4);

  return v9;
}

- (_TtC27ActionButtonConfigurationUI37ScreenViewModelTrackingViewController)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC27ActionButtonConfigurationUI37ScreenViewModelTrackingViewController_viewModel) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ScreenViewModelTrackingViewController();
  return -[ScreenViewModelTrackingViewController initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  swift_release();
}

@end
