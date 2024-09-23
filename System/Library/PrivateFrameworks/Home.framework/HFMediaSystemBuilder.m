@implementation HFMediaSystemBuilder

+ (Class)homeKitRepresentationClass
{
  return (Class)objc_opt_class();
}

- (HFMediaSystemBuilder)initWithExistingObject:(id)a3 inHome:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HFMediaSystemBuilder *v14;
  void *v15;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v8 = objc_opt_class();
  v9 = v6;
  if (v9)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v9;
    if (v10)
      goto LABEL_8;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v8, objc_opt_class());

  }
  v11 = 0;
LABEL_8:

  v17.receiver = self;
  v17.super_class = (Class)HFMediaSystemBuilder;
  v14 = -[HFItemBuilder initWithExistingObject:inHome:](&v17, sel_initWithExistingObject_inHome_, v11, v7);

  if (v14)
  {
    +[HFNamingComponents namingComponentFromMediaSystem:](HFNamingComponents, "namingComponentFromMediaSystem:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFMediaSystemBuilder setNamingComponent:](v14, "setNamingComponent:", v15);

    v14->_isCreatingMediaSystem = v11 == 0;
    v14->_showInHomeDashboard = objc_msgSend(v11, "hf_effectiveShowInHomeDashboard");
    v14->_isFavorite = objc_msgSend(v11, "hf_effectiveIsFavorite");
  }

  return v14;
}

- (NSString)description
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendSuper");
  -[HFMediaSystemBuilder mediaSystem](self, "mediaSystem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_prettyDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("existingMediaSystem"));

  -[HFMediaSystemBuilder homeKitMediaSystemBuilder](self, "homeKitMediaSystemBuilder");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "components");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v3, "appendObject:withName:", v9, CFSTR("components"));

  objc_msgSend(MEMORY[0x1E0CBA688], "leftRole");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMediaSystemBuilder accessoryForRole:](self, "accessoryForRole:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v12, CFSTR("lefty"), 1);

  objc_msgSend(MEMORY[0x1E0CBA688], "rightRole");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMediaSystemBuilder accessoryForRole:](self, "accessoryForRole:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v15, CFSTR("righty"), 1);

  -[HFMediaSystemBuilder homeKitMediaSystemBuilder](self, "homeKitMediaSystemBuilder");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "name");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v3, "appendObject:withName:", v18, CFSTR("name"));

  -[HFMediaSystemBuilder homeKitMediaSystemBuilder](self, "homeKitMediaSystemBuilder");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "hf_prettyDescription");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (id)objc_msgSend(v3, "appendObject:withName:", v21, CFSTR("room"));

  objc_msgSend(v3, "build");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v23;
}

- (HMMediaSystemBuilder)homeKitMediaSystemBuilder
{
  HMMediaSystemBuilder *homeKitMediaSystemBuilder;
  void *v4;
  id v5;
  void *v6;
  HMMediaSystemBuilder *v7;
  HMMediaSystemBuilder *v8;

  homeKitMediaSystemBuilder = self->_homeKitMediaSystemBuilder;
  if (!homeKitMediaSystemBuilder)
  {
    -[HFMediaSystemBuilder mediaSystem](self, "mediaSystem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = objc_alloc(MEMORY[0x1E0CBA668]);
    if (v4)
    {
      -[HFMediaSystemBuilder mediaSystem](self, "mediaSystem");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (HMMediaSystemBuilder *)objc_msgSend(v5, "initWithMediaSystem:", v6);
    }
    else
    {
      -[HFItemBuilder home](self, "home");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (HMMediaSystemBuilder *)objc_msgSend(v5, "initWithHome:", v6);
    }
    v8 = self->_homeKitMediaSystemBuilder;
    self->_homeKitMediaSystemBuilder = v7;

    homeKitMediaSystemBuilder = self->_homeKitMediaSystemBuilder;
  }
  return homeKitMediaSystemBuilder;
}

- (void)setName:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HFMediaSystemBuilder homeKitMediaSystemBuilder](self, "homeKitMediaSystemBuilder");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setConfiguredName:", v4);

}

- (NSString)name
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[HFMediaSystemBuilder homeKitMediaSystemBuilder](self, "homeKitMediaSystemBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configuredName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[HFMediaSystemBuilder namingComponent](self, "namingComponent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "name");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v6;
}

- (void)addAccessory:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!-[HFMediaSystemBuilder shouldAllowAddingAccessory:](self, "shouldAllowAddingAccessory:", v5))
  {
    HFLogForCategory(0x28uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "hf_prettyDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_DEFAULT, "Request to add an accessory that is not supported in this media system pair. We'll allow this to proceed (because there are no API restriction of what services can go into a pair; we just want to enforce restrictions in our "
        "UI). Accessory: %@",
        (uint8_t *)&v9,
        0xCu);

    }
  }
  -[HFMediaSystemBuilder _firstUnpopulatedRole](self, "_firstUnpopulatedRole");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMediaSystemBuilder addAccessory:role:](self, "addAccessory:role:", v5, v8);

  if (!self->_firstSetupSourceAccessory && -[HFMediaSystemBuilder isCreatingMediaSystem](self, "isCreatingMediaSystem"))
    objc_storeStrong((id *)&self->_firstSetupSourceAccessory, a3);

}

- (void)addAccessory:(id)a3 role:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  HFRoomBuilder *v26;
  void *v27;
  void *v28;
  HFRoomBuilder *v29;
  void *v30;
  void *v31;
  void *v32;
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFMediaSystemBuilder.m"), 150, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("accessory"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFMediaSystemBuilder.m"), 151, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("role"));

