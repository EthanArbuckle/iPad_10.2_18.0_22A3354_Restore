@implementation WFUlyssesAttachAction

- (id)attachmentType
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[WFUlyssesAttachAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("UlyssesAttachmentType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "value");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_class();
    v5 = v3;
    if (v5 && (objc_opt_isKindOfClass() & 1) == 0)
    {
      getWFGeneralLogObject();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        v10 = 136315906;
        v11 = "WFEnforceClass";
        v12 = 2114;
        v13 = v5;
        v14 = 2114;
        v15 = (id)objc_opt_class();
        v16 = 2114;
        v17 = v4;
        v8 = v15;
        _os_log_impl(&dword_22D353000, v7, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", (uint8_t *)&v10, 0x2Au);

      }
      v6 = 0;
    }
    else
    {
      v6 = v5;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v2, "string");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (id)inputContentClasses
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  -[WFUlyssesAttachAction attachmentType](self, "attachmentType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("Keywords")) & 1) != 0)
  {
    v3 = (void *)MEMORY[0x24BDBD1A8];
  }
  else
  {
    if (objc_msgSend(v2, "isEqualToString:", CFSTR("Image")))
    {
      v10[0] = objc_opt_class();
      v4 = (void *)MEMORY[0x24BDBCE30];
      v5 = v10;
      v6 = 1;
    }
    else
    {
      v8 = objc_opt_class();
      v9 = objc_opt_class();
      v4 = (void *)MEMORY[0x24BDBCE30];
      v5 = &v8;
      v6 = 2;
    }
    objc_msgSend(v4, "arrayWithObjects:count:", v5, v6, v8, v9, v10[0]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (BOOL)inputPassthrough
{
  void *v2;
  char v3;

  -[WFUlyssesAttachAction attachmentType](self, "attachmentType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("Keywords"));

  return v3;
}

- (BOOL)inputRequired
{
  void *v3;
  BOOL v4;
  objc_super v6;

  -[WFUlyssesAttachAction attachmentType](self, "attachmentType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Keywords")) & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)WFUlyssesAttachAction;
    v4 = -[WFInterchangeAction inputRequired](&v6, sel_inputRequired);
  }

  return v4;
}

- (id)contentDestinationWithError:(id *)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BE19390];
  -[WFInterchangeAction appDescriptor](self, "appDescriptor", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "locationWithAppDescriptor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
