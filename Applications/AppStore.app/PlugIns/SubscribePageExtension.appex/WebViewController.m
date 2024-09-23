@implementation WebViewController

- (_TtC22SubscribePageExtension17WebViewController)initWithBag:(id)a3 account:(id)a4 clientInfo:(id)a5
{
  _TtC22SubscribePageExtension17WebViewController *result;

  result = (_TtC22SubscribePageExtension17WebViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD00000000000001BLL, 0x8000000100649950, "SubscribePageExtension/WebViewController.swift", 46, 2, 37, 0);
  __break(1u);
  return result;
}

- (_TtC22SubscribePageExtension17WebViewController)initWithCoder:(id)a3
{
  _TtC22SubscribePageExtension17WebViewController *result;

  result = (_TtC22SubscribePageExtension17WebViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/WebViewController.swift", 46, 2, 42, 0);
  __break(1u);
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  sub_1003E54F8(self, (uint64_t)a2, a3, (const char **)&selRef_viewWillAppear_, (SEL *)&selRef_beginDelayingNotifications);
}

- (void)viewDidDisappear:(BOOL)a3
{
  sub_1003E54F8(self, (uint64_t)a2, a3, (const char **)&selRef_viewDidDisappear_, (SEL *)&selRef_endDelayingNotifications);
}

- (void)webViewController:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _TtC22SubscribePageExtension17WebViewController *v12;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject(&unk_10073DE80, 24, 7);
  *(_QWORD *)(v9 + 16) = v8;
  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_1003E5A28((uint64_t)v11, (uint64_t)sub_1003E5B68, v9, (uint64_t (*)(uint64_t))&URLProtocolDelegate.performAuthentication(for:), (uint64_t)sub_1003E55C4, (uint64_t)&unk_10073DEC0);

  swift_release(v9);
}

- (BOOL)webViewController:(id)a3 handleDelegateAction:(id)a4 completion:(id)a5
{
  void *v5;

  v5 = _Block_copy(a5);
  _Block_release(v5);
  return 0;
}

- (void)webViewController:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _TtC22SubscribePageExtension17WebViewController *v12;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject(&unk_10073DE58, 24, 7);
  *(_QWORD *)(v9 + 16) = v8;
  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_1003E5A28((uint64_t)v11, (uint64_t)sub_1003E5B38, v9, (uint64_t (*)(uint64_t))&URLProtocolDelegate.presentDialog(for:), (uint64_t)sub_1003E55C4, (uint64_t)&unk_10073DE98);

  swift_release(v9);
}

- (void).cxx_destruct
{

}

@end
