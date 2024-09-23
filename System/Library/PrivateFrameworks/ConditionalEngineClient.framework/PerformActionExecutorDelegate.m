@implementation PerformActionExecutorDelegate

- (void)executor:(id)a3 didCompleteExecutionWithResult:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  _TtC23ConditionalEngineClient29PerformActionExecutorDelegate *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = a5;
  sub_238486CAC(a4, a5);

}

- (void)executor:(id)a3 needsDisambiguationWithRequest:(id)a4
{
  id v6;
  id v7;
  _TtC23ConditionalEngineClient29PerformActionExecutorDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_238486DC0(v7);

}

- (void)executor:(id)a3 needsValueWithRequest:(id)a4
{
  id v6;
  id v7;
  _TtC23ConditionalEngineClient29PerformActionExecutorDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_23848727C(v7);

}

- (void)executor:(id)a3 needsConfirmationWithRequest:(id)a4
{
  id v6;
  id v7;
  _TtC23ConditionalEngineClient29PerformActionExecutorDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_238487478(v7);

}

- (void)executor:(id)a3 needsActionConfirmationWithRequest:(id)a4
{
  id v6;
  id v7;
  _TtC23ConditionalEngineClient29PerformActionExecutorDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_238487710(v7);

}

- (_TtC23ConditionalEngineClient29PerformActionExecutorDelegate)init
{
  _TtC23ConditionalEngineClient29PerformActionExecutorDelegate *result;

  result = (_TtC23ConditionalEngineClient29PerformActionExecutorDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC23ConditionalEngineClient29PerformActionExecutorDelegate_continuation;
  v3 = sub_238435C24(&qword_25690B340);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
