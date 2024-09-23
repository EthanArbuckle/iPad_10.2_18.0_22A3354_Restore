@implementation ArcadeDownloadPackSuggestionsViewController

- (void)didTapDoneButton
{
  _TtC8AppStore43ArcadeDownloadPackSuggestionsViewController *v2;
  void *v3;
  _QWORD v4[6];

  v2 = self;
  dispatch thunk of ArcadeDownloadPackSuggestionsPagePresenter.didTapDoneButton()();
  v4[4] = sub_10037EC6C;
  v4[5] = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 1107296256;
  v4[2] = sub_10000AB18;
  v4[3] = &unk_10076E710;
  v3 = _Block_copy(v4);
  -[ArcadeDownloadPackSuggestionsViewController dismissViewControllerAnimated:completion:](v2, "dismissViewControllerAnimated:completion:", 1, v3);
  _Block_release(v3);

}

- (void)didTapGetAllButtonWithSender:(id)a3
{
  id v4;
  _TtC8AppStore43ArcadeDownloadPackSuggestionsViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10037EEA8(v4);

}

- (void).cxx_destruct
{
  swift_release(*(_QWORD *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC8AppStore43ArcadeDownloadPackSuggestionsViewController_presenter]);

}

@end
