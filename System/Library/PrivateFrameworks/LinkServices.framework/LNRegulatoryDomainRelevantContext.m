@implementation LNRegulatoryDomainRelevantContext

- (LNRegulatoryDomainRelevantContext)initWithCountryCodes:(id)a3
{
  id v4;
  LNRegulatoryDomainRelevantContext *v5;
  uint64_t v6;
  NSSet *countryCodes;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LNRegulatoryDomainRelevantContext;
  v5 = -[LNRelevantContext _init](&v9, sel__init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    countryCodes = v5->_countryCodes;
    v5->_countryCodes = (NSSet *)v6;

  }
  return v5;
}

- (LNRegulatoryDomainRelevantContext)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  LNRegulatoryDomainRelevantContext *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("countryCodes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[LNRegulatoryDomainRelevantContext initWithCountryCodes:](self, "initWithCountryCodes:", v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[LNRegulatoryDomainRelevantContext countryCodes](self, "countryCodes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("countryCodes"));

}

- (unint64_t)hash
{
  return -[NSSet hash](self->_countryCodes, "hash");
}

- (BOOL)isEqual:(id)a3
{
  LNRegulatoryDomainRelevantContext *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (LNRegulatoryDomainRelevantContext *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[LNRegulatoryDomainRelevantContext countryCodes](v4, "countryCodes");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[LNRegulatoryDomainRelevantContext countryCodes](self, "countryCodes");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[LNRegulatoryDomainRelevantContext countryCodes](self, "countryCodes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<regulatory domain: %@>"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)analyticsDescription
{
  return CFSTR(".regulatoryDomain()");
}

- (NSSet)countryCodes
{
  return self->_countryCodes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countryCodes, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
