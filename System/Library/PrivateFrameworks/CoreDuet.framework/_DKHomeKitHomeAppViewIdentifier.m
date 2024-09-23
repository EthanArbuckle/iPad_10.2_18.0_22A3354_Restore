@implementation _DKHomeKitHomeAppViewIdentifier

+ (id)type
{
  return +[_DKObjectType objectTypeFromClass:](_DKIdentifierType, "objectTypeFromClass:", a1);
}

+ (id)withString:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKIdentifier identifierWithString:type:](_DKIdentifier, "identifierWithString:type:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
