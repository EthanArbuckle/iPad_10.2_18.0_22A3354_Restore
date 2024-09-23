@implementation WFListAction

- (void)runWithInput:(id)a3 error:(id *)a4
{
  id v5;

  -[WFListAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFItems"), objc_opt_class());
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[WFListAction setOutput:](self, "setOutput:", v5);

}

- (id)inheritedOutputContentClassesInWorkflow:(id)a3 context:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  if ((objc_msgSend(v5, "containsObject:", self) & 1) != 0)
  {
    v6 = (void *)MEMORY[0x24BDBD1A8];
  }
  else
  {
    v26 = v5;
    objc_msgSend(v5, "addObject:", self);
    v7 = (void *)objc_opt_new();
    -[WFListAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFItems"));
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "values");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v28 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "state");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_opt_class();
          v15 = v13;
          if (v15 && (objc_opt_isKindOfClass() & 1) == 0)
          {
            getWFGeneralLogObject();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
            {
              v18 = (void *)objc_opt_class();
              *(_DWORD *)buf = 136315906;
              v33 = "WFEnforceClass";
              v34 = 2114;
              v35 = v15;
              v36 = 2114;
              v37 = v18;
              v38 = 2114;
              v39 = v14;
              v19 = v18;
              _os_log_impl(&dword_22D353000, v17, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", buf, 0x2Au);

            }
            v16 = 0;
          }
          else
          {
            v16 = v15;
          }

          objc_msgSend(v16, "variableString");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v20, "representsSingleContentVariable"))
          {
            objc_msgSend(v20, "variables");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "firstObject");
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v22, "possibleAggrandizedContentClassesWithContext:", v26);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "unionOrderedSet:", v23);

          }
          else
          {
            objc_msgSend(v7, "addObject:", objc_opt_class());
          }

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v10);
    }

    objc_msgSend(v7, "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v26;
  }

  return v6;
}

- (id)outputContentClasses
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  -[WFListAction workflow](self, "workflow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WFListAction workflow](self, "workflow");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFListAction inheritedOutputContentClassesInWorkflow:](self, "inheritedOutputContentClassesInWorkflow:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)WFListAction;
    -[WFListAction outputContentClasses](&v7, sel_outputContentClasses);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

@end
