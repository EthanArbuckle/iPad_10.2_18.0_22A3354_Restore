@implementation _HKComparisonFilter(_HKBuilders)

- (id)builder_filterWithDataTypes:()_HKBuilders
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  objc_msgSend(a1, "keyPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(a1, "operatorType");
  objc_msgSend(a1, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filterForKeyPath:operatorType:value:dataTypes:", v6, v7, v8, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