LABEL_3:
  if (!-[HFMediaSystemBuilder shouldAllowAddingAccessory:](self, "shouldAllowAddingAccessory:", v7))
  {
    HFLogForCategory(0x28uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "hf_prettyDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v34 = v11;
      _os_log_impl(&dword_1DD34E000, v10, OS_LOG_TYPE_DEFAULT, "Request to add an accessory that is not supported in this media system pair. We'll allow this to proceed (because there are no API restriction of what services can go into a pair; we just want to enforce restrictions in our "
        "UI). Accessory: %@",
        buf,
        0xCu);

    }
  }
  -[HFMediaSystemBuilder roleForAccessory:](self, "roleForAccessory:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqual:", v9);

  if ((v13 & 1) == 0)
  {
    -[HFMediaSystemBuilder removeAccessory:](self, "removeAccessory:", v7);
    -[HFMediaSystemBuilder homeKitMediaSystemBuilder](self, "homeKitMediaSystemBuilder");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "components");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "mutableCopy");
    v17 = v16;
    if (v16)
      v18 = v16;
    else
      v18 = (id)objc_opt_new();
    v19 = v18;

    v20 = objc_alloc(MEMORY[0x1E0CBA678]);
    objc_msgSend(v7, "mediaProfile");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v20, "initWithMediaProfile:role:", v21, v9);

    objc_msgSend(v19, "addObject:", v22);
    -[HFMediaSystemBuilder homeKitMediaSystemBuilder](self, "homeKitMediaSystemBuilder");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setComponents:", v19);

    -[HFMediaSystemBuilder room](self, "room");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "room");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v25)
    {
      v26 = [HFRoomBuilder alloc];
      objc_msgSend(v7, "room");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "home");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[HFRoomBuilder initWithExistingObject:inHome:](v26, "initWithExistingObject:inHome:", v27, v28);
      -[HFMediaSystemBuilder setRoom:](self, "setRoom:", v29);

    }
    -[HFMediaSystemBuilder mediaSystem](self, "mediaSystem");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
    {

    }
    else if (objc_msgSend(v7, "hf_showInHomeDashboard"))
    {
      -[HFMediaSystemBuilder setShowInHomeDashboard:](self, "setShowInHomeDashboard:", objc_msgSend(v7, "hf_showInHomeDashboard"));
      -[HFMediaSystemBuilder setIsFavorite:](self, "setIsFavorite:", objc_msgSend(v7, "hf_isFavorite"));
    }

  }
}

- (void)removeAccessory:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v10 = a3;
  -[HFMediaSystemBuilder accessories](self, "accessories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v10);

  if (v5)
  {
    -[HFMediaSystemBuilder homeKitMediaSystemBuilder](self, "homeKitMediaSystemBuilder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "components");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __40__HFMediaSystemBuilder_removeAccessory___block_invoke;
    v11[3] = &unk_1EA72E690;
    v12 = v10;
    objc_msgSend(v7, "na_filter:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFMediaSystemBuilder homeKitMediaSystemBuilder](self, "homeKitMediaSystemBuilder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setComponents:", v8);

  }
}

uint64_t __40__HFMediaSystemBuilder_removeAccessory___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "mediaProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 32)) ^ 1;

  return v5;
}

- (id)accessoryForRole:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[HFMediaSystemBuilder homeKitMediaSystemBuilder](self, "homeKitMediaSystemBuilder", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "role");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v11, "isEqual:", v4) & 1) != 0)
        {
          objc_msgSend(v10, "mediaProfile");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "accessory");
          v7 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }

      }
      v7 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)roleForAccessory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[HFMediaSystemBuilder homeKitMediaSystemBuilder](self, "homeKitMediaSystemBuilder", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "mediaProfile");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "accessory");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqual:", v4);

        if ((v13 & 1) != 0)
        {
          objc_msgSend(v10, "role");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v7 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (NSSet)accessories
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[HFMediaSystemBuilder homeKitMediaSystemBuilder](self, "homeKitMediaSystemBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "components");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_map:", &__block_literal_global_98);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v6;
}

id __35__HFMediaSystemBuilder_accessories__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "mediaProfile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)mediaProfileContainers
{
  return 0;
}

- (id)removeItemFromHome
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[HFMediaSystemBuilder mediaSystem](self, "mediaSystem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HFLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v22 = v2;
    v23 = 2112;
    v24 = v3;
    _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "Removing mediasystem '%@' from home '%@'", buf, 0x16u);
  }

  if (v2)
  {
    v5 = (void *)MEMORY[0x1E0D519C0];
    if (v3)
    {
      v6 = MEMORY[0x1E0C809B0];
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __42__HFMediaSystemBuilder_removeItemFromHome__block_invoke;
      v19[3] = &unk_1EA7268C8;
      v7 = v2;
      v20 = v7;
      objc_msgSend(v5, "futureWithErrorOnlyHandlerAdapterBlock:", v19);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v6;
      v16[1] = 3221225472;
      v16[2] = __42__HFMediaSystemBuilder_removeItemFromHome__block_invoke_2;
      v16[3] = &unk_1EA732620;
      v17 = v3;
      v9 = v7;
      v18 = v9;
      objc_msgSend(v8, "flatMap:", v16);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = v6;
      v14[1] = 3221225472;
      v14[2] = __42__HFMediaSystemBuilder_removeItemFromHome__block_invoke_4;
      v14[3] = &unk_1EA72A050;
      v15 = v9;
      objc_msgSend(v10, "recover:", v14);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:descriptionFormat:", 30, CFSTR("Home not found for media system: %@"), v2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "futureWithError:", v12);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

void __42__HFMediaSystemBuilder_removeItemFromHome__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "home");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeMediaSystem:completionHandler:", *(_QWORD *)(a1 + 32), v4);

}

id __42__HFMediaSystemBuilder_removeItemFromHome__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, void *);
  void *v8;
  id v9;
  id v10;

  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __42__HFMediaSystemBuilder_removeItemFromHome__block_invoke_3;
  v8 = &unk_1EA7277C8;
  v9 = *(id *)(a1 + 32);
  v10 = *(id *)(a1 + 40);
  objc_msgSend(v2, "dispatchHomeObserverMessage:sender:", &v5, 0);

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult", v5, v6, v7, v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __42__HFMediaSystemBuilder_removeItemFromHome__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "home:didRemoveMediaSystem:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

id __42__HFMediaSystemBuilder_removeItemFromHome__block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "name");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = &stru_1EA741FF8;
  if (v4)
    v6 = (__CFString *)v4;
  v7 = v6;

  v12[0] = CFSTR("HFErrorHandlerOptionFailedItemName");
  v12[1] = CFSTR("HFErrorUserInfoOperationKey");
  v13[0] = v7;
  v13[1] = CFSTR("HFOperationRemoveMediaSystem");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hf_errorWithAddedUserInfo:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithError:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)shouldAllowAddingAccessory:(id)a3
{
  id v4;
  char v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "hf_isHomePod");
  -[HFItemBuilder home](self, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hf_mediaSystemForAccessory:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    return 0;
  else
    return v5;
}

