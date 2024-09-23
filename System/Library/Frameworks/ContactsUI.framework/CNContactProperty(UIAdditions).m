@implementation CNContactProperty(UIAdditions)

- (id)phoneticProperty
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "phoneticPropertiesMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "key");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)phoneticPropertiesMap
{
  if (phoneticPropertiesMap_onceToken != -1)
    dispatch_once(&phoneticPropertiesMap_onceToken, &__block_literal_global_18261);
  return (id)phoneticPropertiesMap_properties;
}

@end
