@implementation HFShortcutActionBuilder

+ (Class)homeKitRepresentationClass
{
  return (Class)objc_opt_class();
}

- (id)commitItem
{
  return (id)objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
}

- (BOOL)isAffectedByEndEvents
{
  return 0;
}

- (id)containedAccessoryRepresentables
{
  if (qword_1F03ED280 != -1)
    dispatch_once(&qword_1F03ED280, &__block_literal_global_101);
  return (id)qword_1F03ED288;
}

void __59__HFShortcutActionBuilder_containedAccessoryRepresentables__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1F03ED288;
  qword_1F03ED288 = v0;

}

- (id)performValidation
{
  void *v2;
  void *v3;

  -[HFShortcutActionBuilder validationError](self, "validationError");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithError:", v2);
  else
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)validationError
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  -[HFActionBuilder action](self, "action");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  v5 = 0;
  if (!v4)
  {
    v8 = CFSTR("HFActionBuilderFailureReason");
    v9[0] = CFSTR("Shortcut action builder has invalid shortcut action");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D51980], 2, v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

@end
