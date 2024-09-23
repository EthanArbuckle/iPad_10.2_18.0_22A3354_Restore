@implementation CTRemotePlanIdentifierList

- (CTRemotePlanIdentifierList)init
{
  CTRemotePlanIdentifierList *v2;
  CTRemotePlanIdentifierList *v3;
  NSArray *planIdentifiers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CTRemotePlanIdentifierList;
  v2 = -[CTRemotePlanIdentifierList init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    planIdentifiers = v2->_planIdentifiers;
    v2->_planIdentifiers = 0;

  }
  return v3;
}

- (CTRemotePlanIdentifierList)initWithPlanIdentifiers:(id)a3
{
  id v5;
  CTRemotePlanIdentifierList *v6;
  CTRemotePlanIdentifierList *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTRemotePlanIdentifierList;
  v6 = -[CTRemotePlanIdentifierList init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_planIdentifiers, a3);

  return v7;
}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", planIdentifiers=%@"), self->_planIdentifiers);
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  CTRemotePlanIdentifierList *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (CTRemotePlanIdentifierList *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CTRemotePlanIdentifierList planIdentifiers](self, "planIdentifiers");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTRemotePlanIdentifierList planIdentifiers](v4, "planIdentifiers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5 == v6)
      {
        v9 = 1;
      }
      else
      {
        -[CTRemotePlanIdentifierList planIdentifiers](self, "planIdentifiers");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTRemotePlanIdentifierList planIdentifiers](v4, "planIdentifiers");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v7, "isEqual:", v8);

      }
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTRemotePlanIdentifierList)initWithCoder:(id)a3
{
  id v4;
  CTRemotePlanIdentifierList *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *planIdentifiers;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CTRemotePlanIdentifierList;
  v5 = -[CTRemotePlanIdentifierList init](&v12, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("planIdentifiers"));
    v9 = objc_claimAutoreleasedReturnValue();
    planIdentifiers = v5->_planIdentifiers;
    v5->_planIdentifiers = (NSArray *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_planIdentifiers, CFSTR("planIdentifiers"));
}

- (NSArray)planIdentifiers
{
  return self->_planIdentifiers;
}

- (void)setPlanIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_planIdentifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_planIdentifiers, 0);
}

@end
