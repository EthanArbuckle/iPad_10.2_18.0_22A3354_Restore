@implementation ArcadeDownloadPackSuggestionsViewController

- (void)didTapDoneButton
{
  _TtC22SubscribePageExtension43ArcadeDownloadPackSuggestionsViewController *v2;
  void *v3;
  _QWORD v4[6];

  v2 = self;
  dispatch thunk of ArcadeDownloadPackSuggestionsPagePresenter.didTapDoneButton()();
  v4[4] = sub_10013F3A0;
  v4[5] = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 1107296256;
  v4[2] = sub_1000BD6CC;
  v4[3] = &unk_10072A010;
  v3 = _Block_copy(v4);
  -[ArcadeDownloadPackSuggestionsViewController dismissViewControllerAnimated:completion:](v2, "dismissViewControllerAnimated:completion:", 1, v3);
  _Block_release(v3);

}

- (void)didTapGetAllButtonWithSender:(id)a3
{
  id v4;
  _TtC22SubscribePageExtension43ArcadeDownloadPackSuggestionsViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10013F5DC(v4);

}

- (void).cxx_destruct
{
  swift_release(*(_QWORD *)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC22SubscribePageExtension43ArcadeDownloadPackSuggestionsViewController_presenter]);

}

@end
