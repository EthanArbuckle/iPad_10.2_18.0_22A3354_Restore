@implementation NISystemEventNotifier

- (NISystemEventNotifier)initWithParentSession:(id)a3
{
  id v4;
  NISystemEventNotifier *v5;
  NISystemEventNotifier *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NISystemEventNotifier;
  v5 = -[NISystemEventNotifier init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->parentSession, v4);

  return v6;
}

- (void)notifyPassiveAccessIntent:(unint64_t)a3
{
  id WeakRetained;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  _QWORD block[4];
  id v13;
  id v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->parentSession);
  if (WeakRetained)
  {
    v16[0] = &unk_1E43702E8;
    v15[0] = CFSTR("SystemEventDictKey_EventType");
    v15[1] = CFSTR("SystemEventDictKey_PassiveAccessIntentOptions");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "getInternalConnectionQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__NISystemEventNotifier_notifyPassiveAccessIntent___block_invoke;
    block[3] = &unk_1E43622A8;
    v13 = WeakRetained;
    v14 = v8;
    v10 = v8;
    dispatch_sync(v9, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NISession.mm"), 2683, CFSTR("Parent session is nil"));

  }
}

void __51__NISystemEventNotifier_notifyPassiveAccessIntent___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_processSystemEvent:reply:", *(_QWORD *)(a1 + 40), &__block_literal_global_1164);

}

- (void)_notifyResourceUsageLimitExceeded:(BOOL)a3 forSessionConfigurationType:(Class)a4
{
  _BOOL8 v5;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  _QWORD block[4];
  id v16;
  id v17;
  _QWORD v18[3];
  _QWORD v19[4];

  v5 = a3;
  v19[3] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->parentSession);
  if (WeakRetained)
  {
    v19[0] = &unk_1E4370300;
    v18[0] = CFSTR("SystemEventDictKey_EventType");
    v18[1] = CFSTR("SystemEventDictKey_ResourceUsageLimitExceededValue");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v9;
    v18[2] = CFSTR("SystemEventDictKey_ConfigurationType");
    NSStringFromClass(a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19[2] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "getInternalConnectionQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __87__NISystemEventNotifier__notifyResourceUsageLimitExceeded_forSessionConfigurationType___block_invoke;
    block[3] = &unk_1E43622A8;
    v16 = WeakRetained;
    v17 = v11;
    v13 = v11;
    dispatch_sync(v12, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NISession.mm"), 2699, CFSTR("Parent session is nil"));

  }
}

void __87__NISystemEventNotifier__notifyResourceUsageLimitExceeded_forSessionConfigurationType___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_remoteObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_processSystemEvent:reply:", *(_QWORD *)(a1 + 40), &__block_literal_global_1165);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->parentSession);
}

@end
