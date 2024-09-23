@implementation HFDemoModeAccessoryBuilder

+ (Class)homeKitRepresentationClass
{
  return (Class)objc_opt_class();
}

- (HFDemoModeAccessoryBuilder)initWithExistingObject:(id)a3 inHome:(id)a4
{
  id v6;
  HFDemoModeAccessoryBuilder *v7;
  HFDemoModeAccessoryBuilder *v8;
  void *v9;
  void *v10;
  void *v11;
  HFRoomBuilder *v12;
  void *v13;
  void *v14;
  HFRoomBuilder *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v6 = a4;
  v19.receiver = self;
  v19.super_class = (Class)HFDemoModeAccessoryBuilder;
  v7 = -[HFItemBuilder initWithExistingObject:inHome:](&v19, sel_initWithExistingObject_inHome_, a3, v6);
  v8 = v7;
  if (v7)
  {
    -[HFItemBuilder homeKitRepresentation](v7, "homeKitRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFNamingComponents namingComponentFromAccessory:](HFNamingComponents, "namingComponentFromAccessory:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFDemoModeAccessoryBuilder setNamingComponent:](v8, "setNamingComponent:", v10);

    -[HFDemoModeAccessoryBuilder originalName](v8, "originalName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFDemoModeAccessoryBuilder setName:](v8, "setName:", v11);

    v12 = [HFRoomBuilder alloc];
    -[HFDemoModeAccessoryBuilder accessory](v8, "accessory");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "room");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[HFRoomBuilder initWithExistingObject:inHome:](v12, "initWithExistingObject:inHome:", v14, v6);
    -[HFDemoModeAccessoryBuilder setRoom:](v8, "setRoom:", v15);

    -[HFDemoModeAccessoryBuilder accessory](v8, "accessory");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFDemoModeAccessoryBuilder setShowInHomeDashboard:](v8, "setShowInHomeDashboard:", objc_msgSend(v16, "hf_effectiveShowInHomeDashboard"));

    -[HFDemoModeAccessoryBuilder accessory](v8, "accessory");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFDemoModeAccessoryBuilder setIsFavorite:](v8, "setIsFavorite:", objc_msgSend(v17, "hf_effectiveIsFavorite"));

  }
  return v8;
}

