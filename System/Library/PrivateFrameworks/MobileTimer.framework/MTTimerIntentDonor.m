@implementation MTTimerIntentDonor

- (MTTimerIntentDonor)initWithStorage:(id)a3
{
  id v5;
  NSObject *v6;
  NSMutableSet *v7;
  NSMutableSet *donatedTimerIDs;
  NSObject *v9;
  dispatch_queue_t v10;
  NAScheduler *v11;
  NAScheduler *serializer;
  int v14;
  MTTimerIntentDonor *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (self)
  {
    MTLogForCategory(4);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138543362;
      v15 = self;
      _os_log_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_DEFAULT, "Initializing %{public}@", (uint8_t *)&v14, 0xCu);
    }

    objc_storeStrong((id *)&self->_storage, a3);
    -[MTTimerStorage registerObserver:](self->_storage, "registerObserver:", self);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v7 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    donatedTimerIDs = self->_donatedTimerIDs;
    self->_donatedTimerIDs = v7;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.MTTimerIntentDonor.serialqueue", v9);

    objc_msgSend(MEMORY[0x1E0D519E8], "schedulerWithDispatchQueue:", v10);
    v11 = (NAScheduler *)objc_claimAutoreleasedReturnValue();
    serializer = self->_serializer;
    self->_serializer = v11;

  }
  return self;
}

- (void)source:(id)a3 didAddTimers:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v6, "donatesIntent"))
  {
    -[MTTimerIntentDonor serializer](self, "serializer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __42__MTTimerIntentDonor_source_didAddTimers___block_invoke;
    v9[3] = &unk_1E39CB828;
    v9[4] = self;
    v10 = v7;
    v11 = v6;
    objc_msgSend(v8, "performBlock:", v9);

  }
}

void __42__MTTimerIntentDonor_source_didAddTimers___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t v14[128];
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(4);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v16 = v3;
    v17 = 2114;
    v18 = v4;
    _os_log_impl(&dword_19AC4E000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ didAddTimers %{public}@", buf, 0x16u);
  }

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = *(id *)(a1 + 40);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(a1 + 32), "_queue_donateCreateTimerIntent:source:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), *(_QWORD *)(a1 + 48), (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)source:(id)a3 didUpdateTimers:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v6, "donatesIntent"))
  {
    -[MTTimerIntentDonor serializer](self, "serializer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __45__MTTimerIntentDonor_source_didUpdateTimers___block_invoke;
    v9[3] = &unk_1E39CB828;
    v9[4] = self;
    v10 = v7;
    v11 = v6;
    objc_msgSend(v8, "performBlock:", v9);

  }
}

void __45__MTTimerIntentDonor_source_didUpdateTimers___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(4);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v19 = v3;
    v20 = 2114;
    v21 = v4;
    _os_log_impl(&dword_19AC4E000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ didUpdateTimers %{public}@", buf, 0x16u);
  }

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = *(id *)(a1 + 40);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "state", (_QWORD)v13) == 3)
        {
          objc_msgSend(*(id *)(a1 + 32), "_queue_donateCreateTimerIntent:source:", v10, *(_QWORD *)(a1 + 48));
        }
        else if (objc_msgSend(v10, "state") == 1)
        {
          v11 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
          objc_msgSend(v10, "timerID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "removeObject:", v12);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

}

- (void)source:(id)a3 didFireTimer:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[MTTimerIntentDonor serializer](self, "serializer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42__MTTimerIntentDonor_source_didFireTimer___block_invoke;
  v8[3] = &unk_1E39CB7B0;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "performBlock:", v8);

}

void __42__MTTimerIntentDonor_source_didFireTimer___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  MTLogForCategory(4);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v8 = 138543618;
    v9 = v3;
    v10 = 2114;
    v11 = v4;
    _os_log_impl(&dword_19AC4E000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ didFireTimer %{public}@", (uint8_t *)&v8, 0x16u);
  }

  v5 = *(void **)(a1 + 40);
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(v5, "timerID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v7);

}

