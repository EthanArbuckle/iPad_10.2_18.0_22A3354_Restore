@implementation AMSFDSResult

- (AMSFDSResult)initWithValue:(id)a3 action:(unint64_t)a4
{
  id v6;
  AMSFDSResult *v7;
  uint64_t v8;
  NSString *value;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSFDSResult;
  v7 = -[AMSFDSResult init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    value = v7->_value;
    v7->_value = (NSString *)v8;

    v7->_action = a4;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  AMSFDSResult *v5;
  uint64_t v6;
  NSString *sessionIdentifier;
  uint64_t v8;
  NSString *value;

  v5 = objc_alloc_init(AMSFDSResult);
  v5->_action = self->_action;
  v6 = -[NSString copyWithZone:](self->_sessionIdentifier, "copyWithZone:", a3);
  sessionIdentifier = v5->_sessionIdentifier;
  v5->_sessionIdentifier = (NSString *)v6;

  v8 = -[NSString copyWithZone:](self->_value, "copyWithZone:", a3);
  value = v5->_value;
  v5->_value = (NSString *)v8;

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[AMSFDSResult action](self, "action"), CFSTR("action"));
  -[AMSFDSResult sessionIdentifier](self, "sessionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("sessionIdentifier"));

  -[AMSFDSResult value](self, "value");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("value"));

}

- (AMSFDSResult)initWithCoder:(id)a3
{
  id v4;
  AMSFDSResult *v5;
  uint64_t v6;
  NSString *sessionIdentifier;
  uint64_t v8;
  NSString *value;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSFDSResult;
  v5 = -[AMSFDSResult init](&v11, sel_init);
  if (v5)
  {
    v5->_action = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("action"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sessionIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    sessionIdentifier = v5->_sessionIdentifier;
    v5->_sessionIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("value"));
    v8 = objc_claimAutoreleasedReturnValue();
    value = v5->_value;
    v5->_value = (NSString *)v8;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)action
{
  return self->_action;
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

@end
