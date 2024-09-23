@implementation HFProgrammableSwitchAccessoryItem

- (HFProgrammableSwitchAccessoryItem)initWithAccessory:(id)a3 valueSource:(id)a4
{
  id v7;
  id v8;
  HFProgrammableSwitchAccessoryItem *v9;
  HFProgrammableSwitchAccessoryItem *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HFProgrammableSwitchAccessoryItem;
  v9 = -[HFProgrammableSwitchAccessoryItem init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accessory, a3);
    objc_storeStrong((id *)&v10->_valueSource, a4);
  }

  return v10;
}

- (HFProgrammableSwitchAccessoryItem)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithAccessory_valueSource_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFProgrammableSwitchAccessoryItem.m"), 38, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFProgrammableSwitchAccessoryItem init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  id v5;

  -[HFProgrammableSwitchAccessoryItem valueSource](self, "valueSource", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HFProgrammableSwitchAccessoryItem copyWithValueSource:](self, "copyWithValueSource:", v4);

  return v5;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v5;
  HFServiceLikeItemUpdateRequest *v6;
  void *v7;
  void *v8;
  void *v9;
  HFServiceLikeItemUpdateRequest *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  _QWORD v19[5];
  uint8_t buf[4];
  HFProgrammableSwitchAccessoryItem *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = [HFServiceLikeItemUpdateRequest alloc];
  -[HFProgrammableSwitchAccessoryItem accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFProgrammableSwitchAccessoryItem valueSource](self, "valueSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HFServiceLikeItemUpdateRequest initWithAccessory:valueSource:characteristics:](v6, "initWithAccessory:valueSource:characteristics:", v7, v8, v9);

  if (v10)
  {
    -[HFServiceLikeItemUpdateRequest updateWithOptions:](v10, "updateWithOptions:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __65__HFProgrammableSwitchAccessoryItem__subclass_updateWithOptions___block_invoke;
    v19[3] = &unk_1EA726480;
    v19[4] = self;
    objc_msgSend(v11, "flatMap:", v19);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    HFLogForCategory(0x29uLL);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFProgrammableSwitchAccessoryItem accessory](self, "accessory");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v21 = self;
      v22 = 2112;
      v23 = v17;
      v24 = 2112;
      v25 = v18;
      _os_log_error_impl(&dword_1DD34E000, v13, OS_LOG_TYPE_ERROR, "%@:%@ Failed to create HFServiceLikeItemUpdateRequest. Accessory: %@ ", buf, 0x20u);

    }
    v14 = (void *)MEMORY[0x1E0D519C0];
    +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", MEMORY[0x1E0C9AA70]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "futureWithResult:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v15 = (void *)v12;

  return v15;
}

id __65__HFProgrammableSwitchAccessoryItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  __CFString **v8;
  __CFString *v9;
  HFCAPackageIconDescriptor *v10;
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
  int v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  __CFString *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  _QWORD v52[6];
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;

  v3 = a2;
  objc_msgSend(v3, "standardResults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("state"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  v8 = &HFCAPackageStateOn;
  if (v7 != 2)
    v8 = &HFCAPackageStateOff;
  v9 = *v8;
  v10 = -[HFCAPackageIconDescriptor initWithPackageIdentifier:state:]([HFCAPackageIconDescriptor alloc], "initWithPackageIdentifier:state:", CFSTR("HFCAPackageIconIdentifierProgrammableSwitch"), v9);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("icon"));

  objc_msgSend(*(id *)(a1 + 32), "accessory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "room");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "uniqueIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_safeSetObject:forKey:", v13, CFSTR("roomIdentifier"));

  objc_msgSend(*(id *)(a1 + 32), "accessory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "hf_serviceNameComponents");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("serviceNameComponents"));
    objc_msgSend(v15, "composedString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, CFSTR("title"));
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("controlDescription"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, CFSTR("controlDescription"));

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("detailedControlDescription"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "accessory");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "home");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "hf_currentUserIsAdministrator");

    if (v21)
    {
      v57 = 0;
      v58 = &v57;
      v59 = 0x2020000000;
      v60 = 0;
      v53 = 0;
      v54 = &v53;
      v55 = 0x2020000000;
      v56 = 0;
      objc_msgSend(*(id *)(a1 + 32), "accessory");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "services");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "na_filter:", &__block_literal_global_27);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v52[0] = MEMORY[0x1E0C809B0];
      v52[1] = 3221225472;
      v52[2] = __65__HFProgrammableSwitchAccessoryItem__subclass_updateWithOptions___block_invoke_3;
      v52[3] = &unk_1EA729B98;
      v52[4] = &v53;
      v52[5] = &v57;
      objc_msgSend(v24, "na_each:", v52);

      v31 = v58[3];
      if (v31 && v54[3])
      {
        if (v31 == 1)
          _HFLocalizedStringWithDefaultValue(CFSTR("HFProgrammableSwitchAccessoryUnconfiguredButtonCountSingular"), CFSTR("HFProgrammableSwitchAccessoryUnconfiguredButtonCountSingular"), 1);
        else
          HFLocalizedStringWithFormat(CFSTR("HFProgrammableSwitchAccessoryUnconfiguredButtonCount"), CFSTR("%lu"), v25, v26, v27, v28, v29, v30, v58[3]);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v32, CFSTR("detailedControlDescription"));

      }
      _Block_object_dispose(&v53, 8);
      _Block_object_dispose(&v57, 8);
    }
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("dependentHomeKitObjects"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(v33, "mutableCopy");
  v35 = v34;
  if (v34)
  {
    v36 = v34;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v36 = (id)objc_claimAutoreleasedReturnValue();
  }
  v37 = v36;

  objc_msgSend(*(id *)(a1 + 32), "accessory");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addObject:", v38);

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v37, CFSTR("dependentHomeKitObjects"));
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v39, CFSTR("dependentHomeKitClasses"));

  objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("remoteAccessDependency"));
  objc_msgSend(*(id *)(a1 + 32), "accessory");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "home");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "hf_remoteAccessState");

  if (v42 == 1)
  {
    v43 = CFSTR("HFServiceLongFormErrorProgrammableSwitchAccessoryIsReachableAndThereIsNoResidentDevice");
LABEL_26:
    _HFLocalizedStringWithDefaultValue(v43, v43, 1);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v47, CFSTR("longErrorDescription"));

    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1EA7CBA10, CFSTR("badge"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1EA7CBA28, CFSTR("descriptionBadge"));
    goto LABEL_27;
  }
  objc_msgSend(*(id *)(a1 + 32), "accessory");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "home");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v45, "hf_remoteAccessState");

  if (v46 != 3)
  {
    v43 = CFSTR("HFServiceLongFormErrorProgrammableSwitchAccessoryIsReachableAndResidentDeviceIsNotAvailable");
    goto LABEL_26;
  }
