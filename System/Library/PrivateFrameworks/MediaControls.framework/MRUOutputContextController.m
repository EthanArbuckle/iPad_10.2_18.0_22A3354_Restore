@implementation MRUOutputContextController

- (MRUOutputContextController)initWithOutputContextType:(int64_t)a3
{
  MRUOutputContextController *v4;
  MRUOutputContextController *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MRUOutputContextController;
  v4 = -[MRUOutputContextController init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_outputContextType = a3;
    v4->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v5, sel_mediaServicesWereLostNotification_, *MEMORY[0x1E0C89730], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v5, sel_mediaServicesWereResetNotification_, *MEMORY[0x1E0C89738], 0);

    -[MRUOutputContextController initializeOutputContextWithCompletion:](v5, "initializeOutputContextWithCompletion:", 0);
  }
  return v5;
}

- (AVOutputDevice)outputDevice
{
  void *v2;
  void *v3;

  -[MRUOutputContextController outputContext](self, "outputContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outputDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (AVOutputDevice *)v3;
}

- (void)setOutputContext:(id)a3
{
  id v5;
  os_unfair_lock_s *p_lock;
  uint64_t v7;
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD block[5];

  v5 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v7 = MEMORY[0x1E0C809B0];
  if (self->_outputContext)
  {
    -[MRUOutputContextController unregisterNotificationsForOutputContext:](self, "unregisterNotificationsForOutputContext:");
    block[0] = v7;
    block[1] = 3221225472;
    block[2] = __47__MRUOutputContextController_setOutputContext___block_invoke;
    block[3] = &unk_1E5818C88;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  objc_storeStrong((id *)&self->_outputContext, a3);
  if (self->_outputContext)
  {
    -[MRUOutputContextController registerNotificationsForOutputContext:](self, "registerNotificationsForOutputContext:");
    -[AVOutputContext outputDevice](self->_outputContext, "outputDevice");
    v9[0] = v7;
    v9[1] = 3221225472;
    v9[2] = __47__MRUOutputContextController_setOutputContext___block_invoke_2;
    v9[3] = &unk_1E5818CB0;
    v9[4] = self;
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v8 = v10;
    dispatch_async(MEMORY[0x1E0C80D38], v9);

  }
  os_unfair_lock_unlock(p_lock);

}

void __47__MRUOutputContextController_setOutputContext___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outputContextController:didChangeOutputDevice:", *(_QWORD *)(a1 + 32), 0);

}

void __47__MRUOutputContextController_setOutputContext___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outputContextController:didChangeOutputDevice:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (AVOutputContext)outputContext
{
  os_unfair_lock_s *p_lock;
  AVOutputContext *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_outputContext;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setOutputDevice:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  _QWORD aBlock[4];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<%@:%p>.setOutputDevice"), objc_opt_class(), self);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@<%@>"), v8, v11);
  v13 = v12;
  if (v6)
    objc_msgSend(v12, "appendFormat:", CFSTR(" for %@"), v6);
  _MRLogForCategory();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v33 = v13;
    _os_log_impl(&dword_1AA991000, v14, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v15 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__MRUOutputContextController_setOutputDevice_completion___block_invoke;
  aBlock[3] = &unk_1E581B508;
  v16 = v6;
  v27 = v16;
  v28 = v8;
  v29 = v11;
  v30 = v9;
  v31 = v7;
  v17 = v7;
  v18 = v9;
  v19 = v11;
  v20 = v8;
  v23[0] = v15;
  v23[1] = 3221225472;
  v23[2] = __57__MRUOutputContextController_setOutputDevice_completion___block_invoke_3;
  v23[3] = &unk_1E581B530;
  v23[4] = self;
  v24 = v16;
  v25 = _Block_copy(aBlock);
  v21 = v25;
  v22 = v16;
  -[MRUOutputContextController initializeOutputContextWithCompletion:](self, "initializeOutputContextWithCompletion:", v23);

}

