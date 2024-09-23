@implementation LNTranscriptActionRecord

- (BMAppIntentInvocation)asBMAppIntentInvocation
{
  LNTranscriptActionRecord *v2;
  void *v3;
  void *v4;

  v2 = self;
  LNTranscriptActionRecord.asBMAppIntentInvocation.getter();
  v4 = v3;

  return (BMAppIntentInvocation *)v4;
}

- (LNTranscriptActionRecord)initWithBundleIdentifier:(id)a3 source:(unsigned __int16)a4 clientLabel:(id)a5 executionUUID:(id)a6 executionDate:(id)a7 action:(id)a8 resolvedAction:(id)a9 actionOutput:(id)a10 predictions:(id)a11
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  id v32;
  NSObject *v33;
  void *v34;
  uint64_t v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  LNTranscriptActionRecord *v42;
  unsigned int v43;
  id v44;
  id v45;
  id v46;
  id v47;
  uint8_t buf[4];
  id v49;
  __int16 v50;
  id v51;
  uint64_t v52;

  v43 = a4;
  v52 = *MEMORY[0x1E0C80C00];
  v15 = a8;
  v16 = a9;
  v17 = a10;
  v18 = a11;
  v19 = (void *)MEMORY[0x1E0CB36F8];
  v47 = 0;
  v40 = a7;
  v39 = a6;
  v38 = a5;
  v20 = a3;
  objc_msgSend(v19, "archivedDataWithRootObject:requiringSecureCoding:error:", v15, 1, &v47);
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = v47;
  if (v22 || !v21)
  {
    getLNLogCategoryGeneral();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v49 = v15;
      v50 = 2112;
      v51 = v22;
      _os_log_impl(&dword_1A18F6000, v23, OS_LOG_TYPE_ERROR, "Object archival failed for %@: %@", buf, 0x16u);
    }

  }
  v46 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v16, 1, &v46);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v46;
  if (v25 || !v24)
  {
    getLNLogCategoryGeneral();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v49 = v16;
      v50 = 2112;
      v51 = v25;
      _os_log_impl(&dword_1A18F6000, v26, OS_LOG_TYPE_ERROR, "Object archival failed for %@: %@", buf, 0x16u);
    }

  }
  v27 = (void *)v21;

  v45 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v17, 1, &v45);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v45;
  if (v29 || !v28)
  {
    getLNLogCategoryGeneral();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v49 = v17;
      v50 = 2112;
      v51 = v29;
      _os_log_impl(&dword_1A18F6000, v30, OS_LOG_TYPE_ERROR, "Object archival failed for %@: %@", buf, 0x16u);
    }

  }
  v37 = v16;

  v44 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v18, 1, &v44);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v44;
  if (v32 || !v31)
  {
    getLNLogCategoryGeneral();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v49 = v18;
      v50 = 2112;
      v51 = v32;
      _os_log_impl(&dword_1A18F6000, v33, OS_LOG_TYPE_ERROR, "Object archival failed for %@: %@", buf, 0x16u);
    }

  }
  objc_msgSend(v17, "nextAction");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v36) = v34 != 0;
  v42 = -[LNTranscriptActionRecord initWithBundleIdentifier:source:clientLabel:executionUUID:executionDate:actionData:resolvedActionData:actionOutputData:predictionsData:hasNextAction:](self, "initWithBundleIdentifier:source:clientLabel:executionUUID:executionDate:actionData:resolvedActionData:actionOutputData:predictionsData:hasNextAction:", v20, v43, v38, v39, v40, v27, v24, v28, v31, v36);

  return v42;
}

