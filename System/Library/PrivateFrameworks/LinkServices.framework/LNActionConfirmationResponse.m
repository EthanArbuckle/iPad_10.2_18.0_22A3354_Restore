@implementation LNActionConfirmationResponse

- (LNActionConfirmationResponse)initWithIdentifier:(id)a3 updates:(id)a4
{
  id v8;
  id v9;
  LNActionConfirmationResponse *v10;
  LNActionConfirmationResponse *v11;
  LNActionConfirmationResponse *v12;
  void *v14;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNActionConfirmationResponse.m"), 18, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  v15.receiver = self;
  v15.super_class = (Class)LNActionConfirmationResponse;
  v10 = -[LNActionConfirmationResponse init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_identifier, a3);
    objc_storeStrong((id *)&v11->_updates, a4);
    v12 = v11;
  }

  return v11;
}

- (LNActionConfirmationResponse)initWithIdentifier:(id)a3
{
  return -[LNActionConfirmationResponse initWithIdentifier:updates:](self, "initWithIdentifier:updates:", a3, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[LNActionConfirmationResponse identifier](self, "identifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

}

- (LNActionConfirmationResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  LNActionConfirmationResponse *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("updates"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[LNActionConfirmationResponse initWithIdentifier:updates:](self, "initWithIdentifier:updates:", v5, v10);
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSDictionary)updates
{
  return self->_updates;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updates, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
