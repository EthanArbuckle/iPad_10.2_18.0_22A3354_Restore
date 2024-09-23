@implementation ASDPurchaseResult

- (ASDPurchaseResult)initWithSuccess:(BOOL)a3 error:(id)a4
{
  id v7;
  ASDPurchaseResult *v8;
  ASDPurchaseResult *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ASDPurchaseResult;
  v8 = -[ASDPurchaseResult init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_success = a3;
    objc_storeStrong((id *)&v8->_error, a4);
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v5 = objc_alloc_init((Class)objc_opt_class());
  v6 = -[NSError copyWithZone:](self->_error, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  *((_BYTE *)v5 + 8) = self->_success;
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDPurchaseResult)initWithCoder:(id)a3
{
  id v4;
  ASDPurchaseResult *v5;
  uint64_t v6;
  NSError *error;

  v4 = a3;
  v5 = -[ASDPurchaseResult init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("error"));
    v6 = objc_claimAutoreleasedReturnValue();
    error = v5->_error;
    v5->_error = (NSError *)v6;

    v5->_success = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("success"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSError *error;
  void *v5;
  id v6;

  v6 = a3;
  error = self->_error;
  if (error)
  {
    ASDErrorWithSafeUserInfo(error);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("error"));

  }
  objc_msgSend(v6, "encodeBool:forKey:", self->_success, CFSTR("success"));

}

- (BOOL)success
{
  return self->_success;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
