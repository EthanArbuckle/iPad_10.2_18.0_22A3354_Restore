@implementation _OSLogLegacyPredicateMapper

- (id)validKeyPaths
{
  if (validKeyPaths_once_336 != -1)
    dispatch_once(&validKeyPaths_once_336, &__block_literal_global_337);
  return (id)validKeyPaths__legacyValidKeyPaths;
}

- (void)mapLeftExpression:(id *)a3 andRightExpression:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  if (mapLeftExpression_andRightExpression__once_350 != -1)
    dispatch_once(&mapLeftExpression_andRightExpression__once_350, &__block_literal_global_351);
  if (objc_msgSend(*a3, "expressionType") == 3)
  {
    objc_msgSend(*a3, "keyPath");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)mapLeftExpression_andRightExpression__keypathMaps_349, "objectForKeyedSubscript:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = (void *)MEMORY[0x1E0CB35D0];
      objc_msgSend((id)mapLeftExpression_andRightExpression__keypathMaps_349, "objectForKeyedSubscript:", v10);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "expressionForKeyPath:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *a3;
      *a3 = v8;

    }
  }
}

@end
