@implementation WebHostingView.Coordinator

- (void)webView:(WKWebView *)a3 decidePolicyForNavigationAction:(WKNavigationAction *)a4 decisionHandler:(id)a5
{
  void *v8;
  _QWORD *v9;
  WKWebView *v10;
  WKNavigationAction *v11;
  _TtCV11ActionKitUIP33_95B3E30599CAF9D678AD3209E5191A0514WebHostingView11Coordinator *v12;

  v8 = _Block_copy(a5);
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_21EB762F0((uint64_t)&unk_2554783B0, (uint64_t)v9);
}

- (_TtCV11ActionKitUIP33_95B3E30599CAF9D678AD3209E5191A0514WebHostingView11Coordinator)init
{
  sub_21EB73564();
}

- (void).cxx_destruct
{
  sub_21EB73D44((uint64_t)self+ OBJC_IVAR____TtCV11ActionKitUIP33_95B3E30599CAF9D678AD3209E5191A0514WebHostingView11Coordinator_configuration);
  sub_21EB73E0C((uint64_t)self+ OBJC_IVAR____TtCV11ActionKitUIP33_95B3E30599CAF9D678AD3209E5191A0514WebHostingView11Coordinator_loadedRequest, &qword_255478388);
}

@end
