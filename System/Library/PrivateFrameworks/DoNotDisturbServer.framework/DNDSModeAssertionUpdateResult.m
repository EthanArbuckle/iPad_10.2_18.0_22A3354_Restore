@implementation DNDSModeAssertionUpdateResult

+ (id)emptyResult
{
  id v2;

  v2 = objc_alloc((Class)a1);
  return (id)objc_msgSend(v2, "initWithAssertions:invalidations:", MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60]);
}

- (DNDSModeAssertionUpdateResult)initWithAssertions:(id)a3 invalidations:(id)a4
{
  id v6;
  id v7;
  DNDSModeAssertionUpdateResult *v8;
  uint64_t v9;
  NSArray *assertions;
  uint64_t v11;
  NSArray *invalidations;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DNDSModeAssertionUpdateResult;
  v8 = -[DNDSModeAssertionUpdateResult init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    assertions = v8->_assertions;
    v8->_assertions = (NSArray *)v9;

    v11 = objc_msgSend(v7, "copy");
    invalidations = v8->_invalidations;
    v8->_invalidations = (NSArray *)v11;

  }
  return v8;
}

- (id)resultCombiningWithResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  DNDSModeAssertionUpdateResult *v11;

  v4 = a3;
  -[DNDSModeAssertionUpdateResult assertions](self, "assertions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assertions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[DNDSModeAssertionUpdateResult invalidations](self, "invalidations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[DNDSModeAssertionUpdateResult initWithAssertions:invalidations:]([DNDSModeAssertionUpdateResult alloc], "initWithAssertions:invalidations:", v7, v10);
  return v11;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[DNDSModeAssertionUpdateResult assertions](self, "assertions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSModeAssertionUpdateResult invalidations](self, "invalidations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; assertions: %@; invalidations: %@>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSArray)assertions
{
  return self->_assertions;
}

- (NSArray)invalidations
{
  return self->_invalidations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidations, 0);
  objc_storeStrong((id *)&self->_assertions, 0);
}

@end
