@implementation NSURLSessionMutableEffectiveConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_initWithConfiguration:(id)a3
{

  return a3;
}

- (NSURLSessionMutableEffectiveConfiguration)initWithCoder:(id)a3
{
  NSURLSessionConfiguration *v4;

  if (objc_msgSend(a3, "decodeIntForKey:", CFSTR("EffectiveConfigurationVersion")) == 1)
    v4 = (NSURLSessionConfiguration *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_config"));
  else
    v4 = +[NSURLSessionConfiguration defaultSessionConfiguration](NSURLSessionConfiguration, "defaultSessionConfiguration");
  return (NSURLSessionMutableEffectiveConfiguration *)v4;
}

- (void)encodeWithCoder:(id)a3
{
  abort();
}

@end
