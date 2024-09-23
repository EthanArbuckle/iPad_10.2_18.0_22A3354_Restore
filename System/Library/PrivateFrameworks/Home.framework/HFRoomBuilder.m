@implementation HFRoomBuilder

+ (Class)homeKitRepresentationClass
{
  return (Class)objc_opt_class();
}

- (HFRoomBuilder)initWithExistingObject:(id)a3 inHome:(id)a4
{
  id v6;
  HFRoomBuilder *v7;
  HFRoomBuilder *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  void *v13;
  int v14;
  HFWallpaperEditCollectionBuilder *v15;
  HFWallpaperEditCollectionBuilder *wallpaperBuilder;
  void *v17;
  void *v18;
  void *v19;
  HFMutableSetDiff *v20;
  HFMutableSetDiff *accessoryUUIDs;
  objc_super v23;

  v6 = a3;
  v23.receiver = self;
  v23.super_class = (Class)HFRoomBuilder;
  v7 = -[HFItemBuilder initWithExistingObject:inHome:](&v23, sel_initWithExistingObject_inHome_, v6, a4);
  v8 = v7;
  if (v7)
  {
    -[HFRoomBuilder room](v7, "room");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "name");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
      v12 = (__CFString *)v10;
    else
      v12 = &stru_1EA741FF8;
    objc_storeStrong((id *)&v8->_name, v12);

    if (+[HFExecutionEnvironment isHomeApp](HFExecutionEnvironment, "isHomeApp"))
    {
      +[HFWallpaperManager sharedInstance](HFWallpaperManager, "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "wallpaperSourceRegistered");

      if (v14)
      {
        v15 = -[HFWallpaperEditCollectionBuilder initWithHomeKitObject:namedWallpaperCollectionType:]([HFWallpaperEditCollectionBuilder alloc], "initWithHomeKitObject:namedWallpaperCollectionType:", v6, 1);
        wallpaperBuilder = v8->_wallpaperBuilder;
        v8->_wallpaperBuilder = v15;

      }
    }
    if (v6)
    {
      -[HFRoomBuilder room](v8, "room");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "accessories");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      HFHomeKitObjectUniqueIdentifiers(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v20 = -[HFMutableSetDiff initWithFromSet:]([HFMutableSetDiff alloc], "initWithFromSet:", v19);
    accessoryUUIDs = v8->_accessoryUUIDs;
    v8->_accessoryUUIDs = v20;

  }
  return v8;
}

- (void)addAccessory:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[HFRoomBuilder accessoryUUIDs](self, "accessoryUUIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsObject:", v6);

  if ((v7 & 1) == 0)
  {
    -[HFRoomBuilder accessoryUUIDs](self, "accessoryUUIDs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "uniqueIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v9);

  }
}

- (void)removeAccessory:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[HFRoomBuilder accessoryUUIDs](self, "accessoryUUIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsObject:", v6);

  if (v7)
  {
    -[HFRoomBuilder accessoryUUIDs](self, "accessoryUUIDs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "uniqueIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "deleteObject:", v9);

  }
}

