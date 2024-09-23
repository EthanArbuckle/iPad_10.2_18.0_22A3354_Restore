@implementation _MFDASearchCriterionConverterDelegate

- (id)messageCriterionConverter:(id)a3 predicateKeysForCriterionType:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  if (messageCriterionConverter_predicateKeysForCriterionType__onceToken != -1)
    dispatch_once(&messageCriterionConverter_predicateKeysForCriterionType__onceToken, &__block_literal_global_47);
  v6 = (void *)messageCriterionConverter_predicateKeysForCriterionType__converterKeyDictionary;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)_shouldConvertEqualsToContainsForKey:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if (_shouldConvertEqualsToContainsForKey__onceToken != -1)
    dispatch_once(&_shouldConvertEqualsToContainsForKey__onceToken, &__block_literal_global_15);
  v4 = objc_msgSend((id)_shouldConvertEqualsToContainsForKey___daKeys, "containsObject:", v3);

  return v4;
}

- (unint64_t)messageCriterionConverter:(id)a3 willUsePredicateOperatorType:(unint64_t)a4 forKey:(id)a5
{
  id v7;

  v7 = a5;
  if (a4 == 4)
  {
    if (-[_MFDASearchCriterionConverterDelegate _shouldConvertEqualsToContainsForKey:](self, "_shouldConvertEqualsToContainsForKey:", v7))
    {
      a4 = 99;
    }
    else
    {
      a4 = 4;
    }
  }
  else if (a4 == 10)
  {
    a4 = 99;
  }

  return a4;
}

@end
