@implementation LTTranslationGenderAlternative

id __68___LTTranslationGenderAlternative_genderAlternativesFromDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[_LTTranslationGenderAlternative genderAlternativeFromDictionary:withGroup:](_LTTranslationGenderAlternative, "genderAlternativeFromDictionary:withGroup:", v3, *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
