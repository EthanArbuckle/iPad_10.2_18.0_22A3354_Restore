@implementation ATVHighSecurityAccountVerifyCodeResponse

- (BOOL)success
{
  void *v2;
  char v3;

  -[NSDictionary objectForKey:](self->super._responseDictionary, "objectForKey:", CFSTR("success"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
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
