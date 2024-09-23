@implementation LNSuccessResult

- (LNSuccessResult)initWithAction:(id)a3 output:(id)a4 actionAppContext:(id)a5 predictions:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  BOOL v15;
  NSObject *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  id v24;
  NSObject *v25;
  LNSuccessResult *v26;
  id v29;
  id v30;
  id v31;
  id v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v32 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v9, 1, &v32);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v32;
  if (v14)
    v15 = 1;
  else
    v15 = v13 == 0;
  if (v15)
  {
    getLNLogCategoryGeneral();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v34 = v9;
      v35 = 2112;
      v36 = v14;
      _os_log_impl(&dword_1A18F6000, v16, OS_LOG_TYPE_ERROR, "Object archival failed for %@: %@", buf, 0x16u);
    }

  }
  v31 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v10, 1, &v31);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v31;
  if (v18 || !v17)
  {
    getLNLogCategoryGeneral();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v34 = v10;
      v35 = 2112;
      v36 = v18;
      _os_log_impl(&dword_1A18F6000, v19, OS_LOG_TYPE_ERROR, "Object archival failed for %@: %@", buf, 0x16u);
    }

  }
  v30 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v11, 1, &v30);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v30;
  if (v21 || !v20)
  {
    getLNLogCategoryGeneral();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v34 = v11;
      v35 = 2112;
      v36 = v21;
      _os_log_impl(&dword_1A18F6000, v22, OS_LOG_TYPE_ERROR, "Object archival failed for %@: %@", buf, 0x16u);
    }

  }
  v29 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v12, 1, &v29);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v29;
  if (v24 || !v23)
  {
    getLNLogCategoryGeneral();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v34 = v12;
      v35 = 2112;
      v36 = v24;
      _os_log_impl(&dword_1A18F6000, v25, OS_LOG_TYPE_ERROR, "Object archival failed for %@: %@", buf, 0x16u);
    }

  }
  v26 = -[LNSuccessResult initWithActionData:outputData:appContextData:predictionsData:](self, "initWithActionData:outputData:appContextData:predictionsData:", v13, v17, v20, v23);

  return v26;
}

- (LNSuccessResult)initWithActionData:(id)a3 outputData:(id)a4 appContextData:(id)a5 predictionsData:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  LNSuccessResult *v15;
  uint64_t v16;
  NSData *actionData;
  uint64_t v18;
  NSData *outputData;
  uint64_t v20;
  NSData *appContextData;
  uint64_t v22;
  NSData *predictionsData;
  LNSuccessResult *v24;
  void *v26;
  void *v27;
  void *v28;
  objc_super v29;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNSuccessResult.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outputData"));

    if (v14)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNSuccessResult.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("actionData"));

  if (!v12)
    goto LABEL_8;
LABEL_3:
  if (v14)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNSuccessResult.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("predictionsData"));

LABEL_4:
  v29.receiver = self;
  v29.super_class = (Class)LNSuccessResult;
  v15 = -[LNSuccessResult init](&v29, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v11, "copy");
    actionData = v15->_actionData;
    v15->_actionData = (NSData *)v16;

    v18 = objc_msgSend(v12, "copy");
    outputData = v15->_outputData;
    v15->_outputData = (NSData *)v18;

    v20 = objc_msgSend(v13, "copy");
    appContextData = v15->_appContextData;
    v15->_appContextData = (NSData *)v20;

    v22 = objc_msgSend(v14, "copy");
    predictionsData = v15->_predictionsData;
    v15->_predictionsData = (NSData *)v22;

    v24 = v15;
  }

  return v15;
}

- (LNAction)action
{
  LNAction *action;
  void *v4;
  uint64_t v5;
  void *v6;
  LNAction *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  LNAction *v12;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  action = self->_action;
  if (!action)
  {
    v4 = (void *)MEMORY[0x1E0CB3710];
    v5 = objc_opt_class();
    -[LNSuccessResult actionData](self, "actionData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    objc_msgSend(v4, "unarchivedObjectOfClass:fromData:error:", v5, v6, &v14);
    v7 = (LNAction *)objc_claimAutoreleasedReturnValue();
    v8 = v14;

    if (v8 || !v7)
    {
      getLNLogCategoryGeneral();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = objc_opt_class();
        -[LNSuccessResult actionData](self, "actionData");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v16 = v10;
        v17 = 2112;
        v18 = v11;
        v19 = 2112;
        v20 = v8;
        _os_log_impl(&dword_1A18F6000, v9, OS_LOG_TYPE_ERROR, "Object archival failed for %@ with %@: %@", buf, 0x20u);

      }
    }

    v12 = self->_action;
    self->_action = v7;

    action = self->_action;
  }
  return action;
}

