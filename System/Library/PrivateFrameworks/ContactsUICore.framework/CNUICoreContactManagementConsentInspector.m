@implementation CNUICoreContactManagementConsentInspector

- (CNUICoreContactManagementConsentInspector)init
{
  id v3;
  void *v4;
  CNUICoreContactManagementConsentInspector *v5;

  v3 = objc_alloc_init(getSTManagementStateClass());
  objc_msgSend(MEMORY[0x1E0D13B70], "defaultProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CNUICoreContactManagementConsentInspector initWithManagementState:schedulerProvider:](self, "initWithManagementState:schedulerProvider:", v3, v4);

  return v5;
}

- (CNUICoreContactManagementConsentInspector)initWithManagementState:(id)a3 schedulerProvider:(id)a4
{
  id v7;
  id v8;
  CNUICoreContactManagementConsentInspector *v9;
  CNUICoreContactManagementConsentInspector *v10;
  CNUICoreContactManagementConsentInspector *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNUICoreContactManagementConsentInspector;
  v9 = -[CNUICoreContactManagementConsentInspector init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_managementState, a3);
    objc_storeStrong((id *)&v10->_schedulerProvider, a4);
    v11 = v10;
  }

  return v10;
}

- (unint64_t)contactManagementConsentStateOfDelegateWithInfo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  if (!a3)
    return 0;
  objc_msgSend(a3, "dsid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUICoreContactManagementConsentInspector contactManagementConsentStateFutureForDSID:](self, "contactManagementConsentStateFutureForDSID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "result:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  return v7;
}

- (id)contactManagementConsentStateFutureForDSID:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, uint64_t);
  void *v14;
  id v15;
  CNUICoreContactManagementConsentInspector *v16;

  v4 = (objc_class *)MEMORY[0x1E0D13B20];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  -[CNUICoreContactManagementConsentInspector managementState](self, "managementState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __88__CNUICoreContactManagementConsentInspector_contactManagementConsentStateFutureForDSID___block_invoke;
  v14 = &unk_1EA605460;
  v15 = v6;
  v16 = self;
  v8 = v6;
  objc_msgSend(v7, "contactManagementStateForDSID:completionHandler:", v5, &v11);

  objc_msgSend(v8, "future", v11, v12, v13, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __88__CNUICoreContactManagementConsentInspector_contactManagementConsentStateFutureForDSID___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  id v6;

  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", &unk_1EA61C418);
  }
  else
  {
    v4 = objc_msgSend((id)objc_opt_class(), "contactManagementConsentStateFromSTContactManagementState:", a2);
    v5 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "finishWithResult:", v6);

  }
}

+ (unint64_t)contactManagementConsentStateFromSTContactManagementState:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
    return 0;
  else
    return qword_1DD1C8F50[a3];
}

- (STManagementState)managementState
{
  return self->_managementState;
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
  objc_storeStrong((id *)&self->_managementState, 0);
}

@end
