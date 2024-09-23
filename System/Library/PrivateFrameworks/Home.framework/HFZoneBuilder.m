@implementation HFZoneBuilder

+ (Class)homeKitRepresentationClass
{
  return (Class)objc_opt_class();
}

- (HFZoneBuilder)initWithExistingObject:(id)a3 inHome:(id)a4
{
  HFZoneBuilder *v5;
  HFZoneBuilder *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  HFMutableSetDiff *v14;
  HFMutableSetDiff *roomUUIDs;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)HFZoneBuilder;
  v5 = -[HFItemBuilder initWithExistingObject:inHome:](&v17, sel_initWithExistingObject_inHome_, a3, a4);
  v6 = v5;
  if (v5)
  {
    -[HFZoneBuilder zone](v5, "zone");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "name");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8)
      v10 = (__CFString *)v8;
    else
      v10 = &stru_1EA741FF8;
    objc_storeStrong((id *)&v6->_name, v10);

    if (a3)
    {
      -[HFZoneBuilder zone](v6, "zone");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "rooms");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      HFHomeKitObjectUniqueIdentifiers(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v14 = -[HFMutableSetDiff initWithFromSet:]([HFMutableSetDiff alloc], "initWithFromSet:", v13);
    roomUUIDs = v6->_roomUUIDs;
    v6->_roomUUIDs = v14;

  }
  return v6;
}

- (void)addRoom:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[HFZoneBuilder roomUUIDs](self, "roomUUIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsObject:", v6);

  if ((v7 & 1) == 0)
  {
    -[HFZoneBuilder roomUUIDs](self, "roomUUIDs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "uniqueIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v9);

  }
}

- (void)removeRoom:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[HFZoneBuilder roomUUIDs](self, "roomUUIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsObject:", v6);

  if (v7)
  {
    -[HFZoneBuilder roomUUIDs](self, "roomUUIDs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "uniqueIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deleteObject:", v9);

  }
}

- (NSSet)rooms
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[HFZoneBuilder roomUUIDs](self, "roomUUIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "toSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __22__HFZoneBuilder_rooms__block_invoke;
  v7[3] = &unk_1EA72B548;
  v7[4] = self;
  objc_msgSend(v4, "na_map:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v5;
}

id __22__HFZoneBuilder_rooms__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hf_roomWithIdentifier:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_performValidation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D519C0];
  -[HFItemBuilder lazy_verifyPropertyIsSet:](self, "lazy_verifyPropertyIsSet:", CFSTR("name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  -[HFZoneBuilder name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemBuilder lazy_verifyNameIsNotEmpty:](self, "lazy_verifyNameIsNotEmpty:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "chainFutures:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)commitItem
{
  NSObject *v3;
  void *v4;
  __CFString **v5;
  __CFString *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  __CFString *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id location;
  uint8_t buf[4];
  HFZoneBuilder *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  HFLogForCategory(0x28uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v26 = self;
    _os_log_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_DEFAULT, "HFZoneBuilder: Starting a commit %@", buf, 0xCu);
  }

  -[HFZoneBuilder zone](self, "zone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = HFOperationEditZone;
  if (!v4)
    v5 = HFOperationAddZone;
  v6 = *v5;

  -[HFZoneBuilder _performValidation](self, "_performValidation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __27__HFZoneBuilder_commitItem__block_invoke;
  v22[3] = &unk_1EA727DB0;
  objc_copyWeak(&v23, &location);
  objc_msgSend(v7, "flatMap:", v22);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v8;
  v20[1] = 3221225472;
  v20[2] = __27__HFZoneBuilder_commitItem__block_invoke_2;
  v20[3] = &unk_1EA727DB0;
  objc_copyWeak(&v21, &location);
  objc_msgSend(v9, "flatMap:", v20);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v8;
  v17[1] = 3221225472;
  v17[2] = __27__HFZoneBuilder_commitItem__block_invoke_3;
  v17[3] = &unk_1EA73E390;
  objc_copyWeak(&v19, &location);
  v11 = v6;
  v18 = v11;
  objc_msgSend(v10, "recover:", v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __27__HFZoneBuilder_commitItem__block_invoke_4;
  v15[3] = &unk_1EA727DB0;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v12, "flatMap:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v16);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
  return v13;
}

id __27__HFZoneBuilder_commitItem__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "zone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "zone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isEqualToString:", v5);

  if ((v6 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "roomUUIDs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "toSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFSetDiff diffFromSet:toSet:](HFMutableSetDiff, "diffFromSet:toSet:", v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setRoomUUIDs:", v11);

    goto LABEL_5;
  }
  if (!v2)
  {
LABEL_5:
    objc_msgSend(WeakRetained, "_createZone");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  objc_msgSend(WeakRetained, "_updateName");
  v7 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v12 = (void *)v7;

  return v12;
}

id __27__HFZoneBuilder_commitItem__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateRooms");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id __27__HFZoneBuilder_commitItem__block_invoke_3(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v6 = (void *)MEMORY[0x1E0D519C0];
  v7 = *(_QWORD *)(a1 + 32);
  objc_msgSend(WeakRetained, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hf_errorWithOperationType:failedItemName:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "futureWithError:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __27__HFZoneBuilder_commitItem__block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(WeakRetained, "zone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "futureWithResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_createZone
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  _QWORD v9[5];

  v3 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __28__HFZoneBuilder__createZone__block_invoke;
  v9[3] = &unk_1EA7268F0;
  v9[4] = self;
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithCompletionHandlerAdapterBlock:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "addFailureBlock:", &__block_literal_global_213);
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __28__HFZoneBuilder__createZone__block_invoke_16;
  v8[3] = &unk_1EA73E3D8;
  v8[4] = self;
  objc_msgSend(v4, "flatMap:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __28__HFZoneBuilder__createZone__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory(0x28uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "home");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "HFZoneBuilder: Creating zone with name %@ in home %@", (uint8_t *)&v9, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addZoneWithName:completionHandler:", v8, v3);

}

void __28__HFZoneBuilder__createZone__block_invoke_11(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  HFLogForCategory(0x28uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = v2;
    _os_log_error_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_ERROR, "HFZoneBuilder: Zone creation failed with error %@", (uint8_t *)&v5, 0xCu);
  }

  +[HFErrorHandler sharedHandler](HFErrorHandler, "sharedHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logError:operationDescription:", v2, CFSTR("HFZoneBuilder.addZone"));

}

id __28__HFZoneBuilder__createZone__block_invoke_16(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  uint8_t buf[16];

  v3 = a2;
  HFLogForCategory(0x28uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "HFZoneBuilder: Zone creation successful", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "setZone:", v3);
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __28__HFZoneBuilder__createZone__block_invoke_18;
  v8[3] = &unk_1EA726918;
  v8[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v5, "dispatchHomeObserverMessage:sender:", v8, 0);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __28__HFZoneBuilder__createZone__block_invoke_18(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "home");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "zone");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "home:didAddZone:", v3, v4);

  }
}

