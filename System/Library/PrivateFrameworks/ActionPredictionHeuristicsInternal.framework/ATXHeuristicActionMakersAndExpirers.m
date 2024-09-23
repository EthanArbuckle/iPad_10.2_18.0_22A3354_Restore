@implementation ATXHeuristicActionMakersAndExpirers

- (ATXHeuristicActionMakersAndExpirers)initWithActionMakers:(id)a3 expirers:(id)a4
{
  id v7;
  id v8;
  ATXHeuristicActionMakersAndExpirers *v9;
  ATXHeuristicActionMakersAndExpirers *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXHeuristicActionMakersAndExpirers;
  v9 = -[ATXHeuristicActionMakersAndExpirers init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_actionMakers, a3);
    objc_storeStrong((id *)&v10->_expirers, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *actionMakers;
  id v5;

  actionMakers = self->_actionMakers;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", actionMakers, CFSTR("actionMakers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_expirers, CFSTR("expirers"));

}

- (ATXHeuristicActionMakersAndExpirers)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  ATXHeuristicActionMakersAndExpirers *v13;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("actionMakers"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v11, CFSTR("expirers"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[ATXHeuristicActionMakersAndExpirers initWithActionMakers:expirers:](self, "initWithActionMakers:expirers:", v8, v12);
  return v13;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<Actions: %@ Expirers: %@>"), self->_actionMakers, self->_expirers);
}

- (NSArray)actionMakers
{
  return self->_actionMakers;
}

- (NSSet)expirers
{
  return self->_expirers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirers, 0);
  objc_storeStrong((id *)&self->_actionMakers, 0);
}

@end
