@implementation WebView.Coordinator

- (void)webViewController:(id)a3 handleAuthenticateRequest:(id)a4 completion:(id)a5
{
  sub_21124011C(self, (int)a2, a3, a4, a5, (uint64_t)&unk_24CB59AA0, (uint64_t)sub_2112443BC, (void (*)(void))sub_21123FDE4);
}

- (BOOL)webViewController:(id)a3 handleDelegateAction:(id)a4 completion:(id)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtCV20AppleMediaServicesUI7WebView11Coordinator *v11;
  char v12;

  v7 = _Block_copy(a5);
  v8 = sub_211246324();
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v7;
  v10 = a3;
  v11 = self;
  sub_21123FEA4((uint64_t)v11, v8, (uint64_t)sub_2112443B8, v9);
  LOBYTE(self) = v12;

  swift_bridgeObjectRelease();
  swift_release();
  return self & 1;
}

- (void)webViewController:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
  sub_21124011C(self, (int)a2, a3, a4, a5, (uint64_t)&unk_24CB59A50, (uint64_t)sub_2112441D8, (void (*)(void))sub_21124004C);
}

- (void)webViewController:(id)a3 didResolveWithResult:(id)a4 error:(id)a5 completion:(id)a6
{
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  _TtCV20AppleMediaServicesUI7WebView11Coordinator *v14;

  v10 = _Block_copy(a6);
  if (a4)
    a4 = (id)sub_211246324();
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v10;
  v12 = a3;
  v13 = a5;
  v14 = self;
  sub_211240208((uint64_t)v14, (uint64_t)a4, (uint64_t)a5, (uint64_t)sub_2111E5C3C, v11);

  swift_release();
  swift_bridgeObjectRelease();
}

- (void)webViewController:(id)a3 didEncodeNetworkRequest:(id)a4
{
  id v6;
  id v7;
  _TtCV20AppleMediaServicesUI7WebView11Coordinator *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_2112403B8((uint64_t)v8, (uint64_t)v7);

}

- (void)webViewController:(id)a3 didFinishPurchaseWithResult:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  _TtCV20AppleMediaServicesUI7WebView11Coordinator *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = a5;
  sub_211240504();

}

- (_TtCV20AppleMediaServicesUI7WebView11Coordinator)init
{
  WebView.Coordinator.init()();
}

- (void).cxx_destruct
{
  swift_release();
}

@end
