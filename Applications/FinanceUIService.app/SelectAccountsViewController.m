@implementation SelectAccountsViewController

- (void)viewWillAppear:(BOOL)a3
{
  _TtC16FinanceUIService28SelectAccountsViewController *v4;

  v4 = self;
  sub_100008C88(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  uint64_t v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for SelectAccountsViewController(0);
  v4 = (char *)v6.receiver;
  -[SelectAccountsViewController viewWillDisappear:](&v6, "viewWillDisappear:", v3);
  v5 = *(_QWORD *)&v4[OBJC_IVAR____TtC16FinanceUIService28SelectAccountsViewController_daemonConnection];
  if (v5)
  {
    swift_retain(*(_QWORD *)&v4[OBJC_IVAR____TtC16FinanceUIService28SelectAccountsViewController_daemonConnection]);
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
  _TtC16FinanceUIService28SelectAccountsViewController *v4;
  id v5;
  id v6;
  id v7;

  v3 = objc_allocWithZone((Class)UIView);
  v4 = self;
  v5 = objc_msgSend(v3, "init");
  -[SelectAccountsViewController setView:](v4, "setView:", v5);

  v6 = -[SelectAccountsViewController view](v4, "view");
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
  _TtC16FinanceUIService28SelectAccountsViewController *v3;
  _TtC16FinanceUIService28SelectAccountsViewController *v4;
  objc_super v5;
  uint64_t v6;

  if (*(_QWORD *)&self->_anon_0[OBJC_IVAR____TtC16FinanceUIService28SelectAccountsViewController_daemonConnection])
  {
    v6 = *(_QWORD *)&self->_anon_0[OBJC_IVAR____TtC16FinanceUIService28SelectAccountsViewController_daemonConnection];
    v3 = self;
    sub_100004890(&qword_1000153E8);
    sub_100006C30();
    FinanceXPCConnection.invalidate()();
  }
  else
  {
    v4 = self;
  }
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SelectAccountsViewController(0);
  -[SelectAccountsViewController dealloc](&v5, "dealloc");
}

- (void).cxx_destruct
{
  unsigned __int8 *v3;
  uint64_t v4;

  v3 = &self->_anon_0[OBJC_IVAR____TtC16FinanceUIService28SelectAccountsViewController_log];
  v4 = type metadata accessor for Logger(0, a2);
  (*(void (**)(unsigned __int8 *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_100008504(*(id *)&self->_anon_0[OBJC_IVAR____TtC16FinanceUIService28SelectAccountsViewController_controllerState]);
  swift_release(*(_QWORD *)&self->_anon_0[OBJC_IVAR____TtC16FinanceUIService28SelectAccountsViewController_daemonConnection]);
}

- (_TtC16FinanceUIService28SelectAccountsViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC16FinanceUIService28SelectAccountsViewController *)sub_100009B8C(v5, v7, a4);
}

- (_TtC16FinanceUIService28SelectAccountsViewController)initWithCoder:(id)a3
{
  return (_TtC16FinanceUIService28SelectAccountsViewController *)sub_100009CE8(a3);
}

@end
