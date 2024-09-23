@implementation PIIStringProcessorWrapper

+ (id)makeProcessor
{
  return _s10FinanceKit25PIIStringProcessorWrapperC04makeD0ACyFZ_0();
}

- (id)redactFromString:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC10FinanceKit25PIIStringProcessorWrapper *v7;
  void *v8;
  uint64_t v10;
  char v11;

  v4 = sub_23361E150();
  v6 = v5;
  v7 = self;
  PIIStringProcessor.redact(from:forCountryCodes:)(v4, v6, MEMORY[0x24BEE4B08], (uint64_t)&v10);
  if ((v11 & 1) != 0)
  {

    swift_bridgeObjectRelease();
  }
  else
  {
    sub_2331966B8();

  }
  v8 = (void *)sub_23361E12C();
  swift_bridgeObjectRelease();
  return v8;
}

- (id)redactFromString:(id)a3 forCountryCodes:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _TtC10FinanceKit25PIIStringProcessorWrapper *v9;
  void *v10;
  uint64_t v12;
  char v13;

  v5 = sub_23361E150();
  v7 = v6;
  v8 = sub_23361E5DC();
  v9 = self;
  PIIStringProcessor.redact(from:forCountryCodes:)(v5, v7, v8, (uint64_t)&v12);
  if ((v13 & 1) == 0)
  {
    swift_bridgeObjectRetain();
    sub_2331966B8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v10 = (void *)sub_23361E12C();
  swift_bridgeObjectRelease();
  return v10;
}

- (_TtC10FinanceKit25PIIStringProcessorWrapper)init
{
  _TtC10FinanceKit25PIIStringProcessorWrapper *result;

  result = (_TtC10FinanceKit25PIIStringProcessorWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