- (BOOL)stereoPairVersionMatchesForAccessory:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  NSObject *v18;
  void *v19;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  HFMediaSystemBuilder *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!objc_msgSend(v5, "hf_isHomePod"))
    goto LABEL_22;
  v6 = objc_msgSend(v5, "supportedStereoPairVersions");
  if (!v6)
  {
    HFLogForCategory(0);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
LABEL_21:

LABEL_22:
      v17 = 0;
      goto LABEL_23;
    }
    NSStringFromSelector(a2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v28 = self;
    v29 = 2112;
    v30 = v19;
    v31 = 2112;
    v32 = v5;
    _os_log_error_impl(&dword_1DD34E000, v18, OS_LOG_TYPE_ERROR, "%@:%@ Found no stereo pairing versions in accessory: %@", buf, 0x20u);
LABEL_25:

    goto LABEL_21;
  }
  v7 = v6;
  -[HFMediaSystemBuilder accessories](self, "accessories");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
    v9 = 0;
  else
    v9 = 0x7FFFFFFFFFFFFFFFLL;

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[HFMediaSystemBuilder accessories](self, "accessories", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v10);
        v15 = objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "supportedStereoPairVersions");
        if (v9)
          v16 = v9;
        else
          v16 = -1;
        v9 = v15 & v16;
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v12);
  }

  if (!v9)
  {
    HFLogForCategory(0);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_21;
    NSStringFromSelector(a2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFMediaSystemBuilder accessories](self, "accessories");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v28 = self;
    v29 = 2112;
    v30 = v19;
    v31 = 2112;
    v32 = v21;
    _os_log_error_impl(&dword_1DD34E000, v18, OS_LOG_TYPE_ERROR, "%@:%@ Found no stereo pairing versions in accessories: %@", buf, 0x20u);

    goto LABEL_25;
  }
  v17 = (v9 & v7) != 0;
LABEL_23:

  return v17;
}

- (BOOL)swapRoles
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  BOOL v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  id (*v14)(uint64_t);
  void *v15;
  id v16;
  id v17;

  objc_msgSend(MEMORY[0x1E0CBA688], "leftRole");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMediaSystemBuilder accessoryForRole:](self, "accessoryForRole:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CBA688], "rightRole");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMediaSystemBuilder accessoryForRole:](self, "accessoryForRole:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v7 = v6 == 0;
  else
    v7 = 1;
  v8 = !v7;
  if (!v7)
  {
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __33__HFMediaSystemBuilder_swapRoles__block_invoke;
    v15 = &unk_1EA732F98;
    v16 = v6;
    v17 = v4;
    __33__HFMediaSystemBuilder_swapRoles__block_invoke((uint64_t)&v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFMediaSystemBuilder homeKitMediaSystemBuilder](self, "homeKitMediaSystemBuilder", v12, v13, v14, v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setComponents:", v9);

  }
  return v8;
}

id __33__HFMediaSystemBuilder_swapRoles__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = (void *)objc_opt_new();
  v3 = objc_alloc(MEMORY[0x1E0CBA678]);
  objc_msgSend(*(id *)(a1 + 32), "mediaProfile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CBA688], "leftRole");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithMediaProfile:role:", v4, v5);
  objc_msgSend(v2, "addObject:", v6);

  v7 = objc_alloc(MEMORY[0x1E0CBA678]);
  objc_msgSend(*(id *)(a1 + 40), "mediaProfile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CBA688], "rightRole");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithMediaProfile:role:", v8, v9);
  objc_msgSend(v2, "addObject:", v10);

  return v2;
}

