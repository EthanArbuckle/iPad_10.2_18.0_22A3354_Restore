@implementation NSDateComponents(Dictionary)

+ (id)atx_componentsFromDictionary:()Dictionary
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = objc_alloc_init(a1);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("year"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setYear:", objc_msgSend(v6, "integerValue"));
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("month"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setMonth:", objc_msgSend(v7, "integerValue"));
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("day"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "setDay:", objc_msgSend(v8, "integerValue"));

  return v5;
}

@end
