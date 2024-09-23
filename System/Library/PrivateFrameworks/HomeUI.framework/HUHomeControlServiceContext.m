@implementation HUHomeControlServiceContext

- (HUHomeControlServiceContext)initWithServiceType:(unint64_t)a3 homeIdentifier:(id)a4 roomIdentifier:(id)a5
{
  id v9;
  id v10;
  HUHomeControlServiceContext *v11;
  HUHomeControlServiceContext *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HUHomeControlServiceContext;
  v11 = -[HUHomeControlServiceContext init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_homeIdentifier, a4);
    objc_storeStrong((id *)&v12->_roomIdentifier, a5);
    v12->_serviceType = a3;
  }

  return v12;
}

- (HUHomeControlServiceContext)initWithServiceType:(unint64_t)a3 home:(id)a4 room:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HUHomeControlServiceContext *v14;
  uint64_t v15;
  NSString *homeName;
  uint64_t v17;
  NSString *roomName;

  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uniqueIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HUHomeControlServiceContext initWithServiceType:homeIdentifier:roomIdentifier:](self, "initWithServiceType:homeIdentifier:roomIdentifier:", a3, v11, v13);

  if (v14)
  {
    objc_msgSend(v8, "name");
    v15 = objc_claimAutoreleasedReturnValue();
    homeName = v14->_homeName;
    v14->_homeName = (NSString *)v15;

    objc_msgSend(v9, "name");
    v17 = objc_claimAutoreleasedReturnValue();
    roomName = v14->_roomName;
    v14->_roomName = (NSString *)v17;

  }
  return v14;
}

- (HUHomeControlServiceContext)initWithServiceType:(unint64_t)a3 homeIdentifier:(id)a4 accessoryIdentifier:(id)a5
{
  id v9;
  id v10;
  HUHomeControlServiceContext *v11;
  HUHomeControlServiceContext *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HUHomeControlServiceContext;
  v11 = -[HUHomeControlServiceContext init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_homeIdentifier, a4);
    objc_storeStrong((id *)&v12->_accessoryIdentifier, a5);
    v12->_serviceType = a3;
  }

  return v12;
}

- (HUHomeControlServiceContext)initWithServiceType:(unint64_t)a3 home:(id)a4 accessory:(id)a5 presentingViewController:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HUHomeControlServiceContext *v17;
  uint64_t v18;
  NSString *homeName;
  uint64_t v20;
  NSString *accessoryName;
  NSObject *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  int v27;
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v10, "uniqueIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "UUIDString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "uniqueIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "UUIDString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[HUHomeControlServiceContext initWithServiceType:homeIdentifier:accessoryIdentifier:](self, "initWithServiceType:homeIdentifier:accessoryIdentifier:", a3, v14, v16);

  if (v17)
  {
    objc_msgSend(v10, "name");
    v18 = objc_claimAutoreleasedReturnValue();
    homeName = v17->_homeName;
    v17->_homeName = (NSString *)v18;

    objc_msgSend(v11, "name");
    v20 = objc_claimAutoreleasedReturnValue();
    accessoryName = v17->_accessoryName;
    v17->_accessoryName = (NSString *)v20;

    objc_storeWeak((id *)&v17->_presentingViewController, v12);
    HFLogForCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[HUHomeControlServiceContext presentingViewController](v17, "presentingViewController");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138413058;
      v28 = v24;
      v29 = 2112;
      v30 = v10;
      v31 = 2112;
      v32 = v11;
      v33 = 2112;
      v34 = v25;
      _os_log_impl(&dword_1B8E1E000, v22, OS_LOG_TYPE_DEFAULT, "Initializing %@ with home %@, accessory name %@, presentingViewController = %@", (uint8_t *)&v27, 0x2Au);

    }
  }

  return v17;
}

- (HUHomeControlServiceContext)initWithServiceType:(unint64_t)a3 defaultActionURL:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  HUHomeControlServiceContext *v10;
  uint64_t v11;
  NSString *homeName;

  v7 = a4;
  +[HUHomeControlServiceContext _homeInfoFromDefaultActionURL:](HUHomeControlServiceContext, "_homeInfoFromDefaultActionURL:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("home-identifier-key"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HUHomeControlServiceContext initWithServiceType:homeIdentifier:roomIdentifier:](self, "initWithServiceType:homeIdentifier:roomIdentifier:", a3, v9, 0);

  if (v10)
  {
    objc_storeStrong((id *)&v10->_defaultActionURL, a4);
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("home-name-key"));
    v11 = objc_claimAutoreleasedReturnValue();
    homeName = v10->_homeName;
    v10->_homeName = (NSString *)v11;

  }
  return v10;
}

