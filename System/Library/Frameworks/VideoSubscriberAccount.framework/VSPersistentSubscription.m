@implementation VSPersistentSubscription

- (void)_setNullResettableValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    v9 = 0;
    -[VSPersistentSubscription validateValue:forKey:error:](self, "validateValue:forKey:error:", &v9, v7, 0);
    v6 = v9;
  }
  -[VSPersistentSubscription willChangeValueForKey:](self, "willChangeValueForKey:", v7);
  v8 = (void *)objc_msgSend(v6, "copy");
  -[VSPersistentSubscription setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v8, v7);

  -[VSPersistentSubscription didChangeValueForKey:](self, "didChangeValueForKey:", v7);
}

- (BOOL)_validateNullableValue:(id *)a3 forKey:(id)a4 error:(id *)a5
{
  id v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v8 = a4;
  if (!*a3)
  {
    -[VSPersistentSubscription entity](self, "entity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "attributesByName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v12, "isOptional") & 1) != 0)
    {
      v9 = 1;
    }
    else
    {
      objc_msgSend(v12, "defaultValue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v14 = objc_retainAutorelease(v13);
        *a3 = v14;
        v9 = 1;
      }
      else
      {
        if (!a5)
        {
          v9 = 0;
          goto LABEL_10;
        }
        v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(v14, "setObject:forKey:", self, *MEMORY[0x1E0C97A30]);
        objc_msgSend(v14, "setObject:forKey:", v8, *MEMORY[0x1E0C97A28]);
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 1570, v14);
        v9 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }

    }
LABEL_10:

    goto LABEL_11;
  }
  v9 = 1;
LABEL_11:

  return v9;
}

+ (id)keyPathsForValuesAffectingDerivedSubscriptionInfo
{
  if (keyPathsForValuesAffectingDerivedSubscriptionInfo___vs_lazy_init_predicate != -1)
    dispatch_once(&keyPathsForValuesAffectingDerivedSubscriptionInfo___vs_lazy_init_predicate, &__block_literal_global_4);
  return (id)keyPathsForValuesAffectingDerivedSubscriptionInfo___vs_lazy_init_variable;
}

void __77__VSPersistentSubscription_keyPathsForValuesAffectingDerivedSubscriptionInfo__block_invoke()
{
  uint64_t v0;
  void *v1;

  __77__VSPersistentSubscription_keyPathsForValuesAffectingDerivedSubscriptionInfo__block_invoke_2();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathsForValuesAffectingDerivedSubscriptionInfo___vs_lazy_init_variable;
  keyPathsForValuesAffectingDerivedSubscriptionInfo___vs_lazy_init_variable = v0;

}

id __77__VSPersistentSubscription_keyPathsForValuesAffectingDerivedSubscriptionInfo__block_invoke_2()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(v0, "addObject:", CFSTR("accessLevel"));
  objc_msgSend(v0, "addObject:", CFSTR("tierIdentifiers"));
  objc_msgSend(v0, "addObject:", CFSTR("subscriberIdentifierHash"));
  objc_msgSend(v0, "addObject:", CFSTR("billingIdentifier"));
  objc_msgSend(v0, "addObject:", CFSTR("providedSubscriptionInfo"));
  v1 = (void *)objc_msgSend(v0, "copy");

  return v1;
}

- (void)_updateDerivedSubscriptionInfo
{
  OUTLINED_FUNCTION_2(&dword_1D2419000, a2, a3, "Unable to serialize to JSON: %@", a5, a6, a7, a8, 2u);
}

void __58__VSPersistentSubscription__updateDerivedSubscriptionInfo__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  v14 = a2;
  v5 = a3;
  v6 = (void *)MEMORY[0x1D8236758]();
  objc_msgSend(v5, "vs_JSONKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
    objc_msgSend(*(id *)(a1 + 32), "valueForKey:", v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "vs_JSONValueTransformer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "transformedValue:", v10);
      v13 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v13;
    }
    if (v10)
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v10, v9);

  }
  objc_autoreleasePoolPop(v6);

}

- (void)_deriveValuesFromProvidedInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  objc_class *v12;
  void *v13;
  NSObject *v14;
  id v15;
  void *v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  _QWORD v40[5];
  _QWORD v41[4];
  NSObject *v42;
  id v43;
  id v44;

  v4 = a3;
  v5 = (void *)MEMORY[0x1D8236758]();
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(v4, "dataUsingEncoding:", 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v44 = 0;
      objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v6, 0, &v44);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v44;
      if (v7)
      {
        v9 = v7;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v10 = (void *)MEMORY[0x1E0C99DA0];
            v11 = *MEMORY[0x1E0C99778];
            v12 = (objc_class *)objc_opt_class();
            NSStringFromClass(v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "raise:format:", v11, CFSTR("Unexpectedly, topLevelJSONValue was %@, instead of NSDictionary."), v13);

          }
          v14 = v9;
          v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          -[VSPersistentSubscription entity](self, "entity");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "attributesByName");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v41[0] = MEMORY[0x1E0C809B0];
          v41[1] = 3221225472;
          v41[2] = __58__VSPersistentSubscription__deriveValuesFromProvidedInfo___block_invoke;
          v41[3] = &unk_1E939F248;
          v17 = v14;
          v42 = v17;
          v18 = v15;
          v43 = v18;
          objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v41);

          if (objc_msgSend(v18, "count"))
          {
            v40[0] = MEMORY[0x1E0C809B0];
            v40[1] = 3221225472;
            v40[2] = __58__VSPersistentSubscription__deriveValuesFromProvidedInfo___block_invoke_38;
            v40[3] = &unk_1E939F270;
            v40[4] = self;
            objc_msgSend(v18, "enumerateKeysAndObjectsUsingBlock:", v40);
          }

        }
        else
        {
          VSErrorLogObject();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            -[VSPersistentSubscription _deriveValuesFromProvidedInfo:].cold.3(v17, v32, v33, v34, v35, v36, v37, v38);
        }

      }
      else
      {
        VSErrorLogObject();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          -[VSPersistentSubscription _deriveValuesFromProvidedInfo:].cold.2((uint64_t)v8, v9, v26, v27, v28, v29, v30, v31);
      }

    }
    else
    {
      VSErrorLogObject();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[VSPersistentSubscription _deriveValuesFromProvidedInfo:].cold.1(v8, v19, v20, v21, v22, v23, v24, v25);
    }

  }
  objc_autoreleasePoolPop(v5);

}

