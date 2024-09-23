@implementation InstructionsForUseWebView.Coordinator

- (void)webView:(void *)a3 didFailProvisionalNavigation:(void *)a4 withError:(void *)a5
{
  char *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  char *v17;
  id v18;

  v9 = &a1[OBJC_IVAR____TtCV8HealthUIP33_9391128D22BBD0797A4FA47559946E1D25InstructionsForUseWebView11Coordinator_parent];
  v10 = type metadata accessor for InstructionsForUseWebView(0);
  v11 = (uint64_t *)&v9[*(int *)(v10 + 24)];
  v12 = *v11;
  v13 = v11[1];
  v14 = (uint64_t)&v9[*(int *)(v10 + 32)];
  v15 = a3;
  v16 = a4;
  v18 = a5;
  v17 = a1;
  sub_1D7B3927C(a5, v12, v13, v14, 0, 0);

}

- (void)webView:(id)a3 decidePolicyForNavigationResponse:(id)a4 decisionHandler:(id)a5
{
  void *v8;
  id v9;
  id v10;
  _TtCV8HealthUIP33_9391128D22BBD0797A4FA47559946E1D25InstructionsForUseWebView11Coordinator *v11;

  v8 = _Block_copy(a5);
  _Block_copy(v8);
  v9 = a3;
  v10 = a4;
  v11 = self;
  sub_1D7B3EED4(v9, v10, (uint64_t)v11, (uint64_t)v8);
  _Block_release(v8);
  _Block_release(v8);

}

- (_TtCV8HealthUIP33_9391128D22BBD0797A4FA47559946E1D25InstructionsForUseWebView11Coordinator)init
{
  _TtCV8HealthUIP33_9391128D22BBD0797A4FA47559946E1D25InstructionsForUseWebView11Coordinator *result;

  result = (_TtCV8HealthUIP33_9391128D22BBD0797A4FA47559946E1D25InstructionsForUseWebView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1D7AAD1B0((uint64_t)self+ OBJC_IVAR____TtCV8HealthUIP33_9391128D22BBD0797A4FA47559946E1D25InstructionsForUseWebView11Coordinator_parent, type metadata accessor for InstructionsForUseWebView);
  sub_1D7AAD1B0((uint64_t)self+ OBJC_IVAR____TtCV8HealthUIP33_9391128D22BBD0797A4FA47559946E1D25InstructionsForUseWebView11Coordinator_container, type metadata accessor for InstructionsForUseWebViewContainer);
}

@end
