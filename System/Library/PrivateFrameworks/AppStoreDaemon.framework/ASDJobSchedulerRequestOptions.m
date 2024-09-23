@implementation ASDJobSchedulerRequestOptions

- (ASDJobSchedulerRequestOptions)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ASDJobSchedulerRequestOptions;
  return -[ASDJobSchedulerRequestOptions init](&v3, sel_init);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[ASDJobSchedulerRequestOptions init](+[ASDJobSchedulerRequestOptions allocWithZone:](ASDJobSchedulerRequestOptions, "allocWithZone:", a3), "init");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDJobSchedulerRequestOptions)initWithCoder:(id)a3
{
  id v4;
  ASDJobSchedulerRequestOptions *v5;

  v4 = a3;
  v5 = -[ASDJobSchedulerRequestOptions init](self, "init");
  if (v5)
    v5->_verbose = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("verboseKey"));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeBool:forKey:", 1, CFSTR("verboseKey"));
}

- (BOOL)verbose
{
  return self->_verbose;
}

- (void)setVerbose:(BOOL)a3
{
  self->_verbose = a3;
}

@end