- (id)commitItem
{
  void *v4;
  char v5;
  void *v6;
  __CFString **v7;
  __CFString *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  NSObject *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  __CFString *v25;
  SEL v26;
  _QWORD v27[6];
  _QWORD v28[6];
  _QWORD v29[6];
  _QWORD v30[6];
  _QWORD v31[6];
  _QWORD v32[6];
  _QWORD v33[6];
  _QWORD v34[5];
  uint8_t buf[4];
  HFMediaSystemBuilder *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  -[HFItemBuilder home](self, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hf_currentUserIsAdministrator");

  if ((v5 & 1) != 0)
  {
    -[HFMediaSystemBuilder mediaSystem](self, "mediaSystem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = HFOperationEditMediaSystem;
    if (!v6)
      v7 = HFOperationAddMediaSystem;
    v8 = *v7;

    -[HFMediaSystemBuilder _updateRoom](self, "_updateRoom");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __34__HFMediaSystemBuilder_commitItem__block_invoke;
    v34[3] = &unk_1EA726940;
    v34[4] = self;
    objc_msgSend(v23, "flatMap:", v34);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v9;
    v33[1] = 3221225472;
    v33[2] = __34__HFMediaSystemBuilder_commitItem__block_invoke_2;
    v33[3] = &unk_1EA728F30;
    v33[4] = self;
    v33[5] = a2;
    objc_msgSend(v22, "flatMap:", v33);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v9;
    v32[1] = 3221225472;
    v32[2] = __34__HFMediaSystemBuilder_commitItem__block_invoke_47;
    v32[3] = &unk_1EA728F30;
    v32[4] = self;
    v32[5] = a2;
    objc_msgSend(v21, "flatMap:", v32);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v9;
    v31[1] = 3221225472;
    v31[2] = __34__HFMediaSystemBuilder_commitItem__block_invoke_49;
    v31[3] = &unk_1EA728F30;
    v31[4] = self;
    v31[5] = a2;
    objc_msgSend(v10, "flatMap:", v31);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v9;
    v30[1] = 3221225472;
    v30[2] = __34__HFMediaSystemBuilder_commitItem__block_invoke_50;
    v30[3] = &unk_1EA728F30;
    v30[4] = self;
    v30[5] = a2;
    objc_msgSend(v11, "flatMap:", v30);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v9;
    v29[1] = 3221225472;
    v29[2] = __34__HFMediaSystemBuilder_commitItem__block_invoke_51;
    v29[3] = &unk_1EA728F30;
    v29[4] = self;
    v29[5] = a2;
    objc_msgSend(v12, "flatMap:", v29);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v9;
    v28[1] = 3221225472;
    v28[2] = __34__HFMediaSystemBuilder_commitItem__block_invoke_55;
    v28[3] = &unk_1EA728F30;
    v28[4] = self;
    v28[5] = a2;
    objc_msgSend(v13, "flatMap:", v28);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v9;
    v27[1] = 3221225472;
    v27[2] = __34__HFMediaSystemBuilder_commitItem__block_invoke_56;
    v27[3] = &unk_1EA728F30;
    v27[4] = self;
    v27[5] = a2;
    objc_msgSend(v14, "flatMap:", v27);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v9;
    v24[1] = 3221225472;
    v24[2] = __34__HFMediaSystemBuilder_commitItem__block_invoke_57;
    v24[3] = &unk_1EA732FE0;
    v25 = v8;
    v26 = a2;
    v24[4] = self;
    v16 = v8;
    objc_msgSend(v15, "recover:", v24);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    HFLogForCategory(0);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v36 = self;
      v37 = 2112;
      v38 = v20;
      _os_log_error_impl(&dword_1DD34E000, v18, OS_LOG_TYPE_ERROR, "%@:%@ : Can't commit, user is NOT admin", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v17;
}

uint64_t __34__HFMediaSystemBuilder_commitItem__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_arbitrateMusicAccount");
}

id __34__HFMediaSystemBuilder_commitItem__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v4 = *(_QWORD *)(a1 + 32);
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = v4;
    v8 = 2112;
    v9 = v5;
    _os_log_debug_impl(&dword_1DD34E000, v2, OS_LOG_TYPE_DEBUG, "%@:%@ : account arbitrator future succeeded... on to next", (uint8_t *)&v6, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "_commitChangesToMediaSystemBuilder");
  return (id)objc_claimAutoreleasedReturnValue();
}

id __34__HFMediaSystemBuilder_commitItem__block_invoke_47(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  void *v9;
  _QWORD v10[2];
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v8 = *(_QWORD *)(a1 + 32);
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    _os_log_debug_impl(&dword_1DD34E000, v2, OS_LOG_TYPE_DEBUG, "%@:%@ : commit changes future succeeded... on to next", buf, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "_updateValueForContextType:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_updateValueForContextType:", 3, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D519C0], "combineAllFutures:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __34__HFMediaSystemBuilder_commitItem__block_invoke_49(uint64_t a1)
{
  NSObject *v2;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v4 = *(_QWORD *)(a1 + 32);
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = v4;
    v8 = 2112;
    v9 = v5;
    _os_log_debug_impl(&dword_1DD34E000, v2, OS_LOG_TYPE_DEBUG, "%@:%@ : update favorite future succeeded... on to next", (uint8_t *)&v6, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "_updateAssistantAccessControl");
  return (id)objc_claimAutoreleasedReturnValue();
}

id __34__HFMediaSystemBuilder_commitItem__block_invoke_50(uint64_t a1)
{
  NSObject *v2;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v4 = *(_QWORD *)(a1 + 32);
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = v4;
    v8 = 2112;
    v9 = v5;
    _os_log_debug_impl(&dword_1DD34E000, v2, OS_LOG_TYPE_DEBUG, "%@:%@ : update assistant access control succeeded... on to next", (uint8_t *)&v6, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "_updatePreferredMediaUser");
  return (id)objc_claimAutoreleasedReturnValue();
}

id __34__HFMediaSystemBuilder_commitItem__block_invoke_51(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "accessories");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "na_all:", &__block_literal_global_54_0);

  HFLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v6 = *(_QWORD *)(a1 + 32);
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v6;
      v14 = 2112;
      v15 = v7;
      _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@ : update audio analysis notification settings... on to next", (uint8_t *)&v12, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "_updateAudioAnalysisSoundNotificationSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v5)
    {
      v9 = *(_QWORD *)(a1 + 32);
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v9;
      v14 = 2112;
      v15 = v10;
      _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@ : audio analysis not supported. Skipping step... on to next", (uint8_t *)&v12, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

uint64_t __34__HFMediaSystemBuilder_commitItem__block_invoke_2_52(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isAudioAnalysisSupportedDevice");
}

id __34__HFMediaSystemBuilder_commitItem__block_invoke_55(uint64_t a1)
{
  NSObject *v2;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v4 = *(_QWORD *)(a1 + 32);
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = v4;
    v8 = 2112;
    v9 = v5;
    _os_log_debug_impl(&dword_1DD34E000, v2, OS_LOG_TYPE_DEBUG, "%@:%@ : update preferred media user succeeded... on to next", (uint8_t *)&v6, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "_updateSiriLanguageOptionsManager");
  return (id)objc_claimAutoreleasedReturnValue();
}

id __34__HFMediaSystemBuilder_commitItem__block_invoke_56(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v7 = *(_QWORD *)(a1 + 32);
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    _os_log_debug_impl(&dword_1DD34E000, v2, OS_LOG_TYPE_DEBUG, "%@:%@ : update siri language options manager succeeded... on to next", (uint8_t *)&v9, 0x16u);

  }
  v3 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(*(id *)(a1 + 32), "mediaSystem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "futureWithResult:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __34__HFMediaSystemBuilder_commitItem__block_invoke_57(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v11 = *(_QWORD *)(a1 + 32);
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412802;
    v14 = v11;
    v15 = 2112;
    v16 = v12;
    v17 = 2112;
    v18 = v3;
    _os_log_error_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_ERROR, "%@:%@ : One of the commit futures failed with error %@", (uint8_t *)&v13, 0x20u);

  }
  v5 = (void *)MEMORY[0x1E0D519C0];
  v6 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hf_errorWithOperationType:failedItemName:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "futureWithError:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_commitChangesToMediaSystemBuilder
{
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  int v17;
  int v18;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v27[6];
  char v28;
  char v29;
  BOOL v30;
  _QWORD v31[6];
  BOOL v32;
  _QWORD v33[5];
  uint8_t buf[4];
  HFMediaSystemBuilder *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  _BOOL4 v39;
  __int16 v40;
  int v41;
  __int16 v42;
  int v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  -[HFMediaSystemBuilder mediaSystem](self, "mediaSystem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 == 0;

  if (v4)
  {
    -[HFMediaSystemBuilder mediaSystem](self, "mediaSystem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "components");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFMediaSystemBuilder homeKitMediaSystemBuilder](self, "homeKitMediaSystemBuilder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "components");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "isEqual:", v9) ^ 1;

    -[HFMediaSystemBuilder mediaSystem](self, "mediaSystem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "configuredName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFMediaSystemBuilder homeKitMediaSystemBuilder](self, "homeKitMediaSystemBuilder");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "configuredName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v12;
    v16 = v14;
    if (v15 == v16)
    {
      v17 = 0;
    }
    else if (v15)
    {
      v17 = objc_msgSend(v15, "isEqual:", v16) ^ 1;
    }
    else
    {
      v17 = 1;
    }

    v18 = v17;
  }
  else
  {
    v18 = 0;
    v10 = 0;
    v17 = 1;
  }
  HFLogForCategory(0);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = v4 == 0;
    NSStringFromSelector(a2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v35 = self;
    v36 = 2112;
    v37 = v21;
    v38 = 1024;
    v39 = v20;
    v40 = 1024;
    v41 = v10;
    v42 = 1024;
    v43 = v18;
    _os_log_impl(&dword_1DD34E000, v19, OS_LOG_TYPE_DEFAULT, "%@:%@ : Creating New Media System: %{BOOL}d / Existing Media System: updating components %{BOOL}d/ updating name %{BOOL}d", buf, 0x28u);

  }
  if (((v17 | v10) & 1) != 0)
  {
    v22 = MEMORY[0x1E0C809B0];
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __58__HFMediaSystemBuilder__commitChangesToMediaSystemBuilder__block_invoke;
    v33[3] = &unk_1EA728A78;
    v33[4] = self;
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithBlock:", v33);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v22;
    v31[1] = 3221225472;
    v31[2] = __58__HFMediaSystemBuilder__commitChangesToMediaSystemBuilder__block_invoke_3;
    v31[3] = &unk_1EA733030;
    v31[4] = self;
    v31[5] = a2;
    v32 = v5;
    objc_msgSend(v23, "addFailureBlock:", v31);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v22;
    v27[1] = 3221225472;
    v27[2] = __58__HFMediaSystemBuilder__commitChangesToMediaSystemBuilder__block_invoke_66;
    v27[3] = &unk_1EA733080;
    v27[4] = self;
    v27[5] = a2;
    v28 = v10;
    v29 = v18;
    v30 = v5;
    objc_msgSend(v24, "addSuccessBlock:", v27);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v25;
}

void __58__HFMediaSystemBuilder__commitChangesToMediaSystemBuilder__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "homeKitMediaSystemBuilder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__HFMediaSystemBuilder__commitChangesToMediaSystemBuilder__block_invoke_2;
  v7[3] = &unk_1EA733008;
  v5 = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "commitWithCompletionHandler:", v7);

}

void __58__HFMediaSystemBuilder__commitChangesToMediaSystemBuilder__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v7 = v5;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "setMediaSystem:", v5);
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA668]), "initWithMediaSystem:", v7);
    objc_msgSend(*(id *)(a1 + 40), "setHomeKitMediaSystemBuilder:", v6);

    objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", v7);
  }

}

