@implementation WebViewController

- (_TtC20ProductPageExtension17WebViewController)initWithBag:(id)a3 account:(id)a4 clientInfo:(id)a5
{
  _TtC20ProductPageExtension17WebViewController *result;

  result = (_TtC20ProductPageExtension17WebViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD00000000000001BLL, 0x80000001006AF040, "ProductPageExtension/WebViewController.swift", 44, 2, 37, 0);
  __break(1u);
  return result;
}

- (_TtC20ProductPageExtension17WebViewController)initWithCoder:(id)a3
{
  _TtC20ProductPageExtension17WebViewController *result;

  result = (_TtC20ProductPageExtension17WebViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/WebViewController.swift", 44, 2, 42, 0);
  __break(1u);
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  sub_1005C14A4(self, (uint64_t)a2, a3, (const char **)&selRef_viewWillAppear_, (SEL *)&selRef_beginDelayingNotifications);
}

- (void)viewDidDisappear:(BOOL)a3
{
  sub_1005C14A4(self, (uint64_t)a2, a3, (const char **)&selRef_viewDidDisappear_, (SEL *)&selRef_endDelayingNotifications);
}

- (void)webViewController:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _TtC20ProductPageExtension17WebViewController *v12;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject(&unk_10075F1E8, 24, 7);
  *(_QWORD *)(v9 + 16) = v8;
  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_1005C19D4((uint64_t)v11, (uint64_t)sub_1005C1B14, v9, (uint64_t (*)(uint64_t))&URLProtocolDelegate.performAuthentication(for:), (uint64_t)sub_1005C1570, (uint64_t)&unk_10075F228);

  swift_release();
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
  _TtC20ProductPageExtension17WebViewController *v12;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject(&unk_10075F1C0, 24, 7);
  *(_QWORD *)(v9 + 16) = v8;
  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_1005C19D4((uint64_t)v11, (uint64_t)sub_1005C1AE4, v9, (uint64_t (*)(uint64_t))&URLProtocolDelegate.presentDialog(for:), (uint64_t)sub_1005C1570, (uint64_t)&unk_10075F200);

  swift_release();
}

- (void).cxx_destruct
{

}

@end
