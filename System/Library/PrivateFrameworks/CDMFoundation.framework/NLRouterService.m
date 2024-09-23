@implementation NLRouterService

- (_TtC13CDMFoundation15NLRouterService)init
{
  _TtC13CDMFoundation15NLRouterService *result;

  sub_21A38AF04();
  OUTLINED_FUNCTION_60_0();
  return result;
}

+ (BOOL)isEnabled
{
  char v2;

  sub_21A38B098();
  return v2 & 1;
}

- (void).cxx_destruct
{
  swift_release();
  sub_21A2C9004((uint64_t)self + OBJC_IVAR____TtC13CDMFoundation15NLRouterService_cacheManager, (uint64_t *)&unk_2550D70A0);
  sub_21A2F75B0(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13CDMFoundation15NLRouterService_promptGenerator), *(_QWORD *)&self->client[OBJC_IVAR____TtC13CDMFoundation15NLRouterService_promptGenerator]);
  sub_21A2C9004((uint64_t)self + OBJC_IVAR____TtC13CDMFoundation15NLRouterService_tokenizer, &qword_2550D5448);
  swift_release();
}

@end