- (LNTranscriptActionRecord)initWithBundleIdentifier:(id)a3 source:(unsigned __int16)a4 clientLabel:(id)a5 executionUUID:(id)a6 executionDate:(id)a7 actionData:(id)a8 resolvedActionData:(id)a9 actionOutputData:(id)a10 predictionsData:(id)a11 hasNextAction:(BOOL)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  LNTranscriptActionRecord *v26;
  uint64_t v27;
  NSString *bundleIdentifier;
  uint64_t v29;
  NSString *clientLabel;
  uint64_t v31;
  NSUUID *executionUUID;
  uint64_t v33;
  NSDate *executionDate;
  uint64_t v35;
  NSData *actionData;
  uint64_t v37;
  NSData *resolvedActionData;
  uint64_t v39;
  NSData *actionOutputData;
  uint64_t v41;
  NSData *predictionsData;
  LNTranscriptActionRecord *v43;
  void *v45;
  void *v46;
  void *v47;
  objc_super v49;

  v18 = a3;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a9;
  v24 = a10;
  v25 = a11;
  if (v22)
  {
    if (v23)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNTranscriptActionRecord.m"), 96, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resolvedActionData"));

    if (v25)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNTranscriptActionRecord.m"), 95, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("actionData"));

  if (!v23)
    goto LABEL_8;
LABEL_3:
  if (v25)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNTranscriptActionRecord.m"), 97, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("predictionsData"));

LABEL_4:
  v49.receiver = self;
  v49.super_class = (Class)LNTranscriptActionRecord;
  v26 = -[LNTranscriptActionRecord init](&v49, sel_init);
  if (v26)
  {
    v27 = objc_msgSend(v18, "copy");
    bundleIdentifier = v26->_bundleIdentifier;
    v26->_bundleIdentifier = (NSString *)v27;

    v26->_source = a4;
    v29 = objc_msgSend(v19, "copy");
    clientLabel = v26->_clientLabel;
    v26->_clientLabel = (NSString *)v29;

    v31 = objc_msgSend(v20, "copy");
    executionUUID = v26->_executionUUID;
    v26->_executionUUID = (NSUUID *)v31;

    v33 = objc_msgSend(v21, "copy");
    executionDate = v26->_executionDate;
    v26->_executionDate = (NSDate *)v33;

    v35 = objc_msgSend(v22, "copy");
    actionData = v26->_actionData;
    v26->_actionData = (NSData *)v35;

    v37 = objc_msgSend(v23, "copy");
    resolvedActionData = v26->_resolvedActionData;
    v26->_resolvedActionData = (NSData *)v37;

    v39 = objc_msgSend(v24, "copy");
    actionOutputData = v26->_actionOutputData;
    v26->_actionOutputData = (NSData *)v39;

    v41 = objc_msgSend(v25, "copy");
    predictionsData = v26->_predictionsData;
    v26->_predictionsData = (NSData *)v41;

    v26->_hasNextAction = a12;
    v43 = v26;
  }

  return v26;
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
    -[LNTranscriptActionRecord actionData](self, "actionData");
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
        -[LNTranscriptActionRecord actionData](self, "actionData");
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

- (LNAction)resolvedAction
{
  LNAction *resolvedAction;
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
  resolvedAction = self->_resolvedAction;
  if (!resolvedAction)
  {
    v4 = (void *)MEMORY[0x1E0CB3710];
    v5 = objc_opt_class();
    -[LNTranscriptActionRecord resolvedActionData](self, "resolvedActionData");
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
        -[LNTranscriptActionRecord resolvedActionData](self, "resolvedActionData");
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

    v12 = self->_resolvedAction;
    self->_resolvedAction = v7;

    resolvedAction = self->_resolvedAction;
  }
  return resolvedAction;
}

