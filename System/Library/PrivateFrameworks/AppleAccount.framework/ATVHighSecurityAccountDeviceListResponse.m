@implementation ATVHighSecurityAccountDeviceListResponse

- (NSArray)devices
{
  return (NSArray *)-[NSDictionary objectForKey:](self->super._responseDictionary, "objectForKey:", CFSTR("devices"));
}

- (NSDictionary)userDisplayStrings
{
  return (NSDictionary *)-[NSDictionary objectForKey:](self->super._responseDictionary, "objectForKey:", CFSTR("localization"));
}

- (NSString)errorTitle
{
  return (NSString *)-[NSDictionary objectForKey:](self->super._responseDictionary, "objectForKey:", CFSTR("errorTitle"));
}

- (NSString)errorMessage
{
  return (NSString *)-[NSDictionary objectForKey:](self->super._responseDictionary, "objectForKey:", CFSTR("errorMessage"));
}

- (int64_t)errorCode
{
  void *v2;
  int64_t v3;

  -[NSDictionary objectForKey:](self->super._responseDictionary, "objectForKey:", CFSTR("errorCode"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

@end
