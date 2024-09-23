@implementation CNContactActionsContext

- (CNContactActionsContext)init
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  CNContactActionsContext *v7;

  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D13D88]);
  objc_msgSend(v3, "actionDiscoveringEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithDiscoveringEnvironment:", v5);

  v7 = -[CNContactActionsContext initWithDataSource:environment:](self, "initWithDataSource:environment:", v6, v3);
  return v7;
}

- (CNContactActionsContext)initWithDataSource:(id)a3 environment:(id)a4
{
  id v7;
  id v8;
  CNContactActionsContext *v9;
  CNContactActionsContext *v10;
  CNContactActionsContext *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNContactActionsContext;
  v9 = -[CNContactActionsContext init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dataSource, a3);
    objc_storeStrong((id *)&v10->_environment, a4);
    v11 = v10;
  }

  return v10;
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("dataSource"), self->_dataSource);
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setCacheEntryLimit:(unint64_t)a3
{
  void *v6;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CNContactActionsContext.m"), 50, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("limit > 0"));

  }
  -[CNUIUserActionListDataSource setCacheCapacity:](self->_dataSource, "setCacheCapacity:", a3);
}

- (void)setCacheEntryRefreshAge:(double)a3
{
  -[CNUIUserActionListDataSource setCacheEntryRefreshAge:](self->_dataSource, "setCacheEntryRefreshAge:", a3);
}

- (void)setCacheEntryExpirationAge:(double)a3
{
  -[CNUIUserActionListDataSource setCacheEntryExpirationAge:](self->_dataSource, "setCacheEntryExpirationAge:", a3);
}

- (CNUIUserActionListDataSource)dataSource
{
  return (CNUIUserActionListDataSource *)objc_getProperty(self, a2, 8, 1);
}

- (CNUIContactsEnvironment)environment
{
  return (CNUIContactsEnvironment *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end
