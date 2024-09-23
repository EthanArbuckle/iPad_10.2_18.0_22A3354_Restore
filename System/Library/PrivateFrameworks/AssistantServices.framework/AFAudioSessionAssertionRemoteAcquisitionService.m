@implementation AFAudioSessionAssertionRemoteAcquisitionService

- (AFAudioSessionAssertionRemoteAcquisitionService)initWithInstanceContext:(id)a3
{
  id v4;
  AFAudioSessionAssertionRemoteAcquisitionService *v5;
  AFInstanceContext *v6;
  AFInstanceContext *instanceContext;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AFAudioSessionAssertionRemoteAcquisitionService;
  v5 = -[AFAudioSessionAssertionRemoteAcquisitionService init](&v9, sel_init);
  if (v5)
  {
    if (v4)
    {
      v6 = (AFInstanceContext *)v4;
    }
    else
    {
      +[AFInstanceContext currentContext](AFInstanceContext, "currentContext");
      v6 = (AFInstanceContext *)objc_claimAutoreleasedReturnValue();
    }
    instanceContext = v5->_instanceContext;
    v5->_instanceContext = v6;

  }
  return v5;
}

- (id)acquireAudioSessionAssertionWithContext:(id)a3 relinquishmentHandler:(id)a4
{
  void *v4;
  id v5;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  AFAudioSessionAssertionConnection *v17;
  AFInstanceContext *instanceContext;
  id v19;
  id v20;
  void *v21;
  AFAudioSessionAssertionConnection *v22;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *);
  void *v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  Dl_info v33;

  v5 = v4;
  v8 = a3;
  v9 = a4;
  v10 = MEMORY[0x1E0C809B0];
  if (v4)
  {
    memset(&v33, 0, sizeof(v33));
    if (dladdr(v4, &v33))
    {
      if (v33.dli_fname && *v33.dli_fname)
      {
        v11 = objc_alloc(MEMORY[0x1E0CB3940]);
        v12 = (void *)objc_msgSend(v11, "initWithUTF8String:", v33.dli_fname);
      }
      else
      {
        v12 = 0;
      }
      if (v33.dli_sname && *v33.dli_sname)
      {
        v13 = objc_alloc(MEMORY[0x1E0CB3940]);
        v14 = (void *)objc_msgSend(v13, "initWithUTF8String:", v33.dli_sname);
      }
      else
      {
        v14 = 0;
      }
      v30[0] = v10;
      v30[1] = 3221225472;
      v30[2] = __113__AFAudioSessionAssertionRemoteAcquisitionService_acquireAudioSessionAssertionWithContext_relinquishmentHandler___block_invoke;
      v30[3] = &unk_1E3A33CF8;
      v31 = v12;
      v32 = v14;
      v15 = v14;
      v16 = v12;
      v5 = +[AFCallSiteInfo newWithBuilder:](AFCallSiteInfo, "newWithBuilder:", v30);

    }
    else
    {
      v5 = 0;
    }
  }
  v17 = [AFAudioSessionAssertionConnection alloc];
  instanceContext = self->_instanceContext;
  v24 = v10;
  v25 = 3221225472;
  v26 = __113__AFAudioSessionAssertionRemoteAcquisitionService_acquireAudioSessionAssertionWithContext_relinquishmentHandler___block_invoke_2;
  v27 = &unk_1E3A2CD98;
  v28 = v8;
  v29 = v5;
  v19 = v5;
  v20 = v8;
  objc_msgSend(v20, "mutatedCopyWithMutator:", &v24);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[AFAudioSessionAssertionConnection initWithInstanceContext:acquisitionContext:relinquishmentHandler:](v17, "initWithInstanceContext:acquisitionContext:relinquishmentHandler:", instanceContext, v21, v9, v24, v25, v26, v27);

  return v22;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceContext, 0);
}

void __113__AFAudioSessionAssertionRemoteAcquisitionService_acquireAudioSessionAssertionWithContext_relinquishmentHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setImagePath:", v3);
  objc_msgSend(v4, "setSymbolName:", *(_QWORD *)(a1 + 40));

}

void __113__AFAudioSessionAssertionRemoteAcquisitionService_acquireAudioSessionAssertionWithContext_relinquishmentHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  objc_class *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!objc_msgSend(*(id *)(a1 + 32), "timestamp"))
    objc_msgSend(v3, "setTimestamp:", mach_absolute_time());
  objc_msgSend(*(id *)(a1 + 32), "reason");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    objc_msgSend(v3, "setReason:", CFSTR("Client Acquisition"));
  objc_msgSend(*(id *)(a1 + 32), "effectiveDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setEffectiveDate:", v6);

  }
  objc_msgSend(*(id *)(a1 + 32), "expirationDuration");
  if (v7 < 0.0)
    objc_msgSend(v3, "setExpirationDuration:", 0.0);
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(void **)(a1 + 40);
  v11 = v8;
  v12 = (objc_class *)MEMORY[0x1E0C99E08];
  v13 = v10;
  v14 = objc_alloc_init(v12);
  v19[0] = CFSTR("processIdentifier");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v9, "processIdentifier"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = CFSTR("processName");
  v20[0] = v15;
  objc_msgSend(v9, "processName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addEntriesFromDictionary:", v17);

  objc_msgSend(v13, "buildDictionaryRepresentation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
    objc_msgSend(v14, "addEntriesFromDictionary:", v18);
  if (v11)
    objc_msgSend(v14, "addEntriesFromDictionary:", v11);

  objc_msgSend(v3, "setUserInfo:", v14);
}

@end