- (id)_updateName
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD v16[5];
  _QWORD v17[5];
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0x28uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[HFZoneBuilder name](self, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFItemBuilder home](self, "home");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v19 = v4;
    v20 = 2112;
    v21 = v5;
    _os_log_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_DEFAULT, "HFZoneBuilder: Updating zone with name %@ in home %@", buf, 0x16u);

  }
  -[HFZoneBuilder zone](self, "zone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFZoneBuilder name](self, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
  {
    HFLogForCategory(0x28uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD34E000, v10, OS_LOG_TYPE_DEFAULT, "HFZoneBuilder: Skipping the name update", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", MEMORY[0x1E0C9AAB0]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __28__HFZoneBuilder__updateName__block_invoke;
    v17[3] = &unk_1EA7268C8;
    v17[4] = self;
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithErrorOnlyHandlerAdapterBlock:", v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)objc_msgSend(v13, "addFailureBlock:", &__block_literal_global_24_10);
    v16[0] = v12;
    v16[1] = 3221225472;
    v16[2] = __28__HFZoneBuilder__updateName__block_invoke_27;
    v16[3] = &unk_1EA726940;
    v16[4] = self;
    objc_msgSend(v13, "flatMap:", v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

void __28__HFZoneBuilder__updateName__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "zone");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateName:completionHandler:", v5, v4);

}

void __28__HFZoneBuilder__updateName__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  HFLogForCategory(0x28uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = v2;
    _os_log_error_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_ERROR, "HFZoneBuilder: Zone name change failed with error %@", (uint8_t *)&v5, 0xCu);
  }

  +[HFErrorHandler sharedHandler](HFErrorHandler, "sharedHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logError:operationDescription:", v2, CFSTR("HFRoomBuilder.updateName"));

}

id __28__HFZoneBuilder__updateName__block_invoke_27(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  uint8_t buf[16];

  v3 = a2;
  HFLogForCategory(0x28uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "HFZoneBuilder: Zone name change successful", buf, 2u);
  }

  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __28__HFZoneBuilder__updateName__block_invoke_28;
  v8[3] = &unk_1EA726918;
  v8[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v5, "dispatchHomeObserverMessage:sender:", v8, 0);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __28__HFZoneBuilder__updateName__block_invoke_28(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "home");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "zone");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "home:didUpdateNameForZone:", v3, v4);

  }
}

