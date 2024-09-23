@implementation AuthenticateAccountsStartViewController

- (void)viewDidLoad
{
  _TtC14AppleIDSetupUI39AuthenticateAccountsStartViewController *v2;

  v2 = self;
  sub_236725E20();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC14AppleIDSetupUI39AuthenticateAccountsStartViewController *v4;

  v4 = self;
  sub_2367261E8(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v4;

  v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for AuthenticateAccountsStartViewController();
  -[AuthenticateAccountsStartViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, v3);
}

- (_TtC14AppleIDSetupUI39AuthenticateAccountsStartViewController)initWithContentView:(id)a3
{
  sub_23672669C((uint64_t)self, (uint64_t)a2, a3);
}

- (void).cxx_destruct
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  _OWORD v6[8];
  uint64_t v7;

  v2 = *(_OWORD *)((char *)&self->super.super._childModalViewControllers
                 + OBJC_IVAR____TtC14AppleIDSetupUI39AuthenticateAccountsStartViewController_viewModel);
  v6[6] = *(_OWORD *)((char *)&self->super.super._nibBundle
                    + OBJC_IVAR____TtC14AppleIDSetupUI39AuthenticateAccountsStartViewController_viewModel);
  v6[7] = v2;
  v7 = *(uint64_t *)((char *)&self->super.super._previousRootViewController
                  + OBJC_IVAR____TtC14AppleIDSetupUI39AuthenticateAccountsStartViewController_viewModel);
  v3 = *(_OWORD *)((char *)&self->super.super._tab
                 + OBJC_IVAR____TtC14AppleIDSetupUI39AuthenticateAccountsStartViewController_viewModel);
  v6[2] = *(_OWORD *)((char *)&self->super.super._view
                    + OBJC_IVAR____TtC14AppleIDSetupUI39AuthenticateAccountsStartViewController_viewModel);
  v6[3] = v3;
  v4 = *(_OWORD *)((char *)&self->super.super._title
                 + OBJC_IVAR____TtC14AppleIDSetupUI39AuthenticateAccountsStartViewController_viewModel);
  v6[4] = *(_OWORD *)((char *)&self->super.super._navigationItem
                    + OBJC_IVAR____TtC14AppleIDSetupUI39AuthenticateAccountsStartViewController_viewModel);
  v6[5] = v4;
  v5 = *(_OWORD *)((char *)&self->super.super.super.__layeringSceneIdentity
                 + OBJC_IVAR____TtC14AppleIDSetupUI39AuthenticateAccountsStartViewController_viewModel);
  v6[0] = *(_OWORD *)((char *)&self->super.super.super.super.isa
                    + OBJC_IVAR____TtC14AppleIDSetupUI39AuthenticateAccountsStartViewController_viewModel);
  v6[1] = v5;
  sub_2367277E0((uint64_t)v6);
  swift_release();
  swift_release();
}

@end
