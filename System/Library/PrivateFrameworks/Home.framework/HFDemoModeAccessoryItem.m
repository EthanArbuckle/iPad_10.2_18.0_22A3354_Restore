@implementation HFDemoModeAccessoryItem

+ (id)itemWithAccessoryRepresentableObject:(id)a3 valueSource:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v5, "hf_homeKitObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v7;
  if (!v8)
    goto LABEL_7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v8;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v6, objc_opt_class());

LABEL_7:
    v10 = 0;
  }

  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAccessory:", v10);
  return v13;
}

+ (id)accessoryItemForAccessory:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAccessory:", v3);

  return v4;
}

- (HFCharacteristicValueSource)valueSource
{
  void *v2;
  void *v3;

  +[HFDemoModeAccessoryManager sharedManager](HFDemoModeAccessoryManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HFCharacteristicValueSource *)v3;
}

- (id)copyWithValueSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  -[HFDemoModeAccessoryItem accessory](self, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithAccessory:", v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  id v5;

  -[HFDemoModeAccessoryItem valueSource](self, "valueSource", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HFDemoModeAccessoryItem copyWithValueSource:](self, "copyWithValueSource:", v4);

  return v5;
}

- (id)serviceLikeBuilderInHome:(id)a3
{
  id v4;
  HFDemoModeAccessoryBuilder *v5;
  void *v6;
  HFDemoModeAccessoryBuilder *v7;

  v4 = a3;
  v5 = [HFDemoModeAccessoryBuilder alloc];
  -[HFDemoModeAccessoryItem accessory](self, "accessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HFDemoModeAccessoryBuilder initWithExistingObject:inHome:](v5, "initWithExistingObject:inHome:", v6, v4);

  return v7;
}

- (HFDemoModeAccessoryItem)initWithAccessory:(id)a3
{
  id v4;
  HFDemoModeAccessoryItem *v5;
  HFDemoModeAccessoryItem *v6;
  id v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFDemoModeAccessoryItem;
  v5 = -[HFDemoModeAccessoryItem init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_accessory, v4);
    v7 = -[HFItem updateWithOptions:](v6, "updateWithOptions:", MEMORY[0x1E0C9AA70]);
  }

  return v6;
}

- (id)hf_serviceNameComponents
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  HFServiceNameComponents *v8;

  -[HFDemoModeAccessoryItem accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFDemoModeAccessoryItem accessory](self, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "room");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[HFServiceNameComponents initWithRawServiceName:rawRoomName:]([HFServiceNameComponents alloc], "initWithRawServiceName:rawRoomName:", v4, v7);
  return v8;
}

- (BOOL)isItemGroup
{
  return 0;
}

- (BOOL)isContainedWithinItemGroup
{
  return 0;
}

