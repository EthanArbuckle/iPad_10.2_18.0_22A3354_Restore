@implementation CDMCATIUSOParseHelpers

+ (id)buildSocialConversationParseWithAppBundleId:(id)a3 guid:(id)a4 intentName:(id)a5 ensembleType:(id)a6
{
  return sub_21A30135C((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_21A301268);
}

+ (id)buildSocialConversationParseWithAppBundleId:(id)a3 guid:(id)a4 intentName:(id)a5 ensembleType:(id)a6 addEntitySpans:(BOOL)a7
{
  return sub_21A301B8C((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, a7, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, char))sub_21A301290);
}

+ (id)buildCrisisSupportParseWithAppBundleId:(id)a3 guid:(id)a4 intentName:(id)a5 ensembleType:(id)a6
{
  return sub_21A30135C((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_21A301334);
}

+ (id)buildCrisisSupportParseWithAppBundleId:(id)a3 guid:(id)a4 intentName:(id)a5 ensembleType:(id)a6 addEntitySpans:(BOOL)a7
{
  return sub_21A301B8C((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, a7, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, char))sub_21A30143C);
}

- (_TtC13CDMFoundation22CDMCATIUSOParseHelpers)init
{
  _TtC13CDMFoundation22CDMCATIUSOParseHelpers *result;

  CDMCATIUSOParseHelpers.init()();
  return result;
}

@end
