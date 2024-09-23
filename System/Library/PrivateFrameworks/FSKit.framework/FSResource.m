@implementation FSResource

+ (BOOL)supportsSecureCoding
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("This object may only be encoded by an NSXPCCoder."), 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v4);
  }
  objc_msgSend(v5, "encodeInt:forKey:", self->_state, CFSTR("FSResource.State"));

}

- (FSResource)initWithCoder:(id)a3
{
  id v4;
  id v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("This object may only be decoded by an NSXPCCoder."), 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v6);
  }
  if (self)
    self->_state = objc_msgSend(v4, "decodeIntForKey:", CFSTR("FSResource.State"));

  return self;
}

- (void)revoke
{
  self->_isRevoked = 1;
}

- (int64_t)kind
{
  return 0;
}

- (id)makeProxy
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCA98];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Can't create a proxy object of a base FSResource"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v4, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v5);
}

- (BOOL)isRevoked
{
  return self->_isRevoked;
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

+ (id)dynamicCast:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (NSString)getResourceID
{
  return (NSString *)CFSTR("FSResource:GenericResourceID");
}

@end
