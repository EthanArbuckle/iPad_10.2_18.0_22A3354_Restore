@implementation INIntentResponse

+ (void)initialize
{
  if ((id)objc_opt_class() == a1 && INLogInitIfNeeded_once != -1)
    dispatch_once(&INLogInitIfNeeded_once, &__block_literal_global_66271);
}

- (void)_injectProxiesForImages:(id)a3 completion:(id)a4
{
  INImageProxyInjectionUtilitiesInjectProxiesIntoSlotComposer(self, a3, a4);
}

- (id)intentSlotDescriptions
{
  objc_class *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (objc_class *)objc_opt_class();
  INIntentSchemaGetIntentResponseDescriptionWithFacadeClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "slotsByName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)localizeValueOfSlotDescription:(id)a3 withLocalizer:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "facadePropertyName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponse valueForKey:](self, "valueForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizeValue:withLocalizer:", v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (int64_t)_intents_toggleState
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[INIntentResponse _instanceDescription](self, "_instanceDescription", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "slotsByName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v8);
        -[INIntentResponse _instanceDescription](self, "_instanceDescription");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "slotsByName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v12, "valueType") == 204)
        {
          -[INIntentResponse valueForKey:](self, "valueForKey:", v9);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v14, "integerValue");

          goto LABEL_11;
        }

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v6)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (id)_originatingBundleIdentifier
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[INIntentResponse _payloadResponseTypeName](self, "_payloadResponseTypeName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("sirikit.intents.custom."));

  if (v4)
  {
    -[INIntentResponse _payloadResponseTypeName](self, "_payloadResponseTypeName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "substringFromIndex:", objc_msgSend(CFSTR("sirikit.intents.custom."), "length"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("."));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "subarrayWithRange:", 0, objc_msgSend(v7, "count") - 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "componentsJoinedByString:", CFSTR("."));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (BOOL)_isSuccess
{
  return -[INIntentResponse _intentResponseCode](self, "_intentResponseCode") != 5
      && -[INIntentResponse _intentResponseCode](self, "_intentResponseCode") != 6;
}

- (id)_responseTemplateForLanguage:(id)a3
{
  void *v4;
  void *v5;

  +[INStringLocalizer localizerForLanguage:](INStringLocalizer, "localizerForLanguage:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponse _responseTemplateWithLocalizer:](self, "_responseTemplateWithLocalizer:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_responseTemplateForLanguage:(id)a3 requiresSiriCompatibility:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;

  v4 = a4;
  +[INStringLocalizer localizerForLanguage:](INStringLocalizer, "localizerForLanguage:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponse _responseTemplateWithLocalizer:requiresSiriCompatibility:](self, "_responseTemplateWithLocalizer:requiresSiriCompatibility:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_responseTemplateWithLocalizer:(id)a3
{
  return -[INIntentResponse _responseTemplateWithLocalizer:requiresSiriCompatibility:](self, "_responseTemplateWithLocalizer:requiresSiriCompatibility:", a3, 0);
}

- (id)_responseTemplateWithLocalizer:(id)a3 requiresSiriCompatibility:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  __CFBundle *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;
  void *v36;
  void *v37;
  void *v38;

  v4 = a4;
  v6 = a3;
  if (-[INIntentResponse _type](self, "_type") == 2)
  {
    -[INIntentResponse _intentResponseCodableCode](self, "_intentResponseCodableCode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[INIntentResponse _originatingBundleIdentifier](self, "_originatingBundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (__CFBundle *)objc_msgSend(v6, "bundleWithIdentifier:fileURL:", v9, 0);

    if (!v10)
    {
      v11 = _INVCIntentDefinitionManagerClass();
      -[INIntentResponse _originatingBundleIdentifier](self, "_originatingBundleIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "intentDefinitionURLsForBundleID:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "URLByDeletingLastPathComponent");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      -[INIntentResponse _originatingBundleIdentifier](self, "_originatingBundleIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (__CFBundle *)objc_msgSend(v6, "bundleWithIdentifier:fileURL:", v16, v15);

      if (!v10)
        goto LABEL_26;
    }
    if (!v4 || objc_msgSend(v6, "matchesBundleLocalizations:", v10))
    {
      objc_msgSend(v7, "conciseFormatStringLocID");
      v17 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "formatStringLocID");
      v18 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "conciseFormatString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "formatString");
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)v20;
      v35 = (void *)v18;
      v36 = (void *)v17;
      if (v18)
        v22 = (void *)v18;
      else
        v22 = (void *)v17;
      if (v17)
        v23 = (void *)v17;
      else
        v23 = (void *)v18;
      if (v20)
        v24 = (void *)v20;
      else
        v24 = v19;
      if (v19)
        v25 = v19;
      else
        v25 = (void *)v20;
      v38 = v6;
      if (v4)
        v26 = v22;
      else
        v26 = v23;
      if (v4)
        v27 = v24;
      else
        v27 = v25;
      v28 = v27;
      v29 = v26;
      objc_msgSend(v8, "_objectDescription");
      v37 = v7;
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "_localizationTable");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "tableName");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      INLocalizedFormatStringFromCodable(v29, v28, v32, v10, v38, v8, 0, 0, 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = v38;
      v7 = v37;

    }
    else
    {
LABEL_26:
      v33 = 0;
    }

  }
  else
  {
    v33 = 0;
  }

  return v33;
}

- (id)_propertiesByNameForLanguage:(id)a3
{
  void *v4;
  void *v5;

  +[INStringLocalizer localizerForLanguage:](INStringLocalizer, "localizerForLanguage:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponse _propertiesByNameWithLocalizer:](self, "_propertiesByNameWithLocalizer:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_propertiesByNameWithLocalizer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, void *);
  void *v16;
  id v17;
  id v18;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E08];
  -[INIntentResponse propertiesByName](self, "propertiesByName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[INIntentResponse propertiesByName](self, "propertiesByName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __59__INIntentResponse_Custom___propertiesByNameWithLocalizer___block_invoke;
  v16 = &unk_1E228F970;
  v17 = v7;
  v18 = v4;
  v9 = v4;
  v10 = v7;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", &v13);

  v11 = (void *)objc_msgSend(v10, "copy", v13, v14, v15, v16);
  return v11;
}

- (id)_renderedResponseForLanguage:(id)a3 requiresSiriCompatibility:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;

  v4 = a4;
  +[INStringLocalizer localizerForLanguage:](INStringLocalizer, "localizerForLanguage:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponse _renderedResponseWithLocalizer:requiresSiriCompatibility:](self, "_renderedResponseWithLocalizer:requiresSiriCompatibility:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_renderedResponseWithLocalizer:(id)a3 requiresSiriCompatibility:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a4;
  v6 = a3;
  -[INIntentResponse _responseTemplateWithLocalizer:requiresSiriCompatibility:](self, "_responseTemplateWithLocalizer:requiresSiriCompatibility:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponse _propertiesByNameWithLocalizer:](self, "_propertiesByNameWithLocalizer:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  if (objc_msgSend(v7, "length") && v8)
  {
    if (-[INIntentResponse _type](self, "_type") == 2)
    {
      -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      INReplaceVariablesInFormatStringFromCodable(v7, v6, v10, 0, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      INReplaceVariablesInFormatStringFromSlotComposing(v7, v6, self);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v9;
}

void __59__INIntentResponse_Custom___propertiesByNameWithLocalizer___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  uint64_t v5;
  id v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = a2;
  objc_msgSend(a3, "_intents_localizedCopyWithLocalizer:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v7, v6);

}

- (id)_intents_cacheableObjects
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, void *);
  void *v15;
  INIntentResponse *v16;
  id v17;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v4 = (objc_class *)objc_opt_class();
  INIntentSchemaGetIntentResponseDescriptionWithFacadeClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "slotsByName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __61__INIntentResponse_INCacheSupport___intents_cacheableObjects__block_invoke;
  v15 = &unk_1E2290940;
  v16 = self;
  v7 = v3;
  v17 = v7;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", &v12);

  -[INIntentResponse userActivity](self, "userActivity", v12, v13, v14, v15, v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v7, "addObject:", v8);
  if (objc_msgSend(v7, "count"))
    v9 = v7;
  else
    v9 = 0;
  v10 = v9;

  return v10;
}

- (void)_intents_updateContainerWithCache:(id)a3
{
  id v4;
  objc_class *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  INIntentSchemaGetIntentResponseDescriptionWithFacadeClass(v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "slotsByName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70__INIntentResponse_INCacheSupport___intents_updateContainerWithCache___block_invoke;
  v9[3] = &unk_1E2290940;
  v9[4] = self;
  v10 = v4;
  v7 = v4;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v9);

}

void __70__INIntentResponse_INCacheSupport___intents_updateContainerWithCache___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
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
  void *v15;
  void *v16;
  id v17;

  v4 = a3;
  v5 = *(void **)(a1 + 32);
  v17 = v4;
  objc_msgSend(v4, "facadePropertyName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKeyPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (objc_msgSend(v7, "conformsToProtocol:", &unk_1EE038EE8))
    {
      objc_msgSend(v7, "_intents_updateContainerWithCache:", *(_QWORD *)(a1 + 40));
      v8 = *(void **)(a1 + 32);
      objc_msgSend(v17, "facadePropertyName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setValue:forKeyPath:", v7, v9);
LABEL_4:

      goto LABEL_9;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = *(void **)(a1 + 40);
      objc_msgSend(v7, "_identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "cacheableObjectForIdentifier:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v13 = *(void **)(a1 + 40);
        objc_msgSend(v7, "_identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "cacheableObjectForIdentifier:", v14);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v9, "_imageSize");
          objc_msgSend(v7, "_setImageSize:");
          v15 = *(void **)(a1 + 32);
          objc_msgSend(v17, "facadePropertyName");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setValue:forKeyPath:", v7, v16);

        }
        goto LABEL_4;
      }
    }
  }
LABEL_9:

}

void __61__INIntentResponse_INCacheSupport___intents_cacheableObjects__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;

  v4 = *(void **)(a1 + 32);
  objc_msgSend(a3, "facadePropertyName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKeyPath:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v9;
  if (v9)
  {
    if (objc_msgSend(v9, "conformsToProtocol:", &unk_1EE056518))
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);
    v7 = objc_msgSend(v9, "conformsToProtocol:", &unk_1EE038EE8);
    v6 = v9;
    if (v7)
    {
      objc_msgSend(v9, "_intents_cacheableObjects");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "count"))
        objc_msgSend(*(id *)(a1 + 40), "unionSet:", v8);

      v6 = v9;
    }
  }

}

- (INIntentResponse)init
{
  id v2;
  uint64_t v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  objc_class *v28;
  void *v29;
  void *v30;
  int v31;
  INIntentResponse *v32;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v2 = -[INIntentResponse _initWithCode:userActivity:](self, "_initWithCode:userActivity:", 0, 0);
  if (!v2)
    goto LABEL_20;
  v3 = objc_opt_class();
  if (v3 == objc_opt_class())
    goto LABEL_20;
  v4 = (void *)objc_opt_class();
  if (!objc_msgSend(v4, "isSubclassOfClass:", objc_opt_class()))
    goto LABEL_20;
  v5 = (objc_class *)objc_opt_class();
  INIntentSchemaGetIntentResponseDescriptionWithFacadeClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "type");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    goto LABEL_20;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordForCurrentProcess");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "if_containingAppRecord");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v11, "intentDefinitionURLs");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "allKeys");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setWithArray:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "rangeOfString:options:", CFSTR("Response"), 4);
    if (v19 == 0x7FFFFFFFFFFFFFFFLL)
    {

      v20 = 0;
    }
    else
    {
      objc_msgSend(v18, "substringToIndex:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20 && objc_msgSend(v16, "containsObject:", v20))
      {
        objc_msgSend(v12, "bundleIdentifier");
        v25 = objc_claimAutoreleasedReturnValue();

        v9 = (void *)v25;
LABEL_16:

        goto LABEL_17;
      }
    }
    v26 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v35 = "-[INIntentResponse init]";
      v36 = 2112;
      v37 = v12;
      v38 = 2112;
      v39 = v20;
      _os_log_error_impl(&dword_18BEBC000, v26, OS_LOG_TYPE_ERROR, "%s App bundle record <%@> doesn't contain intent %@, falling back to current bundle", buf, 0x20u);
    }
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v10, "URL");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundleURL");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "if_isContainedByDirectoryAtURL:", v22);

    if (v23)
    {
      objc_msgSend(v10, "bundleIdentifier");
      v24 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v24;
    }
  }
