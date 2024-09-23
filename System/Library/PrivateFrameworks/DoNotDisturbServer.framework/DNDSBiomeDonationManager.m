@implementation DNDSBiomeDonationManager

- (DNDSBiomeDonationManager)init
{
  DNDSBiomeDonationManager *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  BMStream *computedModeStream;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DNDSBiomeDonationManager;
  v2 = -[DNDSBiomeDonationManager init](&v8, sel_init);
  if (v2)
  {
    BiomeLibrary();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UserFocus");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ComputedMode");
    v5 = objc_claimAutoreleasedReturnValue();
    computedModeStream = v2->_computedModeStream;
    v2->_computedModeStream = (BMStream *)v5;

  }
  return v2;
}

- (void)_donateEventForStateUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  unint64_t v12;
  unsigned int v13;
  unint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  unint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  unsigned int v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "previousState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activeModeConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "state");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "activeModeConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == v10 || v7 && v10 && objc_msgSend(v7, "isEqual:", v10))
  {
    v11 = DNDSLogBiomeDonation;
    if (os_log_type_enabled((os_log_t)DNDSLogBiomeDonation, OS_LOG_TYPE_ERROR))
      -[DNDSBiomeDonationManager _donateEventForStateUpdate:].cold.1(v11);
  }
  else
  {
    v12 = objc_msgSend(v4, "reason");
    if (v12 > 6)
      v13 = 1;
    else
      v13 = dword_1CB953B08[v12];
    v40 = v13;
    v14 = objc_msgSend(v4, "source");
    if (v14 >= 4)
      v15 = 2;
    else
      v15 = v14;
    if (v7)
    {
      v16 = objc_alloc(MEMORY[0x1E0D02340]);
      objc_msgSend(v7, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "UUIDString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v7, "semanticType") + 1;
      if (v19 < 0xB)
        v20 = (v19 + 1);
      else
        v20 = 0;
      objc_msgSend(v7, "modeIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(v16, "initWithMode:starting:updateReason:semanticType:updateSource:semanticModeIdentifier:", v18, MEMORY[0x1E0C9AAA0], v40, v20, v15, v21);

      -[BMStream source](self->_computedModeStream, "source");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "sendEvent:", v22);

      v24 = (void *)DNDSLogBiomeDonation;
      if (os_log_type_enabled((os_log_t)DNDSLogBiomeDonation, OS_LOG_TYPE_DEFAULT))
      {
        v25 = v24;
        objc_msgSend(v4, "reason");
        DNDStateUpdateReasonToString();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "source");
        DNDStateUpdateSourceToString();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v42 = v26;
        v43 = 2114;
        v44 = v27;
        v45 = 2114;
        v46 = v7;
        _os_log_impl(&dword_1CB895000, v25, OS_LOG_TYPE_DEFAULT, "Biome event(s) donated for mode end: reason=%{public}@ source=%{public}@ from=%{public}@", buf, 0x20u);

      }
    }
    if (v10)
    {
      v28 = objc_alloc(MEMORY[0x1E0D02340]);
      objc_msgSend(v10, "identifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "UUIDString");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v10, "semanticType") + 1;
      if (v31 < 0xB)
        v32 = (v31 + 1);
      else
        v32 = 0;
      objc_msgSend(v10, "modeIdentifier");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)objc_msgSend(v28, "initWithMode:starting:updateReason:semanticType:updateSource:semanticModeIdentifier:", v30, MEMORY[0x1E0C9AAB0], v40, v32, v15, v33);

      -[BMStream source](self->_computedModeStream, "source");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "sendEvent:", v34);

      v36 = (void *)DNDSLogBiomeDonation;
      if (os_log_type_enabled((os_log_t)DNDSLogBiomeDonation, OS_LOG_TYPE_DEFAULT))
      {
        v37 = v36;
        objc_msgSend(v4, "reason");
        DNDStateUpdateReasonToString();
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "source");
        DNDStateUpdateSourceToString();
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v42 = v38;
        v43 = 2114;
        v44 = v39;
        v45 = 2114;
        v46 = v10;
        _os_log_impl(&dword_1CB895000, v37, OS_LOG_TYPE_DEFAULT, "Biome event(s) donated for mode begin: reason=%{public}@ source=%{public}@ to=%{public}@", buf, 0x20u);

      }
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_computedModeStream, 0);
}

- (void)_donateEventForStateUpdate:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1CB895000, log, OS_LOG_TYPE_ERROR, "Ignoring request to donate for state update; from and to mode are the same.",
    v1,
    2u);
}

@end
