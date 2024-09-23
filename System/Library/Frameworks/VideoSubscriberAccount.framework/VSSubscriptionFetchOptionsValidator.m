@implementation VSSubscriptionFetchOptionsValidator

- (id)standardizedFetchOptionsFromOptions:(id)a3 withSecurityTask:(id)a4
{
  id v6;
  id v7;
  id v8;
  unint64_t v9;
  _QWORD *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = 0x1E0C99000uLL;
  v10 = (_QWORD *)MEMORY[0x1E0C99778];
  if (v6)
  {
    if (v7)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The providedOptions parameter must not be nil."));
    if (v8)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *v10, CFSTR("The securityTask parameter must not be nil."));
LABEL_3:
  v57 = (id)objc_msgSend(v6, "mutableCopy");
  v53 = v8;
  -[VSSubscriptionFetchOptionsValidator subscriptionFetchOptionsAllowedForSecurityTask:](self, "subscriptionFetchOptionsAllowedForSecurityTask:", v8);
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "allValues");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v66, v71, 16);
  if (v58)
  {
    v12 = *(_QWORD *)v67;
    v13 = *MEMORY[0x1E0C99778];
    v54 = v11;
    v55 = v6;
    v56 = *(_QWORD *)v67;
    do
    {
      for (i = 0; i != v58; ++i)
      {
        if (*(_QWORD *)v67 != v12)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
        v60 = (void *)MEMORY[0x1D8236758]();
        objc_msgSend(v15, "key");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKey:", v16);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        if (v61)
        {
          v59 = i;
          v17 = objc_msgSend(v15, "allowedClass");
          objc_msgSend(v15, "allowedValuePredicate");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v15, "isContainer"))
          {
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              v19 = objc_msgSend(v61, "count");
              v20 = objc_msgSend(v15, "minCount");
              if (v19 >= v20)
              {
                v64 = 0u;
                v65 = 0u;
                v62 = 0u;
                v63 = 0u;
                v29 = v61;
                v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
                if (v30)
                {
                  v31 = v30;
                  v32 = *(_QWORD *)v63;
                  do
                  {
                    for (j = 0; j != v31; ++j)
                    {
                      if (*(_QWORD *)v63 != v32)
                        objc_enumerationMutation(v29);
                      v34 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * j);
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                      {
                        v35 = (void *)MEMORY[0x1E0C99DA0];
                        v51 = objc_opt_class();
                        v36 = v35;
                        v9 = 0x1E0C99000uLL;
                        objc_msgSend(v36, "raise:format:", v13, CFSTR("Contained value (%@) for option %@ was a %@ instead of some kind of %@"), v34, v16, v51, v17);
                      }
                      if ((objc_msgSend(v18, "evaluateWithObject:", v34) & 1) == 0)
                        objc_msgSend(*(id *)(v9 + 3488), "raise:format:", v13, CFSTR("Contained value (%@) for option %@ not allowed %@"), v34, v16, v18);
                    }
                    v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
                  }
                  while (v31);
                }

                v11 = v54;
                v6 = v55;
              }
              else
              {
                v21 = v20;
                v22 = (void *)MEMORY[0x1E0C99DA0];
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v19);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v21);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v25 = v22;
                v9 = 0x1E0C99000;
                objc_msgSend(v25, "raise:format:", v13, CFSTR("Collection count (%@) for option %@ was less than %@ minimum."), v23, v16, v24);

              }
              v12 = v56;
            }
            else
            {
              objc_msgSend(*(id *)(v9 + 3488), "raise:format:", v13, CFSTR("Cannot enumerates values in %@ for option %@"), v61, v16, v49);
            }
          }
          else
          {
            v26 = v61;
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v27 = *(void **)(v9 + 3488);
              v50 = objc_opt_class();
              v28 = v27;
              v26 = v61;
              objc_msgSend(v28, "raise:format:", v13, CFSTR("Provided value (%@) for option %@ was a %@ instead of some kind of %@"), v61, v16, v50, v17);
            }
            if ((objc_msgSend(v18, "evaluateWithObject:", v26) & 1) == 0)
              objc_msgSend(*(id *)(v9 + 3488), "raise:format:", v13, CFSTR("Provided value (%@) for option %@ not allowed %@"), v26, v16, v18);
          }
          i = v59;
        }
        else
        {
          objc_msgSend(v15, "defaultValue");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
            objc_msgSend(v57, "setObject:forKey:", v18, v16);
        }

        objc_autoreleasePoolPop(v60);
      }
      v58 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v66, v71, 16);
    }
    while (v58);
  }

  v37 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(v52, "allValues");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "valueForKeyPath:", CFSTR("key"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
    objc_msgSend(v37, "addObjectsFromArray:", v39);
  v40 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v57, "allKeys");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setWithArray:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = (void *)objc_msgSend(v42, "mutableCopy");
  objc_msgSend(v43, "minusSet:", v37);
  if (objc_msgSend(v43, "count"))
  {
    v44 = (void *)MEMORY[0x1E0C99DA0];
    v45 = *MEMORY[0x1E0C99778];
    objc_msgSend(v43, "allObjects");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "componentsJoinedByString:", CFSTR(", "));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "raise:format:", v45, CFSTR("Unrecognized options provided: %@"), v47);

  }
  return v57;
}

