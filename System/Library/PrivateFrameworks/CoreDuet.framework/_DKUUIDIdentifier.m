@implementation _DKUUIDIdentifier

+ (id)type
{
  return +[_DKObjectType objectTypeFromClass:](_DKIdentifierType, "objectTypeFromClass:", a1);
}

+ (id)withUUID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKIdentifier identifierWithString:type:](_DKIdentifier, "identifierWithString:type:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
