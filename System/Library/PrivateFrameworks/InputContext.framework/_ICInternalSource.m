@implementation _ICInternalSource

- (_ICInternalSource)init
{
  _ICInternalSource *v2;
  _ICInternalSource *v3;
  NSString *name;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_ICInternalSource;
  v2 = -[_ICInternalSource init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    name = v2->_name;
    v2->_name = (NSString *)CFSTR("_ICInternalSource");

  }
  return v3;
}

- (id)name
{
  return self->_name;
}

- (void)predictedItemsWithProactiveTrigger:(id)a3 searchContext:(id)a4 limit:(unint64_t)a5 timeoutInMilliseconds:(unint64_t)a6 handler:(id)a7
{
  id v10;
  id v11;
  void (**v12)(id, void *, void *);
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _ICPredictedItem *v26;
  void *v27;
  int v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  char v35;
  char v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  unint64_t v41;
  NSObject *v42;
  uint64_t v43;
  NSObject *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  _QWORD v51[2];

  v51[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, void *, void *))a7;
  v13 = mach_absolute_time();
  objc_msgSend(v10, "attributedString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "valueForKey:", *MEMORY[0x24BE5EE58]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "attributedString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "valueForKey:", *MEMORY[0x24BE5EE48]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "attributedString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "valueForKey:", *MEMORY[0x24BE5EE38]);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "applicationBundleIdentifier");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "isEqualToString:", *MEMORY[0x24BE5EE20])
    && objc_msgSend(v17, "isEqualToString:", *MEMORY[0x24BE5EDF8]))
  {
    objc_msgSend(v10, "availableApps");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "containsObject:", CFSTR("com.apple.messages.currentLocation"));

    if (v21)
    {
      v46 = v17;
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setObject:forKey:", CFSTR("com.apple.messages.currentLocation"), CFSTR("bundleID"));
      v23 = (void *)MEMORY[0x24BDD17C8];
      -[_ICInternalSource localizedStringForKey:withLocale:](self, "localizedStringForKey:withLocale:", CFSTR("SEND_CURRENT_LOCATION_BUTTON_CAPTION"), v11);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringWithValidatedFormat:validFormatSpecifiers:error:", v24, CFSTR("%@"), 0, CFSTR(""));
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      LOWORD(v45) = 0;
      v26 = -[_ICPredictedItem initWithIdentifier:itemType:score:value:label:name:date:originatingBundleID:originatingWebsiteURL:predictionAge:shouldAggregate:flags:targetBundleID:operationData:proactiveTrigger:]([_ICPredictedItem alloc], "initWithIdentifier:itemType:score:value:label:name:date:originatingBundleID:originatingWebsiteURL:predictionAge:shouldAggregate:flags:targetBundleID:operationData:proactiveTrigger:", CFSTR("currentLocation"), 1, v25, 0, 0, v49, 1.0, v47, 0, 30, v45, CFSTR("com.apple.messages.currentLocation"), v22, v10);
      objc_msgSend(v19, "addObject:", v26);
      goto LABEL_12;
    }
  }
  else if (objc_msgSend(v15, "isEqualToString:", CFSTR("money")))
  {
    objc_msgSend(v10, "availableApps");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "containsObject:", CFSTR("com.apple.messages.surf"));

    if (v28)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setObject:forKey:", CFSTR("com.apple.messages.surf"), CFSTR("bundleID"));
      objc_msgSend(v48, "objectForKey:", CFSTR("Currency"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v25)
      {
LABEL_13:

        goto LABEL_14;
      }
      objc_msgSend(v22, "setObject:forKey:", v25, CFSTR("Currency"));
      v46 = v17;
      LOWORD(v45) = 0;
      v26 = -[_ICPredictedItem initWithIdentifier:itemType:score:value:label:name:date:originatingBundleID:originatingWebsiteURL:predictionAge:shouldAggregate:flags:targetBundleID:operationData:proactiveTrigger:]([_ICPredictedItem alloc], "initWithIdentifier:itemType:score:value:label:name:date:originatingBundleID:originatingWebsiteURL:predictionAge:shouldAggregate:flags:targetBundleID:operationData:proactiveTrigger:", CFSTR("surf"), 1, CFSTR("Pay"), 0, 0, v49, 1.0, 0, 0, 30, v45, 0, v22, v10);
      -[_ICPredictedItem setLayoutHint:](v26, "setLayoutHint:", 1);
      objc_msgSend(v19, "addObject:", v26);
LABEL_12:

      v17 = v46;
      goto LABEL_13;
    }
  }
  else
  {
    if (!objc_msgSend(v15, "isEqualToString:", CFSTR("photosharing")))
    {
LABEL_14:
      v35 = 1;
      goto LABEL_16;
    }
    objc_msgSend(v10, "availableApps");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "containsObject:", CFSTR("com.apple.messages.photos"));

    if (v30)
    {
      v46 = v17;
      v31 = (void *)MEMORY[0x24BDBCED8];
      objc_msgSend(v10, "attributedString");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "dictionaryWithDictionary:", v32);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v22, "setObject:forKey:", CFSTR("com.apple.messages.photos"), CFSTR("bundleID"));
      v33 = (void *)MEMORY[0x24BDD17C8];
      -[_ICInternalSource localizedStringForKey:withLocale:](self, "localizedStringForKey:withLocale:", CFSTR("CHOOSE_PHOTOS_CAPTION"), v11);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "stringWithValidatedFormat:validFormatSpecifiers:error:", v34, CFSTR("%@"), 0, CFSTR(""));
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      LOWORD(v45) = 0;
      v26 = -[_ICPredictedItem initWithIdentifier:itemType:score:value:label:name:date:originatingBundleID:originatingWebsiteURL:predictionAge:shouldAggregate:flags:targetBundleID:operationData:proactiveTrigger:]([_ICPredictedItem alloc], "initWithIdentifier:itemType:score:value:label:name:date:originatingBundleID:originatingWebsiteURL:predictionAge:shouldAggregate:flags:targetBundleID:operationData:proactiveTrigger:", CFSTR("choosePhotos"), 1, v25, 0, 0, v49, 1.0, 0, 0, 30, v45, 0, v22, v10);
      -[_ICPredictedItem setLayoutHint:](v26, "setLayoutHint:", 0);
      objc_msgSend(v19, "addObject:", v26);
      goto LABEL_12;
    }
  }
  v35 = 0;