void __57__MRUOutputContextController_setOutputDevice_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  _QWORD block[4];
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id (*v36)(uint64_t);
  void *v37;
  id v38;
  id v39;
  uint64_t v40;
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(_QWORD *)(a1 + 32);
  _MRLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v5)
    {
      if (!v7)
        goto LABEL_15;
      v8 = *(_QWORD *)(a1 + 40);
      v9 = *(_QWORD *)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
      *(_DWORD *)buf = 138544386;
      v42 = v8;
      v43 = 2114;
      v44 = v9;
      v45 = 2112;
      v46 = v10;
      v47 = 2114;
      v48 = v11;
      v49 = 2048;
      v50 = v13;
      v14 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
      v15 = v6;
      v16 = 52;
    }
    else
    {
      if (!v7)
        goto LABEL_15;
      v24 = *(_QWORD *)(a1 + 40);
      v25 = *(_QWORD *)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
      *(_DWORD *)buf = 138544130;
      v42 = v24;
      v43 = 2114;
      v44 = v25;
      v45 = 2112;
      v46 = v10;
      v47 = 2048;
      v48 = v26;
      v14 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
      v15 = v6;
      v16 = 42;
    }
    _os_log_impl(&dword_1AA991000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);

  }
  else
  {
    if (v5)
    {
      if (!v7)
        goto LABEL_15;
      v18 = *(_QWORD *)(a1 + 40);
      v17 = *(_QWORD *)(a1 + 48);
      v19 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
      *(_DWORD *)buf = 138544130;
      v42 = v18;
      v43 = 2114;
      v44 = v17;
      v45 = 2114;
      v46 = v19;
      v47 = 2048;
      v48 = v20;
      v21 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
      v22 = v6;
      v23 = 42;
    }
    else
    {
      if (!v7)
        goto LABEL_15;
      v27 = *(_QWORD *)(a1 + 40);
      v28 = *(_QWORD *)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
      *(_DWORD *)buf = 138543874;
      v42 = v27;
      v43 = 2114;
      v44 = v28;
      v45 = 2048;
      v46 = v29;
      v21 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      v22 = v6;
      v23 = 32;
    }
    _os_log_impl(&dword_1AA991000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
  }

LABEL_15:
  v30 = MEMORY[0x1E0C809B0];
  v34 = MEMORY[0x1E0C809B0];
  v35 = 3221225472;
  v36 = __57__MRUOutputContextController_setOutputDevice_completion___block_invoke_19;
  v37 = &unk_1E5818B60;
  v38 = *(id *)(a1 + 32);
  v40 = a2;
  v39 = *(id *)(a1 + 56);
  MRAnalyticsSendEvent();
  if (*(_QWORD *)(a1 + 64))
  {
    block[0] = v30;
    block[1] = 3221225472;
    block[2] = __57__MRUOutputContextController_setOutputDevice_completion___block_invoke_2;
    block[3] = &unk_1E581B4E0;
    v32 = *(id *)(a1 + 64);
    v33 = a2;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

id __57__MRUOutputContextController_setOutputDevice_completion___block_invoke_19(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "deviceSubType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("destination_device_sub_type"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("error_code"));

  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceNow");
  objc_msgSend(v5, "numberWithDouble:", -v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, CFSTR("duration"));

  return v2;
}

uint64_t __57__MRUOutputContextController_setOutputDevice_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __57__MRUOutputContextController_setOutputDevice_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(a1 + 32), "_setOutputDevice:context:completion:", *(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 48));
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_setOutputDevice:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  void *v11;
  char v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  void (**v16)(id, _QWORD);
  id v17;
  uint8_t buf[4];
  MRUOutputContextController *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  objc_msgSend(v9, "outputDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqual:", v8);

  if ((v12 & 1) != 0)
  {
    v10[2](v10, 0);
  }
  else
  {
    _MPAVLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v19 = self;
      v20 = 2114;
      v21 = v8;
      v22 = 2114;
      v23 = v9;
      _os_log_impl(&dword_1AA991000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ setting output device: %{public}@ for context: %{public}@", buf, 0x20u);
    }

    objc_initWeak((id *)buf, self);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __66__MRUOutputContextController__setOutputDevice_context_completion___block_invoke;
    v14[3] = &unk_1E581B558;
    objc_copyWeak(&v17, (id *)buf);
    v15 = v8;
    v16 = v10;
    objc_msgSend(v9, "setOutputDevice:options:completionHandler:", v15, 0, v14);

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
  }

}