LABEL_17:
  if (!v9)
  {
    objc_msgSend(v8, "bundlePath");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "lastPathComponent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v28 = (objc_class *)objc_opt_class();
  NSStringFromClass(v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@.%@"), CFSTR("sirikit.intents.custom."), v9, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setPayloadResponseTypeName:", v30);
  v31 = objc_msgSend(v2, "_commonInit");

  if (!v31)
  {
    v32 = 0;
    goto LABEL_21;
  }
LABEL_20:
  v32 = (INIntentResponse *)v2;
LABEL_21:

  return v32;
}

- (id)_initWithCode:(int64_t)a3 userActivity:(id)a4
{
  id v7;
  INIntentResponse *v8;
  id *p_isa;
  _INPBIntentResponse *v10;
  id v11;
  _INPBIntentResponsePayloadSuccess *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  id v16;
  _INPBIntentResponsePayloadFailure *v17;
  id v18;
  void *v19;
  id *v20;
  objc_super v22;

  v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)INIntentResponse;
  v8 = -[INIntentResponse init](&v22, sel_init);
  p_isa = (id *)&v8->super.isa;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_userActivity, a4);
    v10 = objc_alloc_init(_INPBIntentResponse);
    v11 = p_isa[3];
    p_isa[3] = v10;

    v12 = objc_alloc_init(_INPBIntentResponsePayloadSuccess);
    v13 = (objc_class *)objc_opt_class();
    INIntentSchemaGetIntentResponseDescriptionWithFacadeClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "type");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_INPBIntentResponsePayloadSuccess setResponseTypeName:](v12, "setResponseTypeName:", v15);

    objc_msgSend(p_isa[3], "setPayloadSuccess:", v12);
    v16 = p_isa[3];
    v17 = objc_alloc_init(_INPBIntentResponsePayloadFailure);
    objc_msgSend(v16, "setPayloadFailure:", v17);

    if (v7)
    {
      v18 = p_isa[3];
      INUserActivitySerializeToBackingStore(v7);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setUserActivity:", v19);

    }
    if (!objc_msgSend(p_isa, "_commonInit"))
    {

      v20 = 0;
      goto LABEL_8;
    }
    objc_msgSend(p_isa, "setCode:", a3);

  }
  v20 = p_isa;