- (NSString)originalName
{
  void *v2;
  void *v3;

  -[HFDemoModeAccessoryBuilder namingComponent](self, "namingComponent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)accessories
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[HFDemoModeAccessoryBuilder accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)supportsFavoriting
{
  return 1;
}

- (id)removeItemFromHome
{
  return (id)objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
}

- (id)_performValidation
{
  return -[HFItemBuilder lazy_verifyPropertyIsSet:](self, "lazy_verifyPropertyIsSet:", CFSTR("room"));
}

- (id)commitItem
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  __CFString *v19;
  HFDemoModeAccessoryBuilder *v20;
  _QWORD v21[4];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  -[HFItemBuilder home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hf_currentUserIsAdministrator");

  if ((v4 & 1) != 0)
  {
    -[HFDemoModeAccessoryBuilder _lazilyUpdateValueForContextType:](self, "_lazilyUpdateValueForContextType:", 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v5;
    -[HFDemoModeAccessoryBuilder _lazilyUpdateValueForContextType:](self, "_lazilyUpdateValueForContextType:", 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D519C0], "combineAllFutures:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = CFSTR("HFOperationEditService");
    v10 = (void *)MEMORY[0x1E0D519C0];
    -[HFDemoModeAccessoryBuilder _performValidation](self, "_performValidation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v11;
    -[HFDemoModeAccessoryBuilder _lazilyUpdateName](self, "_lazilyUpdateName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v12;
    -[HFDemoModeAccessoryBuilder _lazilyUpdateRoom](self, "_lazilyUpdateRoom");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2] = v13;
    v21[3] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "chainFutures:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __40__HFDemoModeAccessoryBuilder_commitItem__block_invoke;
    v18[3] = &unk_1EA726990;
    v19 = v9;
    v20 = self;
    objc_msgSend(v15, "recover:", v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    return v16;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

id __40__HFDemoModeAccessoryBuilder_commitItem__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (void *)MEMORY[0x1E0D519C0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = a2;
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_errorWithOperationType:failedItemName:", v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "futureWithError:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_lazilyUpdateName
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[HFDemoModeAccessoryBuilder name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFDemoModeAccessoryBuilder originalName](self, "originalName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  v6 = v4;
  if (v5 == v6)
  {

    v9 = v5;
  }
  else
  {
    v7 = v6;
    if (v5)
    {
      v8 = objc_msgSend(v5, "isEqual:", v6);

      if ((v8 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    -[HFDemoModeAccessoryBuilder name](self, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFDemoModeAccessoryBuilder accessory](self, "accessory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "applicationData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v10, CFSTR("name"));

    +[HFDemoModeAccessoryManager sharedManager](HFDemoModeAccessoryManager, "sharedManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFDemoModeAccessoryBuilder accessory](self, "accessory");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dispatchUpdateMessageForAccessory:", v5);
  }

LABEL_9:
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_lazilyUpdateRoom
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  -[HFDemoModeAccessoryBuilder accessory](self, "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "room");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFDemoModeAccessoryBuilder room](self, "room");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "room");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "isEqual:", v8);

  if ((v9 & 1) == 0)
  {
    -[HFDemoModeAccessoryBuilder room](self, "room");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "room");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFDemoModeAccessoryBuilder accessory](self, "accessory");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "applicationData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v12, CFSTR("room"));

    +[HFDemoModeAccessoryManager sharedManager](HFDemoModeAccessoryManager, "sharedManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFDemoModeAccessoryBuilder accessory](self, "accessory");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dispatchUpdateMessageForAccessory:", v16);

  }
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)_lazilyUpdateValueForContextType:(unint64_t)a3
{
  _BOOL8 v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;

  switch(a3)
  {
    case 0uLL:
    case 2uLL:
      v5 = -[HFDemoModeAccessoryBuilder isFavorite](self, "isFavorite");
      goto LABEL_6;
    case 1uLL:
      NSLog(CFSTR("Include in status is not configured by HFDemoModeAccessoryBuilder."), a2);
      goto LABEL_11;
    case 3uLL:
      v5 = -[HFDemoModeAccessoryBuilder showInHomeDashboard](self, "showInHomeDashboard");
LABEL_6:
      v6 = v5;
      goto LABEL_7;
    default:
      v6 = 0;
LABEL_7:
      -[HFDemoModeAccessoryBuilder accessory](self, "accessory");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == objc_msgSend(v7, "hf_isOnForContextType:", a3))
      {
        -[HFDemoModeAccessoryBuilder accessory](self, "accessory");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "hf_hasSetForContextType:", a3);

        if ((v9 & 1) != 0)
          goto LABEL_11;
      }
      else
      {

      }
      -[HFDemoModeAccessoryBuilder accessory](self, "accessory");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (id)objc_msgSend(v10, "hf_updateValue:forContextType:", v6, a3);

      +[HFDemoModeAccessoryManager sharedManager](HFDemoModeAccessoryManager, "sharedManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFDemoModeAccessoryBuilder accessory](self, "accessory");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "dispatchUpdateMessageForAccessory:", v13);

LABEL_11:
      objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
      return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (NSString)name
{
  return self->name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (HFRoomBuilder)room
{
  return self->room;
}

- (void)setRoom:(id)a3
{
  objc_storeStrong((id *)&self->room, a3);
}

- (BOOL)isFavorite
{
  return self->isFavorite;
}

- (void)setIsFavorite:(BOOL)a3
{
  self->isFavorite = a3;
}

- (BOOL)showInHomeDashboard
{
  return self->showInHomeDashboard;
}

- (void)setShowInHomeDashboard:(BOOL)a3
{
  self->showInHomeDashboard = a3;
}

- (HFNamingComponents)namingComponent
{
  return self->_namingComponent;
}

- (void)setNamingComponent:(id)a3
{
  objc_storeStrong((id *)&self->_namingComponent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namingComponent, 0);
  objc_storeStrong((id *)&self->room, 0);
  objc_storeStrong((id *)&self->name, 0);
}

@end
