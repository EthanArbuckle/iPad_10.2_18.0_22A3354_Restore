@implementation INCIntentDefaultValueProvider

- (INCIntentDefaultValueProvider)initWithIntent:(id)a3
{
  id v4;
  INCIntentDefaultValueProvider *v5;
  uint64_t v6;
  INIntent *intent;
  NSObject *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *completionHandlingQueue;
  INCIntentDefaultValueProvider *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)INCIntentDefaultValueProvider;
  v5 = -[INCIntentDefaultValueProvider init](&v14, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    intent = v5->_intent;
    v5->_intent = (INIntent *)v6;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_DEFAULT, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.Intents.IntentDefaultValueProvider.Completion", v9);
    completionHandlingQueue = v5->_completionHandlingQueue;
    v5->_completionHandlingQueue = (OS_dispatch_queue *)v10;

    v12 = v5;
  }

  return v5;
}

- (void)loadDefaultValuesWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  INCExtensionConnection *v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[5];
  id v27;
  _QWORD *v28;
  id v29;
  id location;
  _QWORD v31[3];
  char v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  const __CFString *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[INCIntentDefaultValueProvider intent](self, "intent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[INCIntentDefaultValueProvider intent](self, "intent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_codableDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayOrderedAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v34;
    while (2)
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v34 != v12)
          objc_enumerationMutation(v10);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v13), "supportsDynamicEnumeration") & 1) != 0)
        {

          if (MKBDeviceUnlockedSinceBoot())
          {
            v14 = -[INCExtensionConnection initWithIntent:]([INCExtensionConnection alloc], "initWithIntent:", v5);
            -[INCExtensionConnection setRequiresTCC:](v14, "setRequiresTCC:", 0);
            v31[0] = 0;
            v31[1] = v31;
            v31[2] = 0x2020000000;
            v32 = 0;
            objc_initWeak(&location, v14);
            v15 = MEMORY[0x1E0C809B0];
            v26[0] = MEMORY[0x1E0C809B0];
            v26[1] = 3221225472;
            v26[2] = __72__INCIntentDefaultValueProvider_loadDefaultValuesWithCompletionHandler___block_invoke;
            v26[3] = &unk_1E6BC45F0;
            v26[4] = self;
            objc_copyWeak(&v29, &location);
            v28 = v31;
            v27 = v4;
            v24[0] = v15;
            v24[1] = 3221225472;
            v24[2] = __72__INCIntentDefaultValueProvider_loadDefaultValuesWithCompletionHandler___block_invoke_3;
            v24[3] = &unk_1E6BC4618;
            v16 = (id)MEMORY[0x1BCCA5FB8](v26);
            v25 = v16;
            -[INCExtensionConnection setInterruptionHandler:](v14, "setInterruptionHandler:", v24);
            v21[0] = v15;
            v21[1] = 3221225472;
            v21[2] = __72__INCIntentDefaultValueProvider_loadDefaultValuesWithCompletionHandler___block_invoke_4;
            v21[3] = &unk_1E6BC4640;
            v17 = v16;
            v23 = v17;
            v21[4] = self;
            v22 = v10;
            -[INCExtensionConnection resumeWithCompletionHandler:](v14, "resumeWithCompletionHandler:", v21);

            objc_destroyWeak(&v29);
            objc_destroyWeak(&location);
            _Block_object_dispose(v31, 8);

          }
          else
          {
            v18 = (void *)MEMORY[0x1E0CB35C8];
            v37 = *MEMORY[0x1E0CB2D50];
            v38 = CFSTR("Loading default values from an intent handler requires that the device be unlocked at least once");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("INCExtensionErrorDomain"), 1310, v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v20);

          }
          goto LABEL_13;
        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
      if (v11)
        continue;
      break;
    }
  }

  -[INCIntentDefaultValueProvider loadDefaultValuesWithAttributes:extensionProxy:completionHandler:](self, "loadDefaultValuesWithAttributes:extensionProxy:completionHandler:", v10, 0, v4);
LABEL_13:

}