LABEL_8:

  return v20;
}

- (INIntentResponse)initWithBackingStore:(id)a3
{
  id v4;
  INIntentResponse *v5;
  void *v6;
  uint64_t v7;
  NSUserActivity *userActivity;
  _INPBIntentResponse *v9;
  _INPBIntentResponse *backingStore;
  _INPBIntentResponsePayloadSuccess *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  _INPBIntentResponse *v15;
  _INPBIntentResponsePayloadFailure *v16;
  INIntentResponse *v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)INIntentResponse;
  v5 = -[INIntentResponse init](&v19, sel_init);
  if (!v5)
    goto LABEL_12;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "userActivity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    INUserActivityDeserializeFromBackingStore(v6);
    v7 = objc_claimAutoreleasedReturnValue();
    userActivity = v5->_userActivity;
    v5->_userActivity = (NSUserActivity *)v7;

    v9 = (_INPBIntentResponse *)objc_msgSend(v4, "copy");
  }
  else
  {
    v9 = objc_alloc_init(_INPBIntentResponse);
  }
  backingStore = v5->_backingStore;
  v5->_backingStore = v9;

  if (!-[_INPBIntentResponse hasType](v5->_backingStore, "hasType"))
    -[_INPBIntentResponse setType:](v5->_backingStore, "setType:", 3);
  if (!-[_INPBIntentResponse hasPayloadSuccess](v5->_backingStore, "hasPayloadSuccess"))
  {
    v11 = objc_alloc_init(_INPBIntentResponsePayloadSuccess);
    v12 = (objc_class *)objc_opt_class();
    INIntentSchemaGetIntentResponseDescriptionWithFacadeClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "type");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_INPBIntentResponsePayloadSuccess setResponseTypeName:](v11, "setResponseTypeName:", v14);

    -[_INPBIntentResponse setPayloadSuccess:](v5->_backingStore, "setPayloadSuccess:", v11);
  }
  if (!-[_INPBIntentResponse hasPayloadFailure](v5->_backingStore, "hasPayloadFailure"))
  {
    v15 = v5->_backingStore;
    v16 = objc_alloc_init(_INPBIntentResponsePayloadFailure);
    -[_INPBIntentResponse setPayloadFailure:](v15, "setPayloadFailure:", v16);

  }
  if (!-[INIntentResponse _commonInit](v5, "_commonInit"))
    v17 = 0;
  else
LABEL_12:
    v17 = v5;

  return v17;
}

- (BOOL)_commonInit
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  INCodable *v10;
  void *v11;
  void *v12;
  INCodable *v13;
  int64_t v14;
  BOOL v15;
  id v17;
  id v18;

  -[_INPBIntentResponse payloadSuccess](self->_backingStore, "payloadSuccess");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "responseTypeName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v18 = 0;
  INSchemaWithTypeName(v4, &v18, &v17);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v18;
  v7 = v17;

  if (v5)
  {
    objc_msgSend(v5, "intentResponseCodableDescriptionWithIntentResponseClassName:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      NSLog((NSString *)CFSTR("Unable to initialize '%@'. Please make sure that your intent definition file is valid."), v6);
      v15 = 0;
      goto LABEL_9;
    }
    v9 = (void *)v8;
    v10 = [INCodable alloc];
    -[_INPBIntentResponse payloadSuccess](self->_backingStore, "payloadSuccess");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "responseMessageData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[INCodable initWithCodableDescription:data:](v10, "initWithCodableDescription:data:", v9, v12);

    -[INIntentResponse _setResponseMessagePBRepresentation:](self, "_setResponseMessagePBRepresentation:", v13);
    if ((-[INIntentResponse isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()) & 1) == 0)
    {
      v14 = -[INIntentResponse code](self, "code");
      if (v14 != -[INIntentResponse _code](self, "_code"))
        -[INIntentResponse setCode:](self, "setCode:", -[INIntentResponse _code](self, "_code"));
    }

  }
  v15 = 1;
LABEL_9:

  return v15;
}

