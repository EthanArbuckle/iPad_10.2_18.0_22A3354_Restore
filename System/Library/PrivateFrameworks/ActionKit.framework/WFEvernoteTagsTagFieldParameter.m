@implementation WFEvernoteTagsTagFieldParameter

- (void)setActionResources:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  id v9;
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
  objc_msgSend(a3, "anyObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  v6 = v4;
  if (v6 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    getWFGeneralLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      v10 = 136315906;
      v11 = "WFEnforceClass";
      v12 = 2114;
      v13 = v6;
      v14 = 2114;
      v15 = (id)objc_opt_class();
      v16 = 2114;
      v17 = v5;
      v9 = v15;
      _os_log_impl(&dword_22D353000, v8, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", (uint8_t *)&v10, 0x2Au);

    }
    v7 = 0;
  }
  else
  {
    v7 = v6;
  }

  -[WFEvernoteTagsTagFieldParameter setEvernoteAccessResource:](self, "setEvernoteAccessResource:", v7);
}

- (void)setEvernoteAccessResource:(id)a3
{
  WFEvernoteAccessResource **p_evernoteAccessResource;
  _QWORD *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  p_evernoteAccessResource = &self->_evernoteAccessResource;
  v6 = (_QWORD *)MEMORY[0x24BEC4628];
  if (self->_evernoteAccessResource)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObserver:name:object:", self, *v6, *p_evernoteAccessResource);

  }
  objc_storeStrong((id *)&self->_evernoteAccessResource, a3);
  if (*p_evernoteAccessResource)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", self, sel_updateTags, *v6, *p_evernoteAccessResource);

  }
}

- (void)wasAddedToWorkflow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFEvernoteTagsTagFieldParameter;
  -[WFEvernoteTagsTagFieldParameter wasAddedToWorkflow](&v3, sel_wasAddedToWorkflow);
  -[WFEvernoteTagsTagFieldParameter updateTags](self, "updateTags");
  -[WFDynamicTagFieldParameter setDataSource:](self, "setDataSource:", self);
}

- (void)updateTags
{
  void *v2;
  int v3;
  void *v4;
  id v5;

  +[WFEvernoteAccessResource evernoteSession](WFEvernoteAccessResource, "evernoteSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAuthenticated");

  if (v3)
  {
    +[WFEvernoteAccessResource evernoteSession](WFEvernoteAccessResource, "evernoteSession");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "primaryNoteStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "listTagsWithCompletion:", &__block_literal_global_4800);

  }
}

- (id)suggestedTagsForTagField:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  +[WFDiskCache workflowCache](WFDiskCache, "workflowCache", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectOfClasses:forKey:", v6, CFSTR("WFEvernoteTags"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_map:", &__block_literal_global_176);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (WFEvernoteAccessResource)evernoteAccessResource
{
  return self->_evernoteAccessResource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_evernoteAccessResource, 0);
}

uint64_t __60__WFEvernoteTagsTagFieldParameter_suggestedTagsForTagField___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "name");
}

void __45__WFEvernoteTagsTagFieldParameter_updateTags__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v4 = a3;
  v8 = v4;
  if (a2 && !v4)
  {
    objc_msgSend(a2, "if_map:", &__block_literal_global_173);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFDiskCache workflowCache](WFDiskCache, "workflowCache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v5, CFSTR("WFEvernoteTags"));

LABEL_7:
    goto LABEL_8;
  }
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isEqualToString:", CFSTR("ENErrorDomain")))
    goto LABEL_7;
  v7 = objc_msgSend(v8, "code");

  if (v7 == 2)
  {
    +[WFDiskCache workflowCache](WFDiskCache, "workflowCache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectForKey:", CFSTR("WFEvernoteTags"));
    goto LABEL_7;
  }
LABEL_8:

}

WFEvernoteTag *__45__WFEvernoteTagsTagFieldParameter_updateTags__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  WFEvernoteTag *v3;

  v2 = a2;
  v3 = -[WFEvernoteTag initWithTag:]([WFEvernoteTag alloc], "initWithTag:", v2);

  return v3;
}

+ (id)referencedActionResourceClasses
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
}

@end