void __58__VSPersistentSubscription__deriveValuesFromProvidedInfo___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  char isKindOfClass;
  char v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  objc_class *aClass;
  _BYTE *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t buf[4];
  id v56;
  __int16 v57;
  id v58;
  __int16 v59;
  void *v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = (void *)MEMORY[0x1D8236758]();
  objc_msgSend(v8, "vs_JSONKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v50 = a4;
    v12 = v10;
    VSDefaultLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v56 = v12;
      _os_log_impl(&dword_1D2419000, v13, OS_LOG_TYPE_DEFAULT, "Examining %@ JSON key.", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "valueForKey:", v12);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "vs_expectedJSONValueClasses");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");
    if (!v16)
    {
      VSErrorLogObject();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        __58__VSPersistentSubscription__deriveValuesFromProvidedInfo___block_invoke_cold_1(v32, v33, v34, v35, v36, v37, v38, v39);

      goto LABEL_39;
    }
    v17 = v16;
    aClass = (objc_class *)objc_msgSend(v15, "objectAtIndex:", 0);
    isKindOfClass = objc_opt_isKindOfClass();
    v19 = isKindOfClass;
    if (v17 == 2
      && (isKindOfClass & 1) != 0
      && -[objc_class isEqual:](aClass, "isEqual:", objc_opt_class()))
    {
      v46 = v12;
      v47 = v9;
      v48 = v7;
      v45 = v15;
      v20 = (void *)objc_msgSend(v15, "objectAtIndex:", 1);
      v51 = 0u;
      v52 = 0u;
      v53 = 0u;
      v54 = 0u;
      v21 = v14;
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v52;
        while (2)
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v52 != v24)
              objc_enumerationMutation(v21);
            v26 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
            if ((objc_opt_isKindOfClass() & 1) == 0
              || objc_msgSend(v20, "isEqual:", objc_opt_class()) && !objc_msgSend(v26, "length"))
            {

              v9 = v47;
              v7 = v48;
              v12 = v46;
              v15 = v45;
              goto LABEL_32;
            }
          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
          if (v23)
            continue;
          break;
        }
      }

      v9 = v47;
      v7 = v48;
      v12 = v46;
      v15 = v45;
    }
    else if ((v19 & 1) == 0)
    {
LABEL_32:
      if (objc_msgSend(v8, "vs_isRequiredJSONValue"))
      {
        VSErrorLogObject();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          NSStringFromClass(aClass);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v56 = v14;
          v57 = 2112;
          v58 = v8;
          v59 = 2112;
          v60 = v44;
          _os_log_error_impl(&dword_1D2419000, v40, OS_LOG_TYPE_ERROR, "Value %@ for required attribute %@ was not expected class %@.", buf, 0x20u);

        }
        objc_msgSend(*(id *)(a1 + 40), "removeAllObjects");
        *v50 = 1;
      }
      else
      {
        VSDefaultLogObject();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v56 = v7;
          _os_log_impl(&dword_1D2419000, v41, OS_LOG_TYPE_DEFAULT, "Overwriting omitted value for %@ key.", buf, 0xCu);
        }

        v42 = *(void **)(a1 + 40);
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setObject:forKey:", v43, v7);

      }
      goto LABEL_39;
    }
    v27 = v15;
    objc_msgSend(v8, "vs_JSONValueTransformer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (v28)
    {
      objc_msgSend(v28, "reverseTransformedValue:", v14);
      v30 = objc_claimAutoreleasedReturnValue();

      v14 = (id)v30;
    }
    if (!v14)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      if (!v14)
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The valueOrNil parameter must not be nil."));
    }
    v14 = v14;
    VSDefaultLogObject();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v56 = v14;
      v57 = 2112;
      v58 = v7;
      _os_log_impl(&dword_1D2419000, v31, OS_LOG_TYPE_DEFAULT, "Got value %@ for %@ key.", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v14, v7);
    v15 = v27;
LABEL_39:

  }
  objc_autoreleasePoolPop(v9);

}

void __58__VSPersistentSubscription__deriveValuesFromProvidedInfo___block_invoke_38(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  int v8;
  id v9;
  id v10;

  v10 = a3;
  v5 = (void *)MEMORY[0x1E0C99E38];
  v6 = a2;
  objc_msgSend(v5, "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v10, "isEqual:", v7);

  if (v8)
    v9 = 0;
  else
    v9 = v10;
  objc_msgSend(*(id *)(a1 + 32), "_setNullResettableValue:forKey:", v9, v6);

}

- (void)setProvidedSubscriptionInfo:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[VSPersistentSubscription willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("providedSubscriptionInfo"));
  v5 = (void *)objc_msgSend(v4, "copy");

  -[VSPersistentSubscription _deriveValuesFromProvidedInfo:](self, "_deriveValuesFromProvidedInfo:", v5);
  VSDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_1D2419000, v6, OS_LOG_TYPE_DEFAULT, "Will set primitive value: %@", (uint8_t *)&v7, 0xCu);
  }

  -[VSPersistentSubscription setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v5, CFSTR("providedSubscriptionInfo"));
  -[VSPersistentSubscription didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("providedSubscriptionInfo"));

}

- (void)setAccessLevel:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[VSPersistentSubscription providedSubscriptionInfo](self, "providedSubscriptionInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    VSDefaultLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v4;
      _os_log_impl(&dword_1D2419000, v7, OS_LOG_TYPE_DEFAULT, "Ignoring access level %@ because of subscription info.", (uint8_t *)&v8, 0xCu);
    }

  }
  else
  {
    -[VSPersistentSubscription _setNullResettableValue:forKey:](self, "_setNullResettableValue:forKey:", v4, CFSTR("accessLevel"));
  }

}

