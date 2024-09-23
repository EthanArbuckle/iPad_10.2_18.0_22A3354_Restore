@implementation DMFEchoResultObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFEchoResultObject)initWithCoder:(id)a3
{
  id v4;
  DMFEchoResultObject *v5;
  void *v6;
  uint64_t v7;
  NSString *echo;
  void *v9;
  uint64_t v10;
  NSString *resultStatus;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DMFEchoResultObject;
  v5 = -[CATTaskResultObject initWithCoder:](&v13, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("echo"));
    v7 = objc_claimAutoreleasedReturnValue();
    echo = v5->_echo;
    v5->_echo = (NSString *)v7;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("resultStatus"));
    v10 = objc_claimAutoreleasedReturnValue();
    resultStatus = v5->_resultStatus;
    v5->_resultStatus = (NSString *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DMFEchoResultObject;
  v4 = a3;
  -[CATTaskResultObject encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[DMFEchoResultObject echo](self, "echo", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("echo"));

  -[DMFEchoResultObject resultStatus](self, "resultStatus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("resultStatus"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[DMFEchoResultObject echo](self, "echo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMFEchoResultObject resultStatus](self, "resultStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Echo: '%@' result: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)echo
{
  return self->_echo;
}

- (void)setEcho:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)resultStatus
{
  return self->_resultStatus;
}

- (void)setResultStatus:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultStatus, 0);
  objc_storeStrong((id *)&self->_echo, 0);
}

@end