- (unint64_t)numberOfItemsContainedWithinGroup
{
  return 1;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  HFDemoModeMediaControlItem *v4;
  HFDemoModeMediaControlItem *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  HFMutableItemUpdateOutcome *v9;
  HFMutableItemUpdateOutcome *v10;
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
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  _BOOL4 v25;
  const __CFString *v26;
  const __CFString *v27;
  __CFString *v28;
  void *v29;
  void *v30;

  v4 = [HFDemoModeMediaControlItem alloc];
  v5 = -[HFDemoModeMediaControlItem initWithDisplayResults:](v4, "initWithDisplayResults:", MEMORY[0x1E0C9AA70]);
  -[HFDemoModeAccessoryItem accessory](self, "accessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFDemoModeMediaControlItem setAccessory:](v5, "setAccessory:", v6);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HFDemoModeAccessoryItem isMediaSystemDemoType](self, "isMediaSystemDemoType"))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v8;
  }
  v9 = [HFMutableItemUpdateOutcome alloc];
  v10 = -[HFItemUpdateOutcome initWithResults:](v9, "initWithResults:", MEMORY[0x1E0C9AA70]);
  -[HFDemoModeAccessoryItem hf_serviceNameComponents](self, "hf_serviceNameComponents");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v7, CFSTR("childItems"));
  -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v11, CFSTR("serviceNameComponents"));
  -[HFDemoModeAccessoryItem _iconDescriptor](self, "_iconDescriptor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v12, CFSTR("icon"));
  if (objc_msgSend(v12, "isSystemImage"))
  {
    objc_msgSend(v12, "imageIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v13, CFSTR("iconNames"));

  }
  objc_msgSend(v11, "rawServiceName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v14, CFSTR("controlDescription"));

  -[HFDemoModeAccessoryItem accessory](self, "accessory");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "room");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "uniqueIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v17, CFSTR("roomIdentifier"));

  -[HFDemoModeAccessoryItem accessory](self, "accessory");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applicationData");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("primaryDisplayState"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v21 = v20;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v22 = v21;
  else
    v22 = 0;
  v23 = v22;

  v24 = objc_msgSend(v23, "integerValue");
  v25 = -[HFDemoModeAccessoryItem isMediaSystemDemoType](self, "isMediaSystemDemoType");
  if (v24 == 2)
  {
    -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", &unk_1EA7CCB08, CFSTR("state"));
    -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", &unk_1EA7CCB08, CFSTR("value"));
    v26 = CFSTR("HFCharacteristicValuePowerStateOn");
    v27 = CFSTR("HFMediaAccessoryStateDescriptionPlaying");
  }
  else
  {
    -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", &unk_1EA7CCB20, CFSTR("state"));
    -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", &unk_1EA7CCB20, CFSTR("value"));
    v26 = CFSTR("HFCharacteristicValuePowerStateOff");
    v27 = CFSTR("HFMediaAccessoryStateDescriptionPaused");
  }
  if (v25)
    v28 = (__CFString *)v27;
  else
    v28 = (__CFString *)v26;
  _HFLocalizedStringWithDefaultValue(v28, v28, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMutableItemUpdateOutcome setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v29, CFSTR("description"));

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v10);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

- (HMHome)home
{
  void *v2;
  void *v3;

  -[HFDemoModeAccessoryItem accessory](self, "accessory");
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
  -[HFDemoModeAccessoryItem accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSSet)services
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (BOOL)isMediaSystemDemoType
{
  void *v3;
  void *v4;
  void *v5;

  if (qword_1ED378668 != -1)
    dispatch_once(&qword_1ED378668, &__block_literal_global_160);
  -[HFDemoModeAccessoryItem accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applicationData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend((id)_MergedGlobals_3_2, "containsObject:", v5);
  return (char)v3;
}

void __48__HFDemoModeAccessoryItem_isMediaSystemDemoType__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[6];

  v2[5] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("HomePod");
  v2[1] = CFSTR("HomePodMini");
  v2[2] = CFSTR("MediaSystem-HomePod");
  v2[3] = CFSTR("MediaSystem-HomePodMini");
  v2[4] = CFSTR("AppleTV");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 5);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_3_2;
  _MergedGlobals_3_2 = v0;

}

- (id)namingComponentForHomeKitObject
{
  void *v2;
  void *v3;

  -[HFDemoModeAccessoryItem accessory](self, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFNamingComponents namingComponentFromHomeKitObject:](HFNamingComponents, "namingComponentFromHomeKitObject:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_iconDescriptor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HFImageIconDescriptor *v11;
  const __CFString *v12;
  HFImageIconDescriptor *v13;
  void *v15;
  void *v16;
  void *v17;

  v3 = (void *)MEMORY[0x1E0CEA650];
  objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configurationWithHierarchicalColor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithTextStyle:scale:", *MEMORY[0x1E0CEB5B0], 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configurationByApplyingConfiguration:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFDemoModeAccessoryItem accessory](self, "accessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "applicationData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("type"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "isEqualToString:", CFSTR("AppleTV")))
  {
    v11 = [HFImageIconDescriptor alloc];
    v12 = CFSTR("appletv.fill");
  }
  else if (objc_msgSend(v10, "isEqualToString:", CFSTR("HomePod")))
  {
    v11 = [HFImageIconDescriptor alloc];
    v12 = CFSTR("homepod.fill");
  }
  else if (objc_msgSend(v10, "isEqualToString:", CFSTR("HomePodMini")))
  {
    v11 = [HFImageIconDescriptor alloc];
    v12 = CFSTR("homepodmini.fill");
  }
  else if (objc_msgSend(v10, "isEqualToString:", CFSTR("MediaSystem-HomePod")))
  {
    v11 = [HFImageIconDescriptor alloc];
    v12 = CFSTR("homepod.2.fill");
  }
  else
  {
    if (!objc_msgSend(v10, "isEqualToString:", CFSTR("MediaSystem-HomePodMini")))
    {
      -[HFDemoModeAccessoryItem accessory](self, "accessory");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "applicationData");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "dictionary");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[HFDemoModeAccessoryManager imageIconDescriptorFromDictionary:](HFDemoModeAccessoryManager, "imageIconDescriptorFromDictionary:", v17);
      v13 = (HFImageIconDescriptor *)objc_claimAutoreleasedReturnValue();

      goto LABEL_12;
    }
    v11 = [HFImageIconDescriptor alloc];
    v12 = CFSTR("homepodmini.2.fill");
  }
  v13 = -[HFImageIconDescriptor initWithSystemImageNamed:configuration:](v11, "initWithSystemImageNamed:configuration:", v12, v7);
LABEL_12:

  return v13;
}

- (HMAccessory)accessory
{
  return (HMAccessory *)objc_loadWeakRetained((id *)&self->_accessory);
}

- (void)setAccessory:(id)a3
{
  objc_storeWeak((id *)&self->_accessory, a3);
}

- (NSDictionary)configInfo
{
  return self->_configInfo;
}

- (void)setConfigInfo:(id)a3
{
  objc_storeStrong((id *)&self->_configInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configInfo, 0);
  objc_destroyWeak((id *)&self->_accessory);
}

@end