void __58__HFMediaSystemBuilder__commitChangesToMediaSystemBuilder__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412802;
    v11 = v5;
    v12 = 2112;
    v13 = v6;
    v14 = 2112;
    v15 = v3;
    _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@ : Commit Future FAILED with error %@", (uint8_t *)&v10, 0x20u);

  }
  +[HFErrorHandler sharedHandler](HFErrorHandler, "sharedHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (*(_BYTE *)(a1 + 48))
    v9 = CFSTR("HFMediaSystemBuilder.createMediaSystem");
  else
    v9 = CFSTR("HFMediaSystemBuilder.updateMediaSystem");
  objc_msgSend(v7, "logError:operationDescription:", v3, v9);

}

void __58__HFMediaSystemBuilder__commitChangesToMediaSystemBuilder__block_invoke_66(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[5];
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  HFLogForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v18 = v8;
    v19 = 2112;
    v20 = v9;
    v21 = 2112;
    v22 = v6;
    _os_log_impl(&dword_1DD34E000, v7, OS_LOG_TYPE_DEFAULT, "%@:%@ : Commit Future SUCCEED: %@", buf, 0x20u);

  }
  v10 = MEMORY[0x1E0C809B0];
  if (*(_BYTE *)(a1 + 48))
  {
    +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v10;
    v16[1] = 3221225472;
    v16[2] = __58__HFMediaSystemBuilder__commitChangesToMediaSystemBuilder__block_invoke_67;
    v16[3] = &unk_1EA733058;
    v16[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v11, "dispatchMediaObjectObserverMessage:sender:", v16, 0);

  }
  if (*(_BYTE *)(a1 + 49))
  {
    +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v10;
    v15[1] = 3221225472;
    v15[2] = __58__HFMediaSystemBuilder__commitChangesToMediaSystemBuilder__block_invoke_2_71;
    v15[3] = &unk_1EA733058;
    v15[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v12, "dispatchMediaObjectObserverMessage:sender:", v15, 0);

  }
  if (*(_BYTE *)(a1 + 50))
  {
    +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v10;
    v14[1] = 3221225472;
    v14[2] = __58__HFMediaSystemBuilder__commitChangesToMediaSystemBuilder__block_invoke_3_74;
    v14[3] = &unk_1EA726918;
    v14[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v13, "dispatchHomeObserverMessage:sender:", v14, 0);

  }
}

void __58__HFMediaSystemBuilder__commitChangesToMediaSystemBuilder__block_invoke_67(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "mediaSystem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "mediaSystem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "components");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mediaSystem:didUpdateComponents:", v3, v5);

  }
}

void __58__HFMediaSystemBuilder__commitChangesToMediaSystemBuilder__block_invoke_2_71(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "mediaSystem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "mediaSystem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "configuredName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mediaSystem:didUpdateName:", v3, v5);

  }
}

void __58__HFMediaSystemBuilder__commitChangesToMediaSystemBuilder__block_invoke_3_74(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "home");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "mediaSystem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "home:didAddMediaSystem:", v3, v4);

  }
}

