@implementation AuthenticateAccountsStartViewController

- (void)viewDidLoad
{
  _TtC18SharingViewService39AuthenticateAccountsStartViewController *v2;

  v2 = self;
  sub_10008FA04();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC18SharingViewService39AuthenticateAccountsStartViewController *v4;

  v4 = self;
  sub_10008FDE0(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC18SharingViewService39AuthenticateAccountsStartViewController *v4;

  v4 = self;
  sub_10008FF88(a3);

}

- (_TtC18SharingViewService39AuthenticateAccountsStartViewController)initWithContentView:(id)a3
{
  id v3;
  _TtC18SharingViewService39AuthenticateAccountsStartViewController *result;

  v3 = a3;
  result = (_TtC18SharingViewService39AuthenticateAccountsStartViewController *)_swift_stdlib_reportUnimplementedInitializer("SharingViewService.AuthenticateAccountsStartViewController", 58, "init(contentView:)", 18, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  _OWORD v8[8];
  uint64_t v9;

  v3 = *(_OWORD *)&self->viewModel[OBJC_IVAR____TtC18SharingViewService39AuthenticateAccountsStartViewController_viewModel
                                 + 104];
  v8[6] = *(_OWORD *)&self->viewModel[OBJC_IVAR____TtC18SharingViewService39AuthenticateAccountsStartViewController_viewModel
                                    + 88];
  v8[7] = v3;
  v9 = *(_QWORD *)&self->viewModel[OBJC_IVAR____TtC18SharingViewService39AuthenticateAccountsStartViewController_viewModel
                                 + 120];
  v4 = *(_OWORD *)&self->viewModel[OBJC_IVAR____TtC18SharingViewService39AuthenticateAccountsStartViewController_viewModel
                                 + 40];
  v8[2] = *(_OWORD *)&self->viewModel[OBJC_IVAR____TtC18SharingViewService39AuthenticateAccountsStartViewController_viewModel
                                    + 24];
  v8[3] = v4;
  v5 = *(_OWORD *)&self->viewModel[OBJC_IVAR____TtC18SharingViewService39AuthenticateAccountsStartViewController_viewModel
                                 + 72];
  v8[4] = *(_OWORD *)&self->viewModel[OBJC_IVAR____TtC18SharingViewService39AuthenticateAccountsStartViewController_viewModel
                                    + 56];
  v8[5] = v5;
  v6 = *(_OWORD *)&self->viewModel[OBJC_IVAR____TtC18SharingViewService39AuthenticateAccountsStartViewController_viewModel
                                 + 8];
  v8[0] = *(_OWORD *)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC18SharingViewService39AuthenticateAccountsStartViewController_viewModel];
  v8[1] = v6;
  sub_10007F100(v8);
  sub_100013338((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC18SharingViewService39AuthenticateAccountsStartViewController_presenter], v7);
}

@end
