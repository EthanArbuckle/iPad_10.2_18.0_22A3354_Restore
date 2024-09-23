@implementation ML3Entity(MPMediaAdditions)

+ (id)propertyForMPMediaEntityProperty:()MPMediaAdditions
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = propertyForMPMediaEntityProperty__once;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&propertyForMPMediaEntityProperty__once, &__block_literal_global_23979);
  objc_msgSend((id)propertyForMPMediaEntityProperty__ML3ForMP, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)spotlightPropertyForMPMediaEntityProperty:()MPMediaAdditions
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = spotlightPropertyForMPMediaEntityProperty__once;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&spotlightPropertyForMPMediaEntityProperty__once, &__block_literal_global_1);
  objc_msgSend((id)spotlightPropertyForMPMediaEntityProperty__ML3ForMP, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
