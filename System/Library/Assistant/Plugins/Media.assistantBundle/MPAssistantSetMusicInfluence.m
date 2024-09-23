@implementation MPAssistantSetMusicInfluence

- (void)performWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  NSString *v6;
  NSString *requestAceHash;
  NSObject *v8;
  NSString *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  _BOOL4 v16;
  id v17;
  void *v18;
  NSString *v19;
  NSString *v20;
  NSObject *v21;
  NSString *v22;
  void *v23;
  id v24;
  _BOOL4 v25;
  void *v26;
  uint64_t v27;
  void *v28;
  NSString *v29;
  NSString *v30;
  NSObject *v31;
  NSString *v32;
  void *v33;
  void *v34;
  void *v35;
  NSString *v36;
  NSString *v37;
  NSObject *v38;
  NSString *v39;
  void *v40;
  void *v41;
  int v42;
  NSString *v43;
  __int16 v44;
  _BYTE v45[10];
  __int16 v46;
  _BOOL4 v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  if (!-[NSString length](self->_requestAceHash, "length"))
  {
    -[MPAssistantSetMusicInfluence aceId](self, "aceId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1CC994A10(CFSTR("Set Music Influence"), v5);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    requestAceHash = self->_requestAceHash;
    self->_requestAceHash = v6;

  }
  _MPLogCategoryAssistant();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = self->_requestAceHash;
    v42 = 138543618;
    v43 = v9;
    v44 = 1024;
    *(_DWORD *)v45 = -[SASettingSetBool value](self, "value");
    _os_log_impl(&dword_1CC97B000, v8, OS_LOG_TYPE_DEFAULT, "Set Music Influence (invoke) <%{public}@>: enabled %{BOOL}u", (uint8_t *)&v42, 0x12u);
  }

  objc_msgSend(MEMORY[0x1E0CC24B8], "standardUserDefaults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "isPrivateListeningEnabled");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  objc_msgSend(MEMORY[0x1E0CC2390], "monitorForCurrentUser");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
    v12 = objc_msgSend(v13, "isPrivateListeningEnabledForCurrentAccessory");
  v15 = v12;
  if (!-[SASettingSetBool toggle](self, "toggle"))
    v15 = -[SASettingSetBool value](self, "value");
  v16 = -[SASettingSetValue dryRun](self, "dryRun");
  if ((_DWORD)v12 == v15)
  {
    v25 = v16;
    if (!v16)
    {
      if (v14)
      {
        objc_msgSend(v14, "setPrivateListeningEnabledForCurrentAccessory:", v15 ^ 1);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v15 ^ 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setPrivateListeningEnabled:", v26);

      }
    }
    v27 = v12 ^ 1;
    if (!-[NSString length](self->_requestAceHash, "length"))
    {
      -[MPAssistantSetMusicInfluence aceId](self, "aceId");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Set Music Influence"), v28);
      v29 = (NSString *)objc_claimAutoreleasedReturnValue();
      v30 = self->_requestAceHash;
      self->_requestAceHash = v29;

    }
    _MPLogCategoryAssistant();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      v32 = self->_requestAceHash;
      v42 = 138544130;
      v43 = v32;
      v44 = 1024;
      *(_DWORD *)v45 = v25;
      *(_WORD *)&v45[4] = 1024;
      *(_DWORD *)&v45[6] = v27;
      v46 = 1024;
      v47 = v15;
      _os_log_impl(&dword_1CC97B000, v31, OS_LOG_TYPE_DEFAULT, "Set Music Influence (perform) <%{public}@>: Dry run: %d, previous music influence: %d, and music influence: %d", (uint8_t *)&v42, 0x1Eu);
    }

    v17 = objc_alloc_init(MEMORY[0x1E0D88460]);
    objc_msgSend(v17, "setValue:", v15);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v27);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setPreviousValue:", v33);

    v24 = objc_alloc_init(MEMORY[0x1E0D88478]);
    objc_msgSend(v24, "setSetting:", v17);
    objc_msgSend(v24, "dictionary");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v34);

    if (!-[NSString length](self->_requestAceHash, "length"))
    {
      -[MPAssistantSetMusicInfluence aceId](self, "aceId");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Set Music Influence"), v35);
      v36 = (NSString *)objc_claimAutoreleasedReturnValue();
      v37 = self->_requestAceHash;
      self->_requestAceHash = v36;

    }
    _MPLogCategoryAssistant();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      v39 = self->_requestAceHash;
      objc_msgSend(v24, "dictionary");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = 138543618;
      v43 = v39;
      v44 = 2114;
      *(_QWORD *)v45 = v40;
      _os_log_impl(&dword_1CC97B000, v38, OS_LOG_TYPE_DEFAULT, "Set Music Influence (completion) <%{public}@>: notifying assistant %{public}@", (uint8_t *)&v42, 0x16u);

    }
    objc_msgSend(v24, "dictionary");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v41);

  }
  else
  {
    v17 = objc_alloc_init(MEMORY[0x1E0D87FE8]);
    objc_msgSend(v17, "setErrorCode:", *MEMORY[0x1E0D89130]);
    objc_msgSend(v17, "setReason:", CFSTR("Value unchanged, No change was made"));
    if (!-[NSString length](self->_requestAceHash, "length"))
    {
      -[MPAssistantSetMusicInfluence aceId](self, "aceId");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      sub_1CC994A10(CFSTR("Set Music Influence"), v18);
      v19 = (NSString *)objc_claimAutoreleasedReturnValue();
      v20 = self->_requestAceHash;
      self->_requestAceHash = v19;

    }
    _MPLogCategoryAssistant();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = self->_requestAceHash;
      objc_msgSend(v17, "dictionary");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = 138543618;
      v43 = v22;
      v44 = 2114;
      *(_QWORD *)v45 = v23;
      _os_log_impl(&dword_1CC97B000, v21, OS_LOG_TYPE_DEFAULT, "Set Music Influence (completion) <%{public}@>: notifying assistant %{public}@", (uint8_t *)&v42, 0x16u);

    }
    objc_msgSend(v17, "dictionary");
    v24 = (id)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v24);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestAceHash, 0);
}

@end