- (id)_arbitrateMusicAccount
{
  void *v2;
  void *v3;
  void *v4;

  -[HFMediaSystemBuilder accountArbitrator](self, "accountArbitrator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "pendingArbitrationExecutionFuture");
  else
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_setHomeTheaterSource:(id)a3 toDestination:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(a3, "hf_backingAccessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "audioDestinationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  HFLogForCategory(0x26uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v25 = "-[HFMediaSystemBuilder _setHomeTheaterSource:toDestination:]";
    v26 = 2112;
    v27 = v7;
    v28 = 2112;
    v29 = v5;
    _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "(%s) setting Apple TV (%@) Home Theater destination to %@", buf, 0x20u);
  }

  v9 = (void *)MEMORY[0x1E0D519C0];
  v10 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __60__HFMediaSystemBuilder__setHomeTheaterSource_toDestination___block_invoke;
  v21[3] = &unk_1EA728590;
  v11 = v7;
  v22 = v11;
  v12 = v5;
  v23 = v12;
  objc_msgSend(v9, "futureWithErrorOnlyHandlerAdapterBlock:", v21);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v10;
  v18[1] = 3221225472;
  v18[2] = __60__HFMediaSystemBuilder__setHomeTheaterSource_toDestination___block_invoke_2;
  v18[3] = &unk_1EA72A0C8;
  v19 = v11;
  v20 = v12;
  v14 = v12;
  v15 = v11;
  objc_msgSend(v13, "addCompletionBlock:", v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

uint64_t __60__HFMediaSystemBuilder__setHomeTheaterSource_toDestination___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateDestination:options:completionHandler:", *(_QWORD *)(a1 + 40), 2, a2);
}

void __60__HFMediaSystemBuilder__setHomeTheaterSource_toDestination___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory(0x26uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v8 = 136315906;
    v9 = "-[HFMediaSystemBuilder _setHomeTheaterSource:toDestination:]_block_invoke_2";
    v10 = 2112;
    v11 = v6;
    v12 = 2112;
    v13 = v7;
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "(%s) After setting Apple TV (%@) Home Theater destination, it is %@ (w/ error %@)", (uint8_t *)&v8, 0x2Au);
  }

}

- (id)_updateValueForContextType:(unint64_t)a3
{
  _BOOL8 v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  int v9;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[5];

  switch(a3)
  {
    case 0uLL:
    case 2uLL:
      v5 = -[HFMediaSystemBuilder isFavorite](self, "isFavorite");
      goto LABEL_6;
    case 1uLL:
      NSLog(CFSTR("Include in status is not configured by HFMediaSystemBuilder."), a2);
      goto LABEL_10;
    case 3uLL:
      v5 = -[HFMediaSystemBuilder showInHomeDashboard](self, "showInHomeDashboard");
LABEL_6:
      v6 = v5;
      goto LABEL_7;
    default:
      v6 = 0;
LABEL_7:
      -[HFMediaSystemBuilder mediaSystem](self, "mediaSystem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == objc_msgSend(v7, "hf_isOnForContextType:", a3))
      {
        -[HFMediaSystemBuilder mediaSystem](self, "mediaSystem");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "hf_hasSetForContextType:", a3);

        if (v9)
        {
LABEL_10:
          objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
          return (id)objc_claimAutoreleasedReturnValue();
        }
      }
      else
      {

      }
      -[HFMediaSystemBuilder mediaSystem](self, "mediaSystem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "hf_updateValue:forContextType:", v6, a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = (id)objc_msgSend(v12, "addFailureBlock:", &__block_literal_global_81);
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __51__HFMediaSystemBuilder__updateValueForContextType___block_invoke_2;
      v15[3] = &unk_1EA726940;
      v15[4] = self;
      objc_msgSend(v12, "flatMap:", v15);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      return v14;
  }
}

void __51__HFMediaSystemBuilder__updateValueForContextType___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  +[HFErrorHandler sharedHandler](HFErrorHandler, "sharedHandler");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logError:operationDescription:", v2, CFSTR("HFMediaSystemBuilder.updateApplicationDataForContextType"));

}

id __51__HFMediaSystemBuilder__updateValueForContextType___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v13;
  _QWORD v14[5];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v13 = a2;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "accessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    v7 = MEMORY[0x1E0C809B0];
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v8);
        +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v14[0] = v7;
        v14[1] = 3221225472;
        v14[2] = __51__HFMediaSystemBuilder__updateValueForContextType___block_invoke_3;
        v14[3] = &unk_1EA7263F0;
        v14[4] = v9;
        objc_msgSend(v10, "dispatchAccessoryObserverMessage:sender:", v14, 0);

        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void __51__HFMediaSystemBuilder__updateValueForContextType___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "accessoryDidUpdateApplicationData:", *(_QWORD *)(a1 + 32));

}

- (id)_updateRoom
{
  HFRoomBuilder *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  HFRoomBuilder *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!-[HFMediaSystemBuilder hasSetRoom](self, "hasSetRoom"))
  {
    v3 = [HFRoomBuilder alloc];
    -[HFMediaSystemBuilder mediaSystem](self, "mediaSystem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hf_parentRoom");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFMediaSystemBuilder mediaSystem](self, "mediaSystem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hf_home");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[HFRoomBuilder initWithExistingObject:inHome:](v3, "initWithExistingObject:inHome:", v5, v7);
    -[HFMediaSystemBuilder setRoomBuilder:](self, "setRoomBuilder:", v8);

  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[HFMediaSystemBuilder accessories](self, "accessories", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v13);
        -[HFMediaSystemBuilder room](self, "room");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addAccessory:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }

  -[HFMediaSystemBuilder room](self, "room");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "commitItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)_updateAssistantAccessControl
{
  _BOOL4 v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  _QWORD v28[5];
  id v29;
  _QWORD v30[4];
  id v31;
  HFMediaSystemBuilder *v32;
  _QWORD v33[5];
  uint8_t buf[4];
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = -[HFMediaSystemBuilder isCreatingMediaSystem](self, "isCreatingMediaSystem");
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[HFItemBuilder home](self, "home");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentUser");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFItemBuilder home](self, "home");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "assistantAccessControlForHome:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    objc_msgSend(v9, "accessories");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11)
    {
      objc_msgSend(v9, "accessories");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = MEMORY[0x1E0C809B0];
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __53__HFMediaSystemBuilder__updateAssistantAccessControl__block_invoke;
      v33[3] = &unk_1EA727840;
      v33[4] = self;
      objc_msgSend(v12, "na_filter:", v33);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "accessories");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count");
      v17 = objc_msgSend(v14, "count");

      -[HFMediaSystemBuilder accessories](self, "accessories");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "count");

      if (v16 == v17 || v16 - v17 != v19)
      {
        HFLogForCategory(0);
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          -[HFMediaSystemBuilder mediaSystem](self, "mediaSystem");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v35 = v21;
          _os_log_impl(&dword_1DD34E000, v20, OS_LOG_TYPE_DEFAULT, "Mismatch between Personal Requests options for the media system %@", buf, 0xCu);

        }
        objc_msgSend(v9, "setAccessories:", v14);
        v22 = (void *)MEMORY[0x1E0D519C0];
        v30[0] = v13;
        v30[1] = 3221225472;
        v30[2] = __53__HFMediaSystemBuilder__updateAssistantAccessControl__block_invoke_87;
        v30[3] = &unk_1EA728590;
        v23 = v9;
        v31 = v23;
        v32 = self;
        objc_msgSend(v22, "futureWithErrorOnlyHandlerAdapterBlock:", v30);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v28[0] = v13;
        v28[1] = 3221225472;
        v28[2] = __53__HFMediaSystemBuilder__updateAssistantAccessControl__block_invoke_88;
        v28[3] = &unk_1EA72CB68;
        v28[4] = self;
        v29 = v23;
        objc_msgSend(v24, "addSuccessBlock:", v28);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "addFailureBlock:", &__block_literal_global_92_1);
        v26 = objc_claimAutoreleasedReturnValue();

        v4 = (id)v26;
      }
      v4 = v4;

    }
    else
    {
      v4 = v4;
    }

  }
  return v4;
}