- (NSSet)accessories
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[HFRoomBuilder accessoryUUIDs](self, "accessoryUUIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "toSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __28__HFRoomBuilder_accessories__block_invoke;
  v7[3] = &unk_1EA72B548;
  v7[4] = self;
  objc_msgSend(v4, "na_map:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v5;
}

id __28__HFRoomBuilder_accessories__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hf_accessoryWithIdentifier:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFRoomBuilder room](self, "room");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HFRoomBuilder room](self, "room");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hf_prettyDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("room"));

  }
  else
  {
    -[HFRoomBuilder name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v3, "appendObject:withName:", v5, CFSTR("name"));
  }

  objc_msgSend(v3, "build");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
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
  -[HFRoomBuilder name](self, "name");
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
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[4];
  __CFString *v20;
  HFRoomBuilder *v21;
  _QWORD v22[5];
  _QWORD v23[5];
  _QWORD v24[5];
  uint8_t buf[4];
  HFRoomBuilder *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0x28uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v26 = self;
    _os_log_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_DEFAULT, "HFRoomBuilder: Starting commit (%@)", buf, 0xCu);
  }

  -[HFRoomBuilder room](self, "room");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = HFOperationEditRoom;
  if (!v4)
    v5 = HFOperationAddRoom;
  v6 = *v5;

  -[HFRoomBuilder _performValidation](self, "_performValidation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __27__HFRoomBuilder_commitItem__block_invoke;
  v24[3] = &unk_1EA726940;
  v24[4] = self;
  objc_msgSend(v7, "flatMap:", v24);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v8;
  v23[1] = 3221225472;
  v23[2] = __27__HFRoomBuilder_commitItem__block_invoke_15;
  v23[3] = &unk_1EA726940;
  v23[4] = self;
  objc_msgSend(v9, "flatMap:", v23);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v8;
  v22[1] = 3221225472;
  v22[2] = __27__HFRoomBuilder_commitItem__block_invoke_2;
  v22[3] = &unk_1EA726940;
  v22[4] = self;
  objc_msgSend(v10, "flatMap:", v22);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v8;
  v19[1] = 3221225472;
  v19[2] = __27__HFRoomBuilder_commitItem__block_invoke_3;
  v19[3] = &unk_1EA726990;
  v20 = v6;
  v21 = self;
  v12 = v6;
  objc_msgSend(v11, "recover:", v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v8;
  v18[1] = 3221225472;
  v18[2] = __27__HFRoomBuilder_commitItem__block_invoke_4;
  v18[3] = &unk_1EA726940;
  v18[4] = self;
  objc_msgSend(v13, "flatMap:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = v8;
  v17[1] = 3221225472;
  v17[2] = __27__HFRoomBuilder_commitItem__block_invoke_5;
  v17[3] = &unk_1EA72CBB8;
  v17[4] = self;
  v15 = (id)objc_msgSend(v14, "addCompletionBlock:", v17);

  return v14;
}

id __27__HFRoomBuilder_commitItem__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "room");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "room");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "roomForEntireHome");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqual:", v5) & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "room");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "isEqualToString:", v8);

    if ((v9 & 1) == 0)
    {
      HFLogForCategory(0x28uLL);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "name");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 138412290;
        v19 = v11;
        _os_log_impl(&dword_1DD34E000, v10, OS_LOG_TYPE_DEFAULT, "HFRoomBuilder: Request to modify name for default room. Creating a new room and moving accessories into it instead (%@)", (uint8_t *)&v18, 0xCu);

      }
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "accessoryUUIDs");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "toSet");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[HFSetDiff diffFromSet:toSet:](HFMutableSetDiff, "diffFromSet:toSet:", v12, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setAccessoryUUIDs:", v15);

      goto LABEL_9;
    }
  }
  else
  {

  }
  if (!v2)
  {
LABEL_9:
    objc_msgSend(*(id *)(a1 + 32), "_createRoom");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    return v16;
  }
  objc_msgSend(*(id *)(a1 + 32), "_updateName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  return v16;
}

id __27__HFRoomBuilder_commitItem__block_invoke_15(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "wallpaperBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "wallpaperBuilder");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "commitWallpaper");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

uint64_t __27__HFRoomBuilder_commitItem__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAccessories");
}

id __27__HFRoomBuilder_commitItem__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0D519C0];
  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 40), "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v3, "hf_errorWithOperationType:failedItemName:", v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "futureWithError:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  return v10;
}

id __27__HFRoomBuilder_commitItem__block_invoke_4(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(*(id *)(a1 + 32), "room");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "futureWithResult:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __27__HFRoomBuilder_commitItem__block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory(0x28uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138412546;
    v8 = v6;
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "HFRoomBuilder: Commit for %@ finished with error: %@", (uint8_t *)&v7, 0x16u);
  }

}

- (id)_createRoom
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  _QWORD v11[5];
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0x28uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[HFRoomBuilder name](self, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v13 = v4;
    _os_log_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_DEFAULT, "HFRoomBuilder: Adding room with name: %@", buf, 0xCu);

  }
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __28__HFRoomBuilder__createRoom__block_invoke;
  v11[3] = &unk_1EA7268F0;
  v11[4] = self;
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithCompletionHandlerAdapterBlock:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "addFailureBlock:", &__block_literal_global_217);
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __28__HFRoomBuilder__createRoom__block_invoke_23;
  v10[3] = &unk_1EA73ECC0;
  v10[4] = self;
  objc_msgSend(v6, "flatMap:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __28__HFRoomBuilder__createRoom__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "home");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addRoomWithName:completionHandler:", v5, v4);

}

void __28__HFRoomBuilder__createRoom__block_invoke_2(uint64_t a1, void *a2)
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
    _os_log_error_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_ERROR, "HFRoomBuilder: Failed to add room with error: %@", (uint8_t *)&v5, 0xCu);
  }

  +[HFErrorHandler sharedHandler](HFErrorHandler, "sharedHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logError:operationDescription:", v2, CFSTR("HFRoomBuilder.addRoomWithName"));

}

id __28__HFRoomBuilder__createRoom__block_invoke_23(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  uint8_t buf[16];

  v3 = a2;
  HFLogForCategory(0x28uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "HFRoomBuilder: Finished adding room", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "setRoom:", v3);
  objc_msgSend(*(id *)(a1 + 32), "wallpaperBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHkObject:", v3);

  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __28__HFRoomBuilder__createRoom__block_invoke_25;
  v9[3] = &unk_1EA726918;
  v9[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v6, "dispatchHomeObserverMessage:sender:", v9, 0);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __28__HFRoomBuilder__createRoom__block_invoke_25(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "home");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "room");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "home:didAddRoom:", v3, v4);

  }
}

