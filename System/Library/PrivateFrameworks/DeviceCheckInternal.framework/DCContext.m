@implementation DCContext

- (DCContext)initWithCoder:(id)a3
{
  id v4;
  DCContext *v5;
  uint64_t v6;
  NSString *clientAppID;

  v4 = a3;
  v5 = -[DCContext init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_clientAppID"));
    v6 = objc_claimAutoreleasedReturnValue();
    clientAppID = v5->_clientAppID;
    v5->_clientAppID = (NSString *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_clientAppID, CFSTR("_clientAppID"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)clientAppID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setClientAppID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientAppID, 0);
}

@end
