@implementation COMTErrorResult

- (COMTErrorResult)initWithError:(id)a3 actionIdentifier:(id)a4
{
  id v7;
  COMTErrorResult *v8;
  COMTErrorResult *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)COMTErrorResult;
  v8 = -[COMTResult initWithActionIdentifier:](&v11, sel_initWithActionIdentifier_, a4);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_error, a3);

  return v9;
}

- (COMTErrorResult)initWithCoder:(id)a3
{
  id v4;
  COMTErrorResult *v5;
  uint64_t v6;
  NSError *error;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)COMTErrorResult;
  v5 = -[COMTResult initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ER"));
    v6 = objc_claimAutoreleasedReturnValue();
    error = v5->_error;
    v5->_error = (NSError *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)COMTErrorResult;
  v4 = a3;
  -[COMTResult encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[COMTErrorResult error](self, "error", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("ER"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
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
