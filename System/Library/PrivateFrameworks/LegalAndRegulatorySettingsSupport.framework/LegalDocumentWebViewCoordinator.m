@implementation LegalDocumentWebViewCoordinator

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  void *v8;
  id v9;
  id v10;
  _TtC33LegalAndRegulatorySettingsSupport31LegalDocumentWebViewCoordinator *v11;

  v8 = _Block_copy(a5);
  _Block_copy(v8);
  v9 = a3;
  v10 = a4;
  v11 = self;
  sub_240218698(v10, (uint64_t)v11, (uint64_t)v8);
  _Block_release(v8);
  _Block_release(v8);

}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  _TtC33LegalAndRegulatorySettingsSupport31LegalDocumentWebViewCoordinator *v5;

  v4 = a3;
  v5 = self;
  objc_msgSend(v4, sel_contentOffset);
  objc_msgSend(v4, sel_setContentOffset_, 0.0);

}

- (_TtC33LegalAndRegulatorySettingsSupport31LegalDocumentWebViewCoordinator)init
{
  _TtC33LegalAndRegulatorySettingsSupport31LegalDocumentWebViewCoordinator *result;

  result = (_TtC33LegalAndRegulatorySettingsSupport31LegalDocumentWebViewCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC33LegalAndRegulatorySettingsSupport31LegalDocumentWebViewCoordinator_openURL;
  v3 = sub_240226624();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
