@implementation LAEnvironmentState

- (LAEnvironmentState)initWithCoreState:(id)a3
{
  id v5;
  LAEnvironmentState *v6;
  LAEnvironmentState *v7;
  LAEnvironmentMechanismBiometry *v8;
  void *v9;
  uint64_t v10;
  LAEnvironmentMechanismBiometry *biometry;
  LAEnvironmentMechanismUserPassword *v12;
  void *v13;
  uint64_t v14;
  LAEnvironmentMechanismUserPassword *userPassword;
  uint64_t v16;
  NSArray *companions;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSArray *v23;
  LAEnvironmentMechanismCompanion *v24;
  uint64_t v25;
  NSArray *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v32.receiver = self;
  v32.super_class = (Class)LAEnvironmentState;
  v6 = -[LAEnvironmentState init](&v32, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_coreState, a3);
    v8 = [LAEnvironmentMechanismBiometry alloc];
    objc_msgSend(v5, "biometry");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[LAEnvironmentMechanismBiometry initWithCoreMechanism:](v8, "initWithCoreMechanism:", v9);
    biometry = v7->_biometry;
    v7->_biometry = (LAEnvironmentMechanismBiometry *)v10;

    v12 = [LAEnvironmentMechanismUserPassword alloc];
    objc_msgSend(v5, "userPassword");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[LAEnvironmentMechanismUserPassword initWithCoreMechanism:](v12, "initWithCoreMechanism:", v13);
    userPassword = v7->_userPassword;
    v7->_userPassword = (LAEnvironmentMechanismUserPassword *)v14;

    v16 = objc_opt_new();
    companions = v7->_companions;
    v7->_companions = (NSArray *)v16;

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(v5, "companions", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v29;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v29 != v21)
            objc_enumerationMutation(v18);
          v23 = v7->_companions;
          v24 = -[LAEnvironmentMechanismCompanion initWithCoreMechanism:]([LAEnvironmentMechanismCompanion alloc], "initWithCoreMechanism:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v22));
          -[NSArray arrayByAddingObject:](v23, "arrayByAddingObject:", v24);
          v25 = objc_claimAutoreleasedReturnValue();
          v26 = v7->_companions;
          v7->_companions = (NSArray *)v25;

          ++v22;
        }
        while (v20 != v22);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v20);
    }

  }
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  LAEnvironmentState *v4;
  void *v5;
  LAEnvironmentState *v6;

  v4 = [LAEnvironmentState alloc];
  -[LAEnvironmentState coreState](self, "coreState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[LAEnvironmentState initWithCoreState:](v4, "initWithCoreState:", v5);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  LAEnvironmentState *v4;
  LAEnvironmentState *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  char v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;

  v4 = (LAEnvironmentState *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[LAEnvironmentState biometry](self, "biometry");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[LAEnvironmentState biometry](v5, "biometry");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v7)
      {

      }
      else
      {
        v8 = (void *)v7;
        -[LAEnvironmentState biometry](self, "biometry");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[LAEnvironmentState biometry](v5, "biometry");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

        if (!v11)
          goto LABEL_11;
      }
      -[LAEnvironmentState userPassword](self, "userPassword");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[LAEnvironmentState userPassword](v5, "userPassword");
      v14 = objc_claimAutoreleasedReturnValue();
      if (v13 == (void *)v14)
      {

      }
      else
      {
        v15 = (void *)v14;
        -[LAEnvironmentState userPassword](self, "userPassword");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[LAEnvironmentState userPassword](v5, "userPassword");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v16, "isEqual:", v17);

        if (!v18)
        {
LABEL_11:
          v12 = 0;
LABEL_17:

          goto LABEL_18;
        }
      }
      -[LAEnvironmentState companions](self, "companions");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[LAEnvironmentState companions](v5, "companions");
      v20 = objc_claimAutoreleasedReturnValue();
      if (v19 == (void *)v20)
      {
        v12 = 1;
        v21 = v19;
      }
      else
      {
        v21 = (void *)v20;
        -[LAEnvironmentState companions](self, "companions");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[LAEnvironmentState companions](v5, "companions");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v22, "isEqualToArray:", v23);

      }
      goto LABEL_17;
    }
    v12 = 0;
  }
LABEL_18:

  return v12;
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
  -[LAEnvironmentState _descriptionParts](self, "_descriptionParts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p; %@>"), v4, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_descriptionParts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[LAEnvironmentState biometry](self, "biometry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  -[LAEnvironmentState userPassword](self, "userPassword");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[LAEnvironmentState companions](self, "companions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    -[LAEnvironmentState companions](self, "companions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v10);

  }
  return v7;
}

- (NSArray)allMechanisms
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_opt_new();
  -[LAEnvironmentState biometry](self, "biometry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[LAEnvironmentState biometry](self, "biometry");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  -[LAEnvironmentState userPassword](self, "userPassword");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[LAEnvironmentState userPassword](self, "userPassword");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  -[LAEnvironmentState companions](self, "companions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v8);

  return (NSArray *)v3;
}

- (LAEnvironmentMechanismBiometry)biometry
{
  return self->_biometry;
}

- (LAEnvironmentMechanismUserPassword)userPassword
{
  return self->_userPassword;
}

- (NSArray)companions
{
  return self->_companions;
}

- (LACEnvironmentState)coreState
{
  return self->_coreState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreState, 0);
  objc_storeStrong((id *)&self->_companions, 0);
  objc_storeStrong((id *)&self->_userPassword, 0);
  objc_storeStrong((id *)&self->_biometry, 0);
}

@end
