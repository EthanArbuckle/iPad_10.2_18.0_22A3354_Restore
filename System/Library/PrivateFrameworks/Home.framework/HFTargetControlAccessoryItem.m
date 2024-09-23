@implementation HFTargetControlAccessoryItem

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

- (HFTargetControlAccessoryItem)initWithAccessory:(id)a3 valueSource:(id)a4
{
  id v7;
  id v8;
  HFTargetControlAccessoryItem *v9;
  HFTargetControlAccessoryItem *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HFTargetControlAccessoryItem;
  v9 = -[HFTargetControlAccessoryItem init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accessory, a3);
    objc_storeStrong((id *)&v10->_valueSource, a4);
  }

  return v10;
}

- (HFTargetControlAccessoryItem)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithAccessory_valueSource_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFTargetControlAccessoryItem.m"), 38, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFTargetControlAccessoryItem init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  id v5;

  -[HFTargetControlAccessoryItem valueSource](self, "valueSource", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HFTargetControlAccessoryItem copyWithValueSource:](self, "copyWithValueSource:", v4);

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
  HFTargetControlAccessoryItem *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = [HFServiceLikeItemUpdateRequest alloc];
  -[HFTargetControlAccessoryItem accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFTargetControlAccessoryItem valueSource](self, "valueSource");
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
    v19[2] = __60__HFTargetControlAccessoryItem__subclass_updateWithOptions___block_invoke;
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
      -[HFTargetControlAccessoryItem accessory](self, "accessory");
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

id __60__HFTargetControlAccessoryItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __CFString **v7;
  __CFString *v8;
  HFCAPackageIconDescriptor *v9;
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
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  objc_msgSend(a2, "standardResults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("state"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  v7 = &HFCAPackageStateOn;
  if (v6 != 2)
    v7 = &HFCAPackageStateOff;
  v8 = *v7;
  v9 = -[HFCAPackageIconDescriptor initWithPackageIdentifier:state:]([HFCAPackageIconDescriptor alloc], "initWithPackageIdentifier:state:", CFSTR("HFCAPackageIconIdentifierRemoteControl"), v8);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("icon"));

  objc_msgSend(*(id *)(a1 + 32), "accessory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "room");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "uniqueIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v12, CFSTR("roomIdentifier"));

  objc_msgSend(*(id *)(a1 + 32), "accessory");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "hf_serviceNameComponents");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("serviceNameComponents"));
    objc_msgSend(v14, "composedString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("title"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("controlDescription"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("controlDescription"));

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dependentHomeKitObjects"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "mutableCopy");
  v19 = v18;
  if (v18)
  {
    v20 = v18;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v20 = (id)objc_claimAutoreleasedReturnValue();
  }
  v21 = v20;

  objc_msgSend(*(id *)(a1 + 32), "accessory");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addObject:", v22);

  objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, CFSTR("dependentHomeKitObjects"));
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v23, CFSTR("dependentHomeKitClasses"));

  objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("remoteAccessDependency"));
  v24 = (void *)MEMORY[0x1E0D519C0];
  +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "futureWithResult:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (id)copyWithValueSource:(id)a3
{
  id v4;
  HFTargetControlAccessoryItem *v5;
  void *v6;
  HFTargetControlAccessoryItem *v7;

  v4 = a3;
  v5 = [HFTargetControlAccessoryItem alloc];
  -[HFTargetControlAccessoryItem accessory](self, "accessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HFTargetControlAccessoryItem initWithAccessory:valueSource:](v5, "initWithAccessory:valueSource:", v6, v4);

  -[HFItem copyLatestResultsFromItem:](v7, "copyLatestResultsFromItem:", self);
  return v7;
}

- (id)iconDescriptor
{
  return -[HFCAPackageIconDescriptor initWithPackageIdentifier:]([HFCAPackageIconDescriptor alloc], "initWithPackageIdentifier:", CFSTR("HFCAPackageIconIdentifierRemoteControl"));
}

- (HMHome)home
{
  void *v2;
  void *v3;

  -[HFTargetControlAccessoryItem accessory](self, "accessory");
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
  -[HFTargetControlAccessoryItem accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSSet)services
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "set");
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
  -[HFTargetControlAccessoryItem homeKitObject](self, "homeKitObject");
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

  -[HFTargetControlAccessoryItem accessory](self, "accessory");
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

@end