- (void)_setCode:(int64_t)a3
{
  void *v5;
  void *v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  self->_code = a3;
  if (-[INIntentResponse _type](self, "_type") == 2)
  {
    -[INIntentResponse _inCodable](self, "_inCodable");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3 < 100)
    {
      v6 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (objc_msgSend(v5, "isValidKey:", CFSTR("_code")))
      objc_msgSend(v5, "setValue:forPropertyNamed:", v6, CFSTR("_code"));
    -[INIntentResponse _setResponseMessagePBRepresentation:](self, "_setResponseMessagePBRepresentation:", v5);

  }
  v7 = -[INIntentResponse _type](self, "_type");
  if (a3 < 100 || v7 != 2)
  {
    -[_INPBIntentResponse setType:](self->_backingStore, "setType:", objc_msgSend((id)objc_opt_class(), "_typeFromCode:", a3));
    v8 = objc_msgSend((id)objc_opt_class(), "_errorCodeFromCode:", a3);
    if ((_DWORD)v8 != 0x7FFFFFFF)
    {
      v9 = v8;
      -[_INPBIntentResponse payloadFailure](self->_backingStore, "payloadFailure");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setErrorCode:", v9);

    }
    if (objc_msgSend((id)objc_opt_class(), "_appLaunchRequestedFromCode:", a3))
    {
      -[_INPBIntentResponse payloadFailure](self->_backingStore, "payloadFailure");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setAppLaunchRequested:", 1);

    }
  }
}

- (int64_t)_code
{
  uint64_t code;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  code = self->_code;
  if (code)
    return code;
  if (-[INIntentResponse _type](self, "_type") == 2)
  {
    -[INIntentResponse _inCodable](self, "_inCodable");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "valueForPropertyNamed:", CFSTR("_code"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    code = objc_msgSend(v6, "integerValue");

    if (code > 99)
      return code;
  }
  if (-[_INPBIntentResponse hasType](self->_backingStore, "hasType"))
    v7 = -[_INPBIntentResponse type](self->_backingStore, "type");
  else
    v7 = 3;
  if (-[_INPBIntentResponse hasPayloadFailure](self->_backingStore, "hasPayloadFailure"))
  {
    -[_INPBIntentResponse payloadFailure](self->_backingStore, "payloadFailure");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "hasErrorCode"))
      v9 = objc_msgSend(v8, "errorCode");
    else
      v9 = 0x7FFFFFFFLL;
    if (objc_msgSend(v8, "hasAppLaunchRequested"))
      v10 = objc_msgSend(v8, "appLaunchRequested");
    else
      v10 = 0;

  }
  else
  {
    v10 = 0;
    v9 = 0x7FFFFFFFLL;
  }
  return objc_msgSend((id)objc_opt_class(), "_codeFromType:errorCode:appLaunchRequested:", v7, v9, v10);
}

- (_INPBIntentResponse)backingStore
{
  if (-[INIntentResponse _type](self, "_type") == 2
    && (-[INIntentResponse isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()) & 1) == 0)
  {
    -[INIntentResponse _setCode:](self, "_setCode:", -[INIntentResponse code](self, "code"));
  }
  return self->_backingStore;
}

- (void)setUserActivity:(NSUserActivity *)userActivity
{
  NSUserActivity *v4;
  NSUserActivity *v5;
  NSUserActivity *v6;
  _INPBIntentResponse *backingStore;
  id v8;

  v4 = userActivity;
  -[NSUserActivity _intents_copy](v4, "_intents_copy");
  v5 = (NSUserActivity *)objc_claimAutoreleasedReturnValue();
  v6 = self->_userActivity;
  self->_userActivity = v5;

  backingStore = self->_backingStore;
  INUserActivitySerializeToBackingStore(v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[_INPBIntentResponse setUserActivity:](backingStore, "setUserActivity:", v8);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  id *v6;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[INIntentResponse backingStore](self, "backingStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id *)objc_msgSend(v4, "initWithBackingStore:", v5);

  if (v6)
  {
    objc_storeStrong(v6 + 5, self->_codableDescription);
    objc_msgSend(v6, "setCode:", -[INIntentResponse code](self, "code"));
  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[INIntentResponse code](self, "code"), CFSTR("code"));
  INUserActivitySerializeToData(self->_userActivity);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("userActivityData"));

  -[INIntentResponse backingStore](self, "backingStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("backingStore"));

  -[INIntentResponse _inCodable](self, "_inCodable");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_objectDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v11 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, &v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v11;
    if (v10)
      objc_msgSend(v4, "failWithError:", v10);
    else
      objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("codableDescriptionData"));

  }
}

- (INIntentResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  INIntentResponse *v14;
  INIntentResponse *v15;
  objc_super v17;
  id v18;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v5, CFSTR("backingStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("code"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userActivityData"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  INUserActivityDeserializeFromData(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("codableDescriptionData"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v18 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "_in_safeUnarchivedObjectOfClass:fromData:error:", objc_opt_class(), v10, &v18);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v18;
    if (v12)
    {
      v13 = v12;
      objc_msgSend(v4, "failWithError:", v12);

LABEL_9:
      v15 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    v11 = 0;
  }
  v17.receiver = self;
  v17.super_class = (Class)INIntentResponse;
  v14 = -[INIntentResponse init](&v17, sel_init);
  self = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_backingStore, v6);
    objc_storeStrong((id *)&self->_userActivity, v9);
    objc_storeStrong((id *)&self->_codableDescription, v11);
    if (!-[INIntentResponse _commonInit](self, "_commonInit"))
      goto LABEL_9;
    -[INIntentResponse _setCode:](self, "_setCode:", v7);
    -[INIntentResponse setCode:](self, "setCode:", v7);
  }
  self = self;
  v15 = self;
LABEL_10:

  return v15;
}

