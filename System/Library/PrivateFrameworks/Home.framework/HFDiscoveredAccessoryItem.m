@implementation HFDiscoveredAccessoryItem

- (HFDiscoveredAccessoryItem)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithDiscoveredAccessory_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFDiscoveredAccessoryItem.m"), 31, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFDiscoveredAccessoryItem init]",
    v5);

  return 0;
}

- (HFDiscoveredAccessoryItem)initWithDiscoveredAccessory:(id)a3
{
  id v5;
  HFDiscoveredAccessoryItem *v6;
  HFDiscoveredAccessoryItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFDiscoveredAccessoryItem;
  v6 = -[HFDiscoveredAccessoryItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_discoveredAccessory, a3);

  return v7;
}

- (HFDiscoveredAccessoryItem)initWithDiscoveredAccessory:(id)a3 valueSource:(id)a4
{
  id v7;
  HFDiscoveredAccessoryItem *v8;
  HFDiscoveredAccessoryItem *v9;

  v7 = a4;
  v8 = -[HFDiscoveredAccessoryItem initWithDiscoveredAccessory:](self, "initWithDiscoveredAccessory:", a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_valueSource, a4);

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  id v5;

  -[HFDiscoveredAccessoryItem valueSource](self, "valueSource", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HFDiscoveredAccessoryItem copyWithValueSource:](self, "copyWithValueSource:", v4);

  return v5;
}

- (id)namingComponentForHomeKitObject
{
  void *v2;
  void *v3;

  -[HFDiscoveredAccessoryItem discoveredAccessory](self, "discoveredAccessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFNamingComponents namingComponentFromDiscoveredAccessory:](HFNamingComponents, "namingComponentFromDiscoveredAccessory:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)copyWithValueSource:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  -[HFDiscoveredAccessoryItem discoveredAccessory](self, "discoveredAccessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithDiscoveredAccessory:valueSource:", v6, v4);

  objc_msgSend(v7, "copyLatestResultsFromItem:", self);
  return v7;
}

- (HMHome)home
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[HFDiscoveredAccessoryItem discoveredAccessory](self, "discoveredAccessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "home");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (HMHome *)v6;
}

- (NSSet)services
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[HFDiscoveredAccessoryItem discoveredAccessory](self, "discoveredAccessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "services");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = v5;
  else
    v7 = MEMORY[0x1E0C9AA60];
  objc_msgSend(v2, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v8;
}

- (id)accessories
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[HFDiscoveredAccessoryItem discoveredAccessory](self, "discoveredAccessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_setWithSafeObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  void *v5;
  HFMutableItemUpdateOutcome *v6;
  void *v7;
  void *v8;
  HFServiceNameComponents *v9;
  void *v10;
  void *v11;
  HFServiceNameComponents *v12;
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
  int v24;
  HFImageIconDescriptor *v25;
  __CFString **v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  HFImageIconDescriptor *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;

  -[HFDiscoveredAccessoryItem discoveredAccessory](self, "discoveredAccessory", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    NSLog(CFSTR("discoveredAccessory must be set on HFDiscoveredAccessoryItem before requesting an update"));
  -[HFDiscoveredAccessoryItem discoveredAccessory](self, "discoveredAccessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v27 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 30);
    v6 = (HFMutableItemUpdateOutcome *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "futureWithError:", v6);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  v6 = objc_alloc_init(HFMutableItemUpdateOutcome);
  -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", &unk_1EA7CD378, CFSTR("state"));
  -[HFDiscoveredAccessoryItem discoveredAccessory](self, "discoveredAccessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = [HFServiceNameComponents alloc];
    -[HFDiscoveredAccessoryItem discoveredAccessory](self, "discoveredAccessory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[HFServiceNameComponents initWithRawServiceName:rawRoomName:](v9, "initWithRawServiceName:rawRoomName:", v11, 0);

    -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v12, CFSTR("serviceNameComponents"));
    -[HFServiceNameComponents composedString](v12, "composedString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v13, CFSTR("title"));

  }
  v14 = (void *)MEMORY[0x1E0CEA650];
  objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "configurationWithHierarchicalColor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithTextStyle:scale:", *MEMORY[0x1E0CEB5B0], 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "configurationByApplyingConfiguration:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFDiscoveredAccessoryItem discoveredAccessory](self, "discoveredAccessory");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sharingDevice");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "deviceActionType");

  if (v21 == 33 || v21 == 11)
  {
    -[HFDiscoveredAccessoryItem discoveredAccessory](self, "discoveredAccessory");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "sharingDevice");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "deviceModelCode");

    v25 = [HFImageIconDescriptor alloc];
    if (v24 == 5)
      v26 = &HFSymbolIconIdentifierHomePodMiniSingle;
    else
      v26 = &HFSymbolIconIdentifierHomePodSingle;
    goto LABEL_14;
  }
  -[HFDiscoveredAccessoryItem discoveredAccessory](self, "discoveredAccessory");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "sharingDevice");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "deviceActionType");

  if (v31 == 6)
  {
    v25 = [HFImageIconDescriptor alloc];
    v26 = &HFSymbolIconIdentifierAppleTV;
LABEL_14:
    v32 = -[HFImageIconDescriptor initWithSystemImageNamed:configuration:](v25, "initWithSystemImageNamed:configuration:", *v26, v18);
    -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v32, CFSTR("icon"));

  }
  -[HFItemUpdateOutcome objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("icon"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v33)
  {
    -[HFDiscoveredAccessoryItem discoveredAccessory](self, "discoveredAccessory");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "category");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      -[HFDiscoveredAccessoryItem discoveredAccessory](self, "discoveredAccessory");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "category");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      +[HFServiceIconFactory iconDescriptorForAccessoryCategory:](HFServiceIconFactory, "iconDescriptorForAccessoryCategory:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v38, CFSTR("icon"));

    }
  }
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v6);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_19:
  return v28;
}

- (HFCharacteristicValueSource)valueSource
{
  return self->_valueSource;
}

- (HFDiscoveredAccessory)discoveredAccessory
{
  return self->_discoveredAccessory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discoveredAccessory, 0);
  objc_storeStrong((id *)&self->_valueSource, 0);
}

@end
