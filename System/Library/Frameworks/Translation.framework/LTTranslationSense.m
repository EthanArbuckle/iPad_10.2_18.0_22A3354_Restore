@implementation LTTranslationSense

id __39___LTTranslationSense_sensesFromArray___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[_LTTranslationSense senseFromDictionary:](_LTTranslationSense, "senseFromDictionary:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

@end
