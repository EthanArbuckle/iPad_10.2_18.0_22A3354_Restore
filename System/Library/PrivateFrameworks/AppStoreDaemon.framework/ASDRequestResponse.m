@implementation ASDRequestResponse

- (BOOL)success
{
  return self->_success;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDRequestResponse)initWithCoder:(id)a3
{
  id v4;
  ASDRequestResponse *v5;
  uint64_t v6;
  NSError *error;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDRequestResponse;
  v5 = -[ASDRequestResponse init](&v9, sel_init);
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

@end
