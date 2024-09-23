@implementation HFServiceLikeItemUpdateRequest

- (HFServiceLikeItemUpdateRequest)initWithService:(id)a3 valueSource:(id)a4 characteristics:(id)a5
{
  id v9;
  id v10;
  id v11;
  HFServiceLikeItemUpdateRequest *v12;
  id *p_isa;
  HFServiceLikeItemUpdateRequest *v14;
  NSObject *v15;
  objc_super v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9 && v10)
  {
    v17.receiver = self;
    v17.super_class = (Class)HFServiceLikeItemUpdateRequest;
    v12 = -[HFServiceLikeItemUpdateRequest init](&v17, sel_init);
    p_isa = (id *)&v12->super.isa;
    if (v12)
    {
      objc_storeStrong((id *)&v12->_service, a3);
      objc_storeStrong(p_isa + 3, a4);
      objc_storeStrong(p_isa + 4, a5);
    }
    self = p_isa;
    v14 = self;
  }
  else
  {
    HFLogForCategory(0x29uLL);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v19 = v9;
      v20 = 2112;
      v21 = v10;
      _os_log_error_impl(&dword_1DD34E000, v15, OS_LOG_TYPE_ERROR, "HFServiceLikeItemUpdateRequest cannot init with nil service %@ or nil valueSource %@", buf, 0x16u);
    }

    v14 = 0;
  }

  return v14;
}

id __52__HFServiceLikeItemUpdateRequest_updateWithOptions___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  HFServiceLikeItemUpdateResponse *v8;
  void *v9;

  v3 = a2;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_displayMetadataForReadResponse:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_standardResultsForReadResponse:displayMetadata:batteryLevelResults:updateOptions:", v4, v6, v5, *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HFServiceLikeItemUpdateResponse initWithDisplayMetadata:readResponse:standardResults:]([HFServiceLikeItemUpdateResponse alloc], "initWithDisplayMetadata:readResponse:standardResults:", v6, v4, v7);
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_standardResultsForReadResponse:(id)a3 displayMetadata:(id)a4 batteryLevelResults:(id)a5 updateOptions:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[HFServiceLikeItemUpdateRequest service](self, "service");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (!v14)
  {
    -[HFServiceLikeItemUpdateRequest accessory](self, "accessory");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[HFServiceLikeItemUpdateRequest accessory](self, "accessory");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFServiceLikeItemUpdateRequest valueSource](self, "valueSource");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFServiceLikeItemResultFactory populateStandardResultsForHomeKitObject:withBackingAccessory:displayMetadata:readResponse:batteryLevelResults:valueSource:updateOptions:](HFServiceLikeItemResultFactory, "populateStandardResultsForHomeKitObject:withBackingAccessory:displayMetadata:readResponse:batteryLevelResults:valueSource:updateOptions:", v15, v16, v12, v13, v11, v17, v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  return v18;
}

- (HMAccessory)accessory
{
  HMAccessory *accessory;
  HMAccessory *v3;
  void *v4;

  accessory = self->_accessory;
  if (accessory)
  {
    v3 = accessory;
  }
  else
  {
    -[HFServiceLikeItemUpdateRequest service](self, "service");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessory");
    v3 = (HMAccessory *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)_displayMetadataForReadResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];

  v4 = a3;
  -[HFServiceLikeItemUpdateRequest service](self, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HFServiceLikeItemUpdateRequest service](self, "service");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFCharacteristicValueDisplayMetadata displayMetadataForService:characteristicReadResponse:](HFCharacteristicValueDisplayMetadata, "displayMetadataForService:characteristicReadResponse:", v6, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HFServiceLikeItemUpdateRequest accessory](self, "accessory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __66__HFServiceLikeItemUpdateRequest__displayMetadataForReadResponse___block_invoke;
      v12[3] = &unk_1EA737B78;
      v12[4] = self;
      __66__HFServiceLikeItemUpdateRequest__displayMetadataForReadResponse___block_invoke((uint64_t)v12);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFServiceLikeItemUpdateRequest accessory](self, "accessory");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[HFCharacteristicValueDisplayMetadata displayMetadataForAccessory:withContextProvider:](HFCharacteristicValueDisplayMetadata, "displayMetadataForAccessory:withContextProvider:", v10, v9);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      NSLog(CFSTR("no accessory or service for update request %@!"), self);
      v7 = 0;
    }
  }

  return v7;
}

