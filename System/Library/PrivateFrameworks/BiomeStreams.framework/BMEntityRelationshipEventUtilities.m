@implementation BMEntityRelationshipEventUtilities

+ (BOOL)checkNullableStringEqualityForSource:(id)a3 target:(id)a4
{
  if (a3 && a4)
    return objc_msgSend(a3, "isEqualToString:", a4);
  else
    return a3 == a4;
}

+ (BOOL)checkNullableArrayEqualityForSource:(id)a3 target:(id)a4
{
  if (a3 && a4)
    return objc_msgSend(a3, "isEqualToArray:", a4);
  else
    return a3 == a4;
}

+ (BOOL)checkNullableDictionaryEqualityForSource:(id)a3 target:(id)a4
{
  if (a3 && a4)
    return objc_msgSend(a3, "isEqualToDictionary:", a4);
  else
    return a3 == a4;
}

+ (BOOL)checkNullablePersonEntityEqualityForSource:(id)a3 target:(id)a4
{
  if (a3 && a4)
    return objc_msgSend(a3, "isEqual:", a4);
  else
    return a3 == a4;
}

+ (BOOL)checkNullableTopicEntityEqualityForSource:(id)a3 target:(id)a4
{
  if (a3 && a4)
    return objc_msgSend(a3, "isEqual:", a4);
  else
    return a3 == a4;
}

@end