LABEL_16:
  if (objc_msgSend(v19, "count"))
    v36 = 1;
  else
    v36 = v35;
  if ((v36 & 1) != 0)
  {
    v37 = 0;
  }
  else
  {
    v38 = (void *)MEMORY[0x24BDD1540];
    v50 = *MEMORY[0x24BDD0FC8];
    v51[0] = CFSTR("NotSupByAp");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v51, &v50, 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "errorWithDomain:code:userInfo:", CFSTR("com.apple.inputcontext.errors"), 5, v39);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v12[2](v12, v19, v37);
  v40 = mach_absolute_time();
  v41 = _ICMachTimeToNanoseconds(v40 - v13);
  _ICProactiveQuickTypeOSLogFacility();
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
    -[_ICInternalSource predictedItemsWithProactiveTrigger:searchContext:limit:timeoutInMilliseconds:handler:].cold.1();

  if (!v41)
  {
    v43 = mach_absolute_time();
    _ICMachTimeToNanoseconds(v43 - v13);
    _ICProactiveQuickTypeOSLogFacility();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
      -[_ICInternalSource predictedItemsWithProactiveTrigger:searchContext:limit:timeoutInMilliseconds:handler:].cold.1();

  }
}

- (id)localizedStringForKey:(id)a3 withLocale:(id)a4
{
  id v5;
  id v6;
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _QWORD v33[3];

  v33[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "locale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (localizedStringForKey_withLocale__onceToken != -1)
    dispatch_once(&localizedStringForKey_withLocale__onceToken, &__block_literal_global_3);
  v8 = (void *)localizedStringForKey_withLocale__localizationsCache;
  objc_msgSend(v6, "locale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10
    || (objc_msgSend(v10, "objectForKeyedSubscript:", v5), (v11 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      v26 = v6;
      v27 = v5;
      v33[0] = v7;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x24BDD1488];
      objc_msgSend(v12, "localizations");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "preferredLocalizationsFromArray:forPreferences:", v15, v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v17 = v16;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v29;
LABEL_8:
        v21 = 0;
        while (1)
        {
          if (*(_QWORD *)v29 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(v12, "pathForResource:ofType:inDirectory:forLocalization:", CFSTR("Predictions"), CFSTR("strings"), 0, *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v21));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", v22);
          v23 = objc_claimAutoreleasedReturnValue();
          if (v23)
            break;

          if (v19 == ++v21)
          {
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
            if (v19)
              goto LABEL_8;
            goto LABEL_14;
          }
        }
        v24 = (void *)v23;
        objc_msgSend((id)localizedStringForKey_withLocale__localizationsCache, "setObject:forKey:", v23, v7);
        v5 = v27;
        objc_msgSend(v24, "objectForKeyedSubscript:", v27);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
          goto LABEL_17;

        v6 = v26;
        v10 = 0;
        goto LABEL_19;
      }
LABEL_14:

      v5 = v27;
LABEL_17:

      v6 = v26;
      v10 = 0;
    }
    objc_msgSend(v12, "localizedStringForKey:value:table:", v5, &stru_24EF71F58, CFSTR("Predictions"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:

  }
  return v11;
}

- (void)searchForMeCardRegionsWithTimeout:(unint64_t)a3 handler:(id)a4
{
  (*((void (**)(id, _QWORD))a4 + 2))(a4, MEMORY[0x24BDBD1A8]);
}

- (void)searchForMeCardEmailAddressesWithTimeout:(unint64_t)a3 handler:(id)a4
{
  (*((void (**)(id, _QWORD))a4 + 2))(a4, MEMORY[0x24BDBD1A8]);
}

- (BOOL)doesSupportTriggerSourceType:(unsigned __int8)a3
{
  return a3 == 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)predictedItemsWithProactiveTrigger:searchContext:limit:timeoutInMilliseconds:handler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 138412546;
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_22716D000, v0, v1, "_ICScales: %@ took %f seconds", (uint8_t *)v2);
  OUTLINED_FUNCTION_5();
}

@end
