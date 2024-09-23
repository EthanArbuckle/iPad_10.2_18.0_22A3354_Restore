@implementation HMTrigger(AutomationBuilders)

- (uint64_t)hf_copyAsBuilder
{
  return 0;
}

- (id)hf_updateWithBuilder:()AutomationBuilders
{
  void *v0;
  void *v1;
  void *v2;

  NSLog(CFSTR("Attempted to use a builder to update a trigger that doesn't support builder updates yet"));
  v0 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 36);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "futureWithError:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)hf_newTriggerWithBuilder:()AutomationBuilders inHome:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = (void *)MEMORY[0x1E0CBA910];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HMTrigger+AutomationBuilders.m"), 35, CFSTR("Unknown trigger builder type: %@"), v7);

      v10 = 0;
      goto LABEL_7;
    }
    v9 = (void *)MEMORY[0x1E0CBA4D8];
  }
  objc_msgSend(v9, "hf_newTriggerWithBuilder:inHome:", v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v10;
}

@end
