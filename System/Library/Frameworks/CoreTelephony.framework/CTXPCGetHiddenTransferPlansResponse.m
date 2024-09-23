@implementation CTXPCGetHiddenTransferPlansResponse

- (CTXPCGetHiddenTransferPlansResponse)initWithList:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CTXPCGetHiddenTransferPlansResponse *v7;
  objc_super v9;
  objc_super v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v11 = CFSTR("plans");
    v12[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9.receiver = self;
    v9.super_class = (Class)CTXPCGetHiddenTransferPlansResponse;
    v7 = -[CTXPCMessage initWithNamedArguments:](&v9, sel_initWithNamedArguments_, v6);

  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)CTXPCGetHiddenTransferPlansResponse;
    v7 = -[CTXPCMessage init](&v10, sel_init);
  }

  return v7;
}

- (CTDisplayPlanList)planList
{
  void *v2;
  id v3;
  id v4;

  -[CTXPCMessage namedArguments](self, "namedArguments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("plans"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (CTDisplayPlanList *)v4;
}

+ (id)allowedClassesForArguments
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___CTXPCGetHiddenTransferPlansResponse;
  objc_msgSendSuper2(&v5, sel_allowedClassesForArguments);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObject:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
