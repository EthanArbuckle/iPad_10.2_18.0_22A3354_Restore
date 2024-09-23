@implementation IRServiceLogPrefix

- (IRServiceLogPrefix)init
{
  IRServiceLogPrefix *v2;
  IRServiceLogPrefix *v3;
  NSString *prefix;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IRServiceLogPrefix;
  v2 = -[IRServiceLogPrefix init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    prefix = v2->_prefix;
    v2->_prefix = (NSString *)&stru_251046168;

  }
  return v3;
}

- (id)description
{
  return self->_prefix;
}

- (NSString)prefix
{
  return self->_prefix;
}

- (void)setPrefix:(id)a3
{
  objc_storeStrong((id *)&self->_prefix, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prefix, 0);
}

@end
