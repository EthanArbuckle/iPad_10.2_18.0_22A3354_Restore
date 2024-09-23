@implementation LNDisambiguationResponse

- (LNDisambiguationResponse)initWithIdentifier:(id)a3 selectedIndex:(id)a4 value:(id)a5 updates:(id)a6
{
  id v12;
  id v13;
  id v14;
  id v15;
  LNDisambiguationResponse *v16;
  LNDisambiguationResponse *v17;
  LNDisambiguationResponse *v18;
  void *v20;
  void *v21;
  objc_super v22;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (v12)
  {
    if (v13)
      goto LABEL_6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNDisambiguationResponse.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

    if (v13)
      goto LABEL_6;
  }
  if (!v14 && !v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNDisambiguationResponse.m"), 21, CFSTR("either selectedIndex, value, or updates must be non-null."));

  }
LABEL_6:
  v22.receiver = self;
  v22.super_class = (Class)LNDisambiguationResponse;
  v16 = -[LNDisambiguationResponse init](&v22, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_identifier, a3);
    objc_storeStrong((id *)&v17->_selectedIndex, a4);
    objc_storeStrong((id *)&v17->_value, a5);
    objc_storeStrong((id *)&v17->_updates, a6);
    v18 = v17;
  }

  return v17;
}

- (LNDisambiguationResponse)initWithIdentifier:(id)a3 selectedIndex:(id)a4 value:(id)a5
{
  return -[LNDisambiguationResponse initWithIdentifier:selectedIndex:value:updates:](self, "initWithIdentifier:selectedIndex:value:updates:", a3, a4, a5, 0);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNDisambiguationResponse identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNDisambiguationResponse selectedIndex](self, "selectedIndex");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNDisambiguationResponse value](self, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNDisambiguationResponse updates](self, "updates");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, identifier: %@, selectedIndex: %@, value: %@, updates: %@>"), v5, self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[LNDisambiguationResponse identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[LNDisambiguationResponse selectedIndex](self, "selectedIndex");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("selectedIndex"));

  -[LNDisambiguationResponse value](self, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("value"));

  -[LNDisambiguationResponse updates](self, "updates");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("updates"));

}

- (LNDisambiguationResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  LNDisambiguationResponse *v13;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("selectedIndex"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("value"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("updates"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && (v6 || v7 || v12))
  {
    self = -[LNDisambiguationResponse initWithIdentifier:selectedIndex:value:updates:](self, "initWithIdentifier:selectedIndex:value:updates:", v5, v6, v7, v12);
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSNumber)selectedIndex
{
  return self->_selectedIndex;
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
  objc_storeStrong((id *)&self->_selectedIndex, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
