@implementation SUCellConfigurationCacheAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUCellConfigurationCache");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)configurationForRow:(unint64_t)a3
{
  void *v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  objc_class *v8;
  uint64_t v9;
  id v10;
  void *v11;

  -[SUCellConfigurationCacheAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_configurations"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  if (v5 <= a3)
  {
    v6 = v5;
    objc_msgSend(v4, "objectAtIndex:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();

    if (a3 + 5 != v6)
    {
      if (a3 + 5 - v6 <= 1)
        v9 = 1;
      else
        v9 = a3 + 5 - v6;
      do
      {
        v10 = objc_alloc_init(v8);
        objc_msgSend(v4, "addObject:", v10);

        --v9;
      }
      while (v9);
    }
  }
  objc_msgSend(v4, "objectAtIndex:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
