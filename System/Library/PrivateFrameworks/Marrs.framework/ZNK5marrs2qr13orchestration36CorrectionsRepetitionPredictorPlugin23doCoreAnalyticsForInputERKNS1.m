@implementation ZNK5marrs2qr13orchestration36CorrectionsRepetitionPredictorPlugin23doCoreAnalyticsForInputERKNS1

void *___ZNK5marrs2qr13orchestration36CorrectionsRepetitionPredictorPlugin23doCoreAnalyticsForInputERKNS1_9QRRequestE_block_invoke(uint64_t a1)
{
  uint64_t v2;
  xpc_object_t v3;
  void *v4;
  const char *v5;
  const char *v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = xpc_dictionary_create(0, 0, 0);
  v4 = v3;
  if (v3)
  {
    xpc_dictionary_set_double(v3, "turn1MinConfidence", *(double *)(a1 + 40));
    xpc_dictionary_set_double(v4, "turn1MaxConfidence", *(double *)(a1 + 48));
    v5 = (const char *)(v2 + 216);
    if (*(char *)(v2 + 239) < 0)
      v5 = *(const char **)v5;
    xpc_dictionary_set_string(v4, "locale", v5);
    v6 = (const char *)(v2 + 312);
    if (*(char *)(v2 + 335) < 0)
      v6 = *(const char **)v6;
    xpc_dictionary_set_string(v4, "assetVersion", v6);
  }
  return v4;
}

@end