void __66__MRUOutputContextController__setOutputDevice_context_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = objc_msgSend(v3, "status");
  if (v5 == 3)
  {
    _MPAVLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_opt_class();
      v12 = *(_QWORD *)(a1 + 32);
      objc_msgSend(WeakRetained, "outputContext");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = v11;
      v19 = 2114;
      v20 = v12;
      v21 = 2114;
      v22 = v13;
      _os_log_impl(&dword_1AA991000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ failed setting output device: %{public}@ for context: %{public}@", (uint8_t *)&v17, 0x20u);

    }
  }
  else if (v5 == 4)
  {
    _MPAVLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_opt_class();
      v8 = *(_QWORD *)(a1 + 32);
      objc_msgSend(WeakRetained, "outputContext");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "cancellationReason");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138544130;
      v18 = v7;
      v19 = 2114;
      v20 = v8;
      v21 = 2114;
      v22 = v9;
      v23 = 2114;
      v24 = v10;
      _os_log_impl(&dword_1AA991000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ cancelled setting output device: %{public}@ for context: %{public}@ with reason: %{public}@", (uint8_t *)&v17, 0x2Au);

    }
  }
  else
  {
    _MPAVLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_opt_class();
      v15 = *(_QWORD *)(a1 + 32);
      objc_msgSend(WeakRetained, "outputContext");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = v14;
      v19 = 2114;
      v20 = v15;
      v21 = 2114;
      v22 = v16;
      _os_log_impl(&dword_1AA991000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ success setting output device: %{public}@ for context: %{public}@", (uint8_t *)&v17, 0x20u);

    }
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)outputDeviceChangedNotification:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  MRUOutputContextController *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[MRUOutputContextController outputDevice](self, "outputDevice", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _MPAVLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[MRUOutputContextController outputContext](self, "outputContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v11 = self;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_1AA991000, v5, OS_LOG_TYPE_DEFAULT, "%@ observed output device changed %@", buf, 0x16u);

  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__MRUOutputContextController_outputDeviceChangedNotification___block_invoke;
  v8[3] = &unk_1E5818CB0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

void __62__MRUOutputContextController_outputDeviceChangedNotification___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outputContextController:didChangeOutputDevice:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (id)associatedOutputContext
{
  int64_t outputContextType;

  outputContextType = self->_outputContextType;
  switch(outputContextType)
  {
    case 2:
      objc_msgSend(MEMORY[0x1E0C8B2A8], "sharedAudioPresentationOutputContext");
      self = (MRUOutputContextController *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      objc_msgSend(MEMORY[0x1E0C8B2A8], "sharedSystemScreenContext");
      self = (MRUOutputContextController *)objc_claimAutoreleasedReturnValue();
      break;
    case 0:
      objc_msgSend(MEMORY[0x1E0C8B2A8], "sharedSystemAudioContext");
      self = (MRUOutputContextController *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return self;
}

- (void)registerNotificationsForOutputContext:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0CB37D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_outputDeviceChangedNotification_, *MEMORY[0x1E0C8AB28], v5);

}

- (void)unregisterNotificationsForOutputContext:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0CB37D0];
  v5 = a3;
  objc_msgSend(v4, "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x1E0C8AB28], v5);

}

- (void)initializeOutputContextWithCompletion:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  uint64_t (**v18)(_QWORD);
  NSObject *v19;
  const __CFString *v20;
  dispatch_time_t v21;
  NSObject *v22;
  id v23;
  __CFString *v24;
  unint64_t outputContextType;
  _QWORD block[4];
  uint64_t (**v27)(_QWORD);
  id v28;
  unint64_t v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id location;
  _QWORD aBlock[4];
  id v35;
  id v36;
  id v37;
  void (**v38)(id, void *, _QWORD);
  unint64_t v39;
  uint8_t buf[4];
  const __CFString *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, _QWORD))a3;
  -[MRUOutputContextController outputContext](self, "outputContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (v4)
      v4[2](v4, v5, 0);
  }
  else
  {
    outputContextType = self->_outputContextType;
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<%@:%p>.initializeOutputContextWithCompletion"), objc_opt_class(), self);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("%@<%@>"), v6, v9);
    if (outputContextType <= 2)
      -[__CFString appendFormat:](v24, "appendFormat:", CFSTR(" for %@"), off_1E581B628[outputContextType]);
    _MRLogForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v41 = v24;
      _os_log_impl(&dword_1AA991000, v10, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
    }

    v11 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __68__MRUOutputContextController_initializeOutputContextWithCompletion___block_invoke;
    aBlock[3] = &unk_1E581B580;
    v39 = outputContextType;
    v12 = v6;
    v13 = v11;
    v23 = v12;
    v35 = v12;
    v14 = v9;
    v36 = v14;
    v15 = v7;
    v37 = v15;
    v38 = v4;
    v16 = _Block_copy(aBlock);
    objc_initWeak(&location, self);
    v30[0] = v13;
    v30[1] = 3221225472;
    v30[2] = __68__MRUOutputContextController_initializeOutputContextWithCompletion___block_invoke_36;
    v30[3] = &unk_1E581B5A8;
    objc_copyWeak(&v32, &location);
    v17 = v16;
    v31 = v17;
    v18 = (uint64_t (**)(_QWORD))_Block_copy(v30);
    if (initializeOutputContextWithCompletion__onceToken != -1)
      dispatch_once(&initializeOutputContextWithCompletion__onceToken, &__block_literal_global_33);
    if ((v18[2](v18) & 1) == 0)
    {
      _MPAVLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = CFSTR("SharedSystemAudio");
        if (outputContextType == 2)
          v20 = CFSTR("SharedAudioPresentation");
        if (outputContextType == 1)
          v20 = CFSTR("SharedSystemScreen");
        *(_DWORD *)buf = 138543362;
        v41 = v20;
        _os_log_impl(&dword_1AA991000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ unavailable. Retrying", buf, 0xCu);
      }

      v21 = dispatch_time(0, 1000000000);
      v22 = initializeOutputContextWithCompletion__workerQueue;
      block[0] = v13;
      block[1] = 3221225472;
      block[2] = __68__MRUOutputContextController_initializeOutputContextWithCompletion___block_invoke_39;
      block[3] = &unk_1E581B5F0;
      v27 = v18;
      v29 = outputContextType;
      v28 = v17;
      dispatch_after(v21, v22, block);

    }
    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);

  }
}

