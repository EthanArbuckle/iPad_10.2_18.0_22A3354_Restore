@implementation LTCombinedTranslationResult

uint64_t __68___LTCombinedTranslationResult_initWithParagraphResults_localePair___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "disambiguableResult");
}

id __46___LTCombinedTranslationResult_translatedText__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  v2 = a2;
  objc_msgSend((id)objc_opt_class(), "_translatedTextWithAttributesForResult:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "length"))
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

id __44___LTCombinedTranslationResult_romanization__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "translations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "romanization");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length"))
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

@end