- (id)subscriptionFetchOptionsAllowedForSecurityTask:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  VSSubscriptionFetchOptionDescription *v10;
  int v11;
  id v12;
  id v13;
  id v14;
  VSSubscriptionFetchOptionDescription *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  id v36;
  id v37;
  id v38;
  void *v39;
  VSSubscriptionFetchOptionsValidator *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  id v45;
  id v46;
  uint8_t buf[8];
  uint64_t v48;
  void (*v49)(uint64_t);
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
  v49 = __VSAllSubscriptionFetchOptions_block_invoke;
  v50 = &unk_1E939F138;
  v48 = 3221225472;
  v51 = &unk_1E93CC750;
  v52 = (void *)MEMORY[0x1E0C9AAB0];
  if (VSAllSubscriptionFetchOptions___vs_lazy_init_predicate == -1)
  {
    v5 = (void *)MEMORY[0x1E0C9AAB0];
    v6 = &unk_1E93CC750;
  }
  else
  {
    dispatch_once(&VSAllSubscriptionFetchOptions___vs_lazy_init_predicate, buf);
    v6 = v51;
    v5 = v52;
  }
  v7 = (id)VSAllSubscriptionFetchOptions___vs_lazy_init_variable;

  v8 = (void *)objc_msgSend(v7, "mutableCopy");
  v9 = v4;
  v10 = objc_alloc_init(VSSubscriptionFetchOptionDescription);
  -[VSSubscriptionFetchOptionDescription setKey:](v10, "setKey:", CFSTR("VSSubscriptionFetchOptionSubscriberIdentifierHashModifier"));
  -[VSSubscriptionFetchOptionDescription setAllowedClass:](v10, "setAllowedClass:", objc_opt_class());
  v46 = 0;
  v45 = 0;
  v11 = objc_msgSend(v9, "getValue:forEntitlement:error:", &v46, CFSTR("com.apple.private.subscriptionservce.subscriber-identifier-hash-modifiers"), &v45);
  v12 = v46;
  v13 = v45;
  if (!v11)
  {
    VSErrorLogObject();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[VSSubscriptionFetchOptionsValidator subscriptionFetchOptionsAllowedForSecurityTask:].cold.1((uint64_t)v13, v24);
    goto LABEL_20;
  }
  if (!v12)
  {
    VSDefaultLogObject();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D2419000, v24, OS_LOG_TYPE_DEFAULT, "No allowed hash modifiers.", buf, 2u);
    }
