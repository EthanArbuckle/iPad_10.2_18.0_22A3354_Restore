@implementation _DPDataTypeParameters

- (_DPDataTypeParameters)init
{

  return 0;
}

- (_DPDataTypeParameters)initWithDictionary:(id)a3
{
  id v4;
  _DPDataTypeParameters *v5;
  _DPDataTypeParameters *v6;
  _DPDataTypeParameters *v7;
  float v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _DPPrivacyBudget *budget;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_DPDataTypeParameters;
  v5 = -[_DPDataTypeParameters init](&v14, sel_init);
  if (!v5)
    goto LABEL_6;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("LocalPrivacyBudget"));
  v6 = (_DPDataTypeParameters *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    -[_DPDataTypeParameters floatValue](v6, "floatValue");
    v5->_localPrivacyBudget = v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BudgetKeyName"));
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      +[_DPPrivacyBudget budgetWithName:](_DPPrivacyBudget, "budgetWithName:", v9);
      v11 = objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        budget = v5->_budget;
        v5->_budget = (_DPPrivacyBudget *)v11;

LABEL_6:
        v7 = v5;
        goto LABEL_9;
      }

    }
    v7 = 0;
  }
LABEL_9:

  return v7;
}

+ (id)dataTypeParametersFromDictionary:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDictionary:", v4);

  return v5;
}

+ (id)initParametersForDataType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  +[_DPStrings dataTypeParametersPath](_DPStrings, "dataTypeParametersPath");
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

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DPPrivacyBudget description](self->_budget, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@, localPrivacyBudget=%f}"), v5, v6, self->_localPrivacyBudget);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
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
  v9[2] = __44___DPDataTypeParameters_parametersFromFile___block_invoke;
  v9[3] = &unk_1E95D92C0;
  v10 = v4;
  v11 = a1;
  v5 = parametersFromFile__onceToken_1;
  v6 = v4;
  if (v5 != -1)
    dispatch_once(&parametersFromFile__onceToken_1, v9);
  v7 = (id)parametersFromFile__allParameters_0;

  return v7;
}

+ (id)allDataTypeNames
{
  void *v3;
  void *v4;
  void *v5;

  +[_DPStrings dataTypeParametersPath](_DPStrings, "dataTypeParametersPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "parametersFromFile:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (float)localPrivacyBudget
{
  return self->_localPrivacyBudget;
}

- (_DPPrivacyBudget)budget
{
  return self->_budget;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_budget, 0);
}

@end
