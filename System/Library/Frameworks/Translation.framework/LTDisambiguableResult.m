@implementation LTDisambiguableResult

void __61___LTDisambiguableResult_initWithSentences_joinedWithString___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)objc_msgSend(a2, "copy");
  v6 = v5;
  v7 = v5;
  if (a3)
  {
    objc_msgSend(v5, "_insertPrefix:", *(_QWORD *)(a1 + 32));
    v6 = v7;
  }
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

}

void __58___LTDisambiguableResult_combineResults_joinedWithString___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v5 = (void *)objc_msgSend(a2, "copy");
  v8 = v5;
  if (a3)
  {
    objc_msgSend(v5, "_insertPrefix:", *(_QWORD *)(a1 + 32));
    v5 = v8;
  }
  v6 = *(void **)(a1 + 40);
  objc_msgSend(v5, "sentences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v7);

}

uint64_t __93___LTDisambiguableResult_combinedDisambiguableResultFromTranslationResults_joinedWithString___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "disambiguableResult");
}

uint64_t __43___LTDisambiguableResult_sentenceWithUUID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __38___LTDisambiguableResult_romanization__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "romanization");
}

uint64_t __44___LTDisambiguableResult_hasDisambiguations__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasDisambiguations");
}

uint64_t __51___LTDisambiguableResult_hasDisambiguationsOfType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasDisambiguationsOfType:", *(_QWORD *)(a1 + 32));
}

uint64_t __55___LTDisambiguableResult_isGenderDisambiguationEnabled__block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  isGenderDisambiguationEnabled_isGenderDisambiguationEnabled = result;
  return result;
}

@end