LABEL_27:
  v48 = (void *)MEMORY[0x1E0D519C0];
  +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v5);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "futureWithResult:", v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  return v50;
}

uint64_t __65__HFProgrammableSwitchAccessoryItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = (void *)MEMORY[0x1E0CBA7E0];
  v3 = a2;
  objc_msgSend(v2, "hf_programmableSwitchServiceTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serviceType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "containsObject:", v5);
  return v6;
}

void __65__HFProgrammableSwitchAccessoryItem__subclass_updateWithOptions___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  _QWORD v5[5];

  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  objc_msgSend(a2, "characteristics");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_filter:", &__block_literal_global_13_1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__HFProgrammableSwitchAccessoryItem__subclass_updateWithOptions___block_invoke_5;
  v5[3] = &unk_1EA729B70;
  v5[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v5);

}

uint64_t __65__HFProgrammableSwitchAccessoryItem__subclass_updateWithOptions___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "characteristicType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB8908]);

  return v3;
}

void __65__HFProgrammableSwitchAccessoryItem__subclass_updateWithOptions___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "hf_programmableSwitchValidValueSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(v4, "sortedValues", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v3, "hf_designatedEventTriggerForProgrammableSwitchWithTriggerValue:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {

          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
        continue;
      break;
    }
  }

  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
LABEL_11:

}

- (id)copyWithValueSource:(id)a3
{
  id v4;
  HFProgrammableSwitchAccessoryItem *v5;
  void *v6;
  HFProgrammableSwitchAccessoryItem *v7;

  v4 = a3;
  v5 = [HFProgrammableSwitchAccessoryItem alloc];
  -[HFProgrammableSwitchAccessoryItem accessory](self, "accessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HFProgrammableSwitchAccessoryItem initWithAccessory:valueSource:](v5, "initWithAccessory:valueSource:", v6, v4);

  -[HFItem copyLatestResultsFromItem:](v7, "copyLatestResultsFromItem:", self);
  return v7;
}

- (HMHome)home
{
  void *v2;
  void *v3;

  -[HFProgrammableSwitchAccessoryItem accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HMHome *)v3;
}

- (id)accessories
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[HFProgrammableSwitchAccessoryItem accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSSet)services
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[HFProgrammableSwitchAccessoryItem accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "services");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_filter:", &__block_literal_global_32);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v6;
}

uint64_t __45__HFProgrammableSwitchAccessoryItem_services__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isProgrammableSwitch");
}

- (BOOL)shouldReduceOptionItemsForNotifyingCharacteristics
{
  return 0;
}

- (id)serviceLikeBuilderInHome:(id)a3
{
  id v4;
  HFAccessoryBuilder *v5;
  void *v6;
  HFAccessoryBuilder *v7;

  v4 = a3;
  v5 = [HFAccessoryBuilder alloc];
  -[HFProgrammableSwitchAccessoryItem homeKitObject](self, "homeKitObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HFAccessoryBuilder initWithExistingObject:inHome:](v5, "initWithExistingObject:inHome:", v6, v4);

  return v7;
}

- (BOOL)containsActions
{
  return 0;
}

- (BOOL)actionsMayRequireDeviceUnlock
{
  return 0;
}

- (id)currentStateActionBuildersForHome:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0C99E60], "set", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "futureWithResult:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)namingComponentForHomeKitObject
{
  void *v2;
  void *v3;

  -[HFProgrammableSwitchAccessoryItem accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFNamingComponents namingComponentFromAccessory:](HFNamingComponents, "namingComponentFromAccessory:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMAccessory)accessory
{
  return self->_accessory;
}

- (void)setAccessory:(id)a3
{
  objc_storeStrong((id *)&self->_accessory, a3);
}

- (HFCharacteristicValueSource)valueSource
{
  return self->_valueSource;
}

- (void)setValueSource:(id)a3
{
  objc_storeStrong((id *)&self->_valueSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueSource, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
}

+ (id)itemWithAccessoryRepresentableObject:(id)a3 valueSource:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a4;
  v7 = a3;
  v8 = objc_opt_class();
  objc_msgSend(v7, "hf_homeKitObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v9;
  if (!v10)
    goto LABEL_7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v10;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v8, objc_opt_class());

LABEL_7:
    v12 = 0;
  }

  v15 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAccessory:valueSource:", v12, v6);
  return v15;
}

@end
