@implementation LNNeedsValueResponse

- (LNNeedsValueResponse)initWithIdentifier:(id)a3 value:(id)a4 updates:(id)a5
{
  id v10;
  unint64_t v11;
  unint64_t v12;
  LNNeedsValueResponse *v13;
  LNNeedsValueResponse *v14;
  LNNeedsValueResponse *v15;
  void *v17;
  void *v18;
  objc_super v19;

  v10 = a3;
  v11 = (unint64_t)a4;
  v12 = (unint64_t)a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNNeedsValueResponse.m"), 19, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  if (!(v11 | v12))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNNeedsValueResponse.m"), 20, CFSTR("either value or updates must be non-null."));

  }
  v19.receiver = self;
  v19.super_class = (Class)LNNeedsValueResponse;
  v13 = -[LNNeedsValueResponse init](&v19, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_identifier, a3);
    objc_storeStrong((id *)&v14->_value, a4);
    objc_storeStrong((id *)&v14->_updates, a5);
    v15 = v14;
  }

  return v14;
}

- (LNNeedsValueResponse)initWithIdentifier:(id)a3 value:(id)a4
{
  return -[LNNeedsValueResponse initWithIdentifier:value:updates:](self, "initWithIdentifier:value:updates:", a3, a4, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[LNNeedsValueResponse identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[LNNeedsValueResponse value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("value"));

  -[LNNeedsValueResponse updates](self, "updates");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("updates"));

}

- (LNNeedsValueResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  LNNeedsValueResponse *v12;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("value"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("updates"));
  v11 = objc_claimAutoreleasedReturnValue();

  if (v5 && v6 | v11)
  {
    self = -[LNNeedsValueResponse initWithIdentifier:value:updates:](self, "initWithIdentifier:value:updates:", v5, v6, v11);
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

- (LNValue)value
{
  return self->_value;
}

- (NSDictionary)updates
{
  return self->_updates;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updates, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
