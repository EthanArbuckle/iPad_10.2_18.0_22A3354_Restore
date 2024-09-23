@implementation RemoteAppIntentsActor.PerformActionExecutorDelegate

- (void)executor:(id)a3 didPerformActionWithResult:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  _TtCC18AppIntentsServices21RemoteAppIntentsActor29PerformActionExecutorDelegate *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = a5;
  sub_23613E734((uint64_t)v11, a4, (uint64_t)a5);

}

- (void)executor:(id)a3 didCompleteExecutionWithResult:(id)a4 error:(id)a5
{
  id v8;
  id v9;

  v8 = a3;
  v9 = a4;
  self;
  a5;
  sub_23613E9F4();
}

- (void)executor:(id)a3 needsDisambiguationWithRequest:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = a4;
  self;
  sub_23613F8CC();
}

- (void)executor:(id)a3 needsValueWithRequest:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = a4;
  self;
  sub_23613F8CC();
}

- (void)executor:(id)a3 needsConfirmationWithRequest:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = a4;
  self;
  sub_23613F8CC();
}

- (void)executor:(id)a3 needsActionConfirmationWithRequest:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = a4;
  self;
  sub_23613F8CC();
}

- (void)executor:(id)a3 needsContinueInAppWithRequest:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = a4;
  self;
  sub_23613F8CC();
}

- (BOOL)executor:(id)a3 shouldRunShowOutputAction:(id)a4
{
  return 0;
}

- (_TtCC18AppIntentsServices21RemoteAppIntentsActor29PerformActionExecutorDelegate)init
{
  sub_2361428A4();
}

- (void).cxx_destruct
{
  uint64_t v3;
  char *v4;
  uint64_t v5;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC18AppIntentsServices21RemoteAppIntentsActor29PerformActionExecutorDelegate_actionMetadata));
  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2563BCC60);
  OUTLINED_FUNCTION_89_1(*(_QWORD *)(v3 - 8));
  swift_release();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self+ OBJC_IVAR____TtCC18AppIntentsServices21RemoteAppIntentsActor29PerformActionExecutorDelegate_environment);
  OUTLINED_FUNCTION_16_3(OBJC_IVAR____TtCC18AppIntentsServices21RemoteAppIntentsActor29PerformActionExecutorDelegate_disambiguationRequest);
  OUTLINED_FUNCTION_16_3(OBJC_IVAR____TtCC18AppIntentsServices21RemoteAppIntentsActor29PerformActionExecutorDelegate_needsValueRequest);
  OUTLINED_FUNCTION_16_3(OBJC_IVAR____TtCC18AppIntentsServices21RemoteAppIntentsActor29PerformActionExecutorDelegate_confirmationRequest);
  OUTLINED_FUNCTION_16_3(OBJC_IVAR____TtCC18AppIntentsServices21RemoteAppIntentsActor29PerformActionExecutorDelegate_actionConfirmationRequest);
  OUTLINED_FUNCTION_16_3(OBJC_IVAR____TtCC18AppIntentsServices21RemoteAppIntentsActor29PerformActionExecutorDelegate_continueInAppRequest);
  v4 = (char *)self
     + OBJC_IVAR____TtCC18AppIntentsServices21RemoteAppIntentsActor29PerformActionExecutorDelegate_signposter;
  v5 = OUTLINED_FUNCTION_123_1();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

@end
