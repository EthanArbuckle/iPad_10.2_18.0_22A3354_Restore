@implementation _DPNamespaceParameters

- (_DPNamespaceParameters)init
{

  return 0;
}

- (_DPNamespaceParameters)initWithDictionary:(id)a3
{
  id v4;
  _DPNamespaceParameters *v5;
  _DPNamespaceParameters *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  NSArray *v10;
  NSArray *allowedDataTypes;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_DPNamespaceParameters;
  v5 = -[_DPNamespaceParameters init](&v13, sel_init);
  if (!v5)
    goto LABEL_7;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BudgetKeyName"));
  v6 = (_DPNamespaceParameters *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    +[_DPPrivacyBudget budgetWithName:](_DPPrivacyBudget, "budgetWithName:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = v7;
      objc_storeStrong((id *)&v5->_budget, v7);
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DataTypes"));
      v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9 && -[NSArray count](v9, "count"))
      {
        allowedDataTypes = v5->_allowedDataTypes;
        v5->_allowedDataTypes = v10;

LABEL_7:
        v6 = v5;
        goto LABEL_10;
      }

    }
    v6 = 0;
  }
LABEL_10:

  return v6;
}

+ (id)namespaceParametersFromDictionary:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDictionary:", v4);

  return v5;
}

+ (id)initParametersForNamespace:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  +[_DPStrings namespaceParametersPath](_DPStrings, "namespaceParametersPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "parametersFromFile:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DPPrivacyBudget description](self->_budget, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray componentsJoinedByString:](self->_allowedDataTypes, "componentsJoinedByString:", CFSTR(", "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { %@, allowedDataTypes=%@}"), v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)parametersFromFile:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45___DPNamespaceParameters_parametersFromFile___block_invoke;
  v9[3] = &unk_1E95D92C0;
  v10 = v4;
  v11 = a1;
  v5 = parametersFromFile__onceToken;
  v6 = v4;
  if (v5 != -1)
    dispatch_once(&parametersFromFile__onceToken, v9);
  v7 = (id)parametersFromFile__allParameters;

  return v7;
}

+ (id)allNamespaceNames
{
  void *v3;
  void *v4;
  void *v5;

  +[_DPStrings namespaceParametersPath](_DPStrings, "namespaceParametersPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "parametersFromFile:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (_DPPrivacyBudget)budget
{
  return self->_budget;
}

- (NSArray)allowedDataTypes
{
  return self->_allowedDataTypes;
}

- (void)setAllowedDataTypes:(id)a3
{
  objc_storeStrong((id *)&self->_allowedDataTypes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedDataTypes, 0);
  objc_storeStrong((id *)&self->_budget, 0);
}

@end
