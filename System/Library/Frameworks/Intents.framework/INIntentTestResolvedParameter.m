@implementation INIntentTestResolvedParameter

- (INIntentTestResolvedParameter)initWithParameter:(id)a3 forIntent:(id)a4 extensionContextResolutionResult:(id)a5
{
  id v9;
  id v10;
  id v11;
  INIntentTestResolvedParameter *v12;
  INIntentTestResolvedParameter *v13;
  uint64_t v14;
  INIntent *intent;
  void *v16;
  uint64_t v17;
  INIntentSlotDescription *slotDescription;
  void *v19;
  INIntentSlotDescription *v20;
  void *v21;
  void *v22;
  NSArray *v23;
  NSArray *results;
  objc_super v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v26.receiver = self;
  v26.super_class = (Class)INIntentTestResolvedParameter;
  v12 = -[INIntentTestResolvedParameter init](&v26, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_parameter, a3);
    objc_storeStrong((id *)&v13->_extensionContextResolutionResult, a5);
    v14 = objc_msgSend(v10, "copy");
    intent = v13->_intent;
    v13->_intent = (INIntent *)v14;

    v13->_resolveImplemented = objc_msgSend(v11, "result") != 2;
    objc_msgSend(v10, "_intentInstanceDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "slotByName:", v9);
    v17 = objc_claimAutoreleasedReturnValue();
    slotDescription = v13->_slotDescription;
    v13->_slotDescription = (INIntentSlotDescription *)v17;

    objc_msgSend(v11, "data");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19)
      goto LABEL_10;
    v20 = v13->_slotDescription;

    if (!v20)
      goto LABEL_10;
    objc_msgSend(v11, "data");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[INIntentResolutionResult _resolutionResultWithData:slotDescription:](INIntentResolutionResult, "_resolutionResultWithData:slotDescription:", v21, v13->_slotDescription);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = v22;
    }
    else
    {
      if (!v22)
      {
LABEL_9:

LABEL_10:
        goto LABEL_11;
      }
      v27[0] = v22;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
      v23 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    results = v13->_results;
    v13->_results = v23;

    goto LABEL_9;
  }
LABEL_11:

  return v13;
}

- (id)description
{
  return -[INIntentTestResolvedParameter descriptionAtIndent:](self, "descriptionAtIndent:", 0);
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)INIntentTestResolvedParameter;
  -[INIntentTestResolvedParameter description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentTestResolvedParameter dictionaryRepresentation](self, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)dictionaryRepresentation
{
  NSString *parameter;
  void *v4;
  NSArray *results;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("parameter");
  parameter = self->_parameter;
  v4 = parameter;
  if (!parameter)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[0] = v4;
  v10[1] = CFSTR("results");
  results = self->_results;
  v6 = results;
  if (!results)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[1] = v6;
  v10[2] = CFSTR("resolveImplemented");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_resolveImplemented);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!results)
  {

    if (parameter)
      return v8;
LABEL_9:

    return v8;
  }
  if (!parameter)
    goto LABEL_9;
  return v8;
}

- (NSString)parameter
{
  return self->_parameter;
}

- (NSArray)results
{
  return self->_results;
}

- (BOOL)resolveImplemented
{
  return self->_resolveImplemented;
}

- (INExtensionContextSlotResolutionResult)extensionContextResolutionResult
{
  return self->_extensionContextResolutionResult;
}

- (INIntent)intent
{
  return self->_intent;
}

- (INIntentSlotDescription)slotDescription
{
  return self->_slotDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slotDescription, 0);
  objc_storeStrong((id *)&self->_intent, 0);
  objc_storeStrong((id *)&self->_extensionContextResolutionResult, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_parameter, 0);
}

@end