- (void)_queue_donateCreateTimerIntent:(id)a3 source:(id)a4
{
  id v6;
  id v7;
  NSMutableSet *donatedTimerIDs;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSMutableSet *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[2];
  _QWORD v31[2];
  uint8_t buf[4];
  MTTimerIntentDonor *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  donatedTimerIDs = self->_donatedTimerIDs;
  objc_msgSend(v6, "timerID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(donatedTimerIDs) = -[NSMutableSet containsObject:](donatedTimerIDs, "containsObject:", v9);

  if ((donatedTimerIDs & 1) == 0)
  {
    if ((objc_msgSend(v6, "hasDefaultTitle") & 1) != 0)
    {
      v10 = 0;
    }
    else
    {
      v11 = objc_alloc(MEMORY[0x1E0CBDC00]);
      objc_msgSend(v6, "displayTitle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v11, "initWithSpokenPhrase:", v12);

    }
    v13 = objc_alloc(MEMORY[0x1E0CBD830]);
    objc_msgSend(v6, "duration");
    v14 = (void *)objc_msgSend(v13, "initWithLabel:duration:type:", v10, 0);
    objc_msgSend(v14, "_setExtensionBundleId:", CFSTR("com.apple.mobiletimer-framework.MobileTimerIntents"));
    objc_msgSend(v14, "_setLaunchId:", CFSTR("com.apple.mobiletimer"));
    objc_msgSend(v14, "_setNanoLaunchId:", CFSTR("com.apple.private.NanoTimer"));
    MTLogForCategory(4);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v33 = self;
      v34 = 2114;
      v35 = v14;
      _os_log_impl(&dword_19AC4E000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ Donating intent: %{public}@", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB3B10], "mtUserActivityWithActivityType:", CFSTR("com.apple.clock.timer"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = CFSTR("identifier");
    objc_msgSend(v14, "identifier");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    if (v17)
      v19 = (const __CFString *)v17;
    else
      v19 = &stru_1E39CF258;
    v30[1] = CFSTR("duration");
    v31[0] = v19;
    v20 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v14, "duration");
    objc_msgSend(v20, "numberWithDouble:");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v31[1] = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setUserInfo:", v22);

    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD838]), "initWithCode:userActivity:", 3, v16);
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD9A8]), "initWithIntent:response:", v14, v23);
    objc_msgSend(v24, "mtSetIntentDonorFromSource:", v7);
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __60__MTTimerIntentDonor__queue_donateCreateTimerIntent_source___block_invoke;
    v28[3] = &unk_1E39CC2D8;
    v29 = v14;
    v25 = v14;
    objc_msgSend(v24, "donateInteractionWithCompletion:", v28);
    v26 = self->_donatedTimerIDs;
    objc_msgSend(v6, "timerID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet addObject:](v26, "addObject:", v27);

  }
}

void __60__MTTimerIntentDonor__queue_donateCreateTimerIntent_source___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  MTLogForCategory(4);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __60__MTTimerIntentDonor__queue_donateCreateTimerIntent_source___block_invoke_cold_1((uint64_t)v3, v5);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_19AC4E000, v5, OS_LOG_TYPE_DEFAULT, "%@ donated successfully", (uint8_t *)&v7, 0xCu);
  }

}

- (MTTimerStorage)storage
{
  return self->_storage;
}

- (NSMutableSet)donatedTimerIDs
{
  return self->_donatedTimerIDs;
}

- (NAScheduler)serializer
{
  return self->_serializer;
}

- (void)setSerializer:(id)a3
{
  objc_storeStrong((id *)&self->_serializer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serializer, 0);
  objc_storeStrong((id *)&self->_donatedTimerIDs, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

void __60__MTTimerIntentDonor__queue_donateCreateTimerIntent_source___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_19AC4E000, a2, OS_LOG_TYPE_ERROR, "Error donating timer create intent: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
