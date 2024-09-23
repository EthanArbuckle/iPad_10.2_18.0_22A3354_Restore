@implementation LNAutoShortcutSubstitution

- (LNAutoShortcutSubstitution)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  LNAutoShortcutSubstitution *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("basePhraseTemplateSubstitutions"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      self = -[LNAutoShortcutSubstitution initWithActionIdentifier:basePhraseTemplateSubstitutions:](self, "initWithActionIdentifier:basePhraseTemplateSubstitutions:", v5, v9);
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

- (LNAutoShortcutSubstitution)initWithActionIdentifier:(id)a3 basePhraseTemplateSubstitutions:(id)a4
{
  id v7;
  id v8;
  void *v9;
  LNAutoShortcutSubstitution *v10;
  uint64_t v11;
  NSString *actionIdentifier;
  uint64_t v13;
  NSArray *basePhraseTemplateSubstitutions;
  LNAutoShortcutSubstitution *v15;
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
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNAutoShortcutSubstitution.m"), 18, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("actionIdentifier"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNAutoShortcutSubstitution.m"), 19, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("basePhraseTemplateSubstitutions"));

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)LNAutoShortcutSubstitution;
  v10 = -[LNAutoShortcutSubstitution init](&v19, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v7, "copy");
    actionIdentifier = v10->_actionIdentifier;
    v10->_actionIdentifier = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    basePhraseTemplateSubstitutions = v10->_basePhraseTemplateSubstitutions;
    v10->_basePhraseTemplateSubstitutions = (NSArray *)v13;

    v15 = v10;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[LNAutoShortcutSubstitution actionIdentifier](self, "actionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("actionIdentifier"));

  -[LNAutoShortcutSubstitution basePhraseTemplateSubstitutions](self, "basePhraseTemplateSubstitutions");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("basePhraseTemplateSubstitutions"));

}

- (NSArray)basePhraseTemplateSubstitutions
{
  return self->_basePhraseTemplateSubstitutions;
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_basePhraseTemplateSubstitutions, 0);
  objc_storeStrong((id *)&self->_actionIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
