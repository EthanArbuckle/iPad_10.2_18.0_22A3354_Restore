@implementation WFTumblrBlogSubstitutableState

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v8;
  objc_super v9;
  _QWORD v10[4];
  id v11;

  v10[1] = 3221225472;
  v10[2] = __91__WFTumblrBlogSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke;
  v10[3] = &unk_24F8B72E0;
  v11 = a5;
  v9.receiver = self;
  v9.super_class = (Class)WFTumblrBlogSubstitutableState;
  v10[0] = MEMORY[0x24BDAC760];
  v8 = v11;
  -[WFVariableSubstitutableParameterState processWithContext:userInputRequiredHandler:valueHandler:](&v9, sel_processWithContext_userInputRequiredHandler_valueHandler_, a3, a4, v10);

}

void __91__WFTumblrBlogSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_class *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v5 = a2;
  v6 = a3;
  +[WFDiskCache workflowCache](WFDiskCache, "workflowCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDBCF20];
  v9 = objc_opt_class();
  objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __91__WFTumblrBlogSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_2;
  v16[3] = &unk_24F8B6F78;
  v17 = v5;
  v13 = *(id *)(a1 + 32);
  v18 = v6;
  v19 = v13;
  v14 = v6;
  v15 = v5;
  objc_msgSend(v7, "objectOfClasses:forKey:completion:", v10, v12, v16);

}

void __91__WFTumblrBlogSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke_2(_QWORD *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "objectForKeyedSubscript:", a1[4]);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = a1[6];
  v6 = (id)v3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v4 + 16))(v4, v5, a1[5]);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v4 + 16))(v4, 0, a1[5]);
  }

}

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

@end