- (id)_updateName
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  _QWORD v18[5];
  _QWORD v19[5];
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[HFRoomBuilder room](self, "room");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFRoomBuilder name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  HFLogForCategory(0x28uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      -[HFRoomBuilder name](self, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v21 = v9;
      _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "HFRoomBuilder: Not updating name because it hasn't changed (%@)", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", MEMORY[0x1E0C9AAB0]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v8)
    {
      -[HFRoomBuilder room](self, "room");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFRoomBuilder name](self, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v21 = v12;
      v22 = 2112;
      v23 = v13;
      _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "HFRoomBuilder: Updating name from \"%@\" to \"%@\", buf, 0x16u);

    }
    v14 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __28__HFRoomBuilder__updateName__block_invoke;
    v19[3] = &unk_1EA7268C8;
    v19[4] = self;
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithErrorOnlyHandlerAdapterBlock:", v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (id)objc_msgSend(v15, "addFailureBlock:", &__block_literal_global_31_10);
    v18[0] = v14;
    v18[1] = 3221225472;
    v18[2] = __28__HFRoomBuilder__updateName__block_invoke_34;
    v18[3] = &unk_1EA726940;
    v18[4] = self;
    objc_msgSend(v15, "flatMap:", v18);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

void __28__HFRoomBuilder__updateName__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "room");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateName:completionHandler:", v5, v4);

}

void __28__HFRoomBuilder__updateName__block_invoke_2(uint64_t a1, void *a2)
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
    _os_log_error_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_ERROR, "HFRoomBuilder: Failed to update name with error: %@", (uint8_t *)&v5, 0xCu);
  }

  +[HFErrorHandler sharedHandler](HFErrorHandler, "sharedHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logError:operationDescription:", v2, CFSTR("HFRoomBuilder.updateName"));

}

id __28__HFRoomBuilder__updateName__block_invoke_34(uint64_t a1, void *a2)
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
    _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "HFRoomBuilder: Finished updating name", buf, 2u);
  }

  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __28__HFRoomBuilder__updateName__block_invoke_35;
  v8[3] = &unk_1EA726918;
  v8[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v5, "dispatchHomeObserverMessage:sender:", v8, 0);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __28__HFRoomBuilder__updateName__block_invoke_35(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "home");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "room");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "home:didUpdateNameForRoom:", v3, v4);

  }
}

- (id)_updateAccessories
{
  NSObject *v3;
  void *v4;
  void *v5;
  void (**v6)(void *, void *);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD aBlock[5];
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0x28uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[HFRoomBuilder accessories](self, "accessories");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hf_prettyDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v17 = v5;
    _os_log_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_DEFAULT, "HFRoomBuilder: Updating accessories: %@", buf, 0xCu);

  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __35__HFRoomBuilder__updateAccessories__block_invoke;
  aBlock[3] = &unk_1EA73ED30;
  aBlock[4] = self;
  v6 = (void (**)(void *, void *))_Block_copy(aBlock);
  -[HFRoomBuilder accessoryUUIDs](self, "accessoryUUIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFRoomBuilder room](self, "room");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemBuilder home](self, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "roomForEntireHome");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemBuilder commitSetDiff:addBlock:updateBlock:deleteBlock:](self, "commitSetDiff:addBlock:updateBlock:deleteBlock:", v7, v9, &__block_literal_global_49_2, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id __35__HFRoomBuilder__updateAccessories__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__HFRoomBuilder__updateAccessories__block_invoke_2;
  v7[3] = &unk_1EA73ED08;
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v4 = v3;
  v5 = _Block_copy(v7);

  return v5;
}

