@implementation ArcadeDownloadPackCategoriesViewController

- (void)viewDidLoad
{
  id v2;
  id v3;
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType(self, a2);
  v2 = v5.receiver;
  -[ArcadeDownloadPackViewController viewDidLoad](&v5, "viewDidLoad");
  objc_msgSend(v2, "setModalInPresentation:", 1, v5.receiver, v5.super_class);
  v3 = objc_msgSend(v2, "navigationItem");
  objc_msgSend(v3, "setHidesBackButton:", 1);

  v4 = objc_msgSend(v2, "navigationItem");
  objc_msgSend(v4, "setBackButtonDisplayMode:", 1);

}

- (void)didTapContinueButton
{
  _TtC8AppStore42ArcadeDownloadPackCategoriesViewController *v2;

  v2 = self;
  dispatch thunk of ArcadeDownloadPackCategoriesPagePresenter.didTapContinueButton()();

}

- (void)didTapSkipButton
{
  _TtC8AppStore42ArcadeDownloadPackCategoriesViewController *v2;

  v2 = self;
  dispatch thunk of ArcadeDownloadPackCategoriesPagePresenter.didTapSkipButton()();
  -[ArcadeDownloadPackCategoriesViewController dismissViewControllerAnimated:completion:](v2, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void).cxx_destruct
{
  swift_release(*(_QWORD *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC8AppStore42ArcadeDownloadPackCategoriesViewController_presenter]);

}

@end
