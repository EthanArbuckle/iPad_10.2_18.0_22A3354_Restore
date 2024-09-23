@implementation ICASActionMenuData

- (ICASActionMenuData)initWithActionMenuUsageType:(id)a3 actionMenuContextType:(id)a4 actionMenuSelection:(id)a5
{
  id v9;
  id v10;
  id v11;
  ICASActionMenuData *v12;
  ICASActionMenuData *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ICASActionMenuData;
  v12 = -[ICASActionMenuData init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_actionMenuUsageType, a3);
    objc_storeStrong((id *)&v13->_actionMenuContextType, a4);
    objc_storeStrong((id *)&v13->_actionMenuSelection, a5);
  }

  return v13;
}

+ (NSString)dataName
{
  return (NSString *)CFSTR("ActionMenuData");
}

- (id)toDict
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v14[0] = CFSTR("actionMenuUsageType");
  -[ICASActionMenuData actionMenuUsageType](self, "actionMenuUsageType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[ICASActionMenuData actionMenuUsageType](self, "actionMenuUsageType");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = objc_opt_new();
  }
  v5 = (void *)v4;
  v15[0] = v4;
  v14[1] = CFSTR("actionMenuContextType");
  -[ICASActionMenuData actionMenuContextType](self, "actionMenuContextType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[ICASActionMenuData actionMenuContextType](self, "actionMenuContextType");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = objc_opt_new();
  }
  v8 = (void *)v7;
  v15[1] = v7;
  v14[2] = CFSTR("actionMenuSelection");
  -[ICASActionMenuData actionMenuSelection](self, "actionMenuSelection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[ICASActionMenuData actionMenuSelection](self, "actionMenuSelection");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = objc_opt_new();
  }
  v11 = (void *)v10;
  v15[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (ICASActionMenuUsageType)actionMenuUsageType
{
  return self->_actionMenuUsageType;
}

- (ICASActionMenuContextType)actionMenuContextType
{
  return self->_actionMenuContextType;
}

- (NSString)actionMenuSelection
{
  return self->_actionMenuSelection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionMenuSelection, 0);
  objc_storeStrong((id *)&self->_actionMenuContextType, 0);
  objc_storeStrong((id *)&self->_actionMenuUsageType, 0);
}

@end