- (HUHomeControlServiceContext)initWithAlertConfigurationContext:(id)a3
{
  id v4;
  void *v5;
  HUHomeControlServiceContext *v6;
  uint64_t v7;
  NSSet *actions;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HUHomeControlServiceContext _initWithUserInfo:](self, "_initWithUserInfo:", v5);

  if (v6)
  {
    objc_msgSend(v4, "actions");
    v7 = objc_claimAutoreleasedReturnValue();
    actions = v6->_actions;
    v6->_actions = (NSSet *)v7;

  }
  return v6;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "Deallocating...", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)HUHomeControlServiceContext;
  -[HUHomeControlServiceContext dealloc](&v4, sel_dealloc);
}

- (id)userInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
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
  void *v20;
  void *v21;
  CGRect v23;
  CGRect v24;

  v3 = (void *)objc_opt_new();
  -[HUHomeControlServiceContext homeIdentifier](self, "homeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HUHomeControlServiceContext homeIdentifier](self, "homeIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("home-identifier-key"));

  }
  -[HUHomeControlServiceContext roomIdentifier](self, "roomIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HUHomeControlServiceContext roomIdentifier](self, "roomIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("room-identifier-key"));

  }
  -[HUHomeControlServiceContext accessoryIdentifier](self, "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HUHomeControlServiceContext accessoryIdentifier](self, "accessoryIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("accessory-identifier-key"));

  }
  -[HUHomeControlServiceContext homeName](self, "homeName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[HUHomeControlServiceContext homeName](self, "homeName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("home-name-key"));

  }
  -[HUHomeControlServiceContext roomName](self, "roomName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[HUHomeControlServiceContext roomName](self, "roomName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("room-name-key"));

  }
  -[HUHomeControlServiceContext accessoryName](self, "accessoryName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[HUHomeControlServiceContext accessoryName](self, "accessoryName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("accessory-name-key"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HUHomeControlServiceContext serviceType](self, "serviceType"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("service-type-key"));

  -[HUHomeControlServiceContext defaultActionURL](self, "defaultActionURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[HUHomeControlServiceContext defaultActionURL](self, "defaultActionURL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "absoluteString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("default-action-url-key"));

  }
  -[HUHomeControlServiceContext animationOriginRect](self, "animationOriginRect");
  if (!CGRectEqualToRect(v23, *MEMORY[0x1E0C9D648]))
  {
    -[HUHomeControlServiceContext animationOriginRect](self, "animationOriginRect");
    NSStringFromCGRect(v24);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("animation-origin-rect-key"));

  }
  v21 = (void *)objc_msgSend(v3, "copy");

  return v21;
}

- (id)_initWithUserInfo:(id)a3
{
  id v4;
  HUHomeControlServiceContext *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  NSURL *defaultActionURL;
  char v15;
  char v16;
  uint64_t v17;
  char v18;
  HUHomeControlServiceContext *v19;
  id v21;
  char v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)HUHomeControlServiceContext;
  v5 = -[HUHomeControlServiceContext init](&v28, sel_init);
  if (!v5)
    goto LABEL_32;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v7)
  {
    v8 = v7;
    v22 = 0;
    v23 = 0;
    v9 = *(_QWORD *)v25;
    v21 = v4;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKeyedSubscript:", v11, v21);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("home-identifier-key")))
        {
          objc_storeStrong((id *)&v5->_homeIdentifier, v12);
          LOBYTE(v23) = 1;
        }
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("room-identifier-key")))
          objc_storeStrong((id *)&v5->_roomIdentifier, v12);
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("accessory-identifier-key")))
        {
          objc_storeStrong((id *)&v5->_accessoryIdentifier, v12);
          BYTE4(v23) = 1;
        }
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("service-type-key")))
        {
          v5->_serviceType = objc_msgSend(v12, "unsignedIntValue");
          v22 = 1;
        }
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("home-name-key")))
          objc_storeStrong((id *)&v5->_homeName, v12);
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("room-name-key")))
          objc_storeStrong((id *)&v5->_roomName, v12);
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("accessory-name-key")))
          objc_storeStrong((id *)&v5->_accessoryName, v12);
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("default-action-url-key")))
        {
          objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v12);
          v13 = objc_claimAutoreleasedReturnValue();
          defaultActionURL = v5->_defaultActionURL;
          v5->_defaultActionURL = (NSURL *)v13;

        }
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("animation-origin-rect-key")))
          v5->_animationOriginRect = CGRectFromString((NSString *)v12);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v8);

    v15 = v22 & v23;
    v4 = v21;
    v16 = BYTE4(v23);
  }
  else
  {

    v16 = 0;
    v15 = 0;
  }
  v17 = -[HUHomeControlServiceContext serviceType](v5, "serviceType");
  v18 = v15 & v16;
  if (v17 != 2)
    v18 = v15;
  if ((v18 & 1) == 0)
    v19 = 0;
  else
