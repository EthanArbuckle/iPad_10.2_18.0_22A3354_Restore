@implementation WebReportViewController

- (_TtC28HealthExposureNotificationUI23WebReportViewController)initWithAgencyModel:(id)a3
{
  id v4;
  _TtC28HealthExposureNotificationUI23WebReportViewController *v5;

  v4 = a3;
  v5 = (_TtC28HealthExposureNotificationUI23WebReportViewController *)sub_21CD0AD24(a3);

  return v5;
}

- (_TtC28HealthExposureNotificationUI23WebReportViewController)initWithCoder:(id)a3
{
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  _TtC28HealthExposureNotificationUI23WebReportViewController *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC28HealthExposureNotificationUI23WebReportViewController____lazy_storage___webView) = 0;
  v5 = OBJC_IVAR____TtC28HealthExposureNotificationUI23WebReportViewController_statusView;
  v6 = (void *)objc_opt_self();
  v7 = a3;
  v8 = objc_msgSend(v6, sel_systemBackgroundColor);
  v9 = objc_allocWithZone((Class)type metadata accessor for LoadingStatusView());
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)LoadingStatusView.init(with:backgroundColor:)(0, 0xE000000000000000, v8);

  result = (_TtC28HealthExposureNotificationUI23WebReportViewController *)sub_21CD768EC();
  __break(1u);
  return result;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (BOOL)shouldAutorotate
{
  return 0;
}

- (void)viewDidLoad
{
  _TtC28HealthExposureNotificationUI23WebReportViewController *v2;

  v2 = self;
  WebReportViewController.viewDidLoad()();

}

- (void)didTapDone
{
  -[WebReportViewController dismissViewControllerAnimated:completion:](self, sel_dismissViewControllerAnimated_completion_, 1, 0);
}

- (_TtC28HealthExposureNotificationUI23WebReportViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC28HealthExposureNotificationUI23WebReportViewController *result;

  v4 = a4;
  result = (_TtC28HealthExposureNotificationUI23WebReportViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI23WebReportViewController_healthAgencyModel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI23WebReportViewController____lazy_storage___webView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI23WebReportViewController_statusView));
}

- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4
{
  id v6;
  id v7;
  _TtC28HealthExposureNotificationUI23WebReportViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_21CD0AF10(v7);

}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  void *v8;
  id v9;
  id v10;
  _TtC28HealthExposureNotificationUI23WebReportViewController *v11;

  v8 = _Block_copy(a5);
  _Block_copy(v8);
  v9 = a3;
  v10 = a4;
  v11 = self;
  sub_21CD0B2A4(v10, (uint64_t)v8);
  _Block_release(v8);
  _Block_release(v8);

}

- (void)webView:(id)a3 decidePolicyForNavigationResponse:(id)a4 decisionHandler:(id)a5
{
  void *v8;
  id v9;
  id v10;
  _TtC28HealthExposureNotificationUI23WebReportViewController *v11;

  v8 = _Block_copy(a5);
  _Block_copy(v8);
  v9 = a3;
  v10 = a4;
  v11 = self;
  sub_21CD0B584(v10, (uint64_t)v11, (uint64_t)v8);
  _Block_release(v8);
  _Block_release(v8);

}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
  id v8;
  id v9;
  _TtC28HealthExposureNotificationUI23WebReportViewController *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v11 = a5;
  v10 = self;
  sub_21CD0B77C(v11);

}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  char *v6;
  void *v7;
  id v8;
  id v9;
  _TtC28HealthExposureNotificationUI23WebReportViewController *v10;

  v6 = *(char **)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC28HealthExposureNotificationUI23WebReportViewController_statusView);
  v7 = *(void **)&v6[OBJC_IVAR____TtC28HealthExposureNotificationUI17LoadingStatusView_spinnerView];
  v8 = a3;
  v9 = a4;
  v10 = self;
  objc_msgSend(v7, sel_stopAnimating);
  objc_msgSend(v6, sel_setHidden_, 1);

}

@end
