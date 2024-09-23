@implementation AISAIDASignInViewController

- (AISAIDASignInViewController)init
{
  AISAIDASignInViewController *result;

  result = (AISAIDASignInViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

- (void)uiController:(id)a3 didPresentRootViewController:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  AISAIDASignInViewController *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;

  v7 = sub_236736790();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = a3;
  v12 = a4;
  v13 = self;
  sub_23673670C();
  v14 = sub_236736784();
  v15 = sub_236737450();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_2366B5000, v14, v15, "AIDASignInViewController uiController(_:didPresentRootViewController:)", v16, 2u);
    MEMORY[0x23B7F8CC0](v16, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)uiController:(id)a3 prepareAlertContext:(id)a4
{
  sub_236733A14(self, (int)a2, a3, a4, "AIDASignInViewController uiController(_:prepareAlertContext:)");
}

- (void)uiController:(id)a3 preparePresentationContext:(id)a4
{
  sub_236733A14(self, (int)a2, a3, a4, "AIDASignInViewController uiController(_:preparePresentationContext:)");
}

@end
