@implementation LibraryImportWebViewModel

- (_TtC7MusicUI25LibraryImportWebViewModel)init
{
  sub_21D39A658();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _BYTE v7[136];

  v3 = (char *)self + OBJC_IVAR____TtC7MusicUI25LibraryImportWebViewModel__canGoBack;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F5E320);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  OUTLINED_FUNCTION_7_77(OBJC_IVAR____TtC7MusicUI25LibraryImportWebViewModel__canGoForward);
  OUTLINED_FUNCTION_7_77(OBJC_IVAR____TtC7MusicUI25LibraryImportWebViewModel__isSecure);
  v5 = (char *)self + OBJC_IVAR____TtC7MusicUI25LibraryImportWebViewModel__hostName;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2553390A8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  OUTLINED_FUNCTION_7_77(OBJC_IVAR____TtC7MusicUI25LibraryImportWebViewModel__isLoading);
  OUTLINED_FUNCTION_7_77(OBJC_IVAR____TtC7MusicUI25LibraryImportWebViewModel__isPresentingError);
  OUTLINED_FUNCTION_7_77(OBJC_IVAR____TtC7MusicUI25LibraryImportWebViewModel__isShowingAlert);
  OUTLINED_FUNCTION_7_77(OBJC_IVAR____TtC7MusicUI25LibraryImportWebViewModel__isPresentingAuthForm);
  OUTLINED_FUNCTION_131_2(OBJC_IVAR____TtC7MusicUI25LibraryImportWebViewModel_webView);
  sub_21D39FA10(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7MusicUI25LibraryImportWebViewModel_alertModel), *(_QWORD *)&self->_anon_0[OBJC_IVAR____TtC7MusicUI25LibraryImportWebViewModel_alertModel]);
  OUTLINED_FUNCTION_102_9(OBJC_IVAR____TtC7MusicUI25LibraryImportWebViewModel_dismiss);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_102_9(OBJC_IVAR____TtC7MusicUI25LibraryImportWebViewModel_authChallengeCompletion);
  OUTLINED_FUNCTION_131_2(OBJC_IVAR____TtC7MusicUI25LibraryImportWebViewModel_authChallengeCredential);
  OUTLINED_FUNCTION_8_35();
  OUTLINED_FUNCTION_83_14(v7, (char *)self + OBJC_IVAR____TtC7MusicUI25LibraryImportWebViewModel_params);
  sub_21D153AB0((uint64_t)v7);
  swift_release();
  OUTLINED_FUNCTION_131_2(OBJC_IVAR____TtC7MusicUI25LibraryImportWebViewModel_activeAuthSession);
  OUTLINED_FUNCTION_131_2(OBJC_IVAR____TtC7MusicUI25LibraryImportWebViewModel_lastNavigation);
  OUTLINED_FUNCTION_8_35();
}

- (void)webView:(WKWebView *)a3 decidePolicyForNavigationAction:(WKNavigationAction *)a4 decisionHandler:(id)a5
{
  void *v8;
  _QWORD *v9;
  WKWebView *v10;
  WKNavigationAction *v11;
  _TtC7MusicUI25LibraryImportWebViewModel *v12;

  v8 = _Block_copy(a5);
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_21D39B6D8((uint64_t)&unk_25533FD90, (uint64_t)v9);
}

- (void)webView:(id)a3 didStartProvisionalNavigation:(id)a4
{
  id v6;
  id v7;
  _TtC7MusicUI25LibraryImportWebViewModel *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_21D39B7B4(v6);

}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  sub_21D39BE94(self, (uint64_t)a2, a3, a4, a5, (void (*)(id, void *, id))sub_21D39FC4C);
}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
  sub_21D39BE94(self, (uint64_t)a2, a3, a4, a5, (void (*)(id, void *, id))sub_21D39BE84);
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  id v6;
  id v7;
  _TtC7MusicUI25LibraryImportWebViewModel *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_21D39C048(v6, a4);

}

- (void)webView:(id)a3 didCommitNavigation:(id)a4
{
  id v6;
  id v7;
  _TtC7MusicUI25LibraryImportWebViewModel *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_21D39C334();

}

- (void)webView:(id)a3 decidePolicyForNavigationResponse:(id)a4 decisionHandler:(id)a5
{
  sub_21D39E968(self, (int)a2, a3, a4, a5, (void (*)(id, id, id, void *))sub_21D39C4DC);
}

- (id)presentationAnchorForWebAuthenticationSession:(id)a3
{
  id v4;
  _TtC7MusicUI25LibraryImportWebViewModel *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_21D39CEF8();

  return v6;
}

- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4 replyHandler:(id)a5
{
  sub_21D39E968(self, (int)a2, a3, a4, a5, (void (*)(id, id, id, void *))sub_21D39CFA0);
}

- (void)webView:(id)a3 didReceiveAuthenticationChallenge:(id)a4 completionHandler:(id)a5
{
  sub_21D39E968(self, (int)a2, a3, a4, a5, (void (*)(id, id, id, void *))sub_21D39E80C);
}

@end