- (id)_updateRooms
{
  uint64_t v3;
  void (**v4)(void *, void *);
  void (**v5)(void *, void *);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  _QWORD aBlock[4];
  id v16;
  id location;

  objc_initWeak(&location, self);
  v3 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __29__HFZoneBuilder__updateRooms__block_invoke;
  aBlock[3] = &unk_1EA73E468;
  objc_copyWeak(&v16, &location);
  v4 = (void (**)(void *, void *))_Block_copy(aBlock);
  v13[0] = v3;
  v13[1] = 3221225472;
  v13[2] = __29__HFZoneBuilder__updateRooms__block_invoke_5;
  v13[3] = &unk_1EA73E468;
  objc_copyWeak(&v14, &location);
  v5 = (void (**)(void *, void *))_Block_copy(v13);
  -[HFZoneBuilder roomUUIDs](self, "roomUUIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFZoneBuilder zone](self, "zone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFZoneBuilder zone](self, "zone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2](v5, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemBuilder commitSetDiff:addBlock:updateBlock:deleteBlock:](self, "commitSetDiff:addBlock:updateBlock:deleteBlock:", v6, v8, &__block_literal_global_52_0, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
  return v11;
}

id __29__HFZoneBuilder__updateRooms__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __29__HFZoneBuilder__updateRooms__block_invoke_2;
  v7[3] = &unk_1EA73E440;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  v8 = v3;
  v4 = v3;
  v5 = _Block_copy(v7);

  objc_destroyWeak(&v9);
  return v5;
}

id __29__HFZoneBuilder__updateRooms__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  int v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v21;
  _QWORD v22[5];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_roomWithIdentifier:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    HFLogForCategory(0x28uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(WeakRetained, "home");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v31 = v3;
      v32 = 2112;
      v33 = v21;
      _os_log_error_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_ERROR, "Could not find room with UUID: %@ in home: %@. This is going to cause the HFZoneBuilder commit to fail.", buf, 0x16u);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "rooms");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __29__HFZoneBuilder__updateRooms__block_invoke_31;
  v28[3] = &unk_1EA72E400;
  v10 = v6;
  v29 = v10;
  v11 = objc_msgSend(v8, "na_any:", v28);

  HFLogForCategory(0x28uLL);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      *(_DWORD *)buf = 138412290;
      v31 = v10;
      _os_log_impl(&dword_1DD34E000, v12, OS_LOG_TYPE_DEFAULT, "HFZoneBuilder: Skipping adding room %@ as one already exists!", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", MEMORY[0x1E0C9AAB0]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v13)
    {
      objc_msgSend(WeakRetained, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v31 = v10;
      v32 = 2112;
      v33 = v15;
      _os_log_impl(&dword_1DD34E000, v12, OS_LOG_TYPE_DEFAULT, "HFZoneBuilder: Assigning room %@ to zone named %@", buf, 0x16u);

    }
    v16 = (void *)MEMORY[0x1E0D519C0];
    v25[0] = v9;
    v25[1] = 3221225472;
    v25[2] = __29__HFZoneBuilder__updateRooms__block_invoke_33;
    v25[3] = &unk_1EA728590;
    v26 = *(id *)(a1 + 32);
    v17 = v10;
    v27 = v17;
    objc_msgSend(v16, "futureWithErrorOnlyHandlerAdapterBlock:", v25);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (id)objc_msgSend(v18, "addFailureBlock:", &__block_literal_global_35_6);
    v22[0] = v9;
    v22[1] = 3221225472;
    v22[2] = __29__HFZoneBuilder__updateRooms__block_invoke_3;
    v22[3] = &unk_1EA730990;
    v22[4] = WeakRetained;
    v23 = v17;
    v24 = *(id *)(a1 + 32);
    objc_msgSend(v18, "flatMap:", v22);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

uint64_t __29__HFZoneBuilder__updateRooms__block_invoke_31(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "hmf_isEqualToUUID:", v4);

  return v5;
}

uint64_t __29__HFZoneBuilder__updateRooms__block_invoke_33(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addRoom:completionHandler:", *(_QWORD *)(a1 + 40), a2);
}

void __29__HFZoneBuilder__updateRooms__block_invoke_2_34(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  +[HFErrorHandler sharedHandler](HFErrorHandler, "sharedHandler");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logError:operationDescription:", v2, CFSTR("HFZoneBuilder.assignZoneToRoom"));

}

id __29__HFZoneBuilder__updateRooms__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  id v9;
  id v10;

  v3 = a2;
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __29__HFZoneBuilder__updateRooms__block_invoke_4;
  v8[3] = &unk_1EA72BF08;
  v5 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v10 = *(id *)(a1 + 48);
  objc_msgSend(v4, "dispatchHomeObserverMessage:sender:", v8, 0);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __29__HFZoneBuilder__updateRooms__block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "home");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "home:didAddRoom:toZone:", v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
}

