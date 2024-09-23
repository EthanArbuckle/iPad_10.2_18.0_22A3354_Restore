@implementation LNConfirmationResponse

- (LNConfirmationResponse)initWithIdentifier:(id)a3 confirmed:(BOOL)a4 updates:(id)a5
{
  id v10;
  id v11;
  LNConfirmationResponse *v12;
  LNConfirmationResponse *v13;
  LNConfirmationResponse *v14;
  void *v16;
  objc_super v17;

  v10 = a3;
  v11 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNConfirmationResponse.m"), 19, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  v17.receiver = self;
  v17.super_class = (Class)LNConfirmationResponse;
  v12 = -[LNConfirmationResponse init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    v13->_confirmed = a4;
    objc_storeStrong((id *)&v13->_updates, a5);
    v14 = v13;
  }

  return v13;
}

- (LNConfirmationResponse)initWithIdentifier:(id)a3 confirmed:(BOOL)a4
{
  return -[LNConfirmationResponse initWithIdentifier:confirmed:updates:](self, "initWithIdentifier:confirmed:updates:", a3, a4, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[LNConfirmationResponse identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  objc_msgSend(v4, "encodeBool:forKey:", -[LNConfirmationResponse isConfirmed](self, "isConfirmed"), CFSTR("confirmed"));
  -[LNConfirmationResponse updates](self, "updates");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("updates"));

}

- (LNConfirmationResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  LNConfirmationResponse *v12;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("confirmed"));
  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("updates"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[LNConfirmationResponse initWithIdentifier:confirmed:updates:](self, "initWithIdentifier:confirmed:updates:", v5, v6, v11);
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (BOOL)isConfirmed
{
  return self->_confirmed;
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
