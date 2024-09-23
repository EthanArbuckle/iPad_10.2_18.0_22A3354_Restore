@implementation HFAccessoryBuilderItem

- (HFAccessoryBuilderItem)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithAccessoryBuilder_valueSource_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFAccessoryBuilderItem.m"), 32, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFAccessoryBuilderItem init]",
    v5);

  return 0;
}

- (HFAccessoryBuilderItem)initWithAccessoryBuilder:(id)a3 valueSource:(id)a4
{
  id v6;
  id v7;
  HFAccessoryBuilderItem *v8;
  HFAccessoryBuilderItem *v9;
  void *v10;
  int v11;
  __objc2_class *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  HFCameraItem *v18;
  void *v19;
  HFCameraItem *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  HFMediaAccessoryItem *v25;
  HFMediaAccessoryItem *v26;
  objc_super v28;

  v6 = a3;
  v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)HFAccessoryBuilderItem;
  v8 = -[HFAccessoryBuilderItem init](&v28, sel_init);
  v9 = v8;
  if (v8)
  {
    -[HFAccessoryBuilderItem setAccessoryBuilder:](v8, "setAccessoryBuilder:", v6);
    objc_msgSend(v6, "accessory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "hf_isProgrammableSwitch");

    if (v11)
    {
      v12 = HFProgrammableSwitchAccessoryItem;
    }
    else
    {
      objc_msgSend(v6, "accessory");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "hf_isCamera");

      if (v17)
      {
        v18 = [HFCameraItem alloc];
        objc_msgSend(v6, "accessory");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "cameraProfiles");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "firstObject");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = -[HFAccessoryProfileItem initWithProfile:valueSource:](v18, "initWithProfile:valueSource:", v19, v7);
        -[HFAccessoryBuilderItem setAccessoryItem:](v9, "setAccessoryItem:", v20);

        goto LABEL_11;
      }
      objc_msgSend(v6, "accessory");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "hf_isRemoteControl");

      if (v22)
      {
        v12 = HFTargetControlAccessoryItem;
      }
      else
      {
        objc_msgSend(v6, "accessory");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "mediaProfile");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          v25 = [HFMediaAccessoryItem alloc];
          objc_msgSend(v6, "accessory");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "mediaProfile");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = -[HFMediaAccessoryItem initWithValueSource:mediaProfileContainer:](v25, "initWithValueSource:mediaProfileContainer:", v7, v15);
          -[HFAccessoryBuilderItem setAccessoryItem:](v9, "setAccessoryItem:", v26);

          goto LABEL_11;
        }
        v12 = HFAccessoryItem;
      }
    }
    v13 = [v12 alloc];
    objc_msgSend(v6, "accessory");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithAccessory:valueSource:", v14, v7);
    -[HFAccessoryBuilderItem setAccessoryItem:](v9, "setAccessoryItem:", v15);
LABEL_11:

  }
  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  id v5;

  -[HFAccessoryBuilderItem valueSource](self, "valueSource", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HFAccessoryBuilderItem copyWithValueSource:](self, "copyWithValueSource:", v4);

  return v5;
}

- (id)copyWithValueSource:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  -[HFAccessoryBuilderItem accessoryBuilder](self, "accessoryBuilder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithAccessoryBuilder:valueSource:", v6, v4);

  objc_msgSend(v7, "copyLatestResultsFromItem:", self);
  return v7;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  v4 = a3;
  -[HFAccessoryBuilderItem accessoryItem](self, "accessoryItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateWithOptions:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__HFAccessoryBuilderItem__subclass_updateWithOptions___block_invoke;
  v9[3] = &unk_1EA7289C8;
  v9[4] = self;
  objc_msgSend(v6, "flatMap:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __54__HFAccessoryBuilderItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  HFServiceNameComponents *v7;
  void *v8;
  void *v9;
  void *v10;
  HFServiceNameComponents *v11;
  void *v12;
  void *v13;

  objc_msgSend(a2, "results");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFItemUpdateOutcome outcomeWithResults:](HFMutableItemUpdateOutcome, "outcomeWithResults:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "accessoryBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "room");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = [HFServiceNameComponents alloc];
  objc_msgSend(*(id *)(a1 + 32), "accessoryBuilder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HFServiceNameComponents initWithRawServiceName:rawRoomName:](v7, "initWithRawServiceName:rawRoomName:", v9, v10);

  if (v11)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("serviceNameComponents"));
    -[HFServiceNameComponents composedString](v11, "composedString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("title"));

  }
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (HFHomeKitObject)homeKitObject
{
  void *v2;
  void *v3;

  -[HFAccessoryBuilderItem accessoryItem](self, "accessoryItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeKitObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HFHomeKitObject *)v3;
}

- (NSSet)services
{
  void *v2;
  void *v3;

  -[HFAccessoryBuilderItem accessoryItem](self, "accessoryItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "services");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (id)accessories
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[HFAccessoryBuilderItem accessoryBuilder](self, "accessoryBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (HFCharacteristicValueSource)valueSource
{
  void *v2;
  void *v3;

  -[HFAccessoryBuilderItem accessoryItem](self, "accessoryItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HFCharacteristicValueSource *)v3;
}

- (id)namingComponentForHomeKitObject
{
  void *v2;
  void *v3;
  void *v4;

  -[HFAccessoryBuilderItem accessoryItem](self, "accessoryItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeKitObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFNamingComponents namingComponentFromHomeKitObject:](HFNamingComponents, "namingComponentFromHomeKitObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (HMHome)home
{
  return self->_home;
}

- (HFAccessoryBuilder)accessoryBuilder
{
  return self->_accessoryBuilder;
}

- (void)setAccessoryBuilder:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryBuilder, a3);
}

- (HFServiceLikeItem)accessoryItem
{
  return self->_accessoryItem;
}

- (void)setAccessoryItem:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryItem, 0);
  objc_storeStrong((id *)&self->_accessoryBuilder, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

@end
