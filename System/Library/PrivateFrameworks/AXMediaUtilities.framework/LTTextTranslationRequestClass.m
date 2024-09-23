@implementation LTTextTranslationRequestClass

AXMVisionResult *__get_LTTextTranslationRequestClass_block_invoke(uint64_t a1)
{
  AXMVisionResult *result;
  void *v3;
  SEL v4;
  id v5;
  id v6;
  id v7;
  id v8;

  TranslationLibrary();
  result = (AXMVisionResult *)objc_getClass("_LTTextTranslationRequest");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    get_LTTextTranslationRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (void *)__get_LTTextTranslationRequestClass_block_invoke_cold_1();
    return +[AXMVisionResult resultWithImage:features:orientation:metricSession:](v3, v4, v5, v6, v7, v8);
  }
  return result;
}

uint64_t __get_LTTextTranslationRequestClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[AXMVisionEngineCache _cacheQueue_resultForKey:].cold.1(v0);
}

@end
