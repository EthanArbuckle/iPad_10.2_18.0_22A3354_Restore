@implementation INIntentForwardingActionResponse

- (INIntentForwardingActionResponse)initWithError:(id)a3
{
  id v5;
  INIntentForwardingActionResponse *v6;
  INIntentForwardingActionResponse *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)INIntentForwardingActionResponse;
  v6 = -[INIntentForwardingActionResponse init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_error, a3);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_error, CFSTR("error"));
}

- (INIntentForwardingActionResponse)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  INIntentForwardingActionResponse *v14;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, v7, v8, v9, v10, v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v12, CFSTR("error"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[INIntentForwardingActionResponse initWithError:](self, "initWithError:", v13);
  return v14;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
