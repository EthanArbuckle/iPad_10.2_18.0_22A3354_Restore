@implementation EMMessageDeliveryResult

- (EMMessageDeliveryResult)initWithStatus:(int64_t)a3 error:(id)a4
{
  id v7;
  EMMessageDeliveryResult *v8;
  EMMessageDeliveryResult *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)EMMessageDeliveryResult;
  v8 = -[EMMessageDeliveryResult init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_status = a3;
    objc_storeStrong((id *)&v8->_error, a4);
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMMessageDeliveryResult)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  EMMessageDeliveryResult *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("EFPropertyKey_status"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_error"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[EMMessageDeliveryResult initWithStatus:error:](self, "initWithStatus:error:", v5, v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", -[EMMessageDeliveryResult status](self, "status"), CFSTR("EFPropertyKey_status"));
  -[EMMessageDeliveryResult error](self, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("EFPropertyKey_error"));

}

- (int64_t)status
{
  return self->_status;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
}

@end
