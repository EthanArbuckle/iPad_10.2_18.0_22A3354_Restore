@implementation BankConnectLegacyWebAuthorizationViewContent.Coordinator

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  _TtCV12FinanceKitUIP33_207ADDCA487650A08FA142B344A4E7BA44BankConnectLegacyWebAuthorizationViewContent11Coordinator *v11;
  id v12;
  _TtCV12FinanceKitUIP33_207ADDCA487650A08FA142B344A4E7BA44BankConnectLegacyWebAuthorizationViewContent11Coordinator *v13;
  id v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560D4880);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    v10 = sub_2339D44D0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);
    sub_2339D44AC();
    v11 = self;
    v12 = a4;
    v13 = v11;
    v14 = a3;
    v15 = sub_2339D44A0();
    v16 = (_QWORD *)swift_allocObject();
    v17 = MEMORY[0x24BEE6930];
    v16[2] = v15;
    v16[3] = v17;
    v16[4] = v12;
    v16[5] = v13;
    v16[6] = 0;
    sub_23387C704((uint64_t)v9, (uint64_t)&unk_2560DAAF8, (uint64_t)v16);

    swift_release();
  }
  else
  {
    __break(1u);
  }
}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
  sub_2338624C4(self, (uint64_t)a2, a3, a4, a5, (uint64_t)&unk_2504BDF10, (uint64_t)&unk_2560DAAF0);
}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  sub_2338624C4(self, (uint64_t)a2, a3, a4, a5, (uint64_t)&unk_2504BDEE8, (uint64_t)&unk_2560DAAE0);
}

- (void)webView:(WKWebView *)a3 decidePolicyForNavigationAction:(WKNavigationAction *)a4 decisionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  WKWebView *v17;
  WKNavigationAction *v18;
  _TtCV12FinanceKitUIP33_207ADDCA487650A08FA142B344A4E7BA44BankConnectLegacyWebAuthorizationViewContent11Coordinator *v19;
  uint64_t v20;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2560D4880);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = sub_2339D44D0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_2560DAAB0;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_2560E1CF0;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_23399737C((uint64_t)v11, (uint64_t)&unk_2560DAAC0, (uint64_t)v16);
  swift_release();
}

- (_TtCV12FinanceKitUIP33_207ADDCA487650A08FA142B344A4E7BA44BankConnectLegacyWebAuthorizationViewContent11Coordinator)init
{
  _TtCV12FinanceKitUIP33_207ADDCA487650A08FA142B344A4E7BA44BankConnectLegacyWebAuthorizationViewContent11Coordinator *result;

  result = (_TtCV12FinanceKitUIP33_207ADDCA487650A08FA142B344A4E7BA44BankConnectLegacyWebAuthorizationViewContent11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV12FinanceKitUIP33_207ADDCA487650A08FA142B344A4E7BA44BankConnectLegacyWebAuthorizationViewContent11Coordinator_initialNavigation));
}

@end
