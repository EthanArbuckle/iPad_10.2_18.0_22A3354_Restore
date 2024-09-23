@implementation MCKeyValueSection

+ (id)sectionWithKeyValues:(id)a3
{
  id v3;
  MCKeyValueSection *v4;

  v3 = a3;
  v4 = -[MCKeyValueSection initWithSectionTitle:footer:keyValues:]([MCKeyValueSection alloc], "initWithSectionTitle:footer:keyValues:", 0, 0, v3);

  return v4;
}

+ (id)sectionWithLocalizedArray:(id)a3 title:(id)a4 footer:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  MCKeyValue *v17;
  MCKeyValue *v18;
  MCKeyValueSection *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v11 = v7;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v22;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v15);
        v17 = [MCKeyValue alloc];
        v18 = -[MCKeyValue initWithLocalizedString:localizedKey:](v17, "initWithLocalizedString:localizedKey:", 0, v16, (_QWORD)v21);
        objc_msgSend(v10, "addObject:", v18);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v13);
  }

  v19 = -[MCKeyValueSection initWithSectionTitle:footer:keyValues:]([MCKeyValueSection alloc], "initWithSectionTitle:footer:keyValues:", v8, v9, v10);
  return v19;
}

- (MCKeyValueSection)initWithSectionTitle:(id)a3 footer:(id)a4 keyValues:(id)a5
{
  id v9;
  id v10;
  id v11;
  MCKeyValueSection *v12;
  MCKeyValueSection *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MCKeyValueSection;
  v12 = -[MCKeyValueSection init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_sectionTitle, a3);
    objc_storeStrong((id *)&v13->_sectionFooter, a4);
    objc_storeStrong((id *)&v13->_sectionKeyValues, a5);
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[MCKeyValueSection sectionTitle](self, "sectionTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("sectionTitle"));

  -[MCKeyValueSection sectionFooter](self, "sectionFooter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("sectionFooter"));

  -[MCKeyValueSection sectionKeyValues](self, "sectionKeyValues");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("sectionKeyValues"));

}

- (MCKeyValueSection)initWithCoder:(id)a3
{
  id v4;
  MCKeyValueSection *v5;
  void *v6;
  uint64_t v7;
  NSString *sectionTitle;
  void *v9;
  uint64_t v10;
  NSString *sectionFooter;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSArray *sectionKeyValues;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MCKeyValueSection;
  v5 = -[MCKeyValueSection init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("sectionTitle"));
    v7 = objc_claimAutoreleasedReturnValue();
    sectionTitle = v5->_sectionTitle;
    v5->_sectionTitle = (NSString *)v7;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("sectionFooter"));
    v10 = objc_claimAutoreleasedReturnValue();
    sectionFooter = v5->_sectionFooter;
    v5->_sectionFooter = (NSString *)v10;

    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("sectionKeyValues"));
    v15 = objc_claimAutoreleasedReturnValue();
    sectionKeyValues = v5->_sectionKeyValues;
    v5->_sectionKeyValues = (NSArray *)v15;

  }
  return v5;
}

- (NSString)sectionTitle
{
  return self->_sectionTitle;
}

- (void)setSectionTitle:(id)a3
{
  objc_storeStrong((id *)&self->_sectionTitle, a3);
}

- (NSString)sectionFooter
{
  return self->_sectionFooter;
}

- (void)setSectionFooter:(id)a3
{
  objc_storeStrong((id *)&self->_sectionFooter, a3);
}

- (NSArray)sectionKeyValues
{
  return self->_sectionKeyValues;
}

- (void)setSectionKeyValues:(id)a3
{
  objc_storeStrong((id *)&self->_sectionKeyValues, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionKeyValues, 0);
  objc_storeStrong((id *)&self->_sectionFooter, 0);
  objc_storeStrong((id *)&self->_sectionTitle, 0);
}

@end