id __35__HFRoomBuilder__updateAccessories__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[5];
  id v30;
  id v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hf_accessoryWithIdentifier:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    HFLogForCategory(0x28uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "home");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v33 = v3;
      v34 = 2112;
      v35 = v21;
      _os_log_error_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_ERROR, "Could not find accessory with UUID: %@ in home: %@. This is going to cause the HFRoomBuilder commit to fail.", buf, 0x16u);

    }
  }
  HFLogForCategory(0x28uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "hf_prettyDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hf_prettyDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v33 = v8;
    v34 = 2112;
    v35 = v9;
    _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "HFRoomBuilder: Assigning accessory to room: %@. Accessory: %@", buf, 0x16u);

  }
  v10 = (void *)MEMORY[0x1E0D519C0];
  v11 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __35__HFRoomBuilder__updateAccessories__block_invoke_38;
  v29[3] = &unk_1EA72CA78;
  v29[4] = *(_QWORD *)(a1 + 32);
  v12 = v5;
  v30 = v12;
  v31 = *(id *)(a1 + 40);
  objc_msgSend(v10, "futureWithErrorOnlyHandlerAdapterBlock:", v29);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v11;
  v26[1] = 3221225472;
  v26[2] = __35__HFRoomBuilder__updateAccessories__block_invoke_2_39;
  v26[3] = &unk_1EA726360;
  v14 = v12;
  v27 = v14;
  v28 = *(id *)(a1 + 40);
  v15 = (id)objc_msgSend(v13, "addFailureBlock:", v26);
  v22[0] = v11;
  v22[1] = 3221225472;
  v22[2] = __35__HFRoomBuilder__updateAccessories__block_invoke_42;
  v22[3] = &unk_1EA730990;
  v23 = v14;
  v16 = *(id *)(a1 + 40);
  v17 = *(_QWORD *)(a1 + 32);
  v24 = v16;
  v25 = v17;
  v18 = v14;
  objc_msgSend(v13, "flatMap:", v22);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

void __35__HFRoomBuilder__updateAccessories__block_invoke_38(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)a1[4];
  v4 = a2;
  objc_msgSend(v3, "home");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assignAccessory:toRoom:completionHandler:", a1[5], a1[6], v4);

}

void __35__HFRoomBuilder__updateAccessories__block_invoke_2_39(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory(0x28uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "hf_prettyDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412802;
    v9 = v6;
    v10 = 2112;
    v11 = v7;
    v12 = 2112;
    v13 = v3;
    _os_log_error_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_ERROR, "HFRoomBuilder: Failed to assign accessory (%@) to room (%@) with error: %@", (uint8_t *)&v8, 0x20u);

  }
  +[HFErrorHandler sharedHandler](HFErrorHandler, "sharedHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logError:operationDescription:", v3, CFSTR("HFRoomBuilder.assignAccessoryToRoom"));

}

id __35__HFRoomBuilder__updateAccessories__block_invoke_42(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  int8x16_t v11;
  _QWORD v12[4];
  int8x16_t v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory(0x28uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v16 = v5;
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "HFRoomBuilder: Finished assigning accessory (%@) to room (%@)", buf, 0x16u);

  }
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __35__HFRoomBuilder__updateAccessories__block_invoke_43;
  v12[3] = &unk_1EA72BF08;
  v11 = *(int8x16_t *)(a1 + 40);
  v8 = (id)v11.i64[0];
  v13 = vextq_s8(v11, v11, 8uLL);
  v14 = *(id *)(a1 + 32);
  objc_msgSend(v7, "dispatchHomeObserverMessage:sender:", v12, 0);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __35__HFRoomBuilder__updateAccessories__block_invoke_43(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "home");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "home:didUpdateRoom:forAccessory:", v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
}

uint64_t __35__HFRoomBuilder__updateAccessories__block_invoke_2_48()
{
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  -[HFRoomBuilder room](self, "room");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HFRoomBuilder room](self, "room");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uniqueIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "hash");

  }
  else
  {
    -[HFRoomBuilder name](self, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "hash");
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v17;
  void *v18;
  void *v19;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v15 = 0;
    goto LABEL_18;
  }
  v5 = v4;
  -[HFRoomBuilder room](self, "room");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "room");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v8, "isEqual:", v11))
  {
    v19 = v8;
    -[HFRoomBuilder name](self, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isEqualToString:", v13))
    {
      __25__HFRoomBuilder_isEqual___block_invoke(self);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      __25__HFRoomBuilder_isEqual___block_invoke(v5);
      v18 = v6;
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v17, "isEqual:", v14);

      v6 = v18;
    }
    else
    {
      v15 = 0;
    }

    v8 = v19;
    if (!v10)
      goto LABEL_14;
  }
  else
  {
    v15 = 0;
    if (!v10)
LABEL_14:

  }
  if (!v7)

LABEL_18:
  return v15;
}

id __25__HFRoomBuilder_isEqual___block_invoke(void *a1)
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "accessories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_map:", &__block_literal_global_54_6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t __25__HFRoomBuilder_isEqual___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uniqueIdentifier");
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (HFWallpaperEditCollectionBuilder)wallpaperBuilder
{
  return self->_wallpaperBuilder;
}

- (void)setWallpaperBuilder:(id)a3
{
  objc_storeStrong((id *)&self->_wallpaperBuilder, a3);
}

- (HFMutableSetDiff)accessoryUUIDs
{
  return self->_accessoryUUIDs;
}

- (void)setAccessoryUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryUUIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryUUIDs, 0);
  objc_storeStrong((id *)&self->_wallpaperBuilder, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
