@implementation HFFetchedHomeKitObjectItem

+ (BOOL)alwaysPerformFullFetch
{
  return 0;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  char v21;
  id location;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", HFItemUpdateOptionFullUpdateIndicated);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "BOOLValue")
    || (-[HFFetchedHomeKitObjectItem homeKitObject](self, "homeKitObject"),
        (v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {

    objc_initWeak(&location, self);
    goto LABEL_6;
  }
  v7 = (void *)v6;
  v8 = objc_msgSend((id)objc_opt_class(), "alwaysPerformFullFetch");

  objc_initWeak(&location, self);
  if ((v8 & 1) != 0)
  {
LABEL_6:
    -[HFFetchedHomeKitObjectItem _homeKitObjectFetch](self, "_homeKitObjectFetch");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 1;
    goto LABEL_7;
  }
  v9 = (void *)MEMORY[0x1E0D519C0];
  -[HFFetchedHomeKitObjectItem homeKitObject](self, "homeKitObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "futureWithResult:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0;
LABEL_7:
  v13 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __58__HFFetchedHomeKitObjectItem__subclass_updateWithOptions___block_invoke;
  v19[3] = &unk_1EA735430;
  objc_copyWeak(&v20, &location);
  v21 = v12;
  objc_msgSend(v11, "flatMap:", v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __58__HFFetchedHomeKitObjectItem__subclass_updateWithOptions___block_invoke_2;
  v17[3] = &unk_1EA72A488;
  objc_copyWeak(&v18, &location);
  objc_msgSend(v14, "recover:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v18);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  return v15;
}

id __58__HFFetchedHomeKitObjectItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v5 = WeakRetained;
    if (*(_BYTE *)(a1 + 40))
      objc_msgSend(WeakRetained, "setHomeKitObject:", v3);
    v16 = CFSTR("dependentHomeKitObjects");
    v6 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v5, "homeKitObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithObject:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x1E0D519C0];
    +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "futureWithResult:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 30);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "futureWithError:", v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

id __58__HFFetchedHomeKitObjectItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  const __CFString *v11;
  uint64_t v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory(0x29uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    *(_DWORD *)buf = 138412546;
    v14 = WeakRetained;
    v15 = 2112;
    v16 = v3;
    _os_log_error_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_ERROR, "%@: Failed to fetch HomeKit object with error: %@. Recovering and hiding update result.", buf, 0x16u);

  }
  v5 = (void *)MEMORY[0x1E0D519C0];
  v11 = CFSTR("hidden");
  v12 = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "futureWithResult:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (HFFetchedHomeKitObjectItem)initWithHomeKitObject:(id)a3
{
  id v5;
  HFFetchedHomeKitObjectItem *v6;
  HFFetchedHomeKitObjectItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFFetchedHomeKitObjectItem;
  v6 = -[HFFetchedHomeKitObjectItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_homeKitObject, a3);

  return v7;
}

- (id)_homeKitObjectFetch
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFFetchedHomeKitObjectItem.m"), 71, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HFFetchedHomeKitObjectItem _homeKitObjectFetch]", objc_opt_class());

  return 0;
}

- (HFHomeKitObject)homeKitObject
{
  return self->_homeKitObject;
}

- (void)setHomeKitObject:(id)a3
{
  objc_storeStrong((id *)&self->_homeKitObject, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeKitObject, 0);
}

@end
