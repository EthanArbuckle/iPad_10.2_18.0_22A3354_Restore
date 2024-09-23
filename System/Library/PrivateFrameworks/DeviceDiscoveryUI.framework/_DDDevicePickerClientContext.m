@implementation _DDDevicePickerClientContext

- (_DDDevicePickerClientContext)initWithSessionIdentifier:(id)a3
{
  id v4;
  _DDDevicePickerClientContext *v5;
  uint64_t v6;
  NSString *sessionIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_DDDevicePickerClientContext;
  v5 = -[_DDDevicePickerClientContext init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    sessionIdentifier = v5->_sessionIdentifier;
    v5->_sessionIdentifier = (NSString *)v6;

  }
  return v5;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_DDDevicePickerClientContext sessionIdentifier](self, "sessionIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("sessionIdentifier"));

}

- (_DDDevicePickerClientContext)initWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  _DDDevicePickerClientContext *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sessionIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_DDDevicePickerClientContext initWithSessionIdentifier:](self, "initWithSessionIdentifier:", v5);
  return v6;
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
}

@end
