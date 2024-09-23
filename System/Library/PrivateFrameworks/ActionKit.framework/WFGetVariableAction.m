@implementation WFGetVariableAction

- (void)runWithInput:(id)a3 error:(id *)a4
{
  id v5;

  -[WFGetVariableAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFVariable"), objc_opt_class());
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[WFGetVariableAction setOutput:](self, "setOutput:", v5);

}

- (BOOL)shouldBeSuggestedAfterAction:(id)a3 inWorkflow:(id)a4
{
  return objc_msgSend(a3, "hasAvailableVariables");
}

- (id)currentVariable
{
  void *v2;
  void *v3;

  -[WFGetVariableAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFVariable"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "variable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)inheritedOutputContentClassesInWorkflow:(id)a3 context:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  if ((objc_msgSend(v5, "containsObject:", self) & 1) != 0)
  {
    v6 = (void *)MEMORY[0x24BDBD1A8];
  }
  else
  {
    objc_msgSend(v5, "addObject:", self);
    -[WFGetVariableAction currentVariable](self, "currentVariable");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "possibleAggrandizedContentClassesWithContext:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)accessibilityName
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  -[WFGetVariableAction localizedName](self, "localizedName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFGetVariableAction currentVariable](self, "currentVariable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nameIncludingPropertyName");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = &stru_24F8BBA48;
  if (v5)
    v7 = (const __CFString *)v5;
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" (%@)"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