- (void)setCreationDate:(id)a3
{
  -[VSPersistentSubscription _setNullResettableValue:forKey:](self, "_setNullResettableValue:forKey:", a3, CFSTR("creationDate"));
}

- (void)setExpirationDate:(id)a3
{
  -[VSPersistentSubscription _setNullResettableValue:forKey:](self, "_setNullResettableValue:forKey:", a3, CFSTR("expirationDate"));
}

- (void)setMostRecentSaveDate:(id)a3
{
  -[VSPersistentSubscription _setNullResettableValue:forKey:](self, "_setNullResettableValue:forKey:", a3, CFSTR("mostRecentSaveDate"));
}

- (void)setSubscriberIdentifierHash:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[VSPersistentSubscription providedSubscriptionInfo](self, "providedSubscriptionInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    VSDefaultLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v4;
      _os_log_impl(&dword_1D2419000, v7, OS_LOG_TYPE_DEFAULT, "Ignoring subscriber identifier hash %@ because of subscription info.", (uint8_t *)&v8, 0xCu);
    }

  }
  else
  {
    -[VSPersistentSubscription _setNullResettableValue:forKey:](self, "_setNullResettableValue:forKey:", v4, CFSTR("subscriberIdentifierHash"));
  }

}

- (void)setBillingIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[VSPersistentSubscription providedSubscriptionInfo](self, "providedSubscriptionInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    VSDefaultLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v4;
      _os_log_impl(&dword_1D2419000, v7, OS_LOG_TYPE_DEFAULT, "Ignoring billing identifier %@ because of subscription info.", (uint8_t *)&v8, 0xCu);
    }

  }
  else
  {
    -[VSPersistentSubscription _setNullResettableValue:forKey:](self, "_setNullResettableValue:forKey:", v4, CFSTR("billingIdentifier"));
  }

}

- (void)setTierIdentifiers:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[VSPersistentSubscription providedSubscriptionInfo](self, "providedSubscriptionInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    VSDefaultLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v4;
      _os_log_impl(&dword_1D2419000, v7, OS_LOG_TYPE_DEFAULT, "Ignoring tier identifiers %@ because of subscription info.", (uint8_t *)&v8, 0xCu);
    }

  }
  else
  {
    -[VSPersistentSubscription _setNullResettableValue:forKey:](self, "_setNullResettableValue:forKey:", v4, CFSTR("tierIdentifiers"));
  }

}

- (void)awakeFromInsert
{
  NSObject *v3;
  uint8_t v4[16];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VSPersistentSubscription;
  -[VSPersistentSubscription awakeFromInsert](&v5, sel_awakeFromInsert);
  VSDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D2419000, v3, OS_LOG_TYPE_DEFAULT, "Awake from insert.", v4, 2u);
  }

  -[VSPersistentSubscription setAccessLevel:](self, "setAccessLevel:", 0);
  -[VSPersistentSubscription setCreationDate:](self, "setCreationDate:", 0);
  -[VSPersistentSubscription setExpirationDate:](self, "setExpirationDate:", 0);
  -[VSPersistentSubscription setTierIdentifiers:](self, "setTierIdentifiers:", 0);
  -[VSPersistentSubscription setSubscriberIdentifierHash:](self, "setSubscriberIdentifierHash:", 0);
  -[VSPersistentSubscription setBillingIdentifier:](self, "setBillingIdentifier:", 0);
}

- (void)awakeFromFetch
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VSPersistentSubscription;
  -[VSPersistentSubscription awakeFromFetch](&v6, sel_awakeFromFetch);
  VSDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D2419000, v3, OS_LOG_TYPE_DEFAULT, "Awake from fetch.", v5, 2u);
  }

  -[VSPersistentSubscription _updateDerivedSubscriptionInfo](self, "_updateDerivedSubscriptionInfo");
  -[VSPersistentSubscription providedSubscriptionInfo](self, "providedSubscriptionInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSPersistentSubscription _deriveValuesFromProvidedInfo:](self, "_deriveValuesFromProvidedInfo:", v4);

}