- (id)_payloadResponseMessageData
{
  void *v2;
  void *v3;

  -[_INPBIntentResponse payloadSuccess](self->_backingStore, "payloadSuccess");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "responseMessageData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_setPayloadResponseMessageData:(id)a3
{
  _INPBIntentResponse *backingStore;
  id v4;
  id v5;

  backingStore = self->_backingStore;
  v4 = a3;
  -[_INPBIntentResponse payloadSuccess](backingStore, "payloadSuccess");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setResponseMessageData:", v4);

}

- (NSString)_payloadResponseTypeName
{
  void *v2;
  void *v3;

  -[_INPBIntentResponse payloadSuccess](self->_backingStore, "payloadSuccess");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "responseTypeName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)_setPayloadResponseTypeName:(id)a3
{
  _INPBIntentResponse *backingStore;
  id v4;
  id v5;

  backingStore = self->_backingStore;
  v4 = a3;
  -[_INPBIntentResponse payloadSuccess](backingStore, "payloadSuccess");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setResponseTypeName:", v4);

}

- (int64_t)_intentHandlingStatus
{
  int64_t v2;

  v2 = -[INIntentResponse _intentResponseCode](self, "_intentResponseCode");
  if ((unint64_t)(v2 - 1) > 7)
    return 0;
  else
    return qword_18C311DD8[v2 - 1];
}

- (int64_t)_intentResponseCode
{
  int64_t v3;
  void *v4;

  v3 = -[INIntentResponse code](self, "code");
  if (-[INIntentResponse _type](self, "_type") == 2)
  {
    -[INIntentResponse _intentResponseCodableCode](self, "_intentResponseCodableCode");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[INIntentResponse code](self, "code") >= 100)
    {
      if (-[INIntentResponse _stage](self, "_stage") == 1)
        v3 = 1;
      else
        v3 = 4;
      if (!objc_msgSend(v4, "isSuccess"))
        v3 = 5;
    }

  }
  return v3;
}

- (INIntentResponseCodableCode)_intentResponseCodableCode
{
  void *v3;
  void *v4;
  void *v5;

  if (-[INIntentResponse _type](self, "_type") == 2)
  {
    -[INIntentResponse _inCodable](self, "_inCodable");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_objectDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentResponseCodeWithCode:", -[INIntentResponse code](self, "code"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return (INIntentResponseCodableCode *)v5;
}

- (INIntentResponseDescription)_instanceDescription
{
  INIntentResponseDescription *v3;
  void *v4;
  NSString *v5;
  Class v6;
  void *v7;
  void *v8;
  void *v9;
  INIntentResponseDescription *v10;
  objc_class *v11;

  if (-[INIntentResponse _type](self, "_type") == 2)
  {
    v3 = [INIntentResponseDescription alloc];
    -[INIntentResponse _className](self, "_className");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[INIntentResponse _className](self, "_className");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = NSClassFromString(v5);
    -[INIntentResponse _payloadResponseTypeName](self, "_payloadResponseTypeName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[INIntentResponse _inCodable](self, "_inCodable");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    INIntentSlotDescriptionsWithCodable(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[INIntentResponseDescription initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:](v3, "initWithName:facadeClass:dataClass:type:isPrivate:slotsByName:", v4, v6, 0, v7, 0, v9);

  }
  else
  {
    v11 = (objc_class *)objc_opt_class();
    INIntentSchemaGetIntentResponseDescriptionWithFacadeClass(v11);
    v10 = (INIntentResponseDescription *)objc_claimAutoreleasedReturnValue();
  }
  return v10;
}

- (BOOL)_shouldForwardIntentToApp
{
  return -[INIntentResponse _type](self, "_type") != 1
      && -[INIntentResponse _intentResponseCode](self, "_intentResponseCode") == 7;
}

- (NSString)_className
{
  void *v2;
  void *v3;
  void *v4;
  objc_class *v5;

  -[INIntentResponse _payloadResponseTypeName](self, "_payloadResponseTypeName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "hasPrefix:", CFSTR("sirikit.intents.custom.")))
  {
    objc_msgSend(v2, "componentsSeparatedByString:", CFSTR("."));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lastObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v4;
}

- (int64_t)_type
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v3 = (objc_class *)objc_opt_class();
  INIntentSchemaGetIntentResponseDescriptionWithFacadeClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "type");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    return 1;
  -[INIntentResponse _payloadResponseTypeName](self, "_payloadResponseTypeName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasPrefix:", CFSTR("sirikit.intents.custom."));

  if ((v8 & 1) != 0)
    return 2;
  v9 = objc_opt_class();
  if (v9 == objc_opt_class())
    return 3;
  else
    return 0;
}

- (BOOL)_requiresAuthentication
{
  return -[_INPBIntentResponse requiresAuthentication](self->_backingStore, "requiresAuthentication");
}

- (void)_setRequiresAuthentication:(BOOL)a3
{
  -[_INPBIntentResponse setRequiresAuthentication:](self->_backingStore, "setRequiresAuthentication:", a3);
}

- (BOOL)_requiresProtectedData
{
  return -[_INPBIntentResponse requiresProtectedData](self->_backingStore, "requiresProtectedData");
}

- (void)_setRequiresProtectedData:(BOOL)a3
{
  -[_INPBIntentResponse setRequiresProtectedData:](self->_backingStore, "setRequiresProtectedData:", a3);
}

- (NSDictionary)_JSONDictionaryRepresentation
{
  INJSONEncoder *v3;
  INJSONEncoderConfiguration *v4;
  void *v5;
  INJSONEncoder *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = [INJSONEncoder alloc];
  v4 = objc_alloc_init(INJSONEncoderConfiguration);
  +[INPreferences siriLanguageCode](INPreferences, "siriLanguageCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[INJSONEncoderConfiguration setLanguageCode:](v4, "setLanguageCode:", v5);

  v6 = -[INJSONEncoder initWithConfiguration:](v3, "initWithConfiguration:", v4);
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[INIntentResponse _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("code"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponse _className](self, "_className");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByAppendingString:", CFSTR("Code"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "substringFromIndex:", objc_msgSend(v11, "length"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v12, CFSTR("status"));

  -[INIntentResponse _payloadResponseTypeName](self, "_payloadResponseTypeName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v13, CFSTR("typeName"));

  -[INIntentResponse _codableDescription](self, "_codableDescription");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[INJSONEncoder encodeObject:withCodableDescription:](v6, "encodeObject:withCodableDescription:", self, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v15, CFSTR("properties"));

  -[INIntentResponse userActivity](self, "userActivity");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[INJSONEncoder encodeObject:](v6, "encodeObject:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v17, CFSTR("userActivity"));

  return (NSDictionary *)v7;
}

- (void)_updateWithJSONDictionary:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  int64_t v14;
  INJSONDecoder *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;

  v31 = a3;
  objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("properties"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  v7 = (void *)MEMORY[0x1E0CB3940];
  -[INIntentResponse _className](self, "_className");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("status"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@Code%@"), v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponse _setCode:](self, "_setCode:", -[INIntentResponse _codeWithName:](self, "_codeWithName:", v10));

  objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("stage"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
  }
  else
  {
    v12 = 0;
  }
  v13 = v12;

  v14 = -[INIntentResponse _stageWithName:](self, "_stageWithName:", v13);
  -[INIntentResponse _setStage:](self, "_setStage:", v14);
  v15 = objc_alloc_init(INJSONDecoder);
  -[INIntentResponse _codableDescription](self, "_codableDescription");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[INJSONDecoder decodeObject:withCodableDescription:from:](v15, "decodeObject:withCodableDescription:from:", self, v16, v6);

  v17 = objc_opt_class();
  objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("userActivity"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[INJSONDecoder decodeObjectOfClass:from:](v15, "decodeObjectOfClass:from:", v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponse setUserActivity:](self, "setUserActivity:", v19);

  v20 = (objc_class *)objc_opt_class();
  NSStringFromClass(v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "rangeOfString:options:", CFSTR("Response"), 4);
  if (v22 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v23 = 0;
  }
  else
  {
    objc_msgSend(v21, "substringToIndex:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }

  -[INIntentResponse _codableDescription](self, "_codableDescription");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v25 = v24;
    else
      v25 = 0;
  }
  else
  {
    v25 = 0;
  }
  v26 = v25;

  objc_msgSend(v26, "_nullable_schema");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "_types");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "_reestablishReferencedCodableDescriptionsUsingTypes:", v28);

  objc_msgSend(v27, "intentCodableDescriptionWithIntentClassName:", v23);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "_types");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "_reestablishReferencedCodableDescriptionsUsingTypes:intentResponseCodableDescription:", v30, v26);

}

- (NSString)description
{
  return (NSString *)-[INIntentResponse descriptionAtIndent:](self, "descriptionAtIndent:", 0);
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)INIntentResponse;
  -[INIntentResponse description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INIntentResponse _redactedDictionaryRepresentation](self, "_redactedDictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  void *v3;
  unint64_t v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  -[INIntentResponse _className](self, "_className");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[INIntentResponse code](self, "code");
  v5 = v3;
  v6 = v5;
  if (v4 > 8)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v5, "stringByAppendingString:", off_1E2291AE0[v4]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v7)
  {
    v8 = 0;
    v26[0] = CFSTR("code");
LABEL_6:
    v9 = v7;
    goto LABEL_13;
  }
  if (-[INIntentResponse _type](self, "_type") == 2
    && (-[INIntentResponse _intentResponseCodableCode](self, "_intentResponseCodableCode"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v10, "name"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        v11))
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    -[INIntentResponse _className](self, "_className");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "substringToIndex:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "uppercaseString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "substringFromIndex:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("%@Code%@%@"), v13, v15, v16);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v26[0] = CFSTR("code");
    if (v7)
    {
      v8 = 0;
      goto LABEL_6;
    }
  }
  else
  {
    v26[0] = CFSTR("code");
  }
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v8 = 1;
LABEL_13:
  v26[1] = CFSTR("userActivity");
  v27[0] = v9;
  -[INIntentResponse userActivity](self, "userActivity");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v27[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)

  if (v8)
  -[INIntentResponse _inCodable](self, "_inCodable");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v21 = (void *)objc_msgSend(v19, "mutableCopy");
    -[INIntentResponse _inCodable](self, "_inCodable");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addEntriesFromDictionary:", v23);

    v24 = objc_msgSend(v21, "copy");
    v19 = (void *)v24;
  }

  return v19;
}

- (INCodableDescription)_codableDescription
{
  INCodableDescription *codableDescription;
  void *v4;
  void *v5;
  INCodableDescription *v6;
  INCodableDescription *v7;
  _QWORD v9[5];

  codableDescription = self->_codableDescription;
  if (!codableDescription)
  {
    -[INIntentResponse _inCodable](self, "_inCodable");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "_objectDescription");
      v6 = (INCodableDescription *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __39__INIntentResponse__codableDescription__block_invoke;
      v9[3] = &unk_1E2291A98;
      v9[4] = self;
      -[INIntentResponse _querySchemaWithBlock:](self, "_querySchemaWithBlock:", v9);
      v6 = (INCodableDescription *)objc_claimAutoreleasedReturnValue();
    }
    v7 = self->_codableDescription;
    self->_codableDescription = v6;

    codableDescription = self->_codableDescription;
  }
  return codableDescription;
}

- (INIntentResponse)initWithPropertiesByName:(id)a3
{
  id v4;
  _INPBIntentResponse *v5;
  INIntentResponse *v6;

  v4 = a3;
  v5 = objc_alloc_init(_INPBIntentResponse);
  v6 = -[INIntentResponse initWithBackingStore:](self, "initWithBackingStore:", v5);

  if (v6)
    -[INIntentResponse setPropertiesByName:](v6, "setPropertiesByName:", v4);

  return v6;
}

- (NSDictionary)propertiesByName
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "properties");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "count"))
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v3, "count"));
    else
      v4 = 0;
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = v3;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(v11, "role", (_QWORD)v15);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            INIntentSlotValueTransformFromProperty(v11);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, v12);

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

    v5 = (void *)objc_msgSend(v4, "copy");
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v2, "_dictionaryRepresentationWithNullValues:", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
  }

  return (NSDictionary *)v5;
}