id __29__HFZoneBuilder__updateRooms__block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __29__HFZoneBuilder__updateRooms__block_invoke_6;
  v7[3] = &unk_1EA73E440;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  v8 = v3;
  v4 = v3;
  v5 = _Block_copy(v7);

  objc_destroyWeak(&v9);
  return v5;
}

id __29__HFZoneBuilder__updateRooms__block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_roomWithIdentifier:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    HFLogForCategory(0x28uLL);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(WeakRetained, "home");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v26 = v3;
      v27 = 2112;
      v28 = v18;
      _os_log_error_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_ERROR, "Could not find room with UUID: %@ in home: %@. This is going to cause the HFZoneBuilder commit to fail.", buf, 0x16u);

    }
  }
  HFLogForCategory(0x28uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v26 = v6;
    v27 = 2112;
    v28 = v9;
    _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "HFZoneBuilder: Removing room %@ from zone named %@", buf, 0x16u);

  }
  v10 = MEMORY[0x1E0C809B0];
  v11 = (void *)MEMORY[0x1E0D519C0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __29__HFZoneBuilder__updateRooms__block_invoke_42;
  v22[3] = &unk_1EA728590;
  v23 = *(id *)(a1 + 32);
  v12 = v6;
  v24 = v12;
  objc_msgSend(v11, "futureWithErrorOnlyHandlerAdapterBlock:", v22);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v13, "addFailureBlock:", &__block_literal_global_44_6);
  v19[0] = v10;
  v19[1] = 3221225472;
  v19[2] = __29__HFZoneBuilder__updateRooms__block_invoke_3_47;
  v19[3] = &unk_1EA730990;
  v19[4] = WeakRetained;
  v20 = v12;
  v21 = *(id *)(a1 + 32);
  v15 = v12;
  objc_msgSend(v13, "flatMap:", v19);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

uint64_t __29__HFZoneBuilder__updateRooms__block_invoke_42(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeRoom:completionHandler:", *(_QWORD *)(a1 + 40), a2);
}

void __29__HFZoneBuilder__updateRooms__block_invoke_2_43(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  +[HFErrorHandler sharedHandler](HFErrorHandler, "sharedHandler");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logError:operationDescription:", v2, CFSTR("HFZoneBuilder.removeZoneToRoom"));

}

id __29__HFZoneBuilder__updateRooms__block_invoke_3_47(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  id v9;
  id v10;

  v3 = a2;
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __29__HFZoneBuilder__updateRooms__block_invoke_4_48;
  v8[3] = &unk_1EA72BF08;
  v5 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v10 = *(id *)(a1 + 48);
  objc_msgSend(v4, "dispatchHomeObserverMessage:sender:", v8, 0);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __29__HFZoneBuilder__updateRooms__block_invoke_4_48(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "home");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "home:didRemoveRoom:fromZone:", v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
}

uint64_t __29__HFZoneBuilder__updateRooms__block_invoke_5_51()
{
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
}

+ (id)na_identity
{
  if (qword_1ED3786B8 != -1)
    dispatch_once(&qword_1ED3786B8, &__block_literal_global_54_5);
  return (id)_MergedGlobals_1_2;
}

void __28__HFZoneBuilder_na_identity__block_invoke()
{
  id v0;
  id v1;
  id v2;
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0D519C8], "builder");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v0 = (id)objc_msgSend(v6, "appendCharacteristic:withRole:", &__block_literal_global_57_3, 1);
  v1 = (id)objc_msgSend(v6, "appendCharacteristic:withRole:", &__block_literal_global_58_1, 2);
  v2 = (id)objc_msgSend(v6, "appendCharacteristic:withRole:", &__block_literal_global_59_1, 2);
  v3 = (id)objc_msgSend(v6, "appendCharacteristic:withRole:", &__block_literal_global_60_1, 2);
  objc_msgSend(v6, "build");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)_MergedGlobals_1_2;
  _MergedGlobals_1_2 = v4;

}

id __28__HFZoneBuilder_na_identity__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = a2;
  objc_msgSend(v2, "zone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v2, "zone");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "uniqueIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v2 = v4;
  }
  else
  {
    objc_msgSend(v2, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

uint64_t __28__HFZoneBuilder_na_identity__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "name");
}

id __28__HFZoneBuilder_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "zone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __28__HFZoneBuilder_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "zone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rooms");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_map:", &__block_literal_global_62_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __28__HFZoneBuilder_na_identity__block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uniqueIdentifier");
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend((id)objc_opt_class(), "na_identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hashOfObject:", self);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "na_identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v5, "isObject:equalToObject:", self, v4);

  return (char)self;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (HFMutableSetDiff)roomUUIDs
{
  return self->_roomUUIDs;
}

- (void)setRoomUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_roomUUIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roomUUIDs, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