- (LNActionOutput)output
{
  LNActionOutput *output;
  void *v4;
  uint64_t v5;
  void *v6;
  LNActionOutput *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  LNActionOutput *v12;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  output = self->_output;
  if (!output)
  {
    v4 = (void *)MEMORY[0x1E0CB3710];
    v5 = objc_opt_class();
    -[LNSuccessResult outputData](self, "outputData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    objc_msgSend(v4, "unarchivedObjectOfClass:fromData:error:", v5, v6, &v14);
    v7 = (LNActionOutput *)objc_claimAutoreleasedReturnValue();
    v8 = v14;

    if (v8 || !v7)
    {
      getLNLogCategoryGeneral();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = objc_opt_class();
        -[LNSuccessResult outputData](self, "outputData");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v16 = v10;
        v17 = 2112;
        v18 = v11;
        v19 = 2112;
        v20 = v8;
        _os_log_impl(&dword_1A18F6000, v9, OS_LOG_TYPE_ERROR, "Object archival failed for %@ with %@: %@", buf, 0x20u);

      }
    }

    v12 = self->_output;
    self->_output = v7;

    output = self->_output;
  }
  return output;
}

- (LNActionAppContext)actionAppContext
{
  LNActionAppContext *actionAppContext;
  void *v4;
  uint64_t v5;
  void *v6;
  LNActionAppContext *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  LNActionAppContext *v12;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  actionAppContext = self->_actionAppContext;
  if (!actionAppContext)
  {
    v4 = (void *)MEMORY[0x1E0CB3710];
    v5 = objc_opt_class();
    -[LNSuccessResult appContextData](self, "appContextData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    objc_msgSend(v4, "unarchivedObjectOfClass:fromData:error:", v5, v6, &v14);
    v7 = (LNActionAppContext *)objc_claimAutoreleasedReturnValue();
    v8 = v14;

    if (v8 || !v7)
    {
      getLNLogCategoryGeneral();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = objc_opt_class();
        -[LNSuccessResult appContextData](self, "appContextData");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v16 = v10;
        v17 = 2112;
        v18 = v11;
        v19 = 2112;
        v20 = v8;
        _os_log_impl(&dword_1A18F6000, v9, OS_LOG_TYPE_ERROR, "Object archival failed for %@ with %@: %@", buf, 0x20u);

      }
    }

    v12 = self->_actionAppContext;
    self->_actionAppContext = v7;

    actionAppContext = self->_actionAppContext;
  }
  return actionAppContext;
}