- (void)setPropertiesByName:(id)a3
{
  void *v4;
  objc_class *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  _QWORD v11[4];
  id v12;

  v9 = a3;
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (objc_class *)MEMORY[0x1E0C99DE8];
    v6 = v4;
    v7 = (void *)objc_msgSend([v5 alloc], "initWithCapacity:", objc_msgSend(v9, "count"));
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __40__INIntentResponse_setPropertiesByName___block_invoke;
    v11[3] = &unk_1E2291AC0;
    v12 = v7;
    v8 = v7;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v11);
    objc_msgSend(v6, "setProperties:", v8);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __40__INIntentResponse_setPropertiesByName___block_invoke_2;
      v10[3] = &unk_1E2291AC0;
      v10[4] = self;
      objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v10);
    }
  }

}

- (int64_t)_stageWithName:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Confirm")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Handle")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int64_t)_codeWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  int64_t v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  void *v15;
  char v16;
  void *v17;
  char v18;
  void *v19;
  char v20;
  void *v21;
  char v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int64_t v40;
  void *v41;
  void *v42;
  id obj;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[INIntentResponse _className](self, "_className");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingString:", CFSTR("CodeUnspecified"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqualToString:", v6);

  if ((v7 & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v5, "stringByAppendingString:", CFSTR("CodeReady"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v4, "isEqualToString:", v9);

    if ((v10 & 1) != 0)
    {
      v8 = 1;
    }
    else
    {
      objc_msgSend(v5, "stringByAppendingString:", CFSTR("CodeInProgress"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v4, "isEqualToString:", v11);

      if ((v12 & 1) != 0)
      {
        v8 = 3;
      }
      else
      {
        objc_msgSend(v5, "stringByAppendingString:", CFSTR("CodeSuccess"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v4, "isEqualToString:", v13);

        if ((v14 & 1) != 0)
        {
          v8 = 4;
        }
        else
        {
          objc_msgSend(v5, "stringByAppendingString:", CFSTR("CodeFailure"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v4, "isEqualToString:", v15);

          if ((v16 & 1) != 0)
          {
            v8 = 5;
          }
          else
          {
            objc_msgSend(v5, "stringByAppendingString:", CFSTR("CodeContinueInApp"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v4, "isEqualToString:", v17);

            if ((v18 & 1) != 0)
            {
              v8 = 2;
            }
            else
            {
              objc_msgSend(v5, "stringByAppendingString:", CFSTR("CodeFailureRequiringAppLaunch"));
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v20 = objc_msgSend(v4, "isEqualToString:", v19);

              if ((v20 & 1) != 0)
              {
                v8 = 6;
              }
              else
              {
                objc_msgSend(v5, "stringByAppendingString:", CFSTR("CodeUserConfirmationRequired"));
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v22 = objc_msgSend(v4, "isEqualToString:", v21);

                if ((v22 & 1) != 0)
                {
                  v8 = 8;
                }
                else
                {
                  objc_msgSend(v5, "stringByAppendingString:", CFSTR("CodeHandleInApp"));
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  v24 = objc_msgSend(v4, "isEqualToString:", v23);

                  if (v24)
                    v8 = 7;
                  else
                    v8 = 0;
                }
              }
            }
          }
        }
      }
    }
  }
  -[INIntentResponse _inCodable](self, "_inCodable");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[INIntentResponse _inCodable](self, "_inCodable");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "_objectDescription");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    objc_msgSend(v27, "responseCodes");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    if (v28)
    {
      v29 = v28;
      v41 = v27;
      v42 = v26;
      v40 = v8;
      v44 = v5;
      v30 = *(_QWORD *)v46;
      while (2)
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v46 != v30)
            objc_enumerationMutation(obj);
          v32 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
          objc_msgSend(v32, "name");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v33, "substringToIndex:", 1);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "uppercaseString");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "substringFromIndex:", 1);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "stringWithFormat:", CFSTR("%@Code%@%@"), v44, v36, v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v4, "isEqualToString:", v38))
          {
            v8 = objc_msgSend(v32, "value");

            v5 = v44;
            goto LABEL_31;
          }

        }
        v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
        if (v29)
          continue;
        break;
      }
      v5 = v44;
      v8 = v40;
