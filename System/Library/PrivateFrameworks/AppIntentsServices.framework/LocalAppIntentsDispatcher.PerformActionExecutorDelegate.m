@implementation LocalAppIntentsDispatcher.PerformActionExecutorDelegate

- (void)executor:(id)a3 didCompleteExecutionWithResult:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  _TtCC18AppIntentsServices25LocalAppIntentsDispatcher29PerformActionExecutorDelegate *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = a5;
  sub_236172FF0();

}

- (void)executor:(id)a3 needsDisambiguationWithRequest:(id)a4
{
  id v6;
  id v7;
  _TtCC18AppIntentsServices25LocalAppIntentsDispatcher29PerformActionExecutorDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_236173744();

}

- (void)executor:(id)a3 needsValueWithRequest:(id)a4
{
  id v6;
  id v7;
  _TtCC18AppIntentsServices25LocalAppIntentsDispatcher29PerformActionExecutorDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_2361734D8();

}

- (void)executor:(id)a3 needsConfirmationWithRequest:(id)a4
{
  id v6;
  id v7;
  _TtCC18AppIntentsServices25LocalAppIntentsDispatcher29PerformActionExecutorDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_236173744();

}

- (void)executor:(id)a3 needsActionConfirmationWithRequest:(id)a4
{
  id v6;
  id v7;
  _TtCC18AppIntentsServices25LocalAppIntentsDispatcher29PerformActionExecutorDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_236173A10();

}

- (void)executor:(id)a3 needsContinueInAppWithRequest:(id)a4
{
  id v6;
  id v7;
  _TtCC18AppIntentsServices25LocalAppIntentsDispatcher29PerformActionExecutorDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_236173A10();

}

- (BOOL)executor:(id)a3 shouldRunShowOutputAction:(id)a4
{
  return 0;
}

- (_TtCC18AppIntentsServices25LocalAppIntentsDispatcher29PerformActionExecutorDelegate)init
{
  sub_2361428A4();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self
     + OBJC_IVAR____TtCC18AppIntentsServices25LocalAppIntentsDispatcher29PerformActionExecutorDelegate_continuation;
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2563BD8D0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC18AppIntentsServices25LocalAppIntentsDispatcher29PerformActionExecutorDelegate_actionMetadata));
  swift_bridgeObjectRelease();
}

@end