- (NSArray)predictions
{
  NSArray *predictions;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSArray *v10;
  id v11;
  NSObject *v12;
  void *v13;
  NSArray *v14;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  predictions = self->_predictions;
  if (!predictions)
  {
    v4 = (void *)MEMORY[0x1E0C99E60];
    v5 = objc_opt_class();
    v6 = objc_opt_class();
    objc_msgSend(v4, "setWithObjects:", v5, v6, objc_opt_class(), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0CB3710];
    -[LNSuccessResult predictionsData](self, "predictionsData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    objc_msgSend(v8, "unarchivedObjectOfClasses:fromData:error:", v7, v9, &v16);
    v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v11 = v16;

    if (v11 || !v10)
    {
      getLNLogCategoryGeneral();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        -[LNSuccessResult predictionsData](self, "predictionsData");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v18 = v7;
        v19 = 2112;
        v20 = v13;
        v21 = 2112;
        v22 = v11;
        _os_log_impl(&dword_1A18F6000, v12, OS_LOG_TYPE_ERROR, "Object archival failed for %@ with %@: %@", buf, 0x20u);

      }
    }

    v14 = self->_predictions;
    self->_predictions = v10;

    predictions = self->_predictions;
  }
  return predictions;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNSuccessResult actionData](self, "actionData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNSuccessResult outputData](self, "outputData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNSuccessResult appContextData](self, "appContextData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNSuccessResult predictionsData](self, "predictionsData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, actionData: %@, outputData: %@, appContextData: %@, predictionsData: %@>"), v5, self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)verboseDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNSuccessResult action](self, "action");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNSuccessResult output](self, "output");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNSuccessResult actionAppContext](self, "actionAppContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNSuccessResult predictions](self, "predictions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, action: %@, output: %@, appContext: %@, predictions: %@>"), v5, self, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  -[LNSuccessResult actionData](self, "actionData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[LNSuccessResult outputData](self, "outputData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[LNSuccessResult appContextData](self, "appContextData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[LNSuccessResult predictionsData](self, "predictionsData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  LNSuccessResult *v4;
  LNSuccessResult *v5;
  LNSuccessResult *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  int v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v31;
  void *v32;

  v4 = (LNSuccessResult *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_35:

      goto LABEL_36;
    }
    -[LNSuccessResult actionData](self, "actionData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNSuccessResult actionData](v6, "actionData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      v13 = v10;
      v14 = v9;
      if (!v9 || !v10)
        goto LABEL_33;
      v15 = objc_msgSend(v9, "isEqual:", v10);

      if (!v15)
      {
        LOBYTE(v12) = 0;
LABEL_34:

        goto LABEL_35;
      }
    }
    -[LNSuccessResult outputData](self, "outputData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNSuccessResult outputData](v6, "outputData");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v16;
    v18 = v17;
    v13 = v18;
    if (v14 == v18)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      v19 = v18;
      v20 = v14;
      if (!v14 || !v18)
        goto LABEL_32;
      v21 = objc_msgSend(v14, "isEqual:", v18);

      if (!v21)
      {
        LOBYTE(v12) = 0;
LABEL_33:

        goto LABEL_34;
      }
    }
    -[LNSuccessResult appContextData](self, "appContextData");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNSuccessResult appContextData](v6, "appContextData");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v22;
    v24 = v23;
    v31 = v20;
    v32 = v24;
    if (v20 != v24)
    {
      LOBYTE(v12) = 0;
      if (v20)
      {
        v25 = v24;
        if (v24)
        {
          v12 = objc_msgSend(v20, "isEqual:", v24);

          if (!v12)
          {
            v19 = v32;
LABEL_32:

            goto LABEL_33;
          }
          goto LABEL_24;
        }
      }
      else
      {
        v25 = v24;
      }
LABEL_31:

      v20 = v31;
      v19 = v32;
      goto LABEL_32;
    }

LABEL_24:
    -[LNSuccessResult predictionsData](self, "predictionsData", v20);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNSuccessResult predictionsData](v6, "predictionsData");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v26;
    v29 = v27;
    v25 = v29;
    if (v28 == v29)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      LOBYTE(v12) = 0;
      if (v28 && v29)
        LOBYTE(v12) = objc_msgSend(v28, "isEqual:", v29);
    }

    v20 = v28;
    goto LABEL_31;
  }
  LOBYTE(v12) = 1;
LABEL_36:

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[LNSuccessResult actionData](self, "actionData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("actionData"));

  -[LNSuccessResult outputData](self, "outputData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("outputData"));

  -[LNSuccessResult appContextData](self, "appContextData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("appContextData"));

  -[LNSuccessResult predictionsData](self, "predictionsData");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("predictionsData"));

}

- (LNSuccessResult)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  LNSuccessResult *v19;
  void *v21;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("outputData"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appContextData"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("predictionsData"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v5)
    v10 = v6 == 0;
  else
    v10 = 1;
  if (v10 || v8 == 0)
  {
    v21 = v7;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("action"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("output"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionAppContext"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0C99E60];
    v16 = objc_opt_class();
    objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("predictions"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = 0;
    if (v12 && v13 && v18)
    {
      self = -[LNSuccessResult initWithAction:output:actionAppContext:predictions:](self, "initWithAction:output:actionAppContext:predictions:", v12, v13, v14, v18);
      v19 = self;
    }

    v7 = v21;
  }
  else
  {
    self = -[LNSuccessResult initWithActionData:outputData:appContextData:predictionsData:](self, "initWithActionData:outputData:appContextData:predictionsData:", v5, v6, v7, v8);
    v19 = self;
  }

  return v19;
}

- (NSData)actionData
{
  return self->_actionData;
}

- (NSData)outputData
{
  return self->_outputData;
}

- (NSData)appContextData
{
  return self->_appContextData;
}

- (NSData)predictionsData
{
  return self->_predictionsData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictionsData, 0);
  objc_storeStrong((id *)&self->_appContextData, 0);
  objc_storeStrong((id *)&self->_outputData, 0);
  objc_storeStrong((id *)&self->_actionData, 0);
  objc_storeStrong((id *)&self->_predictions, 0);
  objc_storeStrong((id *)&self->_actionAppContext, 0);
  objc_storeStrong((id *)&self->_output, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