- (LNActionOutput)actionOutput
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  LNActionOutput *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  LNActionOutput *actionOutput;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!self->_actionOutput)
  {
    -[LNTranscriptActionRecord actionOutputData](self, "actionOutputData");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v4 = (void *)MEMORY[0x1E0CB3710];
      v5 = objc_opt_class();
      -[LNTranscriptActionRecord actionOutputData](self, "actionOutputData");
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
          -[LNTranscriptActionRecord actionOutputData](self, "actionOutputData");
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

      actionOutput = self->_actionOutput;
      self->_actionOutput = v7;

    }
  }
  return self->_actionOutput;
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
    -[LNTranscriptActionRecord predictionsData](self, "predictionsData");
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
        -[LNTranscriptActionRecord predictionsData](self, "predictionsData");
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

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[LNTranscriptActionRecord bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v4, CFSTR("bundleIdentifier"));

  objc_msgSend(v12, "encodeInteger:forKey:", -[LNTranscriptActionRecord source](self, "source"), CFSTR("source"));
  -[LNTranscriptActionRecord clientLabel](self, "clientLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v5, CFSTR("clientLabel"));

  -[LNTranscriptActionRecord executionUUID](self, "executionUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v6, CFSTR("executionUUID"));

  -[LNTranscriptActionRecord executionDate](self, "executionDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v7, CFSTR("executionDate"));

  -[LNTranscriptActionRecord actionData](self, "actionData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v8, CFSTR("actionData"));

  -[LNTranscriptActionRecord resolvedActionData](self, "resolvedActionData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v9, CFSTR("resolvedActionData"));

  -[LNTranscriptActionRecord actionOutputData](self, "actionOutputData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v10, CFSTR("actionOutputData"));

  -[LNTranscriptActionRecord predictionsData](self, "predictionsData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeObject:forKey:", v11, CFSTR("predictionsData"));

  objc_msgSend(v12, "encodeBool:forKey:", -[LNTranscriptActionRecord hasNextAction](self, "hasNextAction"), CFSTR("hasNextAction"));
}

- (LNTranscriptActionRecord)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  unsigned __int16 v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  LNTranscriptActionRecord *v22;
  void *v23;
  LNTranscriptActionRecord *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  LNTranscriptActionRecord *v39;
  LNTranscriptActionRecord *v40;
  uint64_t v41;
  id v42;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("source"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("executionUUID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v42 = v10;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("executionDate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionData"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("resolvedActionData"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionOutputData"));
  v41 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("predictionsData"));
  v17 = objc_claimAutoreleasedReturnValue();
  if (v15 && v16)
  {
    LOBYTE(v34) = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasNextAction"));
    v33 = v17;
    v18 = v6;
    v19 = (void *)v5;
    v20 = (void *)v17;
    v21 = (void *)v41;
    v22 = self;
    v23 = v42;
    v24 = -[LNTranscriptActionRecord initWithBundleIdentifier:source:clientLabel:executionUUID:executionDate:actionData:resolvedActionData:actionOutputData:predictionsData:hasNextAction:](v22, "initWithBundleIdentifier:source:clientLabel:executionUUID:executionDate:actionData:resolvedActionData:actionOutputData:predictionsData:hasNextAction:", v19, v18, v7, v42, v14, v15, v16, v41, v33, v34);
    v40 = v24;
  }
  else
  {
    v39 = self;
    v36 = v14;
    v37 = v7;
    v38 = (void *)v5;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("action"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("resolvedAction"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("actionOutput"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)MEMORY[0x1E0C99E60];
    v29 = objc_opt_class();
    objc_msgSend(v28, "setWithObjects:", v29, objc_opt_class(), 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v30, CFSTR("predictions"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = (void *)v17;
    if (v25 && v26)
    {
      v39 = -[LNTranscriptActionRecord initWithBundleIdentifier:source:clientLabel:executionUUID:executionDate:action:resolvedAction:actionOutput:predictions:](v39, "initWithBundleIdentifier:source:clientLabel:executionUUID:executionDate:action:resolvedAction:actionOutput:predictions:", v38, v6, v37, v42, v36, v25, v26, v27, v31);
      v40 = v39;
    }
    else
    {
      v40 = 0;
    }

    v19 = v38;
    v24 = v39;
    v14 = v36;
    v7 = v37;
    v23 = v42;
    v21 = (void *)v41;
    v20 = v35;
  }

  return v40;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNTranscriptActionRecord bundleIdentifier](self, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNTranscriptActionRecord executionUUID](self, "executionUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNTranscriptActionRecord executionDate](self, "executionDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, bundleIdentifier: %@, executionUUID: %@, executionDate: %@>"), v5, self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (id)verboseDescription
{
  objc_class *v3;
  void *v4;
  unsigned int v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;

  v16 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNTranscriptActionRecord bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[LNTranscriptActionRecord source](self, "source");
  if (v5 > 0xA)
    v6 = CFSTR("Application");
  else
    v6 = *(&off_1E45DBE20 + v5);
  -[LNTranscriptActionRecord clientLabel](self, "clientLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNTranscriptActionRecord executionUUID](self, "executionUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNTranscriptActionRecord executionDate](self, "executionDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNTranscriptActionRecord action](self, "action");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNTranscriptActionRecord resolvedAction](self, "resolvedAction");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNTranscriptActionRecord actionOutput](self, "actionOutput");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNTranscriptActionRecord predictions](self, "predictions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringWithFormat:", CFSTR("<%@: %p, bundleIdentifier: %@, source: %@, clientLabel: %@, executionUUID: %@, executionDate: %@, action: %@, resolvedAction: %@, actionOutput: %@, predictions %@>"), v17, self, v4, v6, v7, v8, v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;

  -[LNTranscriptActionRecord bundleIdentifier](self, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[LNTranscriptActionRecord source](self, "source");
  -[LNTranscriptActionRecord clientLabel](self, "clientLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4 ^ objc_msgSend(v6, "hash") ^ v5;
  -[LNTranscriptActionRecord executionUUID](self, "executionUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash");
  -[LNTranscriptActionRecord executionDate](self, "executionDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v9 ^ objc_msgSend(v10, "hash");
  -[LNTranscriptActionRecord actionData](self, "actionData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v7 ^ v11 ^ objc_msgSend(v12, "hash");
  -[LNTranscriptActionRecord resolvedActionData](self, "resolvedActionData");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hash");
  -[LNTranscriptActionRecord actionOutputData](self, "actionOutputData");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v15 ^ objc_msgSend(v16, "hash");
  -[LNTranscriptActionRecord predictionsData](self, "predictionsData");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v13 ^ v17 ^ objc_msgSend(v18, "hash");

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  LNTranscriptActionRecord *v4;
  LNTranscriptActionRecord *v5;
  LNTranscriptActionRecord *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  int v15;
  int v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  int v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  int v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  void *v53;
  BOOL v54;
  void *v55;
  id v57;
  void *v58;
  void *v59;
  id v60;
  id v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  id v66;

  v4 = (LNTranscriptActionRecord *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_71:

      goto LABEL_72;
    }
    -[LNTranscriptActionRecord bundleIdentifier](self, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNTranscriptActionRecord bundleIdentifier](v6, "bundleIdentifier");
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
        goto LABEL_69;
      v15 = objc_msgSend(v9, "isEqualToString:", v10);

      if (!v15)
        goto LABEL_18;
    }
    v16 = -[LNTranscriptActionRecord source](self, "source");
    if (v16 != -[LNTranscriptActionRecord source](v6, "source"))
    {
LABEL_18:
      LOBYTE(v12) = 0;
LABEL_70:

      goto LABEL_71;
    }
    -[LNTranscriptActionRecord clientLabel](self, "clientLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNTranscriptActionRecord clientLabel](v6, "clientLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v17;
    v19 = v18;
    v13 = v19;
    if (v14 == v19)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      v20 = v19;
      v21 = v14;
      if (!v14 || !v19)
        goto LABEL_68;
      v22 = objc_msgSend(v14, "isEqualToString:", v19);

      if (!v22)
      {
        LOBYTE(v12) = 0;
LABEL_69:

        goto LABEL_70;
      }
    }
    -[LNTranscriptActionRecord executionUUID](self, "executionUUID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNTranscriptActionRecord executionUUID](v6, "executionUUID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v23;
    v25 = v24;
    v20 = v25;
    v66 = v21;
    if (v21 == v25)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      v26 = v25;
      if (!v21 || !v25)
        goto LABEL_67;
      v12 = objc_msgSend(v21, "isEqual:", v25);

      if (!v12)
        goto LABEL_68;
    }
    v65 = v20;
    -[LNTranscriptActionRecord executionDate](self, "executionDate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNTranscriptActionRecord executionDate](v6, "executionDate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v27;
    v30 = v28;
    v63 = v30;
    v64 = v29;
    if (v29 == v30)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      if (!v29)
      {
        v31 = v30;
        v20 = v65;
        goto LABEL_65;
      }
      v31 = v30;
      v20 = v65;
      if (!v30)
      {
LABEL_65:

        goto LABEL_66;
      }
      v32 = objc_msgSend(v29, "isEqual:", v30);

      if (!v32)
      {
        LOBYTE(v12) = 0;
        v20 = v65;
LABEL_66:
        v26 = v63;
        v21 = v64;
LABEL_67:

        v21 = v66;
LABEL_68:

        goto LABEL_69;
      }
    }
    -[LNTranscriptActionRecord actionData](self, "actionData");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNTranscriptActionRecord actionData](v6, "actionData");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v33;
    v35 = v34;
    v61 = v29;
    v62 = v35;
    if (v29 != v35)
    {
      LOBYTE(v12) = 0;
      if (v29)
      {
        v36 = v35;
        v20 = v65;
        if (v35)
        {
          v37 = objc_msgSend(v29, "isEqual:", v35);

          if (!v37)
          {
            LOBYTE(v12) = 0;
            v20 = v65;
            v31 = v62;
            goto LABEL_65;
          }
LABEL_38:
          -[LNTranscriptActionRecord resolvedActionData](self, "resolvedActionData");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          -[LNTranscriptActionRecord resolvedActionData](v6, "resolvedActionData");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = v38;
          v41 = v39;
          v59 = v41;
          v60 = v40;
          if (v40 == v41)
          {

          }
          else
          {
            LOBYTE(v12) = 0;
            if (!v40)
            {
              v42 = v41;
              v20 = v65;
              goto LABEL_62;
            }
            v42 = v41;
            v20 = v65;
            if (!v41)
            {
LABEL_62:

              goto LABEL_63;
            }
            v43 = objc_msgSend(v40, "isEqual:", v41);

            if (!v43)
            {
              LOBYTE(v12) = 0;
              v20 = v65;
LABEL_63:
              v36 = v59;
              v29 = v60;
              goto LABEL_64;
            }
          }
          -[LNTranscriptActionRecord actionOutputData](self, "actionOutputData");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          -[LNTranscriptActionRecord actionOutputData](v6, "actionOutputData");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = v44;
          v46 = v45;
          v57 = v40;
          v58 = v46;
          if (v40 == v46)
          {

          }
          else
          {
            LOBYTE(v12) = 0;
            if (!v40)
            {
              v47 = v46;
              v20 = v65;
              goto LABEL_61;
            }
            v47 = v46;
            v20 = v65;
            if (!v46)
            {
LABEL_61:

              v40 = v57;
              v42 = v58;
              goto LABEL_62;
            }
            v48 = objc_msgSend(v40, "isEqual:", v46);

            if (!v48)
            {
              LOBYTE(v12) = 0;
              v20 = v65;
              v42 = v58;
              goto LABEL_62;
            }
          }
          -[LNTranscriptActionRecord predictionsData](self, "predictionsData", v40);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          -[LNTranscriptActionRecord predictionsData](v6, "predictionsData");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = v49;
          v52 = v50;
          v53 = v51;
          v54 = v51 == v52;
          v55 = v52;
          if (v54)
          {
            LOBYTE(v12) = 1;
          }
          else
          {
            LOBYTE(v12) = 0;
            if (v53)
            {
              v20 = v65;
              if (v52)
                LOBYTE(v12) = objc_msgSend(v53, "isEqual:", v52);
              goto LABEL_59;
            }
          }
          v20 = v65;
LABEL_59:

          v47 = v55;
          v40 = v53;
          goto LABEL_61;
        }
      }
      else
      {
        v36 = v35;
        v20 = v65;
      }
LABEL_64:

      v29 = v61;
      v31 = v62;
      goto LABEL_65;
    }

    goto LABEL_38;
  }
  LOBYTE(v12) = 1;
LABEL_72:

  return v12;
}

- (unsigned)dataVersion
{
  return +[LNTranscriptActionRecord datastoreVersion](LNTranscriptActionRecord, "datastoreVersion");
}

- (id)serialize
{
  void *v2;
  id v3;
  void *v4;
  BOOL v5;
  NSObject *v6;
  id v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v8;
  v4 = v3;
  if (v2)
    v5 = 1;
  else
    v5 = v3 == 0;
  if (!v5)
  {
    getLNLogCategoryGeneral();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v10 = v4;
      _os_log_impl(&dword_1A18F6000, v6, OS_LOG_TYPE_ERROR, "Failed to serialize LNTranscriptActionRecord: %{public}@", buf, 0xCu);
    }

    v2 = 0;
  }

  return v2;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (unsigned)source
{
  return self->_source;
}

- (void)setSource:(unsigned __int16)a3
{
  self->_source = a3;
}

- (NSString)clientLabel
{
  return self->_clientLabel;
}

- (NSUUID)executionUUID
{
  return self->_executionUUID;
}

- (NSDate)executionDate
{
  return self->_executionDate;
}

- (NSData)actionData
{
  return self->_actionData;
}

- (NSData)resolvedActionData
{
  return self->_resolvedActionData;
}

- (NSData)actionOutputData
{
  return self->_actionOutputData;
}

- (NSData)predictionsData
{
  return self->_predictionsData;
}

- (BOOL)hasNextAction
{
  return self->_hasNextAction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictionsData, 0);
  objc_storeStrong((id *)&self->_actionOutputData, 0);
  objc_storeStrong((id *)&self->_resolvedActionData, 0);
  objc_storeStrong((id *)&self->_actionData, 0);
  objc_storeStrong((id *)&self->_executionDate, 0);
  objc_storeStrong((id *)&self->_executionUUID, 0);
  objc_storeStrong((id *)&self->_clientLabel, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_predictions, 0);
  objc_storeStrong((id *)&self->_actionOutput, 0);
  objc_storeStrong((id *)&self->_resolvedAction, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

+ (unsigned)datastoreVersion
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  BOOL v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v4, &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v11;
  v7 = v6;
  if (v5)
    v8 = 1;
  else
    v8 = v6 == 0;
  if (!v8)
  {
    getLNLogCategoryGeneral();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v13 = v7;
      _os_log_impl(&dword_1A18F6000, v9, OS_LOG_TYPE_ERROR, "Failed to unarchive LNTranscriptActionRecord: %{public}@", buf, 0xCu);
    }

    v5 = 0;
  }

  return v5;
}

- (LNTranscriptActionRecord)initWithAction:(id)a3 resolvedAction:(id)a4 bundleIdentifier:(id)a5 actionOutput:(id)a6 executionUUID:(id)a7 source:(unsigned __int16)a8 executionDate:(id)a9 clientLabel:(id)a10 predictions:(id)a11
{
  id v16;
  __CFString *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  NSObject *v23;
  void *v24;
  LNTranscriptActionRecord *v25;
  void *v27;
  unsigned int v28;
  id v29;
  uint8_t buf[16];

  v28 = a8;
  v29 = a3;
  v16 = a4;
  v17 = (__CFString *)a5;
  v18 = a6;
  v19 = a7;
  v20 = a9;
  v21 = a10;
  v22 = a11;
  if (!v17)
  {
    getLNLogCategoryGeneral();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A18F6000, v23, OS_LOG_TYPE_ERROR, "Bundle identifier not provided for action transcript record.", buf, 2u);
    }

    v17 = CFSTR("com.apple.example");
  }
  v24 = v19;
  if (v19)
  {
    if (v20)
      goto LABEL_7;
LABEL_11:
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[LNTranscriptActionRecord initWithBundleIdentifier:source:clientLabel:executionUUID:executionDate:action:resolvedAction:actionOutput:predictions:](self, "initWithBundleIdentifier:source:clientLabel:executionUUID:executionDate:action:resolvedAction:actionOutput:predictions:", v17, v28, v21, v24, v27, v29, v16, v18, v22);

    if (v19)
      goto LABEL_9;
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20)
    goto LABEL_11;
LABEL_7:
  v25 = -[LNTranscriptActionRecord initWithBundleIdentifier:source:clientLabel:executionUUID:executionDate:action:resolvedAction:actionOutput:predictions:](self, "initWithBundleIdentifier:source:clientLabel:executionUUID:executionDate:action:resolvedAction:actionOutput:predictions:", v17, v28, v21, v24, v20, v29, v16, v18, v22);
  if (!v19)
LABEL_8:

LABEL_9:
  return v25;
}

@end
