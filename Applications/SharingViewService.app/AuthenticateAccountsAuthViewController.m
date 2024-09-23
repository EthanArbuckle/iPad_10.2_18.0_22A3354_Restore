@implementation AuthenticateAccountsAuthViewController

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AuthenticateAccountsAuthViewController();
  v4 = v5.receiver;
  -[AuthenticateAccountsAuthViewController viewWillAppear:](&v5, "viewWillAppear:", v3);
  sub_1000ABAF8();

}

- (void)didCompleteTextEntry:(id)a3
{
  id v4;
  _TtC18SharingViewService38AuthenticateAccountsAuthViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1000AB9EC(v4);

}

- (_TtC18SharingViewService38AuthenticateAccountsAuthViewController)initWithContentView:(id)a3
{
  id v3;
  _TtC18SharingViewService38AuthenticateAccountsAuthViewController *result;

  v3 = a3;
  result = (_TtC18SharingViewService38AuthenticateAccountsAuthViewController *)_swift_stdlib_reportUnimplementedInitializer("SharingViewService.AuthenticateAccountsAuthViewController", 57, "init(contentView:)", 18, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  unsigned __int8 *v3;
  uint64_t v4;

  sub_100013338((uint64_t)&self->PRXPasscodeEntryViewController_opaque[OBJC_IVAR____TtC18SharingViewService38AuthenticateAccountsAuthViewController_presenter], (uint64_t)a2);
  v3 = &self->PRXPasscodeEntryViewController_opaque[OBJC_IVAR____TtC18SharingViewService38AuthenticateAccountsAuthViewController_viewModel];
  v4 = *(_QWORD *)&self->presenter[OBJC_IVAR____TtC18SharingViewService38AuthenticateAccountsAuthViewController_viewModel];
  swift_bridgeObjectRelease(*((_QWORD *)v3 + 3));
  swift_bridgeObjectRelease(v4);
}

@end