LABEL_20:

    v10 = 0;
    goto LABEL_21;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = v12;
    if (objc_msgSend(v14, "count"))
    {
      v37 = v12;
      v38 = v9;
      v39 = v8;
      v40 = self;
      v15 = (VSSubscriptionFetchOptionDescription *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v41 = 0u;
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      v36 = v14;
      v16 = v14;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v41, buf, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v42;
        v20 = *MEMORY[0x1E0C99778];
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v42 != v19)
              objc_enumerationMutation(v16);
            v22 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              -[VSSubscriptionFetchOptionDescription addObject:](v15, "addObject:", v22);
            else
              objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v20, CFSTR("Value (%@) in %@ entitlement array is not a string."), v22, CFSTR("com.apple.private.subscriptionservce.subscriber-identifier-hash-modifiers"));
          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v41, buf, 16);
        }
        while (v18);
      }

      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self in %@"), v15);
      v23 = objc_claimAutoreleasedReturnValue();
      -[VSSubscriptionFetchOptionDescription setAllowedValuePredicate:](v10, "setAllowedValuePredicate:", v23);
      v8 = v39;
      self = v40;
      v9 = v38;
      v12 = v37;
      v14 = v36;
    }
    else
    {
      VSDefaultLogObject();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D2419000, v23, OS_LOG_TYPE_DEFAULT, "Allowed hash modifiers array is empty.", buf, 2u);
      }
      v15 = v10;
      v10 = 0;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Value for %@ entitlement is not an array."), CFSTR("com.apple.private.subscriptionservce.subscriber-identifier-hash-modifiers"));
  }
LABEL_21:

  if (v10)
    objc_msgSend(v8, "setObject:forKey:", v10, CFSTR("VSSubscriptionFetchOptionSubscriberIdentifierHashModifier"));
  objc_msgSend(v8, "objectForKey:", CFSTR("VSSubscriptionFetchOptionSources"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v25, "copy");

  if (v26)
  {
    v27 = v26;
    -[VSSubscriptionFetchOptionsValidator predicateFactory](self, "predicateFactory");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "allowedSubscriptionSourcesPredicateForRequestKind:fromTask:", 0, v9);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "setAllowedValuePredicate:", v29);
    objc_msgSend(v8, "setObject:forKey:", v27, CFSTR("VSSubscriptionFetchOptionSources"));

  }
  objc_msgSend(v8, "objectForKey:", CFSTR("VSSubscriptionFetchOptionSourceKind"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v30, "copy");

  if (v31)
  {
    v32 = v31;
    -[VSSubscriptionFetchOptionsValidator predicateFactory](self, "predicateFactory");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "allowedSubscriptionSourceKindsPredicateForRequestKind:fromTask:", 0, v9);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v32, "setAllowedValuePredicate:", v34);
    objc_msgSend(v8, "setObject:forKey:", v32, CFSTR("VSSubscriptionFetchOptionSourceKind"));

  }
  return v8;
}

- (VSSubscriptionPredicateFactory)predicateFactory
{
  VSSubscriptionFetchOptionsValidator *v2;
  VSSubscriptionPredicateFactory *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_predicateFactory;
  if (!v3)
  {
    v3 = objc_alloc_init(VSSubscriptionPredicateFactory);
    objc_storeStrong((id *)&v2->_predicateFactory, v3);
  }
  objc_sync_exit(v2);

  if (!v3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The __orNil parameter must not be nil."));
  return v3;
}

- (void)setPredicateFactory:(id)a3
{
  objc_storeStrong((id *)&self->_predicateFactory, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predicateFactory, 0);
}

- (void)subscriptionFetchOptionsAllowedForSecurityTask:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1D2419000, a2, OS_LOG_TYPE_ERROR, "Unable to obtain value for hash modifiers entitlement: %@", (uint8_t *)&v2, 0xCu);
}

@end