- (void)didChangeValueForKey:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  objc_super v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VSPersistentSubscription;
  -[VSPersistentSubscription didChangeValueForKey:](&v9, sel_didChangeValueForKey_, v4);
  objc_msgSend((id)objc_opt_class(), "keyPathsForValuesAffectingDerivedSubscriptionInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if (v6)
  {
    VSDefaultLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[VSPersistentSubscription valueForKey:](self, "valueForKey:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v11 = v4;
      v12 = 2112;
      v13 = v8;
      _os_log_impl(&dword_1D2419000, v7, OS_LOG_TYPE_DEFAULT, "Did change value for %@ key to %@, triggering derivation.", buf, 0x16u);

    }
    -[VSPersistentSubscription _updateDerivedSubscriptionInfo](self, "_updateDerivedSubscriptionInfo");
  }

}

- (BOOL)validateAccessLevel:(id *)a3 error:(id *)a4
{
  return -[VSPersistentSubscription _validateNullableValue:forKey:error:](self, "_validateNullableValue:forKey:error:", a3, CFSTR("accessLevel"), a4);
}

- (BOOL)validateCreationDate:(id *)a3 error:(id *)a4
{
  void *v5;
  id v6;
  id v7;

  if (!*a3)
  {
    v5 = (void *)MEMORY[0x1E0C99D68];
    v6 = 0;
    objc_msgSend(v5, "vs_currentDate");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    *a3 = v7;
  }
  return 1;
}

- (BOOL)validateModificationDate:(id *)a3 error:(id *)a4
{
  void *v5;
  id v6;
  id v7;

  if (!*a3)
  {
    v5 = (void *)MEMORY[0x1E0C99D68];
    v6 = 0;
    objc_msgSend(v5, "vs_currentDate");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    *a3 = v7;
  }
  return 1;
}

- (BOOL)validateExpirationDate:(id *)a3 error:(id *)a4
{
  return -[VSPersistentSubscription _validateNullableValue:forKey:error:](self, "_validateNullableValue:forKey:error:", a3, CFSTR("expirationDate"), a4);
}

- (BOOL)validateSubscriberIdentifierHash:(id *)a3 error:(id *)a4
{
  return -[VSPersistentSubscription _validateNullableValue:forKey:error:](self, "_validateNullableValue:forKey:error:", a3, CFSTR("subscriberIdentifierHash"), a4);
}

- (BOOL)validateTierIdentifiers:(id *)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  BOOL v10;

  v7 = *a3;
  if (v7)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v7);
    objc_msgSend(v8, "allObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "sortedArrayUsingSelector:", sel_compare_);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    v10 = 1;
  }
  else
  {
    v10 = -[VSPersistentSubscription _validateNullableValue:forKey:error:](self, "_validateNullableValue:forKey:error:", a3, CFSTR("tierIdentifiers"), a4);
  }

  return v10;
}

- (BOOL)validateBillingIdentifier:(id *)a3 error:(id *)a4
{
  return -[VSPersistentSubscription _validateNullableValue:forKey:error:](self, "_validateNullableValue:forKey:error:", a3, CFSTR("billingIdentifier"), a4);
}

- (void)_deriveValuesFromProvidedInfo:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D2419000, a1, a3, "Unable to serialize string to UTF-8.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

- (void)_deriveValuesFromProvidedInfo:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1D2419000, a2, a3, "Error deserializing subscription info: %@", a5, a6, a7, a8, 2u);
}

- (void)_deriveValuesFromProvidedInfo:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D2419000, a1, a3, "Top-level JSON value is not a dictionary.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

void __58__VSPersistentSubscription__deriveValuesFromProvidedInfo___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D2419000, a1, a3, "No expected classes.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

@end
