@implementation WFArchiveFormatSubstitutableState

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v8;
  void (**v9)(id, void *, _QWORD);
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  objc_super v16;
  _QWORD v17[4];
  id v18;

  v8 = a3;
  v9 = (void (**)(id, void *, _QWORD))a4;
  v10 = a5;
  -[WFVariableSubstitutableParameterState variable](self, "variable");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[WFVariableSubstitutableParameterState variable](self, "variable");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v12, "prompt");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v9[2](v9, v13, 0);

    }
    else
    {

      -[WFVariableSubstitutableParameterState variable](self, "variable");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_opt_class();
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __94__WFArchiveFormatSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke;
      v17[3] = &unk_24F8BA828;
      v18 = v10;
      objc_msgSend(v14, "getObjectRepresentationForClass:context:completionHandler:", v15, v8, v17);

      v12 = v18;
    }

  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)WFArchiveFormatSubstitutableState;
    -[WFVariableSubstitutableParameterState processWithContext:userInputRequiredHandler:valueHandler:](&v16, sel_processWithContext_userInputRequiredHandler_valueHandler_, v8, v9, v10);
  }

}

void __94__WFArchiveFormatSubstitutableState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;

  v10 = a2;
  v7 = a5;
  if (objc_msgSend(v10, "hasPrefix:", CFSTR(".")))
  {
    objc_msgSend(v10, "substringFromIndex:", 1);
    v8 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v8;
  }
  else
  {
    v9 = v10;
  }
  v11 = v9;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