void __68__MRUOutputContextController_initializeOutputContextWithCompletion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  unint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const __CFString *v13;
  const __CFString *v14;
  void *v15;
  uint64_t v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const __CFString *v23;
  const __CFString *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const __CFString *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const __CFString *v32;
  const __CFString *v33;
  const __CFString *v34;
  uint64_t v35;
  uint64_t v36;
  const __CFString *v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  const __CFString *v44;
  __int16 v45;
  const __CFString *v46;
  __int16 v47;
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  v8 = a1[8];
  if (v5 && !v6)
  {
    if (v8 <= 2)
    {
      _MRLogForCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        goto LABEL_37;
      v10 = a1[4];
      v11 = a1[5];
      v12 = a1[8];
      v13 = CFSTR("SharedSystemAudio");
      if (v12 == 2)
        v13 = CFSTR("SharedAudioPresentation");
      if (v12 == 1)
        v14 = CFSTR("SharedSystemScreen");
      else
        v14 = v13;
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "timeIntervalSinceDate:", a1[6]);
      v39 = 138544386;
      v40 = v10;
      v41 = 2114;
      v42 = v11;
      v43 = 2112;
      v44 = v5;
      v45 = 2114;
      v46 = v14;
      v47 = 2048;
      v48 = v16;
      v17 = "Response: %{public}@<%{public}@> returned <%@> for %{public}@ in %.4lf seconds";
      v18 = v9;
      v19 = 52;
      goto LABEL_35;
    }
    _MRLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_37;
    v26 = a1[4];
    v27 = a1[5];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timeIntervalSinceDate:", a1[6]);
    v39 = 138544130;
    v40 = v26;
    v41 = 2114;
    v42 = v27;
    v43 = 2112;
    v44 = v5;
    v45 = 2048;
    v46 = v28;
    v17 = "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds";
