@implementation HMTrigger(NaturalLanguage)

- (id)hf_naturalLangugeDetailsWithOptions:()NaturalLanguage
{
  void *v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "_hf_naturalLanguageDetailsSentenceElementsWithOptions:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  if (objc_msgSend(v2, "count"))
  {
    if (_MergedGlobals_239 != -1)
      dispatch_once(&_MergedGlobals_239, &__block_literal_global_9_1);
    v3 = (id)qword_1ED378F20;
    objc_msgSend(v3, "setListStyle:", 2);
    objc_msgSend(v2, "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringForObjectValue:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_hf_naturalLanguageDetailsSentenceElementsWithOptions:()NaturalLanguage
{
  if (qword_1ED378F28 != -1)
    dispatch_once(&qword_1ED378F28, &__block_literal_global_11_2);
  return (id)qword_1ED378F30;
}

@end
