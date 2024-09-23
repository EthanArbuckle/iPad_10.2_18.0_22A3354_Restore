@implementation NSDictionary(JSONConformance)

- (id)crk_JSONRepresentationWithPrettyPrinting:()JSONConformance sortKeys:
{
  void *v6;
  void *v7;

  +[CRKJSONConverter JSONDictionaryForDictionary:](CRKJSONConverter, "JSONDictionaryForDictionary:", a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  JSONStringRepresentation((uint64_t)v6, a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
