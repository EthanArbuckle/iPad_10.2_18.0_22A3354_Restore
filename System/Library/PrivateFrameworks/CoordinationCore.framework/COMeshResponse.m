@implementation COMeshResponse

- (COMeshResponse)initWithError:(id)a3
{
  id v5;
  COMeshResponse *v6;
  COMeshResponse *v7;

  v5 = a3;
  v6 = -[COMeshCommand init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_error, a3);

  return v7;
}

- (COMeshResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  COMeshResponse *v6;
  COMeshResponse *v7;
  objc_super v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("error"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_msgSend(v4, "containsValueForKey:", CFSTR("error")) & 1) == 0)
  {
    v9.receiver = self;
    v9.super_class = (Class)COMeshResponse;
    v7 = -[COMeshCommand initWithCoder:](&v9, sel_initWithCoder_, v4);
    v6 = v7;
    if (v7)
      objc_storeStrong((id *)&v7->_error, v5);
  }
  else
  {

    v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)COMeshResponse;
  -[COMeshCommand encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[COMeshResponse error](self, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("error"));

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
