@implementation WFTodoistProjectPickerParameter

- (void)wasAddedToWorkflow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFTodoistProjectPickerParameter;
  -[WFTodoistProjectPickerParameter wasAddedToWorkflow](&v3, sel_wasAddedToWorkflow);
  -[WFTodoistProjectPickerParameter loadProjectsFromCache](self, "loadProjectsFromCache");
  -[WFTodoistProjectPickerParameter fetchProjectsIfNeeded](self, "fetchProjectsIfNeeded");
}

- (void)fetchProjectsIfNeeded
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  WFTodoistProjectPickerParameter *v13;

  if (!-[WFTodoistProjectPickerParameter hasLoadedProjects](self, "hasLoadedProjects"))
  {
    -[WFTodoistProjectPickerParameter accessResource](self, "accessResource");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isAvailable") & 1) != 0)
    {
      v3 = -[WFTodoistProjectPickerParameter isInsideWorkflow](self, "isInsideWorkflow");

      if (v3)
      {
        -[WFTodoistProjectPickerParameter accessResource](self, "accessResource");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "accounts");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "firstObject");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        if (v6)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v7 = v6;
          else
            v7 = 0;
        }
        else
        {
          v7 = 0;
        }
        v8 = v7;

        v11[0] = MEMORY[0x24BDAC760];
        v11[1] = 3221225472;
        v11[2] = __56__WFTodoistProjectPickerParameter_fetchProjectsIfNeeded__block_invoke;
        v11[3] = &unk_24F8BB540;
        v12 = v8;
        v13 = self;
        v9 = v8;
        objc_msgSend(v9, "refreshWithCompletionHandler:", v11);

      }
    }
    else
    {

    }
  }
}

- (void)loadProjectsFromCache
{
  void *v3;
  NSArray *v4;
  NSArray *possibleStates;
  id v6;

  -[WFTodoistProjectPickerParameter projects](self, "projects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "if_map:", &__block_literal_global_24718);
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  possibleStates = self->_possibleStates;
  self->_possibleStates = v4;

  -[WFTodoistProjectPickerParameter possibleStatesDidChange](self, "possibleStatesDidChange");
  -[WFTodoistProjectPickerParameter possibleStates](self, "possibleStates");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[WFTodoistProjectPickerParameter setHidden:](self, "setHidden:", objc_msgSend(v6, "count") == 0);

}

- (id)localizedLabelForPossibleState:(id)a3
{
  return (id)objc_msgSend(a3, "value");
}

- (id)accessoryColorForPossibleState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[WFTodoistProjectPickerParameter projects](self, "projects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "if_firstObjectWithValue:forKey:", v6, CFSTR("name"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "color");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)projects
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDBCF50], "workflowUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataForKey:", CFSTR("WFTodoistCachedProjects"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDD1620];
    v5 = (void *)MEMORY[0x24BDBCF20];
    v6 = objc_opt_class();
    objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unarchivedObjectOfClasses:fromData:error:", v7, v3, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)setProjects:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(MEMORY[0x24BDBCF50], "workflowUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("WFTodoistCachedProjects"));

  }
  else
  {
    objc_msgSend(v4, "removeObjectForKey:", CFSTR("WFTodoistCachedProjects"));
  }
  -[WFTodoistProjectPickerParameter loadProjectsFromCache](self, "loadProjectsFromCache");

}

- (id)projectNamed:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[WFTodoistProjectPickerParameter projects](self, "projects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectMatchingKey:value:", CFSTR("name"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setAccessResource:(id)a3
{
  id WeakRetained;
  uint64_t *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_accessResource);

  v5 = (uint64_t *)MEMORY[0x24BEC4628];
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *v5;
    v8 = objc_loadWeakRetained((id *)&self->_accessResource);
    objc_msgSend(v6, "removeObserver:name:object:", self, v7, v8);

  }
  objc_storeWeak((id *)&self->_accessResource, obj);
  v9 = obj;
  if (obj)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", self, sel_fetchProjectsIfNeeded, *v5, obj);

    v9 = obj;
  }

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEC4628], 0);

  v4.receiver = self;
  v4.super_class = (Class)WFTodoistProjectPickerParameter;
  -[WFTodoistProjectPickerParameter dealloc](&v4, sel_dealloc);
}

- (id)possibleStates
{
  return self->_possibleStates;
}

- (WFAccountAccessResource)accessResource
{
  return (WFAccountAccessResource *)objc_loadWeakRetained((id *)&self->_accessResource);
}

- (BOOL)hasLoadedProjects
{
  return self->_hasLoadedProjects;
}

- (void)setHasLoadedProjects:(BOOL)a3
{
  self->_hasLoadedProjects = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_accessResource);
  objc_storeStrong((id *)&self->_possibleStates, 0);
}

id __56__WFTodoistProjectPickerParameter_loadProjectsFromCache__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;

  v2 = (objc_class *)MEMORY[0x24BEC40C8];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(v4, "initWithValue:", v5);
  return v6;
}

void __56__WFTodoistProjectPickerParameter_fetchProjectsIfNeeded__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];

  v2 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "credential");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCredential:", v3);

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __56__WFTodoistProjectPickerParameter_fetchProjectsIfNeeded__block_invoke_2;
  v4[3] = &unk_24F8BB6B0;
  v4[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "getProjectsWithCompletionHandler:", v4);

}

void __56__WFTodoistProjectPickerParameter_fetchProjectsIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __56__WFTodoistProjectPickerParameter_fetchProjectsIfNeeded__block_invoke_3;
    v5[3] = &unk_24F8BA480;
    v5[4] = *(_QWORD *)(a1 + 32);
    v6 = v3;
    dispatch_async(MEMORY[0x24BDAC9B8], v5);

  }
}

uint64_t __56__WFTodoistProjectPickerParameter_fetchProjectsIfNeeded__block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setProjects:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "setHasLoadedProjects:", 1);
}

@end