LABEL_30:
    v18 = v9;
    v19 = 42;
LABEL_35:
    _os_log_impl(&dword_1AA991000, v18, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v39, v19);
LABEL_36:

    goto LABEL_37;
  }
  if (!v6)
  {
    if (v8 > 2)
    {
      _MRLogForCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        goto LABEL_37;
      v35 = a1[4];
      v36 = a1[5];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "timeIntervalSinceDate:", a1[6]);
      v39 = 138543874;
      v40 = v35;
      v41 = 2114;
      v42 = v36;
      v43 = 2048;
      v44 = v37;
      v17 = "Response: %{public}@<%{public}@> returned in %.4lf seconds";
      v18 = v9;
      v19 = 32;
      goto LABEL_35;
    }
    _MRLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_37;
    v29 = a1[4];
    v30 = a1[5];
    v31 = a1[8];
    v32 = CFSTR("SharedSystemAudio");
    if (v31 == 2)
      v32 = CFSTR("SharedAudioPresentation");
    if (v31 == 1)
      v33 = CFSTR("SharedSystemScreen");
    else
      v33 = v32;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timeIntervalSinceDate:", a1[6]);
    v39 = 138544130;
    v40 = v29;
    v41 = 2114;
    v42 = v30;
    v43 = 2114;
    v44 = v33;
    v45 = 2048;
    v46 = v34;
    v17 = "Response: %{public}@<%{public}@> returned for %{public}@ in %.4lf seconds";
    goto LABEL_30;
  }
  if (v8 <= 2)
  {
    _MRLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_37;
    v20 = a1[4];
    v21 = a1[5];
    v22 = a1[8];
    v23 = CFSTR("SharedSystemAudio");
    if (v22 == 2)
      v23 = CFSTR("SharedAudioPresentation");
    if (v22 == 1)
      v24 = CFSTR("SharedSystemScreen");
    else
      v24 = v23;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timeIntervalSinceDate:", a1[6]);
    v39 = 138544386;
    v40 = v20;
    v41 = 2114;
    v42 = v21;
    v43 = 2114;
    v44 = v7;
    v45 = 2114;
    v46 = v24;
    v47 = 2048;
    v48 = v25;
    _os_log_error_impl(&dword_1AA991000, v9, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> for %{public}@ in %.4lf seconds", (uint8_t *)&v39, 0x34u);
    goto LABEL_36;
  }
  _MRLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    __68__MRUOutputContextController_initializeOutputContextWithCompletion___block_invoke_cold_1(a1, (uint64_t)v7, v9);
LABEL_37:

  v38 = a1[7];
  if (v38)
    (*(void (**)(uint64_t, __CFString *, __CFString *))(v38 + 16))(v38, v5, v7);

}

