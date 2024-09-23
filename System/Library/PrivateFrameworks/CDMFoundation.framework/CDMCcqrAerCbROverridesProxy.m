@implementation CDMCcqrAerCbROverridesProxy

- (_TtC13CDMFoundation27CDMCcqrAerCbROverridesProxy)initWithUseTrie:(BOOL)a3 useMemory:(BOOL)a4 templatePattern:(id)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;

  v5 = a4;
  v6 = a3;
  if (a5)
  {
    v7 = sub_21A450644();
    v9 = v8;
  }
  else
  {
    v7 = 0;
    v9 = 0;
  }
  return (_TtC13CDMFoundation27CDMCcqrAerCbROverridesProxy *)CDMCcqrAerCbROverridesProxy.init(useTrie:useMemory:templatePattern:)(v6, v5, v7, v9);
}

- (id)matchWithInputs:(id)a3
{
  OUTLINED_FUNCTION_8_3((uint64_t)self, (unint64_t *)&unk_253E44680);
  sub_21A45083C();
  swift_bridgeObjectRelease();
  return 0;
}

- (id)getRewriteHypothesisWithOverrideUtterance:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC13CDMFoundation27CDMCcqrAerCbROverridesProxy *v7;
  id v8;

  v4 = sub_21A450644();
  v6 = v5;
  v7 = self;
  v8 = sub_21A303818(v4, v6);

  OUTLINED_FUNCTION_13_0();
  return v8;
}

- (_TtC13CDMFoundation27CDMCcqrAerCbROverridesProxy)initWithUseTrie:(BOOL)a3 useMemory:(BOOL)a4
{
  CDMCcqrAerCbROverridesProxy.init(useTrie:useMemory:)();
}

- (void).cxx_destruct
{
  OUTLINED_FUNCTION_15_10();
  OUTLINED_FUNCTION_15_10();
  sub_21A304A94(*(id *)((char *)&self->super.super.isa
                      + OBJC_IVAR____TtC13CDMFoundation27CDMCcqrAerCbROverridesProxy____lazy_storage___captureGroupExpression));
}

@end
