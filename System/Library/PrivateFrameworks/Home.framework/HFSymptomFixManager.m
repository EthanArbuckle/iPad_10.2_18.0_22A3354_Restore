@implementation HFSymptomFixManager

- (BOOL)anySymptomIsBeingFixedForFixableObject:(id)a3
{
  id v4;
  void *v5;
  id v6;
  char v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[HFSymptomFixManager items](self, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__HFSymptomFixManager_anySymptomIsBeingFixedForFixableObject___block_invoke;
  v9[3] = &unk_1EA731628;
  v10 = v4;
  v6 = v4;
  v7 = objc_msgSend(v5, "na_any:", v9);

  return v7;
}

- (NSMutableSet)items
{
  return self->_items;
}

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__HFSymptomFixManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ED379040 != -1)
    dispatch_once(&qword_1ED379040, block);
  return (id)_MergedGlobals_247;
}

void __36__HFSymptomFixManager_sharedManager__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)_MergedGlobals_247;
  _MergedGlobals_247 = (uint64_t)v1;

}

- (HFSymptomFixManager)init
{
  HFSymptomFixManager *v2;
  uint64_t v3;
  NSMutableSet *items;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HFSymptomFixManager;
  v2 = -[HFSymptomFixManager init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v3 = objc_claimAutoreleasedReturnValue();
    items = v2->_items;
    v2->_items = (NSMutableSet *)v3;

  }
  return v2;
}

uint64_t __62__HFSymptomFixManager_anySymptomIsBeingFixedForFixableObject___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "accessories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__HFSymptomFixManager_anySymptomIsBeingFixedForFixableObject___block_invoke_2;
  v8[3] = &unk_1EA727840;
  v9 = v3;
  v5 = v3;
  v6 = objc_msgSend(v4, "na_any:", v8);

  return v6;
}

uint64_t __62__HFSymptomFixManager_anySymptomIsBeingFixedForFixableObject___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", v3);

  return v5;
}

- (int64_t)fixStateForSymptom:(id)a3 accessory:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;

  -[HFSymptomFixManager _itemForSymptom:accessory:](self, "_itemForSymptom:accessory:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "fixSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "state");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)fixSymptom:(id)a3 forFixableObject:(id)a4 presentingViewController:(id)a5
{
  HFSymptomFixManagerItem *v8;
  HFSymptomFixManagerItem *v9;
  NSObject *v10;
  NSObject *v11;
  HFSymptomFixManagerItem *v12;
  HFSymptomFixManagerItem *v13;
  HFSymptomFixManagerItem *v14;
  HFSymptomFixManagerItem *v15;
  HFSymptomFixManagerItem *v16;
  HFSymptomFixManagerItem *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  HFSymptomFixManagerItem *v22;
  HFSymptomFixManagerItem *v23;
  NSObject *v24;
  void *v25;
  HFSymptomFixManagerItem *v26;
  HFSymptomFixManagerItem *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  HFSymptomFixManagerItem *v34;
  uint64_t v35;
  HFSymptomFixManagerItem *v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  const __CFString *v42;
  void *v43;
  uint8_t v44[128];
  uint8_t buf[4];
  HFSymptomFixManagerItem *v46;
  __int16 v47;
  HFSymptomFixManagerItem *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v8 = (HFSymptomFixManagerItem *)a3;
  v9 = (HFSymptomFixManagerItem *)a4;
  v37 = a5;
  HFLogForCategory(0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v46 = v8;
    v47 = 2112;
    v48 = v9;
    _os_log_impl(&dword_1DD34E000, v10, OS_LOG_TYPE_DEFAULT, "Starting fix for symptom %@ on fixable object %@", buf, 0x16u);
  }

  if (!+[HFUtilities isInternalInstall](HFUtilities, "isInternalInstall")
    || !-[HFSymptomFixManagerItem hf_generatedByHomeAppForDebuggingPurposes](v8, "hf_generatedByHomeAppForDebuggingPurposes"))
  {
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    -[HFSymptomFixManagerItem accessories](v9, "accessories");
    v17 = (HFSymptomFixManagerItem *)objc_claimAutoreleasedReturnValue();
    v18 = -[HFSymptomFixManagerItem countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    if (v18)
    {
      v19 = v18;
      v34 = v9;
      v20 = *(_QWORD *)v39;
      v35 = *(_QWORD *)v39;
      v36 = v17;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v39 != v20)
            objc_enumerationMutation(v17);
          v22 = *(HFSymptomFixManagerItem **)(*((_QWORD *)&v38 + 1) + 8 * i);
          -[HFSymptomFixManager _itemForSymptom:accessory:](self, "_itemForSymptom:accessory:", v8, v22);
          v23 = (HFSymptomFixManagerItem *)objc_claimAutoreleasedReturnValue();
          if (v23)
          {
            HFLogForCategory(0);
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v46 = v22;
              v47 = 2112;
              v48 = v23;
              _os_log_impl(&dword_1DD34E000, v24, OS_LOG_TYPE_DEFAULT, "Not fixing accessory %@ because it is currently being fixed: %@", buf, 0x16u);
            }
          }
          else
          {
            -[HFSymptomFixManagerItem symptomsHandler](v22, "symptomsHandler");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v25, "newFixSessionForSymptom:", v8);

            if (v24)
            {
              v26 = v8;
              v27 = -[HFSymptomFixManagerItem initWithSymptom:fixSession:accessory:]([HFSymptomFixManagerItem alloc], "initWithSymptom:fixSession:accessory:", v8, v24, v22);
              -[HFSymptomFixManager items](self, "items");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "addObject:", v27);

              HFLogForCategory(0);
              v29 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v46 = v27;
                _os_log_error_impl(&dword_1DD34E000, v29, OS_LOG_TYPE_ERROR, "Now Posting HFSymptomFixManagerStartSessionNotification for item  %@", buf, 0xCu);
              }

              objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v42 = CFSTR("symptomItemIdentifier");
              -[HFSymptomFixManagerItem identifier](v27, "identifier");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v43 = v31;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "postNotificationName:object:userInfo:", CFSTR("HFSymptomFixManagerStartSessionNotification"), 0, v32);

              HFLogForCategory(0);
              v33 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v46 = v27;
                _os_log_impl(&dword_1DD34E000, v33, OS_LOG_TYPE_DEFAULT, "Starting fix session for item: %@", buf, 0xCu);
              }

              -[NSObject setDelegate:](v24, "setDelegate:", self);
              -[NSObject setPresentingViewController:](v24, "setPresentingViewController:", v37);
              -[NSObject start](v24, "start");
              v8 = v26;
              v20 = v35;
              v17 = v36;
            }
            else
            {
              HFLogForCategory(0);
              v27 = (HFSymptomFixManagerItem *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(&v27->super, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v46 = v8;
                v47 = 2112;
                v48 = v22;
                _os_log_error_impl(&dword_1DD34E000, &v27->super, OS_LOG_TYPE_ERROR, "Could not create fix session for symptom: %@ accessory: %@", buf, 0x16u);
              }
            }

          }
        }
        v19 = -[HFSymptomFixManagerItem countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
      }
      while (v19);
      v9 = v34;
    }
    goto LABEL_37;
  }
  HFLogForCategory(0);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DD34E000, v11, OS_LOG_TYPE_DEFAULT, "Updating symptom UI for debugging purposes", buf, 2u);
  }

  if (-[HFSymptomFixManagerItem type](v8, "type") == 11)
  {
    objc_opt_class();
    v12 = v9;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
    v14 = v13;

    -[HFSymptomFixManagerItem hf_setFakeWiFiMismatchSymptom:](v14, "hf_setFakeWiFiMismatchSymptom:", 0);
  }
  if (-[HFSymptomFixManagerItem type](v8, "type") == 19)
  {
    objc_opt_class();
    v15 = v9;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;
    v17 = v16;

    -[HFSymptomFixManagerItem hf_setFakeCaptiveLeaseRenewalSymptom:](v17, "hf_setFakeCaptiveLeaseRenewalSymptom:", 0);
LABEL_37:

  }
}

