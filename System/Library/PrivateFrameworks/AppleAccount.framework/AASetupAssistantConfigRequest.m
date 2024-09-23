@implementation AASetupAssistantConfigRequest

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (id)urlString
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AASetupAssistantConfigRequest;
  -[AAURLConfigurationRequest urlString](&v7, sel_urlString);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "rangeOfString:", CFSTR("?"));
  objc_msgSend(v2, "stringByReplacingCharactersInRange:withString:", v3, objc_msgSend(v2, "length") + v4 + ~v3, CFSTR("?context=buddy"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
