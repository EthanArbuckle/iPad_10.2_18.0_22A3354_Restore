@implementation AMSBag

+ (id)sharedBag
{
  return +[AMSBag bagForProfile:profileVersion:](AMSBag, "bagForProfile:profileVersion:", CFSTR("AskPermission"), CFSTR("1"));
}

- (AMSBagValue)countryCode
{
  return (AMSBagValue *)-[AMSBag stringForKey:](self, "stringForKey:", CFSTR("countryCode"));
}

- (AMSBagValue)localeIdentifier
{
  return (AMSBagValue *)-[AMSBag stringForKey:](self, "stringForKey:", CFSTR("language-tag"));
}

- (AMSBagValue)retrieveRequestURL
{
  return (AMSBagValue *)-[AMSBag URLForKey:](self, "URLForKey:", CFSTR("familyPermissionGetRequestInfoSrv"));
}

- (AMSBagValue)updateRequestURL
{
  return (AMSBagValue *)-[AMSBag URLForKey:](self, "URLForKey:", CFSTR("familyPermissionUpdateRequestSrv"));
}

@end
