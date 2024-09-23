@implementation AAInheritance

- (void)encodeWithCoder:(id)a3
{
  NSArray *beneficiaries;
  id v5;

  beneficiaries = self->_beneficiaries;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", beneficiaries, CFSTR("_beneficiaries"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_benefactors, CFSTR("_benefactors"));

}

- (AAInheritance)initWithCoder:(id)a3
{
  id v4;
  AAInheritance *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSArray *beneficiaries;
  uint64_t v14;
  NSArray *benefactors;

  v4 = a3;
  v5 = -[AAInheritance init](self, "init");
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0C99E60];
    v10 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("_beneficiaries"));
    v12 = objc_claimAutoreleasedReturnValue();
    beneficiaries = v5->_beneficiaries;
    v5->_beneficiaries = (NSArray *)v12;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("_benefactors"));
    v14 = objc_claimAutoreleasedReturnValue();
    benefactors = v5->_benefactors;
    v5->_benefactors = (NSArray *)v14;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  AAInheritance *v4;
  uint64_t v5;
  NSArray *beneficiaries;
  uint64_t v7;
  NSArray *benefactors;

  v4 = objc_alloc_init(AAInheritance);
  v5 = -[NSArray copy](self->_beneficiaries, "copy");
  beneficiaries = v4->_beneficiaries;
  v4->_beneficiaries = (NSArray *)v5;

  v7 = -[NSArray copy](self->_benefactors, "copy");
  benefactors = v4->_benefactors;
  v4->_benefactors = (NSArray *)v7;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)beneficiaries
{
  return self->_beneficiaries;
}

- (NSArray)benefactors
{
  return self->_benefactors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_benefactors, 0);
  objc_storeStrong((id *)&self->_beneficiaries, 0);
}

@end
