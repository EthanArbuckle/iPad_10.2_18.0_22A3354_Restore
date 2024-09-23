@implementation LNBasePhraseTemplateSubstitution

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[LNBasePhraseTemplateSubstitution basePhraseTemplate](self, "basePhraseTemplate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("basePhraseTemplate"));

  -[LNBasePhraseTemplateSubstitution parameterSubstitutions](self, "parameterSubstitutions");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("parameterSubstitutions"));

}

- (NSString)basePhraseTemplate
{
  return self->_basePhraseTemplate;
}

- (NSArray)parameterSubstitutions
{
  return self->_parameterSubstitutions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameterSubstitutions, 0);
  objc_storeStrong((id *)&self->_basePhraseTemplate, 0);
}

- (LNBasePhraseTemplateSubstitution)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  LNBasePhraseTemplateSubstitution *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("basePhraseTemplate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("parameterSubstitutions"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      self = -[LNBasePhraseTemplateSubstitution initWithBasePhraseTemplate:parameterSubstitutions:](self, "initWithBasePhraseTemplate:parameterSubstitutions:", v5, v9);
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

- (LNBasePhraseTemplateSubstitution)initWithBasePhraseTemplate:(id)a3 parameterSubstitutions:(id)a4
{
  id v7;
  id v8;
  void *v9;
  LNBasePhraseTemplateSubstitution *v10;
  uint64_t v11;
  NSString *basePhraseTemplate;
  uint64_t v13;
  NSArray *parameterSubstitutions;
  LNBasePhraseTemplateSubstitution *v15;
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
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNBasePhraseTemplateSubstitution.m"), 18, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("basePhraseTemplate"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNBasePhraseTemplateSubstitution.m"), 19, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parameterSubstitutions"));

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)LNBasePhraseTemplateSubstitution;
  v10 = -[LNBasePhraseTemplateSubstitution init](&v19, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v7, "copy");
    basePhraseTemplate = v10->_basePhraseTemplate;
    v10->_basePhraseTemplate = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    parameterSubstitutions = v10->_parameterSubstitutions;
    v10->_parameterSubstitutions = (NSArray *)v13;

    v15 = v10;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