uint64_t __53__HFMediaSystemBuilder__updateAssistantAccessControl__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  int v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "accessories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5 ^ 1u;
}

void __53__HFMediaSystemBuilder__updateAssistantAccessControl__block_invoke_87(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory(0);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "mediaSystem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_1DD34E000, v4, OS_LOG_TYPE_DEFAULT, "Updating Personal Requests %@ for media system %@", (uint8_t *)&v11, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 40), "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentUser");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateAssistantAccessControl:forHome:completionHandler:", v9, v10, v3);

}

void __53__HFMediaSystemBuilder__updateAssistantAccessControl__block_invoke_88(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__HFMediaSystemBuilder__updateAssistantAccessControl__block_invoke_2;
  v4[3] = &unk_1EA72EC28;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v2, "dispatchUserObserverMessage:sender:", v4, 0);

}

void __53__HFMediaSystemBuilder__updateAssistantAccessControl__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "home");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "currentUser");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "home");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "user:didUpdateAssistantAccessControl:forHome:", v4, v5, v6);

  }
}

void __53__HFMediaSystemBuilder__updateAssistantAccessControl__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  +[HFErrorHandler sharedHandler](HFErrorHandler, "sharedHandler");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logError:operationDescription:", v2, CFSTR("HFMediaSystemBuilder.updateAssistantAccessControl"));

}

- (id)_updateSiriLanguageOptionsManager
{
  void *v3;
  id v4;

  if (-[HFMediaSystemBuilder isCreatingMediaSystem](self, "isCreatingMediaSystem"))
  {
    -[HFMediaSystemBuilder mediaSystem](self, "mediaSystem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (id)objc_msgSend(v3, "hf_siriLanguageOptionsManager");

  }
  return (id)objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
}

- (id)_updatePreferredMediaUser
{
  void *v3;
  void *v4;
  _BOOL8 v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[7];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (-[HFMediaSystemBuilder isCreatingMediaSystem](self, "isCreatingMediaSystem"))
  {
    v3 = (void *)objc_opt_new();
    -[HFMediaSystemBuilder preferredMediaUser](self, "preferredMediaUser");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[HFMediaSystemBuilder accessories](self, "accessories");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if (objc_msgSend(v11, "supportsPreferredMediaUser"))
          {
            v15[0] = MEMORY[0x1E0C809B0];
            v15[1] = 3221225472;
            v15[2] = __49__HFMediaSystemBuilder__updatePreferredMediaUser__block_invoke;
            v15[3] = &unk_1EA7330E8;
            v15[5] = self;
            v15[6] = v5;
            v15[4] = v11;
            objc_msgSend(MEMORY[0x1E0D519C0], "futureWithBlock:", v15);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "addObject:", v12);

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v8);
    }

    objc_msgSend(MEMORY[0x1E0D519C0], "combineAllFutures:", v3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v13;
}

void __49__HFMediaSystemBuilder__updatePreferredMediaUser__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "preferredMediaUser");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__HFMediaSystemBuilder__updatePreferredMediaUser__block_invoke_2;
  v8[3] = &unk_1EA726360;
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v7 = v3;
  objc_msgSend(v5, "updatePreferredMediaUserSelectionType:user:completionHandler:", v4, v6, v8);

}

void __49__HFMediaSystemBuilder__updatePreferredMediaUser__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  HFLogForCategory(0x34uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138412546;
      v9 = v7;
      v10 = 2112;
      v11 = v3;
      _os_log_error_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_ERROR, "Failed to update primary user for accessory %@ with error %@", (uint8_t *)&v8, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 40), "finishWithError:", v3);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v8 = 138412290;
      v9 = v6;
      _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "Successfully updated primary user setting for accessory %@", (uint8_t *)&v8, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "finishWithNoResult");
  }

}

- (id)_updateAudioAnalysisSoundNotificationSettings
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  NSObject *v8;
  void *v9;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  int v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  _DWORD v32[2];
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (!-[HFMediaSystemBuilder isCreatingMediaSystem](self, "isCreatingMediaSystem"))
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0CBA688], "leftRole");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMediaSystemBuilder accessoryForRole:](self, "accessoryForRole:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CBA688], "rightRole");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFMediaSystemBuilder accessoryForRole:](self, "accessoryForRole:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    HFLogForCategory(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v32[0]) = 0;
      _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "Unable to find accessories in media system", (uint8_t *)v32, 2u);
    }

    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_28;
  }
  v11 = v4;
  if (objc_msgSend(v11, "conformsToProtocol:", &unk_1F0427780))
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  v14 = v6;
  if (objc_msgSend(v14, "conformsToProtocol:", &unk_1F0427780))
    v15 = v14;
  else
    v15 = 0;
  v16 = v15;

  objc_msgSend(v13, "hf_userNotificationSettings");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "mutableCopy");

  objc_msgSend(v16, "hf_userNotificationSettings");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "mutableCopy");

  v21 = objc_msgSend(v18, "areNotificationsEnabled");
  v22 = objc_msgSend(v20, "areNotificationsEnabled");
  HFLogForCategory(0);
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v32[0] = 67109376;
    v32[1] = v21;
    v33 = 1024;
    v34 = v22;
    _os_log_impl(&dword_1DD34E000, v23, OS_LOG_TYPE_DEFAULT, "Is left notification settings enabled? %{BOOL}d Is right notification settings enabled? %{BOOL}d", (uint8_t *)v32, 0xEu);
  }

  if (v21)
  {
    objc_msgSend(v18, "notificationCondition");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFConditionCollection conditionCollectionForPredicate:](HFConditionCollection, "conditionCollectionForPredicate:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v25, "predicate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setNotificationCondition:", v26);

    objc_msgSend(v20, "setNotificationsEnabled:", 1);
    v27 = v16;
    v28 = v20;
  }
  else
  {
    if (!v22)
    {
      HFLogForCategory(0);
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v32[0]) = 0;
        _os_log_impl(&dword_1DD34E000, v31, OS_LOG_TYPE_DEFAULT, "Neither accessory has notification settings enabled. No action needed.", (uint8_t *)v32, 2u);
      }

      objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_27;
    }
    objc_msgSend(v20, "notificationCondition");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFConditionCollection conditionCollectionForPredicate:](HFConditionCollection, "conditionCollectionForPredicate:", v29);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v25, "predicate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setNotificationCondition:", v30);

    objc_msgSend(v18, "setNotificationsEnabled:", 1);
    v27 = v13;
    v28 = v18;
  }
  objc_msgSend(v27, "hf_updateUserNotificationSettings:", v28);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_27:
LABEL_28:

  return v9;
}

- (id)_rooms
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3550], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[HFMediaSystemBuilder accessories](self, "accessories", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "room");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "na_safeAddObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (NSString)originalName
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[HFMediaSystemBuilder homeKitMediaSystemBuilder](self, "homeKitMediaSystemBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "configuredName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[HFMediaSystemBuilder _defaultName](self, "_defaultName");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return (NSString *)v7;
}

- (id)_defaultName
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[HFMediaSystemBuilder accessories](self, "accessories", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v8, "hf_isHomePod") & 1) != 0)
        {
          +[HFNamingComponents namingComponentFromAccessory:](HFNamingComponents, "namingComponentFromAccessory:", v8);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "defaultName");
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }

  -[HFMediaSystemBuilder mediaSystem](self, "mediaSystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v9;
}

- (BOOL)supportsFavoriting
{
  return 1;
}

- (HFRoomBuilder)room
{
  HFRoomBuilder *roomBuilder;
  HFRoomBuilder *v4;
  void *v5;
  HFRoomBuilder *v6;
  HFRoomBuilder *v7;

  roomBuilder = self->_roomBuilder;
  if (!roomBuilder)
  {
    v4 = [HFRoomBuilder alloc];
    -[HFItemBuilder home](self, "home");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[HFItemBuilder initWithHome:](v4, "initWithHome:", v5);
    v7 = self->_roomBuilder;
    self->_roomBuilder = v6;

    roomBuilder = self->_roomBuilder;
  }
  return roomBuilder;
}

- (void)setRoom:(id)a3
{
  HFRoomBuilder *v4;
  HFRoomBuilder *roomBuilder;

  v4 = (HFRoomBuilder *)a3;
  -[HFMediaSystemBuilder setHasSetRoom:](self, "setHasSetRoom:", 1);
  roomBuilder = self->_roomBuilder;
  self->_roomBuilder = v4;

}

- (id)_firstUnpopulatedRole
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E40];
  -[HFMediaSystemBuilder homeKitMediaSystemBuilder](self, "homeKitMediaSystemBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "components");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_map:", &__block_literal_global_153);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0C99E40];
  objc_msgSend(MEMORY[0x1E0CBA688], "leftRole");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v8;
  objc_msgSend(MEMORY[0x1E0CBA688], "rightRole");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "orderedSetWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v12 = v11;
  v13 = (id)objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v12);
        v16 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        if (!objc_msgSend(v6, "containsObject:", v16, (_QWORD)v18))
        {
          v13 = v16;
          goto LABEL_11;
        }
      }
      v13 = (id)objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v13)
        continue;
      break;
    }
  }
LABEL_11:

  return v13;
}

uint64_t __45__HFMediaSystemBuilder__firstUnpopulatedRole__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "role");
}

- (BOOL)isFavorite
{
  return self->_isFavorite;
}

- (void)setIsFavorite:(BOOL)a3
{
  self->_isFavorite = a3;
}

- (BOOL)showInHomeDashboard
{
  return self->_showInHomeDashboard;
}

- (void)setShowInHomeDashboard:(BOOL)a3
{
  self->_showInHomeDashboard = a3;
}

- (HFIconDescriptor)iconDescriptor
{
  return self->_iconDescriptor;
}

- (void)setIconDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_iconDescriptor, a3);
}

- (HFAppleMusicAccountArbitrator)accountArbitrator
{
  return self->_accountArbitrator;
}

- (void)setAccountArbitrator:(id)a3
{
  objc_storeStrong((id *)&self->_accountArbitrator, a3);
}

- (HMUser)preferredMediaUser
{
  return self->_preferredMediaUser;
}

- (void)setPreferredMediaUser:(id)a3
{
  objc_storeStrong((id *)&self->_preferredMediaUser, a3);
}

- (HMAccessory)firstSetupSourceAccessory
{
  return self->_firstSetupSourceAccessory;
}

- (void)setHomeKitMediaSystemBuilder:(id)a3
{
  objc_storeStrong((id *)&self->_homeKitMediaSystemBuilder, a3);
}

- (HFNamingComponents)namingComponent
{
  return self->_namingComponent;
}

- (void)setNamingComponent:(id)a3
{
  objc_storeStrong((id *)&self->_namingComponent, a3);
}

- (HFRoomBuilder)roomBuilder
{
  return self->_roomBuilder;
}

- (void)setRoomBuilder:(id)a3
{
  objc_storeStrong((id *)&self->_roomBuilder, a3);
}

- (BOOL)hasSetRoom
{
  return self->_hasSetRoom;
}

- (void)setHasSetRoom:(BOOL)a3
{
  self->_hasSetRoom = a3;
}

- (BOOL)isCreatingMediaSystem
{
  return self->_isCreatingMediaSystem;
}

- (void)setIsCreatingMediaSystem:(BOOL)a3
{
  self->_isCreatingMediaSystem = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roomBuilder, 0);
  objc_storeStrong((id *)&self->_namingComponent, 0);
  objc_storeStrong((id *)&self->_homeKitMediaSystemBuilder, 0);
  objc_storeStrong((id *)&self->_firstSetupSourceAccessory, 0);
  objc_storeStrong((id *)&self->_preferredMediaUser, 0);
  objc_storeStrong((id *)&self->_accountArbitrator, 0);
  objc_storeStrong((id *)&self->_iconDescriptor, 0);
}

@end
