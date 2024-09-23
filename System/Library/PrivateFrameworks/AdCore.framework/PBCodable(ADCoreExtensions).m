@implementation PBCodable(ADCoreExtensions)

- (id)AD_jsonString
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "dictionaryRepresentation");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "AD_dictionaryForJSON");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "AD_jsonStringWithPrettyPrint:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