LABEL_31:
      v27 = v41;
      v26 = v42;
    }

  }
  return v8;
}

- (PBCodable)_responseMessagePBRepresentation
{
  PBCodable *responseMessagePBRepresentation;
  void *v4;
  objc_class *v5;
  PBCodable *v6;
  objc_class *v7;
  void *v8;
  uint64_t v9;
  INCodable *v10;
  void *v11;
  PBCodable *v12;

  responseMessagePBRepresentation = self->_responseMessagePBRepresentation;
  if (!responseMessagePBRepresentation)
  {
    -[INIntentResponse _payloadResponseMessageData](self, "_payloadResponseMessageData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    switch(-[INIntentResponse _type](self, "_type"))
    {
      case 0:
      case 3:
        v5 = (objc_class *)_INPBGenericIntentResponse;
        if (!v4)
          goto LABEL_6;
        goto LABEL_4;
      case 1:
        v7 = (objc_class *)objc_opt_class();
        INIntentSchemaGetIntentResponseDescriptionWithFacadeClass(v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "dataClass");

        v5 = (objc_class *)v9;
        if (v4)
LABEL_4:
          v6 = (PBCodable *)objc_msgSend([v5 alloc], "initWithData:", v4);
        else
LABEL_6:
          v6 = (PBCodable *)objc_alloc_init(v5);
        goto LABEL_11;
      case 2:
        v10 = [INCodable alloc];
        if (v4)
          v11 = v4;
        else
          v11 = 0;
        v6 = -[INCodable initWithCodableDescription:data:](v10, "initWithCodableDescription:data:", self->_codableDescription, v11);
LABEL_11:
        v12 = self->_responseMessagePBRepresentation;
        self->_responseMessagePBRepresentation = v6;

        break;
      default:
        break;
    }

    responseMessagePBRepresentation = self->_responseMessagePBRepresentation;
  }
  return responseMessagePBRepresentation;
}

- (void)_setResponseMessagePBRepresentation:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_responseMessagePBRepresentation, a3);
  v5 = a3;
  objc_msgSend(v5, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[INIntentResponse _setPayloadResponseMessageData:](self, "_setPayloadResponseMessageData:", v6);
}

- (BOOL)_isValidKey:(id)a3
{
  NSString *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (NSString *)a3;
  -[INIntentResponse _inCodable](self, "_inCodable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, "isValidKey:", v4);

  }
  else
  {
    NSSelectorFromString(v4);

    v7 = objc_opt_respondsToSelector();
  }

  return v7 & 1;
}

- (id)_querySchemaWithBlock:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v14;
  id v15;

  v4 = (void (**)(id, void *))a3;
  -[_INPBIntentResponse payloadSuccess](self->_backingStore, "payloadSuccess");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "responseTypeName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15 = 0;
  INSchemaWithTypeName(v6, &v15, &v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v15;

  v4[2](v4, v7);
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[INSchema _defaultSchemaForBundle:](INSchema, "_defaultSchemaForBundle:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v4[2](v4, (void *)v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)v12;
  }

  return v10;
}

