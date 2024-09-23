@implementation HPSAssertion

- (NSString)identifier
{
  void *v2;

  sub_22DF3B558();
  v2 = (void *)sub_22DFDD4FC();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (HPSAssertion)initWithIdentifier:(id)a3 assertionType:(unint64_t)a4 connectionProvider:(id)a5
{
  sub_22DFDD514();
  swift_unknownObjectRetain();
  return (HPSAssertion *)Assertion.init(identifier:assertionType:connectionProvider:)();
}

- (void)invalidate
{
  HPSAssertion *v2;

  v2 = self;
  sub_22DF3BEDC();

}

- (void)invalidateWithCompletion:(id)a3
{
  void *v4;
  HPSAssertion *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_22DF3BF28((char *)v5, (void (**)(_QWORD, _QWORD))v4);
  _Block_release(v4);

}

- (HPSAssertion)init
{
  Assertion.init()();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR___HPSAssertion_logger;
  v4 = sub_22DFDCF20();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  sub_22DF34068(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___HPSAssertion_assertionInvalidationHandler));
}

@end