- (void)loadDefaultValuesWithAttributes:(id)a3 extensionProxy:(id)a4 completionHandler:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  id v30;
  id v31;
  id v32;
  INCIntentDefaultValueProvider *v33;
  id v34;
  id obj;
  NSObject *group;
  _QWORD block[4];
  id v38;
  id v39;
  _QWORD *v40;
  _QWORD v41[5];
  NSObject *v42;
  id v43;
  void *v44;
  _QWORD *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD v50[5];
  id v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v34 = a4;
  v32 = a5;
  v33 = self;
  -[INCIntentDefaultValueProvider intent](self, "intent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  group = dispatch_group_create();
  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x3032000000;
  v50[3] = __Block_byref_object_copy__611;
  v50[4] = __Block_byref_object_dispose__612;
  v51 = 0;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = v8;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v47 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        objc_msgSend(v13, "relationship");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "parentCodableAttribute");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
          goto LABEL_27;
        objc_msgSend(v13, "relationship");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "relation") == 0;

        if (v17)
          goto LABEL_27;
        objc_msgSend(v15, "propertyName");
        v18 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "valueForKey:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "relationship");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v18) = objc_msgSend(v20, "compareValue:", v19);

        if ((v18 & 1) != 0)
        {
LABEL_27:
          if (objc_msgSend(v13, "supportsDynamicEnumeration"))
          {
            dispatch_group_enter(group);
            objc_msgSend(v13, "propertyName");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v41[0] = MEMORY[0x1E0C809B0];
            v41[1] = 3221225472;
            v41[2] = __98__INCIntentDefaultValueProvider_loadDefaultValuesWithAttributes_extensionProxy_completionHandler___block_invoke;
            v41[3] = &unk_1E6BC4668;
            v41[4] = v33;
            v45 = v50;
            v42 = group;
            v43 = v9;
            v44 = v13;
            objc_msgSend(v34, "getDefaultValueForParameterNamed:completionHandler:", v21, v41);

          }
          else
          {
            objc_msgSend(v13, "metadata");
            v22 = (id)objc_claimAutoreleasedReturnValue();
            v23 = v22;
            if (v22)
            {
              if (objc_msgSend(v22, "conformsToProtocol:", &unk_1EF163FE8))
                v24 = v23;
              else
                v24 = 0;
            }
            else
            {
              v24 = 0;
            }
            v25 = v24;

            objc_msgSend(v25, "defaultValueForIntentDefaultValueProvider");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            if (v26)
            {
              if (!objc_msgSend(v13, "modifier"))
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v26);
                  v27 = objc_claimAutoreleasedReturnValue();

                  v26 = (void *)v27;
                }
              }
              objc_msgSend(v13, "propertyName");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "setValue:forKey:", v26, v28);

            }
          }
        }

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
    }
    while (v10);
  }

  dispatch_get_global_queue(0, 0);
  v29 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __98__INCIntentDefaultValueProvider_loadDefaultValuesWithAttributes_extensionProxy_completionHandler___block_invoke_2;
  block[3] = &unk_1E6BC4690;
  v39 = v32;
  v40 = v50;
  v38 = v9;
  v30 = v9;
  v31 = v32;
  dispatch_group_notify(group, v29, block);

  _Block_object_dispose(v50, 8);
}

- (BOOL)isExpectedDefaultValueError:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CBDD70]))
    v5 = objc_msgSend(v3, "code") == 1003;
  else
    v5 = 0;

  return v5;
}

- (INIntent)intent
{
  return self->_intent;
}

- (OS_dispatch_queue)completionHandlingQueue
{
  return self->_completionHandlingQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionHandlingQueue, 0);
  objc_storeStrong((id *)&self->_intent, 0);
}

void __98__INCIntentDefaultValueProvider_loadDefaultValuesWithAttributes_extensionProxy_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (v5 && (objc_msgSend(*(id *)(a1 + 32), "isExpectedDefaultValueError:", v5) & 1) == 0)
  {
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v9 = v5;
    v7 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v9;
    goto LABEL_6;
  }
  if (v10)
  {
    v6 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 56), "propertyName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forKey:", v10, v7);
LABEL_6:

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

uint64_t __98__INCIntentDefaultValueProvider_loadDefaultValuesWithAttributes_extensionProxy_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v3 = a1 + 40;
  v2 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 8) + 8) + 40))
    return (*(uint64_t (**)(uint64_t, _QWORD))(v2 + 16))(v2, 0);
  else
    return (*(uint64_t (**)(uint64_t, _QWORD))(v2 + 16))(v2, *(_QWORD *)(a1 + 32));
}

void __72__INCIntentDefaultValueProvider_loadDefaultValuesWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  __int128 v11;
  _QWORD block[4];
  id v13;
  id v14;
  __int128 v15;
  id v16;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "completionHandlingQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__INCIntentDefaultValueProvider_loadDefaultValuesWithCompletionHandler___block_invoke_2;
  block[3] = &unk_1E6BC45C8;
  objc_copyWeak(&v16, (id *)(a1 + 56));
  v11 = *(_OWORD *)(a1 + 40);
  v8 = (id)v11;
  v15 = v11;
  v13 = v5;
  v14 = v6;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, block);

  objc_destroyWeak(&v16);
}

uint64_t __72__INCIntentDefaultValueProvider_loadDefaultValuesWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __72__INCIntentDefaultValueProvider_loadDefaultValuesWithCompletionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __72__INCIntentDefaultValueProvider_loadDefaultValuesWithCompletionHandler___block_invoke_5;
    v5[3] = &unk_1E6BC4B80;
    v6 = *(id *)(a1 + 48);
    objc_msgSend(v3, "loadDefaultValuesWithAttributes:extensionProxy:completionHandler:", v4, a2, v5);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

uint64_t __72__INCIntentDefaultValueProvider_loadDefaultValuesWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __72__INCIntentDefaultValueProvider_loadDefaultValuesWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  BOOL v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    v3 = 1;
  else
    v3 = WeakRetained == 0;
  if (!v3)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "reset");
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    WeakRetained = v4;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }

}

@end