- (id)_inCodable
{
  void *v3;
  char isKindOfClass;
  void *v5;

  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)valueForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  -[INIntentResponse _inCodable](self, "_inCodable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && objc_msgSend(v5, "isValidKey:", v4))
  {
    objc_msgSend(v6, "valueForPropertyNamed:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)INIntentResponse;
    -[INIntentResponse valueForKey:](&v10, sel_valueForKey_, v4);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;

  return v8;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  objc_super v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[INIntentResponse _inCodable](self, "_inCodable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    v14.receiver = self;
    v14.super_class = (Class)INIntentResponse;
    -[INIntentResponse valueForUndefinedKey:](&v14, sel_valueForUndefinedKey_, v4);
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if ((objc_msgSend(v5, "isValidKey:", v4) & 1) != 0)
  {
    objc_msgSend(v6, "valueForPropertyNamed:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v8 = (void *)v7;
    goto LABEL_9;
  }
  v9 = (void *)INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_FAULT))
  {
    v11 = v9;
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v16 = "-[INIntentResponse valueForUndefinedKey:]";
    v17 = 2112;
    v18 = v4;
    v19 = 2112;
    v20 = v13;
    _os_log_fault_impl(&dword_18BEBC000, v11, OS_LOG_TYPE_FAULT, "%s '%@' is an invalid parameter for '%@'. Please make sure that your intent definition file is valid.", buf, 0x20u);

  }
  v8 = 0;
LABEL_9:

  return v8;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  objc_super v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[INIntentResponse _inCodable](self, "_inCodable");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if ((objc_msgSend(v8, "isValidKey:", v7) & 1) != 0)
    {
      objc_msgSend(v9, "setValue:forPropertyNamed:", v6, v7);
      objc_msgSend(v9, "data");
      v10 = objc_claimAutoreleasedReturnValue();
      -[INIntentResponse _setPayloadResponseMessageData:](self, "_setPayloadResponseMessageData:", v10);
    }
    else
    {
      v11 = (void *)INSiriLogContextIntents;
      if (!os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_FAULT))
        goto LABEL_7;
      v10 = v11;
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v16 = "-[INIntentResponse setValue:forUndefinedKey:]";
      v17 = 2112;
      v18 = v7;
      v19 = 2112;
      v20 = v13;
      _os_log_fault_impl(&dword_18BEBC000, v10, OS_LOG_TYPE_FAULT, "%s '%@' is an invalid parameter for '%@'. Please make sure that your intent definition file is valid.", buf, 0x20u);

    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)INIntentResponse;
    -[INIntentResponse setValue:forUndefinedKey:](&v14, sel_setValue_forUndefinedKey_, v6, v7);
  }
LABEL_7:

}

- (BOOL)setValue:(id)a3 forProperty:(id)a4
{
  -[INIntentResponse setValue:forUndefinedKey:](self, "setValue:forUndefinedKey:", a3, a4);
  return 1;
}

- (NSUserActivity)userActivity
{
  return self->_userActivity;
}

- (int64_t)_stage
{
  return self->__stage;
}

- (void)_setStage:(int64_t)a3
{
  self->__stage = a3;
}

- (BOOL)_userConfirmationRequired
{
  return self->__userConfirmationRequired;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userActivity, 0);
  objc_storeStrong((id *)&self->_codableDescription, 0);
  objc_storeStrong((id *)&self->_responseMessagePBRepresentation, 0);
  objc_storeStrong((id *)&self->_backingStore, 0);
}

void __40__INIntentResponse_setPropertiesByName___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  INIntentSlotValueTransformToProperty(a3, a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

}

uint64_t __40__INIntentResponse_setPropertiesByName___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setValue:forUndefinedKey:", a3, a2);
}

id __39__INIntentResponse__codableDescription__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "_className");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "intentResponseCodableDescriptionWithIntentResponseClassName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (int)_errorCodeFromCode:(int64_t)a3
{
  return 0x7FFFFFFF;
}

+ (id)responseSuccess
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "_initWithCode:userActivity:", 4, 0);
}

+ (id)responseFailure
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "_initWithCode:userActivity:", 0, 0);
}

+ (int64_t)_codeFromType:(int)a3 errorCode:(int)a4 appLaunchRequested:(BOOL)a5
{
  int64_t result;

  result = 0;
  switch(a3)
  {
    case 0:
      result = 4;
      break;
    case 1:
      if (a5)
        result = 6;
      else
        result = 5;
      break;
    case 2:
      result = 3;
      break;
    case 4:
      result = 2;
      break;
    case 5:
      result = 1;
      break;
    default:
      return result;
  }
  return result;
}

+ (int)_typeFromCode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 6)
    return 3;
  else
    return dword_18C311E18[a3 - 1];
}

+ (int64_t)_codeFromIntentResponseCode:(int64_t)a3
{
  return objc_msgSend(a1, "_codeFromType:errorCode:appLaunchRequested:", objc_msgSend(a1, "_typeFromCode:", a3), 0, 0);
}

+ (BOOL)_appLaunchRequestedFromCode:(int64_t)a3
{
  return a3 == 6;
}

+ (int64_t)_intentHandlingStatusFromCode:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 5)
    return 0;
  else
    return qword_18C311E38[a3 - 1];
}

+ (BOOL)resolveInstanceMethod:(SEL)a3
{
  return INResolveInstanceMethod(a3, (objc_class *)a1);
}

- (BOOL)_intents_enumerateObjectsOfClass:(Class)a3 withBlock:(id)a4
{
  void *v5;

  _INEnumerableValueProcessingBlock((uint64_t)a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[INIntentResponse _enumerateWithValueProcessingBlock:](self, "_enumerateWithValueProcessingBlock:", v5);

  return (char)self;
}

- (BOOL)_enumerateWithValueProcessingBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[INIntentResponse _responseMessagePBRepresentation](self, "_responseMessagePBRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (INEnumerateObjectsInCodable(v5, v4))
    {
      objc_msgSend(v5, "data");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[INIntentResponse _setPayloadResponseMessageData:](self, "_setPayloadResponseMessageData:", v6);

      v7 = 1;
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {

    v7 = INEnumerateObjectsInIntentSlotComposing(self, v4);
    v5 = 0;
  }

  return v7;
}

- (INImage)_keyImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  INKeyImageUtilitiesSortedSubProducersForSlotComposingProducer(self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "valueForSlotComposer:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "conformsToProtocol:", &unk_1EE038E40))
  {
    objc_msgSend(v5, "_keyImage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return (INImage *)v6;
}

- (int64_t)_compareSubProducerOne:(id)a3 subProducerTwo:(id)a4
{
  return INKeyImageUtilitiesDefaultCompareSubProducers(a3, a4);
}

@end