BOOL __68__MRUOutputContextController_initializeOutputContextWithCompletion___block_invoke_36(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  _BOOL8 v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "associatedOutputContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;
    if (v4)
    {
      objc_msgSend(v3, "setOutputContext:", v4);
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

void __68__MRUOutputContextController_initializeOutputContextWithCompletion___block_invoke_2()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.mediaremote.MRUOutputContextController", v2);
  v1 = (void *)initializeOutputContextWithCompletion__workerQueue;
  initializeOutputContextWithCompletion__workerQueue = (uint64_t)v0;

}

void __68__MRUOutputContextController_initializeOutputContextWithCompletion___block_invoke_39(uint64_t a1)
{
  NSObject *v2;
  dispatch_time_t v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  void *v7;
  _QWORD block[4];
  id v9;
  id v10;
  uint64_t v11;

  if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))() & 1) == 0)
  {
    _MPAVLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __68__MRUOutputContextController_initializeOutputContextWithCompletion___block_invoke_39_cold_1(a1, v2);

    v3 = dispatch_time(0, 5000000000);
    v4 = initializeOutputContextWithCompletion__workerQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__MRUOutputContextController_initializeOutputContextWithCompletion___block_invoke_40;
    block[3] = &unk_1E581B5F0;
    v5 = *(id *)(a1 + 32);
    v7 = *(void **)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    v9 = v5;
    v11 = v6;
    v10 = v7;
    dispatch_after(v3, v4, block);

  }
}

void __68__MRUOutputContextController_initializeOutputContextWithCompletion___block_invoke_40(uint64_t a1)
{
  id v2;
  void *v3;
  NSObject *v4;

  if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))() & 1) == 0)
  {
    v2 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v3 = (void *)objc_msgSend(v2, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D4C8E8], 32, 0);
    _MPAVLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      __68__MRUOutputContextController_initializeOutputContextWithCompletion___block_invoke_40_cold_1(a1, v4);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

- (void)mediaServicesWereLostNotification:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  _MPAVLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1AA991000, v4, OS_LOG_TYPE_DEFAULT, "Media services were Lost. Clearing context controller", v5, 2u);
  }

  -[MRUOutputContextController setOutputContext:](self, "setOutputContext:", 0);
}

- (void)mediaServicesWereResetNotification:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  _MPAVLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1AA991000, v4, OS_LOG_TYPE_DEFAULT, "Media services were reset. Rebuilding context controller", v5, 2u);
  }

  -[MRUOutputContextController setOutputContext:](self, "setOutputContext:", 0);
  -[MRUOutputContextController initializeOutputContextWithCompletion:](self, "initializeOutputContextWithCompletion:", 0);
}

- (MRUOutputContextControllerDelegate)delegate
{
  return (MRUOutputContextControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_outputContext, 0);
}

void __68__MRUOutputContextController_initializeOutputContextWithCompletion___block_invoke_cold_1(_QWORD *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a1[4];
  v7 = a1[5];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceDate:", a1[6]);
  v10 = 138544130;
  v11 = v6;
  v12 = 2114;
  v13 = v7;
  v14 = 2114;
  v15 = a2;
  v16 = 2048;
  v17 = v9;
  _os_log_error_impl(&dword_1AA991000, a3, OS_LOG_TYPE_ERROR, "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds", (uint8_t *)&v10, 0x2Au);

}

void __68__MRUOutputContextController_initializeOutputContextWithCompletion___block_invoke_39_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  const __CFString *v3;
  const __CFString *v4;
  int v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 48);
  v3 = CFSTR("SharedSystemAudio");
  if (v2 == 2)
    v3 = CFSTR("SharedAudioPresentation");
  if (v2 == 1)
    v4 = CFSTR("SharedSystemScreen");
  else
    v4 = v3;
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_1AA991000, a2, OS_LOG_TYPE_ERROR, "%{public}@ still unavailable after retry. Retrying with longer backoff", (uint8_t *)&v5, 0xCu);
}

void __68__MRUOutputContextController_initializeOutputContextWithCompletion___block_invoke_40_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  const __CFString *v3;
  const __CFString *v4;
  int v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 48);
  v3 = CFSTR("SharedSystemAudio");
  if (v2 == 2)
    v3 = CFSTR("SharedAudioPresentation");
  if (v2 == 1)
    v4 = CFSTR("SharedSystemScreen");
  else
    v4 = v3;
  v5 = 138543362;
  v6 = v4;
  _os_log_fault_impl(&dword_1AA991000, a2, OS_LOG_TYPE_FAULT, "%{public}@ still unavailable after multiple retries. Giving up", (uint8_t *)&v5, 0xCu);
}

@end
