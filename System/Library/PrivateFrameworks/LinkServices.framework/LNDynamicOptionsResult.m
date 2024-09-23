@implementation LNDynamicOptionsResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dependentParameterIdentifiers, 0);
  objc_storeStrong((id *)&self->_promptLabel, 0);
  objc_storeStrong((id *)&self->_sections, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[LNDynamicOptionsResult sections](self, "sections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("sections"));

  objc_msgSend(v4, "encodeBool:forKey:", -[LNDynamicOptionsResult usesIndexedCollation](self, "usesIndexedCollation"), CFSTR("usesIndexedCollation"));
  -[LNDynamicOptionsResult promptLabel](self, "promptLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("promptLabel"));

  -[LNDynamicOptionsResult dependentParameterIdentifiers](self, "dependentParameterIdentifiers");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("dependentParameterIdentifiers"));

}

- (BOOL)usesIndexedCollation
{
  return self->_usesIndexedCollation;
}

- (NSArray)sections
{
  return self->_sections;
}

- (LNStaticDeferredLocalizedString)promptLabel
{
  return self->_promptLabel;
}

- (NSArray)dependentParameterIdentifiers
{
  return self->_dependentParameterIdentifiers;
}

- (LNDynamicOptionsResult)initWithSections:(id)a3 usesIndexedCollation:(BOOL)a4 promptLabel:(id)a5 dependentParameterIdentifiers:(id)a6
{
  id v11;
  id v12;
  id v13;
  LNDynamicOptionsResult *v14;
  uint64_t v15;
  NSArray *sections;
  uint64_t v17;
  LNStaticDeferredLocalizedString *promptLabel;
  uint64_t v19;
  NSArray *dependentParameterIdentifiers;
  LNDynamicOptionsResult *v21;
  void *v23;
  objc_super v24;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNDynamicOptionsResult.m"), 156, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sections"));

  }
  v24.receiver = self;
  v24.super_class = (Class)LNDynamicOptionsResult;
  v14 = -[LNDynamicOptionsResult init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v11, "copy");
    sections = v14->_sections;
    v14->_sections = (NSArray *)v15;

    v14->_usesIndexedCollation = a4;
    v17 = objc_msgSend(v12, "copy");
    promptLabel = v14->_promptLabel;
    v14->_promptLabel = (LNStaticDeferredLocalizedString *)v17;

    v19 = objc_msgSend(v13, "copy");
    dependentParameterIdentifiers = v14->_dependentParameterIdentifiers;
    v14->_dependentParameterIdentifiers = (NSArray *)v19;

    v21 = v14;
  }

  return v14;
}

- (LNDynamicOptionsResult)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  LNDynamicOptionsResult *v15;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("sections"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("usesIndexedCollation"));
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("promptLabel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0C99E60];
  v12 = objc_opt_class();
  objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v13, CFSTR("dependentParameterIdentifiers"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[LNDynamicOptionsResult initWithSections:usesIndexedCollation:promptLabel:dependentParameterIdentifiers:](self, "initWithSections:usesIndexedCollation:promptLabel:dependentParameterIdentifiers:", v8, v9, v10, v14);
  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNDynamicOptionsResult sections](self, "sections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[LNDynamicOptionsResult usesIndexedCollation](self, "usesIndexedCollation");
  -[LNDynamicOptionsResult promptLabel](self, "promptLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNDynamicOptionsResult dependentParameterIdentifiers](self, "dependentParameterIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, sections: %@, usesIndexedCollation: %i, promptLabel: %@, dependentParameterIdentifiers: %@>"), v5, self, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
