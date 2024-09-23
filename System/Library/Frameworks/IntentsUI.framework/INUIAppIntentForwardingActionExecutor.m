@implementation INUIAppIntentForwardingActionExecutor

- (INUIAppIntentForwardingActionExecutor)initWithApplication:(id)a3
{
  id v5;
  INUIAppIntentForwardingActionExecutor *v6;
  INUIAppIntentForwardingActionExecutor *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)INUIAppIntentForwardingActionExecutor;
  v6 = -[INUIAppIntentForwardingActionExecutor init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_application, a3);

  return v7;
}

- (void)executeAction:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  objc_class *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  uint64_t *v33;
  _QWORD v34[5];
  id v35;
  _QWORD v36[4];
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD v48[3];

  v48[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[INUIAppIntentForwardingActionExecutor application](self, "application");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "intentForwardingAction");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v43 = 0;
    v44 = &v43;
    v45 = 0x2050000000;
    v11 = (void *)getWFOnScreenContentExtractorClass_softClass;
    v46 = getWFOnScreenContentExtractorClass_softClass;
    v12 = MEMORY[0x1E0C809B0];
    if (!getWFOnScreenContentExtractorClass_softClass)
    {
      v38 = MEMORY[0x1E0C809B0];
      v39 = 3221225472;
      v40 = (uint64_t)__getWFOnScreenContentExtractorClass_block_invoke;
      v41 = &unk_1EA43A8B0;
      v42 = &v43;
      __getWFOnScreenContentExtractorClass_block_invoke((uint64_t)&v38);
      v11 = (void *)v44[3];
    }
    v13 = objc_retainAutorelease(v11);
    _Block_object_dispose(&v43, 8);
    v14 = objc_alloc_init(v13);
    v36[0] = v12;
    v36[1] = 3221225472;
    v36[2] = __73__INUIAppIntentForwardingActionExecutor_executeAction_completionHandler___block_invoke;
    v36[3] = &unk_1EA43A2F8;
    v37 = v7;
    objc_msgSend(v14, "handleAction:completionHandler:", v10, v36);

  }
  else
  {

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "intentForwardingAction");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD750]), "initWithDelegate:", self);
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __73__INUIAppIntentForwardingActionExecutor_executeAction_completionHandler___block_invoke_2;
      v34[3] = &unk_1EA43A320;
      v34[4] = self;
      v35 = v7;
      objc_msgSend(v16, "dispatchIntentForwardingAction:completionHandler:", v15, v34);

    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v38 = 0;
      v39 = (uint64_t)&v38;
      v40 = 0x2020000000;
      LOBYTE(v41) = 0;
      objc_msgSend(v6, "intentForwardingAction");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "intent");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      INTypedIntentWithIntent();
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __73__INUIAppIntentForwardingActionExecutor_executeAction_completionHandler___block_invoke_3;
      v31[3] = &unk_1EA43A348;
      v33 = &v38;
      v32 = v7;
      objc_msgSend(v9, "application:handleIntent:completionHandler:", v8, v19, v31);

      _Block_object_dispose(&v38, 8);
    }
    else
    {
      v20 = (void *)MEMORY[0x1E0CB35C8];
      v47 = *MEMORY[0x1E0CB2938];
      v21 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v6, "intentForwardingAction");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "intent");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringWithFormat:", CFSTR("Missing intent handler for %@"), objc_opt_class());
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v48[0] = v24;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, &v47, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CBD458], 2003, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "intentForwardingAction");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)objc_opt_class();

      v29 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v28, "responseClass")), "initWithError:", v26);
      objc_msgSend(MEMORY[0x1E0CEA680], "responseWithIntentForwardingActionResponse:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v7 + 2))(v7, v30);

    }
  }

}

- (void)intentDeliverer:(id)a3 deliverIntent:(id)a4 withBlock:(id)a5
{
  void (**v7)(id, id);
  void *v8;
  char v9;
  void *v10;
  void *v11;
  id handlerForIntent;
  id v13;

  v13 = a4;
  v7 = (void (**)(id, id))a5;
  -[UIApplication delegate](self->_application, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[UIApplication delegate](self->_application, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "application:handlerForIntent:", self->_application, v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    handlerForIntent = self->_handlerForIntent;
    self->_handlerForIntent = v11;

  }
  v7[2](v7, self->_handlerForIntent);

}

- (UIApplication)application
{
  return self->_application;
}

- (void)setApplication:(id)a3
{
  objc_storeStrong((id *)&self->_application, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_application, 0);
  objc_storeStrong(&self->_handlerForIntent, 0);
}

void __73__INUIAppIntentForwardingActionExecutor_executeAction_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;

  v3 = (objc_class *)MEMORY[0x1E0CEA680];
  v4 = a2;
  v5 = (id)objc_msgSend([v3 alloc], "initWithIntentForwardingActionResponse:", v4);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __73__INUIAppIntentForwardingActionExecutor_executeAction_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CEA680], "responseWithIntentForwardingActionResponse:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

void __73__INUIAppIntentForwardingActionExecutor_executeAction_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  INIntentResponseWithTypedIntentResponse();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 32);
  v3 = (void *)MEMORY[0x1E0CEA680];
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD928]), "initWithIntentResponse:launchContextActivityData:cacheItems:error:", v6, 0, 0, 0);
  objc_msgSend(v3, "responseWithIntentForwardingActionResponse:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v5);

}

@end
