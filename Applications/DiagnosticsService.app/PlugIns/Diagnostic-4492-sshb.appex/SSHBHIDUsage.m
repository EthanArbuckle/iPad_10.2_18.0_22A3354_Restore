@implementation SSHBHIDUsage

- (SSHBHIDUsage)initWithPrimaryUsage:(unsigned int)a3 primaryUsagePage:(unsigned int)a4
{
  SSHBHIDUsage *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SSHBHIDUsage;
  result = -[SSHBHIDUsage init](&v7, "init");
  if (result)
  {
    result->_primaryUsage = a3;
    result->_primaryUsagePage = a4;
  }
  return result;
}

- (unint64_t)hash
{
  unsigned int v3;

  v3 = -[SSHBHIDUsage primaryUsage](self, "primaryUsage");
  return -[SSHBHIDUsage primaryUsagePage](self, "primaryUsagePage") + (v3 << 16);
}

- (unsigned)primaryUsage
{
  return self->_primaryUsage;
}

- (unsigned)primaryUsagePage
{
  return self->_primaryUsagePage;
}

@end
