@implementation HFGenericAccessoryItem

- (HFGenericAccessoryItem)initWithAccessory:(id)a3 valueSource:(id)a4
{
  id v7;
  id v8;
  HFGenericAccessoryItem *v9;
  HFGenericAccessoryItem *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HFGenericAccessoryItem;
  v9 = -[HFGenericAccessoryItem init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accessory, a3);
    objc_storeStrong((id *)&v10->_valueSource, a4);
  }

  return v10;
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
  HFGenericAccessoryItem *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = [HFServiceLikeItemUpdateRequest alloc];
  -[HFGenericAccessoryItem accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFGenericAccessoryItem valueSource](self, "valueSource");
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
    v19[2] = __54__HFGenericAccessoryItem__subclass_updateWithOptions___block_invoke;
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
      -[HFGenericAccessoryItem accessory](self, "accessory");
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

id __54__HFGenericAccessoryItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HFImageIconDescriptor *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[4];
  _QWORD v22[5];

  v22[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "standardResults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(*(id *)(a1 + 32), "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "hf_requiresFirmwareUpdate"))
    v6 = CFSTR("HFServiceLongFormErrorDoesNotSupportNotifications");
  else
    v6 = CFSTR("HFServiceLongFormErrorAccessoryTypeNotSupported");
  _HFLocalizedStringWithDefaultValue(v6, v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "accessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "room");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v10, CFSTR("roomIdentifier"));

  v21[0] = CFSTR("description");
  _HFLocalizedStringWithDefaultValue(CFSTR("HFServiceDescriptionAccessoryNotSupported"), CFSTR("HFServiceDescriptionAccessoryNotSupported"), 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v11;
  v22[1] = v7;
  v21[1] = CFSTR("longErrorDescription");
  v21[2] = CFSTR("state");
  v22[2] = &unk_1EA7CB650;
  v21[3] = CFSTR("icon");
  v12 = -[HFImageIconDescriptor initWithImageIdentifier:]([HFImageIconDescriptor alloc], "initWithImageIdentifier:", CFSTR("HFImageIconIdentifierGeneric"));
  v22[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEntriesFromDictionary:", v13);

  objc_msgSend(*(id *)(a1 + 32), "accessory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "hf_serviceNameComponents");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("serviceNameComponents"));
    objc_msgSend(v15, "composedString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("title"));

  }
  v17 = (void *)MEMORY[0x1E0D519C0];
  +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "futureWithResult:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  id v5;

  -[HFGenericAccessoryItem valueSource](self, "valueSource", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HFGenericAccessoryItem copyWithValueSource:](self, "copyWithValueSource:", v4);

  return v5;
}

- (id)copyWithValueSource:(id)a3
{
  id v4;
  HFGenericAccessoryItem *v5;
  void *v6;
  HFGenericAccessoryItem *v7;

  v4 = a3;
  v5 = [HFGenericAccessoryItem alloc];
  -[HFGenericAccessoryItem accessory](self, "accessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HFGenericAccessoryItem initWithAccessory:valueSource:](v5, "initWithAccessory:valueSource:", v6, v4);

  -[HFItem copyLatestResultsFromItem:](v7, "copyLatestResultsFromItem:", self);
  return v7;
}

- (HMHome)home
{
  void *v2;
  void *v3;

  -[HFGenericAccessoryItem accessory](self, "accessory");
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
  -[HFGenericAccessoryItem accessory](self, "accessory");
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

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[HFGenericAccessoryItem accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "services");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v5;
}

- (id)serviceLikeBuilderInHome:(id)a3
{
  id v4;
  HFAccessoryBuilder *v5;
  void *v6;
  HFAccessoryBuilder *v7;

  v4 = a3;
  v5 = [HFAccessoryBuilder alloc];
  -[HFGenericAccessoryItem homeKitObject](self, "homeKitObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HFAccessoryBuilder initWithExistingObject:inHome:](v5, "initWithExistingObject:inHome:", v6, v4);

  return v7;
}

- (id)namingComponentForHomeKitObject
{
  void *v2;
  void *v3;

  -[HFGenericAccessoryItem accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFNamingComponents namingComponentFromAccessory:](HFNamingComponents, "namingComponentFromAccessory:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HFCharacteristicValueSource)valueSource
{
  return self->_valueSource;
}

- (HMAccessory)accessory
{
  return self->_accessory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_valueSource, 0);
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