- (id)_itemForSymptom:(id)a3 accessory:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  -[HFSymptomFixManager items](self, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __49__HFSymptomFixManager__itemForSymptom_accessory___block_invoke;
  v13[3] = &unk_1EA731650;
  v14 = v6;
  v15 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "na_firstObjectPassingTest:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t __49__HFSymptomFixManager__itemForSymptom_accessory___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  objc_msgSend(v3, "symptom");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(v3, "accessory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqual:", *(_QWORD *)(a1 + 40));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_itemForFixSession:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[HFSymptomFixManager items](self, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __42__HFSymptomFixManager__itemForFixSession___block_invoke;
  v9[3] = &unk_1EA731628;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __42__HFSymptomFixManager__itemForFixSession___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "fixSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)fixSession:(id)a3 didChangeState:(int64_t)a4
{
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  NSObject *v23;
  const __CFString *v24;
  void *v25;
  uint8_t buf[4];
  NSObject *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  HFLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromHMSymptomFixSessionState(a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v27 = v6;
    v28 = 2112;
    v29 = v8;
    _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "HFSymptomFixManager fixSession:%@ didChangeState:%@", buf, 0x16u);

  }
  -[HFSymptomFixManager _itemForFixSession:](self, "_itemForFixSession:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __49__HFSymptomFixManager_fixSession_didChangeState___block_invoke;
    v22[3] = &unk_1EA731678;
    v11 = v9;
    v23 = v11;
    objc_msgSend(v10, "dispatchSymptomFixSessionObserverMessage:sender:", v22, 0);

    if (a4 == 2)
    {
      HFLogForCategory(0);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v11;
        _os_log_error_impl(&dword_1DD34E000, v12, OS_LOG_TYPE_ERROR, "Now Posting HFSymptomFixManagerEndSessionNotification for item  %@", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = CFSTR("symptomItemIdentifier");
      -[NSObject identifier](v11, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "postNotificationName:object:userInfo:", CFSTR("HFSymptomFixManagerEndSessionNotification"), 0, v15);

      -[HFSymptomFixManager items](self, "items");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "removeObject:", v11);

      -[NSObject error](v6, "error");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        HFLogForCategory(0);
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          -[NSObject error](v6, "error");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v27 = v6;
          v28 = 2112;
          v29 = v21;
          _os_log_error_impl(&dword_1DD34E000, v18, OS_LOG_TYPE_ERROR, "Error with Fix Session: %@ error: %@", buf, 0x16u);

        }
      }
    }
    v19 = v23;
  }
  else
  {
    HFLogForCategory(0);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      -[HFSymptomFixManager items](self, "items");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v27 = v6;
      v28 = 2112;
      v29 = v20;
      _os_log_error_impl(&dword_1DD34E000, v19, OS_LOG_TYPE_ERROR, "HFSymptomFixManager received fix session callback for unknown session %@. All items: %@", buf, 0x16u);

    }
  }

}

void __49__HFSymptomFixManager_fixSession_didChangeState___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "accessory");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fixSessionDidChangeForAccessory:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
}

@end
