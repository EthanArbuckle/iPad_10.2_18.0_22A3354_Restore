@implementation InstallWalletRemoteViewController

- (void)viewWillAppear:(BOOL)a3
{
  _TtC16FinanceUIService33InstallWalletRemoteViewController *v4;

  v4 = self;
  sub_100005370(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  uint64_t v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for InstallWalletRemoteViewController(0);
  v4 = (char *)v6.receiver;
  -[InstallWalletRemoteViewController viewWillDisappear:](&v6, "viewWillDisappear:", v3);
  v5 = *(_QWORD *)&v4[OBJC_IVAR____TtC16FinanceUIService33InstallWalletRemoteViewController_daemonConnection];
  if (v5)
  {
    swift_retain(*(_QWORD *)&v4[OBJC_IVAR____TtC16FinanceUIService33InstallWalletRemoteViewController_daemonConnection]);
    ClientToServiceXPCConnection<>.cancelled()();

    swift_release(v5);
  }
  else
  {

  }
}

- (void)loadView
{
  id v3;
  _TtC16FinanceUIService33InstallWalletRemoteViewController *v4;
  id v5;
  id v6;
  id v7;

  v3 = objc_allocWithZone((Class)UIView);
  v4 = self;
  v5 = objc_msgSend(v3, "init");
  -[InstallWalletRemoteViewController setView:](v4, "setView:", v5);

  v6 = -[InstallWalletRemoteViewController view](v4, "view");
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v6, "setHidden:", 1);

  }
  else
  {
    __break(1u);
  }
}

- (void)dealloc
{
  _TtC16FinanceUIService33InstallWalletRemoteViewController *v3;
  _TtC16FinanceUIService33InstallWalletRemoteViewController *v4;
  objc_super v5;
  uint64_t v6;

  if (*(_QWORD *)&self->_anon_0[OBJC_IVAR____TtC16FinanceUIService33InstallWalletRemoteViewController_daemonConnection])
  {
    v6 = *(_QWORD *)&self->_anon_0[OBJC_IVAR____TtC16FinanceUIService33InstallWalletRemoteViewController_daemonConnection];
    v3 = self;
    sub_100004890(&qword_1000153A0);
    sub_100005E1C();
    FinanceXPCConnection.invalidate()();
  }
  else
  {
    v4 = self;
  }
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for InstallWalletRemoteViewController(0);
  -[InstallWalletRemoteViewController dealloc](&v5, "dealloc");
}

- (void).cxx_destruct
{
  unsigned __int8 *v3;
  uint64_t v4;

  v3 = &self->_anon_0[OBJC_IVAR____TtC16FinanceUIService33InstallWalletRemoteViewController_log];
  v4 = type metadata accessor for Logger(0, a2);
  (*(void (**)(unsigned __int8 *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  swift_release(*(_QWORD *)&self->_anon_0[OBJC_IVAR____TtC16FinanceUIService33InstallWalletRemoteViewController_daemonConnection]);
}

- (_TtC16FinanceUIService33InstallWalletRemoteViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3, a2);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC16FinanceUIService33InstallWalletRemoteViewController *)sub_100005B60(v5, v7, a4);
}

- (_TtC16FinanceUIService33InstallWalletRemoteViewController)initWithCoder:(id)a3
{
  return (_TtC16FinanceUIService33InstallWalletRemoteViewController *)sub_100005CBC(a3);
}

@end