- (id)updateWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  HFAccessoryBatteryLevelItem *v12;
  void *v13;
  void *v14;
  HFAccessoryBatteryLevelItem *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  _QWORD v27[5];
  id v28;
  _QWORD v29[5];
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HFServiceLikeItemUpdateRequest characteristics](self, "characteristics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  -[HFServiceLikeItemUpdateRequest service](self, "service");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = MEMORY[0x1E0C809B0];
  if (v7)
  {
    -[HFServiceLikeItemUpdateRequest service](self, "service");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hf_requiredCharacteristicTypesForDisplayMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v8;
    v29[1] = 3221225472;
    v29[2] = __52__HFServiceLikeItemUpdateRequest_updateWithOptions___block_invoke;
    v29[3] = &unk_1EA737B30;
    v29[4] = self;
    objc_msgSend(v10, "na_map:", v29);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unionSet:", v11);

  }
  v12 = [HFAccessoryBatteryLevelItem alloc];
  -[HFServiceLikeItemUpdateRequest accessory](self, "accessory");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFServiceLikeItemUpdateRequest valueSource](self, "valueSource");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HFAccessoryBatteryLevelItem initWithAccessory:valueSource:](v12, "initWithAccessory:valueSource:", v13, v14);

  v16 = (void *)objc_msgSend(v4, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("batteryLow"), CFSTR("batteryPercentage"), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, CFSTR("accessoryBatteryDesiredKeys"));

  -[HFItem updateWithOptions:](v15, "updateWithOptions:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "recover:", &__block_literal_global_137);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFServiceLikeItemUpdateRequest valueSource](self, "valueSource");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "readValuesForCharacteristics:", v6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v21;
  v30[1] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D519C0], "combineAllFutures:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v8;
  v27[1] = 3221225472;
  v27[2] = __52__HFServiceLikeItemUpdateRequest_updateWithOptions___block_invoke_3;
  v27[3] = &unk_1EA736B00;
  v27[4] = self;
  v28 = v4;
  v24 = v4;
  objc_msgSend(v23, "flatMap:", v27);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (HMService)service
{
  return self->_service;
}

- (HFCharacteristicValueSource)valueSource
{
  return self->_valueSource;
}

- (NSSet)characteristics
{
  return self->_characteristics;
}

id __66__HFServiceLikeItemUpdateRequest__displayMetadataForReadResponse___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "valueSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  v4 = *(void **)(a1 + 32);
  if ((v3 & 1) != 0)
  {
    objc_msgSend(v4, "valueSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contextProvider");
  }
  else
  {
    objc_msgSend(v4, "accessory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "home");
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __52__HFServiceLikeItemUpdateRequest_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hf_characteristicOfType:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characteristics, 0);
  objc_storeStrong((id *)&self->_valueSource, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
}

- (HFServiceLikeItemUpdateRequest)initWithAccessory:(id)a3 valueSource:(id)a4 characteristics:(id)a5
{
  id v9;
  id v10;
  id v11;
  HFServiceLikeItemUpdateRequest *v12;
  HFServiceLikeItemUpdateRequest *v13;
  NSSet *v14;
  NSObject *v15;
  HFServiceLikeItemUpdateRequest *v16;
  NSSet *characteristics;
  objc_super v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9 && v10)
  {
    v19.receiver = self;
    v19.super_class = (Class)HFServiceLikeItemUpdateRequest;
    v12 = -[HFServiceLikeItemUpdateRequest init](&v19, sel_init);
    v13 = v12;
    if (v12)
    {
      objc_storeStrong((id *)&v12->_accessory, a3);
      objc_storeStrong((id *)&v13->_valueSource, a4);
      if (v11)
      {
        v14 = (NSSet *)v11;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E60], "set");
        v14 = (NSSet *)objc_claimAutoreleasedReturnValue();
      }
      characteristics = v13->_characteristics;
      v13->_characteristics = v14;

    }
    self = v13;
    v16 = self;
  }
  else
  {
    HFLogForCategory(0x29uLL);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v21 = v9;
      v22 = 2112;
      v23 = v10;
      _os_log_error_impl(&dword_1DD34E000, v15, OS_LOG_TYPE_ERROR, "HFServiceLikeItemUpdateRequest cannot init with nil accessory %@ or nil valueSource %@", buf, 0x16u);
    }

    v16 = 0;
  }

  return v16;
}

- (HFServiceLikeItemUpdateRequest)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithService_valueSource_characteristics_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFServiceLikeItem.m"), 105, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFServiceLikeItemUpdateRequest init]",
    v5);

  return 0;
}

uint64_t __52__HFServiceLikeItemUpdateRequest_updateWithOptions___block_invoke_2()
{
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", MEMORY[0x1E0C9AA70]);
}

- (void)setAccessory:(id)a3
{
  objc_storeStrong((id *)&self->_accessory, a3);
}

- (void)setService:(id)a3
{
  objc_storeStrong((id *)&self->_service, a3);
}

- (void)setValueSource:(id)a3
{
  objc_storeStrong((id *)&self->_valueSource, a3);
}

- (void)setCharacteristics:(id)a3
{
  objc_storeStrong((id *)&self->_characteristics, a3);
}

@end
