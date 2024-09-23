@implementation LNParameterSubstitution

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[LNParameterSubstitution parameterIdentifier](self, "parameterIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("parameterIdentifier"));

  -[LNParameterSubstitution substitutionValues](self, "substitutionValues");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("substitutionValues"));

}

- (NSString)parameterIdentifier
{
  return self->_parameterIdentifier;
}

- (NSArray)substitutionValues
{
  return self->_substitutionValues;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_substitutionValues, 0);
  objc_storeStrong((id *)&self->_parameterIdentifier, 0);
}

- (LNParameterSubstitution)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  LNParameterSubstitution *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parameterIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("substitutionValues"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      self = -[LNParameterSubstitution initWithParameterIdentifier:substitutionValues:](self, "initWithParameterIdentifier:substitutionValues:", v5, v9);
      v10 = self;
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (LNParameterSubstitution)initWithParameterIdentifier:(id)a3 substitutionValues:(id)a4
{
  id v7;
  id v8;
  void *v9;
  LNParameterSubstitution *v10;
  uint64_t v11;
  NSString *parameterIdentifier;
  uint64_t v13;
  NSArray *substitutionValues;
  LNParameterSubstitution *v15;
  void *v17;
  void *v18;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNParameterSubstitution.m"), 18, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parameterIdentifier"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNParameterSubstitution.m"), 19, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("substitutionValues"));

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)LNParameterSubstitution;
  v10 = -[LNParameterSubstitution init](&v19, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v7, "copy");
    parameterIdentifier = v10->_parameterIdentifier;
    v10->_parameterIdentifier = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    substitutionValues = v10->_substitutionValues;
    v10->_substitutionValues = (NSArray *)v13;

    v15 = v10;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