LABEL_32:
    v19 = v5;

  return v19;
}

+ (id)_homeInfoFromDefaultActionURL:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  int v23;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3998];
  objc_msgSend(a3, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = v5;
  objc_msgSend(v5, "queryItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v27;
    v12 = *MEMORY[0x1E0CF7CB0];
    v13 = *MEMORY[0x1E0CF7CA0];
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v27 != v11)
          objc_enumerationMutation(v8);
        v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v15, "name");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqualToString:", v12);

        if (v17)
        {
          objc_msgSend(v15, "value");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v7;
          v20 = v18;
          v21 = CFSTR("home-name-key");
        }
        else
        {
          objc_msgSend(v15, "name");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "isEqualToString:", v13);

          if (!v23)
            continue;
          objc_msgSend(v15, "value");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v7;
          v20 = v18;
          v21 = CFSTR("home-identifier-key");
        }
        objc_msgSend(v19, "setObject:forKey:", v20, v21);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v10);
  }

  return v7;
}

- (SBUIRemoteAlertHostInterface)remoteViewControllerProxy
{
  return self->_remoteViewControllerProxy;
}

- (void)setRemoteViewControllerProxy:(id)a3
{
  objc_storeStrong((id *)&self->_remoteViewControllerProxy, a3);
}

- (CGRect)animationOriginRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_animationOriginRect.origin.x;
  y = self->_animationOriginRect.origin.y;
  width = self->_animationOriginRect.size.width;
  height = self->_animationOriginRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setAnimationOriginRect:(CGRect)a3
{
  self->_animationOriginRect = a3;
}

- (NSString)homeIdentifier
{
  return self->_homeIdentifier;
}

- (void)setHomeIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_homeIdentifier, a3);
}

- (NSString)roomIdentifier
{
  return self->_roomIdentifier;
}

- (void)setRoomIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_roomIdentifier, a3);
}

- (NSString)accessoryIdentifier
{
  return self->_accessoryIdentifier;
}

- (void)setAccessoryIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryIdentifier, a3);
}

- (unint64_t)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(unint64_t)a3
{
  self->_serviceType = a3;
}

- (NSString)homeName
{
  return self->_homeName;
}

- (void)setHomeName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)roomName
{
  return self->_roomName;
}

- (void)setRoomName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)accessoryName
{
  return self->_accessoryName;
}

- (void)setAccessoryName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSURL)defaultActionURL
{
  return self->_defaultActionURL;
}

- (void)setDefaultActionURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSSet)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
  objc_storeStrong((id *)&self->_actions, a3);
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_defaultActionURL, 0);
  objc_storeStrong((id *)&self->_accessoryName, 0);
  objc_storeStrong((id *)&self->_roomName, 0);
  objc_storeStrong((id *)&self->_homeName, 0);
  objc_storeStrong((id *)&self->_accessoryIdentifier, 0);
  objc_storeStrong((id *)&self->_roomIdentifier, 0);
  objc_storeStrong((id *)&self->_homeIdentifier, 0);
  objc_storeStrong((id *)&self->_remoteViewControllerProxy, 0);
}

@end
