@implementation SystemIntentExecutorDelegate

- (void)executor:(id)a3 didCompleteExecutionWithResult:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  _TtC10AppIntents28SystemIntentExecutorDelegate *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = a5;
  sub_227EF2684((uint64_t)v11, a4, a5);

}

- (void)executor:(id)a3 needsValueWithRequest:(id)a4
{
  id v6;
  id v7;
  _TtC10AppIntents28SystemIntentExecutorDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_227EF2860();

}

- (_TtC10AppIntents28SystemIntentExecutorDelegate)init
{
  sub_227EF28C4();
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC10AppIntents28SystemIntentExecutorDelegate_continuation;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255939338);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
